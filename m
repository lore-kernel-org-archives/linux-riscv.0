Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9874C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 00:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deUm4ktsoZpsJN42DzUTWR4jEa6Afr9RqokuaE50OnU=; b=uuK9gUnvAyyBl6
	bRHR8RWMqwqlsMa3p4Xi4wWV3NeYsXU8E/oaLRNSOBk6aIOUxKZ8OOxOZnLQQ1KoLoxO8AhFGOxK7
	1+5tqVGLtHoHEA8Q8ttf9BiOeZQHYz1Bi5wYqY9UHImQOL5Yo1QaXXvWcE3K7kFJJsHwM/N+wj+6c
	pqV7ZNP+MAXn+t5aHu+Pw1gQegz6/Gil5E7jSLyNdhoSE9FCEhJIn/CUgFoY49nfXSt7MqHb5aXZA
	rQELIeWweQ2goaVpVZOMrsvp0ID/Vxksae47iWYfC8gfZzrCg6VJ4Klho9rgaFUcdwGMD3y3ks5XI
	YR6mQeRaJoUVMZF97O2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTUI-00000005s39-0CXn;
	Thu, 30 May 2024 00:17:46 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTUD-00000005s1K-15vv
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 00:17:42 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-65c5a29f7f0so260557a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 17:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717028260; x=1717633060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xM/ESoaJ23Br0UgFTe6IQH0BbO+2q0cmF/lAEmoPXas=;
        b=J/C+8fmQ43GvruQY4SN1DoeDCdtZx2hmOURp4XVBP5Pbmt6TOUvX6onELIcU5zff1L
         3TwpO8lkN0NABfrBzNJWoySP2M1LJ9zgrGD7vtvkHVOX4E4Y46nv9hzm5s9CsUWu6PW6
         i9cCuQl1Pe2Vqbn8nCTGXqxBkKxSVkx+skBClgplfUpcD/S1ir0u9sf+guRXi0mPzide
         YJPv6FeXAQJo8vSVfZ0bidtbFP5idiMHE0XlcVawXoft9xaSc+lnlqNiT06w0GJhO9QT
         YwLR9WpblZ458wehmOB1Cf01itJwhDQGQ5nK6ujPjEbmrYVD68rzHmfVrL0qmTmwQrKF
         7voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717028260; x=1717633060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xM/ESoaJ23Br0UgFTe6IQH0BbO+2q0cmF/lAEmoPXas=;
        b=iQCM0KmS5TmAQLz6jLURUGL/hfs6Tj5PLUkgGnTPKJCukVMmvRXUypAOrr18fvD6WM
         xOmQuM86TwTO6q+PuFcepOIucsEnNNNvW561WNRQWbtEj2j1WLwjaUGtZqTNjuXkyMQZ
         Hj64x0dIderClJc3ad0x91g5E7eEvZnrOrEnUtjO3XxwQnWDGczR0okuSFAGEIgVtVL4
         Vm9ziPuFEhgnNqo2SJQVfnaubQcMCu4OhKyV1nDJQjg7YxqDH0XwWWbAyDFz5hvP2DFr
         UIQoqqe3lWLhOr/RNr6kxXOUZWhCUXDTRQ1wDueYVUzvOwdkfXOyBVEzT2GxXC9+cVbg
         5Oiw==
X-Forwarded-Encrypted: i=1; AJvYcCViuYCP79a8yxwgOoytJcfERI+li4eFywV2Kmlx2+wh0+EhutXG7++LJL5lvW6Yf+EdoChAzQgJzov9mEv/Rz96hSVz2OSrZdl8p0J+Ikla
X-Gm-Message-State: AOJu0YyNeEQbQrwxMPev337vCpBa9NNA2cCxU2h7nhv2WFKbLSi5U5Po
	sEWpRf0L5HfdsqV0kwIfZedkqPEqrrGdV8kiK5HLitWfHfYDkOeD3FWnBrSBVTU=
X-Google-Smtp-Source: AGHT+IGL+E/7b54TqXhjg4b7i20AFCS38QG/+9WHYKtBzXAhSy55KZzGAnUPFX5KV7QGVTHOSWayRQ==
X-Received: by 2002:a17:90a:be11:b0:2bf:bb85:edc1 with SMTP id 98e67ed59e1d1-2c1abc79fd1mr668298a91.40.1717028260094;
        Wed, 29 May 2024 17:17:40 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a776e206sm432171a91.20.2024.05.29.17.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:17:39 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 4/4] riscv: entry: Save a frame record for exceptions
Date: Wed, 29 May 2024 17:15:59 -0700
Message-ID: <20240530001733.1407654-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240530001733.1407654-1-samuel.holland@sifive.com>
References: <20240530001733.1407654-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_171741_384702_CC671BF5 
X-CRM114-Status: GOOD (  16.88  )
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

This follows the frame pointer ABI and allows stack traces to cross
exception boundaries without a special case in the stack walking code.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/processor.h  |  9 +++++++--
 arch/riscv/include/asm/ptrace.h     |  5 +++++
 arch/riscv/include/asm/stacktrace.h |  5 -----
 arch/riscv/kernel/asm-offsets.c     |  6 +++---
 arch/riscv/kernel/entry.S           | 16 ++++++++++------
 arch/riscv/kernel/head.S            |  6 ++----
 arch/riscv/kernel/stacktrace.c      |  9 ---------
 7 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 68c3432dc6ea..ccbb1e363c7f 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -144,9 +144,14 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 	.align_ctl = PR_UNALIGN_NOPRINT,		\
 }
 
+#ifdef CONFIG_FRAME_POINTER
+#define EXCEPTION_FRAME_SIZE ALIGN(sizeof(struct pt_regs) + sizeof(struct stackframe), STACK_ALIGN)
+#else
+#define EXCEPTION_FRAME_SIZE ALIGN(sizeof(struct pt_regs), STACK_ALIGN)
+#endif
+
 #define task_pt_regs(tsk)						\
-	((struct pt_regs *)(task_stack_page(tsk) + THREAD_SIZE		\
-			    - ALIGN(sizeof(struct pt_regs), STACK_ALIGN)))
+	((struct pt_regs *)(task_stack_page(tsk) + THREAD_SIZE - EXCEPTION_FRAME_SIZE))
 
 #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->epc)
 #define KSTK_ESP(tsk)		(task_pt_regs(tsk)->sp)
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b5b0adcc85c1..f475f6acec49 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -12,6 +12,11 @@
 
 #ifndef __ASSEMBLY__
 
+struct stackframe {
+	unsigned long fp;
+	unsigned long ra;
+};
+
 struct pt_regs {
 	unsigned long epc;
 	unsigned long ra;
diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce..3019558f747c 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -6,11 +6,6 @@
 #include <linux/sched.h>
 #include <asm/ptrace.h>
 
-struct stackframe {
-	unsigned long fp;
-	unsigned long ra;
-};
-
 extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 				    bool (*fn)(void *, unsigned long), void *arg);
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 84c056f5ee09..582b52713e93 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -477,10 +477,10 @@ void asm_offsets(void)
 	);
 
 	/*
-	 * We allocate a pt_regs on the stack when entering the kernel.  This
-	 * ensures the alignment is sane.
+	 * We allocate a pt_regs and possibly a stackframe on the stack when
+	 * entering the kernel. This ensures the alignment is sane.
 	 */
-	DEFINE(PT_SIZE_ON_STACK, ALIGN(sizeof(struct pt_regs), STACK_ALIGN));
+	DEFINE(EXCEPTION_FRAME_SIZE, EXCEPTION_FRAME_SIZE);
 
 	OFFSET(KERNEL_MAP_VIRT_ADDR, kernel_mapping, virt_addr);
 	OFFSET(SBI_HART_BOOT_TASK_PTR_OFFSET, sbi_hart_boot_data, task_ptr);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index bd1c5621df45..cdb58ce32cbb 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -33,7 +33,7 @@ SYM_CODE_START(handle_exception)
 	REG_S sp, TASK_TI_KERNEL_SP(tp)
 
 #ifdef CONFIG_VMAP_STACK
-	addi sp, sp, -(PT_SIZE_ON_STACK)
+	addi sp, sp, -EXCEPTION_FRAME_SIZE
 	srli sp, sp, THREAD_SHIFT
 	andi sp, sp, 0x1
 	bnez sp, handle_kernel_stack_overflow
@@ -43,7 +43,7 @@ SYM_CODE_START(handle_exception)
 .Lsave_context:
 	REG_S sp, TASK_TI_USER_SP(tp)
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
-	addi sp, sp, -(PT_SIZE_ON_STACK)
+	addi sp, sp, -EXCEPTION_FRAME_SIZE
 	REG_S x1,  PT_RA(sp)
 	REG_S x3,  PT_GP(sp)
 	REG_S x5,  PT_T0(sp)
@@ -83,6 +83,12 @@ SYM_CODE_START(handle_exception)
 	/* Load the kernel shadow call stack pointer if coming from userspace */
 	scs_load_current_if_task_changed s5
 
+#ifdef CONFIG_FRAME_POINTER
+	REG_S	ra, (EXCEPTION_FRAME_SIZE + STACKFRAME_RA)(sp)
+	REG_S	s0, (EXCEPTION_FRAME_SIZE + STACKFRAME_FP)(sp)
+	addi	s0, sp, EXCEPTION_FRAME_SIZE
+#endif
+
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
 	call riscv_v_context_nesting_start
@@ -136,7 +142,7 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	bnez t0, 1f
 
 	/* Save unwound kernel stack pointer in thread_info */
-	addi t0, sp, PT_SIZE_ON_STACK
+	addi t0, sp, EXCEPTION_FRAME_SIZE
 	REG_S t0, TASK_TI_KERNEL_SP(tp)
 
 	/* Save the kernel shadow call stack pointer */
@@ -192,14 +198,12 @@ SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	/* we reach here from kernel context, sscratch must be 0 */
 	csrrw x31, CSR_SCRATCH, x31
 	asm_per_cpu sp, overflow_stack, x31
-	li x31, OVERFLOW_STACK_SIZE
+	li x31, OVERFLOW_STACK_SIZE - EXCEPTION_FRAME_SIZE
 	add sp, sp, x31
 	/* zero out x31 again and restore x31 */
 	xor x31, x31, x31
 	csrrw x31, CSR_SCRATCH, x31
 
-	addi sp, sp, -(PT_SIZE_ON_STACK)
-
 	//save context to overflow stack
 	REG_S x1,  PT_RA(sp)
 	REG_S x3,  PT_GP(sp)
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..09ee5e6c2a98 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -290,9 +290,8 @@ SYM_CODE_START(_start_kernel)
 
 	/* Initialize page tables and relocate to virtual addresses */
 	la tp, init_task
-	la sp, init_thread_union + THREAD_SIZE
+	la sp, init_thread_union + THREAD_SIZE - EXCEPTION_FRAME_SIZE
 	XIP_FIXUP_OFFSET sp
-	addi sp, sp, -PT_SIZE_ON_STACK
 	scs_load_init_stack
 #ifdef CONFIG_BUILTIN_DTB
 	la a0, __dtb_start
@@ -310,8 +309,7 @@ SYM_CODE_START(_start_kernel)
 	call .Lsetup_trap_vector
 	/* Restore C environment */
 	la tp, init_task
-	la sp, init_thread_union + THREAD_SIZE
-	addi sp, sp, -PT_SIZE_ON_STACK
+	la sp, init_thread_union + THREAD_SIZE - EXCEPTION_FRAME_SIZE
 	scs_load_current
 
 #ifdef CONFIG_KASAN
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 528ec7cc9a62..6be8f8942f6b 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,8 +16,6 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
-extern asmlinkage void ret_from_exception(void);
-
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 {
 	unsigned long low, high;
@@ -70,13 +68,6 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			fp = frame->fp;
 			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
 						   &frame->ra);
-			if (pc == (unsigned long)ret_from_exception) {
-				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
-					break;
-
-				pc = ((struct pt_regs *)sp)->epc;
-				fp = ((struct pt_regs *)sp)->s0;
-			}
 		}
 
 	}
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
