# Copyright (c) 2011, Max Soltan <gonzih@gmial.com>
# All rights reserved.
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.
#
#very simple script that send messages,
#put message.png to ~/.weechat folder,
#that will be use as icon on notifications

require 'net/http'
require 'net/https'
require 'uri'

SCRIPT_NAME = 'notify_send_r'
SCRIPT_AUTHOR = 'Max Soltan <gonzih@gmial.com>'
SCRIPT_DESC = 'Notifications'
SCRIPT_VERSION = '1.8'
SCRIPT_LICENSE = 'MIT'

DEFAULTS = {
  'maxlen'      => '50',
  'color'       => 'red',
  'shortener'   => 'tinyurl',
  'bitly_login' => '',
  'bitly_key'   => '',
  'yourls_url' => '',
}


def weechat_init
  Weechat.register SCRIPT_NAME, SCRIPT_AUTHOR, SCRIPT_VERSION, SCRIPT_LICENSE, SCRIPT_DESC, "", ""
  Weechat.hook_print('', 'irc_privmsg', '', 1, 'notify_show', '')

  Weechat::WEECHAT_RC_OK
end

#Sends highlighted message to be printed on notification
def notify_show(data,
                bufferp,
                uber_empty,
                tagsn,
                isdisplayed,
                ishilight,
                prefix,
                message)

  if Weechat.buffer_get_string(bufferp, "localvar_type") == "private"
    `notify-send "#{prefix}" "#{message}" -t 2 -i ~/.weechat/message.png&`
  else
  end

  Weechat::WEECHAT_RC_OK
end
