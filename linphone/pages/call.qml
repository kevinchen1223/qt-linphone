import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ScrollablePage {

    property string id_touser;
    property string id_vindex;
    property string  id_type;
   property string  id_vsizeindex;
    property string  id_cnum;
    Component.onCompleted: {
        if(id_type==0){
            if( id_touser!=null&&id_touser!="" ){
                  Linphone.callSip(id_touser,id_vindex,id_vsizeindex);
            }
        }else{
            Linphone.answerSip(id_vindex,id_vsizeindex);
        }
        id_calltimer.start();
        window.callState.connect(getCallstate);
        id_cnum=0;
    }
   function getCallstate(callstatemsg){
       if(id_callstate!=null){//有可能已经停止
           console.log(callstatemsg);
           id_callstate.text=callstatemsg;
            if(callstatemsg==="Streams running"){
            }else if(callstatemsg==="Call terminated" || callstatemsg=="Call ended" || callstatemsg=="Call released"  ){
               if(id_calltimer.running){id_calltimer.stop(); } if(id_cnum==0) {stackView.pop();  id_cnum++; }

           }
       }
   }
    Column {
        Timer {
                id:id_calltimer;
                repeat: true;
                interval: 1000;
                onTriggered: {
                    var avcallstate=Linphone.getCurentCallstate();
                    if(avcallstate.length>0){
                         id_audio1.text= "音频编码信息:"+avcallstate[0]+"/"+avcallstate[2]+"/"+avcallstate[1];
                        id_audio2.text= "上载宽带(kbits/s):"+avcallstate[3];
                        id_audio3.text= "下载宽带(kbits/s):"+avcallstate[4];
                        id_audio4.text= "ICE Connectivity:"+avcallstate[5];
                        id_audio5.text= "发送损失率(%):"+avcallstate[6];
                        id_audio6.text= "接收损失率(%):"+avcallstate[7];
                        id_audio7.text= "回音消除较正(ms):"+avcallstate[8];

                        if(id_vindex>0 && avcallstate[9] ){
                            id_video1.text="视频编码信息:"+avcallstate[9]+"/"+avcallstate[10];
                            id_video2.text="上传宽带(kbits/s):"+avcallstate[11] ;
                            id_video3.text="下载传宽带(kbits/s):"+avcallstate[12] ;
                            id_video4.text="Estimated Download Bandwidth(kbits/s):"+avcallstate[13] ;
                            id_video5.text="ICE Connectivity:"+avcallstate[14] ;
                            id_video6.text="发送损失率(%):"+avcallstate[15] ;
                            id_video7.text="接收损失率(%):"+avcallstate[16] ;
                            id_video8.text="发送分辨率:"+avcallstate[17] ;
                            id_video9.text="接收分辨率:"+avcallstate[18] ;
                            id_video10.text="Send Video Fps:"+avcallstate[19] ;
                            id_video11.text="Recevied Video Fps:"+avcallstate[20] ;
                        }
                    }
                }
        }
        width: parent.width
        spacing:5
        RowLayout {
            width: parent.width
            Label {
                    Layout.alignment:  Qt.AlignHCenter
                    wrapMode: Label.Wrap
                    text: id_touser
             }
        }
        RowLayout {
            width: parent.width
            Label {
                   id:id_callstate
                    Layout.alignment:  Qt.AlignHCenter
                    wrapMode: Label.Wrap
                    text: id_type==0?"Outgoing call in progress":"Incoming call received"
             }
        }
        RowLayout { width: parent.width ;  Label { font.pixelSize:12;id: id_audio1; Layout.alignment:  Qt.AlignHCenter;  wrapMode: Label.Wrap ;  text: "音频编码信息"    }  }
        RowLayout {width: parent.width; Label {font.pixelSize:12; id: id_audio2; Layout.alignment:  Qt.AlignHCenter;   wrapMode: Label.Wrap ;  text: "上传宽带"    }    }
        RowLayout { width: parent.width ;Label { font.pixelSize:12; id: id_audio3 ;Layout.alignment:  Qt.AlignHCenter ; wrapMode: Label.Wrap;  text: "下载宽带"    }   }
        RowLayout { width: parent.width ; Label {font.pixelSize:12;id: id_audio4  ;Layout.alignment:  Qt.AlignHCenter  ;wrapMode: Label.Wrap;  text: "ICE Connectivity"    }  }
        RowLayout { width: parent.width;Label {font.pixelSize:12;id: id_audio5; Layout.alignment:  Qt.AlignHCenter;  wrapMode: Label.Wrap;  text: "发送损失率" }}
        RowLayout { width: parent.width;Label { font.pixelSize:12;id: id_audio6;  Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap;text: "接收损失率"    }   }
        RowLayout { width: parent.width;Label {font.pixelSize:12; id: id_audio7; Layout.alignment:  Qt.AlignHCenter; wrapMode: Label.Wrap;text: "回音消除较正"    }   }

        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video1;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "视频编码信息"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video2;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "上传宽带"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video3;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "下载宽带"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video4;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "Estimated Download Bandwidth"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video5;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "ICE Connectivity"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video6;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "发送损失率"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video7;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "接收损失率"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video8;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "发送分辨率"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video9;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "接收分辨率"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video10;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "Send Video Fps"     }  }
        RowLayout {visible: id_vindex>0?true:false ; width: parent.width;  Label { id: id_video11;font.pixelSize:12;Layout.alignment:  Qt.AlignHCenter;wrapMode: Label.Wrap; text: "Recevied Video Fps"     }  }


        RowLayout {
            width: parent.width
            height:id_vindex>0?5:100
        }
        RowLayout {
            width: parent.width
            Button { text: "麦克风静音切换"; highlighted: true;font.bold: true;  onClicked: {
                Linphone.callmic();
             } }
            Button { text: "挂断"; font.bold: true; highlighted: true;Layout.fillWidth: true;onClicked: {
             Linphone.callgua();
           } }
        }
    }
}
