From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Wed, 7 Nov 2018 19:30:03 +0100
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <mhng-3c26b2fb-0c11-42f2-9026-1113b200a7b2@palmer-si-x1c4>
References: <CAK8P3a3JcztCSYBuu5ZJXaV83VNLv_1v3v-EKMR+tC1oOsQesw@mail.gmail.com>
 <mhng-3c26b2fb-0c11-42f2-9026-1113b200a7b2@palmer-si-x1c4>
Message-ID: <CAEn-LTpQ5uTte2bBrEs3uLKtsckkKPUOP+jHw5k-DFAwGCS3WA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
> > On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> >> Marcin Juszkiewicz reported issues while generating syscall table for riscv
> >> using 4.20-rc1. The patch refactors our unistd.h files to match some other
> >> architectures.
> >>
> >> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT
> >> - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
> >> - Adjust kernel asm/unistd.h
> >>
> >> So now asm/unistd.h UAPI header should show all syscalls for riscv.
> >>
> >> Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
> >> generated asm/unistd.h UAPI header thus user didn't see:
> >>
> >> - __NR_riscv_flush_icache
> >> - __NR_newfstatat
> >> - __NR_fstat
> >>
> >> which are supported by riscv kernel.
> >>
> >> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> >> Cc: Guenter Roeck <linux@roeck-us.net>
> >
> > Thanks for addressing this, your patch correctly fixes riscv64, and
> > I should have noticed the mistake when I originally merged the
> > broken patch.
> >
> > However, looking closer I found another problem with the original
> > patch that your fix does not address:
> >
> > __ARCH_WANT_NEW_STAT should only be set on 64-bit
> > architectures.
> >
> > For a 32-bit architecture, we only want __ARCH_WANT_STAT64 if
> > any. For 64-bit architectures with compat mode, we still need to
> > set __ARCH_WANT_STAT64 from the non-uapi file so we get
> > the syscall implementation.
> >
> > If we don't care about the riscv32 ABI changing yet, we can
> > decide to leave out __ARCH_WANT_STAT64 here, and require
> > glibc to implement it using statx() like any new architecture.
> > stat64 is not y2038 safe, and statx replaces it because of that.
>
> Thanks for pointing this out.   A while ago we decided the rv32 ABI was
> "slushy": it can change if it has a good reason to.  Right now the only planned
> changes are the y2038 changes, which I consider this a part of.  For some
> reason I thought we'd already done this, but since we haven't then I think it
> should go in sooner rather than later -- that will help the glibc guys get
> everything lined up.
>
> The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
> That's progressing well, with one last blocking issue related to some of our
> floating-point emulation routines before we can submit the port.  This should
> give us ample time to line up the ABIs correctly so everything works.
>
> So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
>

Then if you agree I could do and send v2:

+#ifdef __LP64__
+#define __ARCH_WANT_NEW_STAT
+#endif /* __LP64__ */

Cannot use CONFIG_64BIT as in user space nothing defines it.
Alternatively I could
check for __riscv_xlen == 64.

I found _LP64 and __LP64__ being used in kernel, incl. include/uapi/linux/rseq.h

david
