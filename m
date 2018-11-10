From: rminnich@gmail.com (ron minnich)
Date: Sat, 10 Nov 2018 08:46:07 -0800
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
Message-ID: <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

At Google and other places, we've been struggling now for years with
overly complex firmware that is implemented incorrectly, enabling
exploits and other bad things. The list of things vendors get wrong in
firmware, both enabling exploits and enabling others to enable
exploits, is long and it continues to this day. There is an
unbelievable amount of money out there all involving firmware
exploits, very little of it involving nice people.

I'm currently working on deleting all use of the x86 version of M
mode, i.e. SMM. There are many proposals out there for deleting SMM
from the architecture. I've also shown at a talk in 2017 how we could
redirect SMM interrupts back into the kernel. We're also removing all
use of callbacks into UEFI on x86. We're almost there.

Which is why I'm a bit unhappy to see this (to me) cancerous growth in
proposals for M- mode code. PPP in firmware? Really? multiple serial
devices? really? We've been here before, in the 1970s, with something
called the BIOS. If you're not familiar with it, go take a look, or
you can take my word for it that these proposals implement that idea.
We spent over 20 years freeing ourselves from it on x86. Why go back
to a 50 year old model on a CPU designed to be in use for 50 years?

My early understanding of M mode was that it was an Alpha PALCode like
thing, enabling access to resources that were behind a privilege wall.
I did not like it that much, but I was OK: it was very limited in
function, and the kernel could replace it, or at least measure it. I
also accept that every cpu vendor uses m mode like things (e.g. ARM
TF) for reasonable purposes and also (let's be honest here)  for
dealing with chipset mistakes. But that does not mean you need to
recreate BIOS.

The SBI should be hard to add to, deliberately. It should be used only
when there are no possible alternatives. It needs to be open source
and held in common. It should be possible for a kernel to replace or
at least measure it. And, further, there needs to be some work done on
why you add to it, and why you don't, with bias against adding to it.
This proposal works against those ideals, as it explicitly enables
vendor-specific forks of the SBI. Sure, this can happen, but why make
it so easy?

see https://github.com/riscv/riscv-sbi-doc/pull/12 for other thoughts.

Also, I've had discussions with some security folks in our firmware
community about the fact that the PMP can be used in a way that the
kernel can not measure the SBI, since SBI might read-protect itself.
This is a real step backwards, FYI. Not sure if it can be changed at
this point.

ron
p.s. For interleaving debug and console output firmware, use the
oldest trick in the book: ASCII is 7 bits. Since console out is 8
bits, reserve 128 values for console out, and 128 for debug stream,
and if the debug stream needs 8 bit for some words, you know what to
do. It's very easy and doesn't require that we add multiple UART
support to SBI.
On Sat, Nov 10, 2018 at 7:49 AM Luke Kenneth Casson Leighton
<lkcl@lkcl.net> wrote:
>
> ---
> crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68
>
> On Sat, Nov 10, 2018 at 3:31 PM Nick Kossifidis <mick@ics.forth.gr> wrote:
> >
> > ???? 2018-11-10 07:12, Luke Kenneth Casson Leighton ??????:
> > > On Sat, Nov 10, 2018 at 2:42 AM Atish Patra <atish.patra@wdc.com>
> > > wrote:
> > >
> > >> ## Conclusion
> > >> This proposal is far from perfect and absolutely any suggestion is
> > >> welcome. Obviously, there are many other functionalities that can be
> > >> added to this proposal. However, I just wanted to start with something
> > >> that is an incremental change at best to kick off the discussion. The
> > >> aim here is to initiate a discussion that can lead to a robust SBI
> > >> specification.
> > >
> > >  very cool, atish.
> > >
> > >  i would very much like to see the optional addition of multiple
> > > serial lines, by adding a getchar and putchar function that takes just
> > > one extra argument: the serial line index.
> > >
> > >  there are a lot of different uses to which mult-serial lines may be
> > > put:
> > >
> > >  * boot message separation from console login
> > >  * boot management separation from other purposes (u-boot/coreboot)
> > >  * virtual /dev/ttyS0-3
> > >  * clean UPS reporting and management
> > >  * remote virtual machine power management (power-on / off)
> > >  * simple bog-standard multiple virtual login consoles
> > >  * separation of debug messages (stdout/stderr) to ease debugging and
> > > development
> > >  * remote and virtual OpenOCD and kernel debugging without disrupting
> > > the main serial console
> > >  * PPP serial links.
> > >
> > > this latter is one that i am particularly interested in, as i would
> > > like to be able to boot a full GNU/Linux OS on spike, given the lower
> > > barrier to entry in making modifications and experimenting with spike
> > > than it is with qemu.
> > >
> > >  if spike were able, through a multi-serial SBI interface, to have a
> > > PPP serial line, it would be possible to run a root NFS (or other
> > > network block device) without having to sacrifice console access.  it
> > > would be possible to create an initramfs from a lower-capability
> > > system like buildroot, containing PPP, enable it, and pivot-root out
> > > to a full stock GNU/Linux OS such as debian or fedora.
> > >
> > >  so there are huge benefits, reducing the development barrier to entry
> > > into RISC-V experimentation and debugging, and opening up a much wider
> > > range of capabilities and possibilities for machine and virtual system
> > > management.
> > >
> > > l.
> >
> >
> > The current SBI says that console_getchar/console_putchar are for the
> > debug
> > console but on Linux we use them for the main console on earlyprintk.
>
>  ... yeah exactly.  and what if something goes wrong, you want to be
> able to interact over openocd without interfering with that
> earlyprintk, particularly during that critical first bringup phase of
> real-world silicon?
>
> > I
> > think it's misleading and we should at least have an argument to chose
> > between the main console and an optional debug console, or rename
> > them to debug_console_getchar/debug_console_putchar and
> > main_console_getchar/
> > main_console_putchar.
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
> > However I don't think that argument should be the serial line. Different
> > vendors may use different serial lines for the main console / debug
> > console,
> > the caller doesn't know which serial line maps to which console, so the
> > SBI
> > should be more abstract and use something like a console id where e.g. 0
> > is
> > main console an 1 is debug.
>
>  yes, it should [have]: my feeling is, it's a little late in the game
> given that it's almost certainly baked into pre-existing hardware, by
> now, so the next best thing is a new function call.
>
> l.
>
> --
> You received this message because you are subscribed to the Google Groups "RISC-V SW Dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to sw-dev+unsubscribe at groups.riscv.org.
> To post to this group, send email to sw-dev at groups.riscv.org.
> Visit this group at https://groups.google.com/a/groups.riscv.org/group/sw-dev/.
> To view this discussion on the web visit https://groups.google.com/a/groups.riscv.org/d/msgid/sw-dev/CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ%3D44A%40mail.gmail.com.
