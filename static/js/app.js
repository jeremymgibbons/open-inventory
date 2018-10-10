$(document).ready(function() {
    app = application()
    app = app.init();
});

application = function() {
    var div = document.getElementById("appContainer")
    var aliases = {};

    this.init = function() {
      this.initAliasList(null)
    };

    this.initAliasList = function(data) {
        var div = document.getElementById("aliasMenu")
        div.innerHTML=``
        if(data) {
           data.forEach(element => {
               
           });
        }
        div.innerHTML += `<li class="nav-item"><a class="nav-link" onclick="on()">Create</a></li>`
    };

    return this
}

function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}

function createAlias() {
    var Data = $("aliasCreateForm").serializeArray()
    $.ajax({
        type: 'POST',
        url: '/aliases',
        data: Data,
        success: function(data) { alert('data: ' + data); },
        contentType: "application/json",
        dataType: 'json'
    });
    console.log("Worked")
 }