From: pmladek@suse.com (Petr Mladek)
Date: Thu, 16 Aug 2018 10:48:53 +0200
Subject: [PATCH V2] riscv: Convert uses of REG_FMT to %p
In-Reply-To: <CAHp75VcvdAVWCuUpj+aQeD5aEU1LM1SjOPJ7_1hdQnQiya36SA@mail.gmail.com>
References: <e14dedc721b7aed1cf3ff1bdbc09014c0131c276.1532795905.git.joe@perches.com>
 <CAHp75VcvdAVWCuUpj+aQeD5aEU1LM1SjOPJ7_1hdQnQiya36SA@mail.gmail.com>
Message-ID: <20180816084853.plptubcgubpc5fm4@pathway.suse.cz>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sun 2018-07-29 17:21:19, Andy Shevchenko wrote:
> On Sat, Jul 28, 2018 at 7:39 PM, Joe Perches <joe@perches.com> wrote:
> > Use %p pointer output instead of REG_FMT and cast the unsigned longs to
> > (void *) to avoid exposing kernel addresses.
> >
> > Miscellanea:
> >
> > o Convert pr_cont to printk(KERN_DEFAULT as these uses are
> >   new logging lines and not previous line continuations
> > o Remove the now unused REG_FMT defines
> 
> > +       pr_alert("Unable to handle kernel %s at virtual address %p\n",
> 
> > +                (addr < PAGE_SIZE) ? "NULL pointer dereference" :
> > +                "paging request", (void *)addr);
> 
> Hmm... This is what printf() should take care of.
> 
> Petr, what is the status of your series to unify this kind of
> addresses to be printed?

Ah, I had to put the series on hold because of other urgent work and
vacations. But I am going to continue on it and resend it within next
weeks or so.

Best Regards,
Petr
