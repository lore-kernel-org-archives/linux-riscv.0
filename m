Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C0C54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQLiFWaEEOVGmTlMskE5zw9mG0Cww8bSk8wuw4gbEtY=; b=eEIRYB0+egpEAI
	hKhUAjYt1uVQTjDNKoB6WCRTUZoa4PXWlF/DfwgklmGpocvvjqjyA7BHJbLj5jCenGtgg/WAwlxwW
	PgcRIldP4QrYwYvCkDpP5dCsEU7o1vuRmCZ/wgT0DFV12cj09Usgw20QOFPbcaJ+nrE9dXpBiRFVW
	sIlfUR01A0jekeRRFXbFp0FSDVVEi1yGghyTYWuSDaSxel/h1lWKelcLWyQXEslx1H1yqjuCOPNhB
	ZNSFPrsM6Iu+lPV/NM9EZbJ/VsiiKD0SaIDelrxdpen91m3kxgiwUCnXndna8dDBxLiUBPIZ9Cpm6
	EbBHsHCTHhFttHfzM9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtYP-00EH3u-Fq; Thu, 12 Jan 2023 09:07:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtXh-00EGgf-Ih
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 09:06:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29A5461FA2;
	Thu, 12 Jan 2023 09:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B589DC433EF;
	Thu, 12 Jan 2023 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673514396;
	bh=AcQPMa1xem2L3CVjL895ndWZGRAVPIn0wP4CjkQEVMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGcVfVuAHS8L4n67pfSMSIheXgKu9fPNcNblTy0bKS2AiVLCU0UV8BrBfDmGsy1xB
	 KoLJG1iDQPNCPJGKAOJUpZ8lAZKBfZQvl3mapjjNB04r+j8UTKmM8Di8oZrSjlChF2
	 KUrJ5G4oWdBHV244mKLLbBY6A0aYHaZ4u/YyEP9RD3C4ITqkC2tXVibQuxDKbZGglY
	 aJKGfqn79RdpUYPTrJnPmz4dXXAeoUZoxGGPmTfz+I2ZGuTzrKvhTj2kh2AhKhOpyn
	 MKNwSU/XVW+Se8+U1GUXSyVCLmjmH6JlhVYI2ISw5fmJu6vDS162K8qsw4eVX4YvBO
	 K6pT22v2NUC0g==
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
	andy.chiu@sifive.com,
	e.shatokhin@yadro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -next V7 4/7] riscv: ftrace: Add ftrace_graph_func
Date: Thu, 12 Jan 2023 04:06:00 -0500
Message-Id: <20230112090603.1295340-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230112090603.1295340-1-guoren@kernel.org>
References: <20230112090603.1295340-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_010637_771484_ECF076AB 
X-CRM114-Status: GOOD (  17.00  )
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

Here implements ftrace_graph_func as the function graph tracing function
with FTRACE_WITH_REGS defined.

function_graph_func gets the point of the parent IP and the frame pointer
from fregs and call prepare_ftrace_return for function graph tracing.

If FTRACE_WITH_REGS isn't defined, the enable/disable helpers of
ftrace_graph_[regs]_call are revised for serving only ftrace_graph_call
in the !FTRACE_WITH_REGS version ftrace_caller.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/ftrace.h |  13 ++-
 arch/riscv/kernel/ftrace.c      |  30 +++----
 arch/riscv/kernel/mcount-dyn.S  | 139 +++++++++++++++++++++++---------
 3 files changed, 126 insertions(+), 56 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 9e73922e1e2e..84f856a3286e 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -107,8 +107,17 @@ do {									\
 struct dyn_ftrace;
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop
-#endif
 
-#endif
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+struct ftrace_ops;
+struct ftrace_regs;
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+		       struct ftrace_ops *op, struct ftrace_regs *fregs);
+#define ftrace_graph_func ftrace_graph_func
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* CONFIG_DYNAMIC_FTRACE */
 
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 5bff37af4770..95e14d8161a4 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -169,32 +169,28 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+		       struct ftrace_ops *op, struct ftrace_regs *fregs)
+{
+	struct pt_regs *regs = arch_ftrace_get_regs(fregs);
+	unsigned long *parent = (unsigned long *)&regs->ra;
+
+	prepare_ftrace_return(parent, ip, frame_pointer(regs));
+}
+#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 extern void ftrace_graph_call(void);
-extern void ftrace_graph_regs_call(void);
 int ftrace_enable_ftrace_graph_caller(void)
 {
-	int ret;
-
-	ret = __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, true, true);
-	if (ret)
-		return ret;
-
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
+	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
 				    (unsigned long)&prepare_ftrace_return, true, true);
 }
 
 int ftrace_disable_ftrace_graph_caller(void)
 {
-	int ret;
-
-	ret = __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, false, true);
-	if (ret)
-		return ret;
-
-	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
+	return __ftrace_modify_call((unsigned long)&ftrace_graph_call,
 				    (unsigned long)&prepare_ftrace_return, false, true);
 }
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 #endif /* CONFIG_DYNAMIC_FTRACE */
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 125de818d1ba..f26e9f6e2fed 100644
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
@@ -92,18 +137,19 @@
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
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x8,  PT_S0(sp)
-	REG_L x9,  PT_S1(sp)
 	REG_L x10, PT_A0(sp)
 	REG_L x11, PT_A1(sp)
 	REG_L x12, PT_A2(sp)
@@ -112,6 +158,15 @@
 	REG_L x15, PT_A5(sp)
 	REG_L x16, PT_A6(sp)
 	REG_L x17, PT_A7(sp)
+
+	.if \all == 1
+	REG_L x2,  PT_SP(sp)
+	REG_L x3,  PT_GP(sp)
+	REG_L x4,  PT_TP(sp)
+	REG_L x6,  PT_T1(sp)
+	REG_L x7,  PT_T2(sp)
+	REG_L x8,  PT_S0(sp)
+	REG_L x9,  PT_S1(sp)
 	REG_L x18, PT_S2(sp)
 	REG_L x19, PT_S3(sp)
 	REG_L x20, PT_S4(sp)
@@ -127,10 +182,25 @@
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
+	mv	a1, ra				// parent_ip
+	mv	a3, sp				// fregs
+	.endm
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
+#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 ENTRY(ftrace_caller)
 	SAVE_ABI
 
@@ -159,33 +229,28 @@ ftrace_graph_call:
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
-	mv	a1, ra
-	mv	a3, sp
+	SAVE_ABI_REGS 1
+	PREPARE_ARGS
 
 ftrace_regs_call:
 	.global ftrace_regs_call
 	call	ftrace_stub
 
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	addi	a0, sp, PT_RA
-	REG_L	a1, PT_EPC(sp)
-	addi	a1, a1, -FENTRY_RA_OFFSET
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
-	mv	a2, s0
-#endif
-ftrace_graph_regs_call:
-	.global ftrace_graph_regs_call
+	RESTORE_ABI_REGS 1
+	jr t0
+ENDPROC(ftrace_regs_caller)
+
+ENTRY(ftrace_caller)
+	SAVE_ABI_REGS 0
+	PREPARE_ARGS
+
+ftrace_call:
+	.global ftrace_call
 	call	ftrace_stub
-#endif
 
-	RESTORE_ALL
+	RESTORE_ABI_REGS 0
 	jr t0
-ENDPROC(ftrace_regs_caller)
+ENDPROC(ftrace_caller)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
