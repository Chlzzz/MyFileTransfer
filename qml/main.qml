import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import an.window 1.0

FramelessWindow {
    id: root
    visible: true
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 480
    title: qsTr("File Transfer")
    color: "#D4E6FF"

    GlowRectangle {
        id: windowTitle
        radius: 5
        z: 5
        height: 40
        width: parent.width
        color: "#F4D1B4"
        glowColor: color
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: -radius

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            text: qsTr("文件传输")
        }

        MyButton {
            heightMargin: 8
            anchors.right: parent.right
            anchors.top: parent.top
            text: qsTr("X")
            onClicked: root.close()
        }

        MyButton {
            heightMargin: 8
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Back")
            onClicked: swipeView.setCurrentIndex(0);
        }
    }


    SwipeView {
        id: swipeView
        clip: true
        interactive: false
        orientation: Qt.Horizontal
        currentIndex: pageIndicator.currentIndex
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: windowTitle.bottom
        anchors.bottom: parent.bottom

        Page {
            DiscoverPage {
                anchors.fill: parent
            }
        }
        Page {
            TransferPage {
                anchors.fill: parent
            }
        }
    }

    PageIndicator {
        id: pageIndicator
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        interactive: true
        currentIndex: swipeView.currentIndex
        count: swipeView.count
    }

 }





