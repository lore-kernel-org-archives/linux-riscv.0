Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DADECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 15:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDzrojgHf3mBacJwjHCgwbfbPIIHEBuEpYWCY++dmFA=; b=Gdq1wV9f25CYt2
	Gz7C6Ylphs6VtUQfshigYFN5kar7ZV7BDEVOIwjSeVdcUaJMzmi+fVdyF0YXIvUzziji8nxNQXTmG
	S4lOxPMG4r/UuXk0EbEtDFOPq5QtWngcuyHgsdx5LFkc6JplKNr2NwkfchK2iCAyMoAncUX3y4XPp
	1i9ExL3JsYHaOsTGKijlp1mpOnaOfHNNm5vAjUR+2bLP8ITMnejwxqapL1JFdW5w4qvMSzJFlmTSp
	y3q/09tA2CO6HjxXghrd0Qi2yz1+H46qIJ2EvXKiqd4ZePDHJhKCGMxqQFPtXDgF2UPjBUJDQZ+nz
	OdsB4fxvtfgNzP0Pu1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyn-004mle-FZ; Tue, 20 Sep 2022 15:16:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeya-004mYR-E7
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 15:16:02 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MX4mV62YhzpTJj;
	Tue, 20 Sep 2022 23:12:58 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:46 +0800
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
Subject: [PATCH -next 5/7] riscv: stacktrace: Implement stacktrace for irq
Date: Tue, 20 Sep 2022 23:12:00 +0800
Message-ID: <20220920151202.180057-6-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920151202.180057-1-chenzhongjin@huawei.com>
References: <20220920151202.180057-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_081556_987898_8D29860D 
X-CRM114-Status: GOOD (  14.11  )
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

After adding encoded fp onto stack to record pt_regs, now the
unwinder have ability to unwind frame through irq.

There is two steps to unwind irq frame and the interrupted frame:

1. When there is an encoded fp on stack, we can get the pt_regs
and unwind frame by (regs->epc) and (regs->s0).

2. To unwind the interrupted frame, there is two possibilities,
we can determine the situation by checking whether the value in
frame->ra position is a fp value.

If there is a fp in ra position:
We are inside a leaf frame and there is only fp on ra position.
Get fp from ra position and get next pc from pt_regs.
Else:
Just get fp and next pc from stack frame.

Stacktrace before this patch:

 Call Trace:
  ...
  [<ffffffff800aa692>] __flush_smp_call_function_queue+0xde/0x1fa
  [<ffffffff800ab404>] generic_smp_call_function_single_interrupt+0x22/0x2a
  [<ffffffff800077b2>] handle_IPI+0xaa/0x108
  [<ffffffff803f827e>] riscv_intc_irq+0x56/0x6e
  [<ffffffff808d94b6>] generic_handle_arch_irq+0x4c/0x76
  [<ffffffff80003ad0>] ret_from_exception+0x0/0xc

Stacktrace after this patch:

 Call Trace:
  ...
  [<ffffffff800aa6da>] __flush_smp_call_function_queue+0xde/0x1fa
  [<ffffffff800ab44c>] generic_smp_call_function_single_interrupt+0x22/0x2a
  [<ffffffff800077fa>] handle_IPI+0xaa/0x108
  [<ffffffff803f82c6>] riscv_intc_irq+0x56/0x6e
  [<ffffffff808d94fe>] generic_handle_arch_irq+0x4c/0x76
  [<ffffffff80003ad0>] ret_from_exception+0x0/0xc
+ [<ffffffff80003d52>] arch_cpu_idle+0x22/0x28
+ [<ffffffff808e23a8>] default_idle_call+0x44/0xee
+ [<ffffffff80056ece>] do_idle+0x116/0x126
+ [<ffffffff8005706e>] cpu_startup_entry+0x36/0x38
+ [<ffffffff808d99ae>] kernel_init+0x0/0x15a
+ [<ffffffff80a007a0>] arch_post_acpi_subsys_init+0x0/0x38
+ [<ffffffff80a0100c>] start_kernel+0x7c4/0x7f2

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/riscv/kernel/stacktrace.c | 45 ++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index e84e21868a3e..976dc298ab3b 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,29 +16,60 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
+static struct pt_regs *decode_frame_pointer(unsigned long fp)
+{
+	if (!(fp & 0x1))
+		return NULL;
+
+	return (struct pt_regs *)(fp & ~0x1);
+}
+
 static int notrace unwind_next(struct unwind_state *state)
 {
 	unsigned long low, high, fp;
 	struct stackframe *frame;
+	struct pt_regs *regs;
 
-	fp = state->fp;
+	regs = decode_frame_pointer(state->fp);
 
 	/* Validate frame pointer */
-	low = state->sp + sizeof(struct stackframe);
+	if (regs) {
+		if user_mode(regs)
+			return -1;
+
+		fp = (unsigned long)regs;
+		low = state->sp;
+	} else {
+		fp = state->fp;
+		low = state->sp + sizeof(struct stackframe);
+	}
 	high = ALIGN(low, THREAD_SIZE);
 
 	if (fp < low || fp > high || fp & 0x7)
 		return -EINVAL;
 
-	/* Unwind stack frame */
 	frame = (struct stackframe *)fp - 1;
 	state->sp = fp;
 
-	if (state->regs && state->regs->epc == state->pc &&
-		fp & 0x7) {
-		state->fp = frame->ra;
-		state->pc = state->regs->ra;
+	if (regs) {
+	/* Unwind from irq to interrupted function */
+		state->fp = regs->s0;
+		state->pc = regs->epc;
+		state->regs = regs;
+	} else if (state->regs && state->regs->epc == state->pc) {
+	/* Unwind from interrupted function to caller*/
+		if (frame->ra < low || frame->ra > high) {
+		/* normal function */
+			state->fp = frame->fp;
+			state->pc = frame->ra;
+		} else {
+		/* leaf function */
+			state->fp = frame->ra;
+			state->pc = state->regs->ra;
+		}
+		state->regs = NULL;
 	} else {
+	/* Unwind from normal stack frame */
 		state->fp = frame->fp;
 		state->pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
 							(unsigned long *)fp - 1);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
