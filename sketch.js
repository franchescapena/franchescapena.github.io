 var xpos = 250;
 var ypos = 250;

function setup() {
	createCanvas(500, 500);
	fill(0, 0, 0);
	textSize(30);
	text("USE YOUR ARROW KEYS", 100, 40);
	text("TO MOVE THE RECTANGLE", 100, 70);
}

function draw() {
	setup();
	fill(Math.random() * 100,255,Math.random()*250);
	rect(xpos, ypos, 40, 40);
	keyPressed()
}

function keyPressed() {
	if (keyCode === LEFT_ARROW) {
		xpos = xpos - 2;
	}
	if (keyCode === RIGHT_ARROW) {
		xpos = xpos + 2;
	}
	if (keyCode === UP_ARROW) {
		ypos = ypos - 2;
	}
	if (keyCode === DOWN_ARROW) {
		ypos = ypos + 2;
	}
}

f