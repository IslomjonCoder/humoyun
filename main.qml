import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import QtQuick.Dialogs 1.3

Window {
    id: root
    width: 640
    height: 480
    visible: true
    color: "#7cb5f2"
    title: qsTr("Hello World")
    Item {
        id: item1
        x: 42
        y: 26
        width: 556
        height: 86

        Rectangle {
            id: rectangle
            opacity: 1
            color: "#ffffff"
            radius: 38
            anchors.left: parent.left
            anchors.right: button.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 33
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 5

            TextField {
                id: textField
                visible: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                clip: false
                focus: true
                leftPadding: 10
                bottomPadding: 5
                topPadding: 5
                anchors.rightMargin: 22
                anchors.leftMargin: 21
                anchors.bottomMargin: 18
                anchors.topMargin: 18

                placeholderText: qsTr("https://youtu.be/oAlP0KCbKD0")
            }
        }

        Button {
            id: button
            x: 273
            text: qsTr("Button")
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 23
            anchors.topMargin: 23
            anchors.rightMargin: 20
            onClicked: {
                backend.get_Translator_text(textField.text)
            }
        }
    }

    ScrollView {
        id: scrollView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: item1.bottom
        anchors.bottom: parent.bottom
        contentWidth: scrollView.contentWidth = root.width
        anchors.topMargin: 15
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 15
        clip: true

        Label {
            id: label
            text: "Youtube Video subtitles"
            anchors.fill: parent
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.WordWrap
            renderType: Text.NativeRendering
            anchors.rightMargin: 30
            textFormat: Text.PlainText
            clip: true
        }
    }

    MessageDialog {
        id: messageDialog
        title: "Yuklab olish xatoligi"
        text: "Ushbu URLdagi videoda taglavha mavjud bo`lmasligi yoki ingliz tilidan boshqa tilda bo`lishi mumkin."
        informativeText: 'Dasturning ushbu versiyasida taglavhalarning asl matni ingliz tilda bo`lgani maqul'
        icon: StandardIcon.Warning

        onAccepted: {
            console.log("And of course you could only agree.")
            Qt.quit()
        }

    }
    Connections{
        target: backend
        function onSetName(name){
            if (name == 'Xato'){
                label.text = 'Ushbu URL orqali taglavhani olish muvafaqqiyatsiz kechdi. Iltimos boshqa urldan foydalaning'
                messageDialog.open()}
            else {
                label.text = name
                }
            }

        }




}
