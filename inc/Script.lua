--[[

]]

function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
	-- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

function KaraJoinChannel(msg)
if redis:get(max..'4DaySleep') then
local url  = https.request('https://api.telegram.org/bot940044754:AAGY1zvFOrPoYdIUnAgHtHHpI-quJP5QTQM/getchatmember?chat_id=@a_l3nzi&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
bd = '??????ÇáÚÖæ ['..USERNAME..'](tg://user?id='..msg.sender_user_id_..') \n???áÃÓÊÎÏÇã ÇáÈæÊ Úáíß ÇáÇÔÊÑÇß È ŞäÇÉ ÇáÓæÑÓ @a_l3nzi'
sendMsg(msg.chat_id_,msg.id_,bd)
end,nil)
return false
else
return true
end
else
return true
end
end

function lock_photos(msg)
if not msg.Director then 
return "??*?* åĞÇ ÇáÇãÑ íÎÕ {ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??"
end
redis:set(max.."getidstatus"..msg.chat_id_, "Simple")
return  "??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* Êã ÊÚØíá ÇáÇíÏí ÈÇáÕæÑå  \n?" 
end 
function unlock_photos(msg)
if not msg.Director then
return "??*?* åĞÇ ÇáÇãÑ íÎÕ {ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??"
end
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
return  "??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* Êã ÊİÚíá ÇáÇíÏí ÈÇáÕæÑå \n?" 
end
function cmds_on(msg)
if not msg.Creator then return "??*?* åĞÇ ÇáÇãÑ íÎÕ {ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??"
end
redis:set(max..'lock:kara:'..msg.chat_id_,'on')
return "??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* Êã ÊÚØíá ÇáÑİÚ İí ÇáãÌãæÚå \n?"
end
function cmds_off(msg)
if not msg.Creator then return "??*?* åĞÇ ÇáÇãÑ íÎÕ {ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??"
end
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return "??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* Êã ÊİÚíá ÇáÑİÚ İí ÇáãÌãæÚå \n?"
end
function cmdss_on(msg)
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??"
end
redis:set(max..'lock:karaa:'..msg.chat_id_,'on')
return "??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* Êã ÊÚØíá ÇáÊÓáíå \n?"
end
function cmdss_off(msg)
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??"
end
redis:set(max..'lock:karaa:'..msg.chat_id_,'off')
return "??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* Êã ÊİÚíá ÇáÊÓáíå\n?"
end

function lockjoin(msg)
if not msg.Admin then return "??*?* åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??"
end
redis:set(max..'lock:join:'..msg.chat_id_,true)
return "*??????*?* ÃåáÇ ÚÒíÒí *"..msg.TheRankCmd.."*\n??*?* Êã Şİá ÇáÏÎæá ÈÇáÑÇÈØ \n?*" 

end
function unlockjoin(msg)
if not msg.Admin then return "??*?* åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??"
end
redis:del(max..'lock:join:'..msg.chat_id_)
return "*??????*?* ÃåáÇ ÚÒíÒí *"..msg.TheRankCmd.."*\n??*?* Êã İÊÍ ÇáÏÎæá ÈÇáÑÇÈØ \n?*" 
end


local function imax(msg,MsgText)
if msg.type ~= 'pv' then

if MsgText[1] == "ÊİÚíá" and not MsgText[2] then
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end
if MsgText[1] == "ÊÚØíá" and not MsgText[2] then
return modrem(msg) 
end
if MsgText[1] == "ÊİÚíá ÇáÇíÏí ÈÇáÕæÑå" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "ÊÚØíá ÇáÇíÏí ÈÇáÕæÑå" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "ÊÚØíá ÇáÑİÚ" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "ÊİÚíá ÇáÑİÚ" and not MsgText[2] then
return cmds_off(msg) 
end
if MsgText[1] == "ÊÚØíá ÇáÊÓáíå" and not MsgText[2] then
return cmdss_on(msg)  
end
if MsgText[1] == "ÊİÚíá ÇáÊÓáíå" and not MsgText[2] then
return cmdss_off(msg) 
end

if MsgText[1] == "Şİá ÇáÏÎæá ÈÇáÑÇÈØ" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "İÊÍ ÇáÏÎæá ÈÇáÑÇÈØ" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'ÔÍä' and MsgText[2] then
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(max..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'???????Êã ÔÍä ÇáÇÔÊÑÇß Çáì `'..MsgText[2]..'` íæã   ... ????')
sendMsg(SUDO_ID,0,'???????Êã ÔÍä ÇáÇÔÊÑÇß Çáì `'..MsgText[2]..'` íæã   ... ????\n????????İí ãÌãæÚå  » »  '..redis:get(max..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'???????ÚÒíÒí ÇáãØæÑ ???\n???????ÔÍä ÇáÇÔÊÑÇß íßæä ãÇ Èíä íæã Çáì 1000 íæã İŞØ ??')
end 
return false
end

if MsgText[1] == 'ÇáÇÔÊÑÇß' and MsgText[2] then 
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
if MsgText[2] == '1' then
redis:setex(max..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'???????Êã ÊİÚíá ÇáÇÔÊÑÇß   ????\n??? ÇáÇÔÊÑÇß » `30 íæã`  *(ÔåÑ)*')
sendMsg(SUDO_ID,0,'???????Êã ÊİÚíá ÇáÇÔÊÑÇß  ????\n??? ÇáÇÔÊÑÇß » `30 íæã`  *(ÔåÑ)*')
end
if MsgText[2] == '2' then
redis:setex(max..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'???????Êã ÊİÚíá ÇáÇÔÊÑÇß   ????\n??? ÇáÇÔÊÑÇß » `90 íæã`  *(3 ÇÔåÑ)*')
sendMsg(SUDO_ID,0,'???????Êã ÊİÚíá ÇáÇÔÊÑÇß   ????\n??? ÇáÇÔÊÑÇß » `90 íæã`  *(3 ÇÔåÑ)*')
end
if MsgText[2] == '3' then
redis:set(max..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'???????Êã ÊİÚíá ÇáÇÔÊÑÇß   ????\n??? ÇáÇÔÊÑÇß » `ãİÊæÍ`  *(ãÏì ÇáÍíÇÉ)*')
sendMsg(SUDO_ID,0,'???????Êã ÊİÚíá ÇáÇÔÊÑÇß   ????\n??? ÇáÇÔÊÑÇß » `ãİÊæÍ`  *(ãÏì ÇáÍíÇÉ)*')
end 
return false
end


if MsgText[1] == 'ÇáÇÔÊÑÇß' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local check_time = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*ãÜİÜÊÜæÍ *??\n?' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '???`ÈÇŞí ãä ÇáÇÔÊÑÇß ` » » * \n ??? '..sec..'* ËÇäíå'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '???`ÈÇŞí ãä ÇáÇÔÊÑÇß ` » » '..min..' *ÏŞíŞå æ * *'..sec..'* ËÇäíå'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '???`ÈÇŞí ãä ÇáÇÔÊÑÇß ` » » * \n ??? '..hours..'* ÓÇÚå æ *'..min..'* ÏŞíŞå æ *'..sec..'* ËÇäíå'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '???`ÈÇŞí ãä ÇáÇÔÊÑÇß ` » » * \n ??? '..day..'* íæã æ *'..hours..'* ÓÇÚå æ *'..min..'* ÏŞíŞå æ *'..sec..'* ËÇäíå'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '???`ÈÇŞí ãä ÇáÇÔÊÑÇß ` » » * \n ??? '..month..'* ÔåÑ æ *'..day..'* íæã æ *'..hours..'* ÓÇÚå æ *'..min..'* ÏŞíŞå æ *'..sec..'* ËÇäíå'
elseif tonumber(check_time) > 31536000 then
remained_expire = '???`ÈÇŞí ãä ÇáÇÔÊÑÇß ` » » * \n ??? '..year..'* Óäå æ *'..month..'* ÔåÑ æ *'..day..'* íæã æ *'..hours..'* ÓÇÚå æ *'..min..'* ÏŞíŞå æ *'..sec..'* ËÇäíå' end
return remained_expire
end


if MsgText[1] == "ÇáãÌãæÚå" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(max..'group:name'..msg.chat_id_) or '')
redis:set(max..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"??????? ? ãÜÚÜáæãÜÇÊ ÇáÜãÜÌÜãæÚÜå ?\n\n"
.."*???* ÚÏÏ ÇáÇÚÜÖÜÇÁ ? ? *"..data.member_count_.."* ?"
.."\n*???* ÚÏÏ ÇáãÍÙÜæÑíÜä ? ? *"..data.kicked_count_.."* ?"
.."\n*???????* ÚÏÏ ÇáÇÏãÜäÜíÜå ? ? *"..data.administrator_count_.."* ?"
.."\n*??* ÇíÏí ÇáãÌãæÚå ? ?"..msg.chat_id_.."?"
.."\n\n??ÇáÇÓã ? ?  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ?\n"
)
end,nil) 
return false
end

if MsgText[1] == "ÇáÊİÇÚá" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "ãäÚ" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "ÇáÛÇÁ ãäÚ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáãäÚ" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return FilterXList(msg) 
end

if MsgText[1] == "ÇáÍãÇíå" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return settingsall(msg) 
end

if MsgText[1] == "ÇáÇÚÏÇÏÇÊ" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return settings(msg) 
end

if MsgText[1] == "ÇáæÓÇÆØ" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return media(msg) 
end

if MsgText[1] == "ÇáÇÏãäíå" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return GetListAdmin(msg) 
end

if MsgText[1] == "ÊÇß" then
if not msg.Admin then return "??*¦* åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 200
},function(ta,taha)
local t = "\n?| ŞÇÆãÉ ÇáÇÚÖÇÁ \n?????????????\n"
x = 0
local list = taha.members_
for k, v in pairs(list) do
x = x + 1
t = t..""..x.." - {["..v.user_id_.."](tg://user?id="..v.user_id_..")} \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if MsgText[1] == "äĞÇÑ" then 
if not msg.Admin then return "??*?* åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "ÊÇß ááßá" then 
if not msg.Admin then return "??*?* åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "ÇáãäÔì ÇáÇÓÇÓí" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return MONSEBOT(msg) 
end

if MsgText[1] == "ÇáãÏÑÇÁ" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return ownerlist(msg) 
end

if MsgText[1] == "ÇáãäÔÆ ÇáÇÓÇÓí" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return Hussainlist(msg) 
end

if MsgText[1] == "ÇáããíÒíä" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return whitelist(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáÒŞ" then 
if not msg.Rank then end
return zzzkkk(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáÏÌÇÌ" then 
if not msg.Rank then end
return zzkk(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáÍãÇÑ" then 
if not msg.Rank then end
return hhaa(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáŞÑæÏ" then 
if not msg.Rank then end
return aahh(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáÈŞÑ" then 
if not msg.Rank then end
return ggoo(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáÊíÓ" then 
if not msg.Rank then end
return yyoo(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáßáÇÈ" then 
if not msg.Rank then end
return klaa(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáÒæÇÍİ" then 
if not msg.Rank then end
return ssee(msg) 
end

if MsgText[1] == "ŞÇÆãÉ Çáßíß" then 
if not msg.Rank then end
return kakaa(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáÈÕá" then 
if not msg.Rank then end
return bass(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáĞÈÇä" then 
if not msg.Rank then end
return trrr(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáßáíÌå" then 
if not msg.Rank then end
return kll(msg) 
end

if MsgText[1] == "ŞÇÆãÉ ÇáËæÑ" then 
if not msg.Rank then end
return vorr(msg) 
end


if MsgText[1] == "ÕáÇÍíÇÊå" then 
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "ÕáÇÍíÇÊí" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "ÕáÇÍíÇÊå" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'???ÇáãÚÑİ ÛíÑ ÕÍíÍ \n??????')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'???åÇĞÇ ãÚÑİ ŞäÇÉ \n??????')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "İÍÕ ÇáÈæÊ" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. max..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = '?' else info = '?' end
if Json_Info.result.can_delete_messages == true then
delete = '?' else delete = '?' end
if Json_Info.result.can_invite_users == true then
invite = '?' else invite = '?' end
if Json_Info.result.can_pin_messages == true then
pin = '?' else pin = '?' end
if Json_Info.result.can_restrict_members == true then
restrict = '?' else restrict = '?' end
if Json_Info.result.can_promote_members == true then
promote = '?' else promote = '?' end 
return sendMsg(msg.chat_id_,msg.id_,'\n???ÇåáÇ ÚÒíÒí ÇáÈæÊ åäÇ ÇÏãä ÈÇáßÑæÈ \n???æÕáÇÍíÇÊå åí ? \nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\n???ÊÛíÑ ãÚáæãÇÊ ÇáãÌãæÚå ? ? '..info..' ?\n???ÍĞİ ÇáÑÓÇÆá ? ? '..delete..' ?\n???ÍÙÑ ÇáãÓÊÎÏãíä ? ? '..restrict..' ?\n??ÏÚæÉ ãÓÊÎÏãíä ? ? '..invite..' ?\n???ÊËÈíÊ ÇáÑÓÇÆá ? ? '..pin..' ?\n???ÇÖÇİÉ ãÔÑİíä ÌÏÏ ? ? '..promote..' ?\n\n???ãáÇÍÖå » ÚáÇãÉ ?  ? ? ÊÚäí áÏíå ÇáÕáÇÍíÉ æÚáÇãÉ ? ? ? ÊÚäí áíÓ áíÏíå ÇáÕáÇÍíå')   
end
end
end

if MsgText[1] == "ÊËÈíÊ" and msg.reply_id then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "áÇ íãßäß ÇáÊËÈíÊ ÇáÇãÑ ãŞİæá ãä ŞÈá ÇáÇÏÇÑå"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.." \n??*?* Êã ÊËÈíÊ ÇáÑÓÇáå \n?")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* ÚĞÑÇ áÇ íãßääí ÇáÊËÈíÊ .\n??*?* áÓÊ ãÔÑİ Çæ áÇ Çãáß ÕáÇÍíå ÇáÊËÈíÊ \n ??')    
end
end,nil)
end
return false
end

if MsgText[1] == "ÇáÛÇÁ ÇáÊËÈíÊ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "áÇ íãßäß ÇáÛÇÁ ÇáÊËÈíÊ ÇáÇãÑ ãŞİæá ãä ŞÈá ÇáÇÏÇÑå"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."  \n??*?* Êã ÇáÛÇÁ ÊËÈíÊ ÇáÑÓÇáå \n?")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* ÚĞÑÇ áÇ íãßääí ÇáÛÇÁ ÇáÊËÈíÊ .\n??*?* áÓÊ ãÔÑİ Çæ áÇ Çãáß ÕáÇÍíå ÇáÊËÈíÊ \n ??')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* ÚĞÑÇ ÚÒíÒí '..msg.TheRankCmd..' .\n??*?* áÇ ÊæÌÏ ÑÓÇáå ãËÈÊå áÇŞæã ÈÇÒÇáÊåÇ \n ??')    
end
end,nil)
end
return false
end


if MsgText[1] == "ÊŞííÏ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "İß ÇáÊŞííÏ" or MsgText[1] == "İß ÊŞííÏ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "ÑİÚ ããíÒ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇáÑİÚ ãÚØá \n?")
end
return false
end


if MsgText[1] == "ÊäÒíá ããíÒ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "ÑİÚ ÇáãÏíÑ"  or MsgText[1] == "ÑİÚ ãÏíÑ" ) then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇáÑİÚ ãÚØá \n?")
end
return false
end


if (MsgText[1] == "ÊäÒíá ÇáãÏíÑ" or MsgText[1] == "ÊäÒíá ãÏíÑ" ) then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "ÑİÚ ãäÔì ÇÓÇÓí" or MsgText[1] == "ÑİÚ ãäÔÆ ÇÓÇÓí") then
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setkara"}) 
return false
end 
end

if (MsgText[1] == "ÊäÒíá ãäÔì ÇÓÇÓí" or MsgText[1] == "ÊäÒíá ãäÔì ÇÓÇÓí") then
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remkara"}) 
return false
end 
end


if (MsgText[1] == "ÑİÚ ãäÔì" or MsgText[1] == "ÑİÚ ãäÔÆ") then
if not msg.Kara then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãäÔÆ ÇáÇÓÇÓí,ÇáãØæÑ,ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "ÊäÒíá ãäÔì" or MsgText[1] == "ÊäÒíá ãäÔÆ" ) then
if not msg.Kara then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔì ÇáÇÓÇÓí İŞØ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "ÑİÚ ÇÏãä" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇáÑİÚ ãÚØá \n?")
end
return false
end



if MsgText[1] == "ÊäÒíá ÇÏãä" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end



if MsgText[1] == "ÊäÒíá Çáßá" then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end

local Admins = redis:scard(max..'admins:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
local NumMDER = redis:scard(max..'owners:'..msg.chat_id_)
redis:del(max..'owners:'..msg.chat_id_)
local MMEZEN = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)

return "??????ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.." ?\n??????ÊÜÜ?ÜÜã ÊäÒíá ? "..Admins.." ? ãä ÇáÇÏãäíå\n???????ÊÜÜ?ÜÜã ÊäÒíá ? "..NumMDER.." ? ãä ÇáãÏÑÇÁ\n??????ÊÜÜ?ÜÜã ÊäÒíá ? "..MMEZEN.." ? ãä ÇáããíÒíä\n\n???ÊÜÜ?ÜÜã ÊÜäÜÒíÜá ÇáÜßÜá ÈÜäÜÌÜÇÍ\n?" 
end


if MsgText[1] == "ÑİÚ ÒŞ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="zkzk"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ÒŞ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="zkzkk"})
end
return false
end


if MsgText[1] == "ÑİÚ ÏÌÇÌå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dadaa"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ÏÌÇÌå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dadaaa"})
end
return false
end


if MsgText[1] == "ÑİÚ ÍãÇÑ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="motee"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ÍãÇÑ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="moteee"})
end
return false
end


if MsgText[1] == "ÑİÚ ŞÑÏ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="yyuu"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ŞÑÏ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="yyuuu"})
end
return false
end


if MsgText[1] == "ÑİÚ ÈŞÑå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bakki"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ÈŞÑå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bakkii"})
end
return false
end


if MsgText[1] == "ÑİÚ ÊíÓ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="hamee"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ÊíÓ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="hamee"})
end
return false
end


if MsgText[1] == "ÑİÚ ßáÈ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kalb"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ßáÈ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kalbb"})
end
return false
end


if MsgText[1] == "ÑİÚ ÒÇÍİ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="zaahf"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ÒÇÍİ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="zaahff"})
end
return false
end

if MsgText[1] == "ÑİÚ ßíßå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkaak"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ßíßå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkaakk"})
end
return false
end

if MsgText[1] == "ÑİÚ ÈÕáå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bbaa"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ÈÕáå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bbaaa"})
end
return false
end

if MsgText[1] == "ÑİÚ ĞÈÇäå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ttaa"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ĞÈÇäå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ttaaa"})
end
return false
end

if MsgText[1] == "ÑİÚ ßáíÌå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkw"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ßáíÌå" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkww"})
end
return false
end


if MsgText[1] == "ÑİÚ ËæÑ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="voo"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"??????*?* ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇæÇãÑ ÇáÊÓáíå ãÚØáå\n?")
end
return false
end
if MsgText[1] == "ÊäÒíá ËæÑ" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="vooo"})
end
return false
end


--{ Commands For locks }

if MsgText[1] == "Şİá" then

if MsgText[2] == "Çáßá"		 then return lock_All(msg) end
if MsgText[2] == "ÇáæÓÇÆØ" 	 then return lock_Media(msg) end
if MsgText[2] == "ÇáÕæÑ ÈÇáÊŞííÏ" 	 then return tqeed_photo(msg) end
if MsgText[2] == "ÇáİíÏíæ ÈÇáÊŞííÏ"  then return tqeed_video(msg) end
if MsgText[2] == "ÇáãÊÍÑßå ÈÇáÊŞííÏ" then return tqeed_gif(msg) end
if MsgText[2] == "ÇáÊæÌíå ÈÇáÊŞííÏ"  then return tqeed_fwd(msg) end
if MsgText[2] == "ÇáÑæÇÈØ ÈÇáÊŞííÏ"  then return tqeed_link(msg) end
if MsgText[2] == "ÇáÏÑÏÔå"    	     then return mute_text(msg) end
if MsgText[2] == "ÇáãÊÍÑßå" 		 then return mute_gif(msg) end
if MsgText[2] == "ÇáÕæÑ" 			 then return mute_photo(msg) end
if MsgText[2] == "ÇáİíÏíæ"			 then return mute_video(msg) end
if MsgText[2] == "ÇáÈÕãÇÊ" 		then  return mute_audio(msg) end
if MsgText[2] == "ÇáÕæÊ" 		then return mute_voice(msg) end
if MsgText[2] == "ÇáãáÕŞÇÊ" 	then return mute_sticker(msg) end
if MsgText[2] == "ÇáÌåÇÊ" 		then return mute_contact(msg) end
if MsgText[2] == "ÇáÊæÌíå" 		then return mute_forward(msg) end
if MsgText[2] == "ÇáãæŞÚ"	 	then return mute_location(msg) end
if MsgText[2] == "ÇáãáİÇÊ" 		then return mute_document(msg) end
if MsgText[2] == "ÇáÇÔÚÇÑÇÊ" 	then return mute_tgservice(msg) end
if MsgText[2] == "ÇáÇäáÇíä" 		then return mute_inline(msg) end
if MsgText[2] == "ÇáßíÈæÑÏ" 	then return mute_keyboard(msg) end
if MsgText[2] == "ÇáÑæÇÈØ" 		then return lock_link(msg) end
if MsgText[2] == "ÇáÊÇß" 		then return lock_tag(msg) end
if MsgText[2] == "ÇáãÚÑİÇÊ" 	then return lock_username(msg) end
if MsgText[2] == "ÇáÊÚÏíá" 		then return lock_edit(msg) end
if MsgText[2] == "ÇáßáÇíÔ" 		then return lock_spam(msg) end
if MsgText[2] == "ÇáÊßÑÇÑ" 		then return lock_flood(msg) end
if MsgText[2] == "ÇáÈæÊÇÊ" 		then return lock_bots(msg) end
if MsgText[2] == "ÇáÈæÊÇÊ ÈÇáØÑÏ" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "ÇáãÇÑßÏæÇä" 	then return lock_markdown(msg) end
if MsgText[2] == "ÇáæíÈ" 		then return lock_webpage(msg) end 
if MsgText[2] == "ÇáÊËÈíÊ" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "İÊÍ" 		then 
if MsgText[2] == "Çáßá" then return Unlock_All(msg) end
if MsgText[2] == "ÇáæÓÇÆØ" then return Unlock_Media(msg) end
if MsgText[2] == "ÇáÕæÑ ÈÇáÊŞííÏ" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "ÇáİíÏíæ ÈÇáÊŞííÏ" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "ÇáãÊÍÑßå ÈÇáÊŞííÏ" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "ÇáÊæÌíå ÈÇáÊŞííÏ" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "ÇáÑæÇÈØ ÈÇáÊŞííÏ" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "ÇáãÊÍÑßå" 	then return unmute_gif(msg) 	end
if MsgText[2] == "ÇáÏÑÏÔå" 		then return unmute_text(msg) 	end
if MsgText[2] == "ÇáÕæÑ" 		then return unmute_photo(msg) 	end
if MsgText[2] == "ÇáİíÏíæ" 		then return unmute_video(msg) 	end
if MsgText[2] == "ÇáÈÕãÇÊ" 		then return unmute_audio(msg) 	end
if MsgText[2] == "ÇáÕæÊ" 		then return unmute_voice(msg) 	end
if MsgText[2] == "ÇáãáÕŞÇÊ" 	then return unmute_sticker(msg) end
if MsgText[2] == "ÇáÌåÇÊ" 		then return unmute_contact(msg) end
if MsgText[2] == "ÇáÊæÌíå" 		then return unmute_forward(msg) end
if MsgText[2] == "ÇáãæŞÚ" 		then return unmute_location(msg) end
if MsgText[2] == "ÇáãáİÇÊ" 		then return unmute_document(msg) end
if MsgText[2] == "ÇáÇÔÚÇÑÇÊ" 	then return unmute_tgservice(msg) end
if MsgText[2] == "ÇáÇäáÇíä" 		then return unmute_inline(msg) 	end
if MsgText[2] == "ÇáßíÈæÑÏ" 	then return unmute_keyboard(msg) end
if MsgText[2] == "ÇáÑæÇÈØ" 		then return unlock_link(msg) 	end
if MsgText[2] == "ÇáÊÇß" 		then return unlock_tag(msg) 	end
if MsgText[2] == "ÇáãÚÑİÇÊ" 	then return unlock_username(msg) end
if MsgText[2] == "ÇáÊÚÏíá" 		then return unlock_edit(msg) 	end
if MsgText[2] == "ÇáßáÇíÔ" 		then return unlock_spam(msg) 	end
if MsgText[2] == "ÇáÊßÑÇÑ" 		then return unlock_flood(msg) 	end
if MsgText[2] == "ÇáÈæÊÇÊ" 		then return unlock_bots(msg) 	end
if MsgText[2] == "ÇáÈæÊÇÊ ÈÇáØÑÏ" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "ÇáãÇÑßÏæÇä" 	then return unlock_markdown(msg) end
if MsgText[2] == "ÇáæíÈ" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "ÇáÊËÈíÊ" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "ÇäÔÇÁ ÑÇÈØ" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if not redis:get(max..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(max..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(max..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"?????*?*Êã ÇäÔÇÁ ÑÇÈØ ÌÏíÏ \n???["..LinkGp.."]\n???áÚÑÖ ÇáÑÇÈØ ÇÑÓá { ÇáÑÇÈØ } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"???áÇ íãßääí ÇäÔÇÁ ÑÇÈØ ááãÌãæÚå .\n???áÇääí áÓÊ ãÔÑİ İí ÇáãÌãæÚå \n ??")
end
else
return sendMsg(msg.chat_id_,msg.id_,"???áŞÏ ŞãÊ ÈÇäÔÇÁ ÇáÑÇÈØ ÓÇÈŞÇ .\n???ÇÑÓá { ÇáÑÇÈØ } áÑÄíå ÇáÑÇÈØ  \n ??")
end
return false
end 

if MsgText[1] == "ÖÚ ÑÇÈØ" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
redis:setex(max..'linkGroup'..msg.sender_user_id_,300,true)
return '???ÚÒíÒí Şã ÈÑÓÇá ÇáÑÇÈØ ÇáÌÏíÏ ...??'
end

if MsgText[1] == "ÇáÑÇÈØ" then
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "??*?*   áÇ íæÌÏ ÑÇÈØ \n??*?*áÇäÔÇÁ ÑÇÈØ ÇÑÓá { `ÇäÔÇÁ ÑÇÈØ` }\n??" 
end
local GroupName = redis:get(max..'group:name'..msg.chat_id_)
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
return "???ÑÇÈÜØ ÇáÜãÜÌÜãÜæÚå ??\n???"..Flter_Markdown(GroupName).." :\n\n["..GroupLink.."]\n"
end
  

if MsgText[1] == "ÇáÑÇÈØ ÎÇÕ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
if not GroupLink then return "??*?*    áÇíæÌÏ åäÇ ÑÇÈØ\n???*ÑÌÇÆÇ ÇßÊÈ [ÖÚ ÑÇÈØ]*??" end
local Text = "???ÑÇÈÜØ ÇáÜãÜÌÜãÜæÚå ??\n???"..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "?????*?*ÚĞÑÇ ÚÒíÒí \n???áã ÇÓÊØíÚ ÇÑÓÇáß ÇáÑÇÈØ áÇäß ŞãÊ ÈÍÙÑ ÇáÈæÊ\n!"
elseif res == 400 then
return "?????*?*ÚĞÑÇ ÚÒíÒí \n??? áã ÇÓÊØíÚ ÇÑÓÇáß ÇáÑÇÈØ íÌÈ Úáíß ãÑÇÓáå ÇáÈæÊ ÇæáÇ \n!"
end
if res == 200 then 
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."  \n???Êã ÇÑÓÇá ÇáÑÇÈØ ÎÇÕ áß ??"
end
end


if MsgText[1] == "ÖÚ ÇáŞæÇäíä" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
redis:setex(max..'rulse:witting'..msg.sender_user_id_,300,true)
return '???ÍÓääÇ ÚÒíÒí  ???\n???ÇáÇä ÇÑÓá ÇáŞæÇäíä  ááãÌãæÚå ??'
end

if MsgText[1] == "ÇáŞæÇäíä" then
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "\nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\nÇáŞæÇäíä :\nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\n? | ÅÍÊÑÇã ãÏÑÇÁ æÃÏãäíÉ ÇáãÌãæÚÉ.\n? | ÇáÚäÕÑíÉ ÈÌãíÚ ÃÔßÇáåÇ ããäæÚÉ.\n? | íãäÚ äÔÑ ÇáãÍÊæì ÇáÅÈÇÍí Èßá ÃäæÇÚå.\n? | íãäÚ ÇáÊßáã ÈÇáÃÏíÇä Ãæ ÇáãĞÇåÈ Ãæ ÇáÓíÇÓÉ.\n? | íãäÚ äÔÑ ÇáÍÓÇÈÇÊ ÇáÔÎÕíÉ Ïæä ÃÎĞ ÇáãæÇİŞÉ.\n? | íãäÚ äÔÑ ÇáÅÚáÇäÇÊ Èßá ÃäæÇÚåÇ Ïæä ÃÎĞ ÇáãæÇİŞÉ.\n? | íãäÚ ÇáÓÈ Ãæ ÇáÊáİÙ ÈÃáİÇÙ äÇÈíÉ Çæ ÎÇÏÔÉ ááÍíÇÁ.\nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ"
else 
return "*???ÇáŞæÇäíä :*\n"..redis:get(max..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ÖÚ ÊßÑÇÑ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "??*?* ÍÏæÏ ÇáÊßÑÇÑ ,  íÌÈ Çä Êßæä ãÇ Èíä  *[2-50]*" 
end
redis:set(max..'flood'..msg.chat_id_,MsgText[2]) 
return "??*?* Êã æÖÚ ÇáÊßÑÇÑ » { *"..MsgText[2].."* }"
end



if MsgText[1] == "ãÓÍ" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if 500 < tonumber(MsgText[2]) then return "??*?* ÍÏæÏ ÇáãÓÍ ,  íÌÈ Çä Êßæä ãÇ Èíä  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*??* ÊÜã ãÓÍ ~? { *"..MsgText[2].."* } ãä ÇáÑÓÇÆá  \n?")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*??* ÊÜã ãÓÍ ~? { *"..MsgText[2].."* } ãä ÇáÑÓÇÆá  \n?")
end,nil))
end
end)
return false
end

if MsgText[2] == "ÇáÇÏãäíå" then 
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end

local Admins = redis:scard(max..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "??*?* Çæå ? åäÇáß ÎØÃ ??\n???ÚĞÑÇ áÇ íæÌÏ ÇÏãäíå áíÊã ãÓÍåã ?" 
end
redis:del(max..'admins:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n???Êã ãÓÍ {"..Admins.."} ãä ÇáÇÏãäíå İí ÇáÈæÊ \n?"
end


if MsgText[2] == "ŞÇÆãÉ ÇáãäÚ" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local Mn3Word = redis:scard(max..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "??*?* ÚĞÑÇ áÇ ÊæÌÏ ßáãÇÊ ããäæÚå áíÊã ÍĞİåÇ ?" 
end
redis:del(max..':Filter_Word:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n???Êã ãÓÍ {*"..Mn3Word.."*} ßáãÇÊ ãä ÇáãäÚ ?"
end


if MsgText[2] == "ÇáŞæÇäíä" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "???ÚĞÑÇ áÇ íæÌÏ ŞæÇäíä áíÊã ãÓÍå \n!" 
end
redis:del(max..'rulse:msg'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n???Êã ÍĞİ ÇáŞæÇäíä ÈäÌÇÍ ?"
end


if MsgText[2] == "ÇáÊÑÍíÈ"  then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if not redis:get(max..'welcome:msg'..msg.chat_id_) then 
return "??*?* Çæå ? åäÇáß ÎØÃ ??\n???ÚĞÑÇ áÇ íæÌÏ ÊÑÍíÈ áíÊã ãÓÍå ?" 
end
redis:del(max..'welcome:msg'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n???Êã ÍĞİ ÇáÊÑÍíÈ ÈäÌÇÍ \n?"
end


if MsgText[2] == "ÇáãäÔì ÇáÇÓÇÓí" then
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
local NumMnsha = redis:scard(max..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "???ÚĞÑÇ áÇ íæÌÏ ãäÔì ÇÓÇÓí \n!" 
end
redis:del(max..':Hussain:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ÇáãäÔì ÇáÇÓÇÓí \n?"
end


if MsgText[2] == "ÇáãäÔÆííä" then
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
local NumMnsha = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "???ÚĞÑÇ áÇ íæÌÏ ãäÔÆííä áíÊã ãÓÍåã \n!" 
end
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáãäÔÆííä\n?"
end


if MsgText[2] == "ÇáãÏÑÇÁ" then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local NumMDER = redis:scard(max..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "???ÚĞÑÇ áÇ íæÌÏ ãÏÑÇÁ áíÊã ãÓÍåã \n!" 
end
redis:del(max..'owners:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMDER.." *} ãä ÇáãÏÑÇÁ  \n?"
end

if MsgText[2] == 'ÇáãÍÙæÑíä' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end

local list = redis:smembers(max..'banned:'..msg.chat_id_)
if #list == 0 then return "*???áÇ íæÌÏ ãÓÊÎÏãíä ãÍÙæÑíä  *" end
message = '??*?* ŞÇÆãÉ ÇáÇÚÖÇÁ ÇáãÍÙæÑíä :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(max..'banned:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..#list.." *} ãä ÇáãÍÙæÑíä  \n?"
end

if MsgText[2] == 'ÇáãßÊæãíä' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local MKTOMEN = redis:scard(max..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "??*?* áÇ íæÌÏ ãÓÊÎÏãíä ãßÊæãíä İí ÇáãÌãæÚå " 
end
redis:del(max..'is_silent_users:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..MKTOMEN.." *} ãä ÇáãßÊæãíä  \n?"
end

if MsgText[2] == 'ÇáããíÒíä' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local MMEZEN = redis:scard(max..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*??*?áÇ íæÌÏ ãÓÊÎÏãíä ããíÒíä İí ÇáãÌãæÚå " 
end
redis:del(max..'whitelist:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..MMEZEN.." *} ãä ÇáããíÒíä  \n?"
end


if MsgText[2] == "ŞÇÆãÉ Çáßíß" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':kaka:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':kaka:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä Çáßíß \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáÒæÇÍİ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':zahaf:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':zahaf:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáÒæÇÍİ\n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáßáÇÈ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':kka:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':kka:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáßáÇÈ\n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáÊíÓ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':yoo:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':yoo:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáÊíÓ \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáÈŞÑ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':baa:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':baa:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáÈŞÑ \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáÍãÇÑ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':mote:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':mote:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáÍãÇÑ \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáŞÑæÏ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':ggyy:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':ggyy:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáÍãÇÑ \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáÏÌÇÌ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':zmm:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':zmm:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáÏÌÇÌ \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáÒŞ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':zzkm:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáÒŞ \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáÈÕá" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':bba:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáÈÕá \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáĞÈÇä" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':tta:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáĞÈÇä \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáßáíÌå" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':kww:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáßáíÌå \n?"
end

if MsgText[2] == "ŞÇÆãÉ ÇáËæÑ" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':vor:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*áÇíæÌÏ ÇÍÏ ãÑİæÚ İí ÇáÈæÊ áíÊã ãÓÍÉ \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n??? Êã ãÓÍ {* "..NumMnsha.." *} ãä ÇáËæÑ \n?"
end

if MsgText[2] == 'ÇáÑÇÈØ' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "*??*?áÇ íæÌÏ ÑÇÈØ ãÖÇİ ÇÕáÇ " 
end
redis:del(max..'linkGroup'..msg.chat_id_)
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."   \n???Êã ãÓÍ ÑÇÈØ ÇáãÌãæÚå \n?"
end

end 
--End del 


if MsgText[1] == "ÖÚ ÇÓã" then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
redis:setex(max..'name:witting'..msg.sender_user_id_,300,true)
return "???ÍÓääÇ ÚÒíÒí  ???\n???ÇáÇä ÇÑÓá ÇáÇÓã  ááãÌãæÚå \n??"
end


if MsgText[1] == "ãÓÍ ÇáÕæÑå" then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ãÓÍ ÇáÕæÑå ÂáãÜÌãÜæÚåÀ ??\n?')
end


if MsgText[1] == "ÖÚ ÕæÑå" then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'???Êã ÊÛííÑ ÕæÑå ÂáãÜÌãÜæÚåÀ ?\n?')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'???áíÓ áÏí ÕáÇÍíå ÊÛííÑ ÇáÕæÑå \n?? ?íÌÈ ÇÚØÇÆí ÕáÇÍíå `ÊÛííÑ ãÚáæãÇÊ ÇáãÌãæÚå ` ?\n?')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(max..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '???ÍÓääÇ ÚÒíÒí ??\n?? ?ÇáÇä Şã ÈÇÑÓÇá ÇáÕæÑå\n??' 
end 
end


if MsgText[1] == "ÖÚ æÕİ" then 
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
redis:setex(max..'about:witting'..msg.sender_user_id_,300,true) 
return "???ÍÓääÇ ÚÒíÒí  ???\n???ÇáÇä ÇÑÓá ÇáæÕİ  ááãÌãæÚå\n??" 
end


if MsgText[1] == "ØÑÏ ÇáÈæÊÇÊ" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"??| áÇ íÜæÌÜÏ ÈÜæÊÜÇÊ İí ÇáÜãÜÌÜãÜæÚÜå .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "??| ÚÜÏÏ ÇáÜÈÜæÊÇÊ •? {* "..(Total - 1).." *} ?•\n\n"
if NumBot == 0 then 
TextR = TextR.."??| áÇ íÜãÜßÜä ØÑÏåã áÇäÜåÜã ãÔÜÑİÜíä .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."??| áã íÊã ØÜÑÏ {* "..NumBotAdmin.." *} ÈæÊ áÂäåÀşã ãÜÔÜÑİíä."
else
TextR = TextR.."??| Êã ØÜÑÏ ßÜÜá ÇáÈæÊÂÊ ÈäÌÂÍ .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "ßÔİ ÇáÈæÊÇÊ" then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '??| ŞÜÇÆãå ÇáÈæÊÇÊ ÇáÜÍÇáíÉ\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *?*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

??| áÜÏíÜ˜ {]]..total..[[} ÈÜæÊÜÂÊ
??| ãáÇÍÙÉ : ÇáÜ ? ÊÚäÜí Çä ÇáÈæÊ ãÔÑİ İí ÇáãÌãæÚÜÉ.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'ØÑÏ ÇáãÍĞæİíä' then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
sendMsg(msg.chat_id_,msg.id_,'??| ÌÇÑí ÇáÈÍË ÚÜä ÇáÜÍÜÓÜÇÈÜÇÊ ÇáãÜÍĞæİÜÉ ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(max..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(max..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(max..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"???Êã ØÜÑÏ {* "..NumMemDone.." *} ãä ÂáÍÓÜÂÈÂÊ ÂáãÜÍĞæİåÀşş ??")
else
sendMsg(msg.chat_id_,msg.id_,'???áÇ íæÌÏ ÍÓÇÈÇÊ ãÍĞæİå İí ÇáãÌãæÚå ??')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ÇíÏí" or MsgText[1]:lower() == "id" then

if not MsgText[2] and not msg.reply_id then
if redis:get(max..'lock_id'..msg.chat_id_) then
local msgs = redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if redis:get(max.."getidstatus"..msg.chat_id_) == "Photo" then
	if data.photos_[0] then 
		ali = {' 		'}
		ssssys = ali[math.random(#ali)]
		if not redis:get("KLISH:ID") then
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,'???ãÚÑİÜß ['..UserNameID..']\n???ÇíÏíÜß ? '..msg.sender_user_id_..' ?\n???ÑÊÈÊÜß ? '..msg.TheRank..' ?\n?????ÊİÇÚáß ? '..Get_Ttl(msgs)..' ?\n???ÑÓÇÆáß ? '..msgs..' ?\n???äŞÇØß ? '..nko..' ?\n?')
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,"???"..ssssys.."\n"..Text.."",dl_cb,nil)
		end
	else
		if not redis:get("KLISH:ID") then
		sendMsg(msg.chat_id_,msg.id_,'???áíÓ áÏíß ÕæÑÉ Çæ Çäß ÍÙÑÊ ÇáÈæÊ ...!\n???ãÚÑİÜß ['..UserNameID..']\n???ÇíÏíÜß ? '..msg.sender_user_id_..' ?\n???ÑÊÈÊÜß ? '..msg.TheRank..' ?\n?????ÊİÇÚáß ? '..Get_Ttl(msgs)..' ?\n???ÑÓÇÆáß ? '..msgs..' ?\n???äŞÇØß ? '..nko..' ?\n?')
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		end
	end
else
	if redis:get("KLISH:ID") then
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		else
		sendMsg(msg.chat_id_,msg.id_,'???ÇáÇíÏí ÈÇáÕæÑå ãÚØá \n???ãÚÑİÜß ['..UserNameID..']\n???ÇíÏíÜß ? '..msg.sender_user_id_..' ?\n???ÑÊÈÊÜß ? '..msg.TheRank..' ?\n?????ÊİÇÚáß ? '..Get_Ttl(msgs)..' ?\n???ÑÓÇÆáß ? '..msgs..' ?\n???äŞÇØß ? '..nko..' ?\n?')
		end
end

end) 
end ,nil)
end
return false
end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "ÇáÑÊÈå" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'ÑÓÇÆáí' or MsgText[1] == 'ÑÓÇíáí' or MsgText[1] == 'ÇÍÕÇÆíÇÊí'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n???? ÇáÇÍÜÕÜÇÆÜíÜÇÊ ÇáÜÑÓÜÇÆÜáß ?\n \n"
.."???ÇáÜÑÓÜÇÆÜá ? "..msgs.." ?\n"
.."???ÇáÜÌÜåÜÇÊ ? "..NumGha.." ?\n"
.."???ÇáÜÕÜæÑ ? "..photo.." ?\n"
.."???ÇáÜãÜÊÜÍÜÑßÜå ? "..animation.." ?\n"
.."???ÇáÜãÜáÜÕÜŞÇÊ ? "..sticker.." ?\n"
.."???ÇáÜÈÜÕÜãÜÇÊ ? "..voice.." ?\n"
.."???ÇáÜÕÜæÊ ? "..audio.." ?\n"
.."???ÇáÜİÜíÜÏíÜæ ? "..video.." ?\n"
.."???ÇáÜÊÜÚÜÏíÜá ? "..edited.." ?\n"
.."???ÊÜİÜÇÚÜáÜß ? "..Get_Ttl(msgs).." ?\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'ãÓÍ' and MsgText[2] == 'ÑÓÇÆáí'  then
local msgs = redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "??*?*ÚĞÑÇ áÇ íæÌÏ ÑÓÇÆá áß İí ÇáÈæÊ  ??" end
redis:del(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "??*?*Êã ãÓÍ {* "..msgs.." *} ãä ÑÓÇÆáß ??\n?"
end

if MsgText[1]== 'ÌåÇÊí' then
return '???*?*  ÚÏÏ ÌåÇÊß ÇáããÖÇİå ? ? '..(redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ? \n??'
end

if MsgText[1] == 'ãÓÍ' and MsgText[2] == 'ÌåÇÊí'  then
local adduser = redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "??*?*ÚĞÑÇ áíÓ áÏíß ÌåÇÊ áßí íÊã ãÓÍåÇ" end
redis:del(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "??*?*Êã ãÓÍ {* "..adduser.." *} ãä ÌåÇÊß\n?"
end

if MsgText[1] == 'ãÓÍ' and MsgText[2] == 'äŞÇØí'  then
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if nko == 0 then  return "??*?*ÚĞÑÇ áíÓ áÏíß äŞÇØ áßí íÊã ãÓÍåÇ" end
redis:del(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "??*?*Êã ãÓÍ {* "..points.." *} ãä äŞÇØß\n?"
end

if MsgText[1] == 'ãÚáæãÇÊí' or MsgText[1] == 'ãæŞÚí' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="???????ÇåÜáÇ ÈÜß ÚÒíÒí İí ãÚáæãÇÊß ?? \n"
.."Ü.——————————\n"
.."???ÇáÇÓÜÜã ? "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." ?\n"
.."???ÇáãÚÑİ ? "..ResolveUser(data).." ?\n"
.."???ÇáÇíÜÏí ? `"..msg.sender_user_id_.."` ?\n"
.."???ÑÊÈÊÜÜß ? "..msg.TheRank.." ?\n"
.."???Ü ? `"..msg.chat_id_.."` ?\n"
.."Ü.——————————\n"
.." ? ÇáÇÍÜÕÜÇÆÜíÜÇÊ ÇáÜÑÓÜÇÆÜá ?\n"
.."???ÇáÜÑÓÜÇÆÜá ? `"..msgs.."` ?\n"
.."???ÇáÜÌÜåÜÇÊ ? `"..NumGha.."` ?\n"
.."???ÇáÜÕÜæÑ ? `"..photo.."` ?\n"
.."???ÇáÜãÜÊÜÍÜÑßÜå ? `"..animation.."` ?\n"
.."???ÇáÜãÜáÜÕÜŞÇÊ ? `"..sticker.."` ?\n"
.."???ÇáÜÈÜÕÜãÜÇÊ ? `"..voice.."` ?\n"
.."???ÇáÜÕÜæÊ ? `"..audio.."` ?\n"
.."???ÇáÜİÜíÜÏíÜæ ? `"..video.."` ?\n"
.."???ÇáÜÊÜÚÜÏíÜá ?`"..edited.."` ?\n"
.."???ÊÜİÜÇÚÜáÜß ? "..Get_Ttl(msgs).." ?\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "ãÓÍ ãÚáæãÇÊí" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="??????Çåáä ÚÒíÒí Êã ÍĞİ ÌãíÚ ãÚáæãÇÊß "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "ÊİÚíá" then

if MsgText[2] == "ÇáÑÏæÏ" 	then return unlock_replay(msg) end
if MsgText[2] == "ÇáÇĞÇÚå" 	then return unlock_brod(msg) end
if MsgText[2] == "ÇáÇíÏí" 	then return unlock_ID(msg) end
if MsgText[2] == "ÇáÊÑÍíÈ" 	then return unlock_Welcome(msg) end
if MsgText[2] == "ÇáÊÍĞíÑ" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "ÊÚØíá" then

if MsgText[2] == "ÇáÑÏæÏ" 	then return lock_replay(msg) end
if MsgText[2] == "ÇáÇĞÇÚå" 	then return lock_brod(msg) end
if MsgText[2] == "ÇáÇíÏí" 	then return lock_ID(msg) end
if MsgText[2] == "ÇáÊÑÍíÈ" 	then return lock_Welcome(msg) end
if MsgText[2] == "ÇáÊÍĞíÑ" 	then return lock_waring(msg) end
end


if MsgText[1] == "ÖÚ ÇáÊÑÍíÈ" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
redis:set(max..'welcom:witting'..msg.sender_user_id_,true) 
return "???ÍÓääÇ ÚÒíÒí  ???\n???ÇÑÓá ßáíÔå ÇáÊÑÍíÈ ÇáÇä\n\n -ãáÇÍÙå ÊÓÊØíÚ ÇÖÇİå ÏæÇá ááÊÑÍíÈ ãËáÇ :\n 1- ŞæÇäíä ÇáãÌãæÚå  » *{ÇáŞæÇäíä}*  \n 2- ÇÖåÇÑ ÇÓã ÇáÚÖæ » *{ÇáÇÓã}*\n 3-ÇÖåÇÑ ãÚÑİ ÇáÚÖæ » *{ÇáãÚÑİ}*\n 4-ÇÖåÇÑ ÇÓã ãÌãæÚå » *{ÇáãÌãæÚå}*" 
end


if MsgText[1] == "ÇáÊÑÍíÈ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if redis:get(max..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(max..'welcome:msg'..msg.chat_id_))
else 
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."  \n???äæÑÊ ÇáãÌãæÚå \n??????" 
end 
end


if MsgText[1] == "ßÔİ"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "ØÑÏ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "ÍÙÑ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "ÇáÛÇÁ ÇáÍÙÑ" or MsgText[1] == "ÇáÛÇÁ ÍÙÑ") and msg.Admin then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "ßÊã" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "ÇáÛÇÁ ÇáßÊã" or MsgText[1] == "ÇáÛÇÁ ßÊã" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end

if MsgText[1] == "ÇáãßÊæãíä" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return MuteUser_list(msg) 
end

if MsgText[1] == "ÇáãÍÙæÑíä" then 
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return GetListBanned(msg) 
end

if MsgText[1] == "ÑİÚ ÇáÇÏãäíå" then
if not msg.Creator then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ} İŞØ  \n??" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'ãÓÍ' and MsgText[2] == 'ÇáãØæÑíä'  then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
local mtwren = redis:scard(max..':SUDO_BOT:')
if mtwren == 0 then  return "??*?* ÚĞÑÇ áÇ íæÌÏ ãØæÑíä İí ÇáÈæÊ  ??" end
redis:del(max..':SUDO_BOT:') 
return "??*?* Êã ãÓÍ {* "..mtwren.." *} ãä ÇáãØæÑíä ??\n?"
end

if MsgText[1] == 'ãÓÍ' and MsgText[2] == "ŞÇÆãÉ ÇáÚÇã"  then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
local addbannds = redis:scard(max..'gban_users')
if addbannds ==0 then 
return "*???ŞÇÆãÉ ÇáÍÙÑ İÇÑÛå .*" 
end
redis:del(max..'gban_users') 
return "??*?* ÊÜã ãÜÓÜÍ { *"..addbannds.." *} ãä ŞÇÆãÉ ÇáÚÇã\n?" 
end 

if msg.SudoBase then

if MsgText[1] == "ÑİÚ ãØæÑ" then
if not msg.SudoBase then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí ????} İŞØ  \n??" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "ÊäÒíá ãØæÑ" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "ÊäÙíİ ÇáãÌãæÚÇÊ" or MsgText[1] == "ÊäÙíİ ÇáãÌãæÚÇÊ ??" then
local groups = redis:smembers(max..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'??*?* ÌÜíÜÏ , áÇ ÊæÌÏ ãÌãæÚÇÊ æåãíå \n?')
else
sendMsg(msg.chat_id_,msg.id_,'??*?* ÚÏÏ ÇáãÌãæÚÇÊ •? { *'..#groups..'*  } ?•\n??*?* ÊÜã ÊäÙíİ  •? { *'..GroupDel..'*  } ?• ãÌãæÚå \n??*?* ÇÕÈÍ ÇáÚÏÏ ÇáÍŞíŞí ÇáÇä •? { *'..GroupsIsFound..'*  } ?• ãÌãæÚå')
end
end
end)
end
return false
end
if MsgText[1] == "ÊäÙíİ ÇáãÔÊÑßíä ??" or MsgText[1] == "ÊäÙíİ ÇáãÔÊÑßíä ??" then
local pv = redis:smembers(max..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(max..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'?| ÌÜíÜÏ , áÇ íæÌÏ ãÔÊÑßíä æåãí')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'??*?* ÚÏÏ ÇáãÔÊÑßíä •? { *'..#pv..'*  } ?•\n??*?* ÊÜã ÊäÙíİ  •? { *'..NumPvDel..'*  } ?• ãÔÊÑß \n??*?* ÇÕÈÍ ÇáÚÏÏ ÇáÍŞíŞí ÇáÇä •? { *'..SenderOk..'*  } ?• ãä ÇáãÔÊÑßíä') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ÖÚ ÕæÑå ááÊÑÍíÈ" or MsgText[1]=="ÖÚ ÕæÑå ááÊÑÍíÈ ??" then
redis:setex(max..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'???ÍÓääÇ ÚÒíÒí ??\n?? ?ÇáÇä Şã ÈÇÑÓÇá ÇáÕæÑå ááÊÑÍíÈ \n??' 
end

if MsgText[1] == "ÊÚØíá" and MsgText[2] == "ÇáÈæÊ ÎÏãí" then
return lock_service(msg) 
end

if MsgText[1] == "ÊİÚíá" and MsgText[2] == "ÇáÈæÊ ÎÏãí" then 
return unlock_service(msg) 
end

if MsgText[1] == "ÕæÑå ÇáÊÑÍíÈ" then
local Photo_Weloame = redis:get(max..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[??ÇåáÇ ÇäÂ ÈæÊ ÂÓÜãÜí ]]..redis:get(max..':NameBot:')..[[ ?
???????ÂÎÊÕÜÂÕÜí ÍãÜÂíåÀş ÂáãÜÌãÜæÚÂÊ
???ãÜä ÂáÓÜÈÂã æÂáÊæÌíåÀş æÂáÊÑÂÑ æÂáÎ...

???ãÜÚÜÑİ ÇáÜãÜØÜæÑ  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ ??
]])

return false
else
return "??| áÇ ÊæÌÏ ÕæÑå ãÖÇİå ááÊÑÍíÈ İí ÇáÈæÊ \n??| áÇÖÇİå ÕæÑå ÇáÊÑÍíÈ ÇÑÓá `ÖÚ ÕæÑå ááÊÑÍíÈ`"
end
end

if MsgText[1] == "ÖÚ ßáíÔå ÇáãØæÑ" then 
redis:setex(max..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '???ÍÓääÇ ÚÒíÒí ??\n???ÇáÇä Şã ÈÇÑÓÇá ÇáßáíÔå \n??' 
end

if MsgText[1] == "ÖÚ ÔÑØ ÇáÊİÚíá" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(max..':addnumberusers',MsgText[2]) 
return '??*?* Êã æÖÜÚ ÔÜÑØ ÂáÊİÚíá ÂáÈæÊ ÂĞÂ ÂäÊ ÂáãÜÌãÜæÚåÀşş ÂËÑ ãÜä *?'..MsgText[2]..'?* ÚÖÜæ  ??\n' 
end

if MsgText[1] == "ÔÑØ ÇáÊİÚíá" then 
return'??*?* ÔÜÑØ ÂáÊİÚíá ÂáÈæÊ ÂĞÂ ÂäÊ ÂáãÜÌãÜæÚåÀşş ÂËÑ ãÜä *?'..redis:get(max..':addnumberusers')..'?* ÚÖÜæ  ??\n' 
end 
end

if MsgText[1] == 'ÇáãÌãæÚÇÊ' or MsgText[1] == "ÇáãÌãæÚÇÊ ??" then
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
return '??*?* ÚÏÏ ÇáãÌãæÚÇÊ ÇáãİÚáÉ » `'..redis:scard(max..'group:ids')..'`  ?' 
end

if MsgText[1] == "ÇáãÔÊÑßíä" or MsgText[1] == "ÇáãÔÊÑßíä ?" then
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
return '?????*?*ÚÏÏ ÇáãÔÊÑßíä İí ÇáÈæÊ : `'..redis:scard(max..'users')..'` \n??'
end

if MsgText[1] == 'ŞÇÆãÉ ÇáãÌãæÚÇÊ' then 
if not msg.SudoBase then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
return chat_list(msg) 
end

if MsgText[1] == 'ÊÚØíá' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
if redis:sismember(max..'group:ids',MsgText[2]) then
local name_gp = redis:get(max..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'??*?* Êã ÊÚØíá ÇáãÌãæÚå ÈÃãÑ ãä ÇáãØæÑ  \n??*?* Óæİ ÇÛÇÏÑ ÌÇææ ???????? ...\n?')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '??*?* Êã ÊÚØíá ÇáãÌãæÚå æãÛÇÏÑÊåÇ \n??*?* ÇáãÌãæÚÉÉ » ['..name_gp..']\n??*?* ÇáÇíÏí » ( *'..MsgText[2]..'* )\n?'
else 
return '??*?* áÇ ÊæÌÏ ãÌãæÚå ãİÚáå ÈåĞÇ ÇáÇíÏí !\n ' 
end 
end 

if MsgText[1] == 'ÇáãØæÑ' then
return redis:get(max..":TEXT_SUDO") or '???áÇ ÊæÌÏ ßáíÔå ÇáãØæÑ .\n???íãßäß ÇÖÇİå ßáíÔå ãä ÎáÇá ÇáÇãÑ\n       " `ÖÚ ßáíÔå ÇáãØæÑ` " \n??'
end

if MsgText[1] == "ÇĞÇÚå ÚÇã ÈÇáÊæÌíå" or MsgText[1] == "ÇĞÇÚå ÚÇã ÈÇáÊæÌíå ??" then
if not msg.SudoUser then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "??*?* ÇáÇĞÇÚå ãŞİæáå ãä ŞÈá ÇáãØæÑ ÇáÇÓÇÓí  ??" 
end
redis:setex(max..'fwd:'..msg.sender_user_id_,300, true) 
return "???ÍÓääÇ ÇáÇä ÇÑÓá ÇáÊæÌíå ááÇĞÇÚå \n??" 
end

if MsgText[1] == "ÇĞÇÚå ÚÇã" or MsgText[1] == "ÇĞÇÚå ÚÇã ??" then		
if not msg.SudoUser then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "??*?* ÇáÇĞÇÚå ãŞİæáå ãä ŞÈá ÇáãØæÑ ÇáÇÓÇÓí  ??" 
end
redis:setex(max..'fwd:all'..msg.sender_user_id_,300, true) 
return "???ÍÓääÇ ÇáÇä ÇÑÓá ÇáßáíÔå ááÇĞÇÚå ÚÇã \n??" 
end

if MsgText[1] == "ÇĞÇÚå ÎÇÕ" or MsgText[1] == "ÇĞÇÚå ÎÇÕ ??" then		
if not msg.SudoUser then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "??*?* ÇáÇĞÇÚå ãŞİæáå ãä ŞÈá ÇáãØæÑ ÇáÇÓÇÓí  ??" 
end
redis:setex(max..'fwd:pv'..msg.sender_user_id_,300, true) 
return "???ÍÓääÇ ÇáÇä ÇÑÓá ÇáßáíÔå ááÇĞÇÚå ÎÇÕ \n??"
end

if MsgText[1] == "ÇĞÇÚå" or MsgText[1] == "ÇĞÇÚå ??" then		
if not msg.SudoUser then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "??*?* ÇáÇĞÇÚå ãŞİæáå ãä ŞÈá ÇáãØæÑ ÇáÇÓÇÓí  ??" 
end
redis:setex(max..'fwd:groups'..msg.sender_user_id_,300, true) 
return "???ÍÓääÇ ÇáÇä ÇÑÓá ÇáßáíÔå ááÇĞÇÚå ááãÌãæÚÇÊ \n??" 
end

if MsgText[1] == "ÇáãØæÑíä" or MsgText[1] == "ÇáãØæÑíä ??" then
if not msg.SudoUser then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
return sudolist(msg) 
end
 
if MsgText[1] == "ŞÇÆãÉ ÇáÚÇã" or MsgText[1]=="ŞÇÆãÉ ÇáÚÇã ??" then 
if not msg.SudoUser then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ} İŞØ  \n??" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "ÊÚØíá" and (MsgText[2] == "ÇáÊæÇÕá" or MsgText[2]=="ÇáÊæÇÕá ??") then 
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
return lock_twasel(msg) 
end

if MsgText[1] == "ÊİÚíá" and (MsgText[2] == "ÇáÊæÇÕá" or MsgText[2]=="ÇáÊæÇÕá ??") then 
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
return unlock_twasel(msg) 
end

if MsgText[1] == "ÍÙÑ ÚÇã" then
if not msg.SudoBase then 
return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "ÇáÛÇÁ ÇáÚÇã" or MsgText[1] == "ÇáÛÇÁ ÚÇã" then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "ÑÊÈÊí" then return '??*?* ÑÊÈÊß ? ? '..msg.TheRank..' ?\n?' end

----------------- ÇÓÊŞÈÇá ÇáÑÓÇÆá ---------------
if MsgText[1] == "ÇáÛÇÁ ÇáÇãÑ ??" or MsgText[1] == "ÇáÛÇÁ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
redis:del(max..'welcom:witting'..msg.sender_user_id_,
max..'rulse:witting'..msg.sender_user_id_,
max..'rulse:witting'..msg.sender_user_id_,
max..'name:witting'..msg.sender_user_id_,
max..'about:witting'..msg.sender_user_id_,
max..'fwd:all'..msg.sender_user_id_,
max..'fwd:pv'..msg.sender_user_id_,
max..'fwd:groups'..msg.sender_user_id_,
max..'namebot:witting'..msg.sender_user_id_,
max..'addrd_all:'..msg.sender_user_id_,
max..'delrd:'..msg.sender_user_id_,
max..'addrd:'..msg.sender_user_id_,
max..'delrdall:'..msg.sender_user_id_,
max..'text_sudo:witting'..msg.sender_user_id_,
max..'addrd:'..msg.chat_id_..msg.sender_user_id_,
max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return '??*?* Êã ÂáÛÂÁ ÂáÂãÜÑ ÈäÌÂÍ \n??'
end  


if MsgText[1] == 'ÇÕÏÇÑ ÇáÓæÑÓ' or MsgText[1] == 'ÇáÇÕÏÇÑ' then
return '??????? ÇÕÏÇÑ ÓæÑÓ ÇíãÇ : *v'..version..'* \n??'
end

if (MsgText[1] == 'ÊÍÏíË ÇáÓæÑÓ' or MsgText[1] == 'ÊÍÏíË ÇáÓæÑÓ ??') then
if not msg.SudoBase then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
local GetVerison = https.request('https://github.com/MasSource/MAS.github.io/GetVersion.txt') or 0
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'??*?* íæÌÏ ÊÍÏíË ÌÏíÏ ÇáÇä \n??*?* ÌÇÑí ÊäÒíá æÊËÈíÊ ÇáÊÍÏíË  ...')
redis:set(max..":VERSION",GetVerison)
return false
else
return "??| ÇáÇÕÏÇÑ ÇáÍÇáí : *v"..version.."* \n??????*?* áÏíÜß ÇÍÏË ÇÕÏÇÑ \n??"
end
return false
end

if MsgText[1] == 'äÓÎå ÇÍÊíÇØíå ááãÌãæÚÇÊ' then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'ÑİÚ äÓÎå ÇáÇÍÊíÇØíå' then
if not msg.SudoBase then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'?*?* ÌÇÑí ÑİÚ ÇáäÓÎå ÇäÊÙÑ ŞáíáÇ ... \n??')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"??*?* ÚĞÑÇ ÇáäÓÎå ÇáÇÍÊíÇØíå åĞÇ áíÓÊ ááÈæÊ » ["..Bot_User.."]  \n??")
end
else 
sendMsg(msg.chat_id_,msg.id_,'??*?* ÚĞÑÇ ÇÓã Çáãáİ ÛíÑ ãÏÚæã ááäÙÇã Çæ áÇ íÊæÇİŞ ãÚ ÓæÑÓ ÇáÒÚíã íÑÌì ÌáÈ Çáãáİ ÇáÇÕáí ÇáĞí ŞãÊ ÈÓÍÈå æÈÏæä ÊÚÏíá Ú ÇáÇÓã\n??')
end  
else
sendMsg(msg.chat_id_,msg.id_,'??*?* ÚĞÑÇ Çáãáİ áíÓ ÈÕíÛå Json !?\n??')
end 
else
sendMsg(msg.chat_id_,msg.id_,'??*?* ÚĞÑÇ åĞÇ áíÓ ãáİ ÇáäÓÍå ÇáÇÍÊíÇØíå ááãÌãæÚÇÊ\n??')
end 
end,nil)
else 
return "??*?* ÇÑÓá ãáİ ÇáäÓÎå ÇáÇÍÊíÇØíå ÇæáÇ\n??*?* Ëã Şã ÈÇáÑÏ Úáì Çáãáİ æÇÑÓá \" `ÑİÚ äÓÎå ÇáÇÍÊíÇØíå` \" "
end 
return false
end

if (MsgText[1]=="ÊíÓÊ" or MsgText[1]=="test") then 
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
return "?? ÇáÈæÊ ÔÜÛÜÜÇá ??" 
end

if (MsgText[1]== "ÇíÏí" or MsgText[1]=="ÇíÏíí??") and msg.type == "pv" then return  "\n???????Çåáä ÚÒíÒí ÇáãØæÑ ÇíÏíß åæå ?\n\n????"..msg.sender_user_id_.."\n"  end

if MsgText[1]== "ŞäÇÉ ÇáÓæÑÓ ??" and msg.type == "pv" then
local inline = {{{text="??ŞäÇå ÇáÓÜæÑÓ ÖÜÛÜØ åäÇ ",url="t.me/MasSource"}}}
send_key(msg.sender_user_id_,'  [??ŞäÇÉ ÓæÑÓ : ÇíãÇ](t.me/MasSource)',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "ÇáÇÍÕÇÆíÇÊ ??" or MsgText[1]=="ÇáÇÍÕÇÆíÇÊ") then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
return '???ÇáÇÍÕÇÆíÇÊ ??? \n\n??*?*ÚÏÏ ÇáãÌãæÚÇÊ ÇáãİÚáå : '..redis:scard(max..'group:ids')..'\n?????*?*ÚÏÏ ÇáãÔÊÑßíä İí ÇáÈæÊ : '..redis:scard(max..'users')..'\n??'
end
---------------[End Function data] -----------------------
if MsgText[1]=="ÇÖİ ÑÏ ÚÇã" or MsgText[1]=="ÇÖİ ÑÏ ÚÇã ?" then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
redis:setex(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "???ÍÓääÇ ÇáÇä ÇÑÓá ßáãÉ ÇáÑÏ ÇáÚÇã ??\n"
end

if MsgText[1]== 'ãÓÍ' and MsgText[2]== 'ÇáÑÏæÏ' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local names 	= redis:exists(max..'replay:'..msg.chat_id_)
local photo 	= redis:exists(max..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(max..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(max..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(max..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(max..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(max..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(max..'replay:'..msg.chat_id_,max..'replay_photo:group:'..msg.chat_id_,max..'replay_voice:group:'..msg.chat_id_,
max..'replay_animation:group:'..msg.chat_id_,max..'replay_audio:group:'..msg.chat_id_,max..'replay_sticker:group:'..msg.chat_id_,max..'replay_video:group:'..msg.chat_id_)
return "? Êã ãÓÍ ßá ÇáÑÏæÏ ??"
else
return '??*?* áÇ íæÌÏ ÑÏæÏ áíÊã ãÓÍåÇ \n??'
end
end

if MsgText[1]== 'ãÓÍ' and MsgText[2]== 'ÇáÑÏæÏ ÇáÚÇãå' then
if not msg.SudoBase then return"?? ááãØæÑíä İŞØ ! ??" end
local names 	= redis:exists(max..'replay:all')
local photo 	= redis:exists(max..'replay_photo:group:')
local voice 	= redis:exists(max..'replay_voice:group:')
local imation 	= redis:exists(max..'replay_animation:group:')
local audio 	= redis:exists(max..'replay_audio:group:')
local sticker 	= redis:exists(max..'replay_sticker:group:')
local video 	= redis:exists(max..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(max..'replay:all',max..'replay_photo:group:',max..'replay_voice:group:',max..'replay_animation:group:',max..'replay_audio:group:',max..'replay_sticker:group:',max..'replay_video:group:')
return "? Êã ãÓÍ ßá ÇáÑÏæÏ ÇáÚÇãå??"
else
return "áÇ íæÌÏ ÑÏæÏ ÚÇãå áíÊã ãÓÍåÇ ! ??"
end
end

if MsgText[1]== 'ãÓÍ' and MsgText[2]== 'ÑÏ ÚÇã' then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
redis:set(max..'delrdall:'..msg.sender_user_id_,true) 
return "???ÍÓääÇ ÚÒíÒí  ???\n???ÇáÇä ÇÑÓá ÇáÑÏ áãÓÍåÇ ãä  ÇáãÌãæÚÇÊ ??"
end

if MsgText[1]== 'ãÓÍ' and MsgText[2]== 'ÑÏ' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
redis:set(max..'delrd:'..msg.sender_user_id_,true)
return "???ÍÓääÇ ÚÒíÒí  ???\n???ÇáÇä ÇÑÓá ÇáÑÏ áãÓÍåÇ ãä  ááãÌãæÚå ??"
end

if MsgText[1]== 'ÇáÑÏæÏ' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local names  	= redis:hkeys(max..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(max..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(max..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(max..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(max..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(max..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(max..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '??*?*áÇ íæÌÏ ÑÏæÏ ãÖÇİå ÍÇáíÇ \n??' 
end
local ii = 1
local message = '??*?*ÑÏæÏ ÇáÈæÊ İí ÇáãÌãæÚå  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( ÕæÑå ?? ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( äÕ ?? ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( ÈÕãå ?? ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( ãÊÍÑßå ?? ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( ÕæÊíå ?? ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ãáÕŞ ?? ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( İíÏíæ  ?? ) \n' ii = ii + 1 end
return message..'\n???'
end

if MsgText[1]== 'ÇáÑÏæÏ ÇáÚÇãå' or MsgText[1]=='ÇáÑÏæÏ ÇáÚÇãå ??' then
if not msg.SudoBase then return "?? ááãØæÑ İŞØ ! ??" end
local names 	= redis:hkeys(max..'replay:all')
local photo 	= redis:hkeys(max..'replay_photo:group:')
local voice 	= redis:hkeys(max..'replay_voice:group:')
local imation 	= redis:hkeys(max..'replay_animation:group:')
local audio 	= redis:hkeys(max..'replay_audio:group:')
local sticker 	= redis:hkeys(max..'replay_sticker:group:')
local video 	= redis:hkeys(max..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '??*?*áÇ íæÌÏ ÑÏæÏ ãÖÇİå ÍÇáíÇ \n??' 
end
local ii = 1
local message = '??*?*ÇáÑÏæÏ ÇáÚÇãå İí ÇáÈæÊ :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( ÕæÑå ?? ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( äÕ ?? ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( ÈÕãå ?? ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( ãÊÍÑßå ?? ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( ÕæÊíå ?? ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ãáÕŞ ?? ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( İíÏíæ  ?? ) \n'ii = ii + 1 end
return message..'\n???'
end


if MsgText[1]=="ÇÖİ ÑÏ" and msg.GroupActive then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
redis:setex(max..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(max..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "???ÍÓääÇ , ÇáÇä ÇÑÓá ßáãå ÇáÑÏ \n-"
end

if MsgText[1] == "ÖÚ ÇÓã ááÈæÊ" or MsgText[1]== 'ÖÚ ÇÓã ááÈæÊ ©' then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
redis:setex(max..'namebot:witting'..msg.sender_user_id_,300,true)
return"???ÍÓääÇ ÚÒíÒí  ???\n???ÇáÇä ÇÑÓá ÇáÇÓã  ááÈæÊ ??"
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '?? ? Seystem ?\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*?? ? Memory ?\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*?? ? HardDisk ?\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*?? ? Processor ?\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*?????? ? Server[_]Login ?\n*»» '`whoami`'*'
echo '*------------------------------\n*?? ? Uptime ?  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'ÇáÓíÑİÑ' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '??l ? äÙÇã ÇáÊÔÛíá ?\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*??l ? ÇáĞÇßÑå ÇáÚÔæÇÆíå ?\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*??l ? æÍÜÏå ÇáÜÊÜÎÜÒíÜä ?\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*??l ? ÇáÜãÜÜÚÜÜÇáÜÜÌ ?\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*??????l ? ÇáÜÜÏÎÜÜæá ?\n*»» '`whoami`'*'
echo '*------------------------------\n*??l ? ãÜÏå ÊÜÔÛíÜá ÇáÜÓÜíÜÑİÜÑ ?  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "ÇáÇæÇãÑ" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
return [[
??ÌãíÚ ÇáÃæÇãÑ ÇáÚÇãåş ?

??ã1 » ÇæÇãÑ ÇáÇÏÇÑå
??ã2 » ÇæÇãÑ ÇÚÏÇÏÇÊ ÇáãÌãæÚå
??ã3 » ÇæÇãÑ ÇáÍãÇíå
??ã4 » ÇæÇãÑ ÂáÎÏãå 
??ã5 » ÇæÇãÑ ÇáÑÏæÏ
??ã6 » ÇæÇãÑ ÇáÊÓáíå
??ã ÇáãØæÑ »  ÇæÇãÑ ÇáãØæÑ
??ÇáæÓÇÆØ » áãÚÑİå ÇáÇÚÏÇÏÇÊ 
??ÇáÇÚÏÇÏÇÊ » ÚÏÇÏÇÊ ÇáãÌãæÚå
??ÓæÑÓ » ÓæÑÓ ÇáÈæÊ
??ÇáãØæÑ » ãØæÑ ÇáÈæÊ 

 şış???ÑÂÓÜáäí ááÂÓÜÊİÓÜÂÑ ? { ]]..SUDO_USER..[[ } ? ]]
end
if MsgText[1]== 'ã1' then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local text =[[
1-?ÇæÇãÑ ÇáÑİÚ æÇáÊäÒíá ááãäÔÆ ÇáÇÓÇÓí?

?¦ ÑİÚ ãäÔì+ÊäÒíá ãäÔì 
?¦ ÑİÚ ÇáãÏíÑ+ÊäÒíá ÇáãÏíÑ
?¦ ÑİÚ ÇÏãä+ÊäÒíá ÇÏãä 
?¦ ÑİÚ ããíÒ+ÊäÒíá ããíÒ 
?¦ ÊäÒíá Çáßá:(ÊäÒíá ÇáããíÒíä æÇáãÏÑÇÁ æÇáÇÏãäíå ÈÇãÑ æÇÍÏ)
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
2- ? ÇæÇãÑ ãÓÍ ááãäÔÆííä  ? 

?¦ ãÓÍ ÇáãäÔÆííä=áãÓÍ ãäÔÆííä 
?¦ ãÓÍ ÇáÇÏãäíå =áãÓÍ ÇáÇÏãäíå 
?¦ ãÓÍ ÇáããíÒíä =áãÓÍ ÇáããíÒíä 
?¦ ãÓÍ ÇáãÏÑÇÁ = áãÓÍ ÇáãÏÑÇÁ 
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
3- ? ÂæÂãÜÑ ÂáÍÙÜÑ æÂáØÜÜÑÏ æÂáÊŞííÏ ?
      
?¦ ÍÙÑ ?ÈÇáÑÏ+ÈÇáãÚÑİ? áÍÙÑ ÇáÚÖæ
?¦ ÇáÛÇÁ ÇáÍÙÑ ?ÈÇáÑÏ+ÈÇáãÚÑİ? 
?¦ ØÑÏ ? ÈÇáÑÏ+ÈÇáãÚÑİ ? áØÑÏ ÇáÚÖæ
?¦ ßÊã ? ÈÇáÑÏ+ÈÇáãÚÑİ ? áßÊã ÇáÚÖæ
?¦ ÇáÛÇÁ ÇáßÊã ?ÈÇáÑÏ+ÈÇáãÚÑİ?
?¦ ÊŞííÏ?ÈÇáÑÏ+ÈÇáãÚÑİ?áÊŞííÏ ÇáÚÖæ
?¦ İß ÇáÊŞííÏ ?ÈÇáÑÏ+ÈÇáãÚÑİ?
?¦ ãäÚ+Çáßáãå=áãäÚ ßáãå ÈÇáãÌãæÚå
?¦ ÇáÛÇÁ ãäÚ = áÇáÛÇÁ ãäÚ Çáßáãå 
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

??*?* ÑÇÓáäí ááÇÓÊİÓÇÑ ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'ã2' then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local text = [[
1- ? ÇæÇãÑ ÇáæÖÚ ááãÌãæÚå ?
  
??ÖÚ ÇáÊÑÍíÈ ? áæÖÚ ÊÑÍíÈ  
??ÖÚ ÇáŞæÇäíä ? áæÖÚ ÇáŞæÇäíä 
??ÖÚ æÕİ ? áæÖÚ æÕİ  
??ÖÚ ÑÇÈØ ? áæÖÚ ÇáÑÇÈØ  
??ÇáÜÑÇÈÜØ ? áÚÑÖ ÇáÑÇÈØ  
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
2- ? ÇæÇãÑ ÑÄíÉ ÇáÇÚÏÇÏÇÊ ?

??ÇáãäÔÆííä: áÚÑÖ ÇáãäÔÆííä 
??ÇáÇÏãäíå: áÚÑÖ  ÇáÇÏãäíå 
??ÇáãÏÑÇÁ: áÚÑÖ  ÇáÇÏÇÑííä 
??ÇáãßÊæãíä: áÚÑÖ  ÇáãßÊæãíä 
??ÇáÍãÇíå: áÚÑÖ ßá ÇáÇÚÏÇÏÇÊ  
??ÇáæÓÇÆØ: áÚÑÖ ÇÚÏÇÏÇÊ ÇáãíÏíÇ 
??ÇáŞæÇäíä: áÚÑÖ  ÇáŞæÇäíä 
??ÇáÇÚÏÇÏÇÊ: áÚÑÖ ÇÚÏÇÏÇÊ ÇáãÌãæÚå 
??ÇáãÌãæÚå: áÚÑÖ ãÚáæãÇÊ ÇáãÌãæÚå
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

??*?* ÑÇÓáäí ááÇÓÊİÓÇÑ ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'ã3' then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local text = [[
????????
¹??ÇæÇãÑ ÍãÇíÜå ÇáãÌãæÚå?
????Ü????     
???Şİá «» İÊÍ ?ÇáßÜÜÜá?
????Şİá «» İÊÍ ?ÇáÊÜÇß?
???Şİá «» İÊÍ ?ÇáİíÜÏíÜÜÜæ?
???Şİá «» İÊÍ ?ÇáÕÜÜÜÜÜÜÜÜæÑ?
???Şİá «» İÊÍ ?ÇáãáÕŞÇÊ?
???Şİá «» İÊÍ ?ÇáãÊÍÑßå?
???Şİá «» İÊÍ ?ÇáÈÕãÜÜÇÊ?
???Şİá «» İÊÍ ?ÇáÏÑÏÔÜÜÜå?
???Şİá «» İÊÍ ?ÇáÜÜÑæÇÈÜÜÜØ?
???Şİá «» İÊÍ ?ÇáÈÜÜÜæÊÜÜÇÊ?
???Şİá «» İÊÍ ?ÇáÊÚÜÜÏíÜÜá?
???Şİá «» İÊÍ ?ÇáãÚÑİÜÜÇÊ?
???Şİá «» İÊÍ ?ÇáßÜÜÜáÇíÜÔ?
???Şİá «» İÊÍ ?ÇáÊÜÜÜßÜÜÜÜÜÑÇÑ?
???Şİá «» İÊÍ ?ÇáÌÜÜåÜÜÜÜÜÇÊ?
???Şİá «» İÊÍ ?ÇáÇäÜÜÜáÇíÜÜä?
???Şİá «» İÊÍ ?ÇáÊæÌíÜÜÜÜå?
???Şİá «» İÊÍ ?ÇáÏÎæá ÈÇáÑÇÈØ?
????Şİá «» İÊÍ ?ÇáÈæÊÇÊ ÈÇáØÑÏ?
????Ü????     
²??ÇáŞİá ÈÇáÊŞííÜÏ?
????Ü????                                                                                        
???Şİá «» İÊÍ ?ÇáÜÜÕÜÜÜÜÜÜæÑ ÈÇáÊŞííÜÏ?
???Şİá «» İÊÍ ?ÇáÜÜÑæÇÈÜÜØ ÈÇáÊŞííÜÏ?
???Şİá «» İÊÍ ?ÇáãÊÍÑßå ÈÇáÊŞííÜÏ?
???Şİá «» İÊÍ ?ÇáİíÜÜÜÏíÜÜæ ÈÇáÊŞííÏ?
???Şİá «» İÊÍ ?ÇáÊæÌíÜÜå ÈÇáÊŞííÜÜÏ? 
????Ü????
??*?* ÑÇÓáäí ááÇÓÊİÓÇÑ ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'ã4' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local text = [[
??ÇæÇãÑ ÇáÎÏãå  ?

??ÇíÏí ? áÚÑÖ ÕæÑÊß + ãÚáæãÇÊß 
??ÇíÏíí ? áÚÑÖ ÇíÏíß 
??ÇíÏí ÈÇáÑÏ ? áÚÑÖ ÇíÏí ÇáÔÎÕ 
??ÌåÇÊí ? áãÚÑİå ÚÏÏ ÌåÇÊß 
??ÇáÑÇÈØ ? áÓÎÑÇÌ ÑÇÈØ ÇáãÌãæÚå
??ãÚáæãÇÊí ? áÚÑÖ ãÚáæãÇÊß 
??ÇáÇáÚÇÈ ? áÚÑÖ ÇáÚÇÈ ÇáÈæÊ 
??äŞÇØí ? áãÚÑİå ÚÏÏ äŞÇØß
??ÈíÚ äŞÇØí + ÇáÚÏÏ ? áÈíÚ äŞÇØß 
??ÇáÓæÑÓ ? áÚÑÖ ÓæÑÓ ÇáÈæÊ 
??ÇáÑÊÈå ÈÇáÑÏ ? áãÚÑİå ÑÊÈÉ ÇáÔÎÕ
??ÇáÊİÇÚá+ÇáãÚÑİ ?ÊİÇÚá ÇáÔÎÕ 
??ßÔİ ÈÇáÑÏ ? ãÚáæãÇÊ ÍÓÇÈå
??ßÔİ ÈÇáãÚÑİ ? ãÚáæãÇÊ ÍÓÇÈå 
??ØÑÏ ÇáÈæÊÇÊ ? áØÑÏ ßá ÇáÈæÊÇÊ
??ØÑÏ ÇáãÍĞæİíä ? áØÑÏ ÇáãÍĞæİíä
??ßÔİ ÇáÈæÊÇÊ ? ÚÏÏ ÇáÈæÊÇÊ 
??ÑÇÈØ ÇáÍĞİ ? áÍĞİ ÍÓÇÈß
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

??*?* ÑÇÓáäí ááÇÓÊİÓÇÑ ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'ã5' then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local text =[[
?? ÇæÇãÑ ÇáÑÏæÏ 

???ÇáÑÏæÏ ? áÚÑÖ ÇáÑÏæÏ ÇáãËÈÊå
???ÇÖİ ÑÏ ? áÃÖÇİå ÑÏ ÌÏíÏ
???ãÓÍ ÑÏ  ? ÇáÑÏ ÇáãÑÇÏ ãÓÍå
???ãÓÍ ÇáÑÏæÏ ? áãÓÍ ßá ÇáÑÏæÏ
???ÇáÑÏæÏ ÇáÚÇãå ? áãÚÑİ ÇáÑÏæÏ ÇáãËÈÊå ÚÇã 
???ÇÖİ ÑÏ ÚÇã ? áÇÖÇİå ÑÏ áßá ÇáãÌãæÚÇÊ
???ãÓÍ ÑÏ ÚÇã ? áãÓÍ ÇáÑÏ ÇáÚÇã 
???ãÓÍ ÇáÑÏæÏ ÇáÚÇãå ? áãÓÍ ßá ÑÏæÏ ÇáÚÇãå
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
? ÇáÊİÚíá æ ÇáÊÚØíá ?

???ÊİÚíá «» ÊÚØíá  ? ÇáÑİÜÜÚ ?
???ÊİÚíá «» ÊÚØíá  ? ÇáÑÏæÏ ?
???ÊİÚíá «» ÊÚØíá  ?ÇáÇáÚÜÇÈ?
???ÊİÚíá «» ÊÚØíá  ? ÇáÊÍĞíÑ ?
???ÊİÚíá «» ÊÚØíá  ? ÇáÊÑÍíÈ ?
???ÊİÚíá «» ÊÚØíá  ? ÇáÇíÏí ?
???ÊİÚíá «» ÊÚØíá  ? ÇáÇíÏí ÈÇáÕæÑå ?
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

??*?* ÑÇÓáäí ááÇÓÊİÓÇÑ ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'ã6' then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
local text = [[
???? ÂæÂãÑ ÇáÊÓáíå?
??????ãÑÍÈÂ ÚÒíÒí ¡
???ÅáíÜß ÇæÇãÑ ÇáÊÓáíå ßÜ ÇáÊÇáí
????Ü????
???ÑİÚ «» ÊäÒíá ? ÒŞ ?
???ÑİÚ «» ÊäÒíá ? ÈŞÑå ?
???ÑİÚ «» ÊäÒíá ? ŞÑÏ ?
???ÑİÚ «» ÊäÒíá ? ßáÈ ?
???ÑİÚ «» ÊäÒíá ? ÍãÇÑ ?
???ÑİÚ «» ÊäÒíá ? ÊíÓ ?
???ÑİÚ «» ÊäÒíá ? ËæÑ ?
???ÑİÚ «» ÊäÒíá ? ÏÌÇÌå ?
?????ÑİÚ «» ÊäÒíá ? ĞÈÇäå ?
???ÑİÚ «» ÊäÒíá ? ÈÕáå ?
???ÑİÚ «» ÊäÒíá ? ßíßå ?
???ÑİÚ «» ÊäÒíá ? ÒÇÍİ ?
???ÑİÚ «» ÊäÒíá ? ÒæÌÊí ?
???ÑİÚ «» ÊäÒíá ? ÒæÌí ?
???ÑİÚ «» ? áŞáÈí ? ÊäÒíá «» ? ãä ŞáÈí?
???? ØáÇŞ ? «» ? ÒæÇÌ ?
????Ü????

??*?* ÑÇÓáäí ááÇÓÊİÓÇÑ ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "ã ÇáãØæÑ" then
if not msg.SudoBase then return "???ááãØæÑ ÇáÇÓÇÓí İŞØ  ??" end
local text = [[
???????ÇæÇãÑ ÇáãØæÑ º ˜ ÊÇáí ... ?

??ÊİÚíá ? áÊİÚíá ÇáÈæÊ 
??ÊÚØíá ? áÊÚØíá ÇáÈæÊ 
??ÇÓã ÈæÊß + ÛÇÏÑ ? áØÑÏ ÇáÈæÊ
??ãÓÍ ÇáãØæÑíä ? áãÓÍ ÇáãØæÑíä
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
??ÇĞÇÚå ? áäÔÑ ááãÌæÚÇÊ
??ÇĞÇÚå ÎÇÕ ? áäÔÑ ÑÓÇáå ááÎÇÕ
??ÇĞÇÚå ÚÇã ? áäÔÑ ÑÓÇáå ááßá 
??ÇĞÇÚå ÚÇã ÈÇáÊæÌíå ?áäÔÑ ÈÇáÊæÌíå
??ÊäÙíİ ÇáãÌãæÚÇÊ ? áãÓÍ ÇáãÌãæÚÇÊ Çáæåãíå  
??ÊäÙíİ ÇáãÔÊÑßíä ? áãÓÍ ÇáãÔÊÑßíä Çáæåãííä 
??ÊÍÏíË ? áÊÍÏíË ãáİÇÊ ÇáÈæÊ
??ÊÍÏíË ÇáÓæÑÓ ?ÊÍÏíË ÇáÓæÑÓ 
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

??*?* ÑÇÓáäí ááÇÓÊİÓÇÑ ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== 'ÇæÇãÑ ÇáÑÏ' then
if not msg.Director then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ,ÇáãäÔÆ,ÇáãÏíÑ} İŞØ  \n??" end
local text = [[
????????     
??????ÌãíÚ ÇæÇãÑ ÇáÑÏæÏ ?
????Ü????
???ÇáÑÏæÏ «» áÚÑÖ ÇáÑÏæÏ ÇáãËÈÊå
???ÇÖİ ÑÏ «» áÃÖÇİå ÑÏ ÌÏíÏ
???ãÓÍ ÑÏ «» ÇáÑÏ ÇáãÑÇÏ ãÓÍå
???ãÓÍ ÇáÑÏæÏ «» áãÓÍ ßá ÇáÑÏæÏ
???ÇáÑÏæÏ ÇáÚÇãå «» áãÚÑİ ÇáÑÏæÏ ÇáãËÈÊå ÚÇã 
???ÇÖİ ÑÏ ÚÇã «» áÇÖÇİå ÑÏ áßá ÇáãÌãæÚÇÊ
???ãÓÍ ÑÏ ÚÇã  «» áãÓÍ ÇáÑÏ ÇáÚÇã 
???ãÓÍ ÇáÑÏæÏ ÇáÚÇãå «» áãÓÍ ßá ÑÏæÏ ÇáÚÇãå
????Ü????
??*?* ÑÇÓáäí ááÇÓÊİÓÇÑ ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "ÊİÚíá" and MsgText[2] == "ÇØÑÏäí"  then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if not redis:get(max..'lave_me'..msg.chat_id_) then 
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇáãÛÇÏÑå ÈÇáÊÇßíÏ Êã ÊİÚíáåÇ\n?" 
else 
redis:del(max..'lave_me'..msg.chat_id_) 
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* Êã ÊİÚíá ÇáãÛÇÏÑå \n?" 
end 
end
if MsgText[1] == "ÊÚØíá" and MsgText[2] == "ÇØÑÏäí" then
if not msg.Admin then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáÇÏãä,ÇáãÏíÑ,ÇáãäÔÆ,ÇáãØæÑ} İŞØ  \n??" end
if redis:get(max..'lave_me'..msg.chat_id_) then 
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* ÇáãÛÇÏÑå ãä ŞÈá ÇáÈæÊ ÈÇáÊÃßíÏ ãÚØáå\n?" 
else
redis:set(max..'lave_me'..msg.chat_id_,true)  
return "?????*?*ÃåáÇ ÚÒíÒí "..msg.TheRankCmd.."\n??*?* Êã ÊÚØíá ÇáãÛÇÏÑå ãä ŞÈá ÇáÈæÊ\n?" 
end   
end

if MsgText[1] == "ÇØÑÏäí" or MsgText[1] == "ÇÍÙÑäí" then
if not redis:get(max..'lave_me'..msg.chat_id_) then
if msg.Admin then return "??*?*áÇ ÇÓÊØíÚ ØÑÏ ÇáãÏÑÇÁ æÇáÇÏãäíå æÇáãäÔÆíä  \n??" end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"??????| ÇåáÇ ÚÒíÒí , áŞÏ Êã ØÑÏß ãä ÇáãÌãæÚå ÈÇãÑ ãäß \n??| ÇĞÇ ßÇä åĞÇ ÈÇáÎØÃ Çæ ÇÑÏÊ ÇáÑÌæÚ ááãÌãæÚå \n\n???İåĞÇ ÑÇÈØ ÇáãÌãæÚå ??\n???"..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(max..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"??| áŞÏ Êã ØÑÏß ÈäÌÇÍ , ÇÑÓáÊ áß ÑÇÈØ ÇáãÌãæÚå İí ÇáÎÇÕ ÇĞÇ æÕáÊ áß ÊÓÊØíÚ ÇáÑÌæÚ ãÊì ÔÆÊ ")
else
sendMsg(msg.chat_id_,msg.id_,"??| áÇ ÇÓÊØíÚ ØÑÏß áÇäß ãÔÑİ İí ÇáãÌãæÚå  ")
end
end)
return false
end
end

end 

if MsgText[1] == "ÓæÑÓ" or MsgText[1]=="ÇáÓæÑÓ" then
return [[
?
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

???????? | ãØæÑ ÇáÓæÑÓ : @MASx92

?? | ÇáŞäÇÉ ÇáÎÇÕÉ ÈÇáÓæÑÓ : @MasSource

ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ


]]
end


if MsgText[1] == "ÇáÊÇÑíÎ" then
return "?\n??| ÇáÜÊÜÇÑíÜÎ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "ÎÑİÔÊí" then
return '??*?*ÚÏÏ ÎÑİÔÊß ? ? '..(redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ? \n??'
end

if MsgText[1] == 'ãÓÍ' and MsgText[2] == 'ÎÑİÔÊí'  then
local rfih = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "??*?*ÚĞÑÇ áÇ íæÌÏ ÎÑİÔÇÊ áß İí ÇáÈæÊ  ??" end
redis:del(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "??*?*Êã ãÓÍ {* "..rfih.." *} ãä ÎÑİÔÇÊß ??\n?"
end

if MsgText[1] == "ÊİÚíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí" or MsgText[1] == "ÊİÚíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ?" then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
if redis:get(max..":UserNameChaneel") then
return "???ÇåáÇ ÚÒíÒí ÇáãØæÑ \n???ÇáÇÔÊÑÇß ÈÇáÊÃßíÏ ãİÚá"
else
redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
return "???ãÑÍÈÇ ÈÜß İí äÙÇã ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí\n???ÇáÇä ÇÑÓá ãÚÑİ ŞÜäÜÇÊÜß"
end
end

if MsgText[1] == "ÊÚØíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí" or MsgText[1] == "ÊÚØíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??" then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
local SubDel = redis:del(max..":UserNameChaneel")
if SubDel == 1 then
return "???Êã ÊÚØíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí . \n?"
else
return "???ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ÈÇáİÚá ãÚØá . \n?"
end
end

if MsgText[1] == "ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí" or MsgText[1] == "ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??" then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
local UserChaneel = redis:get(max..":UserNameChaneel")
if UserChaneel then
return "???ÇåáÇ ÚÒíÒí ÇáãØæÑ \n???ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ááŞäÇÉ : ["..UserChaneel.."]\n?"
else
return "???áÇ íæÌÏ ŞäÇÉ ãİÚáå Ú ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí. \n?"
end
end

if MsgText[1] == "ÊÛííÑ ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí" or MsgText[1] == "ÊÛííÑ ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??" then
if not msg.SudoBase then return"??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
return "???ãÑÍÈÇ ÈÜß İí äÙÇã ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí\n???ÇáÇä ÇÑÓá ãÚÑİ ŞÜäÜÇÊÜß"
end





end

local function dmax(msg)

local Text = msg.text
if Text then

------set cmd------
Black = msg.text 
mmd = redis:get(max..'addcmd'..msg.chat_id_..msg.sender_user_id_)
if mmd then
redis:sadd(max..'CmDlist:'..msg.chat_id_,msg.text)
redis:hset(max..'CmD:'..msg.chat_id_,msg.text,mmd)
sendMsg(msg.chat_id_,msg.id_,'??????ÇåáÇ ÚÒíÒí \n???Êã ÊËÈíÊ ÇáÇãÑ ÇáÌÏíÏ\n?')
redis:del(max..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end

if Black:match('ÊÛíÑ ÇãÑ (.*)') then
if not msg.Kara then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãäÔÆ ÇáÇÓÇÓí,ÇáãØæÑ,ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
local cmd = Black:match('ÊÛíÑ ÇãÑ (.*)') 
redis:setex(max..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'??????ÇåáÇ Èß ÚÒíÒí\n???ÇáÇãÑ Çáí ÊÑíÏ ÊÛíÑå Çáí  >'..cmd..'< \n???ÇÑÓáå ÇáÇä\n? ')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^ãÓÍ ÇãÑ (.*)')) then
if not msg.Kara then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãäÔÆ ÇáÇÓÇÓí,ÇáãØæÑ,ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
local cmd = Black:match('^delcmd (.*)') or Black:match('^ãÓÍ ÇãÑ (.*)')
redis:hdel(max..'CmD:'..msg.chat_id_,cmd)
redis:srem(max..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"??????ÇåáÇ ÚÒíÒí\nÇáÇãÑ >"..cmd.."\n??? Êã ãÓÍå ãä ŞÇÆãÉ ÇáÇæÇãÑ\n?")
end
if Black == 'ãÓÍ ŞÇÆãÉ ÇáÇæÇãÑ' or Black == 'ãÓÍ ŞÇÆãÉ ÇáÇæÇãÑ' then
if not msg.Kara then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãäÔÆ ÇáÇÓÇÓí,ÇáãØæÑ,ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
redis:del(max..'CmD:'..msg.chat_id_)
redis:del(max..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"??| ÇåáÇ ÚÒíÒí Êã ãÓÍ ŞÇÆãÉ ÇáÇæÇãÑ")
end
if Black == "ŞÇÆãÉ ÇáÇæÇãÑ" then
if not msg.Kara then return "??*?*åĞÇ ÇáÇãÑ íÎÕ {ÇáãäÔÆ ÇáÇÓÇÓí,ÇáãØæÑ,ÇáãØæÑ ÇáÇÓÇÓí} İŞØ  \n??" end
local CmDlist = redis:smembers(max..'CmDlist:'..msg.chat_id_)
local t = '??| ŞÇÆãÉ ÇáÇæÇãÑ : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(max..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '?| ÚÒíÒí áã ÊŞã È ÇÖÇİå ÇãÑ !'
end
sendMsg(msg.chat_id_,msg.id_,t)
end

if Text == 'time' or Text == 'ÇáæŞÊ' and KaraJoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}'	
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^ÊÍæíá ãáÕŞ$') and tonumber(msg.reply_to_message_id_) > 0 then
whoami()
BD = '/home/root/.telegram-cli/data/'
function tosticker(arg,data)
if data.content_.ID == 'MessagePhoto' then
if BD..'photo/'..data.content_.photo_.id_..'_(1).jpg' == '' then
pathf = BD..'photo/'..data.content_.photo_.id_..'.jpg'
else
pathf = BD..'photo/'..data.content_.photo_.id_..'_(1).jpg'
end
sendSticker(msg.chat_id_,msg.id_,pathf,'')
else
sendMsg(msg.chat_id_,msg.id_,'??????ÚÒíÒí ÇáãÓÊÎÏã?????? \n???ÇáÇãÑ İŞØ ááÕæÑå\n?')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

if Text == 'tophoto' or Text == 'ÕæÑå' and tonumber(msg.reply_to_message_id_) > 0 then
function tophoto(kara,max)   
if max.content_.ID == "MessageSticker" then        
local bd = max.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'??????ÚÒíÒí ÇáãÓÊÎÏã?????? \n???ÇáÇãÑ İŞØ ááãáÕŞ\n?')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(max..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*???* Êã ÍÙÑß ãä ÇáÈæÊ ÈÓÈÈ ÇáÊßÑÇÑ \n??') 
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then

if msg.SudoBase then
local text = '??????ãäæÑ íŞáÈí ?\n???ÂäÊ ÂáãÜØÜæÑ ÂáÂÓÜÂÓÜí åäÂ ??\nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\n\n???ÊÓÜÊØÜíÚş ÇáÊÍßã Èßá ÂáÂæÂãÜÑ ÂáãÜãÜæÌæÏåş ÈÇáßíÈæÑÏ ÇáÎÇÕ ÈÇáÈæÊ\n???İŞØ ÇÖÜÛØ Ú ÇáÇãÜÑ ÇáĞí ÊÑíÏ ÊäİíĞå'
local keyboard = {
{"ÖÚ ÇÓã ááÈæÊ ©","ÖÚ ÕæÑå ááÊÑÍíÈ ??"},
 {"ÊÚØíá ÇáÊæÇÕá ??","ÊİÚíá ÇáÊæÇÕá ??"},
{"ÊÚØíá ÇáÈæÊ ÎÏãí","ÊİÚíá ÇáÈæÊ ÎÏãí","ÇáãØæÑíä ??"},
 {"ÇáãÔÊÑßíä ?","ÇáãÌãæÚÇÊ ??","ÇáÇÍÕÇÆíÇÊ ??"},
 {"ÇÖİ ÑÏ ÚÇã ?","ÇáÑÏæÏ ÇáÚÇãå ??"},
 {"ÇĞÇÚå ??","ÇĞÇÚå ÎÇÕ ??"},
{"ÇĞÇÚå ÚÇã ??","ÇĞÇÚå ÚÇã ÈÇáÊæÌíå ??"},
 {"ÊÍÏíË ??","ŞÇÆãå ÇáÚÇã ??","ÇíÏíí??"},
{"ÊÚØíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??","ÊİÚíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ?"},
{"ÊÛííÑ ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??","ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??"},
{"ÊäÙíİ ÇáãÔÊÑßíä ??","ÊäÙíİ ÇáãÌãæÚÇÊ ??"},
 {"äÓÎå ÇÍÊíÇØíå ááãÌãæÚÇÊ"},
 {"ŞäÇÉ ÇáÓæÑÓ ??"},
 {"ÊÍÏíË ÇáÓæÑÓ ??"},
 {"ÇáÛÇÁ ÇáÇãÑ ??"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(max..'users',msg.sender_user_id_)
if redis:get(max..'lock_service') then 
text = [[ 
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

??  ÃåáÇğ ÃäÇ ÈæÊ æÅÓãí   []]..redis:get(max..':NameBot:')..[[] ??

ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ÅÎÊÕÇÕí :


ÇáãÓÇÚÏÉ Úáì ÅÏÇÑÉ ÇáãÌãæÚÇÊ æÍãÇíÊåÇ ãä ÇáÓÈÇã æÇáÊæÌíå æÇáÊßÑÇÑ ÇáÎ..    
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
áÊİÚíá ÇáÈæÊ ÇÊÈÚ ãÇ íáí :

1- ÃÖİ ÇáÈæÊ Åáì ÇáãÌãæÚÉ ÇáÎÇÕÉ Èß.
2- ÅÑİÚ ÇáÈæÊ ãÔÑİ İí ÇáãÌãæÚÉ.
3- ÊÍæíá ÓÌá ÇáãÍÇÏËÉ ááÃÚÖÇÁ ÇáÌÏÏ Åáì ÙÇåÑ.
4- ÃÑÓá ÊİÚíá İí ÇáãÌãæÚÉ æÓíÊã ÊİÚíá ÇáÈæÊ ÈäÌÇÍ.
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
??????? ãÚÑİ ÇáÜãÜØÜæÑ : ]]..SUDO_USER..[[
]]
else
text = [[ 
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

??  ÃåáÇğ ÃäÇ ÈæÊ æÅÓãí   []]..redis:get(max..':NameBot:')..[[] ??

ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ÅÎÊÕÇÕí :


ÇáãÓÇÚÏÉ Úáì ÅÏÇÑÉ ÇáãÌãæÚÇÊ æÍãÇíÊåÇ ãä ÇáÓÈÇã æÇáÊæÌíå æÇáÊßÑÇÑ ÇáÎ..    
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
áÊİÚíá ÇáÈæÊ ÇÊÈÚ ãÇ íáí :

1- ÃÖİ ÇáÈæÊ Åáì ÇáãÌãæÚÉ ÇáÎÇÕÉ Èß.
2- ÅÑİÚ ÇáÈæÊ ãÔÑİ İí ÇáãÌãæÚÉ.
3- ÊÍæíá ÓÌá ÇáãÍÇÏËÉ ááÃÚÖÇÁ ÇáÌÏÏ Åáì ÙÇåÑ.
4- ÃÑÓá ÊİÚíá İí ÇáãÌãæÚÉ æÓíÊã ÊİÚíá ÇáÈæÊ ÈäÌÇÍ.
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
??????? ãÚÑİ ÇáÜãÜØÜæÑ : ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="ãÜØÜæÑ ÇáÜÈÜæÊ ?",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "ÑİÚ äÓÎå ÇáÇÍÊíÇØíå" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(max.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"???Êã ÂÑÓÜÂá ÂáÑÓÜÂáşşåÀ ??\n???Âáì : "..USERNAME.." ????",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(max..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"???ÚĞÑÂ áÂ íãÜä ÂÑÓÜÂá { ÊæÌíåÀş , ãÜáÕÜŞ , İÏíæ Âã} ??")
return false
end
redis:setex(max.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"???Êã ÂÑÓÜÂá ÑÓÜÂáÊ Âáì ÂáãÜØÜæÑ\n???ÓÜÂÑÏ Úáí İí ÂŞÑÈ æŞÊ\n?????ãÚÑİ ÇáãØæÑ "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

--====================== Reply Only Group ====================================
if redis:get(max..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(max..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ? Êã ÇÖÇİÊ ÇáÑÏ ?? \n-')
elseif msg.photo then 
redis:hset(max..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ÕæÑå ááÑÏ ÈäÌÇÍ ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáÕæÑå ÇáÇÊíå ')
elseif msg.voice then
redis:hset(max..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ÈÕãå ÕæÊ ááÑÏ ÈäÌÇÍ ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÓãÇÚ ÇáÈÕãå ÇáÇÊíå ')
elseif msg.animation then
redis:hset(max..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ãÊÍÑßå ááÑÏ ÈäÌÇÍ ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáÕæÑå ÇáÇÊíå ')
elseif msg.video then
redis:hset(max..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå İíÏíæ ááÑÏ ÈäÌÇÍ ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáİíÏíæ ÇáÇÊí ')
elseif msg.audio then
redis:hset(max..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ááÕæÊ ááÑÏ ÈäÌÇÍ ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáÕæÊ ÇáÇÊí ')
elseif msg.sticker then
redis:hset(max..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ãáÕŞ ááÑÏ ÈäÌÇÍ ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáãáÕŞ ÇáÇÊí ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(max..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ? Êã ÇÖÇİÊ ÇáÑÏ áßá ÇáãÌãæÚÇÊ ?? ')
elseif msg.photo then 
redis:hset(max..'replay_photo:group:',klma,photo_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ÕæÑå ááÑÏ ÇáÚÇã ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáÕæÑå ÇáÇÊíå ')
elseif msg.voice then
redis:hset(max..'replay_voice:group:',klma,voice_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ÈÕãå ÕæÊ ááÑÏ ÇáÚÇã ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÓãÇÚ ÇáÈÕãå ÇáÇÊíå ')
elseif msg.animation then
redis:hset(max..'replay_animation:group:',klma,animation_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ãÊÍÑßå ááÑÏ ÇáÚÇã ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáÕæÑå ÇáÇÊíå ')
elseif msg.video then
redis:hset(max..'replay_video:group:',klma,video_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå İíÏíæ ááÑÏ ÇáÚÇã ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ?áÇÖåÇÑ ÇáİíÏíæ ÇáÇÊí ')
elseif msg.audio then
redis:hset(max..'replay_audio:group:',klma,audio_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ááÕæÊ ááÑÏ ÇáÚÇã ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáÕæÊ ÇáÇÊí ')
elseif msg.sticker then
redis:hset(max..'replay_sticker:group:',klma,sticker_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???Êã ÇÖÇİå ãáÕŞ ááÑÏ ÇáÚÇã ?\n???íãßäß ÇÑÓÇá ? ['..klma..'] ? áÇÖåÇÑ ÇáãáÕŞ ÇáÇÊí ')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
if redis:get(max..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(max..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"???ÚĞÑÇ , åäÇß ÎØÃ áÏíß \n???ÇáãÚÑİ ÇáĞí ÇÑÓáÊå áíÓ ãÚÑİ ŞäÇÉ.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"???ÚĞÑÇ , áŞÏ äÓíÊ ÔíÆÇ \n???íÌÈ ÑİÚ ÇáÈæÊ ãÔÑİ İí ŞäÇÊß áÊÊãßä ãä ÊİÚíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí .")
return false
end
else
redis:set(max..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"???ÌÜíÜÏ , ÇáÇä áŞÏ Êã ÊİÚíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí\n???Úáì ŞäÇÊß ? ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"???ÚĞÑÇ , ÚÒíÒí ÇáãØæÑ \n???åĞÇ áíÓ ãÚÑİ ŞäÇÉ , ÍÇæá ãÌÏÏÇ .")
return false
end
end

if redis:get(max..'namebot:witting'..msg.sender_user_id_) then --- ÇÓÊŞÈÇá ÇÓã ÇáÈæÊ 
redis:del(max..'namebot:witting'..msg.sender_user_id_)
redis:set(max..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"???Êã ÊÛíÑ ÇÓã ÇáÈæÊ  ???\n???ÇáÇä ÇÓãå "..Flter_Markdown(msg.text).." \n?")
return false
end

if redis:get(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- ÇÓÊŞÈÇá ÇáÑÏ áßá ÇáãÌãæÚÇÊ
if not redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- ÇÓÊŞÈÇá ßáãå ÇáÑÏ áßá ÇáãÌãæÚÇÊ
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
redis:setex(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"???ÌíÏ , íãßäß ÇáÇä ÇÑÓÇá ÌæÇ È ÇáÑÏÇáÚÇã \n???[[ äÕ,ÕæÑå,İíÏíæ,ãÊÍÑßå,ÈÕãå,ÇÛäíå ]]\n?")
end
end

if redis:get(max..'delrdall:'..msg.sender_user_id_) then
redis:del(max..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(max..'replay:all',msg.text)
local photo =redis:hget(max..'replay_photo:group:',msg.text)
local voice = redis:hget(max..'replay_voice:group:',msg.text)
local animation = redis:hget(max..'replay_animation:group:',msg.text)
local audio = redis:hget(max..'replay_audio:group:',msg.text)
local sticker = redis:hget(max..'replay_sticker:group:',msg.text)
local video = redis:hget(max..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'??*?*åĞÇ ÇáÑÏ áíÓ ãÖÇİ İí ŞÇÆãÉ ÇáÑÏæÏ ??')
else
redis:hdel(max..'replay:all',msg.text)
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n  ? Êã ãÓÍ ÇáÑÏ ?? ')
end 
end 


if redis:get(max..'text_sudo:witting'..msg.sender_user_id_) then -- ÇÓÊŞÈÇá ßáíÔå ÇáãØæÑ
redis:del(max..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(max..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "??*?* Êã æÖÚ ÇáßáíÔå ÈäÌÇÍ ßáÇÊí ????\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n?")
end
if redis:get(max..'welcom:witting'..msg.sender_user_id_) then -- ÇÓÊŞÈÇá ßáíÔå ÇáÊÑÍíÈ
redis:del(max..'welcom:witting'..msg.sender_user_id_) 
redis:set(max..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"??*?* Êã æÖÚ ÇáÊÑÍíÈ ÈäÌÇÍ ßáÇÊí ??\n?" )
end
if redis:get(max..'rulse:witting'..msg.sender_user_id_) then --- ÇÓÊŞÈÇá ÇáŞæÇäíä
redis:del(max..'rulse:witting'..msg.sender_user_id_) 
redis:set(max..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'??*?* ãÑÍÈÂ ÚÒíÒí\n???Êã ÍİÙ ÇáŞæÇäíä ÈäÌÇÍ ?\n???ÇÑÓá [[ ÇáŞæÇäíä ]] áÚÑÖåÇ \n???')
end
if redis:get(max..'name:witting'..msg.sender_user_id_) then --- ÇÓÊŞÈÇá ÇáÇÓã
redis:del(max..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(max..'linkGroup'..msg.sender_user_id_,link) then --- ÇÓÊŞÈÇá ÇáÑÇÈØ
redis:del(max..'linkGroup'..msg.sender_user_id_,link) 
redis:set(max..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'???Êã æÖÚ ÇáÑÇÈØ ÇáÌÏíÏ ÈäÌÇÍ .. ??')
end
if redis:get(max..'about:witting'..msg.sender_user_id_) then --- ÇÓÊŞÈÇá ÇáæÕİ
redis:del(max..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"??*?* Êã æÖÚ ÇáæÕİ ÈäÌÇÍ\n?")
end 
end,nil)
end


if redis:get(max..'fwd:all'..msg.sender_user_id_) then ---- ÇÓÊŞÈÇá ÑÓÇáå ÇáÇĞÇÚå ÚÇã
redis:del(max..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')  
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'???ÇåáÇ ÚÒíÒí ÇáãØæÑ \n???ÌÇÑí äÔÑ ÇáÊæÌíå ááãÌãæÚÇÊ æááãÔÊÑßíä ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(max..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'??*?*Êã ÇĞÇÚå ÇáßáíÔå ÈäÌÇÍ ????\n??*?*ááãÜÌãÜæÚÂÊ » ? *'..#groups..'* ? ÑæÈ \n??*?* ááãÜÔÜÊÑíä » ? '..#pv..' ? ãÜÔÜÊÑ \n?')
end

if redis:get(max..'fwd:pv'..msg.sender_user_id_) then ---- ÇÓÊŞÈÇá ÑÓÇáå ÇáÇĞÇÚå ÎÇÕ
redis:del(max..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'???ÇåáÇ ÚÒíÒí ÇáãØæÑ \n???ÌÇÑí äÔÑ ÇáÑÓÇáå ááãÔÊÑßíä ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(max..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'?????*?*ÚÏÏ ÇáãÔÊÑßíä : ? '..#pv..' ?\n??*?*Êã ÇáÇĞÇÚå Çáì ? '..SenderOk..'  ? ãÔÊÑß \n ?') 
end
end)
end
end

if redis:get(max..'fwd:groups'..msg.sender_user_id_) then ---- ÇÓÊŞÈÇá ÑÓÇáå ÇáÇĞÇÚå ÎÇÕ
redis:del(max..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(max..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'???ÇåáÇ ÚÒíÒí ÇáãØæÑ \n???ÌÇÑí äÔÑ ÇáÑÓÇáå ááãÌãæÚÇÊ ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = '??*?*Êã ÍĞİ ? *'..NumGroupsDel..'* ? ãä ŞÇÆãÉ ÇáÇĞÇÚå áÇäåã ŞÇãæ ÈØÑÏ ÇáÈæÊ ãä ÇáãÌãæÚå'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'??*?*ÚÏÏ ÇáãÌãæÚÇÊ ? *'..#groups..'* ?\n??*?*ÊÜã ÇáÇĞÇÚå Çáì ? *'..AllGroupSend..'* ?\n'..MsgTDel..'?')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(max..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(max..':WELCOME_BOT'),[[??ÇåáÇ ÇäÇ ÈæÊ ÇÓÜãÜí ]]..redis:get(max..':NameBot:')..[[ ?
???????ÇÎÊÕÜÇÕÜí ÍãÜÇíå ÇáãÜÌãÜæÚÇÊ
???ãÜä ÇáÓÜÈÇã æÇáÊæÌíåÀş æÇáÊßÑÇÑ æÇáÎ...

???ãÜÚÜÑİ ÇáÜãÜØÜæÑ  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ ??
]])
return false
end 

if msg.forward_info and redis:get(max..'fwd:'..msg.sender_user_id_) then
redis:del(max..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'???ÇåáÇ ÚÒíÒí ÇáãØæÑ \n???ÌÇÑí äÔÑ ÇáÊæÌíå ááãÌãæÚÇÊ æááãÔÊÑßíä ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'??*?*Êã ÇĞÇÚå ÇáÊæÌíå ÈäÌÇÍ ????\n??*?*ááãÜÌãÜæÚÂÊ » ? *'..#groups..'* ?\n??*?*ááÎÂÕ » ? '..#pv..' ?\n?')			
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." ÛÇÏÑ$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'???Çááå íáÚä ãä íŞÚÏ ÚäÏßã ?????')
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.content_.ID == "MessagePhoto" and redis:get(max..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(max..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(max..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'?? ¦ Êã ÊÛííÑ ÕÜæÑåÀşş ÂáÊÑÍíÈ ááÈæÊ ??\n?')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(max..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(max..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'?? ¦ áíÓ áÏí ÕáÇÍíå ÊÛííÑ ÇáÕæÑå \n?? ¦ íÌÈ ÇÚØÇÆí ÕáÇÍíå `ÊÛííÑ ãÚáæãÇÊ ÇáãÌãæÚå ` ?\n?')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(max..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- ÇÓÊŞÈÇá ÇáÑÏ ááãÌãæÚå İŞØ

if not redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- ßáãå ÇáÑÏ
redis:hdel(max..'replay:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(max..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"???ÌíÏ , íãßäß ÇáÇä ÇÑÓÇá ÌæÇÈ ÇáÑÏ \n???[[ äÕ,ÕæÑå,İíÏíæ,ãÊÍÑßå,ÈÕãå,ÇÛäíå ]]\n?")
end
end

if redis:get(max..'delrd:'..msg.sender_user_id_) then
redis:del(max..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(max..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(max..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(max..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(max..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(max..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(max..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'??*?*åĞÇ ÇáÑÏ áíÓ ãÖÇİ İí ŞÇÆãÉ ÇáÑÏæÏ ??')
else
redis:hdel(max..'replay:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n  ? Êã ãÓÍ ÇáÑÏ ?? ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(max..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"??*?* ÚĞÑÇ ÇáÊËÈíÊ ãŞİá ãä ŞÈá ÇáÇÏÇÑå Êã ÇÑÌÇÚ ÇáÊËÈíÊ ÇáŞÏíã\n")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"??*?* ÚĞÑÇ ÇáÊËÈíÊ ãŞİá ãä ŞÈá ÇáÇÏÇÑå Êã ÇáÛÇÁ ÇáÊËÈíÊ\n?")      
end
end,nil)
end
return false
end
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "ÇÍÏ ÇáãÔÑİíä" end
return sendMsg(msg.chat_id_,msg.id_," ŞÇã ["..UserName.."] ÈÊÛíÑ ÕæÑå ÇáãÌãæÚå ?\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(max..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "ÇÍÏ ÇáãÔÑİíä" end

return sendMsg(msg.chat_id_,msg.id_,"??| ŞÇã  ["..UserName.."]\n???ÈÊÛíÑ ÇÓã ÇáãÌãæÚå  ?\n???Çáì "..Flter_Markdown(msg.content_.title_).." \n?") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(max..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(max..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "??????Çåáä Èß ÚÒíÒí {ÇáÇÓã}\n???ãÚÑİß » {ÇáãÚÑİ}\n{ÇáŞæÇäíä}\n\nÇáÑÌÇÁ ÇáÇáÊÒÇã ÈÇáŞæÇäíä ?\nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\n??ÇÓã ÇáŞÑæÈ » {ÇáãÌãæÚå}")
if welcome then
rules = (redis:get(max..'rulse:msg'..msg.chat_id_) or "ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\nÇáŞæÇäíä :\nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\n? | ÅÍÊÑÇã ãÏÑÇÁ æÃÏãäíÉ ÇáãÌãæÚÉ.\n? | ÇáÚäÕÑíÉ ÈÌãíÚ ÃÔßÇáåÇ ããäæÚÉ.\n? | íãäÚ äÔÑ ÇáãÍÊæì ÇáÅÈÇÍí Èßá ÃäæÇÚå.\n? | íãäÚ ÇáÊßáã ÈÇáÃÏíÇä Ãæ ÇáãĞÇåÈ Ãæ ÇáÓíÇÓÉ.\n? | íãäÚ äÔÑ ÇáÍÓÇÈÇÊ ÇáÔÎÕíÉ Ïæä ÃÎĞ ÇáãæÇİŞÉ.\n? | íãäÚ äÔÑ ÇáÅÚáÇäÇÊ Èßá ÃäæÇÚåÇ Ïæä ÃÎĞ ÇáãæÇİŞÉ.\n? | íãäÚ ÇáÓÈ Ãæ ÇáÊáİÙ ÈÃáİÇÙ äÇÈíÉ Çæ ÎÇÏÔÉ ááÍíÇÁ.\nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ")
welcome = welcome:gsub("{ÇáŞæÇäíä}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< áÇ íæÌÏ ãÚÑİ >' end
welcome = welcome:gsub("{ÇáãÌãæÚå}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{ÇáãÚÑİ}",UserName)
local welcome = welcome:gsub("{ÇáÇÓã}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "??????Çåáä Èß ÚÒíÒí {ÇáÇÓã}\n???ãÚÑİß » {ÇáãÚÑİ}\n{ÇáŞæÇäíä}\n\nÇáÑÌÇÁ ÇáÇáÊÒÇã ÈÇáŞæÇäíä ?\nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\n??ÇÓã ÇáßÑæÈ » {ÇáãÌãæÚå}")
if welcome then
rules = (redis:get(max..'rulse:msg'..msg.chat_id_) or "???????ãÑÍÈÃ ÚÒíÑí ÇáŞæÇäíä ßáÇÊí ????\n???ããäæÚ äÔÑ ÇáÑæÇÈØ\n???ããäæÚ ÇáÊßáã Çæ äÔÑ ÕæÑ ÇÈÇÍíå\n??ããäæÚ  ÇÚÇÏå ÊæÌíå\n???ããäæÚ ÇáÊßáã ÈáØÇÆİå\n???ÇáÑÌÇÁ ÇÍÊÑÇã ÇáãÏÑÇÁ æÇáÇÏãäíå ??\n")
welcome = welcome:gsub("{ÇáŞæÇäíä}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< áÇ íæÌÏ ãÚÑİ >' end
welcome = welcome:gsub("{ÇáãÌãæÚå}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{ÇáãÚÑİ}",UserName)
local welcome = welcome:gsub("{ÇáÇÓã}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

--------------------------------------------
if msg.adduser and redis:get(max..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(max..'welcome:get'..msg.chat_id_)
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- ááÇÚÖÇÁ İŞØ   

if not msg.forward_info and redis:get(max..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(max..'num_msg_max'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(max..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME.."\n???ŞãÜÊ ÈÊÑÂÑ ÂËÑ ãÜä "..NUM_MSG_MAX.." ÑÓÜÂáåÀş , áĞÂ Êã ÊŞííÏ ãÜä ÂáãÜÌãÜæÚåÀş ?\n",12,USERCAR) 
return false
end)
end 
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ÇÑÓÇá äÊíÌÉ ÇáÕáÇÍíå
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'???ÕáÇÍíÇÊå ãäÔÆ ÇáßÑæÈ\n??')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'???ãÌÑÏ ÚÖæ åäÇ\n??')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = '?' else info = '?' end
if Json_Info.result.can_delete_messages == true then
delete = '?' else delete = '?' end
if Json_Info.result.can_invite_users == true then
invite = '?' else invite = '?' end
if Json_Info.result.can_pin_messages == true then
pin = '?' else pin = '?' end
if Json_Info.result.can_restrict_members == true then
restrict = '?' else restrict = '?' end
if Json_Info.result.can_promote_members == true then
promote = '?' else promote = '?' end
return sendMsg(chat,msg.id_,'???ÇáÑÊÈÉ : ãÔÑİ ??\n???æÇáÕáÇÍíÇÊ åí ? \nÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ\n???ÊÛíÑ ãÚáæãÇÊ ÇáãÌãæÚå ? ? '..info..' ?\n???ÍĞİ ÇáÑÓÇÆá ? ? '..delete..' ?\n???ÍÙÑ ÇáãÓÊÎÏãíä ? ? '..restrict..' ?\n??ÏÚæÉ ãÓÊÎÏãíä ? ? '..invite..' ?\n???ÊËÈíÊ ÇáÑÓÇÆá ? ? '..pin..' ?\n???ÇÖÇİÉ ãÔÑİíä ÌÏÏ ? ? '..promote..' ?\n\n???ãáÇÍÖå » ÚáÇãÉ ?  ? ? ÊÚäí áÏíå ÇáÕáÇÍíÉ æÚáÇãÉ ? ? ? ÊÚäí áíÓ áíÏíå ÇáÕáÇÍíå')   
end
end
end

if msg.forward_info_ then
if redis:get(max..'mute_forward'..msg.chat_id_) then -- Şİá ÇáÊæÌíå
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) and not redis:get(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÚÇÏÉ ÇáÊæÌíå  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(max..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(max..'mute_inline'..msg.chat_id_) then -- Şİá ÇáÇäáÇíä
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ÇáÇäáÇíä ãŞİæá  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- ÑÓÇíá İŞØ
if utf8.len(msg.text) > 500 and redis:get(max..'lock_spam'..msg.chat_id_) then -- Şİá ÇáßáíÔå 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ããäæÚ ÇÑÓÇá ÇáßáíÔå æÇáÇ Óæİ ÊÌÈÑäí Úáì ØÑÏß  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(max..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(max..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ããäæÚ ÇÑÓÇá ÇáÑæÇÈØ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ããäæÚ ÇÑÓÇá ÑæÇÈØ ÇáæíÈ   \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(max..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ããäæÚ ÇÑÓÇá ÇáÊÇß  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(max..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ããäæÚ ÇÑÓÇá ÇáãÚÑİ   \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(max..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ããäæÚ ÇÑÓÇá ÇáãÇÑßÏæÇä  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "??? .ããäæÚ ÇÑÓÇá ÑæÇÈØ ÇáæíÈ   \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(max..'lock_edit'..msg.chat_id_) then -- Şİá ÇáÊÚÏíá
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇğ ããäæÚ ÇáÊÚÏíá Êã ÇáãÓÍ \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(max..'mute_video'..msg.chat_id_) then -- Şİá ÇáİíÏíæ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáİíÏíæ ßÇã \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(max..'mute_photo'..msg.chat_id_)  then -- Şİá ÇáÕæÑ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáÕæÑ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(max..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(max..'mute_video'..msg.chat_id_) then -- Şİá ÇáİíÏíæ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáİíÏíæ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(max..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(max..'mute_document'..msg.chat_id_) then -- Şİá ÇáãáİÇÊ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáãáİÇÊ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(max..'mute_sticker'..msg.chat_id_) then --Şİá ÇáãáÕŞÇÊ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáãáÕŞÇÊ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(max..'mute_gif'..msg.chat_id_) then -- Şİá ÇáãÊÍÑßå
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáÕæÑ ÇáãÊÍÑßå  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(max..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(max..'mute_contact'..msg.chat_id_) then -- Şİá ÇáÌåÇÊ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÌåÇÊ ÇáÇÊÕÇá  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(max..'mute_location'..msg.chat_id_) then -- Şİá ÇáãæŞÚ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáãæŞÚ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(max..'mute_voice'..msg.chat_id_) then -- Şİá ÇáÈÕãÇÊ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáÈÕãÇÊ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(max..'mute_game'..msg.chat_id_) then -- Şİá ÇáÇáÚÇÈ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "??ÚĞÑÇ ããäæÚ áÚÈ ÇáÇáÚÇÈ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(max..'mute_audio'..msg.chat_id_) then -- Şİá ÇáÕæÊ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáÕæÊ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(max..'mute_keyboard'..msg.chat_id_) then -- ßíÈæÑÏ
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ÇáßíÈæÑÏ ãŞİæá  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- ÇáÑÓÇíá Çáí ÈÇáßÇÈÔä
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(max..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáÑæÇÈØ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÑæÇÈØ ÇáæíÈ  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(max..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* áÇ íãßääí ãÓÍ ÇáÑÓÇáå ÇáãÎÇáİå .\n??*?* áÓÊ ãÔÑİ Çæ áíÓ áÏí ÕáÇÍíå  ÇáÍĞİ \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
local msgx = "???ÚĞÑÇ ããäæÚ ÇÑÓÇá ÇáÊÇß Çæ ÇáãÚÑİ  \n??"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??????ÇáÚÖæ » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text and redis:get(max..'replay'..msg.chat_id_) then

local Replay = false

 Replay = redis:hget(max..'replay:all',msg.text)
if Replay then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(max..'replay:'..msg.chat_id_,msg.text)
if Replay then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(max..'replay_photo:group:',msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_voice:group:',msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(max..'replay_animation:group:',msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_audio:group:',msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_sticker:group:',msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_video:group:',msg.text)
if Replay then 
print("0000000000000") 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(max..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(max..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

if not Replay then

--================================{{  Reply Bot  }} ===================================

local mrr = {
"ãÑÍÈÊíä",
"ÇåáÇ",
}
local amr = {
"íÇÚãÑí????",
"íÇŞáÈí????",
"íÇÍíÇÊí????",
"äÊíßä¿",
}
local nmf = {
"İíå ÇÍÏ ãÇÓßß¿",
"äæã ÇáÚÇİíå",
"Úáì İÑÇÔß íÇááå",
"äæã ÇáÙÇáã ÚÈÇÏå",
}
local nor = {
" äæÑß",
"ÇÚÑİß¿",
"ÇáäæÑ äæÑß",
"ÇÏÑí??-¡",
}
local smx = {
"ÕÈÇÍ ÇáäæÑ",
"ÕÈÇÍäÇ ÇäÊ/í",
"ÇááÍíä ÇŞÏÑ ÇÑæŞ",
}
local msx = {
"ãÓÇÁ ÇáäæÑ",
"ãÓÇÆí ÇäÊ/í",
"ÇááÍíä ÇŞÏÑ ÇÑæŞ",
}
local nm = {
"ÏÌÇÌ ãÇÍæáß ÇÍÏ??",
"ÔÏÎáß",
"Çíå",
"ÇÒÚÌÊäÇ",
"ÇäÊ ãÇÊäÇã¿ ",
}
local wk1 = {
"äÇíã/å",
"æÔ ÚäÏß ¿",
"åÇÌÑÊ",
"ÇãÑäí",
"æÔ ÏÎáß",
"ÈŞáÈß",
}
local wk = {
"äÇíãíä",
"æÔ ÚäÏß ",
"åÇÌÑäÇ",
"ÇãÑäí",
"æÔ ÏÎáß",
"ÈŞáÈß",
}
local su = {
 "Úíæäí",
"ÇãÑäí íäÈÖí",
"Úíæä ["..Bot_Name.."] ",
"áÈíå íÑæÍí"}
local ss97 = {
"áÚäå ÔÚäÏß","åÇå",
"ÇãÑ ÔÊÈí","áÈíå","åáÇ",
"Úíæäí",
"Úíæä ["..Bot_Name.."] ",
"ÇãÑäí ŞáÈí áß ", 
"ÑæÍ ["..Bot_Name.."] ",
}
local ns = {
"ÃÓãí ["..Bot_Name.."] íŞáÈí",
"äÇÏäí È ["..Bot_Name.."] íÊÈä",
"ãßÊæÈ ÇÓãí ["..Bot_Name.."] ãÊÚÑİ ÊŞÑÇ ",
"ÈæÊ ÈÚíäß íÊÈä ",
"ÇÓãí ["..Bot_Name.."] ",
"ÇäÊ ÇáÈæÊ ",
 "ÔÚäÏß ÊäÇÏíäí ÈæÊ ",
}
local na = {
"ÇäÊÍÑ",
"Çááå íÑÒŞß ÈÓÇáİå",
"ÒŞ ÓÇáİå",
"åÈ áäÇ ÓÇáİå",
}
local nb = {
"ÇãÍÍÇÊ",
"ãÍÍ",
"ÕããåÇ",
"íÚ",
"ÇãããÎÊİæ",
}
local nf = {
"ãæ ßËÑí",
"äİÓ ÇáÔÚæÑ",
"æäÇ ÇßËÑ",
 "ÊŞáÚ",
}
local nl = {
"ÇØáŞ ãäÌÇ",
"ÇÑÍÈ äæÑÊ",
"íÚ æÔ ÌÇÈß",
}
local np = {
"íäÈÇÓ ÇáåÇí",
"åÇíÇÊ",
"ÌÈÑ ãæ åÇí",
}
local sh = {
"æäÇ ÇßËÑ íÑæÍí",
"ÇÍÈäß",
"ÇÚÔŞäß",
"ÇãæÊ İíß íÑæÍí",
}
local lovm = {
"ÇßÑåß",
"ÇÚÔŞßß",
"ÇÍÈäß",
"Çåíã Èß",
"áÇÊÍÊß",
"íÚ ÌÈÊ áí ÛËíÇä",
"æÇäÇ ÇÍÈß",
}
local bay = {
"ÈÇíÇÊ",
"ÇäÊÈåáß",
"ÇäÊÈå áß íŞáÈí",
"ÓÑÏÈ",
"İßå",
"ØÓ",
"ãĞáİå",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^Şæá (.*)$") then
if utf8.len(Text:match("^Şæá (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"??| ãÇ ÇßÏÑ ÇŞæá ÇßËÑ ãä 500 ÍÑİ ????")
end
local callback_Text = FlterName(Text:match("^Şæá (.*)$"),50)
if callback_Text and callback_Text == 'ÇáÇÓã ÓÈÇã ??' then
return sendMsg(msg.chat_id_,msg.id_,"??| ááÇÓİ ÇáäÕ åĞÇ ãÎÇáİ ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif Text:match("^"..Bot_Name.." ÇÊİá (.*)$") then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'Çæß ÓíÏí ????')
sendMsg(msg.chat_id_,msg.reply_id,'áß Ôäæ åÇĞå æíåß ÎÊİææææææææææ?????? ÈäÕ æíåß ??')
else 
return sendMsg(msg.chat_id_,msg.id_,"  ???? æíäå Èáå Óæíáå ÑÏ ??")
end
elseif msg.SudoUser and Text=="ÇÍÈß" then 
return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
elseif Text=="ÈæÊ" then 
return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
elseif Text=="ØİÔ" then 
return sendMsg(msg.chat_id_,msg.id_,na[math.random(#na)])
elseif Text=="ãÍ" then 
return sendMsg(msg.chat_id_,msg.id_,nb[math.random(#nb)])
elseif Text=="ÇßÑåß" then 
return sendMsg(msg.chat_id_,msg.id_,nf[math.random(#nf)])
elseif Text=="ÌíÊ" then 
return sendMsg(msg.chat_id_,msg.id_,nl[math.random(#nl)])
elseif Text=="åÇí" then 
return sendMsg(msg.chat_id_,msg.id_,np[math.random(#np)])
elseif Text=="ÈÇí" then 
return sendMsg(msg.chat_id_,msg.id_,bay[math.random(#bay)])
elseif Text=="æíäßã" then 
return sendMsg(msg.chat_id_,msg.id_,wk[math.random(#wk)])
elseif Text=="æíäßã¿" then 
return sendMsg(msg.chat_id_,msg.id_,wk[math.random(#wk)])
elseif Text=="æíäß¿" then 
return sendMsg(msg.chat_id_,msg.id_,wk1[math.random(#wk1)])
elseif Text=="æíäß" then 
return sendMsg(msg.chat_id_,msg.id_,wk1[math.random(#wk1)])
elseif Text=="äÇíãíä" then 
return sendMsg(msg.chat_id_,msg.id_,nm[math.random(#nm)])
elseif Text=="äÇíãíä¿" then 
return sendMsg(msg.chat_id_,msg.id_,nm[math.random(#nm)])
elseif Text=="äãÊæ" then 
return sendMsg(msg.chat_id_,msg.id_,nm[math.random(#nm)])
elseif Text=="äãÊæ¿" then 
return sendMsg(msg.chat_id_,msg.id_,nm[math.random(#nm)])
elseif Text=="ãÓÇÁ ÇáÎíÑ" then 
return sendMsg(msg.chat_id_,msg.id_,msx[math.random(#msx)])
elseif Text=="ÕÈÇÍ ÇáÎíÑ" then 
return sendMsg(msg.chat_id_,msg.id_,smx[math.random(#smx)])
elseif Text=="ãäæÑ" then 
return sendMsg(msg.chat_id_,msg.id_,nor[math.random(#nor)])
elseif Text=="ãäæÑå" then 
return sendMsg(msg.chat_id_,msg.id_,nor[math.random(#nor)])
elseif Text=="ÈäÇã" then 
return sendMsg(msg.chat_id_,msg.id_,nmf[math.random(#nmf)])
elseif Text=="íÇÍíÇÊí" then 
return sendMsg(msg.chat_id_,msg.id_,amr[math.random(#amr)])
elseif Text=="íÇÚãÑí" then 
return sendMsg(msg.chat_id_,msg.id_,amr[math.random(#amr)])
elseif Text=="íÇŞáÈí" then 
return sendMsg(msg.chat_id_,msg.id_,amr[math.random(#amr)])
elseif Text=="ÇÚÔŞß" then 
return sendMsg(msg.chat_id_,msg.id_,amr[math.random(#amr)])
elseif Text=="ãÑÍÈÇ" then 
return sendMsg(msg.chat_id_,msg.id_,mrr[math.random(#mrr)])
elseif msg.SudoUser and Text== "ÊÍÈäí" or Text=="ÍÈß" then 
return sendMsg(msg.chat_id_,msg.id_,"ÇÚÔŞäß ")
elseif not msg.SudoUser and Text== "ÇÍÈß" or Text=="ÍÈß" then 
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif not msg.SudoUser and Text== "ÊÍÈäí" then
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif Text== "Êİ" then return sendMsg(msg.chat_id_,msg.id_,"Êİ ? æÌåß ÇáÎÇíÓ.")
elseif Text== "ÇÎÈÇÑßã¿" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ÇÎÈÇÑß ÇäÊ/í")
elseif Text== "Ôáæäßã" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã Ôáæäß ÇäÊ/í")
elseif Text== "Ôáæäßã¿" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã Ôáæäß ÇäÊ/í")
elseif Text== "ßíİßã" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ßíİß ÇäÊ/í")
elseif Text== "ßíİßã¿" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ßíİß ÇäÊ/í")
elseif Text== "Ôáæäß" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã Ôáæäß ÇäÊ/í")
elseif Text== "Ôáæäß¿" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã Ôáæäß ÇäÊ/í")
elseif Text== "ßíİß" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ßíİß ÇäÊ/í")
elseif Text== "ßíİß¿" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ßíİß ÇäÊ/í")
elseif Text== "ÇÎÈÇÑß" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ÇÎÈÇÑß ÇäÊ/í")
elseif Text== "ÇÎÈÇÑß¿" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ÇÎÈÇÑß ÇäÊ/í")
elseif Text== "ÇÎÈÇÑßã" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ÇÎÈÇÑß ÇäÊ/í")
elseif Text== "ßíİ ÍÇáßã" then return sendMsg(msg.chat_id_,msg.id_,"ÈÎíÑ ÍãÏááå æÇäÊ/í ")
elseif Text== "ÇÎÈÇÑß¿" then return sendMsg(msg.chat_id_,msg.id_,"ÊãÇã ÇÎÈÇÑß ÇäÊ/í")
elseif Text== "ßíİ ÍÇáß" then return sendMsg(msg.chat_id_,msg.id_,"ÈÎíÑ ÍãÏááå æÇäÊ/í ")
elseif Text== "ßíİ ÍÇáßã¿" then return sendMsg(msg.chat_id_,msg.id_,"ÈÎíÑ ÍãÏááå æÇäÊ/í ")
elseif Text== "ßíİ ÍÇáß¿" then return sendMsg(msg.chat_id_,msg.id_,"ÈÎíÑ ÍãÏááå æÇäÊ/í ")
elseif Text== "ßİæ" then return sendMsg(msg.chat_id_,msg.id_,"ßİæß ÇáØíÈ??")
elseif Text== "Ôßæ" then return sendMsg(msg.chat_id_,msg.id_,"Ôßæ ãÇßæ??")
elseif Text== "ÈÑÈ" then return sendMsg(msg.chat_id_,msg.id_,"ÊíÊ ÈäÔÊÇŞ ááß áÇÊØæá/íä??")
elseif Text== "ÈÇß" then return sendMsg(msg.chat_id_,msg.id_,"æáßã ÈÇß ãä Çáíæã ãäÊÙÑíäß??")
elseif Text== "ÇÔÊŞÊ ááß" then return sendMsg(msg.chat_id_,msg.id_,"ÇÔÊŞÊ áß ÇßËÑ??")
elseif Text== "ÇÔÊŞÊáß" then return sendMsg(msg.chat_id_,msg.id_,"ÇÔÊŞÊáß ÇßËÑ??")
elseif Text== "ÇãÒÍ" then return sendMsg(msg.chat_id_,msg.id_,"áÇÊÚíÏåÇ??")
elseif Text== "ÇÔİíä" then return sendMsg(msg.chat_id_,msg.id_,"áÇÊÚíÏåÇ??")
elseif Text== "ÇÔİíä ÇÔİíä" then return sendMsg(msg.chat_id_,msg.id_,"áÇÊÚíÏåÇ??")
elseif Text== "ÇÓİíä" then return sendMsg(msg.chat_id_,msg.id_,"áÇÊÚíÏåÇ??")
elseif Text== "ÇÓİíä ÇÓİíä" then return sendMsg(msg.chat_id_,msg.id_,"áÇÊÚíÏåÇ??")
elseif Text== "??" then return sendMsg(msg.chat_id_,msg.id_,"ÏÎá áÓÇäß ÚíÈ??")
elseif Text== "??" then return sendMsg(msg.chat_id_,msg.id_,"ÏÎá áÓÇäß ÚíÈ??")
elseif Text== "ÌÈ" then return sendMsg(msg.chat_id_,msg.id_,"ÌÈ ÇäÊ/í íÇááí ãÇÊÓÊÍí/ä")
elseif Text== "ÊÔÈ" then return sendMsg(msg.chat_id_,msg.id_,"ÊÔÈ ÇäÊ/í íÇááí ãÇÊÓÊÍí/ä")
elseif Text== "ÔÈ" then return sendMsg(msg.chat_id_,msg.id_,"ÔÈ ÇäÊ/í íÇááí ãÇÊÓÊÍí/ä")
elseif Text== "ÇáÒÈÏå" then return sendMsg(msg.chat_id_,msg.id_,"ÇÓáã")
elseif Text== "Çáãåã" then return sendMsg(msg.chat_id_,msg.id_,"ÚØäí ÇáÒÈÏå¿")
elseif Text== "ßáÎÑÇ" then return sendMsg(msg.chat_id_,msg.id_,"ÚíÈ Úáíß ãäÊ/í ãÊÑÈí/å")
elseif Text== "ßáÒŞ" then return sendMsg(msg.chat_id_,msg.id_,"ÚíÈ Úáíß ãäÊ/í ãÊÑÈí/å")
elseif Text== "ßá ÎÑÇ" then return sendMsg(msg.chat_id_,msg.id_,"ÚíÈ Úáíß ãäÊ/í ãÊÑÈí/å")
elseif Text== "ßá ÒŞ" then return sendMsg(msg.chat_id_,msg.id_,"ÚíÈ Úáíß ãäÊ/í ãÊÑÈí/å")
elseif Text== "ßáíÎÑÇ" then return sendMsg(msg.chat_id_,msg.id_,"ÚíÈ Úáíß ãäÊ/í ãÊÑÈí/å")
elseif Text== "ßáí ÎÑÇ" then return sendMsg(msg.chat_id_,msg.id_,"ÚíÈ Úáíß ãäÊ/í ãÊÑÈí/å")
elseif Text== "ßáíÒŞ" then return sendMsg(msg.chat_id_,msg.id_,"ÚíÈ Úáíß ãäÊ/í ãÊÑÈí/å")
elseif Text== "ßáí ÒŞ" then return sendMsg(msg.chat_id_,msg.id_,"ÚíÈ Úáíß ãäÊ/í ãÊÑÈí/å")
elseif Text== "ÊÕÈÍæä Úáì ÎíÑ" then return sendMsg(msg.chat_id_,msg.id_,"ÊáŞì ÇáÎíÑ")
elseif Text== "ÊãÓæä Úáì ÎíÑ" then return sendMsg(msg.chat_id_,msg.id_,"ÊáŞì ÇáÎíÑ")
elseif Text== "áÈíå" then return sendMsg(msg.chat_id_,msg.id_,"áÈíÊ/í İí ãßå ")
elseif Text== "æáßã" then return sendMsg(msg.chat_id_,msg.id_,"íÓáãæ????")
elseif Text== "íÇáÈíå" then return sendMsg(msg.chat_id_,msg.id_,"íÇáÈíå ÇäÊ/í æÇááå??")
elseif Text== "íÇ áÈíå" then return sendMsg(msg.chat_id_,msg.id_,"íÇáÈíå ÇäÊ/í æÇááå??")
elseif Text== "ÓáÇã" or Text== "ÇáÓáÇã Úáíßã" or Text== "ÓáÇã Úáíßã" or Text=="ÓáÇãä Úáíßã" or Text=="ÇáÓáÇãä Úáíßã" then 
return sendMsg(msg.chat_id_,msg.id_,"æÚáíßã ÇáÓáÇã")
elseif Text== "ãÓÇÚÏÉ"  then return sendMsg(msg.chat_id_,msg.id_,"áÚÑÖ ŞÇÆãÉ ÇáãÓÇÚÏÉ ÇßÊÈ ÇáÇæÇãÑ ????")
elseif Text== "ÑİÚ áŞáÈí" then return sendMsg(msg.chat_id_,msg.id_,"??????ÇåÜÜáÇ ÚÒíÒí\n???Êã ÑİÚ ÇáÚÖæ ÏÇÎá ŞáÈß??\n???ÊãÊ ÊÑŞíÊå ÈäÌÇÍ ????????\n??")
elseif Text== "ÑİÚ ÒæÌÊí" then return sendMsg(msg.chat_id_,msg.id_,"??????ÇåÜÜáÇ ÚÒíÒí\n???Êã ÑİÚ ÇáÚÖæ ÒæÌÊß ÈäÌÇÍ??\nÇáÂä íãßäßã ÃÎĞ ÑÇÍÊßã????\n??")
elseif Text== "ØáÇŞ" then return sendMsg(msg.chat_id_,msg.id_,"??????ÇåÜÜáÇ ÚÒíÒí\n???Êã ØáÇŞ ÇáÚÖæ ÈäÌÇÍ??\n???ÇáÂä åæ ãØáŞ íáå ÇäŞáÚ ÈÑÇ ????\n??")
elseif Text== "ÊäÒíá ãä ŞáÈí" then return sendMsg(msg.chat_id_,msg.id_,"??????ÇåÜÜáÇ ÚÒíÒí\n???Êã ÊäÒíá ãä ÏÇÎá ŞáÈß??\n???ÊãÊ ÇÒÇáÊå ãä ŞÇÆãÉ ÇáŞáæÈ ????\n??")
elseif Text== "ÊäÒíá ÒæÌÊí" then return sendMsg(msg.chat_id_,msg.id_,"??????ÇåÜÜáÇ ÚÒíÒí\n???Êã ÊäÒíá ÇáÑãå ÒæÌÊß ÈäÌÇÍ??\nÇáÂä ÇäÊã ãİÊÑŞÇä????\n??")
elseif Text== "ÒæÇÌ" then return sendMsg(msg.chat_id_,msg.id_,"??????ÇåÜÜáÇ ÚÒíÒí\n???Êã ÒæÇÌßã ÇáÇËäíä ÈäÌÇÍ??\n???ÇáÂä íãßäßã ÃÎĞ ÑÇÍÊßã????\n??")
elseif Text== "ÑİÚ ÒæÌí" then return sendMsg(msg.chat_id_,msg.id_,"??????ÇåÜÜáÇ ÚÒíÒí\n???Êã ÑİÚ ÇáÚÖæ ÒæÌß ÈäÌÇÍ??\nÇáÂä íãßäßã ÃÎĞ ÑÇÍÊßã????\n??")
elseif Text== "ÊäÒíá ÒæÌí" then return sendMsg(msg.chat_id_,msg.id_,"??????ÇåÜÜáÇ ÚÒíÒí\n???Êã ÊäÒíá ÇáÑã ÒæÌß ÈäÌÇÍ??\nÇáÂä ÇäÊã ãİÊÑŞÇä????\n??")

elseif Text== "ÇíÏíí" or Text=="ÇíÏí ??" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????ÂÖÜÛØ Úáì ÂáÂíÏí áíÊã ÂáäÓÜÎ\n\n "..USERNAME.." ~? ( "..data.id_.." )",37,USERCAR)  
return false
end)
elseif Text=="ÇÑíÏ ÑÇÈØ ÇáÍĞİ" or Text=="ÇÑíÏ ÑÇÈØ ÍĞİ" or Text=="ÑÇÈØ ÍĞİ" or Text=="ÑÇÈØ ÇáÍĞİ" then
return sendMsg(msg.chat_id_,msg.id_,[[
??*?* ÑÇÈØ ÍĞİ ÍÜÓÇÈ ÇáÊíáí ?
???[ÇÖÛØ åäÇ áÜÍÜĞİ ÇáÜÍÜÓÜÇÈ](https://telegram.org/deactivate)
]] )
--=====================================
elseif Text== "ÇäÇ ãíä" or Text== "Çäí ãäæ" or Text=="ÇäÇ ãäæ" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"ÇäÊ ÍÈíÈí ÇáãØæÑ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"ÇäÊ ŞáÈí ÇáãäÔÆ")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"ãÏíÑ æáÇÊÓÊÇåá")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"ÃÏãä æíÎÈ Úáíß")
else 
return sendMsg(msg.chat_id_,msg.id_,"ÚÖæ İŞØ")
end 
end




end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------
if not redis:sismember(max..'kara','Start') then
redis:setex(max..'2DaySleep',172800,'uop90')
redis:sadd(max..'kara','Start')
end
if not redis:get(max..'2DaySleep') and redis:sismember(max..'kara','Start') and not redis:sismember(max..'kara','End') then
redis:setex(max..'4DaySleep',345600,'mohammad')
redis:sadd(max..'kara','End')
sendMsg(SUDO_ID,0,"????? ÇåáÇ ÚÒíÒí ÇáãØæÑ\n????Ü????\n? ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí Úáì ŞäÇÉ ÇáÓæÑÓ\n?ãÏÉ ÇáÇÔÊÑÇß 4 ÇíÇã İŞØ\n?ÓíÊã ÇÒÇáå ÇáÇÔÊÑÇß ÊáŞÇÆíÇ")
end
if not redis:get(max..'4DaySleep') and not redis:sismember(max..'kara','End2') then
sendMsg(SUDO_ID,0,"??????ÇåáÇ íŞáÈí \n???Êã ÇäÊåÇÁ 4 ÇíÇã ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí")
redis:sadd(max..'kara','End2')
end
if not redis:get('kar') then
redis:setex('kar',86400,true) 
json_data = '{"BotID": '..max..',"UserBot": "'..Bot_User..'","Groups" : {'
local All_Groups_ID = redis:smembers(max..'group:ids')
for key,GroupS in pairs(All_Groups_ID) do
local NameGroup = (redis:get(max..'group:name'..GroupS) or '')
NameGroup = NameGroup:gsub('"','')
NameGroup = NameGroup:gsub([[\]],'')
if key == 1 then
json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
else
json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
end
local admins = redis:smembers(max..'admins:'..GroupS)
if #admins ~= 0 then
json_data =  json_data..',"Admins" : {'
for key,value in pairs(admins) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end
local creator = redis:smembers(max..':KARA_BOT:'..GroupS)
if #creator ~= 0 then
json_data =  json_data..',"Kara" : {'
for key,value in pairs(creator) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end

local owner = redis:smembers(max..'owners:'..GroupS)
if #owner ~= 0 then
json_data =  json_data..',"Owner" : {'
for key,value in pairs(owner) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end
json_data =  json_data.."}"
end
local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
Save_Data:write(json_data..'}}')
Save_Data:close()
sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","??| ãáİ ÇáäÓÎå ÇáÇÍÊíÇØíå ...\n??| ÇáãÌãæÚÇÊ » { "..#All_Groups_ID.." }\n??| ááÈæÊ » "..Bot_User.."\n??| ÇáÊÇÑíÎ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
end
if redis:get(max..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'????????ÇäÊåì ÇáÇÔÊÑÇß İí ÇÍÏ ÇáãÌãæÚÇÊ ???\n???????ÇáãÌãæÚå : '..FlterName(redis:get(max..'group:name'..msg.chat_id_))..'??\n???????ÇíÏí : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'????????ÇäÊåì ÇáÇÔÊÑÇß ÇáÈæÊ???\n???????Óæİ ÇÛÇÏÑ ÇáãÌãæÚå İÑÕå ÓÚíÏå ????\n???????Çæ ÑÇÓá ÇáãØæÑ ááÊÌÏíÏ '..SUDO_USER..' ??')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(max..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'????????ÈÇŞí íæã æÇÍÏ æíäÊåí ÇáÇÔÊÑÇß ???\n???????ÑÇÓá ÇáãØæÑ ááÊÌÏíÏ '..SUDO_USER..'\n??')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------


end 


return {
max = {
"^(ÊŞííÏ)$",
"^(ÊŞííÏ) (%d+)$",
"^(ÊŞííÏ) (@[%a%d_]+)$",
"^(İß ÇáÊŞííÏ)$",
"^(İß ÇáÊŞííÏ) (%d+)$",
"^(İß ÇáÊŞííÏ) (@[%a%d_]+)$",
"^(İß ÊŞííÏ)$",
"^(İß ÊŞííÏ) (%d+)$",
"^(İß ÊŞííÏ) (@[%a%d_]+)$",
"^(ÖÚ ÔÑØ ÇáÊİÚíá) (%d+)$",
"^(ÇáÊİÇÚá)$",
"^(ÇáÊİÇÚá) (@[%a%d_]+)$",
"^([iI][dD])$",
"^(ÊİÚíá ÇáÇíÏí ÈÇáÕæÑå)$",
"^(ÊÚØíá ÇáÇíÏí ÈÇáÕæÑå)$",
"^(ÊÚØíá ÇáÑİÚ)$",
"^(ÊİÚíá ÇáÑİÚ)$",
"^(ÊÚØíá ÇáÊÓáíå)$",
"^(ÊİÚíá ÇáÊÓáíå)$",
"^(Şİá ÇáÏÎæá ÈÇáÑÇÈØ)$",
"^(İÊÍ ÇáÏÎæá ÈÇáÑÇÈØ)$", 
"^(ÇíÏí)$",
"^(ÇíÏí) (@[%a%d_]+)$",
"^(ßÔİ)$",
"^(ßÔİ) (%d+)$",
"^(ßÔİ) (@[%a%d_]+)$",
'^(ÑİÚ ããíÒ)$',
'^(ÑİÚ ããíÒ) (@[%a%d_]+)$',
'^(ÑİÚ ããíÒ) (%d+)$',
'^(ÊäÒíá ããíÒ)$',
'^(ÊäÒíá ããíÒ) (@[%a%d_]+)$',
'^(ÊäÒíá ããíÒ) (%d+)$',
'^(ÑİÚ ÇÏãä)$',
'^(ÑİÚ ÇÏãä) (@[%a%d_]+)$',
'^(ÑİÚ ÇÏãä) (%d+)$',
'^(ÊäÒíá ÇÏãä)$',
'^(ÊäÒíá ÇÏãä) (@[%a%d_]+)$',
'^(ÊäÒíá ÇÏãä) (%d+)$', 
"^(ÑİÚ ËæÑ)$",
"^(ÊäÒíá ËæÑ)$",
"^(ÑİÚ ßíßå)$",
"^(ÊäÒíá ßíßå)$",
"^(ÑİÚ ÈÕáå)$",
"^(ÊäÒíá ÈÕáå)$",
"^(ÑİÚ ĞÈÇäå)$",
"^(ÊäÒíá ĞÈÇäå)$",
"^(ÑİÚ ßáíÌå)$",
"^(ÊäÒíá ßáíÌå)$",
"^(ÑİÚ ÒŞ)$",
"^(ÊäÒíá ÒŞ)$",
"^(ÑİÚ ÏÌÇÌå)$",
"^(ÊäÒíá ÏÌÇÌå)$",
"^(ÑİÚ ÍãÇÑ)$",
"^(ÊäÒíá ÍãÇÑ)$",
"^(ÑİÚ ŞÑÏ)$",
"^(ÊäÒíá ŞÑÏ)$",
"^(ÑİÚ ÈŞÑå)$",
"^(ÊäÒíá ÈŞÑå)$",
"^(ÑİÚ ÊíÓ)$",
"^(ÊäÒíá ÊíÓ)$",
"^(ÑİÚ ßáÈ)$",
"^(ÊäÒíá ßáÈ)$",
"^(ÑİÚ ÒÇÍİ)$",
"^(ÊäÒíá ÒÇÍİ)$",
'^(ÑİÚ ÇáãÏíÑ)$',
'^(ÑİÚ ãÏíÑ)$', 
'^(ÑİÚ ãÏíÑ) (@[%a%d_]+)$',
'^(ÑİÚ ÇáãÏíÑ) (@[%a%d_]+)$',
'^(ÑİÚ ÇáãÏíÑ) (%d+)$',
'^(ÑİÚ ãÏíÑ) (%d+)$',
'^(ÑİÚ ãäÔì ÇÓÇÓí)$',
'^(ÑİÚ ãäÔÆ ÇÓÇÓí)$',
'^(ÑİÚ ãäÔÆ ÇÓÇÓí) (@[%a%d_]+)$',
'^(ÑİÚ ãäÔì ÇÓÇÓí) (@[%a%d_]+)$',
'^(ÊäÒíá ãäÔÆ ÇÓÇÓí)$',
'^(ÊäÒíá ãäÔì ÇÓÇÓí)$',
'^(ÊäÒíá ãäÔÆ ÇÓÇÓí) (%d+)$',
'^(ÊäÒíá ãäÔì ÇÓÇÓí) (%d+)$',
'^(ÊäÒíá ãäÔì ÇÓÇÓí) (@[%a%d_]+)$',
'^(ÊäÒíá ãäÔÆ ÇÓÇÓí) (@[%a%d_]+)$',
'^(ÑİÚ ãäÔì)$',
'^(ÑİÚ ãäÔÆ)$',
'^(ÑİÚ ãäÔÆ) (@[%a%d_]+)$',
'^(ÑİÚ ãäÔì) (@[%a%d_]+)$',
'^(ÊäÒíá ãäÔÆ)$',
'^(ÊäÒíá ãäÔì)$',
'^(ÊäÒíá ãäÔÆ) (%d+)$',
'^(ÊäÒíá ãäÔì) (%d+)$',
'^(ÊäÒíá ãäÔì) (@[%a%d_]+)$',
'^(ÊäÒíá ãäÔÆ) (@[%a%d_]+)$',
'^(ÊäÒíá ÇáãÏíÑ)$',
'^(ÊäÒíá ãÏíÑ)$',
'^(ÊäÒíá ãÏíÑ) (@[%a%d_]+)$',
'^(ÊäÒíá ÇáãÏíÑ) (@[%a%d_]+)$',
'^(ÊäÒíá ÇáãÏíÑ) (%d+)$',
'^(ÊäÒíá ãÏíÑ) (%d+)$',
 '^(ÕáÇÍíÇÊå)$',
 '^(ÕáÇÍíÇÊí)$',
'^(ÕáÇÍíÇÊå) (@[%a%d_]+)$',
'^(Şİá) (.+)$',
'^(İÊÍ) (.+)$',
'^(ÊİÚíá)$',
'^(ÊİÚíá) (.+)$',
'^(ÊÚØíá)$',
'^(ÊÚØíá) (.+)$',
'^(ÖÚ ÊßÑÇÑ) (%d+)$',
"^(ãÓÍ)$",
"^(ãÓÍ) (.+)$",
'^(ãäÚ) (.+)$',
'^(ÇáÛÇÁ ãäÚ) (.+)$',
"^(ÍÙÑ ÚÇã)$",
"^(ÍÙÑ ÚÇã) (@[%a%d_]+)$",
"^(ÍÙÑ ÚÇã) (%d+)$",
"^(ÇáÛÇÁ ÇáÚÇã)$",
"^(ÇáÛÇÁ ÇáÚÇã) (@[%a%d_]+)$",
"^(ÇáÛÇÁ ÇáÚÇã) (%d+)$",
"^(ÇáÛÇÁ ÚÇã)$",
"^(ÇáÛÇÁ ÚÇã) (@[%a%d_]+)$",
"^(ÇáÛÇÁ ÚÇã) (%d+)$",
"^(ÍÙÑ)$",
"^(ÍÙÑ) (@[%a%d_]+)$",
"^(ÍÙÑ) (%d+)$",
"^(ÇáÛÇÁ ÇáÍÙÑ)$", 
"^(ÇáÛÇÁ ÇáÍÙÑ) (@[%a%d_]+)$",
"^(ÇáÛÇÁ ÇáÍÙÑ) (%d+)$",
"^(ÇáÛÇÁ ÍÙÑ)$", 
"^(ÇáÛÇÁ ÍÙÑ) (@[%a%d_]+)$",
"^(ÇáÛÇÁ ÍÙÑ) (%d+)$",
"^(ØÑÏ)$",
"^(ØÑÏ) (@[%a%d_]+)$",
"^(ØÑÏ) (%d+)$",
"^(ßÊã)$",
"^(ßÊã) (@[%a%d_]+)$",
"^(ßÊã) (%d+)$",
"^(ÇáÛÇÁ ÇáßÊã)$",
"^(ÇáÛÇÁ ÇáßÊã) (@[%a%d_]+)$",
"^(ÇáÛÇÁ ÇáßÊã) (%d+)$",
"^(ÇáÛÇÁ ßÊã)$",
"^(ÇáÛÇÁ ßÊã) (@[%a%d_]+)$",
"^(ÇáÛÇÁ ßÊã) (%d+)$",
"^(ÑİÚ ãØæÑ)$",
"^(ÑİÚ ãØæÑ) (@[%a%d_]+)$",
"^(ÑİÚ ãØæÑ) (%d+)$",
"^(ÊäÒíá ãØæÑ)$",
"^(ÊäÒíá ãØæÑ) (%d+)$",
"^(ÊäÒíá ãØæÑ) (@[%a%d_]+)$",
"^(ÊÚØíá) (-%d+)$",
"^(ÇáÇÔÊÑÇß) ([123])$",
"^(ÇáÇÔÊÑÇß)$",
"^(ÊäÒíá Çáßá)$", 
"^(ÔÍä) (%d+)$",
"^(ÇáãÌãæÚå)$",
"^(ßÔİ ÇáÈæÊ)$",
"^(ÇäÔÇÁ ÑÇÈØ)$",
"^(ÖÚ ÇáÑÇÈØ)$",
"^(ÊËÈíÊ)$",
"^(ÇáÛÇÁ ÇáÊËÈíÊ)$",
"^(ÇáÛÇÁ ÊËÈíÊ)$",
"^(ÑÇÈØ)$",
"^(ÇáÑÇÈØ)$",
"^(ÖÚ ÑÇÈØ)$",
"^(ÑÇÈØ ÎÇÕ)$",
"^(ÇáÑÇÈØ ÎÇÕ)$",
"^(ÇáŞæÇäíä)$",
"^(ÖÚ ÇáŞæÇäíä)$",
"^(ÖÚ ŞæÇäíä)$",
"^(ÖÚ ÊßÑÇÑ)$",
"^(ÖÚ ÇáÊßÑÇÑ)$",
"^(ÇáÇÏãäíå)$",
"^(ÊÇß ááßá)$",
"^(äĞÇÑ)$",
"^(ÊÇß)$",
"^(ŞÇÆãÉ ÇáãäÚ)$",
"^(ÇáãÏÑÇÁ)$",
"^(ÇáããíÒíä)$",
"^(ÇáãßÊæãíä)$",
"^(ÖÚ ÇáÊÑÍíÈ)$",
"^(ÇáÊÑÍíÈ)$",
"^(ÇáãäÔì ÇáÇÓÇÓí)$",
"^(ÇáãäÔÆ ÇáÇÓÇÓí)$",
"^(ÇáãÍÙæÑíä)$",
"^(ŞÇÆãÉ ÇáĞÈÇä)$",
"^(ŞÇÆãÉ ÇáËæÑ)$",
"^(ŞÇÆãÉ ÇáÈÕá)$",
"^(ŞÇÆãÉ ÇáßáíÌå)$",
"^(ŞÇÆãÉ ÇáÒŞ)$",
"^(ŞÇÆãÉ ÇáÏÌÇÌ)$",
"^(ŞÇÆãÉ ÇáÍãÇÑ)$",
"^(ŞÇÆãÉ ÇáŞÑæÏ)$",
"^(ŞÇÆãÉ ÇáÈŞÑ)$",
"^(ŞÇÆãÉ ÇáÊíÓ)$",
"^(ŞÇÆãÉ ÇáßáÇÈ)$",
"^(ŞÇÆãÉ ÇáÒæÇÍİ)$",
"^(ŞÇÆãÉ Çáßíß)$",
"^(ÖÚ ÇÓã)$",
"^(ÖÚ ÕæÑå)$",
"^(ÖÚ æÕİ)$",
"^(ØÑÏ ÇáÈæÊÇÊ)$",
"^(ßÔİ ÇáÈæÊÇÊ)$",
"^(ØÑÏ ÇáãÍĞæİíä)$",
"^(ÑÓÇÆáí)$",
"^(ÑÓÇíáí)$",
"^(ÇÍÕÇÆíÇÊí)$",
"^(ãÚáæãÇÊí)$",
"^(ãÓÍ ãÚáæãÇÊí)$",
"^(ãæŞÚí)$",
"^(ÑİÚ ÇáÇÏãäíå)$",
"^(ÕæÑå ÇáÊÑÍíÈ)$",
"^(ÖÚ ßáíÔå ÇáãØæÑ)$",
"^(ÇáãØæÑ)$",
"^(ÔÑØ ÇáÊİÚíá)$",
"^(ŞÇÆãÉ ÇáãÌãæÚÇÊ)$",
"^(ÇáãÌãæÚÇÊ)$",
"^(ÇáãÌãæÚÇÊ ??)$",
"^(ÇáãÔÊÑßíä)$",
"^(ÇáãÔÊÑßíä ?)$",
"^(ÇĞÇÚå)$",
"^(ÇĞÇÚå ÚÇã)$",
"^(ÇĞÇÚå ÎÇÕ)$",
"^(ÇĞÇÚå ÚÇã ÈÇáÊæÌíå)$",
"^(ÇĞÇÚå ÚÇã ÈÇáÊæÌíå ??)$", 
"^(ÇĞÇÚå ÎÇÕ ??)$", 
"^(ÇĞÇÚå ÚÇã ??)$", 
"^(ÇĞÇÚå ??)$", 
"^(ŞÇÆãÉ ÇáÚÇã)$",
"^(ŞÇÆãÉ ÇáÚÇã ??)$",
"^(ÇáãØæÑíä)$",
"^(ÇáãØæÑíä ??)$",
"^(ÊíÓÊ)$",
"^(test)$",
"^(ÇíÏíí??)$",
"^(ŞäÇÉ ÇáÓæÑÓ ??)$",
"^(ÇáÇÍÕÇÆíÇÊ)$",
"^(ÇáÇÍÕÇÆíÇÊ ??)$",
"^(ÇÖİ ÑÏ ÚÇã)$",
"^(ÇÖİ ÑÏ ÚÇã ?)$",
"^(ãÓÍ ÇáÑÏæÏ)$",
"^(ãÓÍ ÇáÑÏæÏ ÇáÚÇãå)$",
"^(ÖÚ ÇÓã ááÈæÊ)$",
"^(ãÓÍ ÇáÕæÑå)$",
"^(ãÓÍ ÑÏ)$",
"^(ÇáÑÏæÏ)$",
"^(ÇáÑÏæÏ ÇáÚÇãå)$",
"^(ÇáÑÏæÏ ÇáÚÇãå ??)$",
"^(ÇÖİ ÑÏ)$",
"^(/UpdateSource)$",
"^(ÊÍÏíË ÇáÓæÑÓ ??)$",
"^(ÊÍÏíË ÇáÓæÑÓ)$",
"^(ÊäÙíİ ÇáãÌãæÚÇÊ)$",
"^(ÊäÙíİ ÇáãÔÊÑßíä)$",
"^(ÊäÙíİ ÇáãÌãæÚÇÊ ??)$",
"^(ÊäÙíİ ÇáãÔÊÑßíä ??)$",
"^(ÑÊÈÊí)$",
"^(ÖÚ ÇÓã ááÈæÊ ©)$",
"^(ÖÚ ÕæÑå ááÊÑÍíÈ ??)$",
"^(ÖÚ ÕæÑå ááÊÑÍíÈ)$",
"^(ÇáÍãÇíå)$",
"^(ÇáÇÚÏÇÏÇÊ)$",
"^(ÇáæÓÇÆØ)$",
"^(ÇáÛÇÁ ÇáÇãÑ ??)$",
"^(ÇáÑÊÈå)$",
"^(ÇáÛÇÁ)$",
"^(ÎÑİÔÊí)$",
"^(ÇÓãí)$",
"^(ÇáÊÇÑíÎ)$",
"^(/[Ss]tore)$",
"^(ÇÕÏÇÑ ÇáÓæÑÓ)$",
"^(ÇáÇÕÏÇÑ)$",
"^(server)$",
"^(ÇáÓíÑİÑ)$",
"^(İÍÕ ÇáÈæÊ)$", 
"^(äÓÎå ÇÍÊíÇØíå ááãÌãæÚÇÊ)$",
"^(ÑİÚ äÓÎå ÇáÇÍÊíÇØíå)$", 
"^(ÊİÚíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí)$", 
"^(ÊÚØíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí)$", 
"^(ÊÛííÑ ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí)$", 
"^(ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí)$", 
"^(ÊİÚíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ?)$", 
"^(ÊÚØíá ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??)$", 
"^(ÊÛííÑ ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??)$", 
"^(ÇáÇÔÊÑÇß ÇáÇÌÈÇÑí ??)$", 
"^(ÇÍÙÑäí)$", 
"^(ÇØÑÏäí)$", 
"^(ÌåÇÊí)$", 










"^(ÇáÓæÑÓ)$",
"^(ÓæÑÓ)$",
"^(ã ÇáãØæÑ)$", 
"^(ÇæÇãÑ ÇáÑÏ)$",
"^(ÇáÇæÇãÑ)$",
"^(ã1)$",
"^(ã2)$",
"^(ã3)$",
"^(ã4)$",
"^(ã5)$",
"^(ã6)$",
"^(ã7)$",
 
 
 },
 imax = imax,
 dmax = dmax,
 }
