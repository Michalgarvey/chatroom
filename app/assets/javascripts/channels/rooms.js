App.rooms = App.cable.subscriptions.create("RoomsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server

  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();
    $('.rooms-messages').prepend(data.message);
  },

  listen_to_messages: function() {
    return this.perfom('listen', {
      rooms_id: $("[data-rooms-id]").data("rooms-id")
    });
  }

});

$(document).on('turbolinks:load', function() {
  App.rooms.listen_to_messages();
});
