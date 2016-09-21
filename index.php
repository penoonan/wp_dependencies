<?php

$s = microtime();

require_once 'vendor/autoload.php';

$container = new \ArcstoneLeague\Container\Container();
echo \ArcstoneCarbon\ArcstoneCarbon::now()->dayOfWeek;
$client = new \ArcstoneGuzzleHttp\Client();
$engine = new \ArcstoneLeague\Plates\Engine();

// we are loading google just to give ourselves a head start
$google = $client->get('http://www.google.com');

// dang though where are all those beautiful golden google assets???
echo $google->getBody()->getContents();

die();