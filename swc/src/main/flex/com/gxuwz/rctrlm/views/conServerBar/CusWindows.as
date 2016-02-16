/**
 * Created by hy2 on 2016/1/24.
 */
package com.gxuwz.rctrlm.views.conServerBar {
import flash.events.MouseEvent;

import mx.containers.TitleWindow;
import mx.controls.Button;
import mx.core.FlexGlobals;


public class CusWindows extends TitleWindow{
    public function CusWindows() {
        super ();
        this.showCloseButton=true;
    }

    protected var maxSizeButton:Button;//max size button
    protected var minSizeButton:Button; //min size Button

    //normal
   // protected var normalSize:int;
    protected var normalX:int;
    protected var normalY:int;
    protected var normalWidth:int;
    protected var normalHeight:int;

    protected var winState:String="normal";

    override protected function createChildren():void{

        super .createChildren();
        //add button
        this.maxSizeButton=new Button();
        this.minSizeButton=new Button();
        this.maxSizeButton.width=this.maxSizeButton.height=16;
        this.maxSizeButton.y=5;

        //add event
        this.maxSizeButton.addEventListener(MouseEvent.CLICK, onMaxSize);
        this.titleBar.addChild(this.maxSizeButton);

        //create min size button
        this.minSizeButton=new Button();
        this.minSizeButton.width=16;
        this.minSizeButton.height=16;
        this.minSizeButton.y=5;

        //add event
        this.minSizeButton.addEventListener(MouseEvent.CLICK, onMinSize);
        this.titleBar.addChild(this.minSizeButton);
    }

    protected function onMaxSize(e:MouseEvent):void{
        if(winState=="normal"){
            normalX=this.x;
            normalY=this.y;
            normalHeight=this.height;
            normalWidth=this.width;

            //set to max size
            this.x=500;
            this.y=500;

            this.percentHeight=40;
            this.percentWidth=60;

            this.winState="max";
        }else if(this.winState=="max"){
            this.x=this.normalX;
            this.y=this.normalY;
            this.width=this.normalWidth;
            this.height=this.normalHeight;

            //normal
            this.winState="normal";
        }else if(this.winState=="min"){
            this.x=this.normalX;
            this.y=this.normalY;
            this.width=this.normalWidth;
            this.height=this.normalHeight;
            //normal
            this.winState="normal";
        }
    }

    protected function onMinSize(e:MouseEvent):void{
//        this.visible=false;
        this.x=this.parentApplication.x+this.parentApplication.width-320;
        this.y=this.parentApplication.y+this.parentApplication.height-250;
        this.width=250;
        this.height=60;
        this.winState="min";
    }

    override protected function layoutChrome(unscaledWidth:Number,
                                             unscaledHeight:Number):void
    {
        super.layoutChrome(unscaledWidth,unscaledHeight);
        //设置两个新添的按钮的位置
        this.maxSizeButton.x=this.titleBar.width-43;
        this.minSizeButton.x=this.titleBar.width-60;

        //调整状态文本的位置，左移一段位置
        this.statusTextField.x-=32;
    }
}
}
