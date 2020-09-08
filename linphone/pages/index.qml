import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12


ScrollablePage {

     Component.onCompleted: {
        //获取状态
        id_showstate.text=Linphone.getRegstate();

        //端口
        var x=Linphone.getPortinfo();
        id_showport.text="本地呼叫地址(sip:本地ip:"+x+")";

        //摄像头准备
        id_selectvideomodel.clear();
        id_selectvideomodel.append({text:"无视频"})
        var list=Linphone.getListVideoSB();
        id_selectvideomodel.append(list);
        id_selectvideo.currentIndex=0;
        //尺寸
         id_selectvideovmodel.clear();
        // id_selectvideovmodel.append({text:"无视频"})
         var list1=Linphone.getListVideoVZ();
         var cindex=0;
         for(var i=0;i<list1.length;i++){
            if(list1[i].text==="640x480"){cindex=i;
                break;
            }
         }
         id_selectvideovmodel.append(list1);
         id_selectvideos.currentIndex=cindex;

          //Linphone.getCurentIndexsb();
     }

    Column {
        width: parent.width
        RowLayout {
            width: parent.width
            Label{
                id:id_showstate
                text: "注册状态"
            }
            Label {
                id:id_showport
                text: "本地对呼地址(sip:ip:6006)"
            }
        }
        RowLayout {
             spacing: 20
             width: parent.width
             TextField {
                 id: id_touser
                 Layout.fillWidth: true
                 text: "9196"
                 placeholderText: "sip账户"
             }
             Button {
                  highlighted: true
                   text: "《"
                     Layout.fillWidth: true
                     onClicked: {
                        id_touser.text=id_touser.text.substring(0,id_touser.text.length-1);
                    }
             }
        }

        GridLayout {
            columns: 3
            width: parent.width
            Button { text: "1"; font.bold: true;   Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }  }
            Button { text: "2"; font.bold: true;   Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
            Button { text: "3"; font.bold: true;   Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
            Button { text: "4"; font.bold: true; Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
            Button { text: "5"; font.bold: true; Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
            Button { text: "6"; font.bold: true;Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; } }
            Button { text: "7"; font.bold: true; Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
            Button { text: "8"; font.bold: true; Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
            Button { text: "9"; font.bold: true; Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
            Button { text: "*"; font.bold: true;Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; } }
            Button { text: "0"; font.bold: true; Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
            Button { text: "#"; font.bold: true; Layout.fillWidth: true;onClicked:{  id_touser.text=id_touser.text+this.text; }}
       }

        GridLayout {
           columns: 4
           width: parent.width
           ComboBox {
                       id: id_selectvideo;Layout.fillWidth: true
                       model: ListModel {
                           id: id_selectvideomodel
                       }
            }
           ComboBox {
                       id: id_selectvideos;Layout.fillWidth: true
                       model: ListModel {
                           id: id_selectvideovmodel
                       }
            }
           Button {
                 highlighted: true
                 text: "呼    叫"
                  Layout.fillWidth: true
                  onClicked: {
                       stackView.push("qrc:/pages/call.qml",{"id_touser":id_touser.text,"id_vindex":id_selectvideo.currentIndex,id_type:0,id_vsizeindex:id_selectvideos.currentIndex });
                  }
           }
           Button {
                 highlighted: true
                 text: "接    听"
                  Layout.fillWidth: true
                  onClicked: {
                       stackView.push("qrc:/pages/call.qml",{ "id_vindex":id_selectvideo.currentIndex,id_type:1});
                  }
           }
       }
       GridLayout {
           columns: 3
           width: parent.width
           Button { text: "编码设置"; font.bold: true;   Layout.fillWidth: true;onClicked: {
               stackView.push("qrc:/pages/audioset.qml");
               } }

           Button { text: "退     出"; font.bold: true;   Layout.fillWidth: true;onClicked: {
              stackView.pop();
           } }
        }


    }//endColumn


}
