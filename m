From: olof@lixom.net (Olof Johansson)
Date: Sat, 10 Nov 2018 10:02:53 -0800
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
Message-ID: <CAOesGMic7iV69zeBFPDo6P+WwSGcogKG1DE-rOS_U9VCoC209A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Nov 10, 2018 at 9:47 AM Luke Kenneth Casson Leighton
<lkcl@lkcl.net> wrote:
>
> On Sat, Nov 10, 2018 at 5:42 PM Olof Johansson <olof@lixom.net> wrote:
>
> > The case of console is in this case pretty simple: It's intended for
> > early boot for very simplistic environments (before the rest of the
> > kernel is up, etc). Keeping the SBI console around beyond early boot,
> > and somehow trying to optimize for it for those use cases is a
> > misdirected effort; that's what native drivers are for.
>
>  spike (which is only around 7,000 lines of code) doesn't have native
> drivers, and qemu is too heavy-duty to consider adding custom
> extensions and experimental research onto.
>
>  with nothing in spike *other* than the serial console, it's the only
> way in and out.

I'll repeat myself:

"trying to optimize for those use cases is a misdirected effort".
Trying to optimize your experience on spike at the cost of simplicity
for everybody else is the wrong thing to do.


-Olof
