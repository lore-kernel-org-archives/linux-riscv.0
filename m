Return-Path: <SRS0=6bm6=KC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B7AC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 09:15:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C87861426
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C87861426
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZcLk5cbsakXjTxv6xcfD8nrID1tp+fb37YHebHjtElc=; b=NgqK+ekceselkCblfobMKnSpiK
	oLqUvtmYsrLtP5b7ebhJ4tMR+sxARl1NwAnkmW7lbp6lgphmjfYH1y7EJq7hmOUKJQN0QAGcHMsFe
	x95ES0/ST43w2hhf846GKwNYc0KM6ueUK28YuldSE3nEu+MBoi77iEfrOggHMdSZ8pz6TUQjLPVrS
	Ju9uKPJM+FNvSZ3OsXdhDjuxNY/67AOIBFzmZsceohj/2GtkYAsURoj+3ozey3FGNHV/IsxbeRux3
	WzylW3ReqeBCKziuVZrtalE+qnBlUjaT5AqWuQpetVOiqxI7JwIlMcyBgJYwmo16m34+fRCv1VnNU
	4Vb65i9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lewZa-006bPa-CD; Fri, 07 May 2021 09:15:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lewZW-006bPP-UA
 for linux-riscv@desiato.infradead.org; Fri, 07 May 2021 09:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=jt0lKiANR7FQUHTM+IZD1hAX2mMCG17wENXDr4E5Q88=; b=3YgokCRxNfFlksmqvfKQXHsq2d
 k8O7UodusH4UpuVM5WIUiOltpxmiOSjokoriRLMMjwJQuNST94ssUO4unDASM8jwMY4rDgKZ5jz5v
 vrOL65HPiBPbWVNMHjUivAbxzDLD6+co6LwJvcABBNUualduGIH0242OTHWlnkanW2DxS4gQCJv0a
 mwPs/nrYcDmbnVqHLUfSa2fZppXO+OnQLuMAuVxymspwi3U6P/iVCCh9TiSfRhUzTGQFngVUYtCtJ
 Zx2q1nNQ0hSbyr834eZKd9ITOnwd3N325d2b4Nd/xPgO3H1EqAdkvHksoiFMQw8RLFX9lnL6G6oOd
 0D2aFM2Q==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lewZT-006j4e-9E
 for linux-riscv@lists.infradead.org; Fri, 07 May 2021 09:14:57 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fc4Sd0lYkzqSgV;
 Fri,  7 May 2021 17:11:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 7 May 2021 17:14:40 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tong
 Tiangen" <tongtiangen@huawei.com>
Subject: [RFC PATCH] riscv: add VMAP_STACK overflow detection
Date: Fri, 7 May 2021 17:25:09 +0800
Message-ID: <20210507092509.41346-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_021455_703651_141D148A 
X-CRM114-Status: GOOD (  13.28  )
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

This patch adds stack overflow detection to riscv, usable when
CONFIG_VMAP_STACK=y.

Overflow is detected in kernel exception entry(kernel/entry.S), if the kernel
stack is overflow and been detected, the overflow handler is invoked on a
per-cpu overflow stack. This approach preserves GPRs and the original exception
information.

The overflow detect is performed before any attempt is made to access the stack
and the principle of stack overflow detection: kernel stacks are aligned to
double their size, enabling overflow to be detected with a single bit test. For
example, a 16K stack is aligned to 32K, ensuring that bit 14 of the SP must be
zero. On an overflow (or underflow), this bit is flipped. Thus, overflow (of
less than the size of the stack) can be detected by testing whether this bit is
set.

This gives us a useful error message on stack overflow, as can be trigger with
the LKDTM overflow test:

[  388.053267] lkdtm: Performing direct entry EXHAUST_STACK
[  388.053663] lkdtm: Calling function with 1024 frame size to depth 32 ...
[  388.054016] lkdtm: loop 32/32 ...
[  388.054186] lkdtm: loop 31/32 ...
[  388.054491] lkdtm: loop 30/32 ...
[  388.054672] lkdtm: loop 29/32 ...
[  388.054859] lkdtm: loop 28/32 ...
[  388.055010] lkdtm: loop 27/32 ...
[  388.055163] lkdtm: loop 26/32 ...
[  388.055309] lkdtm: loop 25/32 ...
[  388.055481] lkdtm: loop 24/32 ...
[  388.055653] lkdtm: loop 23/32 ...
[  388.055837] lkdtm: loop 22/32 ...
[  388.056015] lkdtm: loop 21/32 ...
[  388.056188] lkdtm: loop 20/32 ...
[  388.058145] Insufficient stack space to handle exception!
[  388.058153] Task stack:     [0xffffffd014260000..0xffffffd014264000]
[  388.058160] Overflow stack: [0xffffffe1f8d2c220..0xffffffe1f8d2d220]
[  388.058168] CPU: 0 PID: 89 Comm: bash Not tainted 5.12.0-rc8-dirty #90
[  388.058175] Hardware name: riscv-virtio,qemu (DT)
[  388.058187] epc : number+0x32/0x2c0
[  388.058247]  ra : vsnprintf+0x2ae/0x3f0
[  388.058255] epc : ffffffe0002d38f6 ra : ffffffe0002d814e sp : ffffffd01425ffc0
[  388.058263]  gp : ffffffe0012e4010 tp : ffffffe08014da00 t0 : ffffffd0142606e8
[  388.058271]  t1 : 0000000000000000 t2 : 0000000000000000 s0 : ffffffd014260070
[  388.058303]  s1 : ffffffd014260158 a0 : ffffffd01426015e a1 : ffffffd014260158
[  388.058311]  a2 : 0000000000000013 a3 : ffff0a01ffffff10 a4 : ffffffe000c398e0
[  388.058319]  a5 : 511b02ec65f3e300 a6 : 0000000000a1749a a7 : 0000000000000000
[  388.058327]  s2 : ffffffff000000ff s3 : 00000000ffff0a01 s4 : ffffffe0012e50a8
[  388.058335]  s5 : 0000000000ffff0a s6 : ffffffe0012e50a8 s7 : ffffffe000da1cc0
[  388.058343]  s8 : ffffffffffffffff s9 : ffffffd0142602b0 s10: ffffffd0142602a8
[  388.058351]  s11: ffffffd01426015e t3 : 00000000000f0000 t4 : ffffffffffffffff
[  388.058359]  t5 : 000000000000002f t6 : ffffffd014260158
[  388.058366] status: 0000000000000100 badaddr: ffffffd01425fff8 cause: 000000000000000f
[  388.058374] Kernel panic - not syncing: Kernel stack overflow
[  388.058381] CPU: 0 PID: 89 Comm: bash Not tainted 5.12.0-rc8-dirty #90
[  388.058387] Hardware name: riscv-virtio,qemu (DT)
[  388.058393] Call Trace:
[  388.058400] [<ffffffe000004944>] walk_stackframe+0x0/0xce
[  388.058406] [<ffffffe0006f0b28>] dump_backtrace+0x38/0x46
[  388.058412] [<ffffffe0006f0b46>] show_stack+0x10/0x18
[  388.058418] [<ffffffe0006f3690>] dump_stack+0x74/0x8e
[  388.058424] [<ffffffe0006f0d52>] panic+0xfc/0x2b2
[  388.058430] [<ffffffe0006f0acc>] print_trace_address+0x0/0x24
[  388.058436] [<ffffffe0002d814e>] vsnprintf+0x2ae/0x3f0
[  388.058956] SMP: stopping secondary CPUs

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/Kconfig                   |   1 +
 arch/riscv/include/asm/thread_info.h |  15 ++++
 arch/riscv/kernel/entry.S            | 108 +++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c            |  35 +++++++++
 4 files changed, 159 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4515a10c5d22..587f001e84f4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -63,6 +63,7 @@ config RISCV
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_ARCH_VMAP_STACK
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING
 	select HAVE_DEBUG_KMEMLEAK
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 0e549a3089b3..60da0dcacf14 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -19,6 +19,21 @@
 #endif
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 
+/*
+ * By aligning VMAP'd stacks to 2 * THREAD_SIZE, we can detect overflow by
+ * checking sp & (1 << THREAD_SHIFT), which we can do cheaply in the entry
+ * assembly.
+ */
+#ifdef CONFIG_VMAP_STACK
+#define THREAD_ALIGN            (2 * THREAD_SIZE)
+#else
+#define THREAD_ALIGN            THREAD_SIZE
+#endif
+
+#define THREAD_SHIFT            (PAGE_SHIFT + THREAD_SIZE_ORDER)
+#define OVERFLOW_STACK_SIZE     SZ_4K
+#define SHADOW_OVERFLOW_STACK_SIZE (1024)
+
 #ifndef __ASSEMBLY__
 
 #include <asm/processor.h>
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 83095faa680e..deadf4000b86 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -29,6 +29,15 @@ ENTRY(handle_exception)
 _restore_kernel_tpsp:
 	csrr tp, CSR_SCRATCH
 	REG_S sp, TASK_TI_KERNEL_SP(tp)
+
+#ifdef CONFIG_VMAP_STACK
+	addi sp, sp, -(PT_SIZE_ON_STACK)
+	srli sp, sp, THREAD_SHIFT
+	andi sp, sp, 0x1
+	bnez sp, handle_kernel_stack_overflow
+	REG_L sp, TASK_TI_KERNEL_SP(tp)
+#endif
+
 _save_context:
 	REG_S sp, TASK_TI_USER_SP(tp)
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
@@ -375,6 +384,105 @@ handle_syscall_trace_exit:
 	call do_syscall_trace_exit
 	j ret_from_exception
 
+#ifdef CONFIG_VMAP_STACK
+handle_kernel_stack_overflow:
+	la sp, shadow_stack
+	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
+
+	//save caller register to shadow stack
+	addi sp, sp, -(PT_SIZE_ON_STACK)
+	REG_S x1,  PT_RA(sp)
+	REG_S x5,  PT_T0(sp)
+	REG_S x6,  PT_T1(sp)
+	REG_S x7,  PT_T2(sp)
+	REG_S x10, PT_A0(sp)
+	REG_S x11, PT_A1(sp)
+	REG_S x12, PT_A2(sp)
+	REG_S x13, PT_A3(sp)
+	REG_S x14, PT_A4(sp)
+	REG_S x15, PT_A5(sp)
+	REG_S x16, PT_A6(sp)
+	REG_S x17, PT_A7(sp)
+	REG_S x28, PT_T3(sp)
+	REG_S x29, PT_T4(sp)
+	REG_S x30, PT_T5(sp)
+	REG_S x31, PT_T6(sp)
+
+	la ra, restore_caller_reg
+	tail get_overflow_stack
+
+restore_caller_reg:
+	//save per-cpu overflow stack
+	sd a0, -8(sp)
+	//restore caller register from shadow_stack
+	REG_L x1,  PT_RA(sp)
+	REG_L x5,  PT_T0(sp)
+	REG_L x6,  PT_T1(sp)
+	REG_L x7,  PT_T2(sp)
+	REG_L x10, PT_A0(sp)
+	REG_L x11, PT_A1(sp)
+	REG_L x12, PT_A2(sp)
+	REG_L x13, PT_A3(sp)
+	REG_L x14, PT_A4(sp)
+	REG_L x15, PT_A5(sp)
+	REG_L x16, PT_A6(sp)
+	REG_L x17, PT_A7(sp)
+	REG_L x28, PT_T3(sp)
+	REG_L x29, PT_T4(sp)
+	REG_L x30, PT_T5(sp)
+	REG_L x31, PT_T6(sp)
+
+	//load per-cpu overflow stack
+	ld sp, -8(sp)
+	addi sp, sp, -(PT_SIZE_ON_STACK)
+
+	//save context to overflow stack
+	REG_S x1,  PT_RA(sp)
+	REG_S x3,  PT_GP(sp)
+	REG_S x5,  PT_T0(sp)
+	REG_S x6,  PT_T1(sp)
+	REG_S x7,  PT_T2(sp)
+	REG_S x8,  PT_S0(sp)
+	REG_S x9,  PT_S1(sp)
+	REG_S x10, PT_A0(sp)
+	REG_S x11, PT_A1(sp)
+	REG_S x12, PT_A2(sp)
+	REG_S x13, PT_A3(sp)
+	REG_S x14, PT_A4(sp)
+	REG_S x15, PT_A5(sp)
+	REG_S x16, PT_A6(sp)
+	REG_S x17, PT_A7(sp)
+	REG_S x18, PT_S2(sp)
+	REG_S x19, PT_S3(sp)
+	REG_S x20, PT_S4(sp)
+	REG_S x21, PT_S5(sp)
+	REG_S x22, PT_S6(sp)
+	REG_S x23, PT_S7(sp)
+	REG_S x24, PT_S8(sp)
+	REG_S x25, PT_S9(sp)
+	REG_S x26, PT_S10(sp)
+	REG_S x27, PT_S11(sp)
+	REG_S x28, PT_T3(sp)
+	REG_S x29, PT_T4(sp)
+	REG_S x30, PT_T5(sp)
+	REG_S x31, PT_T6(sp)
+
+	REG_L s0, TASK_TI_KERNEL_SP(tp)
+	csrr s1, CSR_STATUS
+	csrr s2, CSR_EPC
+	csrr s3, CSR_TVAL
+	csrr s4, CSR_CAUSE
+	csrr s5, CSR_SCRATCH
+	REG_S s0, PT_SP(sp)
+	REG_S s1, PT_STATUS(sp)
+	REG_S s2, PT_EPC(sp)
+	REG_S s3, PT_BADADDR(sp)
+	REG_S s4, PT_CAUSE(sp)
+	REG_S s5, PT_TP(sp)
+	move a0, sp
+	tail handle_bad_stack
+#endif
+
 END(handle_exception)
 
 ENTRY(ret_from_fork)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 1357abf79570..ff8033b9fdd6 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -200,3 +200,38 @@ int is_valid_bugaddr(unsigned long pc)
 void trap_init(void)
 {
 }
+
+#ifdef CONFIG_VMAP_STACK
+DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
+		__aligned(16);
+/*
+ * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
+ * to get per-cpu overflow stack(get_overflow_stack).
+ */
+long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
+asmlinkage unsigned long get_overflow_stack(void)
+{
+	return (unsigned long)this_cpu_ptr(overflow_stack) +
+		OVERFLOW_STACK_SIZE;
+}
+
+asmlinkage void handle_bad_stack(struct pt_regs *regs)
+{
+	unsigned long tsk_stk = (unsigned long)current->stack;
+	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
+
+	console_verbose();
+
+	pr_emerg("Insufficient stack space to handle exception!\n");
+	pr_emerg("Task stack:     [0x%016lx..0x%016lx]\n",
+			tsk_stk, tsk_stk + THREAD_SIZE);
+	pr_emerg("Overflow stack: [0x%016lx..0x%016lx]\n",
+			ovf_stk, ovf_stk + OVERFLOW_STACK_SIZE);
+
+	__show_regs(regs);
+	panic("Kernel stack overflow");
+
+	for (;;)
+		wait_for_interrupt();
+}
+#endif
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
