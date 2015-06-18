$(document).ready(function () {

  jQuery(function () {
    return $.ajax({
      url: 'https://apis.google.com/js/client:plus.js?onload=gpAsyncInit',
      dataType: 'script',
      cache: true
    });
  });

  window.gpAsyncInit = function () {
    $('.googleplus-login').click(function (e) {
      e.preventDefault();
      gapi.auth.authorize({
        immediate: true,
        response_type: 'code',
        cookie_policy: 'single_host_origin',
        client_id: '193450744333-ui6gtp7nrl3pq981d7uo71qeemga9to7.apps.googleusercontent.com',
        scope: 'email profile'
      }, function (response) {
        console.log(response);
        if (response && !response.error) {
          window.location = '/auth/google_oauth2/'


          //This we have to call from our server side app
          // google authentication succeed, now post data to server and handle data securely
          jQuery.ajax({type: 'POST', url: "/auth/google_oauth2/", dataType: 'json', data: response,
            success: function (json) {
              // response from server
            }
          });
        } else {
          // google authentication failed
        }
      });
    });
  };
  });
