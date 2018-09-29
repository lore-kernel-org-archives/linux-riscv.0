From: zongbox@gmail.com (Zong Li)
Date: Sat, 29 Sep 2018 11:40:37 +0800
Subject: [PATCH v2 0/5] Fix some bugs on RV32 build fail and issue
In-Reply-To: <mhng-1934187c-6fab-4000-af19-23a80173669d@palmer-si-x1c4>
References: <cover.1537949825.git.zongbox@gmail.com>
 <mhng-1934187c-6fab-4000-af19-23a80173669d@palmer-si-x1c4>
Message-ID: <CA+ZOyagkLaikQjcwJzFumOs=o2Bhu0nzRcdb3a8fW7nT-HfprQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Palmer Dabbelt <palmer@sifive.com> ? 2018?9?29? ?? ??7:52???
>
> On Wed, 26 Sep 2018 01:31:09 PDT (-0700), zongbox at gmail.com wrote:
> > This patches contain the modificaion as follows:
> > 1. Fix up the building fail on RV32.
> > 2. Add umoddi3 and udivmoddi4 functions for RV32.
> > 3. Fix ioremap problem on RV32.
> >
> > Changes in v2:
> >  - Retain the copyright notices from libgcc in umoddi3.c and udivmoddi4.c.
> >
> > Vincent Chen (1):
> >   RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap
> >
> > Zong Li (4):
> >   RISC-V: Build tishift only on 64-bit
> >   RISC-V: Use swiotlb on RV64 only
> >   lib: Add umoddi3 and udivmoddi4 of GCC library routines
> >   RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
> >
> >  arch/riscv/Kconfig        |   1 +
> >  arch/riscv/kernel/setup.c |   3 +
> >  arch/riscv/lib/Makefile   |   3 +-
> >  arch/riscv/mm/ioremap.c   |   2 +-
> >  lib/Kconfig               |   3 +
> >  lib/Makefile              |   1 +
> >  lib/udivmoddi4.c          | 309 ++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/umoddi3.c             |  34 +++++
> >  8 files changed, 354 insertions(+), 2 deletions(-)
> >  create mode 100644 lib/udivmoddi4.c
> >  create mode 100644 lib/umoddi3.c
>
> I like what this does, but there's a license issue here that Christoph pointed
> out.  It'd be great to have RV32I systems booting 4.19, do you think there's a
> chance you can sort this out next week so we can get it into the last RC?  That
> would help with the rv32i glibc process, as we'll actually be able to boot an
> upstream kernel.
>
> It looks like the functions we have an issue with come from libgcc2.c, which
> doesn't change very much.  As far as I can tell we might be able to get away
> with these functions from 4.2.1, which was licensed under the GPLv2.  Here's
> the relevant functions on GCC's github mirror
>
>     https://github.com/gcc-mirror/gcc/blob/gcc-4_2_1-release/gcc/libgcc2.c#L559
>     https://github.com/gcc-mirror/gcc/blob/gcc-4_2_1-release/gcc/libgcc2.c#L844
>
> These look very similar to what you send out.  As far as I can tell, if you
> base your code on the GPLv2 version then this should be fine to include.
>
> Thanks!

Thanks for the help and useful information. I will modify the
implementation and submit the next version.
