import QtQuick 2.7
import QtQuick.Window 2.2

import "GridLogic.js" as JS

import Dungeon 0.1

Window {
    visible: true
    width: 64*data.width
    height: 64*data.height
    title: qsTr("Hello World")

    DungeonData {
        id: data;
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            JS.initGrid(data);
        }
    }

    Grid {
        id: grid
        anchors.fill: parent
        columns: data.width;
        rows: data.height;

    }

    Component.onCompleted: {
        data.setTypeAt(DungeonData.Floor, 2, 2);
        data.createFromFile(":/level1.txt");
        JS.initGrid(data);
    }
}
