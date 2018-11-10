From: sam.falvo@gmail.com (Samuel Falvo II)
Date: Sat, 10 Nov 2018 09:41:47 -0800
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
Message-ID: <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

on sat, nov 10, 2018 at 8:46 am ron minnich <rminnich@gmail.com> wrote:
> which is why i'm a bit unhappy to see this (to me) cancerous growth in
> proposals for m- mode code. ppp in firmware? really? multiple serial

i'm inclined to agree with the overall sentiment of the concerns
raised herein (omitted for brevity), but i feel that it might go a bit
too far.

the bios has its roots with cp/m, i think we all can agree with this,
and there the bios was well-matched to its task: booting cp/m.
nothing more, nothing less.

you had i/o routines for teletype output, keyboard input, paper tape
input, and punch output.  as well, you had basic primitives for
reading and writing sectors on mass storage devices.  and, unless you
were porting cp/m itself to a completely new platform, you never had
to *really* worry about the physical constraints of those mass storage
devices.  maximum number of sectors and tracks were about the extent
of things.  you never had to call back into anything, either.

in other words, bios was a *library*, not a *framework.*  it was
*deliberately* designed and scoped to just deal with booting into a
cp/m environment.

originally, the pc bios was built the same way -- it was what you used
to boot pc-dos (nee ms-dos).

only *later* did massive api changes get lumped into the bios.  things
like protected memory support, acpi power mode settings, etc. all but
required changing the bios away from being a library and into more of
a framework/miniature os unto itself.

i think the real lessons to be learned here are:

1) the bios interface was dictated by the demands of booting and
running a preferred (though not the only) os.  in other words, the
*os* dictated the bios interface.  bios literally was what one would
call a "hal" (hardware abstraction layer) these days.  the fact that
others have technically used bios to boot into other, non-sanctioned
oses over the years is, technically, an abuse of the interface that
just happens to work.

2) bios was strictly a library.  the maximum extent to which bios was
a framework stopped firmly at loading in the master boot record and
dispatching control to it.  from then on, you were utterly on your
own.  note: no security hoo-haw here.  no signed anything.  no pe
executables.  no rom-filesystems.  no dedicated uefi partitions.  et.
al.  just read in 512b to 1kb of raw binary blob, and run it.  that's
it.  from then on, bios was a library first and always.  anything we
come up with for an sbi must, in my opinion, behave the same way.

oh, btw, before people get the idea that uefi allows per-partition
filesystems, please note that os/2 used "micro-filesystem drivers" to
achieve this same effect with nothing more sophisticated than the
partition table located in a dos 3.3 mbr.  don't drink the uefi
kool-aid.

3) corrallary to (2): because bios was just a library, you could throw
it away en mass at any time (and after booting into the os of your
choice, it frequently was).  you could, if you were clever enough with
page tables and the like, even replace the bios with your own image if
you wanted to.  this speaks to what ron has discussed in prior threads
over the concerns of not being able to replace m-mode software.

4) support for multiple devices is not necessarily a bad thing; just,
don't go hog wild with it.  there's no need to support 256 possible
serial ports, for example.  ok, you have a debugger interface, a
resident console, and maybe one more for auxiliary purposes (for
example, my kestrel-3 design so far needs *two* serial interfaces to
the host pc, one which is the user's console, and one which is used to
access mass storage).  each of these devices should have their own
read/write interface, thus making it impeccably clear in the source
code what it is you're trying to do.  no need to "open" things.

my point here is, going back to the needs of the *os* and not the bios
for bios' sake, the interface exposed by the bios should match the
overall expectations of the os you're booting.  in my case, i *need*
two serial interfaces for my prototype computer to function: ergo, it
makes perfect sense for my firmware to provide support for two serial
interfaces.  for the linux, this need not be the case; maybe only one
interface is required.

> the sbi should be hard to add to, deliberately. it should be used only
> when there are no possible alternatives. it needs to be open source
> and held in common. it should be possible for a kernel to replace or
> at least measure it. and, further, there needs to be some work done on
> why you add to it, and why you don't, with bias against adding to it.

i'm reposting this block of test because i agree completely with it,
and want to point out that it doesn't contradict what i wrote above.

> p.s. for interleaving debug and console output firmware, use the
> oldest trick in the book: ascii is 7 bits. since console out is 8
> bits, reserve 128 values for console out, and 128 for debug stream,
> and if the debug stream needs 8 bit for some words, you know what to
> do. it's very easy and doesn't require that we add multiple uart
> support to sbi.

another option is to use escape sequences preceding each output.
escape byte 1 would mean "future bytes are sent to the debugger",
while byte 2 would mean "future bytes are intended for console
output."  this gives you support for all 8-bits (if your debugger
interface happens to be binary), with the occasional overhead of
escaping escape bytes.

trivial to implement both on the receiving and transmitting sides,
possibly even simpler than the bit-7-target-address approach above.
the only disadvantage is that it's stateful; but if you have a serial
connection reliable enough to use with a binary debugging interface,
it'll almost certainly be reliable enough for this too.

-- 
samuel a. falvo ii
