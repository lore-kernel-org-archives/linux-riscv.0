Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E431FC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 12:35:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 687F52242A
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 12:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 687F52242A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vY7jTrEsRGvMlhdMWBRWyXWSIxXWYRiKe5U4vTBES50=; b=isaxbe8/fxasILmosWzLhbuNm
	fT9wKnaNHl195EtUkfyJNJqQfoQJLTJTprPgistcg6qunFyOQ7y1ADJ+kmxQOkCtvCq8M2FzECO7m
	LTNYqBCivnioRLDMISYzLQCefILtbdGe3SNZVyo8e/IFWXMAuD84CHlogy/bwmbmO/p4sCDj978gH
	AcJAbUucae0SNcj1dQjLErFRYujqpk8nq80xFTRQzZi6rIFO8qZUNcnIilE2joP5Z2hcbuKWALZwL
	lUK4XCkltPPf/qNTeKzOMaZLP+nMu8dy9ZZhTV2MLl9WQS5eZTBRvKB7MHT3s0+Jvi9tKQbpVYqxo
	C83QX1w3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kywPb-0002m5-LZ; Mon, 11 Jan 2021 12:35:07 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kywPQ-0002g2-6A
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 12:35:06 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DDtRb32Q4z7Sqd;
 Mon, 11 Jan 2021 20:33:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 11 Jan 2021 20:34:38 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 <linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH RESEND 1/3] riscv: Add dump stack in show_regs
Date: Mon, 11 Jan 2021 20:40:12 +0800
Message-ID: <20210111124014.182957-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111124014.182957-1-wangkefeng.wang@huawei.com>
References: <20210111124014.182957-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_073505_435994_03E8CF96 
X-CRM114-Status: GOOD (  12.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chen Huang <chenhuang5@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Like commit 1149aad10b1e ("arm64: Add dump_backtrace() in show_regs"),
dump the stack in riscv show_regs as common code expects.

Reviewed-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/include/asm/bug.h        |  1 +
 arch/riscv/include/asm/stacktrace.h |  2 ++
 arch/riscv/kernel/process.c         |  9 ++++++++-
 arch/riscv/kernel/stacktrace.c      | 10 ++++++++--
 arch/riscv/kernel/traps.c           |  3 ++-
 5 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index d6f1ec08d97b..d3804a2f9aad 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -85,6 +85,7 @@ do {								\
 struct pt_regs;
 struct task_struct;
 
+void __show_regs(struct pt_regs *regs);
 void die(struct pt_regs *regs, const char *str);
 void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr);
 
diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index 470a65c4ccdc..3450c1912afd 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -13,5 +13,7 @@ struct stackframe {
 
 extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 				    bool (*fn)(void *, unsigned long), void *arg);
+extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
+			   const char *loglvl);
 
 #endif /* _ASM_RISCV_STACKTRACE_H */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index dd5f985b1f40..78bb3a00d249 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -18,6 +18,7 @@
 #include <asm/unistd.h>
 #include <asm/processor.h>
 #include <asm/csr.h>
+#include <asm/stacktrace.h>
 #include <asm/string.h>
 #include <asm/switch_to.h>
 #include <asm/thread_info.h>
@@ -39,7 +40,7 @@ void arch_cpu_idle(void)
 	raw_local_irq_enable();
 }
 
-void show_regs(struct pt_regs *regs)
+void __show_regs(struct pt_regs *regs)
 {
 	show_regs_print_info(KERN_DEFAULT);
 
@@ -69,6 +70,12 @@ void show_regs(struct pt_regs *regs)
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);
 }
+void show_regs(struct pt_regs *regs)
+{
+	__show_regs(regs);
+	if (!user_mode(regs))
+		dump_backtrace(regs, NULL, KERN_DEFAULT);
+}
 
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 48b870a685b3..76dadf6d396b 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -101,10 +101,16 @@ static bool print_trace_address(void *arg, unsigned long pc)
 	return true;
 }
 
+void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
+		    const char *loglvl)
+{
+	pr_cont("%sCall Trace:\n", loglvl);
+	walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
+}
+
 void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 {
-	pr_cont("Call Trace:\n");
-	walk_stackframe(task, NULL, print_trace_address, (void *)loglvl);
+	dump_backtrace(NULL, task, loglvl);
 }
 
 static bool save_wchan(void *arg, unsigned long pc)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index ad14f4466d92..570eb078b1e1 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/irq.h>
 
+#include <asm/bug.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
@@ -66,7 +67,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
 			tsk->comm, task_pid_nr(tsk), signo, code, addr);
 		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
 		pr_cont("\n");
-		show_regs(regs);
+		__show_regs(regs);
 	}
 
 	force_sig_fault(signo, code, (void __user *)addr);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
