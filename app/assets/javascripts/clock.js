function draw_clock(width, fillColor, strokeColor, pinColor, hourHandColor, minuteHandColor, secondHandColor){
  canvas = Raphael('clock',width, width);
  var clock = canvas.circle(width*.5,width*.5, width * .475);
  clock.attr({'fill':fillColor,'stroke':strokeColor,'stroke-width':(width*.015)})
  var hour_sign;
  for(i=0;i<12;i++){
    var start_x = width*.5+Math.round((width*.4)*Math.cos(30*i*Math.PI/180));
    var start_y = width*.5+Math.round((width*.4)*Math.sin(30*i*Math.PI/180));
    var end_x = width*.5+Math.round((width*.45)*Math.cos(30*i*Math.PI/180));
    var end_y = width*.5+Math.round((width*.45)*Math.sin(30*i*Math.PI/180));
    hour_sign = canvas.path("M"+start_x+" "+start_y+"L"+end_x+" "+end_y);
    hour_sign.attr('stroke', strokeColor);
  }

  hour_hand = canvas.path("M" + width*.5 + " " + width*.5 + "L" + width*.5 + " " + (width*.25) + "");
  hour_hand.attr({stroke: hourHandColor, "stroke-width": width*.03});
  minute_hand = canvas.path("M" + width*.5 + " " + width*.5 + "L" + width*.5 + " " + (width*.2) + "");
  minute_hand.attr({stroke: minuteHandColor, "stroke-width": width*.02});
  second_hand = canvas.path("M" + width*.5 + " " + (width*.55) + "L" + width*.5 + " " + (width*.125) + "");
  second_hand.attr({stroke: secondHandColor, "stroke-width": width*.01});
  var pin = canvas.circle(width*.5, width*.5, width*.025);
  pin.attr("fill", pinColor);
  pin.attr("stroke", pinColor);
  update_clock(width)
  setInterval("update_clock("+width+")",1000)
};

  function update_clock(width){
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    hour_hand.rotate(30*hours+(minutes/2.5), width*.5, width*.5);
    minute_hand.rotate(6*minutes, width*.5, width*.5);
    second_hand.rotate(6*seconds, width*.5, width*.5);
  }

$(document).ready(function(){
  draw_clock(85,'#CFF09E', '#3B8686', '#3B8686', '#3B8686', '#3B8686', '#3B8686');
});
