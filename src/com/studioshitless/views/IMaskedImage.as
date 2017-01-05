package com.studioshitless.views
{
import com.studioshitless.events.ImageLoaderEvent;
import flash.events.MouseEvent;

public interface IMaskedImage
{
	function zoomImage(e:MouseEvent=null):void;	
	function setZoomProps(zoomX, zoomY, zoomWidth, zoomHeight):void;	
	function finishImageZoom():void;
	function loadImage(filePath:String):void;
	function addMask():void;	
	function onImageLoaded(e:ImageLoaderEvent):void;	
	function scaleTo(w:Number, h:Number, masked:Boolean=true):void;
	function scaleToWidth(w:Number, h:Number,  masked:Boolean=true):void;		
	function reset():void;	
	function dispose():void;	
	function get ratio():Number;	
	function removeMask():void;	
}

}