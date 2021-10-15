Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19697C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 17:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB5C611C1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 17:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFB5C611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7wKcVvQQCC56E/MI2Is1HvE1Ap+EEpwV/CegL/7CDM=; b=2owZz6t56y7RPl
	DMyngwWTUR9p0cB5npUSnkyTQmpEUOMdFw6faT2bO2x/eQPjAajE3AhmTKaRXCR41WK0y9Xtesguh
	Ua3ZF1iuR+MPtXkEE+RmGOSDovi7LZ36aRmmyUzsNGgCuFF/fyRS3JPMcnQ/Tqp9hI7eWE40AtNEb
	GYGFR+wnhlvHlKvHWxhQG2hKOh9wn3W2MlliKejFWn4XwNMAAia+Pnlqnoq2NQx761y3ICeqnI9FC
	xeeQbf0tbPSkMoLw6BQQ8gxmD4QHib/2diN4VKO9K6WTGzM/7IlFJ3FFTN0jEJsps4WU2AI2jHUBK
	16qw+OjxFM01scycsdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbRTE-008NbC-4V; Fri, 15 Oct 2021 17:58:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRTA-008NZo-CA
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 17:58:14 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF98C60F93;
 Fri, 15 Oct 2021 17:58:08 +0000 (UTC)
Date: Fri, 15 Oct 2021 13:58:06 -0400
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
Message-ID: <20211015135806.72d1af23@gandalf.local.home>
In-Reply-To: <20211015133504.6c0a9fcc@gandalf.local.home>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_105812_504306_4C65A6C1 
X-CRM114-Status: GOOD (  25.47  )
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

On Fri, 15 Oct 2021 13:35:04 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 15 Oct 2021 18:17:02 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Fri, Oct 15, 2021 at 11:00:35AM -0400, Steven Rostedt wrote:  
> > > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > > 
> > > While writing an email explaining the "bit = 0" logic for a discussion on    
> >   
> > >  	bit = trace_get_context_bit() + start;    
> > 
> > While there, you were also going to update that function to match/use
> > get_recursion_context(). Because your version is still branch hell.  
> 
> That would probably be a separate patch. This is just a fix to a design
> flaw, changing the context tests would be performance enhancement.
> 
> Thanks for the reminder (as it was on my todo list to update that code).

Something like this:

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: [PATCH] tracing: Reuse logic from perf's get_recursion_context()

Instead of having branches that adds noise to the branch prediction, use
the addition logic to set the bit for the level of interrupt context that
the state is currently in. This copies the logic from perf's
get_recursion_context() function.

Link: https://lore.kernel.org/all/20211015161702.GF174703@worktop.programming.kicks-ass.net/

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 include/linux/trace_recursion.h | 11 ++++++-----
 kernel/trace/ring_buffer.c      | 12 ++++++------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index 168fdf07419a..41f5bfd9e93f 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -119,12 +119,13 @@ enum {
 static __always_inline int trace_get_context_bit(void)
 {
 	unsigned long pc = preempt_count();
+	unsigned char bit = 0;
 
-	if (!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)))
-		return TRACE_CTX_NORMAL;
-	else
-		return pc & NMI_MASK ? TRACE_CTX_NMI :
-			pc & HARDIRQ_MASK ? TRACE_CTX_IRQ : TRACE_CTX_SOFTIRQ;
+	bit += !!(pc & (NMI_MASK));
+	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK));
+	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+
+	return TRACE_CTX_NORMAL - bit;
 }
 
 #ifdef CONFIG_FTRACE_RECORD_RECURSION
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index c5a3fbf19617..15d4380006e3 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -3168,13 +3168,13 @@ trace_recursive_lock(struct ring_buffer_per_cpu *cpu_buffer)
 {
 	unsigned int val = cpu_buffer->current_context;
 	unsigned long pc = preempt_count();
-	int bit;
+	int bit = 0;
 
-	if (!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)))
-		bit = RB_CTX_NORMAL;
-	else
-		bit = pc & NMI_MASK ? RB_CTX_NMI :
-			pc & HARDIRQ_MASK ? RB_CTX_IRQ : RB_CTX_SOFTIRQ;
+	bit += !!(pc & (NMI_MASK));
+	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK));
+	bit += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
+
+	bit = RB_CTX_NORMAL - bit;
 
 	if (unlikely(val & (1 << (bit + cpu_buffer->nest)))) {
 		/*
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
