Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71093C6FA82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 18:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5sIYApqgQkIL30/YxPUI/izcTJCJC1ZCuHxeK4+5H8=; b=fuIOKP2pe1uitO
	3HS2Ss6XQP+eRBOjPnKfjzbF/BYJBnz8/43Ij5vBRm8HAxiQjWbdafjJzBFTWGf9Uyw3E5ITHn35t
	cQNSktMzoKPr8BaDD4cvliiRM2ebMp5+hvipHCwmezO3+5a1OAi1XT0Ub21kb6+AS3+sDey0JnVxJ
	hPERN3mmRdzCtk/6kmixToO3zeANLcZKpm25hQy0nXMChublcRBL8eCwzIwZ2KNnG7aULbpA4JIqo
	50mEIhbuZcThca1Im2wrF93eKXpwaZuCJPpaJGFlavnsfALrg1pRPcdUwI+izISj76iCSxmDmHGGH
	5SnzqnlkPz+QC4gGeobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocVye-00FXph-Hc; Sun, 25 Sep 2022 18:03:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocVyY-00FXld-Np
	for linux-riscv@lists.infradead.org; Sun, 25 Sep 2022 18:03:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55489611A5;
	Sun, 25 Sep 2022 18:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5AEC433C1;
	Sun, 25 Sep 2022 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664129013;
	bh=KtvTo4z9qDZsi93ZG5gDRixLmYKu5t9MRfFRxehPq4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCTAbgnuCieHprK0e2nMRE5AHu3YLoUZOqEJYR324n6Jy4HxKJd2MH/lNu3swUvyp
	 YXlmThxC4GzRmzHT3TXGa1Vkfx9tS7ljY0R01lOdcl/i2icGApBpmrOPVwfvkCgxDh
	 Owm6ybrnEdE1mlX1JlMMnGR8Et6z3Cl3kwyUe0KKJPKULbKKnYtrmzEVLXH8O2G6Cx
	 H1R+tA9KvYwbMvlsrFWnN3CIAPQwlRyzt+CPXUFPAJy34k+o6VSakBI6MMSx2+vB94
	 89qabTMctwPdy3cdd+xWVs0GhEsdu4vogNBkgBSnJWHFI7KacOK1Cc5aMGd+1zMaqc
	 XUQKukFxfQNTA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/4] riscv: entry: consolidate general regs saving into save_gp
Date: Mon, 26 Sep 2022 01:53:56 +0800
Message-Id: <20220925175356.681-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925175356.681-1-jszhang@kernel.org>
References: <20220925175356.681-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_110334_869994_40EB8EB8 
X-CRM114-Status: GOOD (  12.05  )
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

Consolidate the saving GPs(except sp and tp into save_gp macro.
No functional change.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/entry.S | 85 ++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 54 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 442d93beffcf..04e11d257ad6 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -14,31 +14,8 @@
 #include <asm/asm-offsets.h>
 #include <asm/errata_list.h>
 
-ENTRY(handle_exception)
-	/*
-	 * If coming from userspace, preserve the user thread pointer and load
-	 * the kernel thread pointer.  If we came from the kernel, the scratch
-	 * register will contain 0, and we should continue on the current TP.
-	 */
-	csrrw tp, CSR_SCRATCH, tp
-	bnez tp, _save_context
-
-_restore_kernel_tpsp:
-	csrr tp, CSR_SCRATCH
-	REG_S sp, TASK_TI_KERNEL_SP(tp)
-
-#ifdef CONFIG_VMAP_STACK
-	addi sp, sp, -(PT_SIZE_ON_STACK)
-	srli sp, sp, THREAD_SHIFT
-	andi sp, sp, 0x1
-	bnez sp, handle_kernel_stack_overflow
-	REG_L sp, TASK_TI_KERNEL_SP(tp)
-#endif
-
-_save_context:
-	REG_S sp, TASK_TI_USER_SP(tp)
-	REG_L sp, TASK_TI_KERNEL_SP(tp)
-	addi sp, sp, -(PT_SIZE_ON_STACK)
+	/* save all GPs except sp and tp */
+	.macro save_gp
 	REG_S x1,  PT_RA(sp)
 	REG_S x3,  PT_GP(sp)
 	REG_S x5,  PT_T0(sp)
@@ -68,6 +45,34 @@ _save_context:
 	REG_S x29, PT_T4(sp)
 	REG_S x30, PT_T5(sp)
 	REG_S x31, PT_T6(sp)
+	.endm
+
+ENTRY(handle_exception)
+	/*
+	 * If coming from userspace, preserve the user thread pointer and load
+	 * the kernel thread pointer.  If we came from the kernel, the scratch
+	 * register will contain 0, and we should continue on the current TP.
+	 */
+	csrrw tp, CSR_SCRATCH, tp
+	bnez tp, _save_context
+
+_restore_kernel_tpsp:
+	csrr tp, CSR_SCRATCH
+	REG_S sp, TASK_TI_KERNEL_SP(tp)
+
+#ifdef CONFIG_VMAP_STACK
+	addi sp, sp, -(PT_SIZE_ON_STACK)
+	srli sp, sp, THREAD_SHIFT
+	andi sp, sp, 0x1
+	bnez sp, handle_kernel_stack_overflow
+	REG_L sp, TASK_TI_KERNEL_SP(tp)
+#endif
+
+_save_context:
+	REG_S sp, TASK_TI_USER_SP(tp)
+	REG_L sp, TASK_TI_KERNEL_SP(tp)
+	addi sp, sp, -(PT_SIZE_ON_STACK)
+	save_gp
 
 	/*
 	 * Disable user-mode memory access as it should only be set in the
@@ -234,35 +239,7 @@ ENTRY(handle_kernel_stack_overflow)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 
 	//save context to overflow stack
-	REG_S x1,  PT_RA(sp)
-	REG_S x3,  PT_GP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x18, PT_S2(sp)
-	REG_S x19, PT_S3(sp)
-	REG_S x20, PT_S4(sp)
-	REG_S x21, PT_S5(sp)
-	REG_S x22, PT_S6(sp)
-	REG_S x23, PT_S7(sp)
-	REG_S x24, PT_S8(sp)
-	REG_S x25, PT_S9(sp)
-	REG_S x26, PT_S10(sp)
-	REG_S x27, PT_S11(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
+	save_gp
 
 	REG_L s0, TASK_TI_KERNEL_SP(tp)
 	csrr s1, CSR_STATUS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
