From: lkcl@lkcl.net (Luke Kenneth Casson Leighton)
Date: Sat, 10 Nov 2018 17:40:03 +0000
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
Message-ID: <CAPweEDyumVztVzFpx_05i2Qjc8YhzXOKKRkmDNqEOKuxZcr99Q@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Nov 10, 2018 at 4:46 PM ron minnich <rminnich@gmail.com> wrote:

> Which is why I'm a bit unhappy to see this (to me) cancerous growth in
> proposals for M- mode code. PPP in firmware?

 no, ron, absolutely not, that would not make any sense at all:
getting what is otherwise a userspace pppd into firmware would be a
nightmare as it would require a huge amount of POSIX support dragged
in with it.

 it would be ppp running in spike userspace (buildroot in an
initramfs), where the linux kernel would have absolutely standard ppp
modules compiled up, the serial data drops down to spike over the
proposed modified SBI, which, on having support for the proposed
addition, will take an extra command-line option "spike
--serial-line-0-redirect-cmd='pppd'" which gets it into the host, and
the guest spike OS gets network in a dead straightforward fashion, for
very little in the way of code and ABI modifications.

 it's a cut/paste job, for goodness sake, in the pre-existing SBI
implementations, just adding an extra argument.

 it's real simple, and has absolutely nothing to do with the [crazed!]
idea of porting a userspace ppp POSIX daemon into u-boot/coreboot.  i
mean, you *could* do it but you'd be insane to consider it, and there
are better options for the more complex systems... which don't *have*
to use the proposed idea.

 the alternative to achieve the same desired goal is to re-wire all of
the u-boot/coreboot source code and use some form of serial line
"framing" protocol, to emulate multiple virtual serial lines over the
single SBI console.  and rewrite openocd to support it.  and. and.
and. and.

 that's a lairy nightmare waiting to happen, and, on early debug of
real silicon where you're hand-programming the PLL and the serial
port's outputting crap because you've no idea of the baud rate, you
wouldn't see ASCII characters if you got it right, you'd see framing
crap instead and couldn't plug in simple minicom, it'd have to be a
*modified* version of minicom.  etc. etc. etc. etc.


> p.s. For interleaving debug and console output firmware, use the
> oldest trick in the book: ASCII is 7 bits. Since console out is 8
> bits, reserve 128 values for console out, and 128 for debug stream,
> and if the debug stream needs 8 bit for some words, you know what to
> do. It's very easy and doesn't require that we add multiple UART
> support to SBI.

 naah.  see above.  it's a lot more complex and fragile than that.

l.
