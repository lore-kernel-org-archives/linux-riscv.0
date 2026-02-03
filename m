Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A33E8782A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zztKHqhR/HIjdGdg1iIxgtTnoo+PxhTK+NvXg8aCQEU=; b=tPYyFsXcEajXZ4
	4ruF+3IJO/7u22wV0MNoXJBbYzCDPk4w1p9bNo6s+Q1kxSckKSRB+lIMum3U/zakEmZgqk/I4doi3
	sfqiAOrICHWS1Mi13RBi/GlIJcapOP4TarGsi6Z5hsqJ+ixXwHarPnbHXphpvUMbtusT4xj0/b0qR
	IVVzgWEDHqwHWF06Lb8QAJcv+1bN8kwewwMNha0SGt6c15jfYHMbzNvuOIaCfh/neBNo2avmJrBn/
	nACgCz7U7g2UB7N0mH3HeULKxCVRGJec0SMdS99Sz7cc1o9NGeyr1TqgUAwBt+bXlERy0VVi41e6K
	vkOfAhM6yJw9ymmllfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGZT-00000006fkW-0GXU;
	Tue, 03 Feb 2026 13:35:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGZS-00000006fkL-0Sqr
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 13:35:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3590560144;
	Tue,  3 Feb 2026 13:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DA0C116D0;
	Tue,  3 Feb 2026 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770125756;
	bh=sj73QvFSqGtl9USxSkY6uhZcIsPh+95oS+fS5O3TyKw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VB5xQYCYxLknGgq4fjPfkEz6mXzTtJAxHwfOpfgXUIc/8Ijn5Q/GusWWVT2Vzvk0D
	 4KUjZ3xZcAsH7+IFhUTuJ8OhhaHlWqJg+ZlRByyT4DC3/Zd8C5NKGf3k4I6ywhHZJN
	 PXFJDyWFY9QwrjU/V+xT0DOv7EgR+nH+25/Emucmy2N+Gb/mcJl8nkArEvPUVa+CRE
	 nevGFA1xF1J77s+Uw2RRpuHCySw90jDxQg1xJikm+BBCBIAwCGbmaMT0TsrhRFa+5G
	 zmmzVQWYQkKMw/CBmzAH2VhismLlLa1sOOjP1hxNP16s3Am7yuDmpWhvOl/QA0XxFc
	 uYR2WsoyTAB7A==
From: Thomas Gleixner <tglx@kernel.org>
To: Yingjun Ni <yingjun.ni@riscv-computing.com>, anup@brainfault.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 yingjun.ni@riscv-computing.com
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix irq migration failure issue
 when cpu hotplug.
In-Reply-To: <20260203080256.9401-2-yingjun.ni@riscv-computing.com>
References: <20260203080256.9401-2-yingjun.ni@riscv-computing.com>
Date: Tue, 03 Feb 2026 14:35:53 +0100
Message-ID: <87ecn23q6e.ffs@tglx>
MIME-Version: 1.0
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

On Tue, Feb 03 2026 at 16:02, Yingjun Ni wrote:
> Add a null pointer check for irq_write_msi_msg to fix NULL pointer
> dereference issue when migrating irq.
>
> Modify the return value of imsic_irq_set_affinity to let the subdomain
> PCI-MSIX migrate the irq to a new cpu when cpu hotplug.
>
> Don't set vec->move_next in imsic_vector_move_update when the cpu is
> offline, because it will never be cleared.

You completely fail to explain the actual problem and the root
cause. See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

>  drivers/irqchip/irq-riscv-imsic-platform.c | 8 ++++++--
>  drivers/irqchip/irq-riscv-imsic-state.c    | 5 +++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
> index 643c8e459611..131e4f2b5431 100644
> --- a/drivers/irqchip/irq-riscv-imsic-platform.c
> +++ b/drivers/irqchip/irq-riscv-imsic-platform.c
> @@ -93,9 +93,13 @@ static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
>  static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
>  {
>  	struct msi_msg msg = { };
> +	struct irq_chip *irq_chip = irq_data_get_irq_chip(d);
> +
> +	if (!irq_chip->irq_write_msi_msg)
> +		return;

I have no idea how this ever worked. The irq_data pointer belongs to the
IMSIC base domain, which definitely does not have a irq_write_msi_msg()
callback and never can have one.

The write message callback is always implemented by the top most domain,
in this case the PCI/MSI[x] per device domain.

So this code is simply broken and your NULL pointer check just makes it
differently broken.

>  	imsic_irq_compose_vector_msg(vec, &msg);
> -	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
> +	irq_chip->irq_write_msi_msg(d, &msg);
>  }
>  
>  static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
> @@ -173,7 +177,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
>  	/* Move state of the old vector to the new vector */
>  	imsic_vector_move(old_vec, new_vec);
>  
> -	return IRQ_SET_MASK_OK_DONE;
> +	return IRQ_SET_MASK_OK;

Have you actually looked at the consequences of this change?

>  }
>  
>  static void imsic_irq_force_complete_move(struct irq_data *d)
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
> index b6cebfee9461..cd1bf9516878 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -362,6 +362,10 @@ static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
>  	/* Update enable and move details */
>  	enabled = READ_ONCE(vec->enable);
>  	WRITE_ONCE(vec->enable, new_enable);
> +
> +	if (!cpu_online(vec->cpu) && is_old_vec)
> +		goto out;

This is definitely not correct as this should still cleanup software
state, no?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
