
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
