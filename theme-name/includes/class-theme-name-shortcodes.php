<?php
/**
 * The shortcodes class.
 *
 *
 * @since      1.0.0
 * @package    Theme_Name
 * @subpackage Theme_Name/includes
 * @author     AUTHOR-NAME <AUTHOR-EMAIL>
 */
class Theme_Name_ShortCodes {

    public function __construct() {

    }

    public function load_shortcodes(){

        add_shortcode( 'senpai-short-code',  array($this,'senpai_shortcode_render') );
    }


    public function senpai_shortcode_render($atts, $content = ""){
        ob_start();
        include THEME_DIR . '/public/partials/senpai-shortcode-display.php';
        $content = ob_get_clean();
        return $content;
    }
}