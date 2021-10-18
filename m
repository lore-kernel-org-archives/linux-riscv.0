Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959C7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 13:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD0E60C51
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 13:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FD0E60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbKs+HR/TTgi5r6I2Oa+amLmDRVWsMUTZfj2PeXe/PE=; b=ZFr/74p1ZL4Z1k
	dBeoVTEJQjZxkjxKwPO0ukpjGcIWg+y1foM8lgrAfW+VqxK9A6DnjpjGzTUMqnjbrFsOpd2ogzBK4
	+/h8jaLWUgysE5cy82WhdwCf3N63BLoisYyo9C0KWl+GdXg58HLZqXJY76Fr6Ju15R8dUb/SR1U3R
	mv32AUsYHKSvFRYXEiScYhOBHjesBd6hNH4nMSycPiGjx9drzzmzigMdnM8NIkwYo+6hRJtBvmtne
	j+V3dRaMAvo4CODmAc2jdJQvrpH3aNWOl6huzW432ovbaq4+4Ix3goTgTLvvQXU8JTEPDc6Jj5ElX
	++gN4UShLf/6lLADQ1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcT2y-00FuFx-Nu; Mon, 18 Oct 2021 13:51:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcT28-00FtzB-A5
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 13:50:34 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C166B606A5;
 Mon, 18 Oct 2021 13:50:28 +0000 (UTC)
Date: Mon, 18 Oct 2021 09:50:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Colin Ian King
 <colin.king@canonical.com>, Masami Hiramatsu <mhiramat@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Nicholas Piggin
 <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org, =?UTF-8?B?546L6LSH?=
 <yun.wang@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211018095027.52a23ff0@gandalf.local.home>
In-Reply-To: <YW1KKCFallDG+E01@alley>
References: <20211015110035.14813389@gandalf.local.home>
 <YW1KKCFallDG+E01@alley>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_065032_480565_16065174 
X-CRM114-Status: GOOD (  49.02  )
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

On Mon, 18 Oct 2021 12:19:20 +0200
Petr Mladek <pmladek@suse.com> wrote:

> On Fri 2021-10-15 11:00:35, Steven Rostedt wrote:
> > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > 
> > While writing an email explaining the "bit = 0" logic for a discussion on
> > making ftrace_test_recursion_trylock() disable preemption, I discovered a
> > path that makes the "not do the logic if bit is zero" unsafe.
> > 
> > Since we want to encourage architectures to implement all ftrace features,
> > having them slow down due to this extra logic may encourage the
> > maintainers to update to the latest ftrace features. And because this
> > logic is only safe for them, remove it completely.
> > 
> >  [*] There is on layer of recursion that is allowed, and that is to allow
> >      for the transition between interrupt context (normal -> softirq ->
> >      irq -> NMI), because a trace may occur before the context update is
> >      visible to the trace recursion logic.
> > 
> > diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> > index a9f9c5714e65..168fdf07419a 100644
> > --- a/include/linux/trace_recursion.h
> > +++ b/include/linux/trace_recursion.h
> > @@ -165,40 +147,29 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
> >  	unsigned int val = READ_ONCE(current->trace_recursion);
> >  	int bit;
> >  
> > -	/* A previous recursion check was made */
> > -	if ((val & TRACE_CONTEXT_MASK) > max)
> > -		return 0;  
> 
> @max parameter is no longer used.

Thanks for noticing!

> 
> > -
> >  	bit = trace_get_context_bit() + start;
> >  	if (unlikely(val & (1 << bit))) {
> >  		/*
> >  		 * It could be that preempt_count has not been updated during
> >  		 * a switch between contexts. Allow for a single recursion.
> >  		 */
> > -		bit = TRACE_TRANSITION_BIT;
> > +		bit = TRACE_CTX_TRANSITION + start;  
> 
> I just want to be sure that I understand it correctly.
> 
> The transition bit is the same for all contexts. It will allow one
> recursion only in one context.

Right.

> 
> IMHO, the same problem (not-yet-updated preempt_count) might happen
> in any transition between contexts: normal -> soft IRQ -> IRQ -> NMI.

Yes, and then we will drop the event if it happens twice, otherwise, we
will need to have a 4 layer transition bit mask, and allow 4 recursions,
which is more than I want to allow.


> 
> Well, I am not sure what exacly it means "preempt_count has not been
> updated during a switch between contexts."
> 
>    Is it that a function in the interrupt entry code is traced before
>    preempt_count is updated?
> 
>    Or that an interrupt entry is interrupted by a higher level
>    interrupt, e.g. IRQ entry code interrupted by NMI?

Both actually ;-)

There are places that can trigger a trace between the time the interrupt is
triggered, and the time the preempt_count updates the interrupt context it
is in. Thus the tracer will still think it is in the previous context. But
that is OK, unless, that interrupt happened while the previous context was
in the middle of tracing:

trace() {
  context = get_context(preempt_count);
  test_and_set_bit(context)
      <<--- interrupt --->>>
      trace() {
          context = get_context(preempt_count);
          test_and_set_bit(context); <-- detects recursion!
      }
      update_preempt_count(irq_context);

By allowing a single recursion, it still does the above trace.

Yes, if an NMI happens during that first interrupt trace, and it too traces
before the preempt_count is updated, it will detect it as a recursion.

But this can only happen for that one trace. After the trace returns, the
transition bit is cleared, and the tracing that happens in the rest of the
interrupt is using the proper context. Thus, to drop due to needing two
transition bits, it would require that an interrupt triggered during a
trace, and while it was tracing before the preempt_count update, it too
needed to be interrupted by something (NMI) and that needs to trace before
the preempt_count update.

Although, I think we were able to remove all the NMI tracing before the
update, there's a game of whack-a-mole to handle the interrupt cases.

> 
> 
> I guess that it is the first case. It would mean that the above
> function allows one mistake (one traced funtion in an interrupt entry
> code before the entry code updates preempt_count).
> 
> Do I get it correctly?
> Is this what we want?

Pretty much, which my above explanation to hopefully fill in the details.

> 
> 
> Could we please update the comment? I mean to say if it is a race
> or if we trace a function that should not get traced.

Comments can always use some loving ;-)

> 
> >  		if (val & (1 << bit)) {
> >  			do_ftrace_record_recursion(ip, pip);
> >  			return -1;
> >  		}
> > -	} else {
> > -		/* Normal check passed, clear the transition to allow it again */
> > -		val &= ~(1 << TRACE_TRANSITION_BIT);
> >  	}
> >  
> >  	val |= 1 << bit;
> >  	current->trace_recursion = val;
> >  	barrier();
> >  
> > -	return bit + 1;
> > +	return bit;
> >  }
> >  
> >  static __always_inline void trace_clear_recursion(int bit)
> >  {
> > -	if (!bit)
> > -		return;
> > -
> >  	barrier();
> > -	bit--;
> >  	trace_recursion_clear(bit);
> >  }  
> 
> Otherwise, the change looks great. It simplifies that logic a lot.
> I think that I start understanding it ;-)

Awesome. I'll make some more updates.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
