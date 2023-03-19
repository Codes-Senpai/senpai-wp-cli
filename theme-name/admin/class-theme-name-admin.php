<?php
/**
 * The admin-specific functionality of the theme.
 *
 * Defines the theme name, version, and two examples hooks for how to
 * enqueue the admin-specific stylesheet and JavaScript.
 *
 * @package    Theme_Name
 * @subpackage Theme_Name/admin
 * @author     AUTHOR-NAME <AUTHOR-EMAIL>
 */
class Theme_Name_Admin {

	/**
	 * The ID of this theme.
	 *
	 * @since    1.0.0
	 * @access   private
	 * @var      string    $theme_name    The ID of this theme.
	 */
	private $theme_name;

	/**
	 * The version of this theme.
	 *
	 * @since    1.0.0
	 * @access   private
	 * @var      string    $version    The current version of this theme.
	 */
	private $version;

	/**
	 * Initialize the class and set its properties.
	 *
	 * @since    1.0.0
	 * @param      string    $theme_name       The name of this theme.
	 * @param      string    $version    The version of this theme.
	 */
	public function __construct( $theme_name, $version ) {

		$this->theme_name = $theme_name;
		$this->version = $version;

	}

	/**
	 * Register the stylesheets for the admin area.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_styles() {

		wp_enqueue_style( 'theme_name_admin_loader_css', THEME_URI . '/admin/dist/main/theme-name-loader.css', array(), $this->version, 'all' );

	}

	/**
	 * Register the JavaScript for the admin area.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_scripts() {

		wp_enqueue_script( 'theme_name_admin_loader_js', THEME_URI . '/admin/dist/main/theme-name-loader.js', array('wp-i18n','jquery'), $this->version, false );
		wp_enqueue_script( 'theme_name_admin_setting_js', THEME_URI . '/admin/dist/main/theme-name-setting.js', array('theme_name_admin_loader_js'), $this->version, false );
	
		wp_enqueue_script( 'senpai_notice_ajax', THEME_URI . '/admin/dist/main/theme-name-notice.js', array('theme_name_admin_loader_js') );
		wp_localize_script( 'senpai_notice_ajax', 'senpai_notice_ajax_params', array(
			'ajaxurl' => site_url() . '/wp-admin/admin-ajax.php',
			'nonce' => wp_create_nonce('senpai-ajax-notice-nonce')
		) );
	
	}

}
