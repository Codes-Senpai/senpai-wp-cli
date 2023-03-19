<?php
/**
 * The widgets class.
 *
 *
 * @since      1.0.0
 * @package    Theme_Name
 * @subpackage Theme_Name/includes
 * @author     AUTHOR-NAME <AUTHOR-EMAIL>
 */
class Theme_Name_Widgets {

    public function __construct() {

    }

    public function load_widgets(){
            // Remove all Dashboard widgets.
            //global $wp_meta_boxes;
            //unset( $wp_meta_boxes['dashboard'] );
        
            // Add custom dashbboard widget.
            add_meta_box( 'dashboard_widget_senpai',
            __( 'Info', 'theme-name' ),
            array($this,'render_info_widget'),
            'dashboard',
            'column3',  // $context: 'advanced', 'normal', 'side', 'column3', 'column4'
            'high'     // $priority: 'high', 'core', 'default', 'low'
        );
    }
    
    public function render_info_widget(){
        $now = current_time( 'mysql' );
        include THEME_DIR . '/admin/partials/theme-name-info-widget-display.php';
    }
}