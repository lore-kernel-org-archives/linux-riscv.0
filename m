From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 15 Jun 2018 13:38:06 -0700 (PDT)
Subject: On Supporting no-FPU machines
In-Reply-To: <20180613062653.GA14518@andestech.com>
Message-ID: <mhng-21cd35e5-8145-40c6-8d17-7b734d5f6969@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 12 Jun 2018 23:26:53 PDT (-0700), alankao at andestech.com wrote:
> Hi Palmer,
>
> We would like to run Linux on a RISC-V machine that has no F and D
> extension, but we found some problem.  We would like to have your
> feedback on this.
>
> When context-switching, fstate_restore is always called, and then
> regs->sstatus.FS([13:14]) is checked; if the value is anything other
> than SR_FS_OFF, the kernel restores the floating-point state for the
> next process to be switched to.
>
> However, when a process is loaded, its regs->sstatus.FS is set to
> SR_FS_INITIAL (in start_thread), so it is going to lauch __fstate_restore
> (in __switch_to_aux) anyway.  On a board that doesn't have FPU, this causes
> a following problem because flds are viewed as illegal instructions.
>
> A quick work-around is something like this:
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index cb20913..96159e1 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -83,7 +83,11 @@ void show_regs(struct pt_regs *regs)
>  void start_thread(struct pt_regs *regs, unsigned long pc,
>         unsigned long sp)
>  {
> +#ifdef __riscv_flen
>         regs->sstatus = SR_SPIE /* User mode, irqs on */ | SR_FS_INITIAL;
> +#else
> +       regs->sstatus = SR_SPIE | SR_FS_OFF;
> +#endif
>         regs->sepc = pc;
>         regs->sp = sp;
>         set_fs(USER_DS);
>
> This prevents the flds in __fstate_restore if choosing an appropriate toolchain.
> The condition
>
> (regs->sstatus & SR_FS) != SR_FS_OFF
>
> in fstate_restore will never be taken.
> Actually, we don't even need those floating-point routines for no-FPU boards.
> We would need a larger patch to make those FP code inside some __riscv_flen
> pre-processor sections.
>
> Do you think this is going to be a right direction to support no-FPU machines?

Ooh, I think this might be an Andrew question.  I'd been operating under the 
assumption that sstatus.fs was a WARL field, with the result being that writing 
sstatus.fs to initial would have no effect on a machine with no floating point 
support.  This is the behavior that Rocket has, but I can't actually find this 
definition anywhere in the ISA spec, though.  If the spec is the way I've 
interpreted it, then we can fix up start_thread by just round tripping the 
value through sstatus to see what the machine actually supports.

Otherwise we'll have to have a kernel config option to enable/disable the FPU,
and while that's not a big deal it's slightly nicer if the same kernel works on
FPU and no-FPU systems.

Andrew: am I missing something?

 Alan
