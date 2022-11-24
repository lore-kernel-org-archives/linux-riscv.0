Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22916C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 06:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3azHitGJwbC+oo/X/7/MMUFs1FXmod9x7SBRd6dk42E=; b=zA6xo09JjHSwHi
	lLZ0Nux9nvGvrK/BTMGftGowtjevmhRdKhEc7Ytq4iSruRmQVttkHK3Va5kVadK8/pgd3iF1wv9hb
	L/WTsOPvLsMzrpUPaIBgamekBhdkbUgrV8u6KCF05wqN64222R7qvAwDU6P8t1JsYFP7E7Ag5tOf+
	z+nlkeXdPYUCwTteMZqiRSkEsVSUFDb+oHJvmZLrTKEbCpIf/R7oTKWVjiI+r/d1PZ8ByeV6/jK7a
	cjNLfy1c6tWpfUblv16ODTBNBP4bMXgPAu1PcYSlUf7cxz6wdLCOSAJ2L92hj7LI80vwtlO2n9kKt
	pKF76v0v6byg/s68GM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy5ky-005i4a-EO; Thu, 24 Nov 2022 06:30:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy5ku-005i1T-KU
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 06:30:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EB3061F69;
	Thu, 24 Nov 2022 06:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B513BC433D6;
	Thu, 24 Nov 2022 06:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669271437;
	bh=LSSfW3Zh2RwJhUxrBUj2wRpVCu4TImcNtfrvTVyJ6T0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=dIkR6A+6/KlvAkLyhTrsAdN67t8IlIYzfUMxh+erkNGSTZJBOtkPJOLVPEiqCVE0K
	 Qgt4gK9at3st/MI0LmKN+3P2eBTcAxbdLwfGI3Tb7nc2uiGxyD48JXJJRrvFZ8R9aa
	 fPdEwbDplC0tLgctsPvyiAXIdMJP7kjL0uhOsouYke6/go/AJQrD0XSemw/mx7k7ap
	 OFRll7F6TFUhemoSAZgzma0YPPkDKADiaTAHeTxv8AdrO0oi9Go6VFaL6lc5HlWncP
	 YW8olexFs9306wN2rPZc5sI/nkxnkmriuaGuCuIyV/cdJkVhT5fQ2DNELpmj3pS/as
	 MRJm9gOwhYnrA==
Date: Thu, 24 Nov 2022 06:30:35 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, Deepak Gupta <debug@rivosinc.com>,
 palmer@dabbelt.com
CC: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: VMAP_STACK overflow detection thread-safe
User-Agent: K-9 Mail for Android
In-Reply-To: <20221124005006.1788315-1-debug@rivosinc.com>
References: <20221124005006.1788315-1-debug@rivosinc.com>
Message-ID: <A190DD6B-18A3-4DFE-AF8B-D5D50B6B6409@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_223040_810259_DF87AC10 
X-CRM114-Status: GOOD (  18.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey Deepak,
Guo Ren s issues aside, there's some process bits here.

On 24 November 2022 00:50:06 GMT, Deepak Gupta <debug@rivosinc.com> wrote:
>commit 31da94c25aea835ceac00575a9fd206c5a833fed added support for

Please check the documentation for how to format commit references in patch text.
As a reader, a hash requires access to a git tree to do anything with.
Id show you the format but I am on my phone ;)

>CONFIG_VMAP_STACK. If overflow is detected, CPU switches to `shadow_stack`
>temporarily before switching finally to per-cpu `overflow_stack`.
>
>If two CPUs/harts are racing and end up in over flowing kernel stack, one
>or both will end up corrupting each other state because `shadow_stack` is
>not per-cpu.
>
>Following are the changes in this patch
>
> - Defines an asm macro to obtain per-cpu symbols in destination
>   register.
> - Computing per-cpu symbol requires a temporary register. When stack is
>   out of question, a place is needed to spill a register. `thread_info`
>   is good location to have spill register.
> - In entry.S when overflow is detected x31 is spilled into thread_info.
>   x31 is used as temp reg for asm macro to locate per-cpu overflow stack
>
>Other relevant disccussion on this
>https://lore.kernel.org/linux-riscv/Y347B0x4VUNOd6V7@xhacker/T/#t

Link: foo

>
>Tested by `echo EXHAUST_STACK > /sys/kernel/debug/provoke-crash/DIRECT`
>
>[  286.223273] Insufficient stack space to handle exception!/debug/provoke-crash/DIRECT
>[  286.223878] Task stack:     [0xff20000010a98000..0xff20000010a9c000]
>[  286.224411] Overflow stack: [0xff600001f7d98370..0xff600001f7d99370]
>[  286.226057] CPU: 1 PID: 205 Comm: bash Not tainted 6.1.0-rc2-00001-g328a1f96f7b9 #34
>[  286.227139] Hardware name: riscv-virtio,qemu (DT)
>[  286.228000] epc : __memset+0x60/0xfc
>[  286.229299]  ra : recursive_loop+0x48/0xc6 [lkdtm]
>[  286.231457] epc : ffffffff808de0e4 ra : ffffffff0163a752 sp : ff20000010a97e80
>[  286.232207]  gp : ffffffff815c0330 tp : ff600000820ea280 t0 : ff20000010a97e88
>[  286.233584]  t1 : 000000000000002e t2 : 3233206874706564 s0 : ff20000010a982b0
>[  286.234293]  s1 : 0000000000000012 a0 : ff20000010a97e88 a1 : 0000000000000000
>[  286.234998]  a2 : 0000000000000400 a3 : ff20000010a98288 a4 : 0000000000000000
>[  286.235697]  a5 : 0000000000000000 a6 : fffffffffffe43f0 a7 : 00007fffffffffff
>[  286.236384]  s2 : ff20000010a97e88 s3 : ffffffff01644680 s4 : ff20000010a9be90
>[  286.237743]  s5 : ff600000842ba6c0 s6 : 00aaaaaac29e42b0 s7 : 00fffffff0aa3684
>[  286.238691]  s8 : 00aaaaaac2978040 s9 : 0000000000000065 s10: 00ffffff8a7cad10
>[  286.239591]  s11: 00ffffff8a76a4e0 t3 : ffffffff815dbaf4 t4 : ffffffff815dbaf4
>[  286.240537]  t5 : ffffffff815dbab8 t6 : ff20000010a9bb48
>[  286.241540] status: 0000000200000120 badaddr: ff20000010a97e88 cause: 000000000000000f
>[  286.242979] Kernel panic - not syncing: Kernel stack overflow
>[  286.244106] CPU: 1 PID: 205 Comm: bash Not tainted 6.1.0-rc2-00001-g328a1f96f7b9 #34
>[  286.245276] Hardware name: riscv-virtio,qemu (DT)
>[  286.245929] Call Trace:
>[  286.246954] [<ffffffff80006754>] dump_backtrace+0x30/0x38
>[  286.247813] [<ffffffff808de798>] show_stack+0x40/0x4c
>[  286.248429] [<ffffffff808ea2a8>] dump_stack_lvl+0x44/0x5c
>[  286.249439] [<ffffffff808ea2d8>] dump_stack+0x18/0x20
>[  286.250056] [<ffffffff808dec06>] panic+0x126/0x2fe
>[  286.250642] [<ffffffff800065ea>] walk_stackframe+0x0/0xf0
>[  286.251357] [<ffffffff0163a752>] recursive_loop+0x48/0xc6 [lkdtm]
>[  286.253321] SMP: stopping secondary CPUs
>[  286.256724] ---[ end Kernel panic - not syncing: Kernel stack overflow ]---

For stack traces, especially long ones, please cut out the timestamps.


>Fixes: 31da94c25aea835ceac00575a9fd206c5a833fed

https://gist.githubusercontent.com/conor-pwbot/8882fc7ef7cd4fe833774574fbf509f5/raw/d360ec7aebfaa6c2d043e9bd87f59745ad6a4c85/desc

Please use the correct format for fixes tags.

>Cc: Guo Ren <guoren@kernel.org>
>Cc: Jisheng Zhang <jszhang@kernel.org>
>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>

All of the tags need to be in one block, so:

Link:
Fixes:
SoB:

Thanks,
Conor.

>---
> arch/riscv/include/asm/asm.h         | 11 ++++++
> arch/riscv/include/asm/thread_info.h |  3 ++
> arch/riscv/kernel/asm-offsets.c      |  4 +++
> arch/riscv/kernel/entry.S            | 54 ++++------------------------
> arch/riscv/kernel/traps.c            | 12 +------
> 5 files changed, 26 insertions(+), 58 deletions(-)
>
>diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>index 1b471ff73178..373eba843331 100644
>--- a/arch/riscv/include/asm/asm.h
>+++ b/arch/riscv/include/asm/asm.h
>@@ -69,6 +69,7 @@
> 
> #ifdef __ASSEMBLY__
> 
>+#include <asm/asm-offsets.h>
> /* Common assembly source macros */
> 
> /*
>@@ -80,6 +81,16 @@
> 	.endr
> .endm
> 
>+.macro asm_per_cpu dst sym tmp
>+	REG_L \tmp, TASK_TI_CPU_NUM(tp)
>+	slli \tmp, \tmp, 0x3
>+	la \dst, __per_cpu_offset
>+	add \dst, \dst, \tmp
>+	REG_L \tmp, 0(\dst)
>+	la \dst, \sym
>+	add \dst, \dst, \tmp
>+.endm
>+
> #endif /* __ASSEMBLY__ */
> 
> #endif /* _ASM_RISCV_ASM_H */
>diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>index 67322f878e0d..7e17dc07cf11 100644
>--- a/arch/riscv/include/asm/thread_info.h
>+++ b/arch/riscv/include/asm/thread_info.h
>@@ -65,6 +65,9 @@ struct thread_info {
> 	 */
> 	long			kernel_sp;	/* Kernel stack pointer */
> 	long			user_sp;	/* User stack pointer */
>+#ifdef CONFIG_VMAP_STACK
>+	long			spill_reg;      /* per cpu scratch space to spill a single register */
>+#endif
> 	int			cpu;
> };
> 
>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>index df9444397908..bed3c83bfb8f 100644
>--- a/arch/riscv/kernel/asm-offsets.c
>+++ b/arch/riscv/kernel/asm-offsets.c
>@@ -38,6 +38,10 @@ void asm_offsets(void)
> 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> 
>+	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>+#ifdef CONFIG_VMAP_STACK
>+	OFFSET(TASK_TI_SPILL_REG, task_struct, thread_info.spill_reg);
>+#endif
> 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
> 	OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);
>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>index b9eda3fcbd6d..12f285cec136 100644
>--- a/arch/riscv/kernel/entry.S
>+++ b/arch/riscv/kernel/entry.S
>@@ -10,9 +10,11 @@
> #include <asm/asm.h>
> #include <asm/csr.h>
> #include <asm/unistd.h>
>+#include <asm/page.h>
> #include <asm/thread_info.h>
> #include <asm/asm-offsets.h>
> #include <asm/errata_list.h>
>+#include <linux/sizes.h>
> 
> #if !IS_ENABLED(CONFIG_PREEMPTION)
> .set resume_kernel, restore_all
>@@ -404,54 +406,12 @@ handle_syscall_trace_exit:
> 
> #ifdef CONFIG_VMAP_STACK
> handle_kernel_stack_overflow:
>-	la sp, shadow_stack
>-	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>+	REG_S x31, TASK_TI_SPILL_REG(tp)
>+	asm_per_cpu sp, overflow_stack, x31
>+	li x31, OVERFLOW_STACK_SIZE
>+	add sp, sp, x31
>+	REG_L x31, TASK_TI_SPILL_REG(tp)
> 
>-	//save caller register to shadow stack
>-	addi sp, sp, -(PT_SIZE_ON_STACK)
>-	REG_S x1,  PT_RA(sp)
>-	REG_S x5,  PT_T0(sp)
>-	REG_S x6,  PT_T1(sp)
>-	REG_S x7,  PT_T2(sp)
>-	REG_S x10, PT_A0(sp)
>-	REG_S x11, PT_A1(sp)
>-	REG_S x12, PT_A2(sp)
>-	REG_S x13, PT_A3(sp)
>-	REG_S x14, PT_A4(sp)
>-	REG_S x15, PT_A5(sp)
>-	REG_S x16, PT_A6(sp)
>-	REG_S x17, PT_A7(sp)
>-	REG_S x28, PT_T3(sp)
>-	REG_S x29, PT_T4(sp)
>-	REG_S x30, PT_T5(sp)
>-	REG_S x31, PT_T6(sp)
>-
>-	la ra, restore_caller_reg
>-	tail get_overflow_stack
>-
>-restore_caller_reg:
>-	//save per-cpu overflow stack
>-	REG_S a0, -8(sp)
>-	//restore caller register from shadow_stack
>-	REG_L x1,  PT_RA(sp)
>-	REG_L x5,  PT_T0(sp)
>-	REG_L x6,  PT_T1(sp)
>-	REG_L x7,  PT_T2(sp)
>-	REG_L x10, PT_A0(sp)
>-	REG_L x11, PT_A1(sp)
>-	REG_L x12, PT_A2(sp)
>-	REG_L x13, PT_A3(sp)
>-	REG_L x14, PT_A4(sp)
>-	REG_L x15, PT_A5(sp)
>-	REG_L x16, PT_A6(sp)
>-	REG_L x17, PT_A7(sp)
>-	REG_L x28, PT_T3(sp)
>-	REG_L x29, PT_T4(sp)
>-	REG_L x30, PT_T5(sp)
>-	REG_L x31, PT_T6(sp)
>-
>-	//load per-cpu overflow stack
>-	REG_L sp, -8(sp)
> 	addi sp, sp, -(PT_SIZE_ON_STACK)
> 
> 	//save context to overflow stack
>diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>index f3e96d60a2ff..eef3a87514c7 100644
>--- a/arch/riscv/kernel/traps.c
>+++ b/arch/riscv/kernel/traps.c
>@@ -208,18 +208,8 @@ int is_valid_bugaddr(unsigned long pc)
> #endif /* CONFIG_GENERIC_BUG */
> 
> #ifdef CONFIG_VMAP_STACK
>-static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>+DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
> 		overflow_stack)__aligned(16);
>-/*
>- * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
>- * to get per-cpu overflow stack(get_overflow_stack).
>- */
>-long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
>-asmlinkage unsigned long get_overflow_stack(void)
>-{
>-	return (unsigned long)this_cpu_ptr(overflow_stack) +
>-		OVERFLOW_STACK_SIZE;
>-}
> 
> asmlinkage void handle_bad_stack(struct pt_regs *regs)
> {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
