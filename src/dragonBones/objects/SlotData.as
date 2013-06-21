package dragonBones.objects
{
	public final class SlotData
	{
		public var name:String;
		public var parent:String;
		public var zOrder:Number;
		
		private var _displayDataList:Vector.<DisplayData>;
		public function get displayDataList():Vector.<DisplayData>
		{
			return _displayDataList;
		}
		
		public function SlotData()
		{
			_displayDataList = new Vector.<DisplayData>(0, true);
			zOrder = 0;
		}
		
		public function dispose():void
		{
			_displayDataList.fixed = false;
			_displayDataList.length = 0;
			//_displayDataList = null;
		}
		
		public function addDisplayData(displayData:DisplayData, index:int):void
		{
			if(!displayData)
			{
				throw new ArgumentError();
			}
			if (_displayDataList.indexOf(displayData) < 0)
			{
				_displayDataList.fixed = false;
				if(index >= _displayDataList.length)
				{
					_displayDataList.length = index;
				}
				_displayDataList[index] = displayData;
				_displayDataList.fixed = true;
			}
			else
			{
				throw new ArgumentError();
			}
		}
		
		public function getDisplayData(displayName:String):DisplayData
		{
			var i:int = _displayDataList.length;
			while(i --)
			{
				if(_displayDataList[i].name == displayName)
				{
					return _displayDataList[i];
				}
			}
			
			return null;
		}
	}
}