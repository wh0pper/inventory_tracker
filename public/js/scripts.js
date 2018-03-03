function pieChart(info, my_data) {
 // Load the Visualization API and the corechart package.
 google.charts.load('current', {'packages':['corechart']});

 // Set a callback to run when the Google Visualization API is loaded.
 google.charts.setOnLoadCallback(drawChart);

 // Callback that creates and populates a data table,
 // instantiates the pie chart, passes in the data and
 // draws it.
 function drawChart() {

   // Create the data table.
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Shoe name');
   data.addColumn('number', 'Inventory');
   for (i=0; i<info.length; i++) {
     data.addRows([
       [info[i].name, my_data[i].inventory],
     ]);
   }

   // Set chart options
   var options = {title: 'Inventory distribution at this store',
                  titleTextStyle: {color: 'whitesmoke', fontSize: 24},
                  legend: {textStyle: {color: 'whitesmoke', fontSize: 18}},
                  width: 900,
                  height: 700,
                  backgroundColor: 'transparent',
                  colors: ['#0c0d0f', '#f2e2cd', '#31373c', '#f6d9d5', '#777c81','#a69eb0', '#ebeced']
                };

   // Instantiate and draw our chart, passing in some options.
   var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
   chart.draw(data, options);
 }
}

 

$(function() {
  $('#show_add_store').click(function() {
    $('#add_store').slideDown();
    $('#show_add_store').hide();
  })

  $('#show_add_shoe').click(function() {
    $('#add_shoe').slideDown();
    $('#show_add_shoe').hide();
  })

  $('#hide_add_store').click(function() {
    $('#add_store').hide();
    $('#show_add_store').show();
  })

  $('#hide_add_shoe').click(function() {
    $('#add_shoe').hide();
    $('#show_add_shoe').show();
  })

  $('#edit_store_button').click(function() {
    $('#edit_store_form').toggle();
  })

  $('#edit_shoe_button').click(function() {
    $('#edit_shoe_form').toggle();
  })
})
