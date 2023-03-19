<?php

/**
 * The theme bootstrap file
 *
 * This file is read by WordPress to generate the theme information in the theme
 * admin area. This file also includes all of the dependencies used by the theme,
 * registers the activation and deactivation functions, and defines a function
 * that starts the theme.
 *
 * @since      1.0.0
 * @package    Theme_Name
 * @author     AUTHOR-NAME <AUTHOR-EMAIL>
 *
 */

// If this file is called directly, abort.
if ( ! defined( 'WPINC' ) ) {die;}

/**
 * Currently theme version.
 * Start at version 1.0.0 and use SemVer - https://semver.org
 * Rename this for your theme and update it as you release new versions.
 */
define( 'THEME_NAME_VERSION', '1.0.0' );
defined( 'THEME_DIR' ) || define( 'THEME_DIR', get_template_directory() );
defined( 'THEME_URI' ) || define( 'THEME_URI', get_template_directory_uri() );


define( 'SENPAI_IS_PROD',false);

/**
 * senpai_log support
 */

 define( 'SENPAI_LOG_DAYS', 30); //number of days or -1 for keeping all files
 require THEME_DIR . '/includes/class-theme-name-error-log.php';


/**
 * Add Composer Support to the theme
 */
require THEME_DIR . '/vendor/autoload.php';

/**
 * The code that runs during theme activation.
 * This action is documented in includes/class-theme-name-activator.php
 */
function activate_theme_name() {
	require_once THEME_DIR . '/includes/class-theme-name-activator.php';
	Theme_Name_Activator::activate();
	Theme_Name_Activator::init_dir();
	Theme_Name_Activator::init_cron();
	Theme_Name_Activator::init_roles();
	Theme_Name_Activator::init_database_tables();
}

/**
 * The code that runs during theme deactivation.
 * This action is documented in includes/class-theme-name-deactivator.php
 */
function deactivate_theme_name() {
	require_once THEME_DIR . '/includes/class-theme-name-deactivator.php';
	Theme_Name_Deactivator::deactivate();
}

add_action('after_switch_theme', 'activate_theme_name');
add_action('switch_theme', 'deactivate_theme_name');

/**
 * The core theme class that is used to define internationalization,
 * admin-specific hooks, and public-facing site hooks.
 */
require THEME_DIR . '/includes/class-theme-name.php';

/**
 * Begins execution of the theme.
 *
 * Since everything within the theme is registered via hooks,
 * then kicking off the theme from this point in the file does
 * not affect the page life cycle.
 *
 * @since    1.0.0
 */
function run_theme_name() {

	$theme = new Theme_Name();
	$theme->run();

}
run_theme_name();

