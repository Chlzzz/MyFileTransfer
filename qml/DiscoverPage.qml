import QtQuick 2.0
import QtQuick.Controls 2.12
import an.item 1.0

Item {
    id: root
    clip: true
    property bool connected: false
    property string connectName: "";

    // discoverCon 为 DiscoverConnection的实例，
    // QMap<QString, QHostAddress> accessPoints为 DiscoverConnection私有成员


    // 扫描item，包括网格，圆等
    ScannerItem {
        id: scanner
        clip: true
        anchors.fill: parent
    }

    // row（昵称:TextFeile的(hostname）,状态：连接，未连接）
    GlowRectangle {
        id: nameLabel
        radius: 5
        height: 50
        clip: true
        color: "#D7C2F9"
        glowColor: color
        anchors.left: parent.left
        anchors.leftMargin: 70
        anchors.right: parent.right
        anchors.rightMargin: 70
        anchors.top: parent.top
        anchors.topMargin: -radius

        Row {
            id: rowtitle
            width: 270
            height: 28
            anchors.centerIn: parent
            spacing: 20

            Text {
                id: nameText
                width: 20
                height: 28
                verticalAlignment: Text.AlignVCenter
                text: qsTr("昵称：")
            }

            FlatInput {
                id: nameInput  
                width: 100
                height: 28
                selectByMouse: true        
                text: qsTr("未命名")
                font.pixelSize: 12
                placeholderText: qsTr("  取名...")
                onTextChanged: discoverCon.name = text;
            }

            Text {
                id: statusLabel
                width: 140
                height: 28
                verticalAlignment: Text.AlignVCenter
                text: "状态：" + "<font color=\"red\" size=\"3\">" +
                      (root.connected ? "已连接到" + root.connectName : "未连接") + "</font>"

            }
        }
    }

    // 点击， scanner.start(), 启动扫描动画
    // access队列清空，开始查找可用设备
    MyButton {
        text: "扫描"
        widthMargin: 12
        heightMargin: 8
        anchors.centerIn: parent
        onClicked: {
            scanner.start();
            accessPoints.clear();
            discoverCon.discover();
        }
    }

    Connections {
        target: discoverCon

        function onNewAccessPoint(name) {
            accessPoints.append({"name" : name});
        }

        function onNewConnection(name) {
            scanner.stop();
            connected = true;
            connectName = name;
            swipeView.setCurrentIndex(1)
        }

    }

    // 列出扫描到的accessPoints
    Rectangle {
        id: apBackground
        clip: true
        radius: 5
        color: "#00FFFFFF"
        width: 150
        height: 300
        anchors.top:  nameLabel.bottom
        anchors.topMargin: 50
        anchors.right: parent.right
        anchors.rightMargin: 50

        Text {
            id: apLabel
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("扫描到：")
            color: "red"
            font.bold: true
            font.pointSize: 11
        }

        ListView {
            id: listView
            clip: true
            anchors.top: apLabel.bottom
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            spacing: 4
            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
            }
            displaced: Transition {
                NumberAnimation {properties: "x,y";  easing.type: Easing.OutQuad}
            }
            model: ListModel {id: accessPoints}
            delegate: Component {
                Rectangle {
                   width: listView.width - 20
                   height: 32
                   radius: 2
                   border.color: "#777"
                   color: hovered ? "#559EF2FA" : "#55556677"
                   property bool hovered: false

                   MouseArea {
                       anchors.fill: parent
                       hoverEnabled: true
                       onEntered: parent.hovered = true;
                       onExited: parent.hovered = false;
                       onClicked: {
                           scanner.stop()
                           discoverCon.connectToName(name);
                           fileTransfer.setAccessPoint(name);
                           root.connected = true;
                           root.connectName = name;
                           accessPoints.clear();
                           onClicked: swipeView.setCurrentIndex(1);
                       }
                   }

                   Text {
                       anchors.centerIn: parent
                       text: qsTr(name)
                   }
                }
            }
        }
    }
}
