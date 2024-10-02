Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99FCCF6D2C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZz6u0qG1xF83W+/3Vy+j6H+1XPM/4Yh/4K9G/1AxPg=; b=DkyErhaEMaU50i
	4gnHWzD9E9y0SsHw0LvatiFCsJdYFODRKoz07VGldf+soPIOCOwRa0p+RJf2hODG67RMmzzo8hMWe
	JeWOoU4vKlrgGDVKO9mX6WqixxSf8RC5/Y5D81hnDp8Jr22mEjIberGCG4GF6DUWUDyFEdfqRxVkV
	dPhTGshSws2XBbuZXP+9pQDzFgU831aftrlXcsHeMzKnScXLyMn0la+HNEWVdlRozHdTcrsDrJ91u
	ULqXqqhG1H2PgsBHCISxiR0vsubrVzmp8ycL2Ddu0k198dgWiTbgew9b92X2N2q+2sbd9PDVHeiqE
	2ln/iEibMA84tLOFpRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw01F-00000006J2Y-37Pq;
	Wed, 02 Oct 2024 14:07:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svztw-00000006GlA-0a5V
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 14:00:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727877621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NRWdOmFvwEuoklANot4NPcQH4x73VoxrUIuRqMWDH3c=;
	b=DMPKIGAqsUTAW20USYZF3yfL7A3b9ZbzMIRj5R+loWuFbVexkhUIb2WkGexh8cppeFz5Vo
	7tPnOt3qsndBid6nKw+63o3CdSiocnNayBiC93xmG3rgYku9SvYIVb0AZ94PaAe74z1vLG
	C7Ms55qBeE96wKbqkRMsI3cGt5MSmGEOw8pBPeV2IEFJvGvZ6XQVQ3mg1ekkVniyCcret6
	YF7qOmU3XtKprpOt62mkXcTeJyiFf8HQXVB++GsA5y6bn1l0/hHcHfojOU26GSxDBZ5Ia+
	lqpRcJN1fXkCQ52lkpRAMi+5AxfcfH7dGFl2rbxUx2cuexywv5N4G0X5q3Qwtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727877621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NRWdOmFvwEuoklANot4NPcQH4x73VoxrUIuRqMWDH3c=;
	b=JaO7MgLB3H615K0Pzsbh8rfsVoTA2xO2TsWkNm5mtJt6tUU+Gh3VB1ssGHUnCODTSBjmkE
	ru/i/N4t+YrgcnAg==
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>, stable@vger.kernel.org
Subject: Re: [PATCH] irqchip/sifive-plic: Unmask interrupt in plic_irq_enable()
In-Reply-To: <20240926154315.1244200-1-namcao@linutronix.de>
References: <20240926154315.1244200-1-namcao@linutronix.de>
Date: Wed, 02 Oct 2024 16:00:21 +0200
Message-ID: <8734ley58q.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_070024_350362_6929D34F 
X-CRM114-Status: GOOD (  17.32  )
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

On Thu, Sep 26 2024 at 17:43, Nam Cao wrote:
> If another task disables the interrupt in the middle of the above steps,
> the interrupt will not get unmasked, and will remain masked when it is
> enabled in the future.
>
> The problem is occasionally observed when PREEMPT_RT is enabled, because
> PREEMPT_RT add the IRQS_ONESHOT flag. But PREEMPT_RT only makes the
> problem more likely to appear, the bug has been around since
> commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
> operations").

Correct. It's a general problem independent of RT.

> Fix it by unmasking interrupt in plic_irq_enable().
>
> Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations").
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: stable@vger.kernel.org
> ---
>  drivers/irqchip/irq-sifive-plic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 2f6ef5c495bd..0efbf14ec9fa 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -128,6 +128,9 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
>  
>  static void plic_irq_enable(struct irq_data *d)
>  {
> +	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
> +
> +	writel(1, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
>  	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);

Can you please move plic_irq_enable() below plic_irq_unmask() and invoke
the latter instead of duplicating the code?

Also usually unmask() is done after enable(), but the ordering probably
does not matter here.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
