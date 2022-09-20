Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A825BECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsMwJMxjzCh/FMXe857XtBxjr+pfZRi9xYX5LipR7NQ=; b=eDZshGNn+Wzhnw
	GUUw6paUAG9aVu3+UCDzhi71V9r/TBH3PvhHSF0p3uWn5834EJg5CXPu/Ofw9IqCEIRh2OuBtCGxB
	BCNT3+F5brNrMj3g/j/H3oMUl9qZ/5Q3ck2OPdt4R+HdZP8EMxQjnG77jMmptXGYbFpOgPZlhH5IB
	ujzI4L67pWDnnQ/7E7WLaQf61AImqy53oFSFIfWDnYTEFQI8gOhuP2ADJVPowS8naRkcGX8VstLbF
	luxABQWTG8jgnQoFpPOs0+VO9wRIj2YDoUuM/MEChaHNHndNzOplkqTZRxS+uT7k9ipX/hYGbG0cN
	+qU8FwS6ZVoL+2DJEUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyu-004msG-Av; Tue, 20 Sep 2022 15:16:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeys-004mpS-41
	for linux-riscv@bombadil.infradead.org; Tue, 20 Sep 2022 15:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dMv3JhBtiEIvXWCxJQA4DJYcxOivlhMEWx5dSZPRPv0=; b=IyNXtCPCmh4ColbAhKKVfmFfGl
	ZwZaRS+erkfdaaElmsDzizOYVSRvChk+AL9vAUTo0H99aYCO0811ZfJzInW6VsHn5F/P8R9/4kar+
	QZA6Ogok66xrxP/fOf2FloCvNzA1BT8Xoy65CY9szJNucgcqgY2YunZ5IWXUV5O7A01OMwrcO9zF7
	dKSJbW5jbz7vDEoKs0rccJCE/7PV/BSIvFf2up+rpCq+w7R8p1EsbPGXCdgGmclfaPA32z3pXcNws
	oSsbjCmGy7GvTchNwhOcj7R5IQKAzO4mlqBE0qSXCOgp+7w/wu0Q9KRZ6beFm5xmmW6Nn/OT9Gm/3
	KIzNEjwQ==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyn-00EN4c-21
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 15:16:12 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MX4nG3fd6zHpCw;
	Tue, 20 Sep 2022 23:13:38 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:47 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:46 +0800
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
Subject: [PATCH -next 7/7] riscv: stacktrace: Fix unwinding on __kretporbe_trampoline
Date: Tue, 20 Sep 2022 23:12:02 +0800
Message-ID: <20220920151202.180057-8-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920151202.180057-1-chenzhongjin@huawei.com>
References: <20220920151202.180057-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_161610_221751_2B389C47 
X-CRM114-Status: GOOD (  10.51  )
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

When unwinding on __kretprobe_trampoline, the caller of traced function
will be skipped because unwinder doesn't read the saved pt_regs.

Things going like this:

caller's caller		|       ...                 |<---+
caller			+---------------------------+    |
			| ra caller's caller        |    |
			| s0 of caller's caller     |    |
			|       ...                 |    |
probed func returned	+---------------------------+    |
__kretprobe_trampoline	| pt_regs:                  |    |
			| epc caller                |    |
                        | ra  __kretprobe_trampoline|    |
			|       ...                 |    |
                        | s0 of caller              | {ra, fp}
			|       ...                 |

Since from caller to __kretprobe_trampoline, the {ra, fp} are not
changed, unwinder will go directly to caller's caller.

Now we can have an ENCODED_FRAME_POINTER on stack and read the pt_regs,
kretporbe will set the epc to correct_ret_addr so that we can unwind
to the correct caller.

Stacktrace before this patch:

 Call Trace:
  ...
  [<ffffffff800d5d48>] __kretprobe_trampoline_handler+0xc2/0x13e
  [<ffffffff808b766c>] trampoline_probe_handler+0x30/0x46
  [<ffffffff800070de>] __kretprobe_trampoline+0x52/0x92
  [<ffffffff0163809c>] kprobe_init+0x9c/0x1000 [kprobe_unwind]
  [<ffffffff800027c8>] do_one_initcall+0x4c/0x1f2
  ...

Stacktrace after this patch:

 Call Trace:
  ...
  [<ffffffff800d5d48>] __kretprobe_trampoline_handler+0xc2/0x13e
  [<ffffffff808b766c>] trampoline_probe_handler+0x30/0x46
  [<ffffffff800070de>] __kretprobe_trampoline+0x52/0x92
+ [<ffffffff01633076>] the_caller+0x2c/0x38 [kprobe_unwind]
  [<ffffffff0163809c>] kprobe_init+0x9c/0x1000 [kprobe_unwind]
  [<ffffffff800027c8>] do_one_initcall+0x4c/0x1f2
  ...

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/riscv/include/asm/stacktrace.h           | 4 ++++
 arch/riscv/kernel/probes/kprobes_trampoline.S | 8 ++++++++
 arch/riscv/kernel/stacktrace.c                | 5 +++++
 3 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index a39e4ef1dbd5..506c7c38b6cb 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -16,6 +16,10 @@ struct unwind_state {
 	unsigned long sp;
 	unsigned long pc;
 	struct pt_regs *regs;
+#ifdef CONFIG_KRETPROBES
+	struct llist_node *kr_cur;
+	struct task_struct *task;
+#endif
 };
 
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/kprobes_trampoline.S
index 7bdb09ded39b..3c0677a714a6 100644
--- a/arch/riscv/kernel/probes/kprobes_trampoline.S
+++ b/arch/riscv/kernel/probes/kprobes_trampoline.S
@@ -6,6 +6,8 @@
 
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
+#include <asm/frame.h>
+#include <asm/csr.h>
 
 	.text
 	.altmacro
@@ -79,6 +81,12 @@ ENTRY(__kretprobe_trampoline)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	save_all_base_regs
 
+#ifdef CONFIG_FRAME_POINTER
+	li s0, SR_PP
+	REG_S s0, PT_STATUS(sp)
+	ENCODE_FRAME_POINTER
+#endif
+
 	move a0, sp /* pt_regs */
 
 	call trampoline_probe_handler
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 976dc298ab3b..53edc685ca18 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -11,6 +11,7 @@
 #include <linux/sched/task_stack.h>
 #include <linux/stacktrace.h>
 #include <linux/ftrace.h>
+#include <linux/kprobes.h>
 
 #include <asm/stacktrace.h>
 
@@ -123,6 +124,10 @@ noinline notrace void arch_stack_walk(stack_trace_consume_fn consume_entry,
 		state.sp = task->thread.sp;
 		state.pc = task->thread.ra;
 	}
+#ifdef CONFIG_KRETPROBES
+	state.kr_cur = NULL;
+	state.task = task;
+#endif
 
 	unwind(&state, consume_entry, cookie);
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
