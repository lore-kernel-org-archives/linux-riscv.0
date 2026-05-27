Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C79CD5BD0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J81JJwr4Mc+ZJGO7ZzVG5mXISsYm0xDXyDFY5YdmkRY=; b=JD5U6SZURxSSmR
	uTYGV5fQ5au0jVgJ9Mo7S9ed5dBBSYfQixCrGefbr33H7XtD6HQrfSz6duKErXbf3V9UHYZKvShbZ
	6cNoh5k09yKVznaoGQu7uciYHeYIOkWD/j39/gtdPLwEmZhV3X0Y31UgUs+N745Hxo9916JEbH+nZ
	sGzlBWDSgtgSqYmRJVhr+YN0x53EOmfkAIMnFtXZkd/icZS9j6gF2GPzyQawlHDkvvl1yTmKMY8a5
	KGEYu7OHwqIMInJZQwxxASETS2H8KMuI6Gs3VNn1uP387Jt8qUm/f9rPOVI/fFIll98NMyF4qZ5n+
	Dvqju5BwVxMQxDbiQlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDUG-000000046EF-3KF5;
	Wed, 27 May 2026 12:35:52 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDUB-000000046AY-1Kru
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 12:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779885344; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=PWXhWzyCALmai/5XB1OyTOO1hzuVkcfr5CK2JaR3L3w=;
	b=HThjKnEFgmS2vhDw3rwV7gFfXeMvq3FkBkCI2DnpMqp4ZqwwG/+36V++hLW7GWzu7YIMF3Pf3ireerAnfxB764kAsnaWdMe6RDQvK2nd2MXZrdpeE1NfuM6vPx5gTXhUyU5WsBIQRq45TML68n/pPanpa4gDEJGtFxlEs1bJwVU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0X3jh1D0_1779885340;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X3jh1D0_1779885340 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 27 May 2026 20:35:41 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 5/8] riscv: stacktrace: introduce stack-bound tracking helpers
Date: Wed, 27 May 2026 20:35:27 +0800
Message-ID: <20260527123530.2593918-6-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_053547_559304_68A7A5EE 
X-CRM114-Status: GOOD (  26.23  )
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

A reliable unwinder needs to validate that every frame record it reads
is fully contained in a known kernel stack, and it needs to refuse to
walk back into a stack it has already left. Add the building blocks
for that:

  * struct stack_info / struct unwind_state in a new
    asm/stacktrace/common.h, modelled on the arm64 reference
    implementation.
  * stackinfo_get_irq() / stackinfo_get_task() / stackinfo_get_overflow()
    plus the corresponding on_*_stack() predicates in asm/stacktrace.h,
    so callers can ask "is this object on stack X?" by stack kind
    rather than open-coded address arithmetic.
  * unwind_init_common(), unwind_find_stack() and
    unwind_consume_stack() helpers that enforce the
    forward-progress-only invariant required for reliability.

No existing user is wired up to these helpers in this commit; the
unwinder switch comes in a follow-up. The header changes leave
on_thread_stack() with the same semantics as before, just expressed in
terms of the new helpers.

Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 arch/riscv/include/asm/stacktrace.h        |  65 ++++++++-
 arch/riscv/include/asm/stacktrace/common.h | 159 +++++++++++++++++++++
 2 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace/common.h

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce..bc87c4940379 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -3,8 +3,13 @@
 #ifndef _ASM_RISCV_STACKTRACE_H
 #define _ASM_RISCV_STACKTRACE_H
 
+#include <linux/percpu.h>
 #include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+
+#include <asm/irq_stack.h>
 #include <asm/ptrace.h>
+#include <asm/stacktrace/common.h>
 
 struct stackframe {
 	unsigned long fp;
@@ -16,14 +21,70 @@ extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *re
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
-static inline bool on_thread_stack(void)
+/*
+ * IRQ stack accessors
+ */
+static inline struct stack_info stackinfo_get_irq(void)
+{
+	unsigned long low = (unsigned long)raw_cpu_read(irq_stack_ptr);
+	unsigned long high = low + IRQ_STACK_SIZE;
+
+	return (struct stack_info) {
+		.low = low,
+		.high = high,
+	};
+}
+
+static inline bool on_irq_stack(unsigned long sp, unsigned long size)
+{
+	struct stack_info info = stackinfo_get_irq();
+
+	return stackinfo_on_stack(&info, sp, size);
+}
+
+/*
+ * Task stack accessors
+ */
+static inline struct stack_info stackinfo_get_task(const struct task_struct *tsk)
 {
-	return !(((unsigned long)(current->stack) ^ current_stack_pointer) & ~(THREAD_SIZE - 1));
+	unsigned long low = (unsigned long)task_stack_page(tsk);
+	unsigned long high = low + THREAD_SIZE;
+
+	return (struct stack_info) {
+		.low = low,
+		.high = high,
+	};
+}
+
+static inline bool on_task_stack(const struct task_struct *tsk,
+				 unsigned long sp, unsigned long size)
+{
+	struct stack_info info = stackinfo_get_task(tsk);
+
+	return stackinfo_on_stack(&info, sp, size);
 }
 
+/*
+ * Cast is necessary since current->stack is an opaque ptr.
+ */
+#define on_thread_stack()	(on_task_stack(current, current_stack_pointer, 1))
 
+/*
+ * Overflow stack accessors
+ */
 #ifdef CONFIG_VMAP_STACK
 DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
+
+static inline struct stack_info stackinfo_get_overflow(void)
+{
+	unsigned long low = (unsigned long)raw_cpu_ptr(overflow_stack);
+	unsigned long high = low + OVERFLOW_STACK_SIZE;
+
+	return (struct stack_info) {
+		.low = low,
+		.high = high,
+	};
+}
 #endif /* CONFIG_VMAP_STACK */
 
 #endif /* _ASM_RISCV_STACKTRACE_H */
diff --git a/arch/riscv/include/asm/stacktrace/common.h b/arch/riscv/include/asm/stacktrace/common.h
new file mode 100644
index 000000000000..87d6d40672f3
--- /dev/null
+++ b/arch/riscv/include/asm/stacktrace/common.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * RISC-V common stack unwinder types and helpers.
+ *
+ * See: arch/arm64/include/asm/stacktrace/common.h for the reference
+ * implementation.
+ *
+ * Copyright (C) 2024
+ */
+#ifndef __ASM_RISCV_STACKTRACE_COMMON_H
+#define __ASM_RISCV_STACKTRACE_COMMON_H
+
+#include <linux/compiler.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+
+#include <asm/stacktrace/frame.h>
+
+/**
+ * struct stack_info - describes the bounds of a stack.
+ *
+ * @low:  The lowest valid address on the stack.
+ * @high: The highest valid address on the stack.
+ */
+struct stack_info {
+	unsigned long low;
+	unsigned long high;
+};
+
+/**
+ * struct unwind_state - state used for robust unwinding.
+ *
+ * @fp:        The fp value in the frame record (or the real fp).
+ * @pc:        The ra value in the frame record (or the real ra).
+ *
+ * @stack:     The stack currently being unwound.
+ * @stacks:    An array of stacks which can be unwound.
+ * @nr_stacks: The number of stacks in @stacks.
+ */
+struct unwind_state {
+	unsigned long fp;
+	unsigned long pc;
+
+	struct stack_info stack;
+	struct stack_info *stacks;
+	int nr_stacks;
+};
+
+/**
+ * stackinfo_get_unknown() - Get an unknown stack_info.
+ *
+ * Return: a stack_info with low and high set to 0.
+ */
+static inline struct stack_info stackinfo_get_unknown(void)
+{
+	return (struct stack_info) {
+		.low = 0,
+		.high = 0,
+	};
+}
+
+/**
+ * stackinfo_on_stack() - Check whether an object is fully within a stack.
+ *
+ * @info: The stack to check against.
+ * @sp:   The base address of the object.
+ * @size: The size of the object.
+ *
+ * Return: true if the object is fully contained within the stack.
+ */
+static inline bool stackinfo_on_stack(const struct stack_info *info,
+				      unsigned long sp, unsigned long size)
+{
+	if (!info->low)
+		return false;
+
+	if (sp < info->low || sp + size < sp || sp + size > info->high)
+		return false;
+
+	return true;
+}
+
+/**
+ * unwind_init_common() - Initialize the common parts of the unwind state.
+ *
+ * @state: the unwind state to initialize.
+ */
+static inline void unwind_init_common(struct unwind_state *state)
+{
+	state->stack = stackinfo_get_unknown();
+}
+
+/**
+ * unwind_find_stack() - Find the accessible stack which entirely contains an
+ * object.
+ *
+ * @state: the current unwind state.
+ * @sp:    the base address of the object.
+ * @size:  the size of the object.
+ *
+ * Return: a pointer to the relevant stack_info if found; NULL otherwise.
+ */
+static inline struct stack_info *unwind_find_stack(struct unwind_state *state,
+						   unsigned long sp,
+						   unsigned long size)
+{
+	struct stack_info *info = &state->stack;
+
+	if (stackinfo_on_stack(info, sp, size))
+		return info;
+
+	for (int i = 0; i < state->nr_stacks; i++) {
+		info = &state->stacks[i];
+		if (stackinfo_on_stack(info, sp, size))
+			return info;
+	}
+
+	return NULL;
+}
+
+/**
+ * unwind_consume_stack() - Update stack boundaries so that future unwind steps
+ * cannot consume this object again.
+ *
+ * @state: the current unwind state.
+ * @info:  the stack_info of the stack containing the object.
+ * @sp:    the base address of the object.
+ * @size:  the size of the object.
+ *
+ * Stack transitions are strictly one-way, and once we've
+ * transitioned from one stack to another, it's never valid to
+ * unwind back to the old stack.
+ *
+ * Note that stacks can nest in several valid orders, e.g.
+ *
+ *   TASK -> IRQ -> OVERFLOW
+ *
+ * ... so we do not check the specific order of stack
+ * transitions.
+ */
+static inline void unwind_consume_stack(struct unwind_state *state,
+					struct stack_info *info,
+					unsigned long sp,
+					unsigned long size)
+{
+	struct stack_info tmp;
+
+	tmp = *info;
+	*info = stackinfo_get_unknown();
+	state->stack = tmp;
+
+	/*
+	 * Future unwind steps can only consume stack above this frame record.
+	 * Update the current stack to start immediately above it.
+	 */
+	state->stack.low = sp + size;
+}
+
+#endif /* __ASM_RISCV_STACKTRACE_COMMON_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
