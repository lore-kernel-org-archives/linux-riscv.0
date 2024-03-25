Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD6FC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g7SPQ4HSZT7vI8NJylQo6mMLJSo2i1nZz1/0E5ImzwU=; b=N5bJROFbcSvFl7
	tO//2tXVC96hYwqtvhIN3/CDBBFcfUOaavoI3KySW4upfOs569ddahO83K53I80e7g1HlmMWFILDu
	tsZ7+0OCZnqh5LCHz0SlSpcutkwrQwb6joXW6qQ/o6SkWM6SOZ4UVAFE66fxCiG7Nz1J8UD1iz7b6
	/N10j7h+MkuzBEe/+TiNnR1Qg8qFuIzDpQMESpAcw5bIp6obh34b0SUlzxlCWgOaNDjmG/Jm4+fs+
	X+Y6b5mhLlMIyUxgfJiWMmZb1T4Ck7mdzQLraVk9d3qrOwL2KSvwFb6ODOuzPqU2iCY7uiiS5xmxG
	qZIvLTJ+racSjR69Jy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ror5B-00000001qNx-15Kw;
	Mon, 25 Mar 2024 20:38:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ror56-00000001qM0-3qVh
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:38:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3270ACE1D55;
	Mon, 25 Mar 2024 20:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE27C433F1;
	Mon, 25 Mar 2024 20:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711399086;
	bh=O+nH8ew9YCyT1eBzJVNI7NhlU/W38tr3dfunGVakyyQ=;
	h=From:To:Cc:Subject:Date:From;
	b=BmUixln5eSjDKD7hwgJRY3Uw7PdEicb7INTOAemawVhpepZKd89Gx+C/t245sF/LW
	 hSfVLAXMXIiJUCVluoAMrrdguBdDR+80rL9R88BzzAhMPF3R+ahSDuHw08z32t3/Ls
	 4GxNZmDp2XWbzr/GjX4AUbU2qJwb4ECOaWZAtd2Pq0I56+plTiAYnuaK+U+fC1w3k3
	 O/SFVsEQvyVNHQ5/UXgfIAkSCnqhz5xLvzGEMyB/0A5XV0DtPSSBfQy+/5C0lV/9pJ
	 BJhmrXyPeunFW36qJiLaVtyxu0x3TafJ0dphKd1Pbr7FooQlEK18dyel8qP9+kNC4R
	 j4zTmy4STZE2A==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	linux-modules@vger.kernel.org,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: [PATCH v3 1/2] kprobes: textmem API
Date: Mon, 25 Mar 2024 22:37:54 +0200
Message-ID: <20240325203755.1811-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_133809_381790_FB18E929 
X-CRM114-Status: GOOD (  25.70  )
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

Tracing with kprobes while running a monolithic kernel is currently
impossible because CONFIG_KPROBES depends on CONFIG_MODULES because it uses
the kernel module allocator.

Introduce alloc_textmem() and free_textmem() for allocating executable
memory. If an arch implements these functions, it can mark this up with
the HAVE_ALLOC_EXECMEM kconfig flag.

At first this feature will be used for enabling kprobes without
modules support for arch/riscv.

Link: https://lore.kernel.org/all/20240325115632.04e37297491cadfbbf382767@kernel.org/
Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v3:
- A new patch added.
- For IS_DEFINED() I need advice as I could not really find that many
  locations where it would be applicable.
---
 arch/Kconfig                | 16 +++++++++++++++-
 include/linux/execmem.h     | 13 +++++++++++++
 kernel/kprobes.c            | 17 ++++++++++++++---
 kernel/trace/trace_kprobe.c | 18 ++++++++++++++++--
 4 files changed, 58 insertions(+), 6 deletions(-)
 create mode 100644 include/linux/execmem.h

diff --git a/arch/Kconfig b/arch/Kconfig
index a5af0edd3eb8..33ba68b7168f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -52,8 +52,8 @@ config GENERIC_ENTRY
 
 config KPROBES
 	bool "Kprobes"
-	depends on MODULES
 	depends on HAVE_KPROBES
+	select ALLOC_EXECMEM
 	select KALLSYMS
 	select TASKS_RCU if PREEMPTION
 	help
@@ -215,6 +215,20 @@ config HAVE_OPTPROBES
 config HAVE_KPROBES_ON_FTRACE
 	bool
 
+config HAVE_ALLOC_EXECMEM
+	bool
+	help
+	  Architectures that select this option are capable of allocating executable
+	  memory, which can be used by subsystems but is not dependent of any of its
+	  clients.
+
+config ALLOC_EXECMEM
+	bool "Executable (trampoline) memory allocation"
+	depends on MODULES || HAVE_ALLOC_EXECMEM
+	help
+	  Select this for executable (trampoline) memory. Can be enabled when either
+	  module allocator or arch-specific allocator is available.
+
 config ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
 	bool
 	help
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
new file mode 100644
index 000000000000..ae2ff151523a
--- /dev/null
+++ b/include/linux/execmem.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_EXECMEM_H
+#define _LINUX_EXECMEM_H
+
+#ifdef CONFIG_HAVE_ALLOC_EXECMEM
+void *alloc_execmem(unsigned long size, gfp_t gfp);
+void free_execmem(void *region);
+#else
+#define alloc_execmem(size, gfp)	module_alloc(size)
+#define free_execmem(region)		module_memfree(region)
+#endif
+
+#endif /* _LINUX_EXECMEM_H */
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 9d9095e81792..a1a547723c3c 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -44,6 +44,7 @@
 #include <asm/cacheflush.h>
 #include <asm/errno.h>
 #include <linux/uaccess.h>
+#include <linux/execmem.h>
 
 #define KPROBE_HASH_BITS 6
 #define KPROBE_TABLE_SIZE (1 << KPROBE_HASH_BITS)
@@ -113,17 +114,17 @@ enum kprobe_slot_state {
 void __weak *alloc_insn_page(void)
 {
 	/*
-	 * Use module_alloc() so this page is within +/- 2GB of where the
+	 * Use alloc_execmem() so this page is within +/- 2GB of where the
 	 * kernel image and loaded module images reside. This is required
 	 * for most of the architectures.
 	 * (e.g. x86-64 needs this to handle the %rip-relative fixups.)
 	 */
-	return module_alloc(PAGE_SIZE);
+	return alloc_execmem(PAGE_SIZE);
 }
 
 static void free_insn_page(void *page)
 {
-	module_memfree(page);
+	free_execmem(page);
 }
 
 struct kprobe_insn_cache kprobe_insn_slots = {
@@ -1580,6 +1581,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
 		goto out;
 	}
 
+#ifdef CONFIG_MODULES
 	/* Check if 'p' is probing a module. */
 	*probed_mod = __module_text_address((unsigned long) p->addr);
 	if (*probed_mod) {
@@ -1603,6 +1605,8 @@ static int check_kprobe_address_safe(struct kprobe *p,
 			ret = -ENOENT;
 		}
 	}
+#endif
+
 out:
 	preempt_enable();
 	jump_label_unlock();
@@ -2482,6 +2486,7 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
 	return 0;
 }
 
+#ifdef CONFIG_MODULES
 /* Remove all symbols in given area from kprobe blacklist */
 static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
 {
@@ -2499,6 +2504,7 @@ static void kprobe_remove_ksym_blacklist(unsigned long entry)
 {
 	kprobe_remove_area_blacklist(entry, entry + 1);
 }
+#endif /* CONFIG_MODULES */
 
 int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
 				   char *type, char *sym)
@@ -2564,6 +2570,7 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
 	return ret ? : arch_populate_kprobe_blacklist();
 }
 
+#ifdef CONFIG_MODULES
 static void add_module_kprobe_blacklist(struct module *mod)
 {
 	unsigned long start, end;
@@ -2665,6 +2672,7 @@ static struct notifier_block kprobe_module_nb = {
 	.notifier_call = kprobes_module_callback,
 	.priority = 0
 };
+#endif /* CONFIG_MODULES */
 
 void kprobe_free_init_mem(void)
 {
@@ -2724,8 +2732,11 @@ static int __init init_kprobes(void)
 	err = arch_init_kprobes();
 	if (!err)
 		err = register_die_notifier(&kprobe_exceptions_nb);
+
+#ifdef CONFIG_MODULES
 	if (!err)
 		err = register_module_notifier(&kprobe_module_nb);
+#endif
 
 	kprobes_initialized = (err == 0);
 	kprobe_sysctls_init();
diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index c4c6e0e0068b..f8fbd5e76dda 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -111,6 +111,7 @@ static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
 	return strncmp(module_name(mod), name, len) == 0 && name[len] == ':';
 }
 
+#ifdef CONFIG_MODULES
 static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
 {
 	char *p;
@@ -129,6 +130,7 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
 
 	return ret;
 }
+#endif /* CONFIG_MODULES */
 
 static bool trace_kprobe_is_busy(struct dyn_event *ev)
 {
@@ -608,7 +610,11 @@ static int append_trace_kprobe(struct trace_kprobe *tk, struct trace_kprobe *to)
 
 	/* Register k*probe */
 	ret = __register_trace_kprobe(tk);
-	if (ret == -ENOENT && !trace_kprobe_module_exist(tk)) {
+#ifdef CONFIG_MODULES
+	if (ret == -ENOENT && trace_kprobe_module_exist(tk))
+		ret = 0;
+#endif /* CONFIG_MODULES */
+	if (ret == -ENOENT) {
 		pr_warn("This probe might be able to register after target module is loaded. Continue.\n");
 		ret = 0;
 	}
@@ -655,7 +661,11 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
 
 	/* Register k*probe */
 	ret = __register_trace_kprobe(tk);
-	if (ret == -ENOENT && !trace_kprobe_module_exist(tk)) {
+#ifdef CONFIG_MODULES
+	if (ret == -ENOENT && trace_kprobe_module_exist(tk))
+		ret = 0;
+#endif /* CONFIG_MODULES */
+	if (ret == -ENOENT) {
 		pr_warn("This probe might be able to register after target module is loaded. Continue.\n");
 		ret = 0;
 	}
@@ -670,6 +680,7 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
 	return ret;
 }
 
+#ifdef CONFIG_MODULES
 /* Module notifier call back, checking event on the module */
 static int trace_kprobe_module_callback(struct notifier_block *nb,
 				       unsigned long val, void *data)
@@ -704,6 +715,7 @@ static struct notifier_block trace_kprobe_module_nb = {
 	.notifier_call = trace_kprobe_module_callback,
 	.priority = 1	/* Invoked after kprobe module callback */
 };
+#endif /* CONFIG_MODULES */
 
 static int count_symbols(void *data, unsigned long unused)
 {
@@ -1897,8 +1909,10 @@ static __init int init_kprobe_trace_early(void)
 	if (ret)
 		return ret;
 
+#ifdef CONFIG_MODULES
 	if (register_module_notifier(&trace_kprobe_module_nb))
 		return -EINVAL;
+#endif /* CONFIG_MODULES */
 
 	return 0;
 }
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
