Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13410C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQJPGLeH6Jqm6t5g3lqk8un0hiW6O70RT6Z7CP7BKLs=; b=Vdmn3LO00frYNp
	lQmizd3hyLjVPcOrUIdd4TM98z+9g5j/31r7fE+MpA+RxDsRuTj5MdHWyoRAy6QREM3nNJc6/NWOS
	/FvUUHj9l7LyqTE7Ym77EdJ0j4P6YiFXNLcAQ9IUNKZsMkOZsk344CnEEhFIFm+j+VqspiM/OySct
	fpi5lNkcVdnOXS3uupODUV/cRNJrB/x34iVMIsQFkXzGh1Q+Mi78jD9Qcz4FLpylpEuc/Qr+wrlDG
	r9AJdq8m/WXhYig0Nm6sGbD0x/WZ28Iu+fE/A3UmfQD12e85BI3Dr2Dt38WzKQQ6p1LmqVBtaNYgA
	Psy0iDZpBOUh/L4Tzg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrR-00000005Qhk-0wom;
	Sat, 20 Jul 2024 17:27:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrK-00000005Qbq-03IM
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 17:27:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29AF161180;
	Sat, 20 Jul 2024 17:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE32C4AF0A;
	Sat, 20 Jul 2024 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496421;
	bh=Y6v1+nAyzX6PLWXUQO4fYkr+VRI6pL0daNUbphTp9Ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mo1NidTgWe4gaqa1uhLGqnaHg5Lw0GfB7cXA2DLf78lDSt9LMzySiZAzXFuGsfTu9
	 FDnJOOoFjIyPazatV3Ug8h0PqPHAkHPAcbvSGjrokipmTMPAQPnsJNRxgmP9G3jtKp
	 MIKNSf0+s9SB+anrQYQRRYASrqCfnBEjAQRZiEeXxxfhsWctjs48eSrv2aVoiQNa/z
	 5dWVUwW5P89QqGsHHrOtoPHWxsR2Hhz7Hfzc2PYU4YNM+wPvG7RrCNXi5myMqD4Q1T
	 DoGnsRlzagv7bVnSzB5Yv4w0Mbd7pmz1IgPTotQOcVwqR/3+BHuCm5OYoOX91TtLSn
	 Hdvj0BPDY6Ofg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Clement Leger <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] riscv: staticalize and remove asmlinkage from updated functions
Date: Sun, 21 Jul 2024 01:12:31 +0800
Message-ID: <20240720171232.1753-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720171232.1753-1-jszhang@kernel.org>
References: <20240720171232.1753-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_102702_301731_7859452F 
X-CRM114-Status: GOOD (  10.61  )
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

Now that the callers of these functions have moved into C, they
are only called in trap.c and no longer need the asmlinkage
annotation. So make them static and remove asmlinkage from them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/asm-prototypes.h | 19 +------------------
 arch/riscv/kernel/kernel_mode_vector.c  |  2 +-
 arch/riscv/kernel/traps.c               | 16 ++++++++--------
 3 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index c6691e9032dd..067e93e3b400 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -31,30 +31,13 @@ void xor_regs_5_(unsigned long bytes, unsigned long *__restrict p1,
 		 const unsigned long *__restrict p5);
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
-asmlinkage void riscv_v_context_nesting_start(struct pt_regs *regs);
+void riscv_v_context_nesting_start(struct pt_regs *regs);
 asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs);
 #endif /* CONFIG_RISCV_ISA_V_PREEMPTIVE */
 
 #endif /* CONFIG_RISCV_ISA_V */
 
-#define DECLARE_DO_ERROR_INFO(name)	asmlinkage void name(struct pt_regs *regs)
-
-DECLARE_DO_ERROR_INFO(do_trap_unknown);
-DECLARE_DO_ERROR_INFO(do_trap_insn_misaligned);
-DECLARE_DO_ERROR_INFO(do_trap_insn_fault);
-DECLARE_DO_ERROR_INFO(do_trap_insn_illegal);
-DECLARE_DO_ERROR_INFO(do_trap_load_fault);
-DECLARE_DO_ERROR_INFO(do_trap_load_misaligned);
-DECLARE_DO_ERROR_INFO(do_trap_store_misaligned);
-DECLARE_DO_ERROR_INFO(do_trap_store_fault);
-DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
-DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
-DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
-DECLARE_DO_ERROR_INFO(do_trap_break);
-
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
-asmlinkage void do_page_fault(struct pt_regs *regs);
-asmlinkage void do_irq(struct pt_regs *regs);
 asmlinkage void do_traps(struct pt_regs *regs, unsigned long cause);
 
 #endif /* _ASM_RISCV_PROTOTYPES_H */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 6afe80c7f03a..a6995429ddf5 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -152,7 +152,7 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 }
 
 /* low-level V context handling code, called with irq disabled */
-asmlinkage void riscv_v_context_nesting_start(struct pt_regs *regs)
+void riscv_v_context_nesting_start(struct pt_regs *regs)
 {
 	int depth;
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 3eaa7c72f2be..dc1bc84cfe15 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -147,7 +147,7 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 #define __trap_section noinstr
 #endif
 #define DO_ERROR_INFO(name, signo, code, str)					\
-asmlinkage __trap_section void name(struct pt_regs *regs)			\
+static __trap_section void name(struct pt_regs *regs)				\
 {										\
 	if (user_mode(regs)) {							\
 		irqentry_enter_from_user_mode(regs);				\
@@ -167,7 +167,7 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
 DO_ERROR_INFO(do_trap_insn_fault,
 	SIGSEGV, SEGV_ACCERR, "instruction access fault");
 
-asmlinkage __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
+static __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
 {
 	bool handled;
 
@@ -198,7 +198,7 @@ asmlinkage __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
 DO_ERROR_INFO(do_trap_load_fault,
 	SIGSEGV, SEGV_ACCERR, "load access fault");
 
-asmlinkage __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
+static __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -219,7 +219,7 @@ asmlinkage __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
 	}
 }
 
-asmlinkage __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
+static __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -294,7 +294,7 @@ static void handle_break(struct pt_regs *regs)
 		die(regs, "Kernel BUG");
 }
 
-asmlinkage __trap_section void do_trap_break(struct pt_regs *regs)
+static __trap_section void do_trap_break(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -311,7 +311,7 @@ asmlinkage __trap_section void do_trap_break(struct pt_regs *regs)
 	}
 }
 
-asmlinkage __trap_section  __no_stack_protector
+static __trap_section  __no_stack_protector
 void do_trap_ecall_u(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
@@ -355,7 +355,7 @@ void do_trap_ecall_u(struct pt_regs *regs)
 }
 
 #ifdef CONFIG_MMU
-asmlinkage noinstr void do_page_fault(struct pt_regs *regs)
+static noinstr void do_page_fault(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
@@ -378,7 +378,7 @@ static void noinstr handle_riscv_irq(struct pt_regs *regs)
 	irq_exit_rcu();
 }
 
-asmlinkage void noinstr do_irq(struct pt_regs *regs)
+static void noinstr do_irq(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
