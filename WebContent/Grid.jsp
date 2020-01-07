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
    {headerName: "Athlete", field: "athlete"},
    {headerName: "Age", field: "age"},
    {headerName: "Country", field: "country"},
    {headerName: "Year", field: "year"},
    {headerName: "Date", field: "date"},
    {headerName: "Sport", field: "sport"},
    {headerName: "Gold", field: "gold"},
    {headerName: "Silver", field: "silver"},
    {headerName: "Bronze", field: "bronze"},
    {headerName: "Total", field: "total"}
];

var gridOptions = {
    defaultColDef: {
        width: 100,
        headerCheckboxSelection: isFirstColumn,
        checkboxSelection: isFirstColumn,
        resizable: true
    },
    suppressRowClickSelection: true,
    rowSelection: 'multiple',
    columnDefs: columnDefs
};

function isFirstColumn(params) {
    var displayedColumns = params.columnApi.getAllDisplayedColumns();
    var thisIsFirstColumn = displayedColumns[0] === params.column;
    return thisIsFirstColumn;
}


function onQuickFilterChanged() {
    gridOptions.api.setQuickFilter(document.getElementById('quickFilter').value);
}

// setup the grid after the page has finished loading
document.addEventListener('DOMContentLoaded', function() {
    var gridDiv = document.querySelector('#myGrid');
    new agGrid.Grid(gridDiv, gridOptions);

    // do http request to get our sample data - not using any framework to keep the example self contained.
    // you will probably use a framework like JQuery, Angular or something else to do your HTTP calls.
    var httpRequest = new XMLHttpRequest();
    httpRequest.open('GET', 'https://raw.githubusercontent.com/ag-grid/ag-grid/master/packages/ag-grid-docs/src/olympicWinnersSmall.json');
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

<div style="margin-bottom: 5px;">
    <input type="text" oninput="onQuickFilterChanged()" id="quickFilter" placeholder="quick filter..."/>
</div>
<div style="height: calc(100% - 25px);">
    <div id="myGrid" class="ag-theme-balham" style="height: 100%;"></div>
</div>

</body>
</html>