From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sat, 10 Nov 2018 19:43:26 +0200
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
Message-ID: <70910d55a0046d9ddc7d4308cb56e581@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-11-10 17:48, Luke Kenneth Casson Leighton ??????:
> ---
> crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68
> 
> On Sat, Nov 10, 2018 at 3:31 PM Nick Kossifidis <mick@ics.forth.gr> 
> wrote:
>> 
>> ???? 2018-11-10 07:12, Luke Kenneth Casson Leighton ??????:
>> > On Sat, Nov 10, 2018 at 2:42 AM Atish Patra <atish.patra@wdc.com>
>> > wrote:
>> >
>> >> ## Conclusion
>> >> This proposal is far from perfect and absolutely any suggestion is
>> >> welcome. Obviously, there are many other functionalities that can be
>> >> added to this proposal. However, I just wanted to start with something
>> >> that is an incremental change at best to kick off the discussion. The
>> >> aim here is to initiate a discussion that can lead to a robust SBI
>> >> specification.
>> >
>> >  very cool, atish.
>> >
>> >  i would very much like to see the optional addition of multiple
>> > serial lines, by adding a getchar and putchar function that takes just
>> > one extra argument: the serial line index.
>> >
>> >  there are a lot of different uses to which mult-serial lines may be
>> > put:
>> >
>> >  * boot message separation from console login
>> >  * boot management separation from other purposes (u-boot/coreboot)
>> >  * virtual /dev/ttyS0-3
>> >  * clean UPS reporting and management
>> >  * remote virtual machine power management (power-on / off)
>> >  * simple bog-standard multiple virtual login consoles
>> >  * separation of debug messages (stdout/stderr) to ease debugging and
>> > development
>> >  * remote and virtual OpenOCD and kernel debugging without disrupting
>> > the main serial console
>> >  * PPP serial links.
>> >
>> > this latter is one that i am particularly interested in, as i would
>> > like to be able to boot a full GNU/Linux OS on spike, given the lower
>> > barrier to entry in making modifications and experimenting with spike
>> > than it is with qemu.
>> >
>> >  if spike were able, through a multi-serial SBI interface, to have a
>> > PPP serial line, it would be possible to run a root NFS (or other
>> > network block device) without having to sacrifice console access.  it
>> > would be possible to create an initramfs from a lower-capability
>> > system like buildroot, containing PPP, enable it, and pivot-root out
>> > to a full stock GNU/Linux OS such as debian or fedora.
>> >
>> >  so there are huge benefits, reducing the development barrier to entry
>> > into RISC-V experimentation and debugging, and opening up a much wider
>> > range of capabilities and possibilities for machine and virtual system
>> > management.
>> >
>> > l.
>> 
>> 
>> The current SBI says that console_getchar/console_putchar are for the
>> debug
>> console but on Linux we use them for the main console on earlyprintk.
> 
>  ... yeah exactly.  and what if something goes wrong, you want to be
> able to interact over openocd without interfering with that
> earlyprintk, particularly during that critical first bringup phase of
> real-world silicon?
> 

What does openocd has to do with the console ? Earlyprintk is output
only btw. The point here is that we need to update the documentation
because it's misleading, we don't have a debug console on the current
SBI, just a console.

>> I
>> think it's misleading and we should at least have an argument to chose
>> between the main console and an optional debug console, or rename
>> them to debug_console_getchar/debug_console_putchar and
>> main_console_getchar/
>> main_console_putchar.
> 
>  i initially thought of proposing that, however:
> 
>  (1) the API already exists with "single console". it would therefore
> be disruptive to change that
> 
>  (2) if adding something called debug_console_{get/put}char, it might
> as well take advantage of the opportunity to be extended and made
> generic, and have the extra argument added
> 

I'm not in favor of main_console_getchar/debug_console_getchar etc, I
just wanted to point out that the API should be clear about what
console is to be used, not by using a serial line id but an id
that describes its usage.

>> However I don't think that argument should be the serial line. 
>> Different
>> vendors may use different serial lines for the main console / debug
>> console,
>> the caller doesn't know which serial line maps to which console, so 
>> the
>> SBI
>> should be more abstract and use something like a console id where e.g. 
>> 0
>> is
>> main console an 1 is debug.
> 
>  yes, it should [have]: my feeling is, it's a little late in the game
> given that it's almost certainly baked into pre-existing hardware, by
> now, so the next best thing is a new function call.
> 
> l.

Late in the game ? Who's game ? Is there any "standard" way out there
for mapping consoles to serial line indices ?

Regards,
Nick
