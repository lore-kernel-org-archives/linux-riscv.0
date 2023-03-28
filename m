Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C81C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IkY6wwLbssCoVFhhFJmujm77QQNHMhAj/9JKdmhNNg=; b=zO/FVed+1qi1pD
	rZcaYOruNRyEANcZuEtrK/YTHqDNcRp7sAbfxoEnRsoUEinZ1KSRfcj0YkWlv0KP9AHV7Az6jZhqe
	MFgTi5G6yAnKLZdYLM16zKbsKfPWfXE6hCuffE6RrRBORhMW/QK+W9WWzk4M+RuJKwKOmBvsEulcK
	5XEF4lYfSFEaKH5YeunChJ+M3P5bLDj/Geynru4h4c7T7Zyn2pekMv82yZeV4258U3LjIGXNcUSXA
	iC2PzfHcIuLGbqyhdJCXs/rWst/ZNPqwyuPz40BqbyapSN9eH0TKLTXo0zcFvybLd7ffnYD85np8C
	rWtVxn4IBZVn2RU1QT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9cA-00EeUR-22;
	Tue, 28 Mar 2023 13:43:54 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9c5-00EeIE-1b;
	Tue, 28 Mar 2023 13:43:51 +0000
Received: from ubuntu.localdomain (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 36CB95807E2;
	Tue, 28 Mar 2023 21:43:26 +0800 (CST)
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
Subject: [PATCH v8 3/8] ARM: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Date: Tue, 28 Mar 2023 06:43:14 -0700
Message-Id: <20230328134319.2185812-4-pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328134319.2185812-1-pengdonglin@sangfor.com.cn>
References: <20230328134319.2185812-1-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGE0fVkIaQk5LTEoeSUkYTVUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS0hKTFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Njo6CDo4FD0LSFYaERQtDz00
	CA4aChJVSlVKTUNLS0pKS0tMTkxCVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFPQ01PNwY+
X-HM-Tid: 0a872875948f2eb7kusn36cb95807e2
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_064349_680050_27683CB3 
X-CRM114-Status: GOOD (  11.07  )
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

The commit d4815c5d1bbd ("function_graph: Support recording and printing
the return value of function") laid the groundwork for the for the
funcgraph-retval, and this modification makes it available on the
ARM platform.

We introduce a new structure called fgraph_ret_regs for the ARM platform
to hold return registers and the frame pointer. We then fill its content
in the return_to_handler and pass its address to the function
ftrace_return_to_handler to record the return value.

Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
v8:
 - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
---
 arch/arm/Kconfig               |  1 +
 arch/arm/include/asm/ftrace.h  | 18 ++++++++++++++++++
 arch/arm/kernel/entry-ftrace.S |  6 +++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e24a9820e12f..73061379855a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -98,6 +98,7 @@ config ARM
 	select HAVE_FAST_GUP if ARM_LPAE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_ERROR_INJECTION
+	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select HAVE_GCC_PLUGINS
diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
index 7e9251ca29fe..2ab4bee21d79 100644
--- a/arch/arm/include/asm/ftrace.h
+++ b/arch/arm/include/asm/ftrace.h
@@ -77,4 +77,22 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
 
 #endif /* ifndef __ASSEMBLY__ */
 
+
+#ifndef __ASSEMBLY__
+struct fgraph_ret_regs {
+	unsigned long regs[4];
+	unsigned long fp;
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
 #endif /* _ASM_ARM_FTRACE */
diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
index 3e7bcaca5e07..5f1e74555b25 100644
--- a/arch/arm/kernel/entry-ftrace.S
+++ b/arch/arm/kernel/entry-ftrace.S
@@ -257,11 +257,15 @@ ENDPROC(ftrace_graph_regs_caller)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 ENTRY(return_to_handler)
+	sub	sp, sp, #4
 	stmdb	sp!, {r0-r3}
-	add	r0, sp, #16		@ sp at exit of instrumented routine
+	add	r0, sp, #20		@ sp at exit of instrumented routine
+	str	r0, [sp, #16]
+	mov	r0, sp
 	bl	ftrace_return_to_handler
 	mov	lr, r0			@ r0 has real ret addr
 	ldmia	sp!, {r0-r3}
+	add	sp, sp, #4		@ skip fp
 	ret	lr
 ENDPROC(return_to_handler)
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
