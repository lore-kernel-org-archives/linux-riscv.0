From: andy.shevchenko@gmail.com (Andy Shevchenko)
Date: Sun, 29 Jul 2018 17:21:19 +0300
Subject: [PATCH V2] riscv: Convert uses of REG_FMT to %p
In-Reply-To: <e14dedc721b7aed1cf3ff1bdbc09014c0131c276.1532795905.git.joe@perches.com>
References: <e14dedc721b7aed1cf3ff1bdbc09014c0131c276.1532795905.git.joe@perches.com>
Message-ID: <CAHp75VcvdAVWCuUpj+aQeD5aEU1LM1SjOPJ7_1hdQnQiya36SA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Jul 28, 2018 at 7:39 PM, Joe Perches <joe@perches.com> wrote:
> Use %p pointer output instead of REG_FMT and cast the unsigned longs to
> (void *) to avoid exposing kernel addresses.
>
> Miscellanea:
>
> o Convert pr_cont to printk(KERN_DEFAULT as these uses are
>   new logging lines and not previous line continuations
> o Remove the now unused REG_FMT defines

> +       pr_alert("Unable to handle kernel %s at virtual address %p\n",

> +                (addr < PAGE_SIZE) ? "NULL pointer dereference" :
> +                "paging request", (void *)addr);

Hmm... This is what printf() should take care of.

Petr, what is the status of your series to unify this kind of
addresses to be printed?

-- 
With Best Regards,
Andy Shevchenko
