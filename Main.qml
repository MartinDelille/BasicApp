import QtQuick
import QtQuick.Controls
import dialogs

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Button {
        text: "Push me"
        onClicked: myDialog.open()
    }
    MyDialog {
        id: myDialog
    }
}
