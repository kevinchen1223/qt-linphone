import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.12


ApplicationWindow {
     signal callState(var msg) //发送出去给子页面
    function tishide(msg){
        id_tishi.text=msg
        id_tishi.open()
    }
    function onRegstatechange(regmsg){
        if( regmsg==="Registration successful"){
            stackView.push("qrc:/pages/index.qml");
        } else{
             tishide(regmsg);
        }
    }
    function onCallstatechange(callstatemsg){//接收响应的
        callState(callstatemsg);
    }
    id: window
    x: (Screen.width-800) / 2 //居中
    y:(Screen.height-480) / 2
    width: 800
    height: 480
    visible: true
    title: "Qt Quick2 +Linphone 4.4 "
    Settings {
           id: settings
           property string style: "Material"
    }
    ToolTip{
                id:id_tishi
                text: "按钮被点击咯"
                delay: 200
                timeout: 1000
    }

    StackView {
            id: stackView
            anchors.fill: parent

            initialItem: Pane {
                Column {
                        width: parent.width
                        topPadding: 40
                        ColumnLayout {
                            spacing:20
                            width: 300
                            anchors.horizontalCenter: parent.horizontalCenter

                            Label {

                                text: "Linphone Sip登陆"
                                Layout.fillWidth: true
                                horizontalAlignment: Qt.AlignHCenter
                            }
                            TextField {

                                id: id_user
                                Layout.fillWidth: true
                                placeholderText: "sip账户"
                            }
                            TextField {
                                id: id_pwd
                                Layout.fillWidth: true
                                placeholderText: "sip密码"
                            }
                            TextField {
                                id: id_host
                                Layout.fillWidth: true
                                placeholderText: "sip域名:端口"
                            }
                            Row { // The "Row" type lays out its child items in a horizontal line
                            Layout.alignment: Qt.AlignCenter
                            spacing: 20
                            Button {
                                id: button
                                text: "登    陆"
                                highlighted: true
                                objectName:"testButton"
                                Layout.fillWidth: true
                                onClicked:{
                                    if(id_user.text==""||id_pwd.text==""||id_host.text==""){ tishide("信息不能为空"); return;}
                                     Linphone.submitregField(id_user.text,id_pwd.text,id_host.text)

                                }
                            }
                            Button {
                                id: button1
                                text: "跳    过"
                                highlighted: true
                                objectName:"testButton1"
                                Layout.fillWidth: true
                                onClicked:{
                                    stackView.push("qrc:/pages/index.qml");
                                }
                            }
                            }
                        }

                        ColumnLayout {
                            width: 500
                            spacing:20
                            anchors.horizontalCenter: parent.horizontalCenter
                            Label {
                                text: "*sip走代理模式或本地局域网可支持1080p\n*目前未找到将视频绑定到qml局部控件gui可以\n*本程序基于qt xml 和linphone开发主要是体验c++漂亮ui\n*交流群(261074724)"
                                Layout.fillWidth: true
                            }
                        }
                }


                //end

            }
        }



}



