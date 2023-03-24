Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B257FC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfeNFqROwbn5GY/QHye4wbifmTuShFt+On/GEwxr1lY=; b=qZElLpRKVjf4Na
	RtCNjWcUsdYYtRpJzCOT2BBE7nXLAqmSRr2sqxgokRF5ihy3jchvowuC7qrrXiZWDK129AT4Nxn4s
	Rl5OBdkBXtmdIzxZz4BMKVDgjgmzwMR4VmeSHyrvqaTeJwOz1SvqOsIdScGs+/14KBPtFxXBzwtSe
	JA1/MSKxNuOtJHesqKvOPq86ikOWnJ94y5ryVIg5UOEZ3ebN0zQwRfwEUbTun4BYWqvFvymAMnie4
	AdB8r5FK8C0RTAN8Kn0N/CW2FVSNe/EtYrgx2dKA+tT1d7KXIJxktXVSOmW+m1Z4PSbBcM37TXkHT
	BGIVsF7JTiyfR3Ids5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgge-004NLz-0X;
	Fri, 24 Mar 2023 12:38:28 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfggR-004N8T-18;
	Fri, 24 Mar 2023 12:38:17 +0000
Received: from ubuntu.localdomain (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id E2B81580A5C;
	Fri, 24 Mar 2023 20:37:41 +0800 (CST)
From: Donglin Peng <pengdonglin@sangfor.com.cn>
To: mhiramat@kernel.org,
	rostedt@goodmis.org,
	linux@armlinux.org.uk,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	chenhuacai@kernel.org,
	zhangqing@loongson.cn,
	kernel@xen0n.name,
	mingo@redhat.com,
	peterz@infradead.org,
	xiehuan09@gmail.com,
	dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn,
	dolinux.peng@gmail.com
Cc: linux-trace-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Donglin Peng <pengdonglin@sangfor.com.cn>
Subject: [PATCH v7 4/8] arm64: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Date: Fri, 24 Mar 2023 05:37:27 -0700
Message-Id: <20230324123731.3801920-5-pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324123731.3801920-1-pengdonglin@sangfor.com.cn>
References: <20230324123731.3801920-1-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHkMfVk5JH00aHUIYTkxMHlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS09ISFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCI6Aww6LT0NCw89MElCERUI
	SDJPCUJVSlVKTUxCTU1KT01IT0pCVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFOSkJMNwY+
X-HM-Tid: 0a87139ff5ad2eb7kusne2b81580a5c
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_053815_670643_21BC1D31 
X-CRM114-Status: GOOD (  10.42  )
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

The commit d4815c5d1bbd ("function_graph: Support recording and
printing the return value of function") laid the groundwork for the
for the funcgraph-retval, and this modification makes it available
on the ARM64 platform.

We introduce a new structure called fgraph_ret_regs for the ARM64
platform to hold return registers and the frame pointer. We then
fill its content in the return_to_handler and pass its address to
the function ftrace_return_to_handler to record the return value.

Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
 arch/arm64/Kconfig               |  1 +
 arch/arm64/include/asm/ftrace.h  | 23 +++++++++++++++++++++++
 arch/arm64/kernel/entry-ftrace.S |  9 +++++----
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1023e896d46b..48856d230800 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -195,6 +195,7 @@ config ARM64
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_ERROR_INJECTION
+	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index 1c2672bbbf37..f68dcc41be3b 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -170,4 +170,27 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
 }
 #endif /* ifndef __ASSEMBLY__ */
 
+#ifndef __ASSEMBLY__
+
+#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
+struct fgraph_ret_regs {
+	/* x0 - x7 */
+	u64 regs[8];
+
+	u64 fp;
+};
+
+static inline unsigned long fgraph_ret_regs_return_value(struct fgraph_ret_regs *ret_regs)
+{
+	return ret_regs->regs[0];
+}
+
+static inline unsigned long fgraph_ret_regs_frame_pointer(struct fgraph_ret_regs *ret_regs)
+{
+	return ret_regs->fp;
+}
+#endif
+
+#endif
+
 #endif /* __ASM_FTRACE_H */
diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
index 350ed81324ac..8ac6f952e68f 100644
--- a/arch/arm64/kernel/entry-ftrace.S
+++ b/arch/arm64/kernel/entry-ftrace.S
@@ -270,14 +270,15 @@ SYM_FUNC_END(ftrace_stub_graph)
  */
 SYM_CODE_START(return_to_handler)
 	/* save return value regs */
-	sub sp, sp, #64
+	sub sp, sp, #72
 	stp x0, x1, [sp]
 	stp x2, x3, [sp, #16]
 	stp x4, x5, [sp, #32]
 	stp x6, x7, [sp, #48]
+	str x29,    [sp, #64]		//     parent's fp
 
-	mov	x0, x29			//     parent's fp
-	bl	ftrace_return_to_handler// addr = ftrace_return_to_hander(fp);
+	mov	x0, sp
+	bl	ftrace_return_to_handler// addr = ftrace_return_to_hander(regs);
 	mov	x30, x0			// restore the original return address
 
 	/* restore return value regs */
@@ -285,7 +286,7 @@ SYM_CODE_START(return_to_handler)
 	ldp x2, x3, [sp, #16]
 	ldp x4, x5, [sp, #32]
 	ldp x6, x7, [sp, #48]
-	add sp, sp, #64
+	add sp, sp, #72
 
 	ret
 SYM_CODE_END(return_to_handler)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
