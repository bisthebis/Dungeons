import QtQuick 2.0

Item {
    id: cell
    width: 64
    height: width

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

    property int xInGrid: 0
    property int yInGrid: 0


    Image {
        id: img;
        anchors.fill: parent
    }

    function setState(integerValue) {
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

        }
    }

}
