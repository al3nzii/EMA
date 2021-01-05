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
bd = '????�??����� ['..USERNAME..'](tg://user?id='..msg.sender_user_id_..') \n???�������� ����� ���� �������� � ���� ������ @a_l3nzi'
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
return "??*?* ��� ����� ��� {������,������,������} ���  \n??"
end
redis:set(max.."getidstatus"..msg.chat_id_, "Simple")
return  "????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* �� ����� ������ �������  \n?" 
end 
function unlock_photos(msg)
if not msg.Director then
return "??*?* ��� ����� ��� {������,������,������} ���  \n??"
end
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
return  "????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* �� ����� ������ ������� \n?" 
end
function cmds_on(msg)
if not msg.Creator then return "??*?* ��� ����� ��� {������,������} ���  \n??"
end
redis:set(max..'lock:kara:'..msg.chat_id_,'on')
return "????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* �� ����� ����� �� �������� \n?"
end
function cmds_off(msg)
if not msg.Creator then return "??*?* ��� ����� ��� {������,������} ���  \n??"
end
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return "????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* �� ����� ����� �� �������� \n?"
end
function cmdss_on(msg)
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??"
end
redis:set(max..'lock:karaa:'..msg.chat_id_,'on')
return "????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* �� ����� ������� \n?"
end
function cmdss_off(msg)
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??"
end
redis:set(max..'lock:karaa:'..msg.chat_id_,'off')
return "????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* �� ����� �������\n?"
end

function lockjoin(msg)
if not msg.Admin then return "??*?* ��� ����� ��� {������,������,������,������} ���  \n??"
end
redis:set(max..'lock:join:'..msg.chat_id_,true)
return "*????�??*?* ���� ����� *"..msg.TheRankCmd.."*\n??*?* �� ��� ������ ������� \n?*" 

end
function unlockjoin(msg)
if not msg.Admin then return "??*?* ��� ����� ��� {������,������,������,������} ���  \n??"
end
redis:del(max..'lock:join:'..msg.chat_id_)
return "*????�??*?* ���� ����� *"..msg.TheRankCmd.."*\n??*?* �� ��� ������ ������� \n?*" 
end


local function imax(msg,MsgText)
if msg.type ~= 'pv' then

if MsgText[1] == "�����" and not MsgText[2] then
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end
if MsgText[1] == "�����" and not MsgText[2] then
return modrem(msg) 
end
if MsgText[1] == "����� ������ �������" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "����� ������ �������" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "����� �����" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "����� �����" and not MsgText[2] then
return cmds_off(msg) 
end
if MsgText[1] == "����� �������" and not MsgText[2] then
return cmdss_on(msg)  
end
if MsgText[1] == "����� �������" and not MsgText[2] then
return cmdss_off(msg) 
end

if MsgText[1] == "��� ������ �������" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "��� ������ �������" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == '���' and MsgText[2] then
if not msg.SudoUser then return "??*?*��� ����� ��� {������} ���  \n??" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(max..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'????�???�� ��� �������� ��� `'..MsgText[2]..'` ���   ... ????')
sendMsg(SUDO_ID,0,'????�???�� ��� �������� ��� `'..MsgText[2]..'` ���   ... ????\n?????�???�� ������  � �  '..redis:get(max..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'????�???����� ������ ???\n????�???��� �������� ���� �� ��� ��� ��� 1000 ��� ��� ??')
end 
return false
end

if MsgText[1] == '��������' and MsgText[2] then 
if not msg.SudoUser then return "??*?*��� ����� ��� {������} ���  \n??" end
if MsgText[2] == '1' then
redis:setex(max..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'????�???�� ����� ��������   ????\n??? �������� � `30 ���`  *(���)*')
sendMsg(SUDO_ID,0,'????�???�� ����� ��������  ????\n??? �������� � `30 ���`  *(���)*')
end
if MsgText[2] == '2' then
redis:setex(max..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'????�???�� ����� ��������   ????\n??? �������� � `90 ���`  *(3 ����)*')
sendMsg(SUDO_ID,0,'????�???�� ����� ��������   ????\n??? �������� � `90 ���`  *(3 ����)*')
end
if MsgText[2] == '3' then
redis:set(max..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'????�???�� ����� ��������   ????\n??? �������� � `�����`  *(��� ������)*')
sendMsg(SUDO_ID,0,'????�???�� ����� ��������   ????\n??? �������� � `�����`  *(��� ������)*')
end 
return false
end


if MsgText[1] == '��������' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local check_time = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*�������� *??\n?' end
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
remained_expire = '???`���� �� �������� ` � � * \n ??? '..sec..'* �����'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '???`���� �� �������� ` � � '..min..' *����� � * *'..sec..'* �����'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '???`���� �� �������� ` � � * \n ??? '..hours..'* ���� � *'..min..'* ����� � *'..sec..'* �����'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '???`���� �� �������� ` � � * \n ??? '..day..'* ��� � *'..hours..'* ���� � *'..min..'* ����� � *'..sec..'* �����'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '???`���� �� �������� ` � � * \n ??? '..month..'* ��� � *'..day..'* ��� � *'..hours..'* ���� � *'..min..'* ����� � *'..sec..'* �����'
elseif tonumber(check_time) > 31536000 then
remained_expire = '???`���� �� �������� ` � � * \n ??? '..year..'* ��� � *'..month..'* ��� � *'..day..'* ��� � *'..hours..'* ���� � *'..min..'* ����� � *'..sec..'* �����' end
return remained_expire
end


if MsgText[1] == "��������" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(max..'group:name'..msg.chat_id_) or '')
redis:set(max..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"????�??? ? ���������� ������������ ?\n\n"
.."*???* ��� ��������� ? ? *"..data.member_count_.."* ?"
.."\n*???* ��� ����������� ? ? *"..data.kicked_count_.."* ?"
.."\n*????�???* ��� ����������� ? ? *"..data.administrator_count_.."* ?"
.."\n*??* ���� �������� ? ?"..msg.chat_id_.."?"
.."\n\n??����� ? ?  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ?\n"
)
end,nil) 
return false
end

if MsgText[1] == "�������" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "���" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "����� ���" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "����� �����" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return FilterXList(msg) 
end

if MsgText[1] == "�������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return settingsall(msg) 
end

if MsgText[1] == "���������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return settings(msg) 
end

if MsgText[1] == "�������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return media(msg) 
end

if MsgText[1] == "��������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return GetListAdmin(msg) 
end

if MsgText[1] == "���" then
if not msg.Admin then return "??*�* ��� ����� ��� {������,������,������,������} ���  \n??" end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 200
},function(ta,taha)
local t = "\n?| ����� ������� \n?????????????\n"
x = 0
local list = taha.members_
for k, v in pairs(list) do
x = x + 1
t = t..""..x.." - {["..v.user_id_.."](tg://user?id="..v.user_id_..")} \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if MsgText[1] == "����" then 
if not msg.Admin then return "??*?* ��� ����� ��� {������,������,������,������} ���  \n??" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "��� ����" then 
if not msg.Admin then return "??*?* ��� ����� ��� {������,������,������,������} ���  \n??" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "������ �������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return MONSEBOT(msg) 
end

if MsgText[1] == "�������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return ownerlist(msg) 
end

if MsgText[1] == "������ �������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return Hussainlist(msg) 
end

if MsgText[1] == "��������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return whitelist(msg) 
end

if MsgText[1] == "����� ����" then 
if not msg.Rank then end
return zzzkkk(msg) 
end

if MsgText[1] == "����� ������" then 
if not msg.Rank then end
return zzkk(msg) 
end

if MsgText[1] == "����� ������" then 
if not msg.Rank then end
return hhaa(msg) 
end

if MsgText[1] == "����� ������" then 
if not msg.Rank then end
return aahh(msg) 
end

if MsgText[1] == "����� �����" then 
if not msg.Rank then end
return ggoo(msg) 
end

if MsgText[1] == "����� �����" then 
if not msg.Rank then end
return yyoo(msg) 
end

if MsgText[1] == "����� ������" then 
if not msg.Rank then end
return klaa(msg) 
end

if MsgText[1] == "����� �������" then 
if not msg.Rank then end
return ssee(msg) 
end

if MsgText[1] == "����� �����" then 
if not msg.Rank then end
return kakaa(msg) 
end

if MsgText[1] == "����� �����" then 
if not msg.Rank then end
return bass(msg) 
end

if MsgText[1] == "����� ������" then 
if not msg.Rank then end
return trrr(msg) 
end

if MsgText[1] == "����� �������" then 
if not msg.Rank then end
return kll(msg) 
end

if MsgText[1] == "����� �����" then 
if not msg.Rank then end
return vorr(msg) 
end


if MsgText[1] == "��������" then 
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "��������" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "��������" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'???������ ��� ���� \n????�??')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'???���� ���� ���� \n????�??')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "��� �����" then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
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
return sendMsg(msg.chat_id_,msg.id_,'\n???���� ����� ����� ��� ���� ������� \n???��������� �� ? \n���������������������������������������������������������\n???���� ������� �������� ? ? '..info..' ?\n???��� ������� ? ? '..delete..' ?\n???��� ���������� ? ? '..restrict..' ?\n??���� �������� ? ? '..invite..' ?\n???����� ������� ? ? '..pin..' ?\n???����� ������ ��� ? ? '..promote..' ?\n\n???������ � ����� ?  ? ? ���� ���� �������� ������ ? ? ? ���� ��� ����� ��������')   
end
end
end

if MsgText[1] == "�����" and msg.reply_id then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "�� ����� ������� ����� ����� �� ��� �������"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"????�?*?*���� ����� "..msg.TheRankCmd.." \n??*?* �� ����� ������� \n?")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* ���� �� ������ ������� .\n??*?* ��� ���� �� �� ���� ������ ������� \n ??')    
end
end,nil)
end
return false
end

if MsgText[1] == "����� �������" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "�� ����� ����� ������� ����� ����� �� ��� �������"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"????�?*?*���� ����� "..msg.TheRankCmd.."  \n??*?* �� ����� ����� ������� \n?")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* ���� �� ������ ����� ������� .\n??*?* ��� ���� �� �� ���� ������ ������� \n ??')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* ���� ����� '..msg.TheRankCmd..' .\n??*?* �� ���� ����� ����� ����� �������� \n ??')    
end
end,nil)
end
return false
end


if MsgText[1] == "�����" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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

if MsgText[1] == "�� �������" or MsgText[1] == "�� �����" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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


if MsgText[1] == "��� ����" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ���� \n?")
end
return false
end


if MsgText[1] == "����� ����" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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


if (MsgText[1] == "��� ������"  or MsgText[1] == "��� ����" ) then
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end
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
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ���� \n?")
end
return false
end


if (MsgText[1] == "����� ������" or MsgText[1] == "����� ����" ) then
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end
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


if (MsgText[1] == "��� ���� �����" or MsgText[1] == "��� ���� �����") then
if not msg.SudoUser then return "??*?*��� ����� ��� {������,������ �������} ���  \n??" end
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

if (MsgText[1] == "����� ���� �����" or MsgText[1] == "����� ���� �����") then
if not msg.SudoUser then return "??*?*��� ����� ��� {������,������ �������} ���  \n??" end
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


if (MsgText[1] == "��� ����" or MsgText[1] == "��� ����") then
if not msg.Kara then return "??*?*��� ����� ��� {������ �������,������,������ �������} ���  \n??" end
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


if (MsgText[1] == "����� ����" or MsgText[1] == "����� ����" ) then
if not msg.Kara then return "??*?*��� ����� ��� {������,������ ������� ���} ���  \n??" end
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


if MsgText[1] == "��� ����" then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
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
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ���� \n?")
end
return false
end



if MsgText[1] == "����� ����" then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
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



if MsgText[1] == "����� ����" then
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end

local Admins = redis:scard(max..'admins:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
local NumMDER = redis:scard(max..'owners:'..msg.chat_id_)
redis:del(max..'owners:'..msg.chat_id_)
local MMEZEN = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)

return "????�??���� ����� "..msg.TheRankCmd.." ?\n????�??���?��� ����� ? "..Admins.." ? �� ��������\n????�???���?��� ����� ? "..NumMDER.." ? �� �������\n????�??���?��� ����� ? "..MMEZEN.." ? �� ��������\n\n???���?��� �������� ������ ��������\n?" 
end


if MsgText[1] == "��� ��" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="zkzk"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ��" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="zkzkk"})
end
return false
end


if MsgText[1] == "��� �����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dadaa"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� �����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dadaaa"})
end
return false
end


if MsgText[1] == "��� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="motee"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="moteee"})
end
return false
end


if MsgText[1] == "��� ���" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="yyuu"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ���" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="yyuuu"})
end
return false
end


if MsgText[1] == "��� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bakki"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bakkii"})
end
return false
end


if MsgText[1] == "��� ���" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="hamee"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ���" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="hamee"})
end
return false
end


if MsgText[1] == "��� ���" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kalb"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ���" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kalbb"})
end
return false
end


if MsgText[1] == "��� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="zaahf"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="zaahff"})
end
return false
end

if MsgText[1] == "��� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkaak"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkaakk"})
end
return false
end

if MsgText[1] == "��� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bbaa"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bbaaa"})
end
return false
end

if MsgText[1] == "��� �����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ttaa"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� �����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ttaaa"})
end
return false
end

if MsgText[1] == "��� �����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkw"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� �����" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkww"})
end
return false
end


if MsgText[1] == "��� ���" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="voo"})
end
end
if redis:get(max..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"????�??*?* ���� ����� "..msg.TheRankCmd.."\n??*?* ����� ������� �����\n?")
end
return false
end
if MsgText[1] == "����� ���" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="vooo"})
end
return false
end


--{ Commands For locks }

if MsgText[1] == "���" then

if MsgText[2] == "����"		 then return lock_All(msg) end
if MsgText[2] == "�������" 	 then return lock_Media(msg) end
if MsgText[2] == "����� ��������" 	 then return tqeed_photo(msg) end
if MsgText[2] == "������� ��������"  then return tqeed_video(msg) end
if MsgText[2] == "�������� ��������" then return tqeed_gif(msg) end
if MsgText[2] == "������� ��������"  then return tqeed_fwd(msg) end
if MsgText[2] == "������� ��������"  then return tqeed_link(msg) end
if MsgText[2] == "�������"    	     then return mute_text(msg) end
if MsgText[2] == "��������" 		 then return mute_gif(msg) end
if MsgText[2] == "�����" 			 then return mute_photo(msg) end
if MsgText[2] == "�������"			 then return mute_video(msg) end
if MsgText[2] == "�������" 		then  return mute_audio(msg) end
if MsgText[2] == "�����" 		then return mute_voice(msg) end
if MsgText[2] == "��������" 	then return mute_sticker(msg) end
if MsgText[2] == "������" 		then return mute_contact(msg) end
if MsgText[2] == "�������" 		then return mute_forward(msg) end
if MsgText[2] == "������"	 	then return mute_location(msg) end
if MsgText[2] == "�������" 		then return mute_document(msg) end
if MsgText[2] == "���������" 	then return mute_tgservice(msg) end
if MsgText[2] == "��������" 		then return mute_inline(msg) end
if MsgText[2] == "��������" 	then return mute_keyboard(msg) end
if MsgText[2] == "�������" 		then return lock_link(msg) end
if MsgText[2] == "�����" 		then return lock_tag(msg) end
if MsgText[2] == "��������" 	then return lock_username(msg) end
if MsgText[2] == "�������" 		then return lock_edit(msg) end
if MsgText[2] == "�������" 		then return lock_spam(msg) end
if MsgText[2] == "�������" 		then return lock_flood(msg) end
if MsgText[2] == "�������" 		then return lock_bots(msg) end
if MsgText[2] == "������� ������" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "����������" 	then return lock_markdown(msg) end
if MsgText[2] == "�����" 		then return lock_webpage(msg) end 
if MsgText[2] == "�������" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "���" 		then 
if MsgText[2] == "����" then return Unlock_All(msg) end
if MsgText[2] == "�������" then return Unlock_Media(msg) end
if MsgText[2] == "����� ��������" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "������� ��������" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "�������� ��������" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "������� ��������" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "������� ��������" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "��������" 	then return unmute_gif(msg) 	end
if MsgText[2] == "�������" 		then return unmute_text(msg) 	end
if MsgText[2] == "�����" 		then return unmute_photo(msg) 	end
if MsgText[2] == "�������" 		then return unmute_video(msg) 	end
if MsgText[2] == "�������" 		then return unmute_audio(msg) 	end
if MsgText[2] == "�����" 		then return unmute_voice(msg) 	end
if MsgText[2] == "��������" 	then return unmute_sticker(msg) end
if MsgText[2] == "������" 		then return unmute_contact(msg) end
if MsgText[2] == "�������" 		then return unmute_forward(msg) end
if MsgText[2] == "������" 		then return unmute_location(msg) end
if MsgText[2] == "�������" 		then return unmute_document(msg) end
if MsgText[2] == "���������" 	then return unmute_tgservice(msg) end
if MsgText[2] == "��������" 		then return unmute_inline(msg) 	end
if MsgText[2] == "��������" 	then return unmute_keyboard(msg) end
if MsgText[2] == "�������" 		then return unlock_link(msg) 	end
if MsgText[2] == "�����" 		then return unlock_tag(msg) 	end
if MsgText[2] == "��������" 	then return unlock_username(msg) end
if MsgText[2] == "�������" 		then return unlock_edit(msg) 	end
if MsgText[2] == "�������" 		then return unlock_spam(msg) 	end
if MsgText[2] == "�������" 		then return unlock_flood(msg) 	end
if MsgText[2] == "�������" 		then return unlock_bots(msg) 	end
if MsgText[2] == "������� ������" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "����������" 	then return unlock_markdown(msg) end
if MsgText[2] == "�����" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "�������" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "����� ����" then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
if not redis:get(max..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(max..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(max..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"????�?*?*�� ����� ���� ���� \n???["..LinkGp.."]\n???���� ������ ���� { ������ } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"???�� ������ ����� ���� �������� .\n???����� ��� ���� �� �������� \n ??")
end
else
return sendMsg(msg.chat_id_,msg.id_,"???��� ��� ������ ������ ����� .\n???���� { ������ } ����� ������  \n ??")
end
return false
end 

if MsgText[1] == "�� ����" then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
redis:setex(max..'linkGroup'..msg.sender_user_id_,300,true)
return '???����� �� ����� ������ ������ ...??'
end

if MsgText[1] == "������" then
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "??*?*   �� ���� ���� \n??*?*������ ���� ���� { `����� ����` }\n??" 
end
local GroupName = redis:get(max..'group:name'..msg.chat_id_)
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
return "???����� ������������ ??\n???"..Flter_Markdown(GroupName).." :\n\n["..GroupLink.."]\n"
end
  

if MsgText[1] == "������ ���" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
if not GroupLink then return "??*?*    ������ ��� ����\n???*����� ���� [�� ����]*??" end
local Text = "???����� ������������ ??\n???"..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "????�?*?*���� ����� \n???�� ������ ������ ������ ���� ��� ���� �����\n!"
elseif res == 400 then
return "????�?*?*���� ����� \n??? �� ������ ������ ������ ��� ���� ������ ����� ���� \n!"
end
if res == 200 then 
return "????�?*?*���� ����� "..msg.TheRankCmd.."  \n???�� ����� ������ ��� �� ??"
end
end


if MsgText[1] == "�� ��������" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
redis:setex(max..'rulse:witting'..msg.sender_user_id_,300,true)
return '???����� �����  ???\n???���� ���� ��������  �������� ??'
end

if MsgText[1] == "��������" then
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "\n���������������������������������������������������������\n�������� :\n���������������������������������������������������������\n? | ������ ����� ������� ��������.\n? | �������� ����� ������� ������.\n? | ���� ��� ������� ������� ��� ������.\n? | ���� ������ ���������� ������� �� �������.\n? | ���� ��� �������� ������� ��� ��� ��������.\n? | ���� ��� ��������� ��� ������� ��� ��� ��������.\n? | ���� ���� �� ������ ������ ����� �� ����� ������.\n���������������������������������������������������������"
else 
return "*???�������� :*\n"..redis:get(max..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "�� �����" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "??*?* ���� ������� ,  ��� �� ���� �� ���  *[2-50]*" 
end
redis:set(max..'flood'..msg.chat_id_,MsgText[2]) 
return "??*?* �� ��� ������� � { *"..MsgText[2].."* }"
end



if MsgText[1] == "���" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
if 500 < tonumber(MsgText[2]) then return "??*?* ���� ����� ,  ��� �� ���� �� ���  *[2-100]*" end
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
sendMsg(msg.chat_id_,msg.id_,"*??* ��� ��� ~? { *"..MsgText[2].."* } �� �������  \n?")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*??* ��� ��� ~? { *"..MsgText[2].."* } �� �������  \n?")
end,nil))
end
end)
return false
end

if MsgText[2] == "��������" then 
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end

local Admins = redis:scard(max..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "??*?* ��� ? ����� ��� ??\n???���� �� ���� ������ ���� ����� ?" 
end
redis:del(max..'admins:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n???�� ��� {"..Admins.."} �� �������� �� ����� \n?"
end


if MsgText[2] == "����� �����" then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
local Mn3Word = redis:scard(max..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "??*?* ���� �� ���� ����� ������ ���� ����� ?" 
end
redis:del(max..':Filter_Word:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n???�� ��� {*"..Mn3Word.."*} ����� �� ����� ?"
end


if MsgText[2] == "��������" then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "???���� �� ���� ������ ���� ���� \n!" 
end
redis:del(max..'rulse:msg'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n???�� ��� �������� ����� ?"
end


if MsgText[2] == "�������"  then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
if not redis:get(max..'welcome:msg'..msg.chat_id_) then 
return "??*?* ��� ? ����� ��� ??\n???���� �� ���� ����� ���� ���� ?" 
end
redis:del(max..'welcome:msg'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n???�� ��� ������� ����� \n?"
end


if MsgText[2] == "������ �������" then
if not msg.SudoUser then return "??*?*��� ����� ��� {������} ���  \n??" end
local NumMnsha = redis:scard(max..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "???���� �� ���� ���� ����� \n!" 
end
redis:del(max..':Hussain:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} ������ ������� \n?"
end


if MsgText[2] == "���������" then
if not msg.SudoUser then return "??*?*��� ����� ��� {������} ���  \n??" end
local NumMnsha = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "???���� �� ���� ������� ���� ����� \n!" 
end
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ���������\n?"
end


if MsgText[2] == "�������" then
if not msg.Creator then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
local NumMDER = redis:scard(max..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "???���� �� ���� ����� ���� ����� \n!" 
end
redis:del(max..'owners:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMDER.." *} �� �������  \n?"
end

if MsgText[2] == '���������' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end

local list = redis:smembers(max..'banned:'..msg.chat_id_)
if #list == 0 then return "*???�� ���� �������� �������  *" end
message = '??*?* ����� ������� ��������� :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(max..'banned:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..#list.." *} �� ���������  \n?"
end

if MsgText[2] == '���������' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
local MKTOMEN = redis:scard(max..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "??*?* �� ���� �������� ������� �� �������� " 
end
redis:del(max..'is_silent_users:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..MKTOMEN.." *} �� ���������  \n?"
end

if MsgText[2] == '��������' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
local MMEZEN = redis:scard(max..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*??*?�� ���� �������� ������ �� �������� " 
end
redis:del(max..'whitelist:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..MMEZEN.." *} �� ��������  \n?"
end


if MsgText[2] == "����� �����" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':kaka:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':kaka:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ����� \n?"
end

if MsgText[2] == "����� �������" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':zahaf:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':zahaf:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� �������\n?"
end

if MsgText[2] == "����� ������" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':kka:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':kka:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ������\n?"
end

if MsgText[2] == "����� �����" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':yoo:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':yoo:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ����� \n?"
end

if MsgText[2] == "����� �����" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':baa:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':baa:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ����� \n?"
end

if MsgText[2] == "����� ������" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':mote:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':mote:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ������ \n?"
end

if MsgText[2] == "����� ������" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':ggyy:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':ggyy:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ������ \n?"
end

if MsgText[2] == "����� ������" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':zmm:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':zmm:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ������ \n?"
end

if MsgText[2] == "����� ����" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':zzkm:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ���� \n?"
end

if MsgText[2] == "����� �����" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':bba:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ����� \n?"
end

if MsgText[2] == "����� ������" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':tta:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ������ \n?"
end

if MsgText[2] == "����� �������" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':kww:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ������� \n?"
end

if MsgText[2] == "����� �����" then
if not msg.Rank then end
local NumMnsha = redis:scard(max..':vor:'..msg.chat_id_)
if NumMnsha ==0 then 
return "??*?*������ ��� ����� �� ����� ���� ���� \n!" 
end
redis:del(max..':zzkm:'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n??? �� ��� {* "..NumMnsha.." *} �� ����� \n?"
end

if MsgText[2] == '������' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "*??*?�� ���� ���� ���� ���� " 
end
redis:del(max..'linkGroup'..msg.chat_id_)
return "????�?*?*���� ����� "..msg.TheRankCmd.."   \n???�� ��� ���� �������� \n?"
end

end 
--End del 


if MsgText[1] == "�� ���" then
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end
redis:setex(max..'name:witting'..msg.sender_user_id_,300,true)
return "???����� �����  ???\n???���� ���� �����  �������� \n??"
end


if MsgText[1] == "��� ������" then
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ��� ������ ����������� ??\n?')
end


if MsgText[1] == "�� ����" then
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end
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
--return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ���� ����������� ?\n?')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'???��� ��� ������ ����� ������ \n?? ?��� ������ ������ `����� ������� �������� ` ?\n?')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(max..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '???����� ����� ??\n?? ?���� �� ������ ������\n??' 
end 
end


if MsgText[1] == "�� ���" then 
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end
redis:setex(max..'about:witting'..msg.sender_user_id_,300,true) 
return "???����� �����  ???\n???���� ���� �����  ��������\n??" 
end


if MsgText[1] == "��� �������" then
if not msg.Director then return "??*?*��� ����� ��� {������,������} ���  \n??" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"??| �� ������ ������� �� ������������� .") 
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
local TextR  = "??| ���� ��������� �? {* "..(Total - 1).." *} ?�\n\n"
if NumBot == 0 then 
TextR = TextR.."??| �� ������� ����� ������� �������� .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."??| �� ��� ���� {* "..NumBotAdmin.." *} ��� �������� ��������."
else
TextR = TextR.."??| �� ���� ���� ������� ����� .\n"
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


if MsgText[1] == "��� �������" then
if not msg.Director then return "??*?*��� ����� ��� {������,������} ���  \n??" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '??| ������ ������� ��������\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "� *?*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

??| ����ܘ {]]..total..[[} �������
??| ������ : ��� ? ����� �� ����� ���� �� ���������.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == '��� ���������' then
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end
sendMsg(msg.chat_id_,msg.id_,'??| ���� ����� ��� ������������ ���������� ...')
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
sendMsg(msg.chat_id_,msg.id_,"???�� ���� {* "..NumMemDone.." *} �� ��������� ������������ ??")
else
sendMsg(msg.chat_id_,msg.id_,'???�� ���� ������ ������ �� �������� ??')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "����" or MsgText[1]:lower() == "id" then

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
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,'???������ ['..UserNameID..']\n???������ ? '..msg.sender_user_id_..' ?\n???������ ? '..msg.TheRank..' ?\n??�???������ ? '..Get_Ttl(msgs)..' ?\n???������ ? '..msgs..' ?\n???����� ? '..nko..' ?\n?')
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
		sendMsg(msg.chat_id_,msg.id_,'???��� ���� ���� �� ��� ���� ����� ...!\n???������ ['..UserNameID..']\n???������ ? '..msg.sender_user_id_..' ?\n???������ ? '..msg.TheRank..' ?\n??�???������ ? '..Get_Ttl(msgs)..' ?\n???������ ? '..msgs..' ?\n???����� ? '..nko..' ?\n?')
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
		sendMsg(msg.chat_id_,msg.id_,'???������ ������� ���� \n???������ ['..UserNameID..']\n???������ ? '..msg.sender_user_id_..' ?\n???������ ? '..msg.TheRank..' ?\n??�???������ ? '..Get_Ttl(msgs)..' ?\n???������ ? '..msgs..' ?\n???����� ? '..nko..' ?\n?')
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

if MsgText[1] == "������" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== '������' or MsgText[1] == '������' or MsgText[1] == '���������'  then
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

local Get_info =  " \n???? �������������� ����������� ?\n \n"
.."???���������� ? "..msgs.." ?\n"
.."???��������� ? "..NumGha.." ?\n"
.."???������� ? "..photo.." ?\n"
.."???������������� ? "..animation.." ?\n"
.."???������������ ? "..sticker.." ?\n"
.."???����������� ? "..voice.." ?\n"
.."???������� ? "..audio.." ?\n"
.."???����������� ? "..video.." ?\n"
.."???����������� ? "..edited.." ?\n"
.."???���������� ? "..Get_Ttl(msgs).." ?\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == '���' and MsgText[2] == '������'  then
local msgs = redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "??*?*���� �� ���� ����� �� �� �����  ??" end
redis:del(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "??*?*�� ��� {* "..msgs.." *} �� ������ ??\n?"
end

if MsgText[1]== '�����' then
return '??�?*?*  ��� ����� �������� ? ? '..(redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ? \n??'
end

if MsgText[1] == '���' and MsgText[2] == '�����'  then
local adduser = redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "??*?*���� ��� ���� ���� ��� ��� �����" end
redis:del(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "??*?*�� ��� {* "..adduser.." *} �� �����\n?"
end

if MsgText[1] == '���' and MsgText[2] == '�����'  then
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if nko == 0 then  return "??*?*���� ��� ���� ���� ��� ��� �����" end
redis:del(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "??*?*�� ��� {* "..points.." *} �� �����\n?"
end

if MsgText[1] == '��������' or MsgText[1] == '�����' then
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

local Get_info ="????�???����� ��� ����� �� �������� ?? \n"
.."�.����������\n"
.."???������� ? "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." ?\n"
.."???������ ? "..ResolveUser(data).." ?\n"
.."???������� ? `"..msg.sender_user_id_.."` ?\n"
.."???������� ? "..msg.TheRank.." ?\n"
.."???� ? `"..msg.chat_id_.."` ?\n"
.."�.����������\n"
.." ? �������������� ���������� ?\n"
.."???���������� ? `"..msgs.."` ?\n"
.."???��������� ? `"..NumGha.."` ?\n"
.."???������� ? `"..photo.."` ?\n"
.."???������������� ? `"..animation.."` ?\n"
.."???������������ ? `"..sticker.."` ?\n"
.."???����������� ? `"..voice.."` ?\n"
.."???������� ? `"..audio.."` ?\n"
.."???����������� ? `"..video.."` ?\n"
.."???����������� ?`"..edited.."` ?\n"
.."???���������� ? "..Get_Ttl(msgs).." ?\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "��� ��������" then
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

local Get_info ="????�??���� ����� �� ��� ���� �������� "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "�����" then

if MsgText[2] == "������" 	then return unlock_replay(msg) end
if MsgText[2] == "�������" 	then return unlock_brod(msg) end
if MsgText[2] == "������" 	then return unlock_ID(msg) end
if MsgText[2] == "�������" 	then return unlock_Welcome(msg) end
if MsgText[2] == "�������" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "�����" then

if MsgText[2] == "������" 	then return lock_replay(msg) end
if MsgText[2] == "�������" 	then return lock_brod(msg) end
if MsgText[2] == "������" 	then return lock_ID(msg) end
if MsgText[2] == "�������" 	then return lock_Welcome(msg) end
if MsgText[2] == "�������" 	then return lock_waring(msg) end
end


if MsgText[1] == "�� �������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
redis:set(max..'welcom:witting'..msg.sender_user_id_,true) 
return "???����� �����  ???\n???���� ����� ������� ����\n\n -������ ������ ����� ���� ������� ���� :\n 1- ������ ��������  � *{��������}*  \n 2- ����� ��� ����� � *{�����}*\n 3-����� ���� ����� � *{������}*\n 4-����� ��� ������ � *{��������}*" 
end


if MsgText[1] == "�������" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
if redis:get(max..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(max..'welcome:msg'..msg.chat_id_))
else 
return "????�?*?*���� ����� "..msg.TheRankCmd.."  \n???���� �������� \n????�??" 
end 
end


if MsgText[1] == "���"  then
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


if MsgText[1] == "���" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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


if MsgText[1] == "���" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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


if (MsgText[1] == "����� �����" or MsgText[1] == "����� ���") and msg.Admin then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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


if MsgText[1] == "���" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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


if MsgText[1] == "����� �����" or MsgText[1] == "����� ���" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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

if MsgText[1] == "���������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return MuteUser_list(msg) 
end

if MsgText[1] == "���������" then 
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return GetListBanned(msg) 
end

if MsgText[1] == "��� ��������" then
if not msg.Creator then return "??*?*��� ����� ��� {������,������} ���  \n??" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == '���' and MsgText[2] == '��������'  then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
local mtwren = redis:scard(max..':SUDO_BOT:')
if mtwren == 0 then  return "??*?* ���� �� ���� ������ �� �����  ??" end
redis:del(max..':SUDO_BOT:') 
return "??*?* �� ��� {* "..mtwren.." *} �� �������� ??\n?"
end

if MsgText[1] == '���' and MsgText[2] == "����� �����"  then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
local addbannds = redis:scard(max..'gban_users')
if addbannds ==0 then 
return "*???����� ����� ����� .*" 
end
redis:del(max..'gban_users') 
return "??*?* ��� ����� { *"..addbannds.." *} �� ����� �����\n?" 
end 

if msg.SudoBase then

if MsgText[1] == "��� ����" then
if not msg.SudoBase then return "??*?*��� ����� ��� {������ ������� ??�??} ���  \n??" end
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

if MsgText[1] == "����� ����" then
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

if MsgText[1] == "����� ���������" or MsgText[1] == "����� ��������� ??" then
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
sendMsg(msg.chat_id_,msg.id_,'??*?* ����� , �� ���� ������� ����� \n?')
else
sendMsg(msg.chat_id_,msg.id_,'??*?* ��� ��������� �? { *'..#groups..'*  } ?�\n??*?* ��� �����  �? { *'..GroupDel..'*  } ?� ������ \n??*?* ���� ����� ������� ���� �? { *'..GroupsIsFound..'*  } ?� ������')
end
end
end)
end
return false
end
if MsgText[1] == "����� ��������� ??" or MsgText[1] == "����� ��������� ??" then
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
sendMsg(msg.chat_id_,msg.id_,'?| ����� , �� ���� ������� ����')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'??*?* ��� ��������� �? { *'..#pv..'*  } ?�\n??*?* ��� �����  �? { *'..NumPvDel..'*  } ?� ����� \n??*?* ���� ����� ������� ���� �? { *'..SenderOk..'*  } ?� �� ���������') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "�� ���� �������" or MsgText[1]=="�� ���� ������� ??" then
redis:setex(max..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'???����� ����� ??\n?? ?���� �� ������ ������ ������� \n??' 
end

if MsgText[1] == "�����" and MsgText[2] == "����� ����" then
return lock_service(msg) 
end

if MsgText[1] == "�����" and MsgText[2] == "����� ����" then 
return unlock_service(msg) 
end

if MsgText[1] == "���� �������" then
local Photo_Weloame = redis:get(max..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[??���� ��� ��� ������ ]]..redis:get(max..':NameBot:')..[[ ?
????�???��������� ��������� �����������
???��� ������� ����������� ���ʐ��� ����...

???������ ���������  � ]]..SUDO_USER:gsub([[\_]],'_')..[[ ??
]])

return false
else
return "??| �� ���� ���� ����� ������� �� ����� \n??| ������ ���� ������� ���� `�� ���� �������`"
end
end

if MsgText[1] == "�� ����� ������" then 
redis:setex(max..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '???����� ����� ??\n???���� �� ������ ������� \n??' 
end

if MsgText[1] == "�� ��� �������" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(max..':addnumberusers',MsgText[2]) 
return '??*?* �� ���� ���� ������� ����� ��� ���� ������������� �� ��� *?'..MsgText[2]..'?* ����  ??\n' 
end

if MsgText[1] == "��� �������" then 
return'??*?* ���� ������� ����� ��� ���� ������������� �� ��� *?'..redis:get(max..':addnumberusers')..'?* ����  ??\n' 
end 
end

if MsgText[1] == '���������' or MsgText[1] == "��������� ??" then
if not msg.SudoUser then return "??*?*��� ����� ��� {������} ���  \n??" end
return '??*?* ��� ��������� ������� � `'..redis:scard(max..'group:ids')..'`  ?' 
end

if MsgText[1] == "���������" or MsgText[1] == "��������� ?" then
if not msg.SudoUser then return "??*?*��� ����� ��� {������} ���  \n??" end
return '????�?*?*��� ��������� �� ����� : `'..redis:scard(max..'users')..'` \n??'
end

if MsgText[1] == '����� ���������' then 
if not msg.SudoBase then return "??*?*��� ����� ��� {������} ���  \n??" end
return chat_list(msg) 
end

if MsgText[1] == '�����' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "??*?*��� ����� ��� {������} ���  \n??" end
if redis:sismember(max..'group:ids',MsgText[2]) then
local name_gp = redis:get(max..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'??*?* �� ����� �������� ���� �� ������  \n??*?* ��� ����� ���� ???????? ...\n?')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '??*?* �� ����� �������� ��������� \n??*?* ��������� � ['..name_gp..']\n??*?* ������ � ( *'..MsgText[2]..'* )\n?'
else 
return '??*?* �� ���� ������ ����� ���� ������ !\n ' 
end 
end 

if MsgText[1] == '������' then
return redis:get(max..":TEXT_SUDO") or '???�� ���� ����� ������ .\n???����� ����� ����� �� ���� �����\n       " `�� ����� ������` " \n??'
end

if MsgText[1] == "����� ��� ��������" or MsgText[1] == "����� ��� �������� ??" then
if not msg.SudoUser then return"??*?*��� ����� ��� {������} ���  \n??" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "??*?* ������� ������ �� ��� ������ �������  ??" 
end
redis:setex(max..'fwd:'..msg.sender_user_id_,300, true) 
return "???����� ���� ���� ������� ������� \n??" 
end

if MsgText[1] == "����� ���" or MsgText[1] == "����� ��� ??" then		
if not msg.SudoUser then return"??*?*��� ����� ��� {������} ���  \n??" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "??*?* ������� ������ �� ��� ������ �������  ??" 
end
redis:setex(max..'fwd:all'..msg.sender_user_id_,300, true) 
return "???����� ���� ���� ������� ������� ��� \n??" 
end

if MsgText[1] == "����� ���" or MsgText[1] == "����� ��� ??" then		
if not msg.SudoUser then return "??*?*��� ����� ��� {������} ���  \n??" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "??*?* ������� ������ �� ��� ������ �������  ??" 
end
redis:setex(max..'fwd:pv'..msg.sender_user_id_,300, true) 
return "???����� ���� ���� ������� ������� ��� \n??"
end

if MsgText[1] == "�����" or MsgText[1] == "����� ??" then		
if not msg.SudoUser then return"??*?*��� ����� ��� {������} ���  \n??" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "??*?* ������� ������ �� ��� ������ �������  ??" 
end
redis:setex(max..'fwd:groups'..msg.sender_user_id_,300, true) 
return "???����� ���� ���� ������� ������� ��������� \n??" 
end

if MsgText[1] == "��������" or MsgText[1] == "�������� ??" then
if not msg.SudoUser then return"??*?*��� ����� ��� {������} ���  \n??" end
return sudolist(msg) 
end
 
if MsgText[1] == "����� �����" or MsgText[1]=="����� ����� ??" then 
if not msg.SudoUser then return"??*?*��� ����� ��� {������} ���  \n??" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "�����" and (MsgText[2] == "�������" or MsgText[2]=="������� ??") then 
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
return lock_twasel(msg) 
end

if MsgText[1] == "�����" and (MsgText[2] == "�������" or MsgText[2]=="������� ??") then 
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
return unlock_twasel(msg) 
end

if MsgText[1] == "��� ���" then
if not msg.SudoBase then 
return "??*?*��� ����� ��� {������ �������} ���  \n??" 
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

if MsgText[1] == "����� �����" or MsgText[1] == "����� ���" then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end

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

if MsgText[1] == "�����" then return '??*?* ����� ? ? '..msg.TheRank..' ?\n?' end

----------------- ������� ������� ---------------
if MsgText[1] == "����� ����� ??" or MsgText[1] == "�����" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
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
return '??*?* �� ����� ������ ����� \n??'
end  


if MsgText[1] == '����� ������' or MsgText[1] == '�������' then
return '????�??? ����� ���� ���� : *v'..version..'* \n??'
end

if (MsgText[1] == '����� ������' or MsgText[1] == '����� ������ ??') then
if not msg.SudoBase then return "??*?*��� ����� ��� {������ �������} ���  \n??" end
local GetVerison = https.request('https://github.com/MasSource/MAS.github.io/GetVersion.txt') or 0
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'??*?* ���� ����� ���� ���� \n??*?* ���� ����� ������ �������  ...')
redis:set(max..":VERSION",GetVerison)
return false
else
return "??| ������� ������ : *v"..version.."* \n????�??*?* ����� ���� ����� \n??"
end
return false
end

if MsgText[1] == '���� �������� ���������' then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
return buck_up_groups(msg)
end 

if MsgText[1] == '��� ���� ����������' then
if not msg.SudoBase then return "??*?*��� ����� ��� {������ �������} ���  \n??" end
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
sendMsg(msg.chat_id_,msg.id_,'?*?* ���� ��� ������ ����� ����� ... \n??')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"??*?* ���� ������ ���������� ��� ���� ����� � ["..Bot_User.."]  \n??")
end
else 
sendMsg(msg.chat_id_,msg.id_,'??*?* ���� ��� ����� ��� ����� ������ �� �� ������ �� ���� ������ ���� ��� ����� ������ ���� ��� ����� ����� ����� � �����\n??')
end  
else
sendMsg(msg.chat_id_,msg.id_,'??*?* ���� ����� ��� ����� Json !?\n??')
end 
else
sendMsg(msg.chat_id_,msg.id_,'??*?* ���� ��� ��� ��� ������ ���������� ���������\n??')
end 
end,nil)
else 
return "??*?* ���� ��� ������ ���������� ����\n??*?* �� �� ����� ��� ����� ����� \" `��� ���� ����������` \" "
end 
return false
end

if (MsgText[1]=="����" or MsgText[1]=="test") then 
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
return "?? ����� ������� ??" 
end

if (MsgText[1]== "����" or MsgText[1]=="�����??") and msg.type == "pv" then return  "\n????�???���� ����� ������ ����� ��� ?\n\n??�??"..msg.sender_user_id_.."\n"  end

if MsgText[1]== "���� ������ ??" and msg.type == "pv" then
local inline = {{{text="??���� ������� ����� ��� ",url="t.me/MasSource"}}}
send_key(msg.sender_user_id_,'  [??���� ���� : ����](t.me/MasSource)',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "���������� ??" or MsgText[1]=="����������") then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
return '???���������� ??�? \n\n??*?*��� ��������� ������� : '..redis:scard(max..'group:ids')..'\n????�?*?*��� ��������� �� ����� : '..redis:scard(max..'users')..'\n??'
end
---------------[End Function data] -----------------------
if MsgText[1]=="��� �� ���" or MsgText[1]=="��� �� ��� ?" then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
redis:setex(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "???����� ���� ���� ���� ���� ����� ??\n"
end

if MsgText[1]== '���' and MsgText[2]== '������' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
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
return "? �� ��� �� ������ ??"
else
return '??*?* �� ���� ���� ���� ����� \n??'
end
end

if MsgText[1]== '���' and MsgText[2]== '������ ������' then
if not msg.SudoBase then return"?? �������� ��� ! ??" end
local names 	= redis:exists(max..'replay:all')
local photo 	= redis:exists(max..'replay_photo:group:')
local voice 	= redis:exists(max..'replay_voice:group:')
local imation 	= redis:exists(max..'replay_animation:group:')
local audio 	= redis:exists(max..'replay_audio:group:')
local sticker 	= redis:exists(max..'replay_sticker:group:')
local video 	= redis:exists(max..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(max..'replay:all',max..'replay_photo:group:',max..'replay_voice:group:',max..'replay_animation:group:',max..'replay_audio:group:',max..'replay_sticker:group:',max..'replay_video:group:')
return "? �� ��� �� ������ ������??"
else
return "�� ���� ���� ���� ���� ����� ! ??"
end
end

if MsgText[1]== '���' and MsgText[2]== '�� ���' then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
redis:set(max..'delrdall:'..msg.sender_user_id_,true) 
return "???����� �����  ???\n???���� ���� ���� ������ ��  ��������� ??"
end

if MsgText[1]== '���' and MsgText[2]== '��' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
redis:set(max..'delrd:'..msg.sender_user_id_,true)
return "???����� �����  ???\n???���� ���� ���� ������ ��  �������� ??"
end

if MsgText[1]== '������' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
local names  	= redis:hkeys(max..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(max..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(max..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(max..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(max..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(max..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(max..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '??*?*�� ���� ���� ����� ����� \n??' 
end
local ii = 1
local message = '??*?*���� ����� �� ��������  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( ���� ?? ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( �� ?? ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( ���� ?? ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( ������ ?? ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( ����� ?? ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ���� ?? ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( �����  ?? ) \n' ii = ii + 1 end
return message..'\n???'
end

if MsgText[1]== '������ ������' or MsgText[1]=='������ ������ ??' then
if not msg.SudoBase then return "?? ������ ��� ! ??" end
local names 	= redis:hkeys(max..'replay:all')
local photo 	= redis:hkeys(max..'replay_photo:group:')
local voice 	= redis:hkeys(max..'replay_voice:group:')
local imation 	= redis:hkeys(max..'replay_animation:group:')
local audio 	= redis:hkeys(max..'replay_audio:group:')
local sticker 	= redis:hkeys(max..'replay_sticker:group:')
local video 	= redis:hkeys(max..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '??*?*�� ���� ���� ����� ����� \n??' 
end
local ii = 1
local message = '??*?*������ ������ �� ����� :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( ���� ?? ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( �� ?? ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( ���� ?? ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( ������ ?? ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( ����� ?? ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ���� ?? ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( �����  ?? ) \n'ii = ii + 1 end
return message..'\n???'
end


if MsgText[1]=="��� ��" and msg.GroupActive then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
redis:setex(max..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(max..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "???����� , ���� ���� ���� ���� \n-"
end

if MsgText[1] == "�� ��� �����" or MsgText[1]== '�� ��� ����� �' then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
redis:setex(max..'namebot:witting'..msg.sender_user_id_,300,true)
return"???����� �����  ???\n???���� ���� �����  ����� ??"
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '?? ? Seystem ?\n*�� '"$linux_version"'*' 
echo '*------------------------------\n*?? ? Memory ?\n*�� '"$memUsedPrc"'*'
echo '*------------------------------\n*?? ? HardDisk ?\n*�� '"$HardDisk"'*'
echo '*------------------------------\n*?? ? Processor ?\n*�� '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*????�?? ? Server[_]Login ?\n*�� '`whoami`'*'
echo '*------------------------------\n*?? ? Uptime ?  \n*�� '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == '�������' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '??l ? ���� ������� ?\n*�� '"$linux_version"'*' 
echo '*------------------------------\n*??l ? ������� ��������� ?\n*�� '"$memUsedPrc"'*'
echo '*------------------------------\n*??l ? ����� ����������� ?\n*�� '"$HardDisk"'*'
echo '*------------------------------\n*??l ? �������������� ?\n*�� '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*????�??l ? ���������� ?\n*�� '`whoami`'*'
echo '*------------------------------\n*??l ? ���� ������� ����������� ?  \n*�� '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "�������" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
return [[
??���� ������� ������� ?

??�1 � ����� �������
??�2 � ����� ������� ��������
??�3 � ����� �������
??�4 � ����� ������ 
??�5 � ����� ������
??�6 � ����� �������
??� ������ �  ����� ������
??������� � ������ ��������� 
??��������� � ������ ��������
??���� � ���� �����
??������ � ���� ����� 

 ���???������� ����������� ? { ]]..SUDO_USER..[[ } ? ]]
end
if MsgText[1]== '�1' then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local text =[[
1-?����� ����� �������� ������ �������?

?� ��� ����+����� ���� 
?� ��� ������+����� ������
?� ��� ����+����� ���� 
?� ��� ����+����� ���� 
?� ����� ����:(����� �������� �������� ��������� ���� ����)
���������������������������������������������������������
2- ? ����� ��� ���������  ? 

?� ��� ���������=���� ������� 
?� ��� �������� =���� �������� 
?� ��� �������� =���� �������� 
?� ��� ������� = ���� ������� 
���������������������������������������������������������
3- ? ������ ������ �������� �������� ?
      
?� ��� ?�����+�������? ���� �����
?� ����� ����� ?�����+�������? 
?� ��� ? �����+������� ? ���� �����
?� ��� ? �����+������� ? ���� �����
?� ����� ����� ?�����+�������?
?� �����?�����+�������?������ �����
?� �� ������� ?�����+�������?
?� ���+������=���� ���� ���������
?� ����� ��� = ������ ��� ������ 
���������������������������������������������������������

??*?* ������ ��������� ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== '�2' then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local text = [[
1- ? ����� ����� �������� ?
  
??�� ������� ? ���� �����  
??�� �������� ? ���� �������� 
??�� ��� ? ���� ���  
??�� ���� ? ���� ������  
??�������� ? ���� ������  
���������������������������������������������������������
2- ? ����� ���� ��������� ?

??���������: ���� ��������� 
??��������: ����  �������� 
??�������: ����  ��������� 
??���������: ����  ��������� 
??�������: ���� �� ���������  
??�������: ���� ������� ������� 
??��������: ����  �������� 
??���������: ���� ������� �������� 
??��������: ���� ������� ��������
���������������������������������������������������������

??*?* ������ ��������� ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== '�3' then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local text = [[
????????
�??����� ������ ��������?
????�????     
???��� �� ��� ?�������?
??�??��� �� ��� ?������?
???��� �� ��� ?�����������?
???��� �� ��� ?�������������?
???��� �� ��� ?��������?
???��� �� ��� ?��������?
???��� �� ��� ?���������?
???��� �� ��� ?����������?
???��� �� ��� ?������������?
???��� �� ��� ?������������?
???��� �� ��� ?�����������?
???��� �� ��� ?����������?
???��� �� ��� ?�����������?
???��� �� ��� ?���������������?
???��� �� ��� ?�������������?
???��� �� ��� ?�������������?
???��� �� ��� ?�����������?
???��� �� ��� ?������ �������?
??�??��� �� ��� ?������� ������?
????�????     
�??����� ���������?
????�????                                                                                        
???��� �� ��� ?������������� ���������?
???��� �� ��� ?����������� ���������?
???��� �� ��� ?�������� ���������?
???��� �� ��� ?������������ ��������?
???��� �� ��� ?��������� ����������? 
????�????
??*?* ������ ��������� ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== '�4' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
local text = [[
??����� ������  ?

??���� ? ���� ����� + �������� 
??����� ? ���� ����� 
??���� ����� ? ���� ���� ����� 
??����� ? ������ ��� ����� 
??������ ? ������ ���� ��������
??�������� ? ���� �������� 
??������� ? ���� ����� ����� 
??����� ? ������ ��� �����
??��� ����� + ����� ? ���� ����� 
??������ ? ���� ���� ����� 
??������ ����� ? ������ ���� �����
??�������+������ ?����� ����� 
??��� ����� ? ������� �����
??��� ������� ? ������� ����� 
??��� ������� ? ���� �� �������
??��� ��������� ? ���� ���������
??��� ������� ? ��� ������� 
??���� ����� ? ���� �����
���������������������������������������������������������

??*?* ������ ��������� ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== '�5' then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local text =[[
?? ����� ������ 

???������ ? ���� ������ �������
???��� �� ? ������ �� ����
???��� ��  ? ���� ������ ����
???��� ������ ? ���� �� ������
???������ ������ ? ����� ������ ������� ��� 
???��� �� ��� ? ������ �� ��� ���������
???��� �� ��� ? ���� ���� ����� 
???��� ������ ������ ? ���� �� ���� ������
���������������������������������������������������������
? ������� � ������� ?

???����� �� �����  ? ������� ?
???����� �� �����  ? ������ ?
???����� �� �����  ?��������?
???����� �� �����  ? ������� ?
???����� �� �����  ? ������� ?
???����� �� �����  ? ������ ?
???����� �� �����  ? ������ ������� ?
���������������������������������������������������������

??*?* ������ ��������� ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== '�6' then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
local text = [[
???? ����� �������?
????�??����� ����� �
???����� ����� ������� �� ������
????�????
???��� �� ����� ? �� ?
???��� �� ����� ? ���� ?
???��� �� ����� ? ��� ?
???��� �� ����� ? ��� ?
???��� �� ����� ? ���� ?
???��� �� ����� ? ��� ?
???��� �� ����� ? ��� ?
???��� �� ����� ? ����� ?
??�???��� �� ����� ? ����� ?
???��� �� ����� ? ���� ?
???��� �� ����� ? ���� ?
???��� �� ����� ? ���� ?
???��� �� ����� ? ����� ?
???��� �� ����� ? ���� ?
???��� �� ? ����� ? ����� �� ? �� ����?
???? ���� ? �� ? ���� ?
????�????

??*?* ������ ��������� ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "� ������" then
if not msg.SudoBase then return "???������ ������� ���  ??" end
local text = [[
????�???����� ������ � � ���� ... ?

??����� ? ������ ����� 
??����� ? ������ ����� 
??��� ���� + ���� ? ���� �����
??��� �������� ? ���� ��������
���������������������������������������������������������
??����� ? ���� ��������
??����� ��� ? ���� ����� �����
??����� ��� ? ���� ����� ���� 
??����� ��� �������� ?���� ��������
??����� ��������� ? ���� ��������� �������  
??����� ��������� ? ���� ��������� �������� 
??����� ? ������ ����� �����
??����� ������ ?����� ������ 
���������������������������������������������������������

??*?* ������ ��������� ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== '����� ����' then
if not msg.Director then return "??*?*��� ����� ��� {������,������,������} ���  \n??" end
local text = [[
????????     
??�????���� ����� ������ ?
????�????
???������ �� ���� ������ �������
???��� �� �� ������ �� ����
???��� �� �� ���� ������ ����
???��� ������ �� ���� �� ������
???������ ������ �� ����� ������ ������� ��� 
???��� �� ��� �� ������ �� ��� ���������
???��� �� ���  �� ���� ���� ����� 
???��� ������ ������ �� ���� �� ���� ������
????�????
??*?* ������ ��������� ??? ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "�����" and MsgText[2] == "������"  then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
if not redis:get(max..'lave_me'..msg.chat_id_) then 
return "????�?*?*���� ����� "..msg.TheRankCmd.."\n??*?* �������� �������� �� �������\n?" 
else 
redis:del(max..'lave_me'..msg.chat_id_) 
return "????�?*?*���� ����� "..msg.TheRankCmd.."\n??*?* �� ����� �������� \n?" 
end 
end
if MsgText[1] == "�����" and MsgText[2] == "������" then
if not msg.Admin then return "??*?*��� ����� ��� {������,������,������,������} ���  \n??" end
if redis:get(max..'lave_me'..msg.chat_id_) then 
return "????�?*?*���� ����� "..msg.TheRankCmd.."\n??*?* �������� �� ��� ����� �������� �����\n?" 
else
redis:set(max..'lave_me'..msg.chat_id_,true)  
return "????�?*?*���� ����� "..msg.TheRankCmd.."\n??*?* �� ����� �������� �� ��� �����\n?" 
end   
end

if MsgText[1] == "������" or MsgText[1] == "������" then
if not redis:get(max..'lave_me'..msg.chat_id_) then
if msg.Admin then return "??*?*�� ������ ��� ������� ��������� ���������  \n??" end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"????�??| ���� ����� , ��� �� ���� �� �������� ���� ��� \n??| ��� ��� ��� ������ �� ���� ������ �������� \n\n???���� ���� �������� ??\n???"..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(max..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"??| ��� �� ���� ����� , ����� �� ���� �������� �� ����� ��� ���� �� ������ ������ ��� ��� ")
else
sendMsg(msg.chat_id_,msg.id_,"??| �� ������ ���� ���� ���� �� ��������  ")
end
end)
return false
end
end

end 

if MsgText[1] == "����" or MsgText[1]=="������" then
return [[
?
���������������������������������������������������������

?????�??? | ���� ������ : @MASx92

?? | ������ ������ ������� : @MasSource

���������������������������������������������������������


]]
end


if MsgText[1] == "�������" then
return "?\n??| ���������� : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "������" then
return '??*?*��� ������ ? ? '..(redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ? \n??'
end

if MsgText[1] == '���' and MsgText[2] == '������'  then
local rfih = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "??*?*���� �� ���� ������ �� �� �����  ??" end
redis:del(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "??*?*�� ��� {* "..rfih.." *} �� ������� ??\n?"
end

if MsgText[1] == "����� �������� ��������" or MsgText[1] == "����� �������� �������� ?" then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
if redis:get(max..":UserNameChaneel") then
return "???���� ����� ������ \n???�������� �������� ����"
else
redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
return "???����� ��� �� ���� �������� ��������\n???���� ���� ���� ��������"
end
end

if MsgText[1] == "����� �������� ��������" or MsgText[1] == "����� �������� �������� ??" then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
local SubDel = redis:del(max..":UserNameChaneel")
if SubDel == 1 then
return "???�� ����� �������� �������� . \n?"
else
return "???�������� �������� ������ ���� . \n?"
end
end

if MsgText[1] == "�������� ��������" or MsgText[1] == "�������� �������� ??" then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
local UserChaneel = redis:get(max..":UserNameChaneel")
if UserChaneel then
return "???���� ����� ������ \n???�������� �������� ������ : ["..UserChaneel.."]\n?"
else
return "???�� ���� ���� ����� � �������� ��������. \n?"
end
end

if MsgText[1] == "����� �������� ��������" or MsgText[1] == "����� �������� �������� ??" then
if not msg.SudoBase then return"??*?*��� ����� ��� {������ �������} ���  \n??" end
redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
return "???����� ��� �� ���� �������� ��������\n???���� ���� ���� ��������"
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
sendMsg(msg.chat_id_,msg.id_,'????�??���� ����� \n???�� ����� ����� ������\n?')
redis:del(max..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end

if Black:match('���� ��� (.*)') then
if not msg.Kara then return "??*?*��� ����� ��� {������ �������,������,������ �������} ���  \n??" end
local cmd = Black:match('���� ��� (.*)') 
redis:setex(max..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'????�??���� �� �����\n???����� ��� ���� ����� ���  >'..cmd..'< \n???����� ����\n? ')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^��� ��� (.*)')) then
if not msg.Kara then return "??*?*��� ����� ��� {������ �������,������,������ �������} ���  \n??" end
local cmd = Black:match('^delcmd (.*)') or Black:match('^��� ��� (.*)')
redis:hdel(max..'CmD:'..msg.chat_id_,cmd)
redis:srem(max..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"????�??���� �����\n����� >"..cmd.."\n??? �� ���� �� ����� �������\n?")
end
if Black == '��� ����� �������' or Black == '��� ����� �������' then
if not msg.Kara then return "??*?*��� ����� ��� {������ �������,������,������ �������} ���  \n??" end
redis:del(max..'CmD:'..msg.chat_id_)
redis:del(max..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"??| ���� ����� �� ��� ����� �������")
end
if Black == "����� �������" then
if not msg.Kara then return "??*?*��� ����� ��� {������ �������,������,������ �������} ���  \n??" end
local CmDlist = redis:smembers(max..'CmDlist:'..msg.chat_id_)
local t = '??| ����� ������� : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(max..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '?| ����� �� ��� � ����� ��� !'
end
sendMsg(msg.chat_id_,msg.id_,t)
end

if Text == 'time' or Text == '�����' and KaraJoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}'	
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^����� ����$') and tonumber(msg.reply_to_message_id_) > 0 then
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
sendMsg(msg.chat_id_,msg.id_,'????�??����� ��������????�?? \n???����� ��� ������\n?')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

if Text == 'tophoto' or Text == '����' and tonumber(msg.reply_to_message_id_) > 0 then
function tophoto(kara,max)   
if max.content_.ID == "MessageSticker" then        
local bd = max.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'????�??����� ��������????�?? \n???����� ��� ������\n?')
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
return sendMsg(msg.chat_id_,0,'*???* �� ���� �� ����� ���� ������� \n??') 
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then

if msg.SudoBase then
local text = '????�??���� ����� ?\n???��� �������� ��������� ��� ??\n���������������������������������������������������������\n\n???�������ڝ� ������ ��� �������� ������������ ��������� ����� ������\n???��� ����� � ������ ���� ���� ������'
local keyboard = {
{"�� ��� ����� �","�� ���� ������� ??"},
 {"����� ������� ??","����� ������� ??"},
{"����� ����� ����","����� ����� ����","�������� ??"},
 {"��������� ?","��������� ??","���������� ??"},
 {"��� �� ��� ?","������ ������ ??"},
 {"����� ??","����� ��� ??"},
{"����� ��� ??","����� ��� �������� ??"},
 {"����� ??","����� ����� ??","�����??"},
{"����� �������� �������� ??","����� �������� �������� ?"},
{"����� �������� �������� ??","�������� �������� ??"},
{"����� ��������� ??","����� ��������� ??"},
 {"���� �������� ���������"},
 {"���� ������ ??"},
 {"����� ������ ??"},
 {"����� ����� ??"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(max..'users',msg.sender_user_id_)
if redis:get(max..'lock_service') then 
text = [[ 
���������������������������������������������������������

??������� ��� ��� �����   []]..redis:get(max..':NameBot:')..[[] ??

��������������������������������������������������������
������� :


�������� ��� ����� ��������� �������� �� ������ �������� �������� ���..� ��
���������������������������������������������������������
������ ����� ���� �� ��� :

1- ��� ����� ��� �������� ������ ��.
2- ���� ����� ���� �� ��������.
3- ����� ��� �������� ������� ����� ��� ����.
4- ���� ����� �� �������� ����� ����� ����� �����.
���������������������������������������������������������
????�??? ���� ��������� : ]]..SUDO_USER..[[
]]
else
text = [[ 
���������������������������������������������������������

??������� ��� ��� �����   []]..redis:get(max..':NameBot:')..[[] ??

��������������������������������������������������������
������� :


�������� ��� ����� ��������� �������� �� ������ �������� �������� ���..� ��
���������������������������������������������������������
������ ����� ���� �� ��� :

1- ��� ����� ��� �������� ������ ��.
2- ���� ����� ���� �� ��������.
3- ����� ��� �������� ������� ����� ��� ����.
4- ���� ����� �� �������� ����� ����� ����� �����.
���������������������������������������������������������
????�??? ���� ��������� : ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="������ ������� ?",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "��� ���� ����������" then
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

SendMention(msg.sender_user_id_,data.id_,msg.id_,"???�� ������ ����������� ??\n???��� : "..USERNAME.." ????",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(max..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"???���� �� ��ܐ� ������ { �������� , ������ , ���� ���} ??")
return false
end
redis:setex(max.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"???�� ������ �����ʐ ��� ��������\n???����� ��� �� ���� ���\n??�???���� ������ "..SUDO_USER)
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
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ? �� ����� ���� ?? \n-')
elseif msg.photo then 
redis:hset(max..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ���� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ������ ������ ')
elseif msg.voice then
redis:hset(max..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ���� ��� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ����� ������ ������ ')
elseif msg.animation then
redis:hset(max..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ������ ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ������ ������ ')
elseif msg.video then
redis:hset(max..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ����� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ������� ����� ')
elseif msg.audio then
redis:hset(max..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ����� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ����� ����� ')
elseif msg.sticker then
redis:hset(max..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ���� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ������ ����� ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(max..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ? �� ����� ���� ��� ��������� ?? ')
elseif msg.photo then 
redis:hset(max..'replay_photo:group:',klma,photo_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ���� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ������ ������ ')
elseif msg.voice then
redis:hset(max..'replay_voice:group:',klma,voice_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ���� ��� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ����� ������ ������ ')
elseif msg.animation then
redis:hset(max..'replay_animation:group:',klma,animation_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ������ ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ������ ������ ')
elseif msg.video then
redis:hset(max..'replay_video:group:',klma,video_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ����� ���� ����� ?\n???����� ����� ? ['..klma..'] ?������ ������� ����� ')
elseif msg.audio then
redis:hset(max..'replay_audio:group:',klma,audio_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ����� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ����� ����� ')
elseif msg.sticker then
redis:hset(max..'replay_sticker:group:',klma,sticker_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'???�� ����� ���� ���� ����� ?\n???����� ����� ? ['..klma..'] ? ������ ������ ����� ')
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
sendMsg(msg.chat_id_,msg.id_,"???���� , ���� ��� ���� \n???������ ���� ������ ��� ���� ����.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"???���� , ��� ���� ���� \n???��� ��� ����� ���� �� ����� ������ �� ����� �������� �������� .")
return false
end
else
redis:set(max..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"???����� , ���� ��� �� ����� �������� ��������\n???��� ����� ? ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"???���� , ����� ������ \n???��� ��� ���� ���� , ���� ����� .")
return false
end
end

if redis:get(max..'namebot:witting'..msg.sender_user_id_) then --- ������� ��� ����� 
redis:del(max..'namebot:witting'..msg.sender_user_id_)
redis:set(max..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"???�� ���� ��� �����  ???\n???���� ���� "..Flter_Markdown(msg.text).." \n?")
return false
end

if redis:get(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- ������� ���� ��� ���������
if not redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- ������� ���� ���� ��� ���������
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
redis:setex(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"???��� , ����� ���� ����� ��� � ��������� \n???[[ ��,����,�����,������,����,����� ]]\n?")
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
return sendMsg(msg.chat_id_,msg.id_,'??*?*��� ���� ��� ���� �� ����� ������ ??')
else
redis:hdel(max..'replay:all',msg.text)
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n  ? �� ��� ���� ?? ')
end 
end 


if redis:get(max..'text_sudo:witting'..msg.sender_user_id_) then -- ������� ����� ������
redis:del(max..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(max..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "??*?* �� ��� ������� ����� ����� ????\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n?")
end
if redis:get(max..'welcom:witting'..msg.sender_user_id_) then -- ������� ����� �������
redis:del(max..'welcom:witting'..msg.sender_user_id_) 
redis:set(max..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"??*?* �� ��� ������� ����� ����� ??\n?" )
end
if redis:get(max..'rulse:witting'..msg.sender_user_id_) then --- ������� ��������
redis:del(max..'rulse:witting'..msg.sender_user_id_) 
redis:set(max..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'??*?* ����� �����\n???�� ��� �������� ����� ?\n???���� [[ �������� ]] ������ \n???')
end
if redis:get(max..'name:witting'..msg.sender_user_id_) then --- ������� �����
redis:del(max..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(max..'linkGroup'..msg.sender_user_id_,link) then --- ������� ������
redis:del(max..'linkGroup'..msg.sender_user_id_,link) 
redis:set(max..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'???�� ��� ������ ������ ����� .. ??')
end
if redis:get(max..'about:witting'..msg.sender_user_id_) then --- ������� �����
redis:del(max..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"??*?* �� ��� ����� �����\n?")
end 
end,nil)
end


if redis:get(max..'fwd:all'..msg.sender_user_id_) then ---- ������� ����� ������� ���
redis:del(max..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')  
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'???���� ����� ������ \n???���� ��� ������� ��������� ���������� ...')			
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
return sendMsg(msg.chat_id_,msg.id_,'??*?*�� ����� ������� ����� ????\n??*?*����������� � ? *'..#groups..'* ? ���� \n??*?* �������ѐ�� � ? '..#pv..' ? �����ѐ \n?')
end

if redis:get(max..'fwd:pv'..msg.sender_user_id_) then ---- ������� ����� ������� ���
redis:del(max..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'???���� ����� ������ \n???���� ��� ������� ��������� ...')			
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
sendMsg(msg.chat_id_,msg.id_,'????�?*?*��� ��������� : ? '..#pv..' ?\n??*?*�� ������� ��� ? '..SenderOk..'  ? ����� \n ?') 
end
end)
end
end

if redis:get(max..'fwd:groups'..msg.sender_user_id_) then ---- ������� ����� ������� ���
redis:del(max..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(max..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'???���� ����� ������ \n???���� ��� ������� ��������� ...')			
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
MsgTDel = '??*?*�� ��� ? *'..NumGroupsDel..'* ? �� ����� ������� ����� ���� ���� ����� �� ��������'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'??*?*��� ��������� ? *'..#groups..'* ?\n??*?*��� ������� ��� ? *'..AllGroupSend..'* ?\n'..MsgTDel..'?')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(max..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(max..':WELCOME_BOT'),[[??���� ��� ��� ������ ]]..redis:get(max..':NameBot:')..[[ ?
????�???��������� ������ �����������
???��� ������� ����������� �������� ����...

???������ ���������  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ ??
]])
return false
end 

if msg.forward_info and redis:get(max..'fwd:'..msg.sender_user_id_) then
redis:del(max..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'???���� ����� ������ \n???���� ��� ������� ��������� ���������� ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'??*?*�� ����� ������� ����� ????\n??*?*����������� � ? *'..#groups..'* ?\n??*?*����� � ? '..#pv..' ?\n?')			
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." ����$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'???���� ���� �� ���� ����� ????�?')
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
return sendMsg(msg.chat_id_,msg.id_,'?? � �� ����� �������� ������� ����� ??\n?')
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
sendMsg(arg.chat_id_,arg.id_,'?? � ��� ��� ������ ����� ������ \n?? � ��� ������ ������ `����� ������� �������� ` ?\n?')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(max..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- ������� ���� �������� ���

if not redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- ���� ����
redis:hdel(max..'replay:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(max..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"???��� , ����� ���� ����� ���� ���� \n???[[ ��,����,�����,������,����,����� ]]\n?")
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
return sendMsg(msg.chat_id_,msg.id_,'??*?*��� ���� ��� ���� �� ����� ������ ??')
else
redis:hdel(max..'replay:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n  ? �� ��� ���� ?? ')
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
return sendMsg(msg.chat_id_,msg.id_,"??*?* ���� ������� ���� �� ��� ������� �� ����� ������� ������\n")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"??*?* ���� ������� ���� �� ��� ������� �� ����� �������\n?")      
end
end,nil)
end
return false
end
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "��� ��������" end
return sendMsg(msg.chat_id_,msg.id_," ��� ["..UserName.."] ����� ���� �������� ?\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(max..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "��� ��������" end

return sendMsg(msg.chat_id_,msg.id_,"??| ���  ["..UserName.."]\n???����� ��� ��������  ?\n???��� "..Flter_Markdown(msg.content_.title_).." \n?") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(max..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(max..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "????�??���� �� ����� {�����}\n???����� � {������}\n{��������}\n\n������ �������� ��������� ?\n���������������������������������������������������������\n??��� ������ � {��������}")
if welcome then
rules = (redis:get(max..'rulse:msg'..msg.chat_id_) or "��������������������������������������������������������\n�������� :\n���������������������������������������������������������\n? | ������ ����� ������� ��������.\n? | �������� ����� ������� ������.\n? | ���� ��� ������� ������� ��� ������.\n? | ���� ������ ���������� ������� �� �������.\n? | ���� ��� �������� ������� ��� ��� ��������.\n? | ���� ��� ��������� ��� ������� ��� ��� ��������.\n? | ���� ���� �� ������ ������ ����� �� ����� ������.\n��������������������������������������������������������")
welcome = welcome:gsub("{��������}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< �� ���� ���� >' end
welcome = welcome:gsub("{��������}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{������}",UserName)
local welcome = welcome:gsub("{�����}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "????�??���� �� ����� {�����}\n???����� � {������}\n{��������}\n\n������ �������� ��������� ?\n���������������������������������������������������������\n??��� ������ � {��������}")
if welcome then
rules = (redis:get(max..'rulse:msg'..msg.chat_id_) or "????�???����� ����� �������� ����� ????\n???����� ��� �������\n???����� ������ �� ��� ��� ������\n??�����  ����� �����\n???����� ������ �������\n???������ ������ ������� ��������� ??\n")
welcome = welcome:gsub("{��������}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< �� ���� ���� >' end
welcome = welcome:gsub("{��������}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{������}",UserName)
local welcome = welcome:gsub("{�����}",FlterName(msg.addname,20))
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

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- ������� ���   

if not msg.forward_info and redis:get(max..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(max..'num_msg_max'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(max..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"????�??����� � "..USERNAME.."\n???���� �ʐ��� �� ��� "..NUM_MSG_MAX.." ��������� , ��� �� ����ϐ ��� ������������� ?\n",12,USERCAR) 
return false
end)
end 
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ����� ����� ��������
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'???�������� ���� ������\n??')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'???���� ��� ���\n??')   
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
return sendMsg(chat,msg.id_,'???������ : ���� ??\n???���������� �� ? \n���������������������������������������������������������\n???���� ������� �������� ? ? '..info..' ?\n???��� ������� ? ? '..delete..' ?\n???��� ���������� ? ? '..restrict..' ?\n??���� �������� ? ? '..invite..' ?\n???����� ������� ? ? '..pin..' ?\n???����� ������ ��� ? ? '..promote..' ?\n\n???������ � ����� ?  ? ? ���� ���� �������� ������ ? ? ? ���� ��� ����� ��������')   
end
end
end

if msg.forward_info_ then
if redis:get(max..'mute_forward'..msg.chat_id_) then -- ��� �������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) and not redis:get(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� �������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(max..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(max..'mute_inline'..msg.chat_id_) then -- ��� ��������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� �������� �����  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- ����� ���
if utf8.len(msg.text) > 500 and redis:get(max..'lock_spam'..msg.chat_id_) then -- ��� ������� 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???����� ����� ������� ���� ��� ������ ��� ����  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
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
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
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
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???����� ����� �������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???����� ����� ����� �����   \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(max..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???����� ����� �����  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(max..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???����� ����� ������   \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(max..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???����� ����� ����������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "??? .����� ����� ����� �����   \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(max..'lock_edit'..msg.chat_id_) then -- ��� �������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???����� ����� ������� �� ����� \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(max..'mute_video'..msg.chat_id_) then -- ��� �������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� ������� ��� \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(max..'mute_photo'..msg.chat_id_)  then -- ��� �����
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� �����  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(max..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(max..'mute_video'..msg.chat_id_) then -- ��� �������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� �������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(max..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(max..'mute_document'..msg.chat_id_) then -- ��� �������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� �������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(max..'mute_sticker'..msg.chat_id_) then --��� ��������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� ��������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(max..'mute_gif'..msg.chat_id_) then -- ��� ��������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� ����� ��������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(max..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(max..'mute_contact'..msg.chat_id_) then -- ��� ������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� ���� �������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(max..'mute_location'..msg.chat_id_) then -- ��� ������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� ������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(max..'mute_voice'..msg.chat_id_) then -- ��� �������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� �������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(max..'mute_game'..msg.chat_id_) then -- ��� �������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "??���� ����� ��� �������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(max..'mute_audio'..msg.chat_id_) then -- ��� �����
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� �����  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(max..'mute_keyboard'..msg.chat_id_) then -- ������
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� �������� �����  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- ������� ��� ��������
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
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� �������  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
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
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "???���� ����� ����� ����� �����  \n??"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(max..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*?* �� ������ ��� ������� �������� .\n??*?* ��� ���� �� ��� ��� ������  ����� \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
local msgx = "???���� ����� ����� ����� �� ������  \n??"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"????�??����� � "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
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
"�������",
"����",
}
local amr = {
"������????",
"������????",
"�������????",
"�����",
}
local nmf = {
"��� ��� ����߿",
"��� �������",
"��� ����� �����",
"��� ������ �����",
}
local nor = {
" ����",
"����߿",
"����� ����",
"����??-�",
}
local smx = {
"���� �����",
"������ ���/�",
"������ ���� ����",
}
local msx = {
"���� �����",
"����� ���/�",
"������ ���� ����",
}
local nm = {
"���� ������ ���??",
"�����",
"���",
"�������",
"��� ������ ",
}
local wk1 = {
"����/�",
"�� ���� �",
"�����",
"�����",
"�� ����",
"�����",
}
local wk = {
"������",
"�� ���� ",
"������",
"�����",
"�� ����",
"�����",
}
local su = {
 "�����",
"����� �����",
"���� ["..Bot_Name.."] ",
"���� �����"}
local ss97 = {
"���� �����","���",
"��� ����","����","���",
"�����",
"���� ["..Bot_Name.."] ",
"����� ���� �� ", 
"��� ["..Bot_Name.."] ",
}
local ns = {
"���� ["..Bot_Name.."] �����",
"����� � ["..Bot_Name.."] ����",
"����� ���� ["..Bot_Name.."] ����� ���� ",
"��� ����� ���� ",
"���� ["..Bot_Name.."] ",
"��� ����� ",
 "����� ������� ��� ",
}
local na = {
"�����",
"���� ����� ������",
"�� �����",
"�� ��� �����",
}
local nb = {
"������",
"���",
"�����",
"��",
"��������",
}
local nf = {
"�� ����",
"��� ������",
"��� ����",
 "����",
}
local nl = {
"���� ����",
"���� ����",
"�� �� ����",
}
local np = {
"����� �����",
"�����",
"��� �� ���",
}
local sh = {
"��� ���� �����",
"�����",
"������",
"���� ��� �����",
}
local lovm = {
"�����",
"������",
"�����",
"���� ��",
"������",
"�� ��� �� �����",
"���� ����",
}
local bay = {
"�����",
"�������",
"����� �� �����",
"����",
"���",
"��",
"�����",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^��� (.*)$") then
if utf8.len(Text:match("^��� (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"??| �� ���� ���� ���� �� 500 ��� ????")
end
local callback_Text = FlterName(Text:match("^��� (.*)$"),50)
if callback_Text and callback_Text == '����� ���� ??' then
return sendMsg(msg.chat_id_,msg.id_,"??| ����� ���� ��� ����� ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif Text:match("^"..Bot_Name.." ���� (.*)$") then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'��� ���� ????')
sendMsg(msg.chat_id_,msg.reply_id,'�� ��� ���� ���� �������������?????? ��� ���� ??')
else 
return sendMsg(msg.chat_id_,msg.id_,"  ???? ���� ��� ����� �� ??")
end
elseif msg.SudoUser and Text=="����" then 
return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
elseif Text=="���" then 
return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
elseif Text=="���" then 
return sendMsg(msg.chat_id_,msg.id_,na[math.random(#na)])
elseif Text=="��" then 
return sendMsg(msg.chat_id_,msg.id_,nb[math.random(#nb)])
elseif Text=="�����" then 
return sendMsg(msg.chat_id_,msg.id_,nf[math.random(#nf)])
elseif Text=="���" then 
return sendMsg(msg.chat_id_,msg.id_,nl[math.random(#nl)])
elseif Text=="���" then 
return sendMsg(msg.chat_id_,msg.id_,np[math.random(#np)])
elseif Text=="���" then 
return sendMsg(msg.chat_id_,msg.id_,bay[math.random(#bay)])
elseif Text=="�����" then 
return sendMsg(msg.chat_id_,msg.id_,wk[math.random(#wk)])
elseif Text=="�����" then 
return sendMsg(msg.chat_id_,msg.id_,wk[math.random(#wk)])
elseif Text=="���߿" then 
return sendMsg(msg.chat_id_,msg.id_,wk1[math.random(#wk1)])
elseif Text=="����" then 
return sendMsg(msg.chat_id_,msg.id_,wk1[math.random(#wk1)])
elseif Text=="������" then 
return sendMsg(msg.chat_id_,msg.id_,nm[math.random(#nm)])
elseif Text=="������" then 
return sendMsg(msg.chat_id_,msg.id_,nm[math.random(#nm)])
elseif Text=="����" then 
return sendMsg(msg.chat_id_,msg.id_,nm[math.random(#nm)])
elseif Text=="����" then 
return sendMsg(msg.chat_id_,msg.id_,nm[math.random(#nm)])
elseif Text=="���� �����" then 
return sendMsg(msg.chat_id_,msg.id_,msx[math.random(#msx)])
elseif Text=="���� �����" then 
return sendMsg(msg.chat_id_,msg.id_,smx[math.random(#smx)])
elseif Text=="����" then 
return sendMsg(msg.chat_id_,msg.id_,nor[math.random(#nor)])
elseif Text=="�����" then 
return sendMsg(msg.chat_id_,msg.id_,nor[math.random(#nor)])
elseif Text=="����" then 
return sendMsg(msg.chat_id_,msg.id_,nmf[math.random(#nmf)])
elseif Text=="�������" then 
return sendMsg(msg.chat_id_,msg.id_,amr[math.random(#amr)])
elseif Text=="������" then 
return sendMsg(msg.chat_id_,msg.id_,amr[math.random(#amr)])
elseif Text=="������" then 
return sendMsg(msg.chat_id_,msg.id_,amr[math.random(#amr)])
elseif Text=="�����" then 
return sendMsg(msg.chat_id_,msg.id_,amr[math.random(#amr)])
elseif Text=="�����" then 
return sendMsg(msg.chat_id_,msg.id_,mrr[math.random(#mrr)])
elseif msg.SudoUser and Text== "�����" or Text=="���" then 
return sendMsg(msg.chat_id_,msg.id_,"������ ")
elseif not msg.SudoUser and Text== "����" or Text=="���" then 
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif not msg.SudoUser and Text== "�����" then
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif Text== "��" then return sendMsg(msg.chat_id_,msg.id_,"�� ? ���� ������.")
elseif Text== "�������" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ���/�")
elseif Text== "������" then return sendMsg(msg.chat_id_,msg.id_,"���� ����� ���/�")
elseif Text== "������" then return sendMsg(msg.chat_id_,msg.id_,"���� ����� ���/�")
elseif Text== "�����" then return sendMsg(msg.chat_id_,msg.id_,"���� ���� ���/�")
elseif Text== "�����" then return sendMsg(msg.chat_id_,msg.id_,"���� ���� ���/�")
elseif Text== "�����" then return sendMsg(msg.chat_id_,msg.id_,"���� ����� ���/�")
elseif Text== "����߿" then return sendMsg(msg.chat_id_,msg.id_,"���� ����� ���/�")
elseif Text== "����" then return sendMsg(msg.chat_id_,msg.id_,"���� ���� ���/�")
elseif Text== "���߿" then return sendMsg(msg.chat_id_,msg.id_,"���� ���� ���/�")
elseif Text== "������" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ���/�")
elseif Text== "�����߿" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ���/�")
elseif Text== "�������" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ���/�")
elseif Text== "��� �����" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ����/� ")
elseif Text== "�����߿" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ���/�")
elseif Text== "��� ����" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ����/� ")
elseif Text== "��� �����" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ����/� ")
elseif Text== "��� ���߿" then return sendMsg(msg.chat_id_,msg.id_,"���� ������ ����/� ")
elseif Text== "���" then return sendMsg(msg.chat_id_,msg.id_,"���� �����??")
elseif Text== "���" then return sendMsg(msg.chat_id_,msg.id_,"��� ����??")
elseif Text== "���" then return sendMsg(msg.chat_id_,msg.id_,"��� ������ ��� ������/��??")
elseif Text== "���" then return sendMsg(msg.chat_id_,msg.id_,"���� ��� �� ����� ��������??")
elseif Text== "����� ���" then return sendMsg(msg.chat_id_,msg.id_,"����� �� ����??")
elseif Text== "�������" then return sendMsg(msg.chat_id_,msg.id_,"������� ����??")
elseif Text== "����" then return sendMsg(msg.chat_id_,msg.id_,"��������??")
elseif Text== "�����" then return sendMsg(msg.chat_id_,msg.id_,"��������??")
elseif Text== "����� �����" then return sendMsg(msg.chat_id_,msg.id_,"��������??")
elseif Text== "�����" then return sendMsg(msg.chat_id_,msg.id_,"��������??")
elseif Text== "����� �����" then return sendMsg(msg.chat_id_,msg.id_,"��������??")
elseif Text== "??" then return sendMsg(msg.chat_id_,msg.id_,"��� ����� ���??")
elseif Text== "??" then return sendMsg(msg.chat_id_,msg.id_,"��� ����� ���??")
elseif Text== "��" then return sendMsg(msg.chat_id_,msg.id_,"�� ���/� ����� �������/�")
elseif Text== "���" then return sendMsg(msg.chat_id_,msg.id_,"��� ���/� ����� �������/�")
elseif Text== "��" then return sendMsg(msg.chat_id_,msg.id_,"�� ���/� ����� �������/�")
elseif Text== "������" then return sendMsg(msg.chat_id_,msg.id_,"����")
elseif Text== "�����" then return sendMsg(msg.chat_id_,msg.id_,"���� ������")
elseif Text== "�����" then return sendMsg(msg.chat_id_,msg.id_,"��� ���� ���/� �����/�")
elseif Text== "����" then return sendMsg(msg.chat_id_,msg.id_,"��� ���� ���/� �����/�")
elseif Text== "�� ���" then return sendMsg(msg.chat_id_,msg.id_,"��� ���� ���/� �����/�")
elseif Text== "�� ��" then return sendMsg(msg.chat_id_,msg.id_,"��� ���� ���/� �����/�")
elseif Text== "������" then return sendMsg(msg.chat_id_,msg.id_,"��� ���� ���/� �����/�")
elseif Text== "��� ���" then return sendMsg(msg.chat_id_,msg.id_,"��� ���� ���/� �����/�")
elseif Text== "�����" then return sendMsg(msg.chat_id_,msg.id_,"��� ���� ���/� �����/�")
elseif Text== "��� ��" then return sendMsg(msg.chat_id_,msg.id_,"��� ���� ���/� �����/�")
elseif Text== "������ ��� ���" then return sendMsg(msg.chat_id_,msg.id_,"���� �����")
elseif Text== "����� ��� ���" then return sendMsg(msg.chat_id_,msg.id_,"���� �����")
elseif Text== "����" then return sendMsg(msg.chat_id_,msg.id_,"����/� �� ��� ")
elseif Text== "����" then return sendMsg(msg.chat_id_,msg.id_,"�����????")
elseif Text== "������" then return sendMsg(msg.chat_id_,msg.id_,"������ ���/� �����??")
elseif Text== "�� ����" then return sendMsg(msg.chat_id_,msg.id_,"������ ���/� �����??")
elseif Text== "����" or Text== "������ �����" or Text== "���� �����" or Text=="����� �����" or Text=="������� �����" then 
return sendMsg(msg.chat_id_,msg.id_,"������ ������")
elseif Text== "������"  then return sendMsg(msg.chat_id_,msg.id_,"���� ����� �������� ���� ������� ????")
elseif Text== "��� �����" then return sendMsg(msg.chat_id_,msg.id_,"????�??������ �����\n???�� ��� ����� ���� ����??\n???��� ������ ����� ????????\n??")
elseif Text== "��� �����" then return sendMsg(msg.chat_id_,msg.id_,"????�??������ �����\n???�� ��� ����� ����� �����??\n���� ������ ��� ������????\n??")
elseif Text== "����" then return sendMsg(msg.chat_id_,msg.id_,"????�??������ �����\n???�� ���� ����� �����??\n???���� �� ���� ��� ����� ��� ????\n??")
elseif Text== "����� �� ����" then return sendMsg(msg.chat_id_,msg.id_,"????�??������ �����\n???�� ����� �� ���� ����??\n???��� ������ �� ����� ������ ????\n??")
elseif Text== "����� �����" then return sendMsg(msg.chat_id_,msg.id_,"????�??������ �����\n???�� ����� ����� ����� �����??\n���� ���� �������????\n??")
elseif Text== "����" then return sendMsg(msg.chat_id_,msg.id_,"????�??������ �����\n???�� ������ ������� �����??\n???���� ������ ��� ������????\n??")
elseif Text== "��� ����" then return sendMsg(msg.chat_id_,msg.id_,"????�??������ �����\n???�� ��� ����� ���� �����??\n���� ������ ��� ������????\n??")
elseif Text== "����� ����" then return sendMsg(msg.chat_id_,msg.id_,"????�??������ �����\n???�� ����� ���� ���� �����??\n���� ���� �������????\n??")

elseif Text== "�����" or Text=="���� ??" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"??�??����� ��� ������ ���� ������\n\n "..USERNAME.." ~? ( "..data.id_.." )",37,USERCAR)  
return false
end)
elseif Text=="���� ���� �����" or Text=="���� ���� ���" or Text=="���� ���" or Text=="���� �����" then
return sendMsg(msg.chat_id_,msg.id_,[[
??*?* ���� ��� ����� ������ ?
???[���� ��� ������ ���������](https://telegram.org/deactivate)
]] )
--=====================================
elseif Text== "��� ���" or Text== "��� ���" or Text=="��� ���" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"��� ����� ������")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"��� ���� ������")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"���� ���������")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"���� ���� ����")
else 
return sendMsg(msg.chat_id_,msg.id_,"��� ���")
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
sendMsg(SUDO_ID,0,"??�??? ���� ����� ������\n????�????\n? �������� �������� ��� ���� ������\n?��� �������� 4 ���� ���\n?���� ����� �������� �������")
end
if not redis:get(max..'4DaySleep') and not redis:sismember(max..'kara','End2') then
sendMsg(SUDO_ID,0,"????�??���� ����� \n???�� ������ 4 ���� �������� ��������")
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
sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","??| ��� ������ ���������� ...\n??| ��������� � { "..#All_Groups_ID.." }\n??| ����� � "..Bot_User.."\n??| ������� � "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
end
if redis:get(max..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'?????�???����� �������� �� ��� ��������� ???\n????�???�������� : '..FlterName(redis:get(max..'group:name'..msg.chat_id_))..'??\n????�???���� : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'?????�???����� �������� �����???\n????�???��� ����� �������� ���� ����� ????\n????�???�� ���� ������ ������� '..SUDO_USER..' ??')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(max..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'?????�???���� ��� ���� ������ �������� ???\n????�???���� ������ ������� '..SUDO_USER..'\n??')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------


end 


return {
max = {
"^(�����)$",
"^(�����) (%d+)$",
"^(�����) (@[%a%d_]+)$",
"^(�� �������)$",
"^(�� �������) (%d+)$",
"^(�� �������) (@[%a%d_]+)$",
"^(�� �����)$",
"^(�� �����) (%d+)$",
"^(�� �����) (@[%a%d_]+)$",
"^(�� ��� �������) (%d+)$",
"^(�������)$",
"^(�������) (@[%a%d_]+)$",
"^([iI][dD])$",
"^(����� ������ �������)$",
"^(����� ������ �������)$",
"^(����� �����)$",
"^(����� �����)$",
"^(����� �������)$",
"^(����� �������)$",
"^(��� ������ �������)$",
"^(��� ������ �������)$", 
"^(����)$",
"^(����) (@[%a%d_]+)$",
"^(���)$",
"^(���) (%d+)$",
"^(���) (@[%a%d_]+)$",
'^(��� ����)$',
'^(��� ����) (@[%a%d_]+)$',
'^(��� ����) (%d+)$',
'^(����� ����)$',
'^(����� ����) (@[%a%d_]+)$',
'^(����� ����) (%d+)$',
'^(��� ����)$',
'^(��� ����) (@[%a%d_]+)$',
'^(��� ����) (%d+)$',
'^(����� ����)$',
'^(����� ����) (@[%a%d_]+)$',
'^(����� ����) (%d+)$', 
"^(��� ���)$",
"^(����� ���)$",
"^(��� ����)$",
"^(����� ����)$",
"^(��� ����)$",
"^(����� ����)$",
"^(��� �����)$",
"^(����� �����)$",
"^(��� �����)$",
"^(����� �����)$",
"^(��� ��)$",
"^(����� ��)$",
"^(��� �����)$",
"^(����� �����)$",
"^(��� ����)$",
"^(����� ����)$",
"^(��� ���)$",
"^(����� ���)$",
"^(��� ����)$",
"^(����� ����)$",
"^(��� ���)$",
"^(����� ���)$",
"^(��� ���)$",
"^(����� ���)$",
"^(��� ����)$",
"^(����� ����)$",
'^(��� ������)$',
'^(��� ����)$', 
'^(��� ����) (@[%a%d_]+)$',
'^(��� ������) (@[%a%d_]+)$',
'^(��� ������) (%d+)$',
'^(��� ����) (%d+)$',
'^(��� ���� �����)$',
'^(��� ���� �����)$',
'^(��� ���� �����) (@[%a%d_]+)$',
'^(��� ���� �����) (@[%a%d_]+)$',
'^(����� ���� �����)$',
'^(����� ���� �����)$',
'^(����� ���� �����) (%d+)$',
'^(����� ���� �����) (%d+)$',
'^(����� ���� �����) (@[%a%d_]+)$',
'^(����� ���� �����) (@[%a%d_]+)$',
'^(��� ����)$',
'^(��� ����)$',
'^(��� ����) (@[%a%d_]+)$',
'^(��� ����) (@[%a%d_]+)$',
'^(����� ����)$',
'^(����� ����)$',
'^(����� ����) (%d+)$',
'^(����� ����) (%d+)$',
'^(����� ����) (@[%a%d_]+)$',
'^(����� ����) (@[%a%d_]+)$',
'^(����� ������)$',
'^(����� ����)$',
'^(����� ����) (@[%a%d_]+)$',
'^(����� ������) (@[%a%d_]+)$',
'^(����� ������) (%d+)$',
'^(����� ����) (%d+)$',
 '^(��������)$',
 '^(��������)$',
'^(��������) (@[%a%d_]+)$',
'^(���) (.+)$',
'^(���) (.+)$',
'^(�����)$',
'^(�����) (.+)$',
'^(�����)$',
'^(�����) (.+)$',
'^(�� �����) (%d+)$',
"^(���)$",
"^(���) (.+)$",
'^(���) (.+)$',
'^(����� ���) (.+)$',
"^(��� ���)$",
"^(��� ���) (@[%a%d_]+)$",
"^(��� ���) (%d+)$",
"^(����� �����)$",
"^(����� �����) (@[%a%d_]+)$",
"^(����� �����) (%d+)$",
"^(����� ���)$",
"^(����� ���) (@[%a%d_]+)$",
"^(����� ���) (%d+)$",
"^(���)$",
"^(���) (@[%a%d_]+)$",
"^(���) (%d+)$",
"^(����� �����)$", 
"^(����� �����) (@[%a%d_]+)$",
"^(����� �����) (%d+)$",
"^(����� ���)$", 
"^(����� ���) (@[%a%d_]+)$",
"^(����� ���) (%d+)$",
"^(���)$",
"^(���) (@[%a%d_]+)$",
"^(���) (%d+)$",
"^(���)$",
"^(���) (@[%a%d_]+)$",
"^(���) (%d+)$",
"^(����� �����)$",
"^(����� �����) (@[%a%d_]+)$",
"^(����� �����) (%d+)$",
"^(����� ���)$",
"^(����� ���) (@[%a%d_]+)$",
"^(����� ���) (%d+)$",
"^(��� ����)$",
"^(��� ����) (@[%a%d_]+)$",
"^(��� ����) (%d+)$",
"^(����� ����)$",
"^(����� ����) (%d+)$",
"^(����� ����) (@[%a%d_]+)$",
"^(�����) (-%d+)$",
"^(��������) ([123])$",
"^(��������)$",
"^(����� ����)$", 
"^(���) (%d+)$",
"^(��������)$",
"^(��� �����)$",
"^(����� ����)$",
"^(�� ������)$",
"^(�����)$",
"^(����� �������)$",
"^(����� �����)$",
"^(����)$",
"^(������)$",
"^(�� ����)$",
"^(���� ���)$",
"^(������ ���)$",
"^(��������)$",
"^(�� ��������)$",
"^(�� ������)$",
"^(�� �����)$",
"^(�� �������)$",
"^(��������)$",
"^(��� ����)$",
"^(����)$",
"^(���)$",
"^(����� �����)$",
"^(�������)$",
"^(��������)$",
"^(���������)$",
"^(�� �������)$",
"^(�������)$",
"^(������ �������)$",
"^(������ �������)$",
"^(���������)$",
"^(����� ������)$",
"^(����� �����)$",
"^(����� �����)$",
"^(����� �������)$",
"^(����� ����)$",
"^(����� ������)$",
"^(����� ������)$",
"^(����� ������)$",
"^(����� �����)$",
"^(����� �����)$",
"^(����� ������)$",
"^(����� �������)$",
"^(����� �����)$",
"^(�� ���)$",
"^(�� ����)$",
"^(�� ���)$",
"^(��� �������)$",
"^(��� �������)$",
"^(��� ���������)$",
"^(������)$",
"^(������)$",
"^(���������)$",
"^(��������)$",
"^(��� ��������)$",
"^(�����)$",
"^(��� ��������)$",
"^(���� �������)$",
"^(�� ����� ������)$",
"^(������)$",
"^(��� �������)$",
"^(����� ���������)$",
"^(���������)$",
"^(��������� ??)$",
"^(���������)$",
"^(��������� ?)$",
"^(�����)$",
"^(����� ���)$",
"^(����� ���)$",
"^(����� ��� ��������)$",
"^(����� ��� �������� ??)$", 
"^(����� ��� ??)$", 
"^(����� ��� ??)$", 
"^(����� ??)$", 
"^(����� �����)$",
"^(����� ����� ??)$",
"^(��������)$",
"^(�������� ??)$",
"^(����)$",
"^(test)$",
"^(�����??)$",
"^(���� ������ ??)$",
"^(����������)$",
"^(���������� ??)$",
"^(��� �� ���)$",
"^(��� �� ��� ?)$",
"^(��� ������)$",
"^(��� ������ ������)$",
"^(�� ��� �����)$",
"^(��� ������)$",
"^(��� ��)$",
"^(������)$",
"^(������ ������)$",
"^(������ ������ ??)$",
"^(��� ��)$",
"^(/UpdateSource)$",
"^(����� ������ ??)$",
"^(����� ������)$",
"^(����� ���������)$",
"^(����� ���������)$",
"^(����� ��������� ??)$",
"^(����� ��������� ??)$",
"^(�����)$",
"^(�� ��� ����� �)$",
"^(�� ���� ������� ??)$",
"^(�� ���� �������)$",
"^(�������)$",
"^(���������)$",
"^(�������)$",
"^(����� ����� ??)$",
"^(������)$",
"^(�����)$",
"^(������)$",
"^(����)$",
"^(�������)$",
"^(/[Ss]tore)$",
"^(����� ������)$",
"^(�������)$",
"^(server)$",
"^(�������)$",
"^(��� �����)$", 
"^(���� �������� ���������)$",
"^(��� ���� ����������)$", 
"^(����� �������� ��������)$", 
"^(����� �������� ��������)$", 
"^(����� �������� ��������)$", 
"^(�������� ��������)$", 
"^(����� �������� �������� ?)$", 
"^(����� �������� �������� ??)$", 
"^(����� �������� �������� ??)$", 
"^(�������� �������� ??)$", 
"^(������)$", 
"^(������)$", 
"^(�����)$", 










"^(������)$",
"^(����)$",
"^(� ������)$", 
"^(����� ����)$",
"^(�������)$",
"^(�1)$",
"^(�2)$",
"^(�3)$",
"^(�4)$",
"^(�5)$",
"^(�6)$",
"^(�7)$",
 
 
 },
 imax = imax,
 dmax = dmax,
 }
