$ ->
  $(@).on 'mouseover', '.btn-unfollow', ->
    $(@).removeClass('btn-success').addClass('btn-danger').val('フォロー解除')
  $(@).on 'mouseout', '.btn-unfollow', ->
    $(@).removeClass('btn-danger').addClass('btn-success').val('フォロー中')
