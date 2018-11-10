From: lkcl@lkcl.net (Luke Kenneth Casson Leighton)
Date: Sat, 10 Nov 2018 17:51:47 +0000
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <70910d55a0046d9ddc7d4308cb56e581@mailhost.ics.forth.gr>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <70910d55a0046d9ddc7d4308cb56e581@mailhost.ics.forth.gr>
Message-ID: <CAPweEDyEk4=hd3_o2g3L4azcuZxB0KnFGBn3jWz9AT1F+mFwgQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Nov 10, 2018 at 5:45 PM Nick Kossifidis <mick@ics.forth.gr> wrote:

> >  yes, it should [have]: my feeling is, it's a little late in the game
> > given that it's almost certainly baked into pre-existing hardware, by
> > now, so the next best thing is a new function call.
> >
> > l.
>
> Late in the game ? Who's game ? Is there any "standard" way out there
> for mapping consoles to serial line indices ?

 any implementor that has put a SBI v1.0 into a boot ROM in production
silicon (or even has put it into a design that's already had USD $5m+
of engineering time and testing done), would be absolutely screwed by
changes to v1.0 SBI.

 if however... if a way could be found to negotiate v1.0 being as-is,
and v2.0 declaring that there was an extra argument? yeah that would
work.

 i don't mind either way: i just really need to not have to have the
financial burden of augmenting and maintaining special ports of half a
dozen applications including minicom.

l.
