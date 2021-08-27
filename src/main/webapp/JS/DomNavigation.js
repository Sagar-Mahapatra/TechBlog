

let container = document.getElementById("heading");

console.log("element: " + container.tagName);

let p = container.parentElement;

console.log("p: " + p.tagName);

let children = container.children;

for (let x of children) {
	
	console.log("c: "+x.tagName);

}

let s = container.nextElementSibling;

console.log("s: " + s.tagName);

