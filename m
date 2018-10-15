From: jimw@sifive.com (Jim Wilson)
Date: Mon, 15 Oct 2018 08:57:24 -0700
Subject: [PATCH] RISC-V: Add futex support.
In-Reply-To: <20181015083439.GA11826@infradead.org>
References: <20181012200350.5258-1-jimw@sifive.com>
 <20181015083439.GA11826@infradead.org>
Message-ID: <CAFyWVaZaXd8GZYSrMqZh+zQ+3CDghpumjo2ETezXcR93OXXSZg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 15, 2018 at 1:34 AM Christoph Hellwig <hch@infradead.org> wrote:
> > +#include <asm/asm.h>
> > +
> > +#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)           \
> > +{                                                                    \
> > +     uintptr_t __tmp;                                                \
> > +     if (__riscv_atomic) {                                           \
>
> __riscv_atomic doesn't exist anywhere in the kernel tree.

__riscv_atomic is a predefined macro from the compiler.  It is defined
when the target has atomic instructions, e.g. -march=rv64ia.  It is
not defined when the target has no atomic instructions, e.g.
-march=rv64i.  The idea here was that we only used atomic instructions
if the target has them.  I didn't think to check for a more proper
kernel solution.  I see that there is a CONFIG_RISCV_ISA_A so it looks
like I should be testing that instead.

I will work on a revised patch as per your suggestions.

Jim
