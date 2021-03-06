
local rotationCorrection = 15


local fills = { 
	[0] = {179,164,87 ,255},
	[1] = {221,71,31 ,255},
	[2] = {224,153,144 ,255},
	[3] = {172,30,38 ,255},
	[4] = {188,62,97 ,255},
	[5] = {141,41,106 ,255},
	[6] = {14,61,145 ,255},
	[7] = {40,111,72 ,255},
	[8] = {47,180,185 ,255},
	[9] = {98,60,41 ,255},
	[10] = {111,108,83 ,255},
	[11] = {120,81,39 ,255},
}

local fill = display.newRect(0,0, display.stageWidth,display.stageHeight)
fill:setFillColor(128, 128,128,255)

local backplate = display.newImage("underring.png")
backplate.xOrigin=160
backplate.xScale=.95
backplate.yScale=.95

local background = display.newImage("background.png")
background.xOrigin=160
background.rotation=rotationCorrection


local pie = display.newImage("topplate-outer.png")
pie.xOrigin=160
pie.yOrigin=256
pie.xScale=0.55
pie.yScale=0.55

local seconds_pie = display.newImage("topplate-inner.png")
seconds_pie.xOrigin=160
seconds_pie.yOrigin=256
seconds_pie.xScale=0.55
seconds_pie.yScale=0.55

local _12HOURS = 12*60
local function getRotationForTime(h,m,dst)
	--h=h - (dst and 1 or 0)
	h=h%12
	m=m+h*60
	
	local ratio = m/_12HOURS
	
	return 360*ratio - rotationCorrection
end

local function getRotationForTimeSec(s)
	local ratio = s / 60
	
	return 360*ratio - rotationCorrection
end

local xTime = {time=500 }
local xSec = {time=0, isVisible = true }

local function displayMin(tm)
	xTime.rotation = getRotationForTime(tm.hour, tm.min, tm.isdst)
	
	transition.to(pie, xTime) 
	transition.to(seconds_pie, xTime) 
	
	fill:setFillColor(unpack(fills[tm.hour%12]))
	
end	
	
local function displaySec(tm)
	xSec.rotation = getRotationForTimeSec(tm.sec)
	
	transition.to(seconds_pie,  xSec) 
end	
	

local function displayTime()
	local tm = os.date("*t")
	

	displayMin(tm)
	
	--displaySec(tm)
end


local frameCount = 0

-- This function is called for every frame
-- 
--**********************************************
local function updateCount()
--**********************************************
        frameCount = frameCount+1
         
        if ((frameCount % 15) == 0) then
			displayTime()
        end
        
end -- updateCount
 
Runtime:addEventListener( "enterFrame", updateCount )

--local function onMinutesDrawn()
--	timer.performWithDelay( 500, displayTime )
--end

--xTime.onComplete = onMinutesDrawn

displayTime()

local function system_event(event)
	if event.type == "applicationStart" or event.type== "applicationResume" then
		system.setIdleTimer(false)
	elseif event.type == "applicationSuspend" then
		system.setIdleTimer(true)
	end
end
		
		
Runtime:addEventListener( "system", system_event )

