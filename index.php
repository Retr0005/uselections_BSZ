<?php

require 'vendor/autoload.php';
require 'Model/USERepository.php';

$templates = new League\Plates\Engine('templates', 'tpl');
$year = 2024;

if(isset($_GET['year'])) {
    $year = $_GET['year'];
    $el_primo = Model\StudenteRepository::getElectionResults($year);

    $jsonContents = file_get_contents("states.json");
    $jsonArray = json_decode($jsonContents, true);

    var_dump($jsonArray['dataProvider']['areas'][5]['showAsSelected']);

    foreach ($jsonArray["dataProvider"]["areas"] as $area) {
        $state_po = substr($area["id"], 3);
        foreach ($el_primo as $result) {
            if ($result[0] == $state_po) {
                $area["showAsSelected"] = ($result[1] == "DEMOCRAT") ? true : false;
                break;
            }
        }
    }
    $jsonArray['dataProvider']['areas'][5]['showAsSelected'] = false;
    var_dump($jsonArray['dataProvider']['areas'][5]['showAsSelected']);
    $us_president = "Banua Francis Carl";
// Encode the modified array back to JSON
    $updatedJsonContents = json_encode($jsonArray, JSON_PRETTY_PRINT);

    file_put_contents("states.json", $updatedJsonContents);
}


$us_president = "Banua Francis Carl";



echo $templates->render('mappa', [
    'us_president' => $us_president,
    ]);
