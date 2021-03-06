# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('a.edit_train').click (e) ->
    e.preventDefault()
    train_id = $(this).data('trainId')
    form = $('#edit_train_' + train_id)
    number = $('#train_number_' + train_id)

    if !$(this).hasClass('cancel')
      $(this).html('Отмена')
      $(this).addClass('cancel')
    else
      $(this).html('Изменение')
      $(this).removeClass('cancel')

    form.toggle()
    number.toggle()

$(document).on('turbolinks:load', ready)
