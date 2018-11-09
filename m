From: ldv@altlinux.org (Dmitry V. Levin)
Date: Sat, 10 Nov 2018 00:31:28 +0300
Subject: [PATCH 12/13] riscv: define syscall_get_arch()
In-Reply-To: <mhng-2fa4cce8-2365-4f36-a07e-5f9ad61cfb88@palmer-si-x1c4>
References: <20181109031712.GL21511@altlinux.org>
 <mhng-2fa4cce8-2365-4f36-a07e-5f9ad61cfb88@palmer-si-x1c4>
Message-ID: <20181109213128.GA1907@altlinux.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Nov 09, 2018 at 10:45:54AM -0800, Palmer Dabbelt wrote:
> On Thu, 08 Nov 2018 19:17:13 PST (-0800), ldv at altlinux.org wrote:
> > syscall_get_arch() is required to be implemented on all architectures
> > that use tracehook_report_syscall_entry() in order to extend
> > the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
> >
> > Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> > ---
> >  arch/riscv/include/asm/syscall.h | 6 ++++++
> >  include/uapi/linux/audit.h       | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index 8d25f8904c00..7e1e26ca7317 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -18,6 +18,7 @@
> >  #ifndef _ASM_RISCV_SYSCALL_H
> >  #define _ASM_RISCV_SYSCALL_H
> >
> > +#include <uapi/linux/audit.h>
> >  #include <linux/sched.h>
> >  #include <linux/err.h>
> >
> > @@ -99,4 +100,9 @@ static inline void syscall_set_arguments(struct task_struct *task,
> >  	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
> >  }
> >
> > +static inline int syscall_get_arch(void)
> > +{
> > +	return AUDIT_ARCH_RISCV;
> > +}
> > +
> >  #endif	/* _ASM_RISCV_SYSCALL_H */
> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index c4c8b131af48..ad4105c602a1 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -405,6 +405,7 @@ enum {
> >  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
> >  #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
> >  #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> > +#define AUDIT_ARCH_RISCV	(EM_RISCV|__AUDIT_ARCH_64BIT)
> >  #define AUDIT_ARCH_S390		(EM_S390)
> >  #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
> >  #define AUDIT_ARCH_SH		(EM_SH)
> 
> I think this is incorrect: EM_RISCV has 32-bit and 64-bit variants, and if I 
> understand what's going on here this is marking all RISC-V targets as 64-bit.  
> Since this is a userspace header, I think the right thing to switch on is 
> __riscv_xlen, which will be defined to either 32 or 64 depending on the base 
> ISA.
> We're also little endian.

OK, it means we need to introduce two different AUDIT_ARCH_ constants
for RISC-V.  Do you have any preferences for their names,
e.g. AUDIT_ARCH_RISCV and AUDIT_ARCH_RISCV64, or
AUDIT_ARCH_RISCV and AUDIT_ARCH_RISCV32, or
AUDIT_ARCH_RISCV64 and AUDIT_ARCH_RISCV32,
or anything else?


-- 
ldv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181110/3ad1d7cc/attachment.sig>
