function checkBrowser(){
	this.ver=navigator.appVersion
	this.dom=document.getElementById?1:0
	this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom)?1:0;
	this.ie4=(document.all && !this.dom)?1:0;
	this.ns5=(this.dom && parseInt(this.ver) >= 5) ?1:0;
	this.ns4=(document.layers && !this.dom)?1:0;
	this.bw=(this.ie5 || this.ie4 || this.ns4 || this.ns5)
	return this
}
bw=new checkBrowser()

numdrag=5

function dragObj(obj,nest){
	nest=(!nest) ? '':'document.'+nest+'.'										
   	this.css=bw.dom? document.getElementById(obj).style:bw.ie4?document.all[obj].style:bw.ns4?eval(nest+"document.layers." +obj):0;		
	this.evnt=bw.dom? document.getElementById(obj):bw.ie4?document.all[obj]:bw.ns4?eval(nest+"document.layers." +obj):0;		
	this.x=(bw.ns4 || bw.ns5)? this.css.left:this.css.pixelLeft;
	this.y=(bw.ns4 || bw.ns5)? this.css.top:this.css.pixelTop;			
	this.moveIt=b_moveIt;
	this.drag=false;
	this.clickedX=0; this.clickedY=0	
	return this
}
function b_moveIt(x,y){
	this.x=x; this.y=y;
	this.css.left=this.x
	this.css.top=this.y
}
function mmover(e){
	tp=(bw.ns5 || bw.ns4)?e.target.name:window.event.srcElement.tagName
	if(tp=="DIV" || bw.ns4 || bw.ns5){
		num=(bw.ns4 || bw.ns5)?e.target.id.substr(7,2):(bw.ie4 || bw.ie5)?window.event.srcElement.id.substr(7,2):0
		oDrag[parseInt(num)].isOver=true
	}
}
function mmout(e){
	tp=(bw.ns5 || bw.ns4)?e.target.name:window.event.srcElement.tagName
	if(tp=="DIV" || bw.ns4 || bw.ns5){
		num=(bw.ns4)?e.target.id.substr(7,2):(bw.ie4 || bw.ie5)?window.event.srcElement.id.substr(7,2):0
		if(bw.ns5) for(var i=0; i<oDrag.length;i++){oDrag[i].isOver=false}	
		else oDrag[parseInt(num)].isOver=false
	}
}
function mup(){
	for(var i=0; i<oDrag.length;i++){
		if(oDrag[i].isOver) {
			oDrag[i].drag=false
		}	
	}
}
function mdown(num){
	x=(bw.ns4 || bw.ns5)?num.pageX:event.x
    y=(bw.ns4 || bw.ns5)?num.pageY:event.y
	for(var i=0; i<oDrag.length;i++){
		if(oDrag[i].isOver) {
			oDrag[i].drag=true
			oDrag[i].clickedX=x-oDrag[i].x
			oDrag[i].clickedY=y-oDrag[i].y
			cZIndex++
			oDrag[i].css.zIndex=cZIndex
		}
	}
}
function mmove(e){
	x=(bw.ns4 || bw.ns5)?e.pageX:event.x
    y=(bw.ns4 || bw.ns5)?e.pageY:event.y
	for(var i=0; i<oDrag.length;i++){
		if(oDrag[i].drag){
			oDrag[i].moveIt(x-oDrag[i].clickedX,y-oDrag[i].clickedY)
		}
	}
	return false      
}

cZIndex=10

function dragInit(){
	oDrag=new Array()
	for(i=0;i<numdrag;i++){
		oDrag[i]=new dragObj('divDrag'+i)
		oDrag[i].evnt.onmouseover=mmover;
		oDrag[i].evnt.onmouseout=mmout;
	}
	if(bw.ns4) document.captureEvents(Event.MOUSEMOVE | Event.MOUSEDOWN | Event.MOUSEUP)
	document.onmousedown=mdown
	document.onmouseup=mup
	document.onmousemove=mmove;
	//HERE YOU CAN MOVE THE LAYERS TO A POSITION IF YOU WANT TO BEFORE THEY ARE SHOWN.
	oDrag[0].moveIt(450,225)
	oDrag[1].moveIt(600,300)
	oDrag[2].moveIt(600,215)
	oDrag[3].moveIt(525,275)
	oDrag[4].moveIt(475,375)
	
	//Showing the layers
	for(i=0;i<numdrag;i++){
			oDrag[i].css.visibility='visible'
	}
}