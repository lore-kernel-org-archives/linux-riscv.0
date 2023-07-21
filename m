Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82695EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tj+9tFC2K1BEecziXHogQBf+lWM3SSL6cknngvWH2RE=; b=3X9w6bcSFch5eJ
	vzziURRRCt7MotLOFKKaWup5K2amMkpZLNXcfKl7K4nGuG0f6O2BXTtY/ZLNxOo41C0JKxfIaIBX5
	zhUSKyTziZwKH+wsFXa0ggVhmlhWcHnS0L8Bfr2MZBDHsAneZ/Q+k+pq95GFwZX+rREMBEa5EmzjF
	f/T57v+4uhyroe6eOrXkVDqJ2G2je/sYulpZb6RLD8qgbwmxj9J1AijzCY5Q4hbzqJhSCDYrRD5b5
	rTGv6fq01ePEybRUwi0XXwNiRd3Q+ri1aLMi2f72Ar1a0Ow0eMzSpKyQ6MnCEerOqHPcbQXFcvEPG
	N0spmS0SaH1QtHfBqfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsYm-00EVhP-2J;
	Fri, 21 Jul 2023 16:00:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsYj-00EVfg-27
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 16:00:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7F1961C5B;
	Fri, 21 Jul 2023 16:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B74C433C7;
	Fri, 21 Jul 2023 16:00:44 +0000 (UTC)
Date: Fri, 21 Jul 2023 12:00:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, "Jiri Kosina" <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Nicholas Piggin"
 <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 <linux-csky@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <live-patching@vger.kernel.org>, =?UTF-8?B?546L6LSH?=
 <yun.wang@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20230721120040.6ed2c02a@gandalf.local.home>
In-Reply-To: <1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
References: <20211015110035.14813389@gandalf.local.home>
	<20211015161702.GF174703@worktop.programming.kicks-ass.net>
	<20211015133504.6c0a9fcc@gandalf.local.home>
	<20211015135806.72d1af23@gandalf.local.home>
	<20211015180429.GK174703@worktop.programming.kicks-ass.net>
	<20211015142033.72605b47@gandalf.local.home>
	<20211015142541.4badd8a9@gandalf.local.home>
	<1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_090049_795173_55F8B297 
X-CRM114-Status: GOOD (  31.21  )
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

On Fri, 21 Jul 2023 17:34:41 +0200
Alexander Lobakin <aleksander.lobakin@intel.com> wrote:

> From: Steven Rostedt <rostedt@goodmis.org>
> Date: Fri, 15 Oct 2021 14:25:41 -0400
> 
> Sorry for such a necroposting :z
> Just wanted to know if this is a bug, so that I could send a fix, or
> intended behaviour.
> 
> > On Fri, 15 Oct 2021 14:20:33 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >   
> >>> I think having one copy of that in a header is better than having 3
> >>> copies. But yes, something along them lines.    
> >>
> >> I was just about to ask you about this patch ;-)  
> > 
> > Except it doesn't build :-p (need to move the inlined function down a bit)
> > 
> > diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> > index 4d244e295e85..b32e3dabe28b 100644
> > --- a/include/linux/preempt.h
> > +++ b/include/linux/preempt.h
> > @@ -77,6 +77,27 @@
> >  /* preempt_count() and related functions, depends on PREEMPT_NEED_RESCHED */
> >  #include <asm/preempt.h>
> >  
> > +/**
> > + * interrupt_context_level - return interrupt context level
> > + *
> > + * Returns the current interrupt context level.
> > + *  0 - normal context
> > + *  1 - softirq context
> > + *  2 - hardirq context
> > + *  3 - NMI context
> > + */
> > +static __always_inline unsigned char interrupt_context_level(void)
> > +{
> > +	unsigned long pc = preempt_count();
> > +	unsigned char level = 0;
> > +
> > +	level += !!(pc & (NMI_MASK));
> > +	level += !!(pc & (NMI_MASK | HARDIRQ_MASK));
> > +	level += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));  
> 
> This doesn't take into account that we can switch the context manually
> via local_bh_disable() / local_irq_save() etc. During the testing of the

You cannot manually switch interrupt context.

> separate issue[0], I've found that the function returns 1 in both just
> softirq and softirq under local_irq_save().
> Is this intended? Shouldn't that be

That is intended behavior.

local_bh_disable() and local_irq_save() is not a context switch. It is just
preventing that context from happening. The interrupt_context_level() is to
tell us what context we are running in, not what context is disabled.

> 
> 	level += !!(pc & (NMI_MASK));
> 	level += !!(pc * (NMI_MASK | HARDIRQ_MASK)) || irqs_disabled();
> 	level += !!(pc * (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)) ||
> 		 in_atomic();
> 
> ?
> Otherwise, the result it returns is not really "context level".

local_bh_disable() use to (and perhaps still does in some configurations)
confuse things. But read the comment in kernel/softirq.c

/*
 * SOFTIRQ_OFFSET usage:
 *
 * On !RT kernels 'count' is the preempt counter, on RT kernels this applies
 * to a per CPU counter and to task::softirqs_disabled_cnt.
 *
 * - count is changed by SOFTIRQ_OFFSET on entering or leaving softirq
 *   processing.
 *
 * - count is changed by SOFTIRQ_DISABLE_OFFSET (= 2 * SOFTIRQ_OFFSET)
 *   on local_bh_disable or local_bh_enable.
 *
 * This lets us distinguish between whether we are currently processing
 * softirq and whether we just have bh disabled.
 */

Just because you disable interrupts does not mean you are in interrupt
context.

-- Steve


> 
> > +
> > +	return level;
> > +}
> > +  
> [0]
> https://lore.kernel.org/netdev/b3884ff9-d903-948d-797a-1830a39b1e71@intel.com
> 
> Thanks,
> Olek


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
