Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B940C3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfQl3ISJROfin3dN4OLBhM2NQNjJP1/8ywyl4NE/UAs=; b=txN6aG+E6zv/mL
	RPgHG+8EsQQMpZCahJtmkEjy35e+Ug2tbom9CZnLca/6DsYBiq06leI6gTQKnJCu4w4aqicYr9Rls
	14Dovh4AlgI6X3Oezk4INZ/cxFOiataGWgv1Rboo+xX6zHw+F4okDB/VsWI7JLA7a6K9ltaRBon9k
	H/EMH8QEK2inQg/MbVzKm/K0hYrdk/xzBvZ/rBjPgLVH0kdN7b8C9cL7+uRIRGe5Zg5vgeD//ZZey
	wSbBo6Ae7/AalnyzogO2BXpi8qGZYVQCiP6qbErmzIX37QxlsMlsCR5p34U2pIjhTsTlyY78mjjNV
	uCOK9/tLP8jxJ/PkbZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DGR-00AvnC-17; Thu, 08 Dec 2022 09:32:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cy4-00AhTb-Ab
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 09:13:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 991B961E2E;
	Thu,  8 Dec 2022 09:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B4CC433D6;
	Thu,  8 Dec 2022 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670490803;
	bh=LvDWkebzqIcj6lyYVhxG3SUkKIDjdF9n3kVqbRNzao8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=acXozCW9PE1mJgO3ARK0tsitM5DkvFMJmxl74UkKWlOBuS9VFSudBkixn/kAeDCf1
	 vnPdqyBVP/Kr2G34Sp67YrT7x/p6OG1R7fJvUj6DBi4RFupJLm7Ac7ZysAvGgAsEai
	 oCEyxrjIb3/haw2Ujtw/1CjE6/NInkKCu7T31IUilrcLCXSP00e0Qc/yS6v6pgIG0u
	 sxhFvypWZEiMp+bl568LR4kGfUBnU9Fif3yBgg5VnLQBGgkZKZD6rSSeDR8wjj950P
	 vBEWgAIHH2AF2KhyCUJtYcyxTM1HYbRu3d9z1pkoTSETO6bCE32qF0WiNqSWg9Dgut
	 0I3e9PNwY1vQw==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	suagrfillet@gmail.com,
	andy.chiu@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next V5 5/7] riscv: ftrace: Make ftrace_caller call ftrace_graph_func
Date: Thu,  8 Dec 2022 04:12:42 -0500
Message-Id: <20221208091244.203407-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221208091244.203407-1-guoren@kernel.org>
References: <20221208091244.203407-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_011324_506102_D35C9C8F 
X-CRM114-Status: GOOD (  14.79  )
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

From: Song Shuai <suagrfillet@gmail.com>

In order to make the function graph use ftrace directly, ftrace_caller
should be adjusted to save the necessary regs against the pt_regs layout
so it can call ftrace_graph_func reasonably.

SAVE_ALL now saves all the regs according to the pt_regs struct. Here
supersedes SAVE_ALL by SAVE_ABI_REGS which has an extra option to allow
saving only the necessary ABI-related regs for ftrace_caller.

ftrace_caller and ftrace_regs_caller save their regs with the respective
option of SAVE_ABI_REGS, then call the tracing function, especially
graph_ops's ftrace_graph_func. So the ftrace_graph_[regs]_call labels
aren't needed anymore if FTRACE_WITH_REGS is defined.

As the previous patch described, the ftrace_caller remains with its
ftrace_graph_call if FTRACE_WITH_REGS isn't defined,

For convenience, the original argument setup for the tracing function in
ftrace_[regs]_caller is separated as PREPARE_ARGS.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/mcount-dyn.S | 142 ++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 64bc79816f5e..466c6ef217b1 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -57,19 +57,52 @@
 	.endm
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	.macro SAVE_ALL
+
+/**
+* SAVE_ABI_REGS - save regs against the pt_regs struct
+*
+* @all: tell if saving all the regs
+*
+* If all is set, all the regs will be saved, otherwise only ABI
+* related regs (a0-a7,epc,ra and optional s0) will be saved.
+*
+* After the stack is established,
+*
+* 0(sp) stores the PC of the traced function which can be accessed
+* by &(fregs)->regs->epc in tracing function. Note that the real
+* function entry address should be computed with -FENTRY_RA_OFFSET.
+*
+* 8(sp) stores the function return address (i.e. parent IP) that
+* can be accessed by &(fregs)->regs->ra in tracing function.
+*
+* The other regs are saved at the respective localtion and accessed
+* by the respective pt_regs member.
+*
+* Here is the layout of stack for your reference.
+*
+* PT_SIZE_ON_STACK  ->  +++++++++
+*                       + ..... +
+*                       + t3-t6 +
+*                       + s2-s11+
+*                       + a0-a7 + --++++-> ftrace_caller saved
+*                       + s1    +   +
+*                       + s0    + --+
+*                       + t0-t2 +   +
+*                       + tp    +   +
+*                       + gp    +   +
+*                       + sp    +   +
+*                       + ra    + --+ // parent IP
+*               sp  ->  + epc   + --+ // PC
+*                       +++++++++
+**/
+	.macro SAVE_ABI_REGS, all=0
 	addi	sp, sp, -PT_SIZE_ON_STACK
 
 	REG_S t0,  PT_EPC(sp)
 	REG_S x1,  PT_RA(sp)
-	REG_S x2,  PT_SP(sp)
-	REG_S x3,  PT_GP(sp)
-	REG_S x4,  PT_TP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
+
+	// always save the ABI regs
+
 	REG_S x10, PT_A0(sp)
 	REG_S x11, PT_A1(sp)
 	REG_S x12, PT_A2(sp)
@@ -78,6 +111,18 @@
 	REG_S x15, PT_A5(sp)
 	REG_S x16, PT_A6(sp)
 	REG_S x17, PT_A7(sp)
+
+	// save the leftover regs
+
+	.if \all == 1
+	REG_S x2,  PT_SP(sp)
+	REG_S x3,  PT_GP(sp)
+	REG_S x4,  PT_TP(sp)
+	REG_S x5,  PT_T0(sp)
+	REG_S x6,  PT_T1(sp)
+	REG_S x7,  PT_T2(sp)
+	REG_S x8,  PT_S0(sp)
+	REG_S x9,  PT_S1(sp)
 	REG_S x18, PT_S2(sp)
 	REG_S x19, PT_S3(sp)
 	REG_S x20, PT_S4(sp)
@@ -92,19 +137,19 @@
 	REG_S x29, PT_T4(sp)
 	REG_S x30, PT_T5(sp)
 	REG_S x31, PT_T6(sp)
+
+	// save s0 if FP_TEST defined
+
+	.else
+#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
+	REG_S x8,  PT_S0(sp)
+#endif
+	.endif
 	.endm
 
-	.macro RESTORE_ALL
+	.macro RESTORE_ABI_REGS, all=0
 	REG_L t0,  PT_EPC(sp)
 	REG_L x1,  PT_RA(sp)
-	REG_L x2,  PT_SP(sp)
-	REG_L x3,  PT_GP(sp)
-	REG_L x4,  PT_TP(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x8,  PT_S0(sp)
-	REG_L x9,  PT_S1(sp)
 	REG_L x10, PT_A0(sp)
 	REG_L x11, PT_A1(sp)
 	REG_L x12, PT_A2(sp)
@@ -113,6 +158,16 @@
 	REG_L x15, PT_A5(sp)
 	REG_L x16, PT_A6(sp)
 	REG_L x17, PT_A7(sp)
+
+	.if \all == 1
+	REG_L x2,  PT_SP(sp)
+	REG_L x3,  PT_GP(sp)
+	REG_L x4,  PT_TP(sp)
+	REG_L x5,  PT_T0(sp)
+	REG_L x6,  PT_T1(sp)
+	REG_L x7,  PT_T2(sp)
+	REG_L x8,  PT_S0(sp)
+	REG_L x9,  PT_S1(sp)
 	REG_L x18, PT_S2(sp)
 	REG_L x19, PT_S3(sp)
 	REG_L x20, PT_S4(sp)
@@ -128,10 +183,25 @@
 	REG_L x30, PT_T5(sp)
 	REG_L x31, PT_T6(sp)
 
+	.else
+#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
+	REG_L x8,  PT_S0(sp)
+#endif
+	.endif
 	addi	sp, sp, PT_SIZE_ON_STACK
 	.endm
+
+	.macro PREPARE_ARGS
+	addi	a0, t0, -FENTRY_RA_OFFSET	// ip
+	la	a1, function_trace_op
+	REG_L	a2, 0(a1)			// op
+	REG_L	a1, PT_RA(sp)			// parent_ip
+	mv	a3, sp				// fregs
+	.endm
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
+#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 ENTRY(ftrace_caller)
 	SAVE_ABI
 
@@ -160,33 +230,29 @@ ftrace_graph_call:
 	jr t0
 ENDPROC(ftrace_caller)
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 ENTRY(ftrace_regs_caller)
-	SAVE_ALL
-
-	addi	a0, t0, -FENTRY_RA_OFFSET
-	la	a1, function_trace_op
-	REG_L	a2, 0(a1)
-	REG_L	a1, PT_RA(sp)
-	mv	a3, sp
+	SAVE_ABI_REGS 1
+	PREPARE_ARGS
 
 ftrace_regs_call:
 	.global ftrace_regs_call
 	call	ftrace_stub
 
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	addi	a0, sp, PT_RA
-	REG_L	a1, PT_T0(sp)
-	addi	a1, a1, -FENTRY_RA_OFFSET
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
-	mv	a2, s0
-#endif
-ftrace_graph_regs_call:
-	.global ftrace_graph_regs_call
-	call	ftrace_stub
-#endif
 
-	RESTORE_ALL
+	RESTORE_ABI_REGS 1
 	jr t0
 ENDPROC(ftrace_regs_caller)
+
+ENTRY(ftrace_caller)
+	SAVE_ABI_REGS 0
+	PREPARE_ARGS
+
+ftrace_call:
+	.global ftrace_call
+	call	ftrace_stub
+
+	RESTORE_ABI_REGS 0
+	jr t0
+ENDPROC(ftrace_caller)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
