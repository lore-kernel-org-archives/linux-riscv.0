Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE160A262F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BSDltmDS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=d4l7ZaYo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KWXWuuqvpyo38C8YN5x5SQlmVLI9yFqb1ozmkgzdMpA=; b=BSDltmDS8wL/rnSS0CvMMMPPVo
	IUoMAirw1TbNSsPDgSUalZovJ59fg10mseZrZgUxTcXdI49K0tgqgBWA18Xf7KAlVdR3/8dBXwae0
	AhTbxRxHS02O9q/q2rSON/TvaYkPzSNvvsWQI32sLNY34NG1/FZ8YZEKgQ2rtr8usNW39b2V6qG1D
	TuU0xKfKkQ8GJxGesF6DtF5MSpiei28LC7JPfSpxDYqfxDrg2y9gnQQ5Y+c99jrYPdwLwlUikBOyU
	5LcP1oNUts1drSU1Lx0ITRS/BW+eohubYXABaJEElHppUVen0SOWu5WYPfJER+OmrHBnMl/A8IsVl
	NGjC/qYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoJ-000000026Do-3wy2;
	Tue, 10 Nov 2026 01:38:07 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoH-000000026Cc-2hDM
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 01:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794274678; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=gxJalAltFJ+mzwybO3QEc8bbloiNp6J964VtBr6AK/M=;
	b=d4l7ZaYo2DtEK8kYTAca12mqQ2CZhYxlTdTbfQ0o8sMq9pNsMJWeuEaEhaIeXDE6HPuyV8dqn2FnqV1wAoyjASolMbc3Aa1U5oPN60Jom+2uNkBR/jwggZ0qm2vETAtauEPdf5lEKmVU0MufI3AuRSfUxGXxVW89LJ/xZ9cs9GY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=36;SR=0;TI=SMTPD_---0XETOX1E_1794274674;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XETOX1E_1794274674 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 09:37:56 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	oleg@redhat.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org,
	mpdesouza@suse.com,
	martin@kaiser.cx,
	kmehltretter@gmail.com,
	oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v7 01/10] riscv: stacktrace: do not report the walker's own frame from arch_stack_walk()
Date: Tue, 10 Nov 2026 09:37:41 +0800
Message-Id: <20261110013750.36800-2-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261110013750.36800-1-xueshuai@linux.alibaba.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_173805_931228_66D9A165 
X-CRM114-Status: GOOD (  15.24  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Karl Mehltretter <kmehltretter@gmail.com>

stack_trace_save() uses skipnr + 1 because arch_stack_walk() is expected
to first report the return into stack_trace_save(). With FRAME_POINTER,
the RISC-V arch_stack_walk() calls walk_stackframe(), which starts from
its own frame and first reports the return into arch_stack_walk().
stack_trace_save() therefore starts one frame too early. For example,
page_owner records begin at __set_page_owner() instead of the allocation
site.

Move the walker into an always-inlined helper and call it directly from
arch_stack_walk(). Keep walk_stackframe() as a wrapper for its existing
callers.

return_address() skips level + 3 entries, while the arm64 implementation
skips level + 2. After removing the extra frame, use level + 2 so
ftrace_return_address() and CALLER_ADDR results do not shift by one caller.

Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1)")
Link: https://lore.kernel.org/r/20261010132712.46931-1-kmehltretter@gmail.com
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 arch/riscv/kernel/return_address.c |  2 +-
 arch/riscv/kernel/stacktrace.c     | 40 ++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/return_address.c b/arch/riscv/kernel/return_address.c
index c8115ec8fb30..4da1cfd249d3 100644
--- a/arch/riscv/kernel/return_address.c
+++ b/arch/riscv/kernel/return_address.c
@@ -33,7 +33,7 @@ noinline void *return_address(unsigned int level)
 {
 	struct return_address_data data;
 
-	data.level = level + 3;
+	data.level = level + 2;
 	data.addr = NULL;
 
 	arch_stack_walk(save_return_addr, &data, current, NULL);
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..28c5744889ba 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -45,8 +45,16 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 	return !(fp < low || fp > high || fp & 0x07);
 }
 
-void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(void *, unsigned long), void *arg)
+/*
+ * Always inlined so that the frame the walk starts from is the caller's own,
+ * and the first entry reported for the current task is the caller's return
+ * address.  arch_stack_walk() relies on that to report the same frames as
+ * the other architectures, see the comment there.
+ */
+static __always_inline void __walk_stackframe(struct task_struct *task,
+					      struct pt_regs *regs,
+					      bool (*fn)(void *, unsigned long),
+					      void *arg)
 {
 	unsigned long fp, sp, pc;
 	int graph_idx = 0;
@@ -59,6 +67,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	} else if (task == NULL || task == current) {
 		fp = (unsigned long)__builtin_frame_address(0);
 		sp = current_stack_pointer;
+		/* Placeholder for the frame the walk starts from, never reported. */
 		pc = (unsigned long)walk_stackframe;
 		level = -1;
 	} else {
@@ -102,10 +111,18 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
+			     bool (*fn)(void *, unsigned long), void *arg)
+{
+	__walk_stackframe(task, regs, fn, arg);
+}
+
 #else /* !CONFIG_FRAME_POINTER */
 
-void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
+static __always_inline void __walk_stackframe(struct task_struct *task,
+					      struct pt_regs *regs,
+					      bool (*fn)(void *, unsigned long),
+					      void *arg)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
@@ -133,6 +150,12 @@ void notrace walk_stackframe(struct task_struct *task,
 	}
 }
 
+void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
+			     bool (*fn)(void *, unsigned long), void *arg)
+{
+	__walk_stackframe(task, regs, fn, arg);
+}
+
 #endif /* CONFIG_FRAME_POINTER */
 
 static bool print_trace_address(void *arg, unsigned long pc)
@@ -176,10 +199,17 @@ unsigned long __get_wchan(struct task_struct *task)
 	return pc;
 }
 
+/*
+ * The generic code expects the first entry for the current task to be the
+ * return address of arch_stack_walk() itself, the way x86 and arm64 report
+ * it, and stack_trace_save() sizes its skip count accordingly.  Walking from
+ * inside a called walk_stackframe() adds that function's own frame on top,
+ * so inline the walker here and start from this frame instead.
+ */
 noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
-	walk_stackframe(task, regs, consume_entry, cookie);
+	__walk_stackframe(task, regs, consume_entry, cookie);
 }
 
 /*
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
