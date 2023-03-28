Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F714C77B6D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i88c8kW2fF/U9mGUL8XZW3+1hENXKW8TYulANH+H1jM=; b=HdCONYqhtulU88
	KxkV+aaF7T7vYwKxDuq7F2cG6aTj6h1ATmQIMPli7kZOWXBkNjZWm6NASEbT+Q1nc4jBAPESLUPbR
	gls5ym5LDhdwjdPx/hmVIr3FtrlHr9Rqr4LQrbKPGlQJhzcrwnJZ+vOHHMyGwffvOHYNB3cW4FONU
	mILwFW6+t+PmfH2svuWieb7ydbY8aJIkza6BxwI6kqpitiPt7gTZ0KSDPXWMjzlAcMrs2XPAocZa7
	qBvLE5XagJ7ya7pD4GLylE1r8xHSBYUh/dJFqk/ZnZET8BjxoDkNEYwKf76p74tChkXuPOfTcWWh8
	h9lQh/UltyZNFXk5ipSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9co-00Eemq-26;
	Tue, 28 Mar 2023 13:44:34 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9c8-00EeRr-2x;
	Tue, 28 Mar 2023 13:43:55 +0000
Received: from ubuntu.localdomain (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 487B1580407;
	Tue, 28 Mar 2023 21:43:32 +0800 (CST)
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
Subject: [PATCH v8 7/8] LoongArch: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Date: Tue, 28 Mar 2023 06:43:18 -0700
Message-Id: <20230328134319.2185812-8-pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328134319.2185812-1-pengdonglin@sangfor.com.cn>
References: <20230328134319.2185812-1-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHhkYVh4aTUkZHx1DH0xISlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS09LQ1VKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6PRw4Ej0KA1YfAQsTDzUv
	IxBPCxJVSlVKTUNLS0pKS0pITEpIVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFOQ0xCNwY+
X-HM-Tid: 0a872875ac292eb7kusn487b1580407
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_064353_130055_DD3BACE8 
X-CRM114-Status: GOOD (  10.57  )
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
on the LoongArch platform.

We introduce a new structure called fgraph_ret_regs for the LoongArch
platform to hold return registers and the frame pointer. We then fill
its content in the return_to_handler and pass its address to the
function ftrace_return_to_handler to record the return value.

Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
v8:
 - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
---
 arch/loongarch/Kconfig              |  1 +
 arch/loongarch/include/asm/ftrace.h | 18 ++++++++++++++++++
 arch/loongarch/kernel/mcount.S      |  6 ++++--
 arch/loongarch/kernel/mcount_dyn.S  |  7 ++++---
 4 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 7fd51257e0ed..4bf60132869b 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -99,6 +99,7 @@ config LOONGARCH
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_ARG_ACCESS_API
+	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GENERIC_VDSO
diff --git a/arch/loongarch/include/asm/ftrace.h b/arch/loongarch/include/asm/ftrace.h
index 3418d32d4fc7..433c6218888b 100644
--- a/arch/loongarch/include/asm/ftrace.h
+++ b/arch/loongarch/include/asm/ftrace.h
@@ -63,4 +63,22 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 
 #endif /* CONFIG_FUNCTION_TRACER */
 
+#ifndef __ASSEMBLY__
+struct fgraph_ret_regs {
+	unsigned long a0;
+	unsigned long a1;
+	unsigned long fp;
+};
+
+static inline unsigned long fgraph_ret_regs_return_value(struct fgraph_ret_regs *ret_regs)
+{
+	return ret_regs->a0;
+}
+
+static inline unsigned long fgraph_ret_regs_frame_pointer(struct fgraph_ret_regs *ret_regs)
+{
+	return ret_regs->fp;
+}
+#endif
+
 #endif /* _ASM_LOONGARCH_FTRACE_H */
diff --git a/arch/loongarch/kernel/mcount.S b/arch/loongarch/kernel/mcount.S
index 8cdc1563cd33..3e405c0212c0 100644
--- a/arch/loongarch/kernel/mcount.S
+++ b/arch/loongarch/kernel/mcount.S
@@ -79,10 +79,12 @@ SYM_FUNC_START(ftrace_graph_caller)
 SYM_FUNC_END(ftrace_graph_caller)
 
 SYM_FUNC_START(return_to_handler)
-	PTR_ADDI	sp, sp, -2 * SZREG
+	PTR_ADDI	sp, sp, -3 * SZREG
 	PTR_S		a0, sp, 0
 	PTR_S		a1, sp, SZREG
+	PTR_S		zero, sp, 2 * SZREG
 
+	move		a0, sp
 	bl		ftrace_return_to_handler
 
 	/* Restore the real parent address: a0 -> ra */
@@ -90,7 +92,7 @@ SYM_FUNC_START(return_to_handler)
 
 	PTR_L		a0, sp, 0
 	PTR_L		a1, sp, SZREG
-	PTR_ADDI	sp, sp, 2 * SZREG
+	PTR_ADDI	sp, sp, 3 * SZREG
 	jr		ra
 SYM_FUNC_END(return_to_handler)
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/loongarch/kernel/mcount_dyn.S b/arch/loongarch/kernel/mcount_dyn.S
index bbabf06244c2..ab85a953c6d3 100644
--- a/arch/loongarch/kernel/mcount_dyn.S
+++ b/arch/loongarch/kernel/mcount_dyn.S
@@ -131,18 +131,19 @@ SYM_CODE_END(ftrace_graph_caller)
 
 SYM_CODE_START(return_to_handler)
 	/* Save return value regs */
-	PTR_ADDI 	sp, sp, -2 * SZREG
+	PTR_ADDI 	sp, sp, -3 * SZREG
 	PTR_S		a0, sp, 0
 	PTR_S		a1, sp, SZREG
+	PTR_S		zero, sp, 2 * SZREG
 
-	move		a0, zero
+	move		a0, sp
 	bl		ftrace_return_to_handler
 	move		ra, a0
 
 	/* Restore return value regs */
 	PTR_L		a0, sp, 0
 	PTR_L		a1, sp, SZREG
-	PTR_ADDI 	sp, sp, 2 * SZREG
+	PTR_ADDI 	sp, sp, 3 * SZREG
 
 	jr		ra
 SYM_CODE_END(return_to_handler)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
