<?php

$dir = __DIR__;
$input = $argv[1];
require_once( "$dir/base/ReportInterface.php" );
$config = json_decode( file_get_contents( "$dir/config/config.json" ), true );

try {
	if ( !$config ) {
		throw new Exception( "Configuration file is missing or unreadable", 1 );
	}
	if ( file_exists( $input ) && is_readable( $input ) ) {
		$reportFile = new SplFileInfo( $input );
		require_once $reportFile->getRealPath();

		// get the class name from the file name.
		$class = substr(
			$reportFile->getFilename(),
			0,
			strpos( $reportFile->getFilename(), '.' . $reportFile->getExtension() )
		);
		if ( !class_exists( $class ) ) {
			throw new Exception( "Report class $class not defined", 1 );
		}
		$report = new $class();
		$output = $report->run( $config );
		echo $output;
	} else {
		throw new Exception( "Could not load file $input", 1 );
	}
} catch ( Exception $e ) {
	echo $e->getMessage()."\n";
}
