<?php
/**
 * The public-facing functionality of the theme.
 *
 * Defines the theme name, version, and two examples hooks for how to
 * enqueue the public-facing stylesheet and JavaScript.
 *
 * @package    Theme_Name
 * @subpackage Theme_Name/public
 * @author     Your Name <AUTHOR-EMAIL>
 */
class Theme_Name_Public {

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
	 * @param      string    $theme_name       The name of the theme.
	 * @param      string    $version    The version of this theme.
	 */
	public function __construct( $theme_name, $version ) {

		$this->theme_name = $theme_name;
		$this->version = $version;

	}

	/**
	 * Register the stylesheets for the public-facing side of the site.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_styles() {

		wp_enqueue_style( 'theme_name_public_loader_css', THEME_URI . '/public/dist/main/theme-name-loader.css', array(), $this->version, 'all' );

	}

	/**
	 * Register the JavaScript for the public-facing side of the site.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_scripts() {

		wp_enqueue_script( 'theme_name_public_loader_js', THEME_URI . '/public/dist/main/theme-name-loader.js', array('wp-i18n'), $this->version, false );
		wp_enqueue_script( 'theme_name_public_js', THEME_URI . '/public/dist/main/theme-name-public.js', array('theme_name_public_loader_js'), $this->version, false );
		wp_localize_script( 'theme_name_public_js', 'theme_name_public_params', array(
			'ajaxurl' => site_url() . '/wp-admin/admin-ajax.php',
			'nonce' => wp_create_nonce('senpai-ajax-public-nonce'),
		) );

	}

}
