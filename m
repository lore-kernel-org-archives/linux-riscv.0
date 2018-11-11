From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sun, 11 Nov 2018 15:17:07 +0200
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAPweEDwYRzuuZVvPrDbUcBxCLcpOoR4tfH=9dQDJuwu0Za=nRA@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
 <CAPweEDxzkNTGKbitReqUqpsybF3ZAZSL4StVjxfkB956gYSPcw@mail.gmail.com>
 <ee0d847efd9d9d4bc1a54e4474d9bf0c@mailhost.ics.forth.gr>
 <CAPweEDwYRzuuZVvPrDbUcBxCLcpOoR4tfH=9dQDJuwu0Za=nRA@mail.gmail.com>
Message-ID: <1927796907ae3d5630baba51c121f18c@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-11-11 09:14, Luke Kenneth Casson Leighton ??????:
> ---
> crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68
> 
> On Sun, Nov 11, 2018 at 3:15 AM Nick Kossifidis <mick@ics.forth.gr> 
> wrote:
>> 
>> ???? 2018-11-10 21:39, Luke Kenneth Casson Leighton ??????:
>> > ---
>> > crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68
>> >
>> > On Sat, Nov 10, 2018 at 5:59 PM Nick Kossifidis <mick@ics.forth.gr>
>> > wrote:
>> >>
>> >> ???? 2018-11-10 19:47, Luke Kenneth Casson Leighton ??????:
>> >> > On Sat, Nov 10, 2018 at 5:42 PM Olof Johansson <olof@lixom.net> wrote:
>> >> >
>> >> >> The case of console is in this case pretty simple: It's intended for
>> >> >> early boot for very simplistic environments (before the rest of the
>> >> >> kernel is up, etc). Keeping the SBI console around beyond early boot,
>> >> >> and somehow trying to optimize for it for those use cases is a
>> >> >> misdirected effort; that's what native drivers are for.
>> >> >
>> >> >  spike (which is only around 7,000 lines of code) doesn't have native
>> >> > drivers, and qemu is too heavy-duty to consider adding custom
>> >> > extensions and experimental research onto.
>> >> >
>> >> >  with nothing in spike *other* than the serial console, it's the only
>> >> > way in and out.
>> >> >
>> >> >  l.
>> >>
>> >> Anything more than a main/debug console is too much for the SBI, its
>> >> goal is to be used early on in the boot process until the OS or the
>> >> bare metal app takes control.
>> >
>> >  nooo, that's just _one_ use to which it's being put.
>> >
>> >> Having multiple serial lines through
>> >> the SBI for things like PPP, UPS, virtual consoles and all the stuff
>> >> you mentioned is out of scope.
>> >
>> >  why?
>> >
>> 
>> Because the firmware is meant to be something minimal, not to replace
>> the
>> OS. Let me ask you this, if you want to change UART speed or settings 
>> in
>> general would you also ask for an SBI call for that ?
> 
>  of course, not, nick.  it's a simple cut/paste of the existing
> console getchar/putchar code.  you're beginning to alarm me by making
> this out to be much more complex than it is.
> 
>  if i'd thought it was a good idea to propose an SBI call to change
> UART speed or settings, i would have said so.  there's absolutely no
> need to make it *look* like i've proposed that.  doing so - putting
> words into someone else's mouth - is unethical, and i'd appreciate it
> if you could stop doing it.
> 
> 

Sorry that wasn't my intention, my intention was to understand what you
want to achieve. On the one hand you mentioned that you want an SBI
API change so that you can better work with spike, on the other hand
in order to convince the rest of us that this is a good approach for
the SBI API, you mentioned some examples that to me look like
overengineering at this point. I would never e.g. use getchar/putchar 
for
example for PPP etc. On another example you mentioned using this serial
line for providing networking with spike. My questions are honest, I'm
not trying to put words on your mouth.

>> What's coming up next ?
> 
>  nothing, nick.  just one extra parameter to the console
> getchar/putchar function [or a duplicate function which does] that's
> all.
> 

ACK and as I told you on my first reply, my only concern there is that
this argument shouldn't be about serial line indices but about "types"
so that (since this thing is going to end up on actual hardware) vendors
don't mess up. If you say serial line 0 for example and your code 
assumes
this is the main console, another vendor might put the debug console 
there
or an auxiliary console. By using a console id instead of a serial line
index, you can hide this on the firmware and deal with it there.

>> Adding networking support for example ?
> 
>  of course not.  why on earth would that make sense?  how on earth
> would networking fit into a 16k Boot ROM?
> 

I don't know, why on earth should a 16k Boot ROM be used for accessing
multiple serial lines for PPP, UPS etc ? To me that's the work of an OS,
the same OS that will handle the running of PPP/UPS monitor/whatever.
If you use such examples you should expect that people will assume the
worst (I'm not the only one that assumed the worst btw), and that's what
any reviewer should do.

>  i feel that you're arguing and throwing up straw-man questions for
> arguments' sake, here, hoping that one of them will stick, and that by
> ignoring the positive aspects of the (incredibly simple)
> cut/paste-style minimalist proposal and throwing as many "bad" ones
> out there, it'll somehow.. do.. i dunno, what *is* the purpose of the
> questions you're asking?
> 

The positive aspects of supporting multiple serial lines through the SBI
getchar/putchar code that you mention are not clear to me, that's why 
I'm
asking what's the purpose of this other than a hack to get around
limitations on spike. Supporting PPP for example without being able
to set serial parameters is a hack and we shouldn't be discussing that
in the context of the SBI.

>> Where do you put the
>> barrier
>> on firmware's complexity / scope ?
> 
>  at the exact same point that you do, under the circumstances and
> context in which you're looking at and from.
> 
>  now, can you recognise that there are *other* needs and requirements
> as well, beyond the ones that you have?
> 

I can understand changing the current SBI and adding an extra argument 
to
chose between a main and a debug console (not by serial line index as I
mentioned above but through a console id argument). Could you please 
help
me understand why you want support for more ports than that on the base 
SBI ?

You mentioned the following...

> * boot message separation from console login

ACK I agree on that, that's what the debug uart can be used for, lots
of people are doing that. However if by boot messages you mean anything
other than dmesg output, you need syslog for that and a /dev/tty* entry
for the debug (or any other) console. To me providing this through a 
driver
that's just a wrapper around the SBI and provides only a small subset of
what a tty driver should provide is fundamentally wrong.

That's why I believe the SBI should only be used for earlyprintk and in
general for things before the OS boots. Once the OS boots we should
have proper UART support.

> * boot management separation from other purposes (u-boot/coreboot)

That makes more sense, at least in this case everything is built-in
on u-boot/coreboot so using a different way of accessing the
main and the debug console shouldn't be a big deal. However I still
don't see any value here for more consoles than main/debug.

> * virtual /dev/ttyS0-3
> * clean UPS reporting and management
> * remote virtual machine power management (power-on / off)
> * simple bog-standard multiple virtual login consoles

To me this is way off, we have networking for that, why on earth should
anyone use serial ports ?

> * separation of debug messages (stdout/stderr) to ease debugging and
> development
> * remote and virtual OpenOCD and kernel debugging without disrupting
> the main serial console
> * PPP serial links.

So again you'll need /dev/tty* for that, which should be handled by
a proper UART driver. Especially for the PPP, unless all you want to
do is hack your way through.

>> By the way spike is an ISA simulator, I don't see why it should 
>> emulate
>> UART ports, last time I checked it didn't,
> 
>  ah, nick, i get the feeling you're deliberately looking for ways to
> be obstructive, and also fundamentally misunderstanding how the
> getchar / putchar code works.
> 
>  spike provides a minimal implementation of the SBI, via libfesvr.
> the data that goes to the getchar/putchar function is ultimately
> redirected to a minimalist stdin / stdout implementation.  there *is*
> no call to UART ports.
> 

So as I said spike doesn't emulate UART ports, and it shouldn't, it's an
ISA simulator, it doesn't and shouldn't emulate devices.

>  come on, man, be a little less adversarial: it makes life easier for 
> everyone.
> 
> 
>> so someone will need to write
>> code for that, more money !
> 
>  i'll happily do it, as i need it.  it's a straight cut/paste of
> pre-existing code.
> 

So what's the issue ? You can patch spike and add your custom SBI calls
(vendor-specific) on libfesvr and you are done with it. Why should this
extension about multiple serial lines, so that you can do your hacks 
when
testing on spike, should be on the base SBI ?

>> You can use QEMU for that where you can have
>> as many UARTs as you want and the drivers for them are already 
>> available
>> for you.
> 
>  i *can't*.  qemu is too complex and i've invested 2 months of
> personal money - without funding or grants from any corporation or
> institution - into spike, precisely because it's only 7,000 lines of
> code.
> 
>  modifying qemu is too much.  i've seen signs that they're moving into
> JIT optimisation territory, which is far too complex to get involved
> with.
> 
> spike is simple, it's straightforward, it's fast, and it works.
> 
> 

What are you trying to do ? Test a specific piece of code / ISA 
extension
etc or emulate a full blown system ? If you just want networking support
on spike let's talk about this instead, that's not an issue regarding 
the
SBI.

>> >  i'm an ethical libre developer: i can't go footing the bill for other
>> > people to sponge off my efforts all the time, i've had 20 years of
>> > people doing that and i'm f*****g well not putting up with it on this
>> > project.
>> >
>> >  so no, mick, sorry, not buying the argument "it's open source".
>> >
>> > l.
>> 
>> Don't assume you are the only one.
> 
>  good to hear.
> 
> now... can i ask you if you could possibly turn down the adversarial
> straw-man thing just a leeeetle tiny bit?  it takes a huge amount of
> effort on your part to maintain, and makes it really really difficult
> for everyone to have to read, "no, that's not right, no, that's not
> true either, no, i didn't say that at all" and so on.
> 
> what do you think?
> 
> 
> l.

I think that on a technical discussion labeling your peers as 
"obstructive"
and "adversarial" and bringing non-technical arguments like funding 
issues
etc and how ethical/libre developer you are to the table is not 
appropriate.
I never judged your intentions or characterized you in any way, I'd 
expect
from you to do the same.

Regards,
Nick
