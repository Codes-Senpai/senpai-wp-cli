<?php
/**
 * Define the internationalization functionality.
 *
 * Loads and defines the internationalization files for this theme
 * so that it is ready for translation.
 *
 * @since      1.0.0
 * @package    Theme_Name
 * @subpackage Theme_Name/includes
 * @author     AUTHOR-NAME <AUTHOR-EMAIL>
 */
class Theme_Name_i18n {


	/**
	 * Load the theme text domain for translation.
	 *
	 * @since    1.0.0
	 */
	public function load_theme_textdomain() {

		load_theme_textdomain(
			'theme-name',
			false,
			THEME_DIR . '/languages/'
		);

	}



}
