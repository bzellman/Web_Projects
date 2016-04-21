// alert('Welcome to JavaScript');
// console.log("TEST");

console.log("Value");	
$(document).ready(function(){
	// console.log("TEST");
	$('div').css("background-color","yellow");


	$('#button').click(function(){
		var gridSize = document.getElementById('gridSizeValue').value;
		var amountOfTableRows = document.getElementsByClassName('tableRow').length;
		setTableRows(amountOfTableRows, gridSize);
	});
	
	styleTable();
});

function setTableRows(currentAmountOfRows, newGridSize) {
	// check if even number 
	// Check if the number of rows is less than or greater than current amount of rows
	// either add or subtract rows
	// loop through rows and either add or subtract columns 

		if (newGridSize > currentAmountOfRows) {
			var rowsToAdd = newGridSize - currentAmountOfRows;
			for (var i = 0; i < rowsToAdd; i++) {
				$('.mainTable').append("<tr class=\"tableRow\"></tr>");
			}
			newAmountOfRows = document.getElementsByClassName('tableRow');
			for (var i = 0; i < newAmountOfRows.length; i++) {
				currentAmountOfColumnsInRow = newAmountOfRows[i].getElementsByClassName('tableColumn').length;
				columnsToAdd = newGridSize - currentAmountOfColumnsInRow;
				// console.log("Need to add " + columnsToAdd + "columns");
				for (var j = 0; j < columnsToAdd; j++) {
					$('.tableRow:nth-child(' + (i+1) +')').append("<td class=\"tableColumn\">");	
				}
			}
		} 


		else if (newGridSize < currentAmountOfRows){
			var rowsToSubtract = currentAmountOfRows - newGridSize;
			for (var i = 0; i < rowsToSubtract; i++) {
				$('.tableRow:nth-child(' + (i+1) +')').remove();
			}

			newAmountOfRows = document.getElementsByClassName('tableRow');
			for (var i = 0; i < newAmountOfRows.length; i++) {
				currentAmountOfColumnsInRow = newAmountOfRows[i].getElementsByClassName('tableColumn').length;
				columnsToSubtract = currentAmountOfColumnsInRow - newGridSize;
				// console.log("There are " + currentAmountOfColumnsInRow + " columns in row" + (i+1));
				for (var j = 0; j < columnsToSubtract; j++) {
					$('.tableColumn:nth-child(' + (i+1) +')').remove();
				}
			}
		} 
		styleTable();
} 

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