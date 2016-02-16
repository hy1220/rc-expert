/**
 * Created by user on 2015/8/24.
 */
package com.gxuwz.rctrlm.model {
import com.gxuwz.rctrlm.events.*;

import spark.components.Alert;

public class Services {

    public function Services(){

    }
    //定义几个公共变量。供外部程序访问

    [Bindable] public var _msg:String="";
    [Bindable] public var _remoteUser:String="";

    public function onRelay(action:String,user:String):void{

        trace(user+" call  you  " +action);
        var evt:ConServerBarEvent =new ConServerBarEvent(ConServerBarEvent.PLAY_VIDEO_EVENT);//尝试连连服务
        evt.remoteUser=user;
        evt.action=action;
        EventDispatcherFactory.getEventDispatcher().dispatchEvent(evt);

    }

    public function showMsg(fromUser:String,msg:String):void{
        trace(fromUser+"=====fromUser");
        trace(msg+"=====msg");
        var event:ConServerBarEvent =new ConServerBarEvent(ConServerBarEvent.SHOW_MESSAGE_EVENT);//派发显示信息事件
        event.remoteUser=fromUser;
        event.data=msg;
        EventDispatcherFactory.getEventDispatcher().dispatchEvent(event);
    }


    public function onSendCommand(commandStr:String,expertFrom:String):void{
      Alert.show("Command String"+commandStr+" expertfrom "+expertFrom);
    }

}
}
