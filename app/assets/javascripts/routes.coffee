# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('a.edit_route').click (e) ->
    e.preventDefault()
    route_id = $(this).data('routeId')
    form = $('#edit_route_' + route_id)
    name = $('#route_name_' + route_id)

    if !$(this).hasClass('cancel')
      $(this).html('Отмена')
      $(this).addClass('cancel')
    else
      $(this).html('Изменение')
      $(this).removeClass('cancel')

    form.toggle()
    name.toggle()

$(document).on('turbolinks:load', ready)
