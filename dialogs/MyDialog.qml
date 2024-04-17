import QtQuick.Controls

Dialog {
    title: qsTr("Message")

    standardButtons: Dialog.Ok | Dialog.Cancel
    Label {
        text: qsTr("Do you want to climb today ?")
    }
}
