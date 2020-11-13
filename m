Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4049C4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:38:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E844221E9
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QrKVNTsu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E844221E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j/jEpeb3Co3H4hUwH2PWJDieY9XTUFMH6LNuDSVpyxg=; b=QrKVNTsuPQkxQyNJlYlgI1G8p
	BY0fWhNefaB7cB+crLDgESq24Q05kRkv0eJxGtYvR+FR7XMimgeu+Rs2stj4/zhOrRsw1B6ymKKFW
	eqrssCxidq2Ah3xScLUsE9lay8FXRRuLx0i5ViI1OC7rQ6SK/D12W4/pSS/RdrEYybhUaoEZAcdRy
	hNdYpzsdhquP9OCNQQ1KlR9Mjc/YGSU+rmQfsVuur0UOcQLFctdXkUEydn/fABrpst38xw2+IqcWp
	OHTCtG+Rg5a+5OkYlWLtRcE8rJ6vv/B+BAUvCNwLmBBHWLp3hX0u4u4pXEwC7nj4OY1LWcHCezxg2
	6YDbYf/Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdSip-0000lN-Fs; Fri, 13 Nov 2020 06:38:11 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdSik-0000j2-L8
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 06:38:08 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CXTL06M6hzLxYm;
 Fri, 13 Nov 2020 14:37:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Nov 2020 14:37:48 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 3/3] riscv: Enable ARCH_STACKWALK
Date: Fri, 13 Nov 2020 14:42:23 +0800
Message-ID: <20201113064223.103530-4-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113064223.103530-1-wangkefeng.wang@huawei.com>
References: <20201113064223.103530-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_013808_160667_7AD24C85 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Convert to ARCH_STACKWALK to reduce duplicated code in stack trace.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig             |  1 +
 arch/riscv/kernel/stacktrace.c | 49 +++++++---------------------------
 2 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index dfbc1351ee62..d9da5d92e40d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,6 +14,7 @@ config RISCV
 	def_bool y
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_STACKWALK
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 81c48144c504..48b870a685b3 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -19,7 +19,7 @@ register unsigned long sp_in_global __asm__("sp");
 #ifdef CONFIG_FRAME_POINTER
 
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(unsigned long, void *), void *arg)
+			     bool (*fn)(void *, unsigned long), void *arg)
 {
 	unsigned long fp, sp, pc;
 
@@ -43,7 +43,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		unsigned long low, high;
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || fn(arg, pc)))
+		if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
 			break;
 
 		/* Validate frame pointer */
@@ -85,7 +85,7 @@ void notrace walk_stackframe(struct task_struct *task,
 
 	ksp = (unsigned long *)sp;
 	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(fn(arg, pc)))
+		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc)))
 			break;
 		pc = (*ksp++) - 0x4;
 	}
@@ -93,12 +93,12 @@ void notrace walk_stackframe(struct task_struct *task,
 
 #endif /* CONFIG_FRAME_POINTER */
 
-static bool print_trace_address(unsigned long pc, void *arg)
+static bool print_trace_address(void *arg, unsigned long pc)
 {
 	const char *loglvl = arg;
 
 	print_ip_sym(loglvl, pc);
-	return false;
+	return true;
 }
 
 void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
@@ -112,9 +112,9 @@ static bool save_wchan(void *arg, unsigned long pc)
 	if (!in_sched_functions(pc)) {
 		unsigned long *p = arg;
 		*p = pc;
-		return true;
+		return false;
 	}
-	return false;
+	return true;
 }
 
 unsigned long get_wchan(struct task_struct *task)
@@ -128,39 +128,10 @@ unsigned long get_wchan(struct task_struct *task)
 
 #ifdef CONFIG_STACKTRACE
 
-static bool __save_trace(unsigned long pc, void *arg, bool nosched)
-{
-	struct stack_trace *trace = arg;
-
-	if (unlikely(nosched && in_sched_functions(pc)))
-		return false;
-	if (unlikely(trace->skip > 0)) {
-		trace->skip--;
-		return false;
-	}
-
-	trace->entries[trace->nr_entries++] = pc;
-	return (trace->nr_entries >= trace->max_entries);
-}
-
-static bool save_trace(void *arg, unsigned long pc)
-{
-	return __save_trace(pc, arg, false);
-}
-
-/*
- * Save stack-backtrace addresses into a stack_trace buffer.
- */
-void save_stack_trace_tsk(struct task_struct *tsk, struct stack_trace *trace)
-{
-	walk_stackframe(tsk, NULL, save_trace, trace);
-}
-EXPORT_SYMBOL_GPL(save_stack_trace_tsk);
-
-void save_stack_trace(struct stack_trace *trace)
+void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
+		     struct task_struct *task, struct pt_regs *regs)
 {
-	save_stack_trace_tsk(NULL, trace);
+	walk_stackframe(task, regs, consume_entry, cookie);
 }
-EXPORT_SYMBOL_GPL(save_stack_trace);
 
 #endif /* CONFIG_STACKTRACE */
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
