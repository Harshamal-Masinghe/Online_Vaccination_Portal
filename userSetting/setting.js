//validate Phonenumber, email and password

let number = document.querySelector(".number");
let text = document.querySelector(".text");
let email = document.querySelector(".emails");
let textmail = document.querySelector(".mailh");
let password = document.querySelector(".pwd");
let textpwd = document.querySelector(".pwdh");

let regex = /^\d{10}$/; //10 digits
var regexmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; //email format

email.addEventListener("input",()=>{
	if(email.value ==""){
		textmail.innerText = "";

	}
	else if(email.value.match(regexmail)){
		textmail.innerText = "";
	}
	else
		{
		textmail.innerText = "Your Email Is Invalid";
		textmail.style.color = "#da3400";
		}
});

password.addEventListener("input",()=>{
	if(password.value ==""){
		textpwd.innerText = "";

	}
	else if(password.value.length < 8){
		textpwd.innerText = "Invalid Password. Please enter at least 8 characters";
		textpwd.style.color = "#da3400";
	}

	else{
		textpwd.innerText = "";

	}

});

number.addEventListener("input",()=>{
	if(number.value ==""){
		text.innerText = "";

	}
	else if(number.value.match(regex)){
		text.innerText = "Valid Phone Number";
		text.style.color = "rgba(4,125,9,1)";
	}
	else
		{
		text.innerText = "Oops! Your Phone Number Is Invalid";
		text.style.color = "#da3400";
		}
});

