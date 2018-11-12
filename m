From: palmer@sifive.com (Palmer Dabbelt)
Date: Sun, 11 Nov 2018 18:08:31 -0800 (PST)
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAPweEDwYRzuuZVvPrDbUcBxCLcpOoR4tfH=9dQDJuwu0Za=nRA@mail.gmail.com>
Message-ID: <mhng-2e75d6c3-ec0f-42db-be43-cdba1cf52248@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, 10 Nov 2018 23:14:40 PST (-0800), lkcl at lkcl.net wrote:
> ---
> crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68
>
> On Sun, Nov 11, 2018 at 3:15 AM Nick Kossifidis <mick@ics.forth.gr> wrote:
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
>> OS. Let me ask you this, if you want to change UART speed or settings in
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
>> What's coming up next ?
>
>  nothing, nick.  just one extra parameter to the console
> getchar/putchar function [or a duplicate function which does] that's
> all.
>
>> Adding networking support for example ?
>
>  of course not.  why on earth would that make sense?  how on earth
> would networking fit into a 16k Boot ROM?
>
>  i feel that you're arguing and throwing up straw-man questions for
> arguments' sake, here, hoping that one of them will stick, and that by
> ignoring the positive aspects of the (incredibly simple)
> cut/paste-style minimalist proposal and throwing as many "bad" ones
> out there, it'll somehow.. do.. i dunno, what *is* the purpose of the
> questions you're asking?
>
>
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
>> By the way spike is an ISA simulator, I don't see why it should emulate
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
>  come on, man, be a little less adversarial: it makes life easier for everyone.
>
>
>> so someone will need to write
>> code for that, more money !
>
>  i'll happily do it, as i need it.  it's a straight cut/paste of
> pre-existing code.
>
>> You can use QEMU for that where you can have
>> as many UARTs as you want and the drivers for them are already available
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

Luke: You may be used to posting on the sw-dev and isa-dev mailing lists where 
this kind of post appears to be acceptable.  In case you didn't notice, you've 
now managed to get linux-riscv on your CC list.  I've already dropped all the 
@riscv.org lists from my inbox because they're worthless, but work actually 
happens on linux-riscv and I'd like it to continue being useful.

Please keep the noise down.

Thanks!
