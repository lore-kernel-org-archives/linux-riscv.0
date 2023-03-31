Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5954BC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2qABFIGZNj3p0CC+km+IVhCJkd6HbVWuglJOfLxGcg=; b=3DJQOwu4PyVdy9
	E90y8iOoXjSaKyuajwFkx09wGaBX3Jo+CbuXuGaqNcBKtjHEJ5UgBRmYlWtiFkY+sAd99t6gnDd8w
	PbEUOja073FzsVuGkKB3uWCIsqiJhc2wY8LA+1xBWsBPG1FQcBFntDMVGXUz61HBxGUsmLmqwM/Qw
	/X5Wvsr40IQkIC89kFOZOaoooIXUTW1DcVBZULn26Cznbk4Qef60a51SCq0YsnEQ5wuiIroAHh89Q
	bimn6b+jOD5md4czb99/jkj7/thluJggLS9dXCoePdlbxtrzhxIOAu6dhwlXg3aJJh1KY36OjQkfv
	C980m75llSAqyyT9U2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEC7-007POX-0i;
	Fri, 31 Mar 2023 12:49:27 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEB9-007Ok9-2f;
	Fri, 31 Mar 2023 12:48:33 +0000
Received: from ubuntu.localdomain (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 7D0D958022B;
	Fri, 31 Mar 2023 20:48:13 +0800 (CST)
From: Donglin Peng <pengdonglin@sangfor.com.cn>
To: mhiramat@kernel.org,
	rostedt@goodmis.org,
	linux@armlinux.org.uk,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	rmk+kernel@armlinux.org.uk,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	bp@alien8.de,
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
Subject: [PATCH v10 7/8] LoongArch: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Date: Fri, 31 Mar 2023 05:47:43 -0700
Message-Id: <2f5d47ce9f7cf35ee2d292def7106169b9e41dc5.1680265828.git.pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
References: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0hOVk1KTxodGUtISRlLSFUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS0hKTFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pyo6GSo*DD0UTE1MQjpMITQ0
	TigwFCNVSlVKTUNLSU1NQ0JOSUlNVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFMQ01MNwY+
X-HM-Tid: 0a8737b61d302eb7kusn7d0d958022b
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_054828_702553_870F8800 
X-CRM114-Status: GOOD (  12.89  )
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

The previous patch ("function_graph: Support recording and printing
the return value of function") has laid the groundwork for the for
the funcgraph-retval, and this modification makes it available on
the LoongArch platform.

We introduce a new structure called fgraph_ret_regs for the LoongArch
platform to hold return registers and the frame pointer. We then fill
its content in the return_to_handler and pass its address to the
function ftrace_return_to_handler to record the return value.

Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
v10:
 - Fix code style issues for LoongArch
 - Use CONFIG_FUNCTION_GRAPH_TRACER to control fgraph_ret_regs definition

v9:
 - Fix stack pointer align issues
 - Update the commit message

v8:
 - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
---
 arch/loongarch/Kconfig              |  1 +
 arch/loongarch/include/asm/ftrace.h | 22 ++++++++++++++++++++++
 arch/loongarch/kernel/asm-offsets.c | 15 ++++++++++++++-
 arch/loongarch/kernel/mcount.S      | 14 ++++++++------
 arch/loongarch/kernel/mcount_dyn.S  | 15 ++++++++-------
 5 files changed, 53 insertions(+), 14 deletions(-)

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
index 3418d32d4fc7..22797b7504b5 100644
--- a/arch/loongarch/include/asm/ftrace.h
+++ b/arch/loongarch/include/asm/ftrace.h
@@ -63,4 +63,26 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 
 #endif /* CONFIG_FUNCTION_TRACER */
 
+#ifndef __ASSEMBLY__
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+struct fgraph_ret_regs {
+	/* a0 - a1 */
+	unsigned long regs[2];
+
+	unsigned long fp;
+	unsigned long __unused;
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
+#endif /* ifdef CONFIG_FUNCTION_GRAPH_TRACER */
+#endif
+
 #endif /* _ASM_LOONGARCH_FTRACE_H */
diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kernel/asm-offsets.c
index 4bdb203fc66e..505e4bf59603 100644
--- a/arch/loongarch/kernel/asm-offsets.c
+++ b/arch/loongarch/kernel/asm-offsets.c
@@ -12,6 +12,7 @@
 #include <asm/cpu-info.h>
 #include <asm/ptrace.h>
 #include <asm/processor.h>
+#include <asm/ftrace.h>
 
 void output_ptreg_defines(void)
 {
@@ -264,7 +265,7 @@ void output_smpboot_defines(void)
 #ifdef CONFIG_HIBERNATION
 void output_pbe_defines(void)
 {
-	COMMENT(" Linux struct pbe offsets. ");
+	COMMENT("Linux struct pbe offsets.");
 	OFFSET(PBE_ADDRESS, pbe, address);
 	OFFSET(PBE_ORIG_ADDRESS, pbe, orig_address);
 	OFFSET(PBE_NEXT, pbe, next);
@@ -272,3 +273,15 @@ void output_pbe_defines(void)
 	BLANK();
 }
 #endif
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+void output_fgraph_ret_regs_defines(void)
+{
+	COMMENT("LoongArch fgraph_ret_regs offsets.");
+	OFFSET(FGRET_REGS_A0, fgraph_ret_regs, regs[0]);
+	OFFSET(FGRET_REGS_A1, fgraph_ret_regs, regs[1]);
+	OFFSET(FGRET_REGS_FP, fgraph_ret_regs, fp);
+	DEFINE(FGRET_REGS_SIZE, sizeof(struct fgraph_ret_regs));
+	BLANK();
+}
+#endif
diff --git a/arch/loongarch/kernel/mcount.S b/arch/loongarch/kernel/mcount.S
index 8cdc1563cd33..cb8e5803de4b 100644
--- a/arch/loongarch/kernel/mcount.S
+++ b/arch/loongarch/kernel/mcount.S
@@ -79,18 +79,20 @@ SYM_FUNC_START(ftrace_graph_caller)
 SYM_FUNC_END(ftrace_graph_caller)
 
 SYM_FUNC_START(return_to_handler)
-	PTR_ADDI	sp, sp, -2 * SZREG
-	PTR_S		a0, sp, 0
-	PTR_S		a1, sp, SZREG
+	PTR_ADDI	sp, sp, -FGRET_REGS_SIZE
+	PTR_S		a0, sp, FGRET_REGS_A0
+	PTR_S		a1, sp, FGRET_REGS_A1
+	PTR_S		zero, sp, FGRET_REGS_FP
 
+	move		a0, sp
 	bl		ftrace_return_to_handler
 
 	/* Restore the real parent address: a0 -> ra */
 	move		ra, a0
 
-	PTR_L		a0, sp, 0
-	PTR_L		a1, sp, SZREG
-	PTR_ADDI	sp, sp, 2 * SZREG
+	PTR_L		a0, sp, FGRET_REGS_A0
+	PTR_L		a1, sp, FGRET_REGS_A1
+	PTR_ADDI	sp, sp, FGRET_REGS_SIZE
 	jr		ra
 SYM_FUNC_END(return_to_handler)
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/loongarch/kernel/mcount_dyn.S b/arch/loongarch/kernel/mcount_dyn.S
index bbabf06244c2..ec24ae1de741 100644
--- a/arch/loongarch/kernel/mcount_dyn.S
+++ b/arch/loongarch/kernel/mcount_dyn.S
@@ -131,18 +131,19 @@ SYM_CODE_END(ftrace_graph_caller)
 
 SYM_CODE_START(return_to_handler)
 	/* Save return value regs */
-	PTR_ADDI 	sp, sp, -2 * SZREG
-	PTR_S		a0, sp, 0
-	PTR_S		a1, sp, SZREG
+	PTR_ADDI	sp, sp, -FGRET_REGS_SIZE
+	PTR_S		a0, sp, FGRET_REGS_A0
+	PTR_S		a1, sp, FGRET_REGS_A1
+	PTR_S		zero, sp, FGRET_REGS_FP
 
-	move		a0, zero
+	move		a0, sp
 	bl		ftrace_return_to_handler
 	move		ra, a0
 
 	/* Restore return value regs */
-	PTR_L		a0, sp, 0
-	PTR_L		a1, sp, SZREG
-	PTR_ADDI 	sp, sp, 2 * SZREG
+	PTR_L		a0, sp, FGRET_REGS_A0
+	PTR_L		a1, sp, FGRET_REGS_A1
+	PTR_ADDI	sp, sp, FGRET_REGS_SIZE
 
 	jr		ra
 SYM_CODE_END(return_to_handler)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
