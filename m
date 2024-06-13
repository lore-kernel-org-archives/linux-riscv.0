Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F657C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 11:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SWDl3Gdxn6ecCC/aDQtgh51GqIAUNQNlDpfFnDlyUuw=; b=VVegdPCopjf9C3
	UBNkF4ZyicWy9ySic/PEXUKMr980OPUsU0SG8moYdmM4DbVM/VtZ9Y4h4AKun1EPVDSy0ny3C4Hkf
	224bLQNijB6AsiejiBrBN30uIlNB6ob9KEp4fIqOYgu5LqrMl6CQtGDRHen1ztcqAjjavl/PSbYTF
	num9K3rm/evGS4tsY6SnZ/bk+p+QniSQl7tqHtguBhq8ZynFxr8G/Go8zbPPrEXsEoZEhZeLMQR9o
	ecWd8kW+A+l6bQHew24L7VIgnXd6uqo37zHFxhyDkh8wwNJOUUYMH8y1px+ocUA1caJgATzAfAF7Y
	QqwL1hbq8x38kJc2uQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHiN5-0000000GGsn-2gyW;
	Thu, 13 Jun 2024 11:11:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHiN1-0000000GGrY-2Mn8
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 11:11:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4W0KSg5bX3zdbqm;
	Thu, 13 Jun 2024 19:10:11 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 61191180AA9;
	Thu, 13 Jun 2024 19:11:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 13 Jun
 2024 19:11:38 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>, <mark.rutland@arm.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] trace: riscv: Remove deprecated kprobe on ftrace support
Date: Thu, 13 Jun 2024 19:13:47 +0800
Message-ID: <20240613111347.1745379-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_041155_979178_4AB1FECE 
X-CRM114-Status: GOOD (  12.56  )
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

Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
kprobe on ftrace is not supported by riscv, because riscv's support for
FTRACE_WITH_REGS has been replaced with support for FTRACE_WITH_ARGS, and
KPROBES_ON_FTRACE will be supplanted by FPROBES. So remove the deprecated
kprobe on ftrace support, which is misunderstood.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/Kconfig                |  1 -
 arch/riscv/kernel/probes/Makefile |  1 -
 arch/riscv/kernel/probes/ftrace.c | 65 -------------------------------
 3 files changed, 67 deletions(-)
 delete mode 100644 arch/riscv/kernel/probes/ftrace.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0525ee2d63c7..a1f2d604c459 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -149,7 +149,6 @@ config RISCV
 	select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KPROBES if !XIP_KERNEL
-	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
 	# https://github.com/ClangBuiltLinux/linux/issues/1881
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
index 8265ff497977..d2129f2c61b8 100644
--- a/arch/riscv/kernel/probes/Makefile
+++ b/arch/riscv/kernel/probes/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_KPROBES)		+= kprobes.o decode-insn.o simulate-insn.o
 obj-$(CONFIG_RETHOOK)		+= rethook.o rethook_trampoline.o
-obj-$(CONFIG_KPROBES_ON_FTRACE)	+= ftrace.o
 obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o simulate-insn.o
 CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_rethook.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
deleted file mode 100644
index a69dfa610aa8..000000000000
--- a/arch/riscv/kernel/probes/ftrace.c
+++ /dev/null
@@ -1,65 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <linux/kprobes.h>
-
-/* Ftrace callback handler for kprobes -- called under preepmt disabled */
-void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
-			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
-{
-	struct kprobe *p;
-	struct pt_regs *regs;
-	struct kprobe_ctlblk *kcb;
-	int bit;
-
-	if (unlikely(kprobe_ftrace_disabled))
-		return;
-
-	bit = ftrace_test_recursion_trylock(ip, parent_ip);
-	if (bit < 0)
-		return;
-
-	p = get_kprobe((kprobe_opcode_t *)ip);
-	if (unlikely(!p) || kprobe_disabled(p))
-		goto out;
-
-	regs = ftrace_get_regs(fregs);
-	kcb = get_kprobe_ctlblk();
-	if (kprobe_running()) {
-		kprobes_inc_nmissed_count(p);
-	} else {
-		unsigned long orig_ip = instruction_pointer(regs);
-
-		instruction_pointer_set(regs, ip);
-
-		__this_cpu_write(current_kprobe, p);
-		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
-		if (!p->pre_handler || !p->pre_handler(p, regs)) {
-			/*
-			 * Emulate singlestep (and also recover regs->pc)
-			 * as if there is a nop
-			 */
-			instruction_pointer_set(regs,
-				(unsigned long)p->addr + MCOUNT_INSN_SIZE);
-			if (unlikely(p->post_handler)) {
-				kcb->kprobe_status = KPROBE_HIT_SSDONE;
-				p->post_handler(p, regs, 0);
-			}
-			instruction_pointer_set(regs, orig_ip);
-		}
-
-		/*
-		 * If pre_handler returns !0, it changes regs->pc. We have to
-		 * skip emulating post_handler.
-		 */
-		__this_cpu_write(current_kprobe, NULL);
-	}
-out:
-	ftrace_test_recursion_unlock(bit);
-}
-NOKPROBE_SYMBOL(kprobe_ftrace_handler);
-
-int arch_prepare_kprobe_ftrace(struct kprobe *p)
-{
-	p->ainsn.api.insn = NULL;
-	return 0;
-}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
