From: lkcl@lkcl.net (Luke Kenneth Casson Leighton)
Date: Sat, 10 Nov 2018 17:42:35 +0000
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
Message-ID: <CAPweEDzZGEi87o5bBPeU6c7qHCtCJNcOHL0Uz1uUOPQak56X_Q@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Nov 10, 2018 at 5:39 PM Samuel Falvo II <sam.falvo@gmail.com> wrote:

> on sat, nov 10, 2018 at 8:46 am ron minnich <rminnich@gmail.com> wrote:
> > which is why i'm a bit unhappy to see this (to me) cancerous growth in
> > proposals for m- mode code. ppp in firmware? really? multiple serial
>
> i'm inclined to agree with the overall sentiment of the concerns
> raised herein (omitted for brevity), but i feel that it might go a bit
> too far.

 it's also not an appropriate argument.  nobody sensible would port a
POSIX pppd from userspace into boot-level firmware.  the argument also
ignores the dozens of other advantageous potential use-cases.

l.
