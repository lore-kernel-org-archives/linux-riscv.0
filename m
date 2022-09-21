Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DFAC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESgw8/rJ86pArDGN/7IFoZIHTkrg/SY6CZKGdXhN1mM=; b=oHYbVQsEaWeDzA
	wQEUnxoPxTGcJWj2/I6egQ52szJqUWAGwphWWFMpV3qYVlfwsZTnPuvxeIMcqVL5vwjDTQuxVNKoz
	Ji1qsS734r//3yH1dPEQtGkpg2B867gQT/kbLgo9iq6Ri4p72x8N8nUbqz8ioHf5d9iOnRgPfzCg6
	zP7kM+wN53sclV65wqKdk8LalkeYQ5DdjjaUpXd+YHaPYpB5V3+Zhz0f0nKj0fojnmmzllD6j2gjV
	sNSKXd4ebLYu7UH3riWmsmBbpGDzHLjUSVUEwH4hGeixKzP3Uj3/ws2MRBLhgDrTmV1RPkn7kQ7D5
	b59tlsYBHyGoKXIUMlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazG0-00BMo0-AQ; Wed, 21 Sep 2022 12:55:16 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazFw-00BMl9-Pr
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 12:55:14 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MXdZG6qlmz14Rfn;
	Wed, 21 Sep 2022 20:51:02 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 20:55:09 +0800
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
Subject: [PATCH for-next v2 2/4] riscv: stacktrace: Introduce unwind functions
Date: Wed, 21 Sep 2022 20:51:25 +0800
Message-ID: <20220921125128.33913-3-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220921125128.33913-1-chenzhongjin@huawei.com>
References: <20220921125128.33913-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_055513_260551_74FBC1F5 
X-CRM114-Status: GOOD (  14.69  )
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

Now all riscv unwinding code is inside arch_stack_walk. It's
not same as other architectures.

Make some refactoring, to move unwinding code into unwind() and
unwind_next() functions, which walks through all stack frames
or single frame.

This patch only moves code but doesn't make any logical change.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/riscv/include/asm/stacktrace.h |   7 ++
 arch/riscv/kernel/stacktrace.c      | 104 ++++++++++++++++++----------
 2 files changed, 74 insertions(+), 37 deletions(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b6cd3eddfd38..a39e4ef1dbd5 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -11,6 +11,13 @@ struct stackframe {
 	unsigned long ra;
 };
 
+struct unwind_state {
+	unsigned long fp;
+	unsigned long sp;
+	unsigned long pc;
+	struct pt_regs *regs;
+};
+
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index b51e32d50a0e..e84e21868a3e 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,54 +16,84 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
-noinline notrace void arch_stack_walk(stack_trace_consume_fn consume_entry,
-		  void *cookie, struct task_struct *task,
-		  struct pt_regs *regs)
+static int notrace unwind_next(struct unwind_state *state)
 {
-	unsigned long fp, sp, pc;
-	int level = 0;
+	unsigned long low, high, fp;
+	struct stackframe *frame;
 
-	if (regs) {
-		fp = frame_pointer(regs);
-		sp = user_stack_pointer(regs);
-		pc = instruction_pointer(regs);
-	} else if (task == NULL || task == current) {
-		fp = (unsigned long)__builtin_frame_address(0);
-		sp = current_stack_pointer;
-		pc = (unsigned long)arch_stack_walk;
+	fp = state->fp;
+
+	/* Validate frame pointer */
+	low = state->sp + sizeof(struct stackframe);
+	high = ALIGN(low, THREAD_SIZE);
+
+	if (fp < low || fp > high || fp & 0x7)
+		return -EINVAL;
+
+	/* Unwind stack frame */
+	frame = (struct stackframe *)fp - 1;
+	state->sp = fp;
+
+	if (state->regs && state->regs->epc == state->pc &&
+		fp & 0x7) {
+		state->fp = frame->ra;
+		state->pc = state->regs->ra;
 	} else {
-		/* task blocked in __switch_to */
-		fp = task->thread.s[0];
-		sp = task->thread.sp;
-		pc = task->thread.ra;
+		state->fp = frame->fp;
+		state->pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
+							(unsigned long *)fp - 1);
 	}
 
-	for (;;) {
-		unsigned long low, high;
-		struct stackframe *frame;
+	return 0;
+}
 
-		if (unlikely(!__kernel_text_address(pc) ||
-		   (level++ >= 1 && !consume_entry(cookie, pc))))
+static void notrace unwind(struct unwind_state *state,
+				stack_trace_consume_fn consume_entry, void *cookie)
+{
+	while (1) {
+		int ret;
+
+		if (!__kernel_text_address(state->pc))
+			break;
+
+		if (!consume_entry(cookie, state->pc))
 			break;
 
-		/* Validate frame pointer */
-		low = sp + sizeof(struct stackframe);
-		high = ALIGN(sp, THREAD_SIZE);
-		if (unlikely(fp < low || fp > high || fp & 0x7))
+		ret = unwind_next(state);
+		if (ret < 0)
 			break;
-		/* Unwind stack frame */
-		frame = (struct stackframe *)fp - 1;
-		sp = fp;
-		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
-			fp = frame->ra;
-			pc = regs->ra;
-		} else {
-			fp = frame->fp;
-			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
-						   (unsigned long *)(fp - 8));
-		}
+	}
+}
+
+noinline notrace void arch_stack_walk(stack_trace_consume_fn consume_entry,
+		  void *cookie, struct task_struct *task,
+		  struct pt_regs *regs)
+{
+	struct unwind_state state;
+
+	if (task == NULL)
+		task = current;
 
+	if (regs) {
+		state.fp = frame_pointer(regs);
+		state.sp = user_stack_pointer(regs);
+		state.pc = instruction_pointer(regs);
+		state.regs = regs;
+	} else if (task == current) {
+		state.fp = (unsigned long)__builtin_frame_address(0);
+		state.sp = current_stack_pointer;
+		state.pc = (unsigned long)arch_stack_walk;
+
+		/* skip frame of arch_stack_walk */
+		unwind_next(&state);
+	} else {
+		/* task blocked in __switch_to */
+		state.fp = task->thread.s[0];
+		state.sp = task->thread.sp;
+		state.pc = task->thread.ra;
 	}
+
+	unwind(&state, consume_entry, cookie);
 }
 
 #else /* !CONFIG_FRAME_POINTER */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
