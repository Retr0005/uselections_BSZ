<script src="https://www.amcharts.com/lib/3/ammap.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/maps/js/usaHigh.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js" type="text/javascript"></script>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>


    <style>
        .center {
            display: flex;
            justify-content: center;
        }

        .left {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-left: 20px;
        }

        .right {
            margin-left: 20px;
        }

        .info {
            background-color: lightgray;
            padding: 20px;
        }




    </style>
</head>
<body>

<div class="center">
    <div class="left">

        <div id="mapdiv" style="width: 1000px; height: 450px;">Contenuto mappa</div>

        <form method="get" action="index.php">
            <label for="yearSelect">Choose a year</label>
            <select name="year" id="yearSelect">
                <?php
                $currentYear = date("Y");
                $startYear = 1976;
                for ($year = $startYear; $year <= $currentYear; $year += 4) {
                    echo "<option value='$year'>$year</option>";
                }
                ?>
            </select>
            <input type="submit" value="Submit">
        </form>
    </div>


    <div class="right">
        <div class="info">
            <h2>President: <?php echo $us_president; ?></h2>


        </div>
    </div>
</div>






</body>
</html>

<script type="text/javascript">
    var mapData = null;

    // Fetch data from JSON file
    fetch('states.json')
        .then(response => response.json())
        .then(data => {
            mapData = data;
            createMap();
        })
        .catch(error => {
            console.error('Error loading map data:', error);
        });

    function createMap() {
        if (mapData) {
            var map = AmCharts.makeChart("mapdiv", mapData);
        }
    }

    function blue_or_red() {

    }
</script>