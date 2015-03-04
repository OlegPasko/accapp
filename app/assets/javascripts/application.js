// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var ready;

function transactionTrHover() {
  $('#transactions tr').hover(
    function () {
      $(this).find('.remove_btn').show();
    }, function () {
      $(this).find('.remove_btn').hide();
    }
  );
}

function refreshTable() {
  var dtSum = 0,
    ktSum = 0,
    monthSum = 0;
  $('tr[data-id]').each(function () {
    dtSum += parseInt($(this).data('dt'));
    ktSum += parseInt($(this).data('kt'));
    monthSum = dtSum + ktSum;
    if ($(this).next().data() == undefined || ($(this).next().data('month-name') && $(this).next().data('month-name') != $(this).data('month-name'))) {
      $(this).after('<tr class="warning"><td><b>' + $(this).data('month-name') +
      '</b></td><td><span class="grey">' + dtSum + '</span>' +
      '</td><td><span class="grey">' + ktSum + '</span></td><td><b>' + monthSum + '</b></td><td></td><td></td></tr>');
      dtSum = 0;
      ktSum = 0;
      monthSum = 0; // drop values
    }
  });
}

ready = function () {
  $('input[type=date]').each(function() {
    this.valueAsDate = new Date();
  });
  transactionTrHover();
  $('.remove_btn').click(function () {
    $(this).parent().parent().removeClass('success').addClass('danger');
  });
  refreshTable();
};

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on("page:change", ready);