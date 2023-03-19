<?php
/**
 * Fired during theme activation.
 *
 * This class defines all code necessary to run during the theme's activation.
 *
 * @since      1.0.0
 * @package    Theme_Name
 * @subpackage Theme_Name/includes
 * @author     AUTHOR-NAME <AUTHOR-EMAIL>
 */
class Theme_Name_Activator {

	/**
	 * Global Logic run while activating the theme
	 *
	 * ```
	 * Theme_Name_Activator::activate();
	 * ```
	 *
	 * @author	 AUTHOR-NAME
	 * @return void
	 */
	public static function activate() {

	}

	/**
	 * Initiate System required directories
	 * 
	 * ```
	 * Theme_Name_Activator::init_dir();
	 * ```
	 * 
	 * @link https://developer.wordpress.org/reference/functions/wp_mkdir_p/
	 * 
	 * @author AUTHOR-NAME
	 * @return void
	 */
	public static function init_dir() {
		$upload = wp_upload_dir();
		$upload_dir_base = $upload['basedir'];

		/* $upload_dir = $upload_dir_base . '/example';
		if (! is_dir($upload_dir)) {
		   mkdir( $upload_dir, 0755 );
		   $f = fopen( $upload_dir . "/.htaccess", "a+");
		   fwrite($f, "deny from all");
		   fclose($f);
		} */
	}

	/**
	 * Initiate System required cron jobs
	 * 
	 * ```
	 * Theme_Name_Activator::init_cron();
	 * ```
	 * 
	 * @link https://developer.wordpress.org/reference/functions/wp_schedule_event/
	 * 
	 * @author AUTHOR-NAME
	 * @return void
	 */
	public static function init_cron() {

	}

	/**
	 * Initiate System required roles
	 * 
	 * ```
	 * Theme_Name_Activator::init_roles();
	 * ```
	 * 
	 * @link https://developer.wordpress.org/reference/functions/add_role/
	 * @author AUTHOR-NAME
	 * @return void
	 */
	public static function init_roles() {

	}

	/**
	 * Initiate System required database tables
	 * 
	 * ```
	 * Theme_Name_Activator::init_database_tables();
	 * ```
	 * 
	 * @link https://developer.wordpress.org/reference/functions/maybe_create_table/
	 * @author AUTHOR-NAME
	 * @return void
	 */
	public static function init_database_tables(){
		global $wpdb;
		$charset_collate = $wpdb->get_charset_collate();
		require_once(ABSPATH . 'wp-admin/includes/upgrade.php');

		/* $example_table_name = $wpdb->prefix . "senpai_examples";
		$example_sql = "CREATE TABLE $example_table_name (
			id mediumint(11) NOT NULL AUTO_INCREMENT,
			data varchar(40) NOT NULL,
			PRIMARY KEY  (id)
		  ) $charset_collate;";
		maybe_create_table( $example_table_name, $example_sql ); */
	}

}
