﻿package data{import data.HorseCollection;//import com.studioshitless.Utilities.Utils;public class Global extends Object{	/*globally shared*/		public static var configData:Object = new Object();	public static var videoPlaying=false	public static var introVideo:String = "honeybees.mp4"	public static var videos:Array = ["honeybees.mp4","honeybees.mp4","honeybees.mp4","honeybees.mp4"]	public static var currentVideoIndex:int = -1;	public static var horseCollection:HorseCollection = new HorseCollection()	//screenText props are ["Attractor", "LanguageSelect", "ButtonE", "ButtonA", "IntroInstruction", "Intro1", "Intro2", "Intro3", "Intro4"];	public static var screenTextE = new Object()	public static var screenTextA = new Object()	public static var lang:String = "A"			public function Global()	{		super();		trace("Global")	}    }}