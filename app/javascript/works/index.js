// import $ from "jquery";

$(document).ready(function () {
  $(".btn").on("click", function () {
    let imgLink = $("#input").val();
    $("#img-container").append(`<img src="${imgLink}">`);
    console.log(imgLink);
  });
});
