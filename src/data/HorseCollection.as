package data
{

public dynamic class HorseCollection extends Array
{
	public var groups:Object = new Object();
	public function HorseCollection(...args)
	{
		super();
	}
	
//	public function 
	public function getGroup(artist:String, gName:String):Array{
		var groupArray:Array=[];
		//trace("gName", gName)
		if (gName=="") {
			//trace("no group")
			return groupArray
		}
		for (var i:int = 0; i < length; i++)
		{	
			if (this[i].artist==artist && this[i].group==gName) groupArray.push(this[i])
		}	
		return groupArray
	}
	
	public function sortGroups():void{
		for (var i:int = 0; i < this.length; i++)
		{
			var currentGroup = this[i].group
			if (currentGroup!=""){
				if (!groups[currentGroup]){
					groups[currentGroup] = new Array()
					groups[currentGroup].push(this[i])
				}else{
					groups[currentGroup].push(this[i])
				}
			} 	
		}
	}
	
	public function isGroupKey(artist:String, gName:String, image:String):Boolean{
		var g = getGroup(artist, gName)
		//trace("IS FIRST of GROUP")
		return (image == g[0].image)
	}
}

}

