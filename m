From: robert.jarzmik@free.fr (Robert Jarzmik)
Date: Wed, 07 Feb 2018 10:28:11 +0100
Subject: [PATCH 00/20] Remove references to undefined symbols and fix two
 potential bugs
In-Reply-To: <CAFkk2KRafUf3ki2R7B1pE_wzYkYn-OdeqLnvL0kScSxdzDMEXw@mail.gmail.com>
 (Ulf Magnusson's message of "Mon, 5 Feb 2018 03:08:24 +0100")
References: <20180205012146.23981-1-ulfalizer@gmail.com>
 <CAFkk2KRafUf3ki2R7B1pE_wzYkYn-OdeqLnvL0kScSxdzDMEXw@mail.gmail.com>
Message-ID: <87lgg587ys.fsf@belgarion.home>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Ulf Magnusson <ulfalizer@gmail.com> writes:

> The symbol AC97_BUS_NEW in sound/ac97/Kconfig selects the globally
> undefined symbol AC97.
>
> It doesn't seem to simply be a misspelling of AC97_BUS, because then
> the dependencies of AC97_BUS_COMPAT would be impossible to satisfy.
You're correct.

I don't know what happened to me when coding this, but you can safely remove
this useless select statement.

Cheers.

-- 
Robert
