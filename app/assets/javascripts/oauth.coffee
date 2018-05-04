# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


onSignIn = (googleUser) ->
    id_token = googleUser.getAuthResponse().id_token
    document.getElementById("tokenInput").value = id_token;
    document.getElementById("processAuth").submit();
    
obj = this
obj.onSignIn = onSignIn