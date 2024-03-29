<!DOCTYPE html>
<html>
<head>
  <script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.noStyle.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/dist/styles/ag-grid.css">
  <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/dist/styles/ag-theme-balham.css">
</head>
<body>
  <h1>Hello from ag-grid!</h1>

  <div id="myGrid" style="height: 600px;width:500px;" class="ag-theme-balham"></div>

  <script type="text/javascript" charset="utf-8">
    // specify the columns
    var columnDefs = [
    {headerName: "Make", field: "make", sortable: true, filter: true },
    {headerName: "Model", field: "model", sortable: true, filter: true },
    {headerName: "Price", field: "price", sortable: true, filter: true }
   ];

    // specify the data
    var rowData = [
      {make: "Toyota", model: "Celica", price: 35000},
      {make: "Ford", model: "Mondeo", price: 32000},
      {make: "Porsche", model: "Boxter", price: 72000}
    ];

    // let the grid know which columns and what data to use
    var gridOptions = {
      columnDefs: columnDefs,
      rowData: rowData
    };

  // lookup the container we want the Grid to use
  var eGridDiv = document.querySelector('#myGrid');

  // create the grid passing in the div to use together with the columns & data we want to use
  new agGrid.Grid(eGridDiv, gridOptions);

  </script>
</body>
</html>