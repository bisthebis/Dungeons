import QtQuick 2.7

Item {
    id: cell
    width: 64
    height: width

    property int xInGrid: 0
    property int yInGrid: 0

    MouseArea {
        anchors.fill: parent;
        onClicked: {

            //setState((getStateId() + 1) % 4 ); TODO : update grid

        }
    }

    state: "nothing"
    states: [
        State {
            name: "outofbounds"
            PropertyChanges {
                target: img
                source: "qrc:/outofbounds.png"

            }
        },

        State {
            name: "nothing"
            PropertyChanges {
                target: img
                source: "qrc:/nothing.png"

            }
        },

        State {
            name: "wall"
            PropertyChanges {
                target: img
                source: "qrc:/wall.png"

            }
        },

        State {
            name: "floor"
            PropertyChanges {
                target: img
                source: "qrc:/floor.png"

            }
        }

    ]




    Image {
        id: img;
        anchors.fill: parent
    }

    function setState(integerValue) {
        //console.log("State set at : " + integerValue)
        switch (integerValue) {
            case 0:
                cell.state = "outofbounds";
                break;
            case 1:
                cell.state = "nothing";
                break;
            case 2:
                cell.state = "wall";
                break;
            case 3:
                cell.state = "floor";
                break;
            default:
                cell.state = "outofbounds"

        }
    }

    function getStateId() {
        switch (cell.state) {
            case "outofbounds":
                return 0;
            case "nothing":
                return 1;
            case "wall":
                return 2;
            case "floor":
                return 3;
        }
    }

}
