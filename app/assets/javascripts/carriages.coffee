# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#carriage_type').change ->
    carriage_type_div =
      'EconomyCarriage': 'economy-carriage'
      'BusinessCarriage': 'business-carriage'
      'CoupeCarriage': 'coupe-carriage'
      'SeatCarriage': 'seat-carriage'

    carriage_type = carriage_type_div[$("#carriage_type option:selected").text()]

    for _, type of carriage_type_div
      $('.' + type).hide()

    $('.' + carriage_type).toggle()

$(document).on('turbolinks:load', ready)
