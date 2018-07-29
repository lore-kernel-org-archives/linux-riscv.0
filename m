From: joe@perches.com (Joe Perches)
Date: Sun, 29 Jul 2018 09:31:52 -0700
Subject: [PATCH V2] riscv: Convert uses of REG_FMT to %p
In-Reply-To: <CAHp75VcvdAVWCuUpj+aQeD5aEU1LM1SjOPJ7_1hdQnQiya36SA@mail.gmail.com>
References: <e14dedc721b7aed1cf3ff1bdbc09014c0131c276.1532795905.git.joe@perches.com>
 <CAHp75VcvdAVWCuUpj+aQeD5aEU1LM1SjOPJ7_1hdQnQiya36SA@mail.gmail.com>
Message-ID: <fe87537776a8a22676536babd2a8eba3c8667705.camel@perches.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sun, 2018-07-29 at 17:21 +0300, Andy Shevchenko wrote:
> On Sat, Jul 28, 2018 at 7:39 PM, Joe Perches <joe@perches.com> wrote:
> > Use %p pointer output instead of REG_FMT and cast the unsigned longs to
> > (void *) to avoid exposing kernel addresses.
> > 
> > Miscellanea:
> > 
> > o Convert pr_cont to printk(KERN_DEFAULT as these uses are
> >   new logging lines and not previous line continuations
> > o Remove the now unused REG_FMT defines
> > +       pr_alert("Unable to handle kernel %s at virtual address %p\n",
> > +                (addr < PAGE_SIZE) ? "NULL pointer dereference" :
> > +                "paging request", (void *)addr);
> 
> Hmm... This is what printf() should take care of.

Why is that so here?

Here this is just a description of the address.
It's not actually dereferencing the address.

> Petr, what is the status of your series to unify this kind of
> addresses to be printed?
