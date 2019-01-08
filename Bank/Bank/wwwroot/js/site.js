﻿
var prefix = "Hell's bank: ";
var title = document.title.substring(prefix.length, document.title.length);
document.getElementById(title).className = "active";


function selectRoleChanged() {
    var e = document.getElementById("Role");
    var role = e.options[e.selectedIndex].text;
    if (role === "Admin") {
        document.getElementById("acc").style.visibility = 'hidden';
    }
    else {
        document.getElementById("acc").style.visibility = 'visible';
    }
}

function selectBankCode() {
    var e = document.getElementById("BankCode");
    var code = e.options[e.selectedIndex].value;
    document.getElementById("DestBank").value = code;
}

function selectTemplate() {
    var e = document.getElementById("TemplateSelect");
    var temp = e.options[e.selectedIndex].value;
    document.getElementById("TemplateBtn").href = "/Payment/PaymentTemplate/" + temp;
}

function myMap() {
    var myCenter = new google.maps.LatLng(49.7430022, 13.3712127);
    var mapCanvas = document.getElementById("map");
    var mapOptions = { center: myCenter, zoom: 16 };
    var map = new google.maps.Map(mapCanvas, mapOptions);
    var marker = new google.maps.Marker({ position: myCenter, animation: google.maps.Animation.BOUNCE });
    marker.setMap(map);
}