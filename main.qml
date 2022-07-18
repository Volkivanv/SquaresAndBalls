import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    title: qsTr("Make transition")
    Rectangle{
        id: scene
        anchors.fill: parent
        state: "InitialState"

        Rectangle{
            id: leftRectangle
            Text{
                id: mv
                anchors.centerIn: parent
                text: "move"
            }

            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            //
            MouseArea{
                anchors.fill:parent

                onClicked:{
                    if(ball.x<=rightRectangle.x){
                        ball.x+=30
                        scene.state = "OtherState"
                    }else{
                        scene.state = "InitialState"
                    }


                }

            }
        }
        Rectangle{
            id: rightRectangle
            Text{
                id: rt
                anchors.centerIn: parent
                text: "return"
            }

            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            MouseArea{
                anchors.fill:parent
                onClicked:scene.state = "InitialState"
            }
        }
        Rectangle{
            id: ball
            color:"darkgreen"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width/2
        }
        states:[
            State{
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x:leftRectangle.x + 5
                }
            } ,
            State{
                name: "OtherState"
                PropertyChanges {
                    target: ball
                    x: ball.x

                }

            }

        ]
            transitions:[
                Transition{
                from: "OtherState"
                to: "InitialState"

                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.InCirc
                }

            }
    ]


    }
}
