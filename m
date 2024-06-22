Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37C4C27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 01:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wpFa7bmG6rR9k6ZylWj/FmAhKPY5l3o3kweQztcZ7I=; b=euDAkohmGlfJHr
	7DHvxuR+IpZblwl0Ddj4B9poclIo/AybH7G/rZQJPqQOIkDT3SE7+vI4sXcN3XCe5RCyGtQMaJmZk
	PbOJN2LHPPrWTZH++VzYTiLClLHiwTWpWW/MxpOs7dw+Ayi2Uv+gDgiM0SKyyThUt+3pDhKlvVbdf
	wT+dM084RdZ2BFOGK1XxZs02mb6yrMg9tQ3emHaXOSHGOdMrbCV0IWwFhAPKwsbB8mpBeQQhrm/39
	mLCaJNzdMVC8+jhdPAyuTlFYoU7Fv4eMrenzG+7Q0xql1iVaketGKTB2NeQ1hd+BCJeoLk23wNOwc
	dsurzIcFmBXIMfb13VhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKpBD-0000000B5nc-43Pv;
	Sat, 22 Jun 2024 01:04:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKpBA-0000000B5mh-2RMO
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 01:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A2C68CE2C8A;
	Sat, 22 Jun 2024 01:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169A5C2BBFC;
	Sat, 22 Jun 2024 01:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719018270;
	bh=JWw48IU2jpmb4o2/RbQzk4Uqpd13GCQUiOW0AOFWF+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ne02Yyz4Z2nvz+f9l3zlP3eianjm65KKdJYkH97EmKAMwH+ULqhTC1i0fPZLc2DvF
	 moUrtKUdAB71jTwCszdMT6TGpdzxDmWv6+8QXqkvyqUUT8pjevgDpHzlqLcKBM3lE9
	 VWun6ZLcbSftlrcb6Wsc7FDEsFlBVDERrew8NgySyYowKQ1zxHbzCMNfQ/vXKneniC
	 UTHqExFGOD5LeUI7Y+Zlqb1nx9OxOgC/fFR8257qj6Z7ZmB4y5dT+6ia+oTXnsUd0e
	 6nM9GnE0OtTmxKK7Ru44I/TXL0HecKNTHJErFSUFvuUZwIvzVWaUkTv+cbfS+vUEjq
	 q/sVz20FEmjOg==
Date: Sat, 22 Jun 2024 08:50:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anton Blanchard <antonb@tenstorrent.com>,
	Cyril Bur <cyrilbur@tenstorrent.com>
Subject: Re: [PATCH 1/6] riscv: Improve exception and system call latency
Message-ID: <ZnYf1pGhmETeR8xT@xhacker>
References: <20240616170553.2832-1-jszhang@kernel.org>
 <20240616170553.2832-2-jszhang@kernel.org>
 <ZnYXoSDCeQK0Lcz8@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnYXoSDCeQK0Lcz8@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_180433_013849_14C4743F 
X-CRM114-Status: GOOD (  28.75  )
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

On Fri, Jun 21, 2024 at 05:15:29PM -0700, Charlie Jenkins wrote:
> On Mon, Jun 17, 2024 at 01:05:48AM +0800, Jisheng Zhang wrote:
> > From: Anton Blanchard <antonb@tenstorrent.com>
> > 
> > Many CPUs implement return address branch prediction as a stack. The
> > RISCV architecture refers to this as a return address stack (RAS). If
> > this gets corrupted then the CPU will mispredict at least one but
> > potentally many function returns.
> > 
> > There are two issues with the current RISCV exception code:
> > 
> > - We are using the alternate link stack (x5/t0) for the indirect branch
> >   which makes the hardware think this is a function return. This will
> >   corrupt the RAS.
> > 
> > - We modify the return address of handle_exception to point to
> >   ret_from_exception. This will also corrupt the RAS.
> > 
> > Testing the null system call latency before and after the patch:
> > 
> > Visionfive2 (StarFive JH7110 / U74)
> > baseline: 189.87 ns
> > patched:  176.76 ns
> > 
> > Lichee pi 4a (T-Head TH1520 / C910)
> > baseline: 666.58 ns
> > patched:  636.90 ns
> > 
> > Just over 7% on the U74 and just over 4% on the C910.
> > 
> > Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> > Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> 
> Do you need to sign this off since you're sending this Jisheng?

will do in newer version. Thanks for reminding.

I'm sending out this for reference since we touched the same
asm source code.
> 
> > ---
> >  arch/riscv/kernel/entry.S      | 17 ++++++++++-------
> >  arch/riscv/kernel/stacktrace.c |  4 ++--
> >  2 files changed, 12 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 68a24cf9481a..c933460ed3e9 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -88,7 +88,6 @@ SYM_CODE_START(handle_exception)
> >  	call riscv_v_context_nesting_start
> >  #endif
> >  	move a0, sp /* pt_regs */
> > -	la ra, ret_from_exception
> >  
> >  	/*
> >  	 * MSB of cause differentiates between
> > @@ -97,7 +96,8 @@ SYM_CODE_START(handle_exception)
> >  	bge s4, zero, 1f
> >  
> >  	/* Handle interrupts */
> > -	tail do_irq
> > +	call do_irq
> > +	j ret_from_exception
> >  1:
> >  	/* Handle other exceptions */
> >  	slli t0, s4, RISCV_LGPTR
> > @@ -105,11 +105,14 @@ SYM_CODE_START(handle_exception)
> >  	la t2, excp_vect_table_end
> >  	add t0, t1, t0
> >  	/* Check if exception code lies within bounds */
> > -	bgeu t0, t2, 1f
> > -	REG_L t0, 0(t0)
> > -	jr t0
> > -1:
> > -	tail do_trap_unknown
> > +	bgeu t0, t2, 3f
> > +	REG_L t1, 0(t0)
> > +2:	jalr t1
> > +	j ret_from_exception
> > +3:
> > +
> 
> The whitespace is odd here, but nonetheless:
> 
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> > +	la t1, do_trap_unknown
> > +	j 2b
> >  SYM_CODE_END(handle_exception)
> >  ASM_NOKPROBE(handle_exception)
> >  
> > diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> > index 528ec7cc9a62..5eb3d135b717 100644
> > --- a/arch/riscv/kernel/stacktrace.c
> > +++ b/arch/riscv/kernel/stacktrace.c
> > @@ -16,7 +16,7 @@
> >  
> >  #ifdef CONFIG_FRAME_POINTER
> >  
> > -extern asmlinkage void ret_from_exception(void);
> > +extern asmlinkage void handle_exception(void);
> >  
> >  static inline int fp_is_valid(unsigned long fp, unsigned long sp)
> >  {
> > @@ -70,7 +70,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
> >  			fp = frame->fp;
> >  			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
> >  						   &frame->ra);
> > -			if (pc == (unsigned long)ret_from_exception) {
> > +			if (pc == (unsigned long)handle_exception) {
> >  				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
> >  					break;
> >  
> > -- 
> > 2.43.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
