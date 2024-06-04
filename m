Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5F3C25B74
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 03:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RmIZ32nfaETwYMJRW0t5mzP6+fmLRXpp9NgL6Dqe/8w=; b=TUFPHkvqZoBz3Q
	LxZW8Tl+FBSpXuFuqX5Vc/yCmAGCa2SgwiWbnolQr99n3SnlY1Rz9l7TcGAuRd4tfJ9UAjZvzIoqB
	EiiQrRppp9htaikXzf0mSdJnLiZ0h7EkjW0d3yRRNgGtUsfHGMoyEQQkIZSYee4DUyZcAPiR/68NJ
	B3mFgQCCExl5iVZVjZIrzhKIKN03n+fMLxS4c7UbEXqlxDDU8wTDWnNvP0/VZ5GveqRsSiFaXaatT
	b9LArC/Kil0U5Tk7KE0RD4yk4h9Mtzbc/lo+Wxv3/sH37fB6W1SzZwefQaHIemtn936bTPIfA12ny
	DeeS0Z0BHudlgCEgaHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sELAx-000000015yj-3WDC;
	Tue, 04 Jun 2024 03:49:31 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sELAu-000000015uk-11f3
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 03:49:30 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Vtc3y5hFkz1HCrM;
	Tue,  4 Jun 2024 11:47:26 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
	by mail.maildlp.com (Postfix) with ESMTPS id B93F6140230;
	Tue,  4 Jun 2024 11:49:12 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Jun
 2024 11:49:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <kan.liang@linux.intel.com>,
	<dev.mbstr@gmail.com>, <samuel.holland@sifive.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] riscv: stacktrace: Add USER_STACKTRACE support
Date: Tue, 4 Jun 2024 03:47:29 +0000
Message-ID: <20240604034729.841930-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_204928_649645_F4AA09D1 
X-CRM114-Status: GOOD (  15.53  )
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

Currently, userstacktrace is unsupported for riscv. So use the
perf_callchain_user() code as blueprint to implement the
arch_stack_walk_user() which add userstacktrace support on riscv.
Meanwhile, we can use arch_stack_walk_user() to simplify the implementation
of perf_callchain_user().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406012109.PDAjXm2i-lkp@intel.com/
---
v2:
- Fix the cocci warning, !A || A && B is equivalent to !A || B.
---
 arch/riscv/Kconfig                 |  1 +
 arch/riscv/kernel/perf_callchain.c | 46 ++----------------------------
 arch/riscv/kernel/stacktrace.c     | 43 ++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 43 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0525ee2d63c7..6ed96d935b8f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -193,6 +193,7 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
+	select USER_STACKTRACE_SUPPORT
 	select ZONE_DMA32 if 64BIT
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 3348a61de7d9..c7468af77c66 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -6,37 +6,9 @@
 
 #include <asm/stacktrace.h>
 
-/*
- * Get the return address for a single stackframe and return a pointer to the
- * next frame tail.
- */
-static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
-				    unsigned long fp, unsigned long reg_ra)
+static bool fill_callchain(void *entry, unsigned long pc)
 {
-	struct stackframe buftail;
-	unsigned long ra = 0;
-	unsigned long __user *user_frame_tail =
-		(unsigned long __user *)(fp - sizeof(struct stackframe));
-
-	/* Check accessibility of one struct frame_tail beyond */
-	if (!access_ok(user_frame_tail, sizeof(buftail)))
-		return 0;
-	if (__copy_from_user_inatomic(&buftail, user_frame_tail,
-				      sizeof(buftail)))
-		return 0;
-
-	if (reg_ra != 0)
-		ra = reg_ra;
-	else
-		ra = buftail.ra;
-
-	fp = buftail.fp;
-	if (ra != 0)
-		perf_callchain_store(entry, ra);
-	else
-		return 0;
-
-	return fp;
+	return perf_callchain_store(entry, pc) == 0;
 }
 
 /*
@@ -56,19 +28,7 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
-	unsigned long fp = 0;
-
-	fp = regs->s0;
-	perf_callchain_store(entry, regs->epc);
-
-	fp = user_backtrace(entry, fp, regs->ra);
-	while (fp && !(fp & 0x3) && entry->nr < entry->max_stack)
-		fp = user_backtrace(entry, fp, 0);
-}
-
-static bool fill_callchain(void *entry, unsigned long pc)
-{
-	return perf_callchain_store(entry, pc) == 0;
+	arch_stack_walk_user(fill_callchain, entry, regs);
 }
 
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 528ec7cc9a62..9685a2baa5d9 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -161,3 +161,46 @@ noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie
 {
 	walk_stackframe(task, regs, consume_entry, cookie);
 }
+
+/*
+ * Get the return address for a single stackframe and return a pointer to the
+ * next frame tail.
+ */
+static unsigned long unwind_user_frame(stack_trace_consume_fn consume_entry,
+				       void *cookie, unsigned long fp,
+				       unsigned long reg_ra)
+{
+	struct stackframe buftail;
+	unsigned long ra = 0;
+	unsigned long __user *user_frame_tail =
+		(unsigned long __user *)(fp - sizeof(struct stackframe));
+
+	/* Check accessibility of one struct frame_tail beyond */
+	if (!access_ok(user_frame_tail, sizeof(buftail)))
+		return 0;
+	if (__copy_from_user_inatomic(&buftail, user_frame_tail,
+				      sizeof(buftail)))
+		return 0;
+
+	ra = reg_ra ? : buftail.ra;
+
+	fp = buftail.fp;
+	if (!ra || !consume_entry(cookie, ra))
+		return 0;
+
+	return fp;
+}
+
+void arch_stack_walk_user(stack_trace_consume_fn consume_entry, void *cookie,
+			  const struct pt_regs *regs)
+{
+	unsigned long fp = 0;
+
+	fp = regs->s0;
+	if (!consume_entry(cookie, regs->epc))
+		return;
+
+	fp = unwind_user_frame(consume_entry, cookie, fp, regs->ra);
+	while (fp && !(fp & 0x3))
+		fp = unwind_user_frame(consume_entry, cookie, fp, 0);
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
