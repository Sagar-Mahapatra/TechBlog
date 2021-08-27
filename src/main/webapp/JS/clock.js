//console.log("timer");

//Timer is used to set timer to any action.

//console.log("Timer is used to set timer to any action.");

var timer;

var crntTime = document.getElementById("crntTime");

//console.log(crntTime);

let start = () => {

	//	setTimeout(start,5000);

	timer = setInterval(started, 1000);

}



let started = () => {

	var date = new Date();
	var h = date.getHours();
	var m = date.getMinutes();
	var s = date.getSeconds();
	var t = h + ":" + m + ":" + s;
	crntTime.innerHTML = t;


}

let pause = () => {

	clearInterval(timer);

}
