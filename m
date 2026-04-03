Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2339E8536F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 14:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgL/rZp/W9M2GcISjNgWMnqPbYjPDpCw6HjcRFjNddA=; b=umWtqXRzOQhCu1
	T/28npW/0CxHYM9xi0Nk5kU0oo5rRGQhHXFqj3rVOycWn0nJCa4qeWlCVJ+9sgd8H72jzQqHlPL45
	jYpj3Eq3+e4sFb8kYXSB2w905WbfQlJbVQV/uBi8vqrytEXHqUNQ9aodkrpER/SxYxb6Lt2pwCOHk
	kHe0w4b8K3Kr1M+DE84+q9rW27KsOhewCoKAX021aGKhfVBbVkQbcM6jCoYMDFMpUSN4ffcvZVTFN
	dRNLBgJtD4b054sKWDSMIU4GfLpUJfdwWFyM0Z+U8JClVL1EnwIlF11FHm2U5APmxuwBrdMudzlmi
	gYFCqgR/eqnOJxhVqjkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fUL-000000028XP-2h9t;
	Fri, 03 Apr 2026 14:27:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fUI-000000028Wy-3BLn
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 14:27:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d03db7f87so1083200f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775226424; x=1775831224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gumfKaSUZxmd7oNWXvA1epP8lqBwmQJ4csbA3kmi3dY=;
        b=Ab4JnKkSRY+VKCILOj0VEpAx3W9SR8qFS50tUYl7RQl0SCD5WUCycea8fBqFj4d9z8
         uQq2AD6zJMbQ0U0saIXbNwxyBmB/FoG5EZoT34ezgoLHRM1dw/v732Zo1QBbXpU0Khxb
         cUx6VioljaYJPOzP5GK1+pRBb++1zb6BM18Co3dlX+xuL+z0ssR5TXU+EzBj+eIuIo5Z
         ZconWZwRzi8WnnYXd7naUKWW3kc5SOBgJxZSDVJYRm73CWRSWWjJg3lu5yDcPz5epqin
         T/dDishF+XPa9XouoE6Uhb2nN0gupBjdwHAH3dJmQ+16ZBJAR8/5aYx3qCybuxkQwuXJ
         YDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226424; x=1775831224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gumfKaSUZxmd7oNWXvA1epP8lqBwmQJ4csbA3kmi3dY=;
        b=PMfRD0uWhRn+orhxeAOUIUaP0j9S6b37W2HHYwdxCivaI0RIkNbXgwDmUMoIfXBRNG
         WfF9E7NK5Ib/rRKXj/0OMs6XqJQGYze7JWkMmBV/ixT1vWW4vV0nCDqHuGxj1gr46gTn
         BVk0JScEIdJfcFNX6YPh9s4xysdq81VEFlHu98EYaeA+gyt3B7aex66gPofzNdlECaJb
         eFmXRZNPUx36QAqmMSb2eiyJn3w4vFmavWLcm7yPnKU9B2N+rJNIAZD0ytm2jeG1J6YC
         z+0pEMQMragoO3MR9vxXkHarKort/8bRrf+k2tc0SnUUzEQ/0HE+RSm//zUx+UGoe3xA
         l0qg==
X-Forwarded-Encrypted: i=1; AJvYcCXr5GC5TQcynKTd3zsPiIzrKHPn5ET3AGyN6y9vrucP5PT4KT0EiKza2mz28QIXGXYFUvaaRBUswRHEvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZcHXkJHBfonTkkZv90RWfsJMw+He0TuBHi8hwRmMR60T3U+y9
	+GyRP9ol745ThwbI2wW0RmDVUGNk3desYDpSNq9Ce8icGpgbvy0A7IJqudecuHMF
X-Gm-Gg: AeBDiesr8rfetsdTQqSBVV2J4ziyb4/QfYg6NIUIgSx3foryUtDD59yaHWDl2TPKaK5
	IdKLKvAq1uiZqBI07hR+Bm7EJ+X25tTChYXxF+Xunt7nLOTV/r0Y6kEeCxv7qeU1umfTMDC0gLd
	mKe0d1VqaQF56NC+3vbc2EC5j7eaLntlyW4Vj8Lc7YqqjlmZw4Hqw4T1qZFucKaUsu7vRLmyLTV
	Z81c/ZR2bhexRxERUNDsXvV9R+AR8Dqcop0RLpo6Bb/omPySvEEQf+lJSkAF6etABA8kfAcgRdE
	0n8Sipf25tx7G2VoYOuMDHCHAo6MmKWrShakkk+jPbvrImW20zk/0vmXPfHjawASglld9/T7Tey
	KKf1zvzBtVgRgrGkXBMKMYZDCNvuzZNBw5c3AbtaI3LQSeVNFp44G1iKn2fxLoUOA0Av/S9byBz
	YiDxBMYCx1tjztfZZRjKBaBL5Dp+/OK5NA7Hc4/UEBbspIEYqfmzkQN+AjxA==
X-Received: by 2002:a5d:588c:0:b0:43d:1cec:4766 with SMTP id ffacd0b85a97d-43d292e3a26mr5254754f8f.23.1775226424063;
        Fri, 03 Apr 2026 07:27:04 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:a944:abe7:1177:5b7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f5bsm15381498f8f.7.2026.04.03.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:27:03 -0700 (PDT)
Date: Fri, 3 Apr 2026 16:27:01 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: panic from init_IRQ if IRQ handler stacks cannot
 be allocated
Message-ID: <ac_ONceITU96J_RK@osama>
References: <20260326232335.60353-1-osama.abdelkader@gmail.com>
 <dba67dea-baec-ab20-09b2-e007ee6bb88c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dba67dea-baec-ab20-09b2-e007ee6bb88c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_072706_821529_F3FC3F45 
X-CRM114-Status: GOOD (  31.50  )
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

Hi Paul,

On Thu, Apr 02, 2026 at 04:11:59PM -0600, Paul Walmsley wrote:
> Hi,
> 
> On Fri, 27 Mar 2026, Osama Abdelkader wrote:
> 
> > init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
> > or scs_alloc return NULL. Return -ENOMEM from both and call panic() once
> > from init_IRQ(), covering per-CPU IRQ stacks and shadow IRQ stacks
> > consistently.
> > 
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> 
> This patch appears to be written with AI assistance.  If so, it should be 
> noted in the description.  Please see
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-assistants.rst
> 

This is actually riscv version of arm64 patch:
[PATCH] arm64: panic if IRQ shadow call stack allocation fails
https://lore.kernel.org/lkml/20260324161545.5441-1-osama.abdelkader@gmail.com/
where I initially used panic, but in review, returning -ENOMEM was suggested,
and this patch also, so I submitted v2 there:
[PATCH v2] arm64: panic from init_IRQ if IRQ handler stacks cannot be allocated
https://lore.kernel.org/lkml/20260326225755.50297-1-osama.abdelkader@gmail.com/

> > ---
> >  arch/riscv/kernel/irq.c | 43 ++++++++++++++++++++++++++++++-----------
> >  1 file changed, 32 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> > index b6af20bc300f..43392276f7f8 100644
> > --- a/arch/riscv/kernel/irq.c
> > +++ b/arch/riscv/kernel/irq.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2018 Christoph Hellwig
> >   */
> >  
> > +#include <linux/errno.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/irqchip.h>
> >  #include <linux/irqdomain.h>
> > @@ -75,41 +76,53 @@ DECLARE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
> >  DEFINE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
> >  #endif
> >  
> > -static void init_irq_scs(void)
> > +static int __init init_irq_scs(void)
> >  {
> >  	int cpu;
> > +	void *s;
> >  
> >  	if (!scs_is_enabled())
> > -		return;
> > +		return 0;
> >  
> > -	for_each_possible_cpu(cpu)
> > -		per_cpu(irq_shadow_call_stack_ptr, cpu) =
> > -			scs_alloc(cpu_to_node(cpu));
> > +	for_each_possible_cpu(cpu) {
> > +		s = scs_alloc(cpu_to_node(cpu));
> > +		if (!s)
> > +			return -ENOMEM;
> 
> I don't see why this bothers to return an error value if the sole caller 
> is just going to panic.  Best to panic here.  Then no one reviewing this 
> patch needs to be concerned about memory leaks.
> 

Okay, I'm going to use panic in place instead.

> > +		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  DEFINE_PER_CPU(ulong *, irq_stack_ptr);
> >  
> >  #ifdef CONFIG_VMAP_STACK
> > -static void init_irq_stacks(void)
> > +static int __init init_irq_stacks(void)
> >  {
> >  	int cpu;
> >  	ulong *p;
> >  
> >  	for_each_possible_cpu(cpu) {
> >  		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
> > +		if (!p)
> > +			return -ENOMEM;
> 
> Same comment as the above.
> 
> >  		per_cpu(irq_stack_ptr, cpu) = p;
> >  	}
> > +
> > +	return 0;
> >  }
> >  #else
> >  /* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
> >  DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
> >  
> > -static void init_irq_stacks(void)
> > +static int __init init_irq_stacks(void)
> >  {
> >  	int cpu;
> >  
> >  	for_each_possible_cpu(cpu)
> >  		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
> > +
> > +	return 0;
> 
> Why?
> 
> >  }
> >  #endif /* CONFIG_VMAP_STACK */
> >  
> > @@ -129,8 +142,15 @@ void do_softirq_own_stack(void)
> >  #endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
> >  
> >  #else
> > -static void init_irq_scs(void) {}
> > -static void init_irq_stacks(void) {}
> > +static int __init init_irq_scs(void)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int __init init_irq_stacks(void)
> > +{
> > +	return 0;
> > +}
> >  #endif /* CONFIG_IRQ_STACKS */
> >  
> >  int arch_show_interrupts(struct seq_file *p, int prec)
> > @@ -141,8 +161,9 @@ int arch_show_interrupts(struct seq_file *p, int prec)
> >  
> >  void __init init_IRQ(void)
> >  {
> > -	init_irq_scs();
> > -	init_irq_stacks();
> > +	if (init_irq_stacks() || init_irq_scs())
> > +		panic("Failed to allocate IRQ stack resources\n");
> 
> Any reason why the initialization order is reversed?
> 
It's a mistake, will reverse it back.

Thanks,
Osama

> > +
> >  	irqchip_init();
> >  	if (!handle_arch_irq)
> >  		panic("No interrupt controller found.");
> > -- 
> > 2.43.0
> 
> 
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
