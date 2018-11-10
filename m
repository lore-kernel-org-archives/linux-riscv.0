From: lkcl@lkcl.net (Luke Kenneth Casson Leighton)
Date: Sat, 10 Nov 2018 19:39:39 +0000
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
Message-ID: <CAPweEDxzkNTGKbitReqUqpsybF3ZAZSL4StVjxfkB956gYSPcw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

---
crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68

On Sat, Nov 10, 2018 at 5:59 PM Nick Kossifidis <mick@ics.forth.gr> wrote:
>
> ???? 2018-11-10 19:47, Luke Kenneth Casson Leighton ??????:
> > On Sat, Nov 10, 2018 at 5:42 PM Olof Johansson <olof@lixom.net> wrote:
> >
> >> The case of console is in this case pretty simple: It's intended for
> >> early boot for very simplistic environments (before the rest of the
> >> kernel is up, etc). Keeping the SBI console around beyond early boot,
> >> and somehow trying to optimize for it for those use cases is a
> >> misdirected effort; that's what native drivers are for.
> >
> >  spike (which is only around 7,000 lines of code) doesn't have native
> > drivers, and qemu is too heavy-duty to consider adding custom
> > extensions and experimental research onto.
> >
> >  with nothing in spike *other* than the serial console, it's the only
> > way in and out.
> >
> >  l.
>
> Anything more than a main/debug console is too much for the SBI, its
> goal is to be used early on in the boot process until the OS or the
> bare metal app takes control.

 nooo, that's just _one_ use to which it's being put.

> Having multiple serial lines through
> the SBI for things like PPP, UPS, virtual consoles and all the stuff
> you mentioned is out of scope.

 why?

> Boot an OS and use the standard UART
> drivers for accessing the serial lines. If there are no drivers
> or support on spike, it's open source !

 this is a common misconception that "because it's open source anyone
can do what they want".  code costs money.  servers to host code cost
money.  answering the emails where people expect "free" support
because you're hosting the only public version of that server costs
money.

 i'm an ethical libre developer: i can't go footing the bill for other
people to sponge off my efforts all the time, i've had 20 years of
people doing that and i'm f*****g well not putting up with it on this
project.

 so no, mick, sorry, not buying the argument "it's open source".

l.
