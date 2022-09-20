Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B8C6FA8E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 15:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOhpCW7NXHzVK1BqfIVhNh8oujIEKw7T4QW8OfYmpoY=; b=iRf7233giwNYVu
	oNaissm6ZvHfnkE+7wlhEXXutOCLlCGXQP0Zh1BW29BiYDwiShYfoyzmYj1C8/9dyKuqppeu3zDEZ
	nLW82BmTO0dPvGUV60pJLhod7X9ULoquvhK3xaAu35ZBE11p+H271bcSGFwU2GEmwTLn5yVyS8vgc
	ciMoCi3IfyiMX3QIZK0/h4Vke6ma4+Sdg2epzoqJjaejH0tIGD4wsD9sr5ZlnPOH5ptX9KDU0niWl
	yVKCG75CAJlP1ba3NSD732lf+KZ5e6RU5tyeQDvR76CrJcBRnlajhw+4nkxs2X64P83dNp7wzRQ/O
	+3kAIy4jbS4Wg+08XAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyk-004mjA-UW; Tue, 20 Sep 2022 15:16:06 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeya-004mY9-DT
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 15:16:00 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MX4kJ6pmyzMnFp;
	Tue, 20 Sep 2022 23:11:04 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:45 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:45 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<namhyung@kernel.org>, <jolsa@kernel.org>, <guoren@kernel.org>,
	<nsaenzju@redhat.com>, <frederic@kernel.org>, <changbin.du@intel.com>,
	<vincent.chen@sifive.com>, <ardb@kernel.org>, <mhiramat@kernel.org>,
	<rostedt@goodmis.org>, <keescook@chromium.org>, <catalin.marinas@arm.com>,
	<chenzhongjin@huawei.com>
Subject: [PATCH -next 1/7] riscv: stacktrace: Replace walk_stackframe with arch_stack_walk
Date: Tue, 20 Sep 2022 23:11:56 +0800
Message-ID: <20220920151202.180057-2-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920151202.180057-1-chenzhongjin@huawei.com>
References: <20220920151202.180057-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_081556_992743_2666ED4F 
X-CRM114-Status: GOOD (  11.98  )
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

walk_stackframe can be all replaced by arch_stack_walk.

Since walk_stackframe is only called by arch_stack_walk and their only
difference is the argument sequence.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/riscv/include/asm/stacktrace.h |  2 --
 arch/riscv/kernel/perf_callchain.c  |  2 +-
 arch/riscv/kernel/stacktrace.c      | 29 +++++++++++++----------------
 3 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index 3450c1912afd..b6cd3eddfd38 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -11,8 +11,6 @@ struct stackframe {
 	unsigned long ra;
 };
 
-extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-				    bool (*fn)(void *, unsigned long), void *arg);
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 3348a61de7d9..c023e0b1eb81 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -74,5 +74,5 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
-	walk_stackframe(NULL, regs, fill_callchain, entry);
+	arch_stack_walk(fill_callchain, entry, NULL, regs);
 }
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 08d11a53f39e..b51e32d50a0e 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,8 +16,9 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
-void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(void *, unsigned long), void *arg)
+noinline notrace void arch_stack_walk(stack_trace_consume_fn consume_entry,
+		  void *cookie, struct task_struct *task,
+		  struct pt_regs *regs)
 {
 	unsigned long fp, sp, pc;
 	int level = 0;
@@ -29,7 +30,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	} else if (task == NULL || task == current) {
 		fp = (unsigned long)__builtin_frame_address(0);
 		sp = current_stack_pointer;
-		pc = (unsigned long)walk_stackframe;
+		pc = (unsigned long)arch_stack_walk;
 	} else {
 		/* task blocked in __switch_to */
 		fp = task->thread.s[0];
@@ -41,7 +42,8 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		unsigned long low, high;
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || (level++ >= 1 && !fn(arg, pc))))
+		if (unlikely(!__kernel_text_address(pc) ||
+		   (level++ >= 1 && !consume_entry(cookie, pc))))
 			break;
 
 		/* Validate frame pointer */
@@ -66,8 +68,9 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 
 #else /* !CONFIG_FRAME_POINTER */
 
-void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
+noinline notrace void arch_stack_walk(stack_trace_consume_fn consume_entry,
+		  void *cookie, struct task_struct *task,
+		  struct pt_regs *regs)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
@@ -77,7 +80,7 @@ void notrace walk_stackframe(struct task_struct *task,
 		pc = instruction_pointer(regs);
 	} else if (task == NULL || task == current) {
 		sp = current_stack_pointer;
-		pc = (unsigned long)walk_stackframe;
+		pc = (unsigned long)arch_stack_walk;
 	} else {
 		/* task blocked in __switch_to */
 		sp = task->thread.sp;
@@ -89,7 +92,7 @@ void notrace walk_stackframe(struct task_struct *task,
 
 	ksp = (unsigned long *)sp;
 	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc)))
+		if (__kernel_text_address(pc) && unlikely(!consume_entry(cookie, pc)))
 			break;
 		pc = (*ksp++) - 0x4;
 	}
@@ -108,7 +111,7 @@ static bool print_trace_address(void *arg, unsigned long pc)
 noinline void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 		    const char *loglvl)
 {
-	walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
+	arch_stack_walk(print_trace_address, (void *)loglvl, task, regs);
 }
 
 void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
@@ -133,13 +136,7 @@ unsigned long __get_wchan(struct task_struct *task)
 
 	if (!try_get_task_stack(task))
 		return 0;
-	walk_stackframe(task, NULL, save_wchan, &pc);
+	arch_stack_walk(save_wchan, &pc, task, NULL);
 	put_task_stack(task);
 	return pc;
 }
-
-noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
-		     struct task_struct *task, struct pt_regs *regs)
-{
-	walk_stackframe(task, regs, consume_entry, cookie);
-}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
