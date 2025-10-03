// File: chatgpt-translate.js
// Hiển thị nút dịch bài viết với ChatGPT cho cả Classic Editor và Gutenberg

(function($){
    // Classic Editor: Thêm nút dưới tiêu đề
    $(document).ready(function() {
        if ($('#titlewrap').length && !$('#mooms-chatgpt-translate-wrap').length) {
            $('#titlewrap').after('<div id="mooms-chatgpt-translate-wrap" style="margin:16px 0;"><button type="button" class="button button-primary" id="mooms-chatgpt-translate-btn">Dịch với ChatGPT (tất cả ngôn ngữ)</button><span id="mooms-chatgpt-translate-status" style="margin-left:10px;"></span></div>');
        }
    });

    // Xử lý sự kiện click cho cả 2 editor
    $(document).on('click', '#mooms-chatgpt-translate-btn', async function() {
        const $btn = $(this);
        const $status = $('#mooms-chatgpt-translate-status');
        $btn.prop('disabled', true);
        $status.text('Đang lấy dữ liệu bài viết...');

        let postTitle = '';
        let postContent = '';
        let customFields = {};
        let currentLang = (window.Polylang && Polylang.current_lang) ? Polylang.current_lang : '';
        // Gutenberg
        if (window.wp && wp.data) {
            try {
                postTitle = wp.data.select('core/editor').getEditedPostAttribute('title');
                postContent = wp.data.select('core/editor').getEditedPostAttribute('content');
                const meta = wp.data.select('core/editor').getEditedPostAttribute('meta');
                if (meta) customFields = meta;
            } catch (e) {}
        }
        // Classic Editor
        if (!postTitle) postTitle = $('#title').val() || '';
        if (!postContent) postContent = typeof tinyMCE !== 'undefined' && tinyMCE.activeEditor ? tinyMCE.activeEditor.getContent() : ($('#content').val() || '');

        $status.text('Đang gửi yêu cầu dịch...');
        $.ajax({
            url: moomsChatGPT.ajax_url,
            type: 'POST',
            dataType: 'json',
            data: {
                action: 'mooms_chatgpt_translate_post',
                nonce: moomsChatGPT.nonce,
                post_id: moomsChatGPT.post_id,
                title: postTitle,
                content: postContent,
                custom_fields: customFields,
                target_lang: currentLang
            },
            success: function(res) {
                if (res.success) {
                    $status.text('Dịch thành công! Đang chèn nội dung...');
                    if (res.data && res.data.translation) {
                        const t = res.data.translation;
                        // Gutenberg: tự động điền nếu đang ở ngôn ngữ đó
                        if (window.wp && wp.data) {
                            wp.data.dispatch('core/editor').editPost({
                                title: t.title,
                                content: t.content,
                                meta: t.custom_fields
                            });
                        }
                        // Classic Editor: tự động điền
                        if (!window.wp) {
                            $('#title').val(t.title);
                            if (typeof tinyMCE !== 'undefined' && tinyMCE.activeEditor) {
                                tinyMCE.activeEditor.setContent(t.content);
                            } else {
                                $('#content').val(t.content);
                            }
                        }
                        $status.text('Đã chèn nội dung dịch cho ngôn ngữ hiện tại.');
                    } else {
                        $status.text('Không nhận được dữ liệu dịch.');
                    }
                } else {
                    $status.text('Lỗi: ' + (res.data && res.data.message ? res.data.message : 'Không xác định.'));
                }
                $btn.prop('disabled', false);
            },
            error: function(xhr) {
                $status.text('Lỗi kết nối server.');
                $btn.prop('disabled', false);
            }
        });
    });

    // Gutenberg: Thêm nút vào thanh công cụ bằng React
    if (window.wp && wp.plugins && wp.editPost && wp.element) {
        const { registerPlugin } = wp.plugins;
        const { PluginPostStatusInfo } = wp.editPost;
        const { Fragment, useState } = wp.element;
        const { withSelect } = wp.data;

        const ChatGPTTranslateButton = withSelect( select => {
            return {
                postTitle: select('core/editor').getEditedPostAttribute('title'),
                postContent: select('core/editor').getEditedPostAttribute('content'),
                meta: select('core/editor').getEditedPostAttribute('meta'),
            };
        } )(( { postTitle, postContent, meta } ) => {
            const [status, setStatus] = useState('');
            const handleClick = () => {
                $('#mooms-chatgpt-translate-btn').trigger('click');
            };
            return (
                <Fragment>
                    <button type="button" className="button button-primary" id="mooms-chatgpt-translate-btn" onClick={handleClick} style={{marginTop:'10px'}}>Dịch với ChatGPT (tất cả ngôn ngữ)</button>
                    <span id="mooms-chatgpt-translate-status" style={{marginLeft:'10px'}}>{status}</span>
                </Fragment>
            );
        });

        registerPlugin('mooms-chatgpt-translate', {
            render: function() {
                return <PluginPostStatusInfo><ChatGPTTranslateButton /></PluginPostStatusInfo>;
            },
        });
    }

    // Gutenberg: Thêm nút vào thanh header (toolbar)
    if (window.wp && wp.plugins && wp.editPost && wp.element) {
        const { registerPlugin } = wp.plugins;
        const { PluginToolbar } = wp.editPost;
        const { Fragment } = wp.element;
        const { dispatch } = wp.data;

        const ChatGPTToolbarButton = () => (
            <PluginToolbar>
                <button
                    className="components-button is-primary"
                    id="mooms-chatgpt-translate-btn"
                    type="button"
                    style={{ marginLeft: '8px' }}
                    onClick={() => {
                        // Kích hoạt sự kiện click jQuery để dùng lại logic cũ
                        if (window.jQuery) window.jQuery('#mooms-chatgpt-translate-btn').trigger('click');
                    }}
                >
                    Dịch với ChatGPT
                </button>
                <span id="mooms-chatgpt-translate-status" style={{marginLeft:'10px'}}></span>
            </PluginToolbar>
        );

        registerPlugin('mooms-chatgpt-toolbar', {
            render: ChatGPTToolbarButton,
            icon: null,
        });
    }
})(jQuery); 