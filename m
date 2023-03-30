Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45554C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe8nNFI8Y085DgtQazH67r4WFRoQx8/VvxSgBEjlwyw=; b=CEB5H3YhKcdhk+
	t+V7sbzdBk/ZlUTg6KQhwasPIP5OMUa5QiMV1SiCfqkEdtbvgueCJYBQ8gEgs7sFQyeTI+g+QKmmp
	KLvfPr98k4MlglIEADIT84L28EaFos/GfKRWCOngOhuYKQptLLA7wSZeIspxqMx1SqUZV3uZx8A/F
	qJIggVur9abqCJj1ia9O0zkz1XEYZvKndU/PyZUPvj+XPMVVBW8rEBZhofVWH61nqIAE2g97d7sjY
	KX01GXsmBBAZGGNIbaM4Zsn83eWpOqdAVbN9JwiaPDH4ehcnOTLOLl6xi48W2MJhcozqukQP8EFoi
	nZ5/cKHQVJSWcK3qFkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phqd7-003dKA-1W;
	Thu, 30 Mar 2023 11:39:45 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phqd2-003dC8-2N;
	Thu, 30 Mar 2023 11:39:42 +0000
Received: from ubuntu.localdomain (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 0CED9580C18;
	Thu, 30 Mar 2023 19:39:25 +0800 (CST)
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
Subject: [PATCH v9 3/8] ARM: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Date: Thu, 30 Mar 2023 04:39:10 -0700
Message-Id: <762760c8b7cdd0641a4474f25e42bd06d6e4781c.1680176068.git.pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1680176068.git.pengdonglin@sangfor.com.cn>
References: <cover.1680176068.git.pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUIaVkseT0lKGBofHU5IQ1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS0hKTFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OAw6Eyo5Lj0SF08xAi40STBM
	NUgKCk5VSlVKTUNLSkxNSE1NTk5KVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFNSkhJNwY+
X-HM-Tid: 0a873250c21c2eb7kusn0ced9580c18
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_043940_934508_AE85784A 
X-CRM114-Status: GOOD (  13.54  )
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
the ARM platform.

We introduce a new structure called fgraph_ret_regs for the ARM platform
to hold return registers and the frame pointer. We then fill its content
in the return_to_handler and pass its address to the function
ftrace_return_to_handler to record the return value.

Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
v9:
 - Fix stack pointer align issues
 - Update the commit message

v8:
 - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
---
 arch/arm/Kconfig               |  1 +
 arch/arm/include/asm/ftrace.h  | 20 ++++++++++++++++++++
 arch/arm/kernel/asm-offsets.c  |  6 +++++-
 arch/arm/kernel/entry-ftrace.S | 10 ++++++----
 4 files changed, 32 insertions(+), 5 deletions(-)

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
index 7e9251ca29fe..558bd9d1f9b0 100644
--- a/arch/arm/include/asm/ftrace.h
+++ b/arch/arm/include/asm/ftrace.h
@@ -77,4 +77,24 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
 
 #endif /* ifndef __ASSEMBLY__ */
 
+#ifndef __ASSEMBLY__
+struct fgraph_ret_regs {
+	/* r0 - r3 */
+	unsigned long regs[4];
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
+#endif
+
 #endif /* _ASM_ARM_FTRACE */
diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
index 38121c59cbc2..14853550db6d 100644
--- a/arch/arm/kernel/asm-offsets.c
+++ b/arch/arm/kernel/asm-offsets.c
@@ -23,6 +23,7 @@
 #include <asm/suspend.h>
 #include <asm/vdso_datapage.h>
 #include <asm/hardware/cache-l2x0.h>
+#include <asm/ftrace.h>
 #include <linux/kbuild.h>
 #include <linux/arm-smccc.h>
 #include "signal.h"
@@ -170,5 +171,8 @@ int main(void)
   DEFINE(KEXEC_INDIR_PAGE,	offsetof(struct kexec_relocate_data, kexec_indirection_page));
   DEFINE(KEXEC_MACH_TYPE,	offsetof(struct kexec_relocate_data, kexec_mach_type));
   DEFINE(KEXEC_R2,		offsetof(struct kexec_relocate_data, kexec_r2));
-  return 0; 
+  BLANK();
+  DEFINE(FGRET_REGS_SIZE,	sizeof(struct fgraph_ret_regs));
+  BLANK();
+  return 0;
 }
diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
index 3e7bcaca5e07..d41a1676608c 100644
--- a/arch/arm/kernel/entry-ftrace.S
+++ b/arch/arm/kernel/entry-ftrace.S
@@ -257,11 +257,13 @@ ENDPROC(ftrace_graph_regs_caller)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 ENTRY(return_to_handler)
-	stmdb	sp!, {r0-r3}
-	add	r0, sp, #16		@ sp at exit of instrumented routine
+	mov	ip, sp				@ sp at exit of instrumented routine
+	stmdb	sp!, {r0-r3, ip, lr}		@ fill fgraph_ret_regs
+	mov	r0, sp
 	bl	ftrace_return_to_handler
-	mov	lr, r0			@ r0 has real ret addr
-	ldmia	sp!, {r0-r3}
+	mov	lr, r0				@ r0 has real ret addr
+	ldmia	sp, {r0-r3}
+	add	sp, sp, #FGRET_REGS_SIZE	@ restore stack pointer
 	ret	lr
 ENDPROC(return_to_handler)
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
