var data = null
var cellArray = null
var cellComponent = null

//*
function initCellComponent() {
    cellComponent = Qt.createComponent("Cell.qml");
}

function initGrid(dungeon) {
    data = dungeon;

    if (cellComponent === null)
        initCellComponent();

    //Cleaning
    //console.log("Deleting : " + grid.children.length + " children")
    for (var i = grid.children.length; i < 0; i--)
    {

        if(grid.children[i-1] !== null)
            grid.children[i-1].destroy();
    }
    grid.children = null;
    //console.log("Now there are : " + grid.children.length + " children")
    for (var y = 0; y < data.height; y++)
    {
        for (var x = 0; x < data.width; x++)
        {
            var cell = cellComponent.createObject(grid);
            cell.xInGrid = x;
            cell.yInGrid = y;
            //console.log("Type : " + data.at(x, y))
            cell.setState(data.at(x, y));
        }
    }
}
//*/
