import QtQuick 2.0
import QtQuick.Controls 2.12 as Con212

// TextField允许用户输入单行文本，适用于搜索框、登录表单等场景
// 即设置 背景项是边缘发光效果的矩形 的文本框（TextFile）

Item {
    id: root
    clip: true

    property alias color: background.color

    property alias horizontalAlignment: field.horizontalAlignment
    property alias verticalAlignment: field.verticalAlignment
    property alias selectionColor: field.selectionColor
    property alias font: field.font
    property alias selectByMouse: field.selectByMouse
    property alias hoverEnabled: field.hoverEnabled
    property alias text: field.text
    property alias placeholderText: field.placeholderText
    property alias validator: field.validator
    property alias passwordCharacter: field.passwordCharacter
    property alias passwordMaskDelay: field.passwordMaskDelay
    property alias echoMode: field.echoMode
    property alias leftPadding: field.leftPadding
    property alias rightPadding: field.rightPadding

    Con212.TextField {
        id: field
        anchors.fill: parent
        selectionColor: "#09A3DC"
        background: GlowRectangle {
            id: background
            width: root.width
            height: 1
            color: "#09A3DC"
            glowColor: "#09A3DC"
            anchors.top: parent.bottom
            anchors.topMargin: -1
            radius: 0
            glowRadius: 0.5
        }
    }
}
