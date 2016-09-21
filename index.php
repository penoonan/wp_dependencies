<?php
require_once 'vendor/autoload.php';

$container = new \pnoLeague\Container\Container();
$client = new \pnoGuzzleHttp\Client();
$carbon = \pnoCarbon\pnoCarbon::now();
$engine = new \pnoLeague\Plates\Engine();

// we are loading google just to give ourselves a head start
$google = $client->get('http://www.google.com');

// dang though where are all those beautiful golden google assets???
echo $google->getBody()->getContents();

die();