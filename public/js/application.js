$(document).ready(function() {

  // AJAX to serialize form and submit Answer
  $('form#question').submit(function(event) {
    event.preventDefault();
    var input = $(this).serialize();

    // Returns Data from AJAX post and replaces Container contents
    $.post('/answer', input, function(data) {
      $('.container').html(data);

      // Sets computer to sleep for 2 seconds before...
      window.setTimeout(function() {

        // Auto submits next_question form
        $(document.next_question).submit();
      }, 2000);

    });

  });

});