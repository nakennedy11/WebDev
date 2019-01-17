(function () {
	"use strict";
	var arith = {first : "", sec : "", op : "", finished : 0};

	function onButtonPress(id) {
		let btn = document.getElementsByClassName("btn");
		let ans = document.getElementById("answer");
		let number;
		let result;

		// if the id is a number, display it and add it to the original number
		if (!isNaN(id)) {
			if (arith.finished == 0) {
				ans.value = ans.value + id;
			}
			else {
				ans.value = id;
				arith.finished = 0;
			}
		}
		
		//if the id is a clear, clear the display and all operations
		else if (id == "c") {
			ans.value = "";
			arith.first = "";
			arith.sec = "";
			arith.op = "";
			arith.result = "";
		}

		else if (id == ".") {
			ans.value = ans.value + ".";
		}

		// for all operations
		else {
			// prevents arithmetic out of order
			if (arith.first != "") {
				// empty answer box
				ans.value = "";
				// if the +/= is an equals...
				if (id == "+" && arith.sec != "") {
					// do the calculations, display it
					result = doCalc();
					ans.value = result;
					arith.finished = 1;
				}
				else {
					// else it is an operator
					arith.op = id;
				}
			}

		}



		number = parseFloat(ans.value);
		collect(number);
	}

	// assign the numbers to the correct place
	function collect(num) {
		// if arith,op is empty, we're still on the first num
		if (arith.op == "") {
			arith.first = num;
		}
		// if it's occupied, we're on the second num
		else {
			arith.sec = num;
		}
	}
	
	// do the actual calculation using arith.op and return the result
	function doCalc() {
		let result;
		if (arith.op == "+")  {
			result = arith.first + arith.sec;
		}
		else if (arith.op == "-") {
			result =  arith.first - arith.sec;
		}
		else if (arith.op == "/") {
			if (arith.sec == 0) { // can't divide by 0
				return "DIV 0!";
			}
			else {
				result = arith.first / arith.sec;
			}
		}
		else if (arith.op = "x") {
			result = arith.first * arith.sec;
		}
		arith.first = result; // shift the result over to the first num for chaining calcs
		arith.sec = ""; // clear the sec num
		arith.op = ""; // clear the op
		return result;
	}

	
	function init() {
		var btns = document.getElementsByClassName("btn");
		btns = Array.from(btns);
		//since btns returns an object, iterate to add event listeners
		btns.forEach(function (i) {
			i.addEventListener("click", function() {  onButtonPress(i.id); });
		});
	
	}
	document.addEventListener("DOMContentLoaded", init, false);
})();
