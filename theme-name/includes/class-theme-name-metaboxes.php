<?php
/**
 * The MetaBoxes class.
 *
 *
 * @since      1.0.0
 * @package    Theme_Name
 * @subpackage Theme_Name/includes
 * @author     AUTHOR-NAME <AUTHOR-EMAIL>
 */
class Theme_Name_MetaBoxes {

    private $prefix;

    public function __construct($prefix = 'senpai_metabox_') {
        $this->prefix = $prefix;
    }

    public function register_metaboxes(){
        /**
         * @see https://developer.wordpress.org/reference/functions/add_meta_box/
         */
        $screens = array('page' );
        add_meta_box(
            $this->prefix . 'test',
            __( 'Test', 'theme-name' ),
            array($this,'test_meta_box_render'),
            $screens
        );
    }

    public function test_meta_box_render( $post ){

        include THEME_DIR . '/admin/partials/senpai-metabox-display.php';
    }


}