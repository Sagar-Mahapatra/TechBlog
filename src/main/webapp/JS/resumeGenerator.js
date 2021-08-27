function addnewEx() {

	let txt = document.createElement("textarea");

	txt.classList.add("form-control");
	txt.classList.add("workXp");
	txt.classList.add("mt-2");
	txt.setAttribute("rows", 3);
	txt.setAttribute("placeholder", "workExperience");

	let addWorkXpBtn = document.getElementById("addWorkXpBtn");
	let second = document.getElementById("second");

	second.insertBefore(txt, addWorkXpBtn);

}

function addnewSk() {

	let txt = document.createElement("textarea");

	txt.classList.add("form-control");
	txt.classList.add("skills");
	txt.classList.add("mt-2");
	txt.setAttribute("rows", 3);
	txt.setAttribute("placeholder", "skills");

	let addSkillsBtn = document.getElementById("addSkillsBtn");
	let first = document.getElementById("first");

	first.insertBefore(txt, addSkillsBtn);

}

function addnewAc() {

	let txt = document.createElement("textarea");

	txt.classList.add("form-control");
	txt.classList.add("academics");
	txt.classList.add("mt-2");
	txt.setAttribute("rows", 3);
	txt.setAttribute("placeholder", "Academics");

	let addAcademicBtn = document.getElementById("addAcademicBtn");
	let third = document.getElementById("third");

	third.insertBefore(txt, addAcademicBtn);

}
var first_container = document.getElementById("first_container");
var second_container = document.getElementById("second_container");

second_container.style.visibility = "hidden";





function showProfile() {

	first_container.style.display = "none";
	second_container.style.visibility = "visible";

	let name = document.getElementById("name").value;
	let name_ = document.getElementById("name_");
	name_.innerHTML = name;
	let Contact = document.getElementById("Contact").value;
	let contact_ = document.getElementById("contact_");
	contact_.innerHTML = Contact;
	//	let addres = document.getElementById("address").value;
	//	let address_ = document.getElementById("address_");
	//	address_.innerHTML = addres;
	let fb = document.getElementById("fb").value;
	let fb_ = document.getElementById("fb_");
	fb_.innerHTML = fb;
	let ins = document.getElementById("in").value;
	let in_ = document.getElementById("in_");
	in_.innerHTML = ins;
	let link = document.getElementById("link").value;
	let link_ = document.getElementById("link_");
	link_.innerHTML = link;


	//xp
	let xpe = document.getElementById("xp");
	let workXp = document.getElementsByClassName("workXp");
	console.log(workXp);

	let str = "";

	for (let xp of workXp) {

		str = str + `<li class="list-group-item">${xp.value}</li>`;

	}

	xpe.innerHTML = str;


	//skills
	let skill = document.getElementById("skill");
	let skills = document.getElementsByClassName("skills");


	let str1 = "";

	for (let xp of skills) {

		str1 = str1 + `<li class="list-group-item">${xp.value}</li>`;

	}
	console.log(str1);

	skill.innerHTML = str1;


	//academics

	let academic = document.getElementById("academic");
	let academics = document.getElementsByClassName("academics");


	let str2 = "";

	for (let xp of academics) {

		str2 = str2 + `<li class="list-group-item">${xp.value}</li>`;

	}


	academic.innerHTML = str2;

	//image uploading
	let address = document.getElementById("address").value;
	let address_ = document.getElementById("address_");
	address_.innerHTML = address;
	let image = document.getElementById("image").files[0];
	let reader = new FileReader();
	reader.readAsDataURL(image);
	reader.onloadend = function() {
		let head_img = document.getElementById("head_img_image");
		head_img.src = reader.result;
	};




}





