Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB63ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ixfjs3PIqShKlh0OPsOV+LI8V310+iXMdgtVbvSu+UQ=; b=lIQGCbsWo5O2W9
	eTJnnW/JphtSLRiy0PuQrlxYFjbUWQyoGmmOM/tpgbW5l9hjbx40A42N3uxp06VTnux19Q4HEFcki
	hEoSHfGaOn+b45vwHao/0A8CN3/9jeluYGrb1v7qnAZDbeyPDAGSTO7bIXr3VZRIOOZZzTFAOkZ5H
	4LUMyxqIEKQSeDuCmgioVges5C8NCxHo7HlgkWGLx8R51kWykXbOj/LHiNsIYkWRbxunTeS4M1qPl
	9cJlsCZg3oEX7pEzikVIy7rm1ovDjSQTrjbl6lox8I8LGt5Rzb32OTVbEeGHU1bng/tNoJ60Q6AWR
	bsQYFGhSPyZoUB0CP8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazG2-00BMoM-3V; Wed, 21 Sep 2022 12:55:18 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazFw-00BMlB-Pq
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 12:55:16 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MXdZH14Zxz14RgJ;
	Wed, 21 Sep 2022 20:51:03 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 20:55:10 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 20:55:09 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<namhyung@kernel.org>, <jolsa@kernel.org>, <guoren@kernel.org>,
	<frederic@kernel.org>, <vincent.chen@sifive.com>, <ardb@kernel.org>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <keescook@chromium.org>,
	<catalin.marinas@arm.com>, <chenzhongjin@huawei.com>
Subject: [PATCH for-next v2 3/4] riscv: stacktrace: Save pt_regs in ENCODE_FRAME_POINTER
Date: Wed, 21 Sep 2022 20:51:26 +0800
Message-ID: <20220921125128.33913-4-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220921125128.33913-1-chenzhongjin@huawei.com>
References: <20220921125128.33913-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_055513_262197_55507A58 
X-CRM114-Status: GOOD (  18.00  )
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

To support stack unwinding when there is a pt_regs on stack, the position
of pt_regs is nessesary. Because for some functions, compiler only push
s0/fp on stack without ra.

As the situation described in
commit f766f77a74f5("riscv/stacktrace: Fix stack output without ra on the stack top")

When irq happens there, the function frame looks like:

prev function	|       ...       |
		|                 |
normal function +-----------------+
		| ra to prev      |
		| s0 of prev      |
		|       ...       |<-+
leaf function	+-----------------+  |
		| s0 of normal    |  |
		| empty slot      |  |
irq pt_regs	+-----------------+  |
		| epc (ra to leaf)|  |
		| ra  (ra to norm)|  |
		| ...             |  |
                | s0 of leaf      |--+
		| ...             |
		+-----------------+

When unwinding from unwinding from leaf to normal, beacause (ra to norm)
is saved in pt_regs, but not stackframe of leaf, we have to get pt_regs
for that.

To get pt_regs position on stack, we can save the encoded *pt_regs
in s0, as x86 architecture did. Then we can get s0, epc and ra
easily.

Add ENCODE_FRAME_POINTER in irq, ftrace and kretprobe trampoline entries.
For ftrace and kretprobes we should also set pt_regs as kernel mode
so that they are not mistaken as user_mode pt_regs.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/frame.h                | 45 +++++++++++++++++++
 arch/riscv/kernel/entry.S                     |  3 ++
 arch/riscv/kernel/mcount-dyn.S                |  7 +++
 arch/riscv/kernel/probes/kprobes_trampoline.S |  7 +++
 4 files changed, 62 insertions(+)
 create mode 100644 arch/riscv/include/asm/frame.h

diff --git a/arch/riscv/include/asm/frame.h b/arch/riscv/include/asm/frame.h
new file mode 100644
index 000000000000..2a1f45cf3a4e
--- /dev/null
+++ b/arch/riscv/include/asm/frame.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_FRAME_H
+#define _ASM_RISCV_FRAME_H
+
+#include <asm/asm.h>
+
+#ifdef CONFIG_FRAME_POINTER
+
+#ifdef __ASSEMBLY__
+
+/*
+ * This is a sneaky trick to help the unwinder find pt_regs on the stack.  The
+ * frame pointer is replaced with an encoded pointer to pt_regs.  The encoding
+ * is just setting the LSB, which makes it an invalid stack address and is also
+ * a signal to the unwinder that it's a pt_regs pointer in disguise.
+ *
+ * This macro must be used when sp point to pt_regs
+ */
+.macro ENCODE_FRAME_POINTER
+	add s0, sp, 0x1
+.endm
+
+#else /* !__ASSEMBLY__ */
+
+#define ENCODE_FRAME_POINTER			\
+	"add s0, sp, 0x1\n\t"
+
+#endif /* __ASSEMBLY__ */
+
+#else /* !CONFIG_FRAME_POINTER */
+
+#ifdef __ASSEMBLY__
+
+.macro ENCODE_FRAME_POINTER ptregs_offset=0
+.endm
+
+#else /* !__ASSEMBLY */
+
+#define ENCODE_FRAME_POINTER
+
+#endif /* !__ASSEMBLY */
+
+#endif /* CONFIG_FRAME_POINTER */
+
+#endif /* _ASM_RISCV_FRAME_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..ecb15c7430b4 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -13,6 +13,7 @@
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
 #include <asm/errata_list.h>
+#include <asm/frame.h>
 
 #if !IS_ENABLED(CONFIG_PREEMPTION)
 .set resume_kernel, restore_all
@@ -95,6 +96,8 @@ _save_context:
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 
+	ENCODE_FRAME_POINTER
+
 	/*
 	 * Set the scratch register to 0, so that if a recursive exception
 	 * occurs, the exception vector knows it came from the kernel
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index d171eca623b6..a362521e030e 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -10,6 +10,8 @@
 #include <asm/asm-offsets.h>
 #include <asm-generic/export.h>
 #include <asm/ftrace.h>
+#include <asm/frame.h>
+#include <asm/csr.h>
 
 	.text
 
@@ -172,6 +174,11 @@ ENDPROC(ftrace_caller)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 ENTRY(ftrace_regs_caller)
 	SAVE_ALL
+#ifdef CONFIG_FRAME_POINTER
+	li s0, SR_PP
+	REG_S s0, PT_STATUS(sp)
+	ENCODE_FRAME_POINTER
+#endif
 
 	addi	a0, ra, -FENTRY_RA_OFFSET
 	la	a1, function_trace_op
diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/kprobes_trampoline.S
index 7bdb09ded39b..70760a16784f 100644
--- a/arch/riscv/kernel/probes/kprobes_trampoline.S
+++ b/arch/riscv/kernel/probes/kprobes_trampoline.S
@@ -6,6 +6,8 @@
 
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
+#include <asm/frame.h>
+#include <asm/csr.h>
 
 	.text
 	.altmacro
@@ -78,6 +80,11 @@
 ENTRY(__kretprobe_trampoline)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	save_all_base_regs
+#ifdef CONFIG_FRAME_POINTER
+	li s0, SR_PP
+	REG_S s0, PT_STATUS(sp)
+	ENCODE_FRAME_POINTER
+#endif
 
 	move a0, sp /* pt_regs */
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
