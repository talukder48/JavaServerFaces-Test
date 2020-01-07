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
    {headerName: "Country", field: "country", width: 120, rowGroupIndex: 0},
    {headerName: "Sport", field: "sport", width: 110, rowGroupIndex: 1},
    {headerName: "Age", field: "age", width: 90, aggFunc: 'sum'},
    {headerName: "Year", field: "year", width: 90},
    {headerName: "Date", field: "date", width: 110},
    {headerName: "Gold", field: "gold", width: 100, aggFunc: 'sum'},
    {headerName: "Silver", field: "silver", width: 100, aggFunc: 'sum'},
    {headerName: "Bronze", field: "bronze", width: 100, aggFunc: 'sum'},
    {headerName: "Total", field: "total", width: 100, aggFunc: 'sum'}
];

var gridOptions = {
    defaultColDef: {
        filter: true
    },
    columnDefs: columnDefs,
    rowData: null,
    rowSelection: 'multiple',
    groupSelectsChildren: true,
    groupSelectsFiltered: true,
    suppressAggFuncInHeader: true,
    suppressRowClickSelection: true,
     autoGroupColumnDef: {headerName: "Athlete", field: "athlete", width: 200,
        cellRenderer:'agGroupCellRenderer',
        cellRendererParams: {
            checkbox: true
        }
    }
};

function filterSwimming() {
    gridOptions.api.setFilterModel({
        sport: {
            type: 'set',
            values: ['Swimming']
        }
    });
}


function ages16And20() {
    gridOptions.api.setFilterModel({
        age: {
            type: 'set',
            values: ['16','20']
        }
    });
}

function clearFilter() {
    gridOptions.api.setFilterModel(null);
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

<script src='https://unpkg.com/@ag-grid-enterprise/all-modules@22.1.2/dist/ag-grid-enterprise.min.js'></script></head>
<body>

<div style="margin-bottom: 5px;">
    <button onclick="filterSwimming()">Filter Only Swimming</button>
    <button onclick="ages16And20()">Filter Only ages 16 and 20</button>
    <button onclick="clearFilter()" style="margin-left: 10px;">Clear Filter</button>
</div>
<div style="height: calc(100% - 25px);">
    <div id="myGrid" style="height: 100%;" class="ag-theme-balham"></div>
</div>

</body>
</html>