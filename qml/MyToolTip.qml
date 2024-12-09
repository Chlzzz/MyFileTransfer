import QtQuick 2.0
import QtQuick.Controls 2.5

// 定义一个响应visible变量的动画效果
// 初始为不可见

ToolTip {
    id: root
    font.pointSize: 9
    font.family: "微软雅黑"
    opacity: 0
    background: Rectangle {
        radius: 4
        color: "#AAFFFFFF"
        border.color: "#888"
        border.width: 1
    }

    NumberAnimation {
        id: animation
        target: root
        running: false
        property: "opacity"
        from: 0
        to: 1
        duration: 700
        easing.type: Easing.InOutQuad
    }

    onVisibleChanged: if (visible) animation.restart();
}

