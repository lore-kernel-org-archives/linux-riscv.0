Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEFCF459E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCvM3aVCAh1KlVuddgfpUEV/H5H11MGjWWQBbBlKzts=; b=v1OI7CEtjcTqkM
	uKlwj+YjBWuQ3BRvL7rXbF9srJjlcAVnqHdVlyOQvourfvkrHULMLKsaM0dff0B8X0zUva6/b1xBc
	BGlH2XI5w4MCZ0pv6f1NNMRjc7SVwu9Ox5rKRp+qbflWVMLFBht9QYAQ2FiklyhYpFLxErX47dVFz
	0CtymNZNjU5J7cS/pgwi+A2knRNMFrk4nZlI8OCYfT6N+6idBcqUDfXfc/d1jmE0ncU4qDzmD2XwD
	dfy2NMEnRWVjtKuRMVSlBjVzSNSRsWJ/AVNvHWr+xJRGqUK3KI/oWKT1GCboGRT15oU8ZpYm0+NRM
	z/cDJ3ou9N4WL2uTNiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBD8R-0000000COoz-13Uq;
	Fri, 10 Apr 2026 14:47:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBD8Q-0000000COot-1DBT
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 14:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E99061119;
	Fri, 10 Apr 2026 14:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6C5C19421;
	Fri, 10 Apr 2026 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775832420;
	bh=u9jgWs+rQxNieWW6+zUO70EFEtbKwbZt/loIcja2QcY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BBYAeNDvucb606PPcxDI+grEz4lbbjrm+8jaYmxqOJ/oWx6G4yAAtURopWBjqHigV
	 2sGDhZYHH1bE78PWI9wQBGuEhkDTsRUzkHazZSjLYHtLxfZDQQPSfBSaNrp0WTlprd
	 RO56yLP9VJewxh20mD8pi3w5q519GyNE4r//hBof5lbYCuLI4k9mK6kv2RrIMQYRgQ
	 AKYNVm/RHKy9jquwhv4I0GzC1Zw15kJqnelEpVOsBl7BZYLu8sMQSRLb8MhRRMNQ8w
	 osuE5jeNUeQ+KResDSakPGg+r1sjluY8o5mwwXMeuA6iIWIAWcyxAQL8RPsz3cFc6y
	 8btOm+R9AtDMA==
From: Thomas Gleixner <tglx@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 5/5] irqchip: starfive: Implement irq_set_type and
 irq_ack hooks
In-Reply-To: <20260410090106.622781-6-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-6-changhuang.liang@starfivetech.com>
Date: Fri, 10 Apr 2026 16:46:57 +0200
Message-ID: <874ili27q6.ffs@tglx>
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

On Fri, Apr 10 2026 at 02:01, Changhuang Liang wrote:

s/hooks/callbacks and please use function notation irq_set_type() and ....

> +static void starfive_intc_mod(struct starfive_irq_chip *irqc, u32 reg,
> +			      u32 mask, u32 data)

No line break required. You have 100 characters.

> +static int starfive_intc_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
> +	u32 i, bitpos, ty_pos, ty_shift, tmp;
> +
> +	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
> +	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
> +	ty_pos = bitpos / STARFIVE_INTC_TYPE_NUM;
> +	ty_shift = (bitpos % STARFIVE_INTC_TYPE_NUM) * 2;
> +
> +	switch (type) {
> +	case IRQF_TRIGGER_LOW:
> +		tmp = STARFIVE_INTC_TRIGGER_LOW << ty_shift;

tmp is not really an intuitive variable name.

> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	case IRQF_TRIGGER_HIGH:
> +		tmp = STARFIVE_INTC_TRIGGER_HIGH << ty_shift;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	case IRQF_TRIGGER_FALLING:
> +		tmp = STARFIVE_INTC_TRIGGER_NEGEDGE << ty_shift;
> +		irq_set_handler_locked(d, handle_edge_irq);
> +		break;
> +	case IRQF_TRIGGER_RISING:
> +		tmp = STARFIVE_INTC_TRIGGER_POSEDGE << ty_shift;
> +		irq_set_handler_locked(d, handle_edge_irq);

This can be simplified so it avoids to have a function in every case
statement:

        switch (type) {
        case IRQF_TRIGGER_LOW:
        	trigger = STARFIVE_INTC_TRIGGER_LOW;
                handler = handle_level_irq;
                break;
        case ...
        }
        
        irq_set_handler_locked(d, handler);
        typeval = trigger << ty_shift;

You get the idea.

> +	raw_spin_lock(&irqc->lock);

  guard(...)

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
