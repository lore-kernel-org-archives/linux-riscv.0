From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sat, 10 Nov 2018 19:59:42 +0200
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
Message-ID: <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-11-10 19:47, Luke Kenneth Casson Leighton ??????:
> On Sat, Nov 10, 2018 at 5:42 PM Olof Johansson <olof@lixom.net> wrote:
> 
>> The case of console is in this case pretty simple: It's intended for
>> early boot for very simplistic environments (before the rest of the
>> kernel is up, etc). Keeping the SBI console around beyond early boot,
>> and somehow trying to optimize for it for those use cases is a
>> misdirected effort; that's what native drivers are for.
> 
>  spike (which is only around 7,000 lines of code) doesn't have native
> drivers, and qemu is too heavy-duty to consider adding custom
> extensions and experimental research onto.
> 
>  with nothing in spike *other* than the serial console, it's the only
> way in and out.
> 
>  l.

Anything more than a main/debug console is too much for the SBI, its
goal is to be used early on in the boot process until the OS or the
bare metal app takes control. Having multiple serial lines through
the SBI for things like PPP, UPS, virtual consoles and all the stuff
you mentioned is out of scope. Boot an OS and use the standard UART
drivers for accessing the serial lines. If there are no drivers
or support on spike, it's open source ! Also you may always use
the vendor specific SBI that Atish proposes here for adding that
functionality, having this on the base SBI is not the right
approach IMHO.

Regards,
Nick
