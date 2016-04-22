
console.log("Value");	
$(document).ready(function(){

	$('#button').click(function(){
		var gridSize = document.getElementById('gridSizeValue').value;
		drawNewTable(gridSize);
	});
	styleTable();
});

function styleTable(){

	$('td').mouseenter(function(){
		$(this).css("background-color","white");
	});

	$('td').mouseleave(function(){
		$(this).css("background-color","black");
	});

	//Option 1: set height and width of each "cell" to the total height of table / cound of rows
	// rowHeight = $('td').eq(0).height();
	tableHeight = 400;
	// alert("The Table Height is" + tableHeight);
	numberOfRows = document.getElementsByClassName('tableRow').length;
	// alert("rows " + numberOfRows);
	dynamicCellHeight = (tableHeight / numberOfRows);
	// alert("The Cell Height is " + dynamicCellHeight);
	cellHeightInt= Number(dynamicCellHeight);
	$('td').height(cellHeightInt);
	$('td').width(cellHeightInt);
}


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
	
	styleTable();
}
