$(function(){"use strict";$(".menu-toggle").on("click",function(){$(".sidebar").toggleClass("open")}),$(".sidebar-mini-btn").on("click",function(){$(".sidebar").toggleClass("sidebar-mini")}),setTimeout(function(){$(".page-loader-wrapper").fadeOut()},50);var t="div.card";if($('[data-toggle="tooltip"]').tooltip(),$('[data-toggle="popover"]').popover({html:!0}),$('[data-toggle="card-remove"]').on("click",function(e){return $(this).closest(t).remove(),e.preventDefault(),!1}),$('[data-toggle="card-collapse"]').on("click",function(e){return $(this).closest(t).toggleClass("card-collapsed"),e.preventDefault(),!1}),$('[data-toggle="card-fullscreen"]').on("click",function(e){return $(this).closest(t).toggleClass("card-fullscreen").removeClass("card-collapsed"),e.preventDefault(),!1}),$("[data-sparkline]").length){require(["sparkline"],function(){$("[data-sparkline]").each(function(){var e,t,a,i=$(this);e=i,t=JSON.parse(i.attr("data-sparkline")),a={color:i.attr("data-sparkline-color")},e.sparkline(t,{type:e.attr("data-sparkline-type"),height:"100%",barColor:a.color,lineColor:a.color,fillColor:"transparent",spotColor:a.color,spotRadius:0,lineWidth:2,highlightColor:hexToRgba(a.color,.6),highlightLineColor:"#666",defaultPixelsPerValue:5})})})}$(".chart-circle").length&&$(".chart-circle").each(function(){var e=$(this);e.circleProgress({fill:{color:buzzer.colors[e.attr("data-color")]||buzzer.colors.blue},size:e.height(),startAngle:-Math.PI/4*2,emptyFill:"#F4F4F4",lineCap:"round"})}),$("a.mega_menu").on("click",function(){$(".mega_menubar").toggleClass("open vivify pullDown")}),$("a.settingbar").on("click",function(){$(".right_sidebar").toggleClass("open")}),$("a.sidebar_toggle_btn").on("click",function(){$("body").toggleClass("sidebar_toggle")}),$(".choose-skin li").on("click",function(){var e=$("body"),t=$(this),a=$(".choose-skin li.active").data("theme");$(".choose-skin li").removeClass("active"),e.removeClass("theme-"+a),t.addClass("active"),e.addClass("theme-"+t.data("theme"))}),$(".accordion2 > .accordion-item.is-active").children(".accordion-panel").slideDown(),$(".accordion2 > .accordion-item").on("click",function(){$(this).siblings(".accordion-item").removeClass("is-active").children(".accordion-panel").slideUp(),$(this).toggleClass("is-active").children(".accordion-panel").slideToggle("ease-out")}),$(document).ready(function(){$(".star").on("click",function(){$(this).toggleClass("star-checked")}),$(".ckbox label").on("click",function(){$(this).parents("tr").toggleClass("selected")}),$(".btn-filter").on("click",function(){var e=$(this).data("target");"all"!=e?($(".table tr").css("display","none"),$('.table tr[data-status="'+e+'"]').fadeIn("slow")):$(".table tr").css("display","none").fadeIn("slow")})});var e=document.querySelector('.theme-switch input[type="checkbox"]'),a=document.querySelector('.theme-high-contrast input[type="checkbox"]'),i=localStorage.getItem("theme");i&&(document.documentElement.setAttribute("data-theme",i),"dark"===i&&(e.checked=!0),"high-contrast"===i&&(a.checked=!0,e.checked=!1)),e.addEventListener("change",function(e){e.target.checked?(document.documentElement.setAttribute("data-theme","dark"),localStorage.setItem("theme","dark"),$('.theme-high-contrast input[type="checkbox"]').prop("checked",!1)):(document.documentElement.setAttribute("data-theme","light"),localStorage.setItem("theme","light"))},!1),a.addEventListener("change",function(e){e.target.checked?(document.documentElement.setAttribute("data-theme","high-contrast"),localStorage.setItem("theme","high-contrast"),$('.theme-switch input[type="checkbox"]').prop("checked",!1)):(document.documentElement.setAttribute("data-theme","light"),localStorage.setItem("theme","light"))},!1)}),$(document).ready(function(){$(".btn-toggle-fullwidth").on("click",function(){$("body").hasClass("layout-fullwidth")?$("body").removeClass("layout-fullwidth"):$("body").addClass("layout-fullwidth"),$(this).find(".fa").toggleClass("fa-arrow-left fa-arrow-right")}),$(".header-toggler").on("click",function(){$("body").toggleClass("offcanvas-active")}),$("#main-content").on("click",function(){$("body").removeClass("offcanvas-active")}),$(window).on("load",function(){$("#main-content").height()<$("#left-sidebar").height()&&$("#main-content").css("min-height",$("#left-sidebar").innerHeight()-$("footer").innerHeight())}),$("#searchfield").focus(function(){"Search contacts..."==$(this).val()&&$(this).val("")}),$("#searchfield").focusout(function(){""==$(this).val()&&$(this).val("Search contacts...")}),$("#sendmessage input").focus(function(){"Send message..."==$(this).val()&&$(this).val("")}),$("#sendmessage input").focusout(function(){""==$(this).val()&&$(this).val("Send message...")}),$(".friend").each(function(){$(this).click(function(){var e=$(this).offset(),t=$(this).parent().parent().offset(),a=e.top-t.top,i=$(this).find("img").eq(0).clone(),r=a+12+"px";$(i).css({top:r}).addClass("floatingImg").appendTo("#rightchatbox"),setTimeout(function(){$("#profile p").addClass("animate"),$("#profile").addClass("animate")},100),setTimeout(function(){$("#chat-messages").addClass("animate"),$(".cx, .cy").addClass("s1"),setTimeout(function(){$(".cx, .cy").addClass("s2")},100),setTimeout(function(){$(".cx, .cy").addClass("s3")},200)},150),$(".floatingImg").animate({width:"68px",left:"108px",top:"20px"},200);var l=$(this).find("p strong").html(),o=$(this).find("p span").html();$("#profile p").html(l),$("#profile span").html(o),$(".message").not(".right").find("img").attr("src",$(i).attr("src")),$("#friendslist").fadeOut(),$("#chatview").fadeIn(),$("#close").unbind("click").click(function(){$("#chat-messages, #profile, #profile p").removeClass("animate"),$(".cx, .cy").removeClass("s1 s2 s3"),$(".floatingImg").animate({width:"40px",top:r,left:"12px"},200,function(){$(".floatingImg").remove()}),setTimeout(function(){$("#chatview").fadeOut(),$("#friendslist").fadeIn()},50)})})})}),window.buzzer={colors:{blue:"#467fcf","blue-darkest":"#0e1929","blue-darker":"#1c3353","blue-dark":"#3866a6","blue-light":"#7ea5dd","blue-lighter":"#c8d9f1","blue-lightest":"#edf2fa",azure:"#45aaf2","azure-darkest":"#0e2230","azure-darker":"#1c4461","azure-dark":"#3788c2","azure-light":"#7dc4f6","azure-lighter":"#c7e6fb","azure-lightest":"#ecf7fe",indigo:"#6574cd","indigo-darkest":"#141729","indigo-darker":"#282e52","indigo-dark":"#515da4","indigo-light":"#939edc","indigo-lighter":"#d1d5f0","indigo-lightest":"#f0f1fa",purple:"#a55eea","purple-darkest":"#21132f","purple-darker":"#42265e","purple-dark":"#844bbb","purple-light":"#c08ef0","purple-lighter":"#e4cff9","purple-lightest":"#f6effd",pink:"#f66d9b","pink-darkest":"#31161f","pink-darker":"#622c3e","pink-dark":"#c5577c","pink-light":"#f999b9","pink-lighter":"#fcd3e1","pink-lightest":"#fef0f5",red:"#e74c3c","red-darkest":"#2e0f0c","red-darker":"#5c1e18","red-dark":"#b93d30","red-light":"#ee8277","red-lighter":"#f8c9c5","red-lightest":"#fdedec",orange:"#fd9644","orange-darkest":"#331e0e","orange-darker":"#653c1b","orange-dark":"#ca7836","orange-light":"#feb67c","orange-lighter":"#fee0c7","orange-lightest":"#fff5ec",yellow:"#f1c40f","yellow-darkest":"#302703","yellow-darker":"#604e06","yellow-dark":"#c19d0c","yellow-light":"#f5d657","yellow-lighter":"#fbedb7","yellow-lightest":"#fef9e7",lime:"#7bd235","lime-darkest":"#192a0b","lime-darker":"#315415","lime-dark":"#62a82a","lime-light":"#a3e072","lime-lighter":"#d7f2c2","lime-lightest":"#f2fbeb",green:"#5eba00","green-darkest":"#132500","green-darker":"#264a00","green-dark":"#4b9500","green-light":"#8ecf4d","green-lighter":"#cfeab3","green-lightest":"#eff8e6",teal:"#2bcbba","teal-darkest":"#092925","teal-darker":"#11514a","teal-dark":"#22a295","teal-light":"#6bdbcf","teal-lighter":"#bfefea","teal-lightest":"#eafaf8",cyan:"#17a2b8","cyan-darkest":"#052025","cyan-darker":"#09414a","cyan-dark":"#128293","cyan-light":"#5dbecd","cyan-lighter":"#b9e3ea","cyan-lightest":"#e8f6f8",gray:"#868e96","gray-darkest":"#1b1c1e","gray-darker":"#36393c","gray-dark":"#6b7278","gray-light":"#aab0b6","gray-lighter":"#dbdde0","gray-lightest":"#f3f4f5","gray-dark":"#343a40","gray-dark-darkest":"#0a0c0d","gray-dark-darker":"#15171a","gray-dark-dark":"#2a2e33","gray-dark-light":"#717579","gray-dark-lighter":"#c2c4c6","gray-dark-lightest":"#ebebec"}},$(document).ready(function(){var e,t;new Date;e=document.createElement("script"),t=document.getElementsByTagName("script")[0],e.async=!0,e.src="https://embed.tawk.to/6051a040f7ce18270930e55a/1f2l7mgt2",e.charset="UTF-8",e.setAttribute("crossorigin","*"),t.parentNode.insertBefore(e,t)});