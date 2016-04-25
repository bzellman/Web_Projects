var colorToggle = false; 
var trailToggle = false;

$(document).ready(function(){
	drawNewTable(16);
	$('#gridButton').click(function(){
		createNewGrid();
	});
	$('#colorButton').click(function(){
		if(colorToggle == true) {
			colorToggle = false;
			$('#colorButton').attr('value', 'Random Colors');
		} else {
			colorToggle = true;
			$('#colorButton').attr('value', 'Black');
		}
		styleTable();
	});
	$('#trailButton').click(function(){
		if(trailToggle == true) {
			trailToggle = false;
			$('#trailButton').attr('value', 'Trail Effect');
		} else {
			trailToggle = true;
			$('#trailButton').attr('value', 'Solid Effect');
		}
		styleTable();
	});	
	$('#resetButton').click(function(){
		$('#colorButton').attr('value', 'Random Colors');
		colorToggle = false;
		$('#trailButton').attr('value', 'Trail Effect');
		trailToggle = false;
		$('#gridSizeValue').attr('placeholder', 'Enter A Number Less Than 80');
		$('#gridSizeValue').attr('value', '');
		drawNewTable(16);
		styleTable();
	});		
});

function drawNewTable(newGridSize){
	$('.mainTable').remove();
	// Draw New Grid -> Add Table -> Add Rows -> Add Column
	$('.tableDiv').append("<table class='mainTable'>")
		for(var i = 0; i < newGridSize; i++){
			$('.mainTable').append("<tr class='tableRow'>");
				for(var j = 0; j < newGridSize; j++){
				$('.tableRow:nth-child(' + (i+1) +')').append("<td class=\"tableColumn\">");
				}
			$('.mainTable').append("</tr>");
		}
	$('.tableDiv').append("</table>");
	
	tableHeight = "600px";
	$('.mainTable').css({"width":tableHeight});
	$('.mainTable').css({"height":tableHeight});
	styleTable();	
}

function styleTable(newGridSize){
	$('td').unbind('mouseenter mouseleave');
	
	if(colorToggle == true){
		$('td').mouseenter(function(){
			$(this).fadeTo(75, 1, function() {
				$(this).css({"background-color": randomRGB});
			});
		});
	} else {
		$('td').mouseenter(function(){
			$(this).fadeTo(75, 1, function() {
				$(this).css({"background-color": "black"});
			});
		});
	}
	
	if (trailToggle){
		$('td').mouseleave(function(){
			$(this).fadeTo(1000, 1, function() {
				$(this).css({"background-color": "white"});
			});	
	}); 
	}
}

function randomRGB(){
	red = Math.floor(Math.random() * 256);
	blue = Math.floor(Math.random() * 256);
	green = Math.floor(Math.random() * 256);
	return "rgb("+red+", "+green+", "+blue+")"
}

function createNewGrid(){
	var gridSize = document.getElementById('gridSizeValue').value;
	if(isNaN(gridSize)){
		alert("Please Enter a Number less than 80 \nNo Other characters are acceptable");
	}
	else if (gridSize > 80) {
		alert("Please Enter a Number less than 80");
	} else {
		drawNewTable(gridSize);
		styleTable();	
	}
}