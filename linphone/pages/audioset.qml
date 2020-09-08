/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
ScrollablePage {
     Component.onCompleted: {

        id_sw1.checked=true;
        var codecs=Linphone.getListCodes();
       id_sw1.text=codecs[0].text;id_sw1.checked=(codecs[0].enable===1?true:false);
          id_sw2.text=codecs[1].text;id_sw2.checked=(codecs[1].enable===1?true:false);
          id_sw3.text=codecs[2].text;id_sw3.checked=(codecs[2].enable===1?true:false);
          id_sw4.text=codecs[3].text;id_sw4.checked=(codecs[3].enable===1?true:false);
          id_sw5.text=codecs[4].text;id_sw5.checked=(codecs[4].enable===1?true:false);
          id_sw6.text=codecs[5].text;id_sw6.checked=(codecs[5].enable===1?true:false);
          id_sw7.text=codecs[6].text;id_sw7.checked=(codecs[6].enable===1?true:false);
          id_sw8.text=codecs[7].text;id_sw8.checked=(codecs[7].enable===1?true:false);
          id_sw9.text=codecs[8].text;id_sw9.checked=(codecs[8].enable===1?true:false);
          id_sw10.text=codecs[9].text;id_sw10.checked=(codecs[9].enable===1?true:false);
          id_sw11.text=codecs[10].text;id_sw11.checked=(codecs[10].enable===1?true:false);
          id_sw12.text=codecs[11].text;id_sw12.checked=(codecs[11].enable===1?true:false);
          id_sw13.text=codecs[12].text;id_sw13.checked=(codecs[12].enable===1?true:false);
            id_sw14.text=codecs[13].text;id_sw14.checked=(codecs[13].enable===1?true:false);
     }

     Column {
         width: 300
         topPadding: 20
         ColumnLayout {
             spacing:20
             width: 300
             anchors.horizontalCenter: parent.horizontalCenter
             Label {
                 text: "音频设置"
                 Layout.fillWidth: true
                 horizontalAlignment: Qt.AlignHCenter
             }
         }
         GridLayout {
             columns: 3
             width: 300
             anchors.horizontalCenter: parent.horizontalCenter
             Switch{id:id_sw1;checked: false;onClicked: {       Linphone.codecset(0,this .checked?1:0 ) ;  }   }
              Switch{id:id_sw2;checked: false;onClicked: { Linphone.codecset(1, id_sw2.checked?1:0 );  }  }
             Switch{id:id_sw3;checked: false ;onClicked: { Linphone.codecset(2, id_sw3.checked?1:0 );  }}
             Switch{id:id_sw4;checked: false ;onClicked: { Linphone.codecset(3, id_sw4.checked?1:0 );  }}
             Switch{id:id_sw5;checked: false;onClicked: { Linphone.codecset(4, id_sw5.checked?1:0 );  } }
             Switch{id:id_sw6;checked: false ;onClicked: { Linphone.codecset(5, id_sw6.checked?1:0 );  }}
             Switch{id:id_sw7;checked: false;onClicked: { Linphone.codecset(6, id_sw7.checked?1:0 );  } }
             Switch{id:id_sw8;checked: false;onClicked: { Linphone.codecset(7, id_sw8.checked?1:0 );  } }
             Switch{id:id_sw9;checked: false ;onClicked: { Linphone.codecset(8, id_sw9.checked?1:0 );  }}
             Switch{id:id_sw10;checked: false;onClicked: { Linphone.codecset(9, id_sw10.checked?1:0 );  } }
             Switch{id:id_sw11;checked: false;onClicked: { Linphone.codecset(10, id_sw11.checked?1:0 );  } }
             Switch{id:id_sw12;checked: false ;onClicked: { Linphone.codecset(11, id_sw12.checked?1:0 );  }}
         }
         ColumnLayout {
             spacing:20
             width: 300
             anchors.horizontalCenter: parent.horizontalCenter
             Button {
                 text: "回音消除"
                 highlighted: true
                 Layout.fillWidth: true
                 onClicked: {
                     Linphone.huiyixiaochu();
                 }
             }
         }
         ColumnLayout {
             spacing:20
             width: 300
             anchors.horizontalCenter: parent.horizontalCenter
             Label {  topPadding: 20
                 text: "视频设置"
                 Layout.fillWidth: true
                 horizontalAlignment: Qt.AlignHCenter
             }
         }
         GridLayout {
             columns: 3
             width: 300
             anchors.horizontalCenter: parent.horizontalCenter
           Switch{id:id_sw13;checked: false;onClicked: { Linphone.codecset(12, id_sw13.checked?1:0 );  } }
            Switch{id:id_sw14;checked: false ;onClicked: { Linphone.codecset(13, id_sw14.checked?1:0 );  }}
         }

         ColumnLayout {
             spacing:20
             width: 300
             anchors.horizontalCenter: parent.horizontalCenter
             Button {
                 text: "返    回"
                 highlighted: true
                 Layout.fillWidth: true
                 onClicked: {
                     stackView.pop();
                 }
             }
         }
     }
}
