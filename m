Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7519DCF042D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 00:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=sGqQc8benSk0V4bY1Ke3cInI2WESgzAex4uS+T2YmBo=; b=WoFdGDA1B+TRd9
	0GfaAbnw+RoC7SYF8k9WQjNSkUiCIK8jzv3AzazmBHxiaKRq5Yl6NlgvOlU+oZNhRS6jPuio3qirh
	Hdg13Y832uovrX14rldsEXVuXbKjca8Y7XywlnPfgcE4Zdh16W7vzVsJRAL3BmMFPErxmgss5kN4B
	ecq1Tg4ZSjrkX2S1qQbkWPeMdjEfVUeqxAM1yLBjQ1zCJ1EN2l+g/UHQ8DgETdEcdMn1bNSX4bRM0
	4sVZ42D/g5064kqmYUUBsnw4wLdBqeUswGHWwanGfmGIHJFKk4A+8tBxEs/kcwGgrrwuDxg35FA8v
	d3n2N9d7bSlhCBrKOe/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syKMi-00000007VD8-04Z1;
	Wed, 09 Oct 2024 00:15:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syJHf-00000007O88-0rTy;
	Tue, 08 Oct 2024 23:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6927F5C5850;
	Tue,  8 Oct 2024 23:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004DAC4CED4;
	Tue,  8 Oct 2024 23:06:25 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1syJHh-00000001174-14b5;
	Tue, 08 Oct 2024 19:06:29 -0400
Message-ID: <20241008230629.118325673@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 08 Oct 2024 19:05:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Paul  Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas  Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>,
 Borislav  Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v2 2/2] ftrace: Consolidate ftrace_regs accessor functions for archs using
 pt_regs
References: <20241008230527.674939311@goodmis.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_160627_369711_E998FFB7 
X-CRM114-Status: GOOD (  21.06  )
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

From: Steven Rostedt <rostedt@goodmis.org>

Most architectures use pt_regs within ftrace_regs making a lot of the
accessor functions just calls to the pt_regs internally. Instead of
duplication this effort, use a HAVE_ARCH_FTRACE_REGS for architectures
that have their own ftrace_regs that is not based on pt_regs and will
define all the accessor functions, and for the architectures that just use
pt_regs, it will leave it undefined, and the default accessor functions
will be used.

Note, this will also make it easier to add new accessor functions to
ftrace_regs as it will mean having to touch less architectures.

Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/arm64/include/asm/ftrace.h     |  1 +
 arch/loongarch/include/asm/ftrace.h | 25 +-------------------
 arch/powerpc/include/asm/ftrace.h   | 26 +--------------------
 arch/riscv/include/asm/ftrace.h     |  1 +
 arch/s390/include/asm/ftrace.h      | 26 +--------------------
 arch/x86/include/asm/ftrace.h       | 21 +----------------
 include/linux/ftrace.h              | 32 ++++++-------------------
 include/linux/ftrace_regs.h         | 36 +++++++++++++++++++++++++++++
 8 files changed, 49 insertions(+), 119 deletions(-)
 create mode 100644 include/linux/ftrace_regs.h

diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index bbb69c7751b9..5ccff4de7f09 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -54,6 +54,7 @@ extern void return_to_handler(void);
 unsigned long ftrace_call_adjust(unsigned long addr);
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
+#define HAVE_ARCH_FTRACE_REGS
 struct dyn_ftrace;
 struct ftrace_ops;
 struct ftrace_regs;
diff --git a/arch/loongarch/include/asm/ftrace.h b/arch/loongarch/include/asm/ftrace.h
index 0e15d36ce251..8f13eaeaa325 100644
--- a/arch/loongarch/include/asm/ftrace.h
+++ b/arch/loongarch/include/asm/ftrace.h
@@ -43,43 +43,20 @@ void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent);
 
 #ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
 struct ftrace_ops;
-struct ftrace_regs;
-#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
 
-struct __arch_ftrace_regs {
-	struct pt_regs regs;
-};
+#include <linux/ftrace_regs.h>
 
 static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
 {
 	return &arch_ftrace_regs(fregs)->regs;
 }
 
-static __always_inline unsigned long
-ftrace_regs_get_instruction_pointer(struct ftrace_regs *fregs)
-{
-	return instruction_pointer(&arch_ftrace_regs(fregs)->regs);
-}
-
 static __always_inline void
 ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs, unsigned long ip)
 {
 	instruction_pointer_set(&arch_ftrace_regs(fregs)->regs, ip);
 }
 
-#define ftrace_regs_get_argument(fregs, n) \
-	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
-#define ftrace_regs_get_stack_pointer(fregs) \
-	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_return_value(fregs) \
-	regs_return_value(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_set_return_value(fregs, ret) \
-	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
-#define ftrace_override_function_with_return(fregs) \
-	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_query_register_offset(name) \
-	regs_query_register_offset(name)
-
 #define ftrace_graph_func ftrace_graph_func
 void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 		       struct ftrace_ops *op, struct ftrace_regs *fregs);
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index e299fd47d201..0edfb874eb02 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -32,12 +32,7 @@ struct dyn_arch_ftrace {
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop
 
-struct ftrace_regs;
-#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
-
-struct __arch_ftrace_regs {
-	struct pt_regs regs;
-};
+#include <linux/ftrace_regs.h>
 
 static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
 {
@@ -52,25 +47,6 @@ ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
 	regs_set_return_ip(&arch_ftrace_regs(fregs)->regs, ip);
 }
 
-static __always_inline unsigned long
-ftrace_regs_get_instruction_pointer(struct ftrace_regs *fregs)
-{
-	return instruction_pointer(&arch_ftrace_regs(fregs)->regs);
-}
-
-#define ftrace_regs_get_argument(fregs, n) \
-	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
-#define ftrace_regs_get_stack_pointer(fregs) \
-	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_return_value(fregs) \
-	regs_return_value(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_set_return_value(fregs, ret) \
-	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
-#define ftrace_override_function_with_return(fregs) \
-	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_query_register_offset(name) \
-	regs_query_register_offset(name)
-
 struct ftrace_ops;
 
 #define ftrace_graph_func ftrace_graph_func
diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index c6bcdff105b5..3d66437a1029 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -125,6 +125,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
 #define arch_ftrace_get_regs(regs) NULL
+#define HAVE_ARCH_FTRACE_REGS
 struct ftrace_ops;
 struct ftrace_regs;
 #define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
diff --git a/arch/s390/include/asm/ftrace.h b/arch/s390/include/asm/ftrace.h
index 1498d0a9c762..fc97d75dc752 100644
--- a/arch/s390/include/asm/ftrace.h
+++ b/arch/s390/include/asm/ftrace.h
@@ -51,12 +51,7 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 	return addr;
 }
 
-struct ftrace_regs;
-#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
-
-struct __arch_ftrace_regs {
-	struct pt_regs regs;
-};
+#include <linux/ftrace_regs.h>
 
 static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
 {
@@ -84,12 +79,6 @@ static __always_inline unsigned long fgraph_ret_regs_frame_pointer(struct fgraph
 }
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
 
-static __always_inline unsigned long
-ftrace_regs_get_instruction_pointer(const struct ftrace_regs *fregs)
-{
-	return arch_ftrace_regs(fregs)->regs.psw.addr;
-}
-
 static __always_inline void
 ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
 				    unsigned long ip)
@@ -97,19 +86,6 @@ ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
 	arch_ftrace_regs(fregs)->regs.psw.addr = ip;
 }
 
-#define ftrace_regs_get_argument(fregs, n) \
-	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
-#define ftrace_regs_get_stack_pointer(fregs) \
-	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_return_value(fregs) \
-	regs_return_value(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_set_return_value(fregs, ret) \
-	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
-#define ftrace_override_function_with_return(fregs) \
-	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_query_register_offset(name) \
-	regs_query_register_offset(name)
-
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 /*
  * When an ftrace registered caller is tracing a function that is
diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
index 87943f7a299b..8f02d28c571a 100644
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -33,12 +33,8 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 }
 
 #ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
-struct ftrace_regs;
-#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
 
-struct __arch_ftrace_regs {
-	struct pt_regs		regs;
-};
+#include <linux/ftrace_regs.h>
 
 static __always_inline struct pt_regs *
 arch_ftrace_get_regs(struct ftrace_regs *fregs)
@@ -52,21 +48,6 @@ arch_ftrace_get_regs(struct ftrace_regs *fregs)
 #define ftrace_regs_set_instruction_pointer(fregs, _ip)	\
 	do { arch_ftrace_regs(fregs)->regs.ip = (_ip); } while (0)
 
-#define ftrace_regs_get_instruction_pointer(fregs) \
-	arch_ftrace_regs(fregs)->regs.ip)
-
-#define ftrace_regs_get_argument(fregs, n) \
-	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
-#define ftrace_regs_get_stack_pointer(fregs) \
-	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_return_value(fregs) \
-	regs_return_value(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_set_return_value(fregs, ret) \
-	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
-#define ftrace_override_function_with_return(fregs) \
-	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
-#define ftrace_regs_query_register_offset(name) \
-	regs_query_register_offset(name)
 
 struct ftrace_ops;
 #define ftrace_graph_func ftrace_graph_func
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index f7d4f152f84d..c96f9b0eb86e 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -113,6 +113,8 @@ static inline int ftrace_mod_get_kallsym(unsigned int symnum, unsigned long *val
 
 #ifdef CONFIG_FUNCTION_TRACER
 
+#include <linux/ftrace_regs.h>
+
 extern int ftrace_enabled;
 
 /**
@@ -150,14 +152,11 @@ struct ftrace_regs {
 #define ftrace_regs_size()	sizeof(struct __arch_ftrace_regs)
 
 #ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
-
-struct __arch_ftrace_regs {
-	struct pt_regs		regs;
-};
-
-struct ftrace_regs;
-#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
-
+/*
+ * Architectures that define HAVE_DYNAMIC_FTRACE_WITH_ARGS must define their own
+ * arch_ftrace_get_regs() where it only returns pt_regs *if* it is fully
+ * populated. It should return NULL otherwise.
+ */
 static inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
 {
 	return &arch_ftrace_regs(fregs)->regs;
@@ -191,23 +190,6 @@ static __always_inline bool ftrace_regs_has_args(struct ftrace_regs *fregs)
 	return ftrace_get_regs(fregs) != NULL;
 }
 
-#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
-#define ftrace_regs_get_instruction_pointer(fregs) \
-	instruction_pointer(ftrace_get_regs(fregs))
-#define ftrace_regs_get_argument(fregs, n) \
-	regs_get_kernel_argument(ftrace_get_regs(fregs), n)
-#define ftrace_regs_get_stack_pointer(fregs) \
-	kernel_stack_pointer(ftrace_get_regs(fregs))
-#define ftrace_regs_return_value(fregs) \
-	regs_return_value(ftrace_get_regs(fregs))
-#define ftrace_regs_set_return_value(fregs, ret) \
-	regs_set_return_value(ftrace_get_regs(fregs), ret)
-#define ftrace_override_function_with_return(fregs) \
-	override_function_with_return(ftrace_get_regs(fregs))
-#define ftrace_regs_query_register_offset(name) \
-	regs_query_register_offset(name)
-#endif
-
 typedef void (*ftrace_func_t)(unsigned long ip, unsigned long parent_ip,
 			      struct ftrace_ops *op, struct ftrace_regs *fregs);
 
diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
new file mode 100644
index 000000000000..1cdd4bfa440b
--- /dev/null
+++ b/include/linux/ftrace_regs.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_FTRACE_TYPES_H
+#define _LINUX_FTRACE_TYPES_H
+
+/*
+ * For archs that just copy pt_regs in ftrace regs, it can use this default.
+ * If an architecture does not use pt_regs, it must define all the below
+ * accessor functions.
+ */
+#ifndef HAVE_ARCH_FTRACE_REGS
+struct __arch_ftrace_regs {
+	struct pt_regs		regs;
+};
+
+#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
+
+struct ftrace_regs;
+
+#define ftrace_regs_get_instruction_pointer(fregs) \
+	instruction_pointer(arch_ftrace_get_regs(fregs))
+#define ftrace_regs_get_argument(fregs, n) \
+	regs_get_kernel_argument(arch_ftrace_get_regs(fregs), n)
+#define ftrace_regs_get_stack_pointer(fregs) \
+	kernel_stack_pointer(arch_ftrace_get_regs(fregs))
+#define ftrace_regs_return_value(fregs) \
+	regs_return_value(arch_ftrace_get_regs(fregs))
+#define ftrace_regs_set_return_value(fregs, ret) \
+	regs_set_return_value(arch_ftrace_get_regs(fregs), ret)
+#define ftrace_override_function_with_return(fregs) \
+	override_function_with_return(arch_ftrace_get_regs(fregs))
+#define ftrace_regs_query_register_offset(name) \
+	regs_query_register_offset(name)
+
+#endif /* HAVE_ARCH_FTRACE_REGS */
+
+#endif /* _LINUX_FTRACE_TYPES_H */
-- 
2.45.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
