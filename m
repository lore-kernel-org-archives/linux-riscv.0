From: lkcl@lkcl.net (Luke Kenneth Casson Leighton)
Date: Sat, 10 Nov 2018 17:55:07 +0000
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAEz=songRyvbEgYfxKP0WyuAdZnKsqfrCk8CCxSsCGGHeUFixA@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
 <CAPweEDzZGEi87o5bBPeU6c7qHCtCJNcOHL0Uz1uUOPQak56X_Q@mail.gmail.com>
 <CAEz=songRyvbEgYfxKP0WyuAdZnKsqfrCk8CCxSsCGGHeUFixA@mail.gmail.com>
Message-ID: <CAPweEDw=5sy5d-LA5hLQEu+oyf9T5GCkMxDEut9q06zff_-9qQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Nov 10, 2018 at 5:48 PM Samuel Falvo II <sam.falvo@gmail.com> wrote:

> On Sat, Nov 10, 2018 at 9:43 AM Luke Kenneth Casson Leighton
> <lkcl@lkcl.net> wrote:
> >  it's also not an appropriate argument.  nobody sensible would port a
> > POSIX pppd from userspace into boot-level firmware.  the argument also
> > ignores the dozens of other advantageous potential use-cases.
>
> Regrettably, if it's one thing we've all learned from PC clone
> manufacturers and BIOS vendors, it's that they're not sensible.
> They're not reasonable.  And they're anything but sane.
>
> Servers designed for use in data centers are on the market right now
> with adapters fully equipped with TCP/IP stacks in firmware *just* to
> give a remote operator control over a computer's PS/2 or serial ports,
> for instance.
>
> You can bank that it'll happen with RISC-V as well.

 *snort* yeah.  is that a good enough reason to terminate all and any
discussion of enhancing a general-purpose generic API that has several
other beneficial use-cases?  reminds me of the adage "guns don't kill
people: people kill people".

l.
