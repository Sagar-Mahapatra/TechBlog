/**
 * 
 */

function doLike(uid, pid) {

	console.log(`${uid},${pid}`);	

	const obj = {
		uid: uid,
		pid: pid,
		operation: 'like',

	};


	$.ajax({

		url: "LikeServlet",
		data: obj,
		type: 'POST',
		success: function(data, textStatus, jqXHR) {



		},
		error: function(jqXHR, textStatus, errorThrown) {


		},

	});

}