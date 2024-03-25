Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EEDCD11DB
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 21:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXeGjyA1byvML/yA75D1t7iB6lkzFUFVUF6eZvqJVaU=; b=grLxzl9/ug3Zfw
	ZL+G9s7YOIfh5zmcBtL8apNDdOjgVuui7K99fP8SZl00xm0+2nrnf9ogh47JpbWUqMmvwyRiOb7q3
	arblHXjbVInhyQrQctMXTpRh1xSlSCVFqORytyZEHG4oUiaM4uAgW2v+HVd8xv6fJkEZRe1NjpOFU
	gfaaEvB3Qgi7WpVCEscaU7AmRTpQeiPPoi5XhgJE3W4BAXq4nEVWrQ+qyFJRppmh/xA4G/riyY8H+
	uIHNuLZ0qwdXzvqNEqvvhjFFHVHKZazwgTIfTq1+kDk8s1qGP+bIcQ3ccVUQVyxZxFGOCvVj53n4b
	0Un+xzzln66Kxe0F+8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rorfd-00000001ziO-2Jby;
	Mon, 25 Mar 2024 21:15:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rorfZ-00000001zfz-2ghV
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 21:15:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9F08611F8;
	Mon, 25 Mar 2024 21:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0480FC433C7;
	Mon, 25 Mar 2024 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711401348;
	bh=FCy4kecgMkVWhP91pvNt2LYQchl8jV2Rw34VjcQRizs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NchMrmQiBENlvmGRvleESEVVL2psV2IrWvXzjxJfpZFA85NIuoOtMMd0K5nmPEcM1
	 JENAHtSKx69ElaZydFCDk0E6hv0n4elRsuomj7LyU+M+gRWTBV8mjQTilvWhu9Yqg9
	 2w0UDfQvU+Ikt71kuoLJzYe8T9Oy9cpxTBEYIYoNugcYt/ob/qU3pml9MTJ/6nrS+q
	 kmzS6FtCXBNZbTpL7JC8Ld70eps+pfgWS+2VnwXu98hDZnPS7T3XU65F2VzAKgmjKX
	 VhM6NVJJURLtS8QuevXfFdr0VuRZiEpSwS8rmMQsM3YEt+fQa8swQKJYu0u0IOKNqt
	 6vxQ49Scs1TUw==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	linux-modules@vger.kernel.org,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v4 2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Date: Mon, 25 Mar 2024 23:15:35 +0200
Message-ID: <20240325211535.25142-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325211535.25142-1-jarkko@kernel.org>
References: <20240325211535.25142-1-jarkko@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_141549_968790_5E88CF23 
X-CRM114-Status: GOOD (  17.53  )
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

Tacing with kprobes while running a monolithic kernel is currently
impossible due the kernel module allocator dependency.

Address the issue by implementing textmem API for RISC-V.

Link: https://www.sochub.fi # for power on testing new SoC's with a minimal stack
Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/ # continuation
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v4:
- Include linux/execmem.h.
v3:
- Architecture independent parts have been split to separate patches.
- Do not change arch/riscv/kernel/module.c as it is out of scope for
  this patch set now.
v2:
- Better late than never right? :-)
- Focus only to RISC-V for now to make the patch more digestable. This
  is the arch where I use the patch on a daily basis to help with QA.
- Introduce HAVE_KPROBES_ALLOC flag to help with more gradual migration.
---
 arch/riscv/Kconfig          |  1 +
 arch/riscv/kernel/Makefile  |  3 +++
 arch/riscv/kernel/execmem.c | 22 ++++++++++++++++++++++
 kernel/kprobes.c            |  2 +-
 4 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/execmem.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e3142ce531a0..499512fb17ff 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -132,6 +132,7 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_ALLOC_EXECMEM if !XIP_KERNEL
 	# https://github.com/ClangBuiltLinux/linux/issues/1881
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
 	select HAVE_MOVE_PMD
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 604d6bf7e476..337797f10d3e 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -73,6 +73,9 @@ obj-$(CONFIG_SMP)		+= cpu_ops.o
 
 obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
 obj-$(CONFIG_MODULES)		+= module.o
+ifeq ($(CONFIG_ALLOC_EXECMEM),y)
+obj-y				+= execmem.o
+endif
 obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
 
 obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
diff --git a/arch/riscv/kernel/execmem.c b/arch/riscv/kernel/execmem.c
new file mode 100644
index 000000000000..3e52522ead32
--- /dev/null
+++ b/arch/riscv/kernel/execmem.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/mm.h>
+#include <linux/execmem.h>
+#include <linux/vmalloc.h>
+#include <asm/sections.h>
+
+void *alloc_execmem(unsigned long size, gfp_t /* gfp */)
+{
+	return __vmalloc_node_range(size, 1, MODULES_VADDR,
+				    MODULES_END, GFP_KERNEL,
+				    PAGE_KERNEL, 0, NUMA_NO_NODE,
+				    __builtin_return_address(0));
+}
+
+void free_execmem(void *region)
+{
+	if (in_interrupt())
+		pr_warn("In interrupt context: vmalloc may not work.\n");
+
+	vfree(region);
+}
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index a1a547723c3c..87fd8c14a938 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -119,7 +119,7 @@ void __weak *alloc_insn_page(void)
 	 * for most of the architectures.
 	 * (e.g. x86-64 needs this to handle the %rip-relative fixups.)
 	 */
-	return alloc_execmem(PAGE_SIZE);
+	return alloc_execmem(PAGE_SIZE, GFP_KERNEL);
 }
 
 static void free_insn_page(void *page)
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
