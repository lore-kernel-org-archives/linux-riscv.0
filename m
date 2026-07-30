Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCF2C54FCD
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 02:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tfy1ot/miY0yJ/xSkrybFhr6l0L/YPDyDvrY0/4bMgQ=; b=RBQ7RzX1F8/6mr
	4fzaPYt1LCn/u9Aq+0GReW54FINoviQCijKDXK8o1eD8nm/jpR6SgL27ArGQw/KY/1oOny85E1pm6
	8QQYzfw/xP7L8rid5rMksSOMd5TQMJPdQlU0XpsleJXo46sPmkqF5gNTzQ+rOJS7V7L3HhVLjoqQ5
	4c/BFjesY+B0vnW5vdqnlV99jla3e/IXt2+dfNyHwUs67TIoHolCDpoV/XkbWVmdN+P9h81ovlpUK
	GsQ+8XDHUeuEtzkNDStnddnvPHw2vzOUhyWVcnl75v8+pXB3rWoneMKDulSLF9AdP8pXrMiB845lR
	cNb9bzxK/T/8/F7wdT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGEv-00000009K81-3mwY;
	Thu, 30 Jul 2026 02:11:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGEu-00000009K7v-2hdB
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 02:11:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E576C600AA;
	Thu, 30 Jul 2026 02:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0B01F000E9;
	Thu, 30 Jul 2026 02:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377475;
	bh=aNuc4Ik3xOnyGP9BZ+ZsPjNIOV0G0RbYnsDe9E+gi9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C950DDBygp5ooMNkiSpyVSvI43pUyVmN2Pq2i7Y7AkkA/B5P1MckOnDYJTiqnaa47
	 aUf2erAc8hGT4xbIdaRPbg9o7rMsCzcAJ9xlm3e5kaWqimSQZZj7XAQci+flS5lKT9
	 WVlDAeXCzKNhK8b8OS786Lks6zTfLRBRqt9jkMMbZNSqKeNhX3CkjkdXdy5gxY8KK1
	 5IH6PhkdpeH7d7fhhfSacZqlygyVA91TLky/zu2cFRuF45WjC2neDHYTEDqPHFmzrz
	 3yP9FRU15M2cbDYIwZAoZmwv4TnfLq8yDJYyM96s+znEfN8RoWFkhJFrYogfTkJW2U
	 rr78cbDG9I8rQ==
Date: Wed, 29 Jul 2026 19:11:14 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <amqywoRHZO9xKD+V@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-8-7c22b05d461b@kernel.org>
 <20260730012125.2DA611F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260730012125.2DA611F000E9@smtp.kernel.org>
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

On Thu, Jul 30, 2026 at 01:21:24AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The probe function unconditionally fails if the `riscv,cbqri-rcid` device tree property is missing, which breaks support for monitoring-only capacity controllers.
> --
> 
> --- Patch [8]: [PATCH v6 8/8] riscv_cbqri: Add CBQRI capacity allocation platform driver ---
> commit 954af62b51bb07d376a8671fb6db032a2ae482bc
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: Add CBQRI capacity allocation platform driver
> 
> This commit adds a device-tree platform driver for the RISC-V CBQRI capacity
> controller. It binds to the "riscv,cbqri-capacity-controller" compatible,
> determines the cache domain, and registers the controller with the resctrl
> framework.
> 
> > diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
> > new file mode 100644
> > index 0000000000000..0670a676bdb1f
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_capacity.c
> [ ... ]
> > +static int cbqri_capacity_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -EINVAL;
> > +
> > +	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
> > +	if (ret) {
> > +		dev_err(dev, "missing riscv,cbqri-rcid\n");
> > +		return ret;
> > +	}
> 
> [Severity: Medium]
> Will this unconditionally failing check prevent monitoring-only controllers
> from probing?
> 
> The core registration logic in riscv_cbqri_register_cc_dt() indicates that
> monitoring-only controllers do not need an RCID count.
> 
> However, by returning an error when the riscv,cbqri-rcid property is absent,
> the driver appears to reject valid monitoring-only controllers before they
> can be registered.
> 
> Would it be better to treat this property as optional and default rcid_count
> to 0 if it is missing?

This series only implements allocation, so there is no monitoring-only
controller to describe yet.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
