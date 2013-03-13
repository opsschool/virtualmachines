<?php

$link = mysql_connect('localhost', 'root', 'Foobarbaz');
if (!$link) {
    die('Something went wrong. Better fix it!');
}

# If everything went well, tell the user to show this to avleen

$uptime = strtok( exec( "cat /proc/uptime" ), "." );
$days = sprintf( "%2d", ($uptime/(3600*24)) );
$hours = sprintf( "%2d", ( ($uptime % (3600*24)) / 3600) );
$min = sprintf( "%2d", ($uptime % (3600*24) % 3600) / 60 );
$sec = sprintf( "%2d", ($uptime % (3600*24) % 3600) % 60 );
print "Congratulations, you finished the test in {$days} days, {$hours} hours, {$min} minutes, {$sec} seconds. Tell Avleen!";

?>
