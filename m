From: lkcl@lkcl.net (Luke Kenneth Casson Leighton)
Date: Sat, 10 Nov 2018 19:33:21 +0000
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAP6exYLbZ5yBKJduU468MwXSqA+Nm6dYKj9ig=yM9e0d64nK0g@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
 <CAP6exYLbZ5yBKJduU468MwXSqA+Nm6dYKj9ig=yM9e0d64nK0g@mail.gmail.com>
Message-ID: <CAPweEDy0804DsQeXt0qHBvwxGQ=gbfb+x+Hz7duXQ+_uA=u=5w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Nov 10, 2018 at 6:02 PM ron minnich <rminnich@gmail.com> wrote:

> Actually, as long as the option remains to let the kernel replace the
> SBI with something else, I'm not that worried about what vendors put
> in it. But that option needs to remain there.

 i remember you saying, when the boot discussion came up a couple
weeks ago, and agree absolutely: the option in real hardware to shut
off and replace whatever's got you up and running is critical.

 there's a huge range of uses to which SBI is (and can be) put: i
threw some ideas out there, i feel it's important to bear that in
mind.  it's not just used for booting, it's also got simulation,
debugging, development and critical first silicon bring-up potential,
out-of-band remote power management potential uses, virtual management
potential, and shed-loads more.

l.
