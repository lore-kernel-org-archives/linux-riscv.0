Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602C7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3L7dvD0p1Z4fFa+ju1GQbxC54RV4eYKtlnghgWsSDMo=; b=LnS6l09lzyBJBD
	AzwBIK5lGxf/p6Sw5cqM4JMUlHJ84IeqlKLeOLncex7rF/YnPi0x8sEAdTvaUzD0wHTdH4c17jGpO
	Vxm1aVPvqzCziJf4Je4kV03+trWEvx0gW+TkYW9WSoy7NYBtTzaNKQnYuyFJGTb2DRZQMiCoGzJQM
	MwXNjRkYh6L9sGuCwIodDQtiRvJHS6F1AISDbKKnOou47MRltCLrVQxma90kjpmk+xtDxVX2p4e2c
	EVLC+YBuyDWAfXdH8GeaKQY1mgw4nwAJBvyJYs2Q5ulKYccDyTKUjaVZVFOKX0PlHEfPRFi6q7/pv
	sQ0shMyg7clmQVHUAV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ONx-00H3oQ-1A; Wed, 30 Nov 2022 14:48:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ONu-00H3eH-UO
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:48:28 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669819699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysb9nF7W7aBl+zloPQlgaS76S2jwLQXf+/wIbHzkL2s=;
	b=XpIyPYchmWSgiG870br6Rr+E4xnpbB/61RTG50j7xs4sSOWyx8VUdXson8QV6vh2ZpWMuQ
	BZEMYc/p9N0Q0tSsTonvSPnaHIf2aWBB5+cAcEcuCI6+HVRiinLqDa3IrrDdndyOD+G3Hr
	Z6sM5rpFOEr9L1YcG11yjaSFORrZLqEwGLoHlqyRhr+IUveLr0N5sYvM5Y719pf4b3Ok7h
	/C0dDnmTcKDeYwgPwb1KR73iQ95pH4Cdv6XfjSaoTmG1OjrZHqbGh1+cDTjDVfb3R/3BDk
	A35C9XsX7NZiWCXdNnA1vviL+H365iJtI8VmtbpuPW5Tn7FCd41iyz6Mj6S2zQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669819699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysb9nF7W7aBl+zloPQlgaS76S2jwLQXf+/wIbHzkL2s=;
	b=VR3a3G9cPiYAbCKymrWGiegBry122LXuvcA9Z2nHl9QZdvcIn8YIEze+UtGvD+ADar1uDX
	BDCgBiqqjw00cmCA==
To: Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] genirq: Simplify cond_unmask_eoi_irq()
In-Reply-To: <20221126234134.32660-2-samuel@sholland.org>
References: <20221126234134.32660-1-samuel@sholland.org>
 <20221126234134.32660-2-samuel@sholland.org>
Date: Wed, 30 Nov 2022 15:48:18 +0100
Message-ID: <87edtkts5p.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_064827_143447_611500E9 
X-CRM114-Status: GOOD (  19.64  )
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

Samuel!

On Sat, Nov 26 2022 at 17:41, Samuel Holland wrote:

> This function calls .irq_eoi in three places, making the logic hard to
> follow. Rearrange the function so that .irq_eoi is called only once.
>
> The only time .irq_eoi is not called is when all three if checks fail,
> so return early in that case. threads_oneshot can only be nonzero if
> IRQS_ONESHOT is set, so the IRQS_ONESHOT check can be omitted there.
>
> The IRQS_ONESHOT condition from the first if statement must then be
> copied to the unmask_irq() condition.
>
> Furthermore, if IRQS_ONESHOT is set, mask_irq() must have been called
> in the parent function, so the irqd_irq_masked() check is redundant.

Not really convinced that all this is functionaly equivalent.

>  static void cond_unmask_eoi_irq(struct irq_desc *desc, struct irq_chip *chip)
>  {
> -	if (!(desc->istate & IRQS_ONESHOT)) {
> -		chip->irq_eoi(&desc->irq_data);
> +	/*
> +	 * Do not send an EOI if the thread will do it later in
> +	 * unmask_threaded_irq().
> +	 */
> +	if ((chip->flags & IRQCHIP_EOI_THREADED) && desc->threads_oneshot)
>  		return;
> -	}
> +
> +	chip->irq_eoi(&desc->irq_data);

This now issues EOI when the interrupt is in disabled state, which was
not done before. That's probably a non-issue, but clearly a undocumented
change.

> +
>  	/*
>  	 * We need to unmask in the following cases:
>  	 * - Oneshot irq which did not wake the thread (caused by a
> @@ -669,12 +674,8 @@ static void cond_unmask_eoi_irq(struct irq_desc *desc, struct irq_chip *chip)
>  	 *   completely).
>  	 */
>  	if (!irqd_irq_disabled(&desc->irq_data) &&
> -	    irqd_irq_masked(&desc->irq_data) && !desc->threads_oneshot) {
> -		chip->irq_eoi(&desc->irq_data);
> +	    (desc->istate & IRQS_ONESHOT) && !desc->threads_oneshot)
>  		unmask_irq(desc);

This breaks the mask logic of handle_fasteoi_mask_irq() for an interrupt
which does not have IRQS_ONESHOT set.

So no, it's not the same and it even breaks stuff.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
