From: zongbox@gmail.com (Zong Li)
Date: Thu, 21 Jun 2018 18:13:02 +0800
Subject: [PATCH 5/5] RISC-V: Use fixed width integer types for 32-bit
 compatible
In-Reply-To: <20180621064322.GE19319@infradead.org>
References: <cover.1529506497.git.zong@andestech.com>
 <37a6523947397cd72320676030b96926e373d05a.1529506497.git.zong@andestech.com>
 <20180621064322.GE19319@infradead.org>
Message-ID: <CA+ZOyagYq0Kbsbxe20MwjeArxRP-fZtQNLZUbCdM3JSPssQuvg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Christoph Hellwig <hch@infradead.org> ? 2018?6?21? ?? ??2:43???
>
> On Thu, Jun 21, 2018 at 09:41:46AM +0800, Zong Li wrote:
> > Use fixed width integer types for print format on 32/64 bit
> > to fix warning about format compatible.
> >
> > Like inttypes.h, but more simpler for RISC-V usage.
> >
> > Signed-off-by: Zong Li <zong@andestech.com>
> > ---
> >  arch/riscv/include/asm/format.h | 20 ++++++++++++++++++++
> >  arch/riscv/kernel/module.c      | 13 +++++++------
> >  2 files changed, 27 insertions(+), 6 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/format.h
> >
> > diff --git a/arch/riscv/include/asm/format.h b/arch/riscv/include/asm/format.h
> > new file mode 100644
> > index 000000000000..9b68ca7fac46
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/format.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright (C) 2018 Andes Technology Corporation */
> > +
> > +#ifndef _ASM_RISCV_FORMAT_H
> > +#define _ASM_RISCV_FORMAT_H
> > +
> > +#if __riscv_xlen == 64
> > +#define __PRI_PREFIX "ll"
> > +#else
> > +#define __PRI_PREFIX
> > +#endif
> > +
> > +#define PRIdX        __PRI_PREFIX "d"
> > +#define PRIiX        __PRI_PREFIX "i"
> > +#define PRIuX        __PRI_PREFIX "u"
> > +#define PRIoX        __PRI_PREFIX "o"
> > +#define PRIxX        __PRI_PREFIX "x"
> > +#define PRIXX        __PRI_PREFIX "X"
> > +
> > +#endif /* _ASM_RISCV_FORMAT_H */
>
> If you want these prefixed submit them to the core kernel, not
> under asm/ for RISC-V.
>

Maybe I can move to core kernel after this patch?
And I think I can rename the "PRIdX" to "PRIdXELF" to avoid ambiguous
in C definition.


> >
> >  static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
> >  {
> >       if (v != (u32)v) {
> > -             pr_err("%s: value %016llx out of range for 32-bit field\n",
> > +             pr_err("%s: value %016" PRIxX "out of range for 32-bit field\n",
> >                      me->name, v);
> >               return -EINVAL;
>
> But in general Linux uXX and sXX values are always the same underlying
> fundamental C type.  What is the mismatch here?
>

This relocation type was added by  Andreas, and there is some
discussions on the mail list
(ref: http://lists.infradead.org/pipermail/linux-riscv/2018-June/000706.html)

As I see it, there is truncate situation on 64-bit system, or maybe
there is no R_RISCV_32 relocation
type on 64-bit system?
