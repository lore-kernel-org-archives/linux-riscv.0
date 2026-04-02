Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DF0D6AB16
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDNC5l5NLpHZbzJCa8Ta8QkcfdEoaTSPFsNTmRiOig0=; b=ySYirb7aQzifA9
	FiK/xEMi8odrcPlAOTk5Ec2qYNXN3plqr8MGuEyx4sIJz4gzdwyPF5X+u231/cVqf0qHIXpS/tOt3
	42jru5vqBTWc+ztdFkFIqWfVxBwld4ymqFwJ0HksHaR9vZ6zfCwH82fiXyBgvhcCbWNm6czYyj5+H
	ZjdaNJ+9crxs8kWkJEEJl116x6iHY4c3mvcDh5BfH2zX9Z99F/UVOAvj/8guAXGQLQCl2lUFxAE3G
	6Nbp5xMO33PJGhbWmddlahNUq5Dcnkeuj9FAD0SqC6mfhilH7Qqr7Ko5XGsSsLsFYNJD2rXWNuoyX
	pH++YrUFLHfLdlRDhFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8QGl-00000000rhj-1A7n;
	Thu, 02 Apr 2026 22:12:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8QGi-00000000rh3-1VXb
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 22:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97FDA435A7;
	Thu,  2 Apr 2026 22:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4437C116C6;
	Thu,  2 Apr 2026 22:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775167923;
	bh=yPWQ8Lu8w3RP+W5pBE5AC0381sEeBDUcYqrijLfEx9Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gLLQPnXxPgvtSs+507MGuXdxGhEg8qkQBnZTqDmO/coGkdkDgIXxSHrhRnxNk0n90
	 gJ4Fj9S3DuebBtyvUy28qcIEeLCKGg4TE19hFoNBMLWlOwm66Jd6c0QksoBuDBZBcE
	 dWdFb4T7noGOSMX/3FSh4NDTMbwyD+De5/3D8KBuhu/C90CMEVc3uAfVgaklr+WxMA
	 SZgQuB2MhHbnq5C6ar53sEsFQqQ1eTraSeOf6IMka3hiA7tYK1NGHPZ1Zx22HhQs1S
	 XapBQOP0uZgKtZhYT4GzEkRPM9VNSGVXk+Gge340bh2pUREsV+uvMqLyDlvTWLCYUH
	 jmOVFk1Nw8HnQ==
Date: Thu, 2 Apr 2026 16:11:59 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Thomas Gleixner <tglx@kernel.org>, 
    Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: panic from init_IRQ if IRQ handler stacks cannot
 be allocated
In-Reply-To: <20260326232335.60353-1-osama.abdelkader@gmail.com>
Message-ID: <dba67dea-baec-ab20-09b2-e007ee6bb88c@kernel.org>
References: <20260326232335.60353-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_151204_440878_AE353DB0 
X-CRM114-Status: GOOD (  21.89  )
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

Hi,

On Fri, 27 Mar 2026, Osama Abdelkader wrote:

> init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
> or scs_alloc return NULL. Return -ENOMEM from both and call panic() once
> from init_IRQ(), covering per-CPU IRQ stacks and shadow IRQ stacks
> consistently.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

This patch appears to be written with AI assistance.  If so, it should be 
noted in the description.  Please see

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-assistants.rst

> ---
>  arch/riscv/kernel/irq.c | 43 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index b6af20bc300f..43392276f7f8 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2018 Christoph Hellwig
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqdomain.h>
> @@ -75,41 +76,53 @@ DECLARE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
>  DEFINE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
>  #endif
>  
> -static void init_irq_scs(void)
> +static int __init init_irq_scs(void)
>  {
>  	int cpu;
> +	void *s;
>  
>  	if (!scs_is_enabled())
> -		return;
> +		return 0;
>  
> -	for_each_possible_cpu(cpu)
> -		per_cpu(irq_shadow_call_stack_ptr, cpu) =
> -			scs_alloc(cpu_to_node(cpu));
> +	for_each_possible_cpu(cpu) {
> +		s = scs_alloc(cpu_to_node(cpu));
> +		if (!s)
> +			return -ENOMEM;

I don't see why this bothers to return an error value if the sole caller 
is just going to panic.  Best to panic here.  Then no one reviewing this 
patch needs to be concerned about memory leaks.

> +		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
> +	}
> +
> +	return 0;
>  }
>  
>  DEFINE_PER_CPU(ulong *, irq_stack_ptr);
>  
>  #ifdef CONFIG_VMAP_STACK
> -static void init_irq_stacks(void)
> +static int __init init_irq_stacks(void)
>  {
>  	int cpu;
>  	ulong *p;
>  
>  	for_each_possible_cpu(cpu) {
>  		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
> +		if (!p)
> +			return -ENOMEM;

Same comment as the above.

>  		per_cpu(irq_stack_ptr, cpu) = p;
>  	}
> +
> +	return 0;
>  }
>  #else
>  /* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
>  DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
>  
> -static void init_irq_stacks(void)
> +static int __init init_irq_stacks(void)
>  {
>  	int cpu;
>  
>  	for_each_possible_cpu(cpu)
>  		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
> +
> +	return 0;

Why?

>  }
>  #endif /* CONFIG_VMAP_STACK */
>  
> @@ -129,8 +142,15 @@ void do_softirq_own_stack(void)
>  #endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
>  
>  #else
> -static void init_irq_scs(void) {}
> -static void init_irq_stacks(void) {}
> +static int __init init_irq_scs(void)
> +{
> +	return 0;
> +}
> +
> +static int __init init_irq_stacks(void)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_IRQ_STACKS */
>  
>  int arch_show_interrupts(struct seq_file *p, int prec)
> @@ -141,8 +161,9 @@ int arch_show_interrupts(struct seq_file *p, int prec)
>  
>  void __init init_IRQ(void)
>  {
> -	init_irq_scs();
> -	init_irq_stacks();
> +	if (init_irq_stacks() || init_irq_scs())
> +		panic("Failed to allocate IRQ stack resources\n");

Any reason why the initialization order is reversed?

> +
>  	irqchip_init();
>  	if (!handle_arch_irq)
>  		panic("No interrupt controller found.");
> -- 
> 2.43.0


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
