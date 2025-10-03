<?php

namespace App\PostTypes;

use Carbon_Fields\Container\Container;
use Carbon_Fields\Field;
use mms\Abstracts\AbstractPostType;

class project extends \App\Abstracts\AbstractPostType
{

    public function __construct() {
        $this->showThumbnailOnList = true;
        $this->supports            = [
            'title',
            'editor',
            'thumbnail',
            'page-attributes',
        ];

        $this->menuIcon         = 'dashicons-admin-site-alt3'; //https://developer.wordpress.org/resource/dashicons/
        // $this->menuIcon = get_template_directory_uri() . '/images/custom-icon.png';
        $this->post_type        = 'project';
        $this->singularName     = $this->pluralName = __('Project', 'mms'); 
        $this->titlePlaceHolder = __('Project', 'mms');
        $this->slug             = 'project';
        parent::__construct();
    }
}
