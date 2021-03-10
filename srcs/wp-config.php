<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '^oT,[*:RsT@>)=Z}0Q!2J``!f-LK;wi?]WDDl`rv{Pk41! Mn)8rF#IC?qI8=C(B' );
define( 'SECURE_AUTH_KEY',  '1~yFrz(Fv |U+.iQ!jYE0L_k3zu:EuEO?$?)J,>+a![5CUAupsj^zbp,j3AfeaL7' );
define( 'LOGGED_IN_KEY',    'Uj&N[;HCO/PjfYX9`-lON%>4]4kS2@+GUDirtZe}PX$m>[B@E)^(6:lr+PYTTChz' );
define( 'NONCE_KEY',        '*`qm3JNj_%G_z;7V&/[:JoqP1A$l }xVgQul#n=!;=B]M Mus|ll`87x{F5`3#_/' );
define( 'AUTH_SALT',        '_(F3%a^cLk&;Od$D;(rbD]8GYe-QUd-ogmM<r-I~2c.pIv#~LSl4B43Ig5.|nNt]' );
define( 'SECURE_AUTH_SALT', 'F11(^EVq$9/+1 N)k}#+.6I<4S*?|w$k^j 8pU85#y0Zfd&gYjr5T`[h,%>+z5b/' );
define( 'LOGGED_IN_SALT',   'oAW:sCqm)Rhs<:K:Kr_gfK~ fRPwC1Fei)#+!Zxf(`|zGJN=23T=h^^8p,Sj+_Jr' );
define( 'NONCE_SALT',       's/Zl}:I~H}qZsiomhGn9M7P}9}%a6><;xcpsm?5us^.$(vQNL54mRa5M6jbC)cs0' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

