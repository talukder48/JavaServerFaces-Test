<!DOCTYPE html>
<html lang="en">
<head>
<script> var __basePath = ''; </script>
<style media="only screen">
    html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        box-sizing: border-box;
        -webkit-overflow-scrolling: touch;
    }
    html {
        position: absolute;
        top: 0;
        left: 0;
        padding: 0;
        overflow: auto;
    }
    body {
        padding: 1rem;
        overflow: auto;
    }
</style>
<script type="text/javascript">

var columnDefs = [
    {headerName: "Athlete", field: "athlete", width: 150},
    {headerName: "Age", field: "age", width: 90, filter: 'agNumberColumnFilter'},
    {headerName: "Country", field: "country", width: 120},
    {headerName: "Year", field: "year", width: 90},
    {headerName: "Date", field: "date", width: 145, filter:'agDateColumnFilter', filterParams:{
        comparator:function (filterLocalDateAtMidnight, cellValue){
            var dateAsString = cellValue;
            if (dateAsString == null) return -1;
            var dateParts  = dateAsString.split("/");
            var cellDate = new Date(Number(dateParts[2]), Number(dateParts[1]) - 1, Number(dateParts[0]));

            if (filterLocalDateAtMidnight.getTime() == cellDate.getTime()) {
                return 0
            }

            if (cellDate < filterLocalDateAtMidnight) {
                return -1;
            }

            if (cellDate > filterLocalDateAtMidnight) {
                return 1;
            }
        },
        browserDatePicker: true
    }},
    {headerName: "Sport", field: "sport", width: 110},
    {headerName: "Gold", field: "gold", width: 100, filter: 'agNumberColumnFilter'},
    {headerName: "Silver", field: "silver", width: 100, filter: 'agNumberColumnFilter'},
    {headerName: "Bronze", field: "bronze", width: 100, filter: 'agNumberColumnFilter'},
    {headerName: "Total", field: "total", width: 100, filter: false}
];

var gridOptions = {
    defaultColDef: {
        filter: true
    },
    columnDefs: columnDefs,
    rowData: null
};

// setup the grid after the page has finished loading
document.addEventListener('DOMContentLoaded', function() {
    var gridDiv = document.querySelector('#myGrid');
    new agGrid.Grid(gridDiv, gridOptions);

    // do http request to get our sample data - not using any framework to keep the example self contained.
    // you will probably use a framework like JQuery, Angular or something else to do your HTTP calls.
    var httpRequest = new XMLHttpRequest();
    httpRequest.open('GET', 'https://raw.githubusercontent.com/ag-grid/ag-grid/master/packages/ag-grid-docs/src/olympicWinners.json');
    httpRequest.send();
    httpRequest.onreadystatechange = function() {
        if (httpRequest.readyState === 4 && httpRequest.status === 200) {
            var httpResult = JSON.parse(httpRequest.responseText);
            gridOptions.api.setRowData(httpResult);
        }
    };
});
</script>
<script src='https://unpkg.com/@ag-grid-community/all-modules@22.1.1/dist/ag-grid-community.min.js'></script></head>
<body>

<div id="myGrid" class="ag-theme-balham" style="height: 100%;"></div>

</body>
</html>