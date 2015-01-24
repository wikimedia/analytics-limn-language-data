<?php

$codes = array( 'ca', 'da', 'eo', 'es', 'id', 'ms', 'nn', 'no', 'pt', 'sv' );

// This sql is for all beta feature enablements
$sql1 = "select *\nfrom\n";
$first = array_shift( $codes );
$dbfirst = $first . "wiki";
$sql1 .= "( select count(*) as $dbfirst from $dbfirst.user_properties where up_property = 'cx' and up_value = 1 ) $first\nleft join\n";
$lines = array();
foreach( $codes as $code ) {
	$db = $code . "wiki";
	$lines[] .= "( select count(*) as $db from $db.user_properties where up_property = 'cx' and up_value = 1 ) $code on 1=1\n";
}
$sql1 .= implode( "left join\n", $lines ) .  ";\n";
file_put_contents( 'language/content_translation_beta.sql', $sql1 );

// This sql is for beta feature enablements that are not auto-enroll
$sql2 = "select *\nfrom\n";
$sql2 .= "( select count(*) as $dbfirst from $dbfirst.user_properties where up_property = 'cx' and up_value = 1 ";
$sql2 .= "and up_user not in ( select up_user from user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) $first\nleft join\n";
$lines = array();
foreach( $codes as $code ) {
	$db = $code . "wiki";
	$main = "( select count(*) as $db from $db.user_properties where up_property = 'cx' and up_value = 1 ";
	$sub = "and up_user not in ( select up_user from user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) $code on 1=1\n";
	$lines[] = $main . $sub;
}
$sql2 .= implode( "left join\n", $lines ) . ";\n";
file_put_contents( 'language/content_translation_beta_manual.sql', $sql2 );

