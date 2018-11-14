From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 14 Nov 2018 15:40:42 -0800 (PST)
Subject: [PATCH 1/2] riscv: add audit support
In-Reply-To: <CAHC9VhS4qqr888_-aS_y5jD7XHaiVG45tkEbEX1Y=pr0nFN69g@mail.gmail.com>
Message-ID: <mhng-09b7e83c-b82b-4428-af68-512af496a10b@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 13 Nov 2018 15:34:18 PST (-0800), paul at paul-moore.com wrote:
> On Tue, Nov 13, 2018 at 5:07 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> On Mon, 29 Oct 2018 03:48:53 PDT (-0700), david.abdurachmanov at gmail.com wrote:
>> > On RISC-V (riscv) audit is supported through generic lib/audit.c.
>> > The patch adds required arch specific definitions.
>> >
>> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>> > ---
>> >  arch/riscv/Kconfig                   |  1 +
>> >  arch/riscv/include/asm/ptrace.h      |  5 +++++
>> >  arch/riscv/include/asm/syscall.h     | 10 ++++++++++
>> >  arch/riscv/include/asm/thread_info.h |  6 ++++++
>> >  arch/riscv/kernel/entry.S            |  4 ++--
>> >  include/uapi/linux/audit.h           |  2 ++
>> >  6 files changed, 26 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index a344980287a5..8e6d404a4ed0 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -28,6 +28,7 @@ config RISCV
>> >       select GENERIC_STRNLEN_USER
>> >       select GENERIC_SMP_IDLE_THREAD
>> >       select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
>> > +     select HAVE_ARCH_AUDITSYSCALL
>> >       select HAVE_MEMBLOCK
>> >       select HAVE_MEMBLOCK_NODE_MAP
>> >       select HAVE_DMA_CONTIGUOUS
>> > diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
>> > index 2c5df945d43c..62c5e9d35596 100644
>> > --- a/arch/riscv/include/asm/ptrace.h
>> > +++ b/arch/riscv/include/asm/ptrace.h
>> > @@ -113,6 +113,11 @@ static inline void frame_pointer_set(struct pt_regs *regs,
>> >       SET_FP(regs, val);
>> >  }
>> >
>> > +static inline unsigned long regs_return_value(struct pt_regs *regs)
>> > +{
>> > +     return regs->a0;
>> > +}
>> > +
>> >  #endif /* __ASSEMBLY__ */
>> >
>> >  #endif /* _ASM_RISCV_PTRACE_H */
>> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
>> > index 8d25f8904c00..bba3da6ef157 100644
>> > --- a/arch/riscv/include/asm/syscall.h
>> > +++ b/arch/riscv/include/asm/syscall.h
>> > @@ -18,6 +18,7 @@
>> >  #ifndef _ASM_RISCV_SYSCALL_H
>> >  #define _ASM_RISCV_SYSCALL_H
>> >
>> > +#include <uapi/linux/audit.h>
>> >  #include <linux/sched.h>
>> >  #include <linux/err.h>
>> >
>> > @@ -99,4 +100,13 @@ static inline void syscall_set_arguments(struct task_struct *task,
>> >       memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
>> >  }
>> >
>> > +static inline int syscall_get_arch(void)
>> > +{
>> > +#ifdef CONFIG_64BIT
>> > +     return AUDIT_ARCH_RISCV64;
>> > +#else
>> > +     return AUDIT_ARCH_RISCV32;
>> > +#endif
>> > +}
>> > +
>> >  #endif       /* _ASM_RISCV_SYSCALL_H */
>> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>> > index f8fa1cd2dad9..1c9cc8389928 100644
>> > --- a/arch/riscv/include/asm/thread_info.h
>> > +++ b/arch/riscv/include/asm/thread_info.h
>> > @@ -80,13 +80,19 @@ struct thread_info {
>> >  #define TIF_RESTORE_SIGMASK  4       /* restore signal mask in do_signal() */
>> >  #define TIF_MEMDIE           5       /* is terminating due to OOM killer */
>> >  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
>> > +#define TIF_SYSCALL_AUDIT    7       /* syscall auditing */
>> >
>> >  #define _TIF_SYSCALL_TRACE   (1 << TIF_SYSCALL_TRACE)
>> >  #define _TIF_NOTIFY_RESUME   (1 << TIF_NOTIFY_RESUME)
>> >  #define _TIF_SIGPENDING              (1 << TIF_SIGPENDING)
>> >  #define _TIF_NEED_RESCHED    (1 << TIF_NEED_RESCHED)
>> > +#define _TIF_SYSCALL_TRACEPOINT      (1 << TIF_SYSCALL_TRACEPOINT)
>> > +#define _TIF_SYSCALL_AUDIT   (1 << TIF_SYSCALL_AUDIT)
>> >
>> >  #define _TIF_WORK_MASK \
>> >       (_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
>> >
>> > +#define _TIF_SYSCALL_WORK \
>> > +     (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
>> > +
>> >  #endif /* _ASM_RISCV_THREAD_INFO_H */
>> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> > index fa2c08e3c05e..2a6c2e7aaff3 100644
>> > --- a/arch/riscv/kernel/entry.S
>> > +++ b/arch/riscv/kernel/entry.S
>> > @@ -202,7 +202,7 @@ handle_syscall:
>> >       REG_S s2, PT_SEPC(sp)
>> >       /* Trace syscalls, but only if requested by the user. */
>> >       REG_L t0, TASK_TI_FLAGS(tp)
>> > -     andi t0, t0, _TIF_SYSCALL_TRACE
>> > +     andi t0, t0, _TIF_SYSCALL_WORK
>> >       bnez t0, handle_syscall_trace_enter
>> >  check_syscall_nr:
>> >       /* Check to make sure we don't jump to a bogus syscall number. */
>> > @@ -222,7 +222,7 @@ ret_from_syscall:
>> >       REG_S a0, PT_A0(sp)
>> >       /* Trace syscalls, but only if requested by the user. */
>> >       REG_L t0, TASK_TI_FLAGS(tp)
>> > -     andi t0, t0, _TIF_SYSCALL_TRACE
>> > +     andi t0, t0, _TIF_SYSCALL_WORK
>> >       bnez t0, handle_syscall_trace_exit
>> >
>> >  ret_from_exception:
>> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
>> > index 818ae690ab79..d0e037a96a7b 100644
>> > --- a/include/uapi/linux/audit.h
>> > +++ b/include/uapi/linux/audit.h
>> > @@ -399,6 +399,8 @@ enum {
>> >  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
>> >  #define AUDIT_ARCH_PPC64     (EM_PPC64|__AUDIT_ARCH_64BIT)
>> >  #define AUDIT_ARCH_PPC64LE   (EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>> > +#define AUDIT_ARCH_RISCV32   (EM_RISCV|__AUDIT_ARCH_LE)
>> > +#define AUDIT_ARCH_RISCV64   (EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>> >  #define AUDIT_ARCH_S390              (EM_S390)
>> >  #define AUDIT_ARCH_S390X     (EM_S390|__AUDIT_ARCH_64BIT)
>> >  #define AUDIT_ARCH_SH                (EM_SH)
>>
>> I can't seem to figure out how to dig the rest of the thread out of my inbox
>> (I'm in an airport), so I'm just replying here.
>>
>> I've added this to next-audit, which will soon filter into for-next.  I'm not
>> sure if this is 100% settled, but I can't find any issues with it so I think
>> it's best to get this out for testing.
>
> If you RISCV guys are happy, and it is passing the audit-testsuite
> (which I believe it is based on some brief discussions with David on
> Freenode), then I think it is okay from my point of view.

I haven't run the test suite personally, but I trust that David has done so if 
he said so (I remember having seen him say he did as well).

Thanks!
