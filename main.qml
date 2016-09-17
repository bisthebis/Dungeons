import QtQuick 2.7
import QtQuick.Window 2.2

import "GridLogic.js" as JS

import Dungeon 0.1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    DungeonData {
        id: data;
        Component.onCompleted: setTypeAt(DungeonData.Floor, 2, 2);
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(data.at(2,2) === DungeonData.Floor);
        }
    }

    Grid {
        id: grid
        anchors.fill: parent
        columns: data.width;
        rows: data.height;

        Component.onCompleted: {
            //JS.initGrid(data);
        }
    }
}
