<?php
/**
 * App Layout: layouts/app.php
 *
 * The main template file.
 *
 * This is the template that is used for displaying:
 * - posts
 * - single posts
 * - archive pages
 * - search results pages
 *
 * @link    https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WPEmergeTheme
 */

?>

<?php
    $query = new WP_Query([
                              'post_type'      => 'post',
                              'post_status'    => 'publish',
                              'posts_per_page' => '12',
                          ])
?>

<?php if($query->have_posts()) : ?>
    <?php while($query->have_posts()) : $query->the_post(); ?>
        <?php get_template_part('loop_templates/loop_post'); ?>
    <?php endwhile; ?>
    <?php wp_reset_postdata() ?>
    <?php wp_reset_query() ?>
<?php endif; ?>

<?php thePhoneNumberFixedButton(); ?>