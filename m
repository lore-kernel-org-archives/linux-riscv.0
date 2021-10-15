Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4311C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 18:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E6B60FE3
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 18:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67E6B60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEX8IHrIwVc9CD4N6aG+nesgMUC9kk6GCyTxIoTtDuw=; b=cWb/bE6BfWaxl9
	eYlvezD1C5Fx0ck6ycCHXR6I2tFREF+YOdsBdfix5YuJd+vGCSfPJ3AZcdyyAbEA5i9eef0kHcN23
	bEyrfHSc86unzIC6LeINbhGTlW0+R50eVIGogYQ7FE4B9Wq0OFlkkGkyjBQ6JVw4CASOLDfmSBZ4n
	+RXg55patxB3KlVp/gekH6DrmjcyS7x6SLJjyvt5FaOr484hH3ri5kFaw7YU0feUj02Nbd0SwnPyx
	6fePGkYX0mHtPDSKxwDAbvmfiFff08IE2zuoSsILJ+9TO4q9zj8m3eAoVhlitm5ljlKapYMvUZ9C1
	SKoHYq3kpjMQPZGD7FEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbRoy-008QMP-7f; Fri, 15 Oct 2021 18:20:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRot-008QKE-9q
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 18:20:42 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5A1960FF2;
 Fri, 15 Oct 2021 18:20:35 +0000 (UTC)
Date: Fri, 15 Oct 2021 14:20:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org, =?UTF-8?B?546L6LSH?=
 <yun.wang@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211015142033.72605b47@gandalf.local.home>
In-Reply-To: <20211015180429.GK174703@worktop.programming.kicks-ass.net>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
 <20211015135806.72d1af23@gandalf.local.home>
 <20211015180429.GK174703@worktop.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_112039_440109_34EB2569 
X-CRM114-Status: GOOD (  17.37  )
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

On Fri, 15 Oct 2021 20:04:29 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Oct 15, 2021 at 01:58:06PM -0400, Steven Rostedt wrote:
> > Something like this:  
> 
> I think having one copy of that in a header is better than having 3
> copies. But yes, something along them lines.

I was just about to ask you about this patch ;-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 4d244e295e85..a6ae329aa654 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -74,6 +74,27 @@
  */
 #define FORK_PREEMPT_COUNT	(2*PREEMPT_DISABLE_OFFSET + PREEMPT_ENABLED)
 
+/**
+ * interrupt_context_level - return interrupt context level
+ *
+ * Returns the current interrupt context level.
+ *  0 - normal context
+ *  1 - softirq context
+ *  2 - hardirq context
+ *  3 - NMI context
+ */
+static __always_inline unsigned char interrupt_context_level(void)
+{
+	unsigned long pc = preempt_count();
+	unsigned char level = 0;
+
+	level += !!(pc & (NMI_MASK));
+	level += !!(pc & (NMI_MASK | HARDIRQ_MASK));
+	level += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+
+	return level;
+}
+
 /* preempt_count() and related functions, depends on PREEMPT_NEED_RESCHED */
 #include <asm/preempt.h>
 
diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index 41f5bfd9e93f..018a04381556 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -118,12 +118,7 @@ enum {
 
 static __always_inline int trace_get_context_bit(void)
 {
-	unsigned long pc = preempt_count();
-	unsigned char bit = 0;
-
-	bit += !!(pc & (NMI_MASK));
-	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK));
-	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+	unsigned char bit = interrupt_context_level();
 
 	return TRACE_CTX_NORMAL - bit;
 }
diff --git a/kernel/events/internal.h b/kernel/events/internal.h
index 228801e20788..c91711f20cf8 100644
--- a/kernel/events/internal.h
+++ b/kernel/events/internal.h
@@ -206,11 +206,7 @@ DEFINE_OUTPUT_COPY(__output_copy_user, arch_perf_out_copy_user)
 static inline int get_recursion_context(int *recursion)
 {
 	unsigned int pc = preempt_count();
-	unsigned char rctx = 0;
-
-	rctx += !!(pc & (NMI_MASK));
-	rctx += !!(pc & (NMI_MASK | HARDIRQ_MASK));
-	rctx += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+	unsigned char rctx = interrupt_context_level();
 
 	if (recursion[rctx])
 		return -1;
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 15d4380006e3..f6520d0a4c8c 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -3167,12 +3167,7 @@ static __always_inline int
 trace_recursive_lock(struct ring_buffer_per_cpu *cpu_buffer)
 {
 	unsigned int val = cpu_buffer->current_context;
-	unsigned long pc = preempt_count();
-	int bit = 0;
-
-	bit += !!(pc & (NMI_MASK));
-	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK));
-	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+	int bit = interrupt_context_level();
 
 	bit = RB_CTX_NORMAL - bit;
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
