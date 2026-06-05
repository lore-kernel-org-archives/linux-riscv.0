Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58FFCD6E6B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Cc:Mime-Version:Message-Id:Date:
	Subject:To:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpyMMp9UjIJ8KVNIDuK5V9DgwwEYc42gtL6/DbN+dnU=; b=u+W9WvnEwEZ0qt
	cmvRqRBpNCWpNuF4w3RjxXsttDpga+q0hd2KR02miogI0EI8EfL9Xa9tQE7sZi6p7Zl0U0s7Mll6C
	d2u7O7my2HTTAKmS3W0GW0hGwTALMOs/id36nJzLH6+i2JREp/fJJad0apoxiwt2SROhYJ/R4i/TO
	IJD0P3r3/SMp+XDrB1pHb5f6lvviOYJgJxbMDEUBDrsLebA/x9mWcj+spGvcqNMpSgD6pNyX3D3pz
	j+fFEPdxKlssLnyOMXq6WribVBg3m4HgOQm5Q+sZhHVwXjLC70JcB8Y1xfGFuxPZyi05mu47wyHsu
	vCNetqNFKgYGd64IGwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPno-00000000IlB-25FW;
	Fri, 05 Jun 2026 08:21:16 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPnm-00000000IkA-41Q0
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 08:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780647669; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=BGE6tDrPFGqUs4MaoKsNPVSUNEuhQZ4U3v9K5VelGYg=;
 b=fzxg6w3xjLCRz5aIflxQ7d5X4B0vHihsRj3W1NrzQsKR1Ot5Q8eUu/vtGSHSjINMzZ8l16
 Jq/bgF+CoBhvrUo6nZzYoKn4dA4jlUQ8Oij9wHE+sGt7G3qe+Q/5sYZ3SrpJeUgN7EB7wF
 6WLjDZ9V8ay/h6SKrb3FMrMxT6xDhkzHQeb5KLhGvzKmZWdezo/z8doOQqz54KB81zH64i
 HWcgnFVGNKMSAHbEXzp3nR0j4DM1M9JPKECL4BNGVCQs2MhDcyqR28J1cZFfLlI9lynDBQ
 oqxs1ppsF5qjU72dxCYaHr2OlOesGz9yjx5QTINR2AvZPeBX3PmpepRuaNKjPw==
X-Original-From: Rui Qi <qirui.001@bytedance.com>
References: <20260603115329.791603-1-qirui.001@bytedance.com> <20260605082034.1426923-1-qirui.001@bytedance.com>
In-Reply-To: <20260605082034.1426923-1-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a2286f3+b68696+lists.infradead.org+qirui.001@bytedance.com>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>
Subject: [PATCH v2 2/2] riscv: stacktrace: Use %pB for return addresses and %pS for exact IPs
Date: Fri,  5 Jun 2026 16:20:34 +0800
Message-Id: <20260605082034.1426923-3-qirui.001@bytedance.com>
Mime-Version: 1.0
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_012115_071385_FE595B7E 
X-CRM114-Status: GOOD (  24.71  )
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

The print_trace_address callback uses print_ip_sym which formats
addresses with %pS. This does not adjust the address before symbol
lookup, so when a noreturn function (e.g. panic, do_exit) is the last
call in a function, the saved return address can point to the start of
the next function, and kallsyms resolves it to the wrong symbol.

The kernel provides %pB (sprint_backtrace) specifically for this
purpose: it subtracts 1 from the address before symbol lookup, which
is sufficient to fall back into the calling function range.

However, %pB must only be used for return addresses. walk_stackframe
passes two kinds of addresses to its callback:
- Exact instruction pointers: instruction_pointer(regs) and the epc
  from exception frames on the stack. These should use %pS since they
  are not return addresses and subtracting 1 could cause kallsyms to
  resolve them to the preceding function.
- Return addresses: frame->ra, regs->ra, and task->thread.ra. These
  should use %pB for correct symbol resolution, especially after
  noreturn calls.

Add an 'is_ra' parameter to the walk_stackframe callback to indicate
whether the address is a return address, then use %pB for return
addresses and %pS for exact instruction pointers. This matches the x86
approach which uses %pS for regs->ip via show_ip() and %pB for stack
return addresses via printk_stack_address().

Also update the walk_stackframe() declaration in asm/stacktrace.h and
the fill_callchain() callback in perf_callchain.c to match the new
signature.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/stacktrace.h |  2 +-
 arch/riscv/kernel/perf_callchain.c  |  7 +++-
 arch/riscv/kernel/stacktrace.c      | 54 ++++++++++++++++++++++++-----
 3 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce..6771d0e0f656 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -12,7 +12,7 @@ struct stackframe {
 };
 
 extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-				    bool (*fn)(void *, unsigned long), void *arg);
+				    bool (*fn)(void *, unsigned long, bool), void *arg);
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..0a5678f0d400 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -11,6 +11,11 @@ static bool fill_callchain(void *entry, unsigned long pc)
 	return perf_callchain_store(entry, pc) == 0;
 }
 
+static bool fill_callchain_walk(void *entry, unsigned long pc, bool is_ra)
+{
+	return fill_callchain(entry, pc);
+}
+
 /*
  * This will be called when the target is in user mode
  * This function will only be called when we use
@@ -44,5 +49,5 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 		return;
 	}
 
-	walk_stackframe(NULL, regs, fill_callchain, entry);
+	walk_stackframe(NULL, regs, fill_callchain_walk, entry);
 }
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..502729ab257b 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -46,32 +46,36 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 }
 
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(void *, unsigned long), void *arg)
+			     bool (*fn)(void *, unsigned long, bool), void *arg)
 {
 	unsigned long fp, sp, pc;
 	int graph_idx = 0;
 	int level = 0;
+	bool is_ra;
 
 	if (regs) {
 		fp = frame_pointer(regs);
 		sp = user_stack_pointer(regs);
 		pc = instruction_pointer(regs);
+		is_ra = false;	/* exact instruction pointer */
 	} else if (task == NULL || task == current) {
 		fp = (unsigned long)__builtin_frame_address(0);
 		sp = current_stack_pointer;
 		pc = (unsigned long)walk_stackframe;
+		is_ra = false;	/* function entry address */
 		level = -1;
 	} else {
 		/* task blocked in __switch_to */
 		fp = task->thread.s[0];
 		sp = task->thread.sp;
 		pc = task->thread.ra;
+		is_ra = true;	/* return address */
 	}
 
 	for (;;) {
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
+		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc, is_ra))))
 			break;
 
 		if (unlikely(!fp_is_valid(fp, sp)))
@@ -84,18 +88,21 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			/* We hit function where ra is not saved on the stack */
 			fp = frame->ra;
 			pc = regs->ra;
+			is_ra = true;	/* return address */
 		} else {
 			fp = READ_ONCE_TASK_STACK(task, frame->fp);
 			pc = READ_ONCE_TASK_STACK(task, frame->ra);
 			pc = ftrace_graph_ret_addr(task, &graph_idx, pc,
 						   &frame->ra);
+			is_ra = true;	/* return address */
 			if (pc >= (unsigned long)handle_exception &&
 			    pc < (unsigned long)&ret_from_exception_end) {
-				if (unlikely(!fn(arg, pc)))
+				if (unlikely(!fn(arg, pc, is_ra)))
 					break;
 
 				pc = ((struct pt_regs *)sp)->epc;
 				fp = ((struct pt_regs *)sp)->s0;
+				is_ra = false;	/* exact instruction pointer */
 			}
 		}
 
@@ -105,41 +112,58 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
+	struct pt_regs *regs, bool (*fn)(void *, unsigned long, bool), void *arg)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
+	bool is_ra;
 
 	if (regs) {
 		sp = user_stack_pointer(regs);
 		pc = instruction_pointer(regs);
+		is_ra = false;	/* exact instruction pointer */
 	} else if (task == NULL || task == current) {
 		sp = current_stack_pointer;
 		pc = (unsigned long)walk_stackframe;
+		is_ra = false;	/* function entry address */
 	} else {
 		/* task blocked in __switch_to */
 		sp = task->thread.sp;
 		pc = task->thread.ra;
+		is_ra = true;	/* return address */
 	}
 
 	if (unlikely(sp & 0x7))
 		return;
 
+	/*
+	 * Scan the stack for kernel text addresses.  Without frame pointers
+	 * we cannot distinguish return addresses from other saved text
+	 * addresses (e.g. pt_regs->epc), so all stack values are treated
+	 * as return addresses (is_ra = true).  This means pt_regs->epc
+	 * values found during the scan may be displayed with %pB instead
+	 * of the correct %pS, which can cause misattribution when the
+	 * exact IP is at offset 0 of a function.
+	 */
 	ksp = (unsigned long *)sp;
 	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc)))
+		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc, is_ra)))
 			break;
 		pc = READ_ONCE_NOCHECK(*ksp++);
+		is_ra = true;
 	}
 }
 
 #endif /* CONFIG_FRAME_POINTER */
 
-static bool print_trace_address(void *arg, unsigned long pc)
+static bool print_trace_address(void *arg, unsigned long pc, bool is_ra)
 {
 	const char *loglvl = arg;
 
-	print_ip_sym(loglvl, pc);
+	if (is_ra)
+		printk("%s[<%px>] %pB\n", loglvl, (void *)pc, (void *)pc);
+	else
+		printk("%s[<%px>] %pS\n", loglvl, (void *)pc, (void *)pc);
 	return true;
 }
 
@@ -155,7 +179,7 @@ void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 	dump_backtrace(NULL, task, loglvl);
 }
 
-static bool save_wchan(void *arg, unsigned long pc)
+static bool save_wchan(void *arg, unsigned long pc, bool is_ra)
 {
 	if (!in_sched_functions(pc)) {
 		unsigned long *p = arg;
@@ -176,10 +200,22 @@ unsigned long __get_wchan(struct task_struct *task)
 	return pc;
 }
 
+struct stack_walk_cookie {
+	stack_trace_consume_fn consume;
+	void *cookie;
+};
+
+static bool stack_walk_wrapper(void *arg, unsigned long pc, bool is_ra)
+{
+	struct stack_walk_cookie *ctx = arg;
+	return ctx->consume(ctx->cookie, pc);
+}
+
 noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
-	walk_stackframe(task, regs, consume_entry, cookie);
+	struct stack_walk_cookie ctx = { .consume = consume_entry, .cookie = cookie };
+	walk_stackframe(task, regs, stack_walk_wrapper, &ctx);
 }
 
 /*
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
