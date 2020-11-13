Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5CCC55ABD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:38:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB1520A8B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="At1kZGnB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BB1520A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q33PMvWCbRw+dtrd2N1RXJO467IT67fI5tL8LHZW4BQ=; b=At1kZGnB+DHQwGr8wDh2FJXLY
	ISLpKSBuY21yVOyT9bqUadRwcb8yrSUhD7xw6VHSOHavXflT4f7eotIl5twptMmILOFqLqRsL6D2d
	SmQrDNWGazDBHhHpoUa26+CXDXVj5j1V9pn8pvHNfo7voZD+3z3wyT9iM4GHCipztznqYwikIj1kx
	RYPphecHjSjeSO7pG159nv2VsWsVVYRcYEp2qHckGhClSe6BQOxbrHlzXGtH1oPR9VWkulDdAInz1
	0T9f2J4Ghhoqkf8UIGPVqpmKG2wxI35FH9XJBQuVHXedhzH+CIJLcleDIEW+p2kkpCtCN3V7pEZj5
	gKeTGQtjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdSio-0000l6-Ex; Fri, 13 Nov 2020 06:38:10 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdSik-0000ir-Kd
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 06:38:08 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CXTKv4XwhzLxdw;
 Fri, 13 Nov 2020 14:37:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Nov 2020 14:37:47 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 2/3] riscv: Make stack walk callback consistent with generic
 code
Date: Fri, 13 Nov 2020 14:42:22 +0800
Message-ID: <20201113064223.103530-3-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113064223.103530-1-wangkefeng.wang@huawei.com>
References: <20201113064223.103530-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_013807_722742_F1A76BE9 
X-CRM114-Status: GOOD (  12.82  )
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

In order to use generic arch_stack_walk() code, make stack walk
callback consistent with it.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/include/asm/stacktrace.h |  2 +-
 arch/riscv/kernel/perf_callchain.c  |  2 +-
 arch/riscv/kernel/stacktrace.c      | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index f09c1e31bde9..470a65c4ccdc 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -12,6 +12,6 @@ struct stackframe {
 };
 
 extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-				    bool (*fn)(unsigned long, void *), void *arg);
+				    bool (*fn)(void *, unsigned long), void *arg);
 
 #endif /* _ASM_RISCV_STACKTRACE_H */
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 623ecd36a720..0bb1854dce83 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -70,7 +70,7 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 		fp = user_backtrace(entry, fp, 0);
 }
 
-static bool fill_callchain(unsigned long pc, void *entry)
+static bool fill_callchain(void *entry, unsigned long pc)
 {
 	return perf_callchain_store(entry, pc);
 }
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 345a202c92bb..81c48144c504 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -43,7 +43,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		unsigned long low, high;
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || fn(pc, arg)))
+		if (unlikely(!__kernel_text_address(pc) || fn(arg, pc)))
 			break;
 
 		/* Validate frame pointer */
@@ -63,7 +63,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(unsigned long, void *), void *arg)
+	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
@@ -85,7 +85,7 @@ void notrace walk_stackframe(struct task_struct *task,
 
 	ksp = (unsigned long *)sp;
 	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(fn(pc, arg)))
+		if (__kernel_text_address(pc) && unlikely(fn(arg, pc)))
 			break;
 		pc = (*ksp++) - 0x4;
 	}
@@ -107,7 +107,7 @@ void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 	walk_stackframe(task, NULL, print_trace_address, (void *)loglvl);
 }
 
-static bool save_wchan(unsigned long pc, void *arg)
+static bool save_wchan(void *arg, unsigned long pc)
 {
 	if (!in_sched_functions(pc)) {
 		unsigned long *p = arg;
@@ -143,7 +143,7 @@ static bool __save_trace(unsigned long pc, void *arg, bool nosched)
 	return (trace->nr_entries >= trace->max_entries);
 }
 
-static bool save_trace(unsigned long pc, void *arg)
+static bool save_trace(void *arg, unsigned long pc)
 {
 	return __save_trace(pc, arg, false);
 }
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
