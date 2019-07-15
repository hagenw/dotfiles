# === Mail account ===
set realname = "Hagen Wierstorf"
set from = "hwierstorf@audeering.com"
set spoolfile = "+audeering.com/inbox"
set trash = "+audeering.com/trash"
set record="+audeering.com/sent"
set postponed="+audeering.com/drafts"
set smtp_url="smtps://wp13277175-hwierstorf@wp13277175.mailout.server-he.de:465"
set smtp_pass = "`pass mail/audeering.com`"
# Allow for automatic reply by the to address
set reverse_name

# Add signature for emails outside of the company
send-hook "~f @audeering.com" set signature=~/.mutt/sigs/audeering
send-hook "~t @audeering.*"   set signature=

# Include the profile in the status line (and xterm title)
# see: http://www.mutt.org/doc/manual/#status-format
set status_format="mutt_xtitle '%?n?(%n) ?%?b?[%b] ?@audeering.com %m msgs in %f (%L)'|"

# vim:set filetype=muttrc:
