import QtQuick 2.0
import QtQuick.Controls 1.1
import "curr.js" as Curr

Rectangle
{
    id: base
    width: 150
    height: 230
    color: "#7b9095"

    Text
    {
        width: 150
        id: heading
        anchors.horizontalCenter:  parent.horizontalCenter
        text: "Currency Converter"
    }


            TextEdit
        {
            x: 30
            y: 80
            id:inField
            text: "Euro"
        }

        TextEdit
        {
            x: 30
            y: 109
            id:outField
            text: "Rupee"
        }

    Text
    {
        id: result
        anchors.right:  parent.right
        anchors.bottom: parent. bottom
        text: ""
    }

    Button
    {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        width: 26
        text: "?"
        onClicked:
        {
            Curr.readapi({
                first: inField.text,
                second: outField.text,

                success: function(conversion) { // Anonymous function
                    console.log("success");
                    result.text = conversion;
                },

                error: function(errcode)
                {
                    console.log("error occured: " + errcode);
                }
            });
        }
    }
}

