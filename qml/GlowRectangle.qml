import QtQuick 2.0
import QtGraphicalEffects 1.15

// 定义一个具有边缘发光效果的juxing

Item {
    id: root

    property alias color: backRect.color;
    property alias radius: backRect.radius;
    property alias gradient: backRect.gradient;
    property alias spread: backEffect.spread;
    property alias glowColor: backEffect.color;
    property alias glowRadius: backEffect.glowRadius;

    RectangularGlow {
        id: backEffect
        antialiasing: true
        anchors.fill: backRect
        glowRadius: 1
        spread: 0.2
        cornerRadius: backRect.radius + glowRadius
    }

    Rectangle {
        id: backRect
        antialiasing: true
        anchors.fill: parent
    }
}

