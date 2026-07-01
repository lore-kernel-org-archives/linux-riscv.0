Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F84BC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 00:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q54vY/dh8tmdD4a6Z7dZWAvpxIDGrzLfdK7qxdHfmBs=; b=xDMh+IZ1+fAJqf
	0ZGv1rKlosvDQK8YQcNoWWpmi/BF3wo28graSBwBbzJhhcQOApEa9n/qS+tnbCWwm+Tu1KH+mCjOW
	+5A7Bzf2cRTFQeNQhaCXg8ZYGbE6mq0BEbM/RBLp5y48uAqGFZWGMvpVjxl3Se3vzZUx94Yxtrk8t
	HNM1Iqg/rjYfXw+weD0U76LcmL+7N9USHlVZyrwgLFqfsr4gPHwuNj5v6XO7L8mbubRrtnlhIfuYN
	+7w03kKKQNdcA9sY8e1CYyurO+ic6ZbvuxeZmXJ2rlQntyWSxma+eVx+vDhmmrHobw8WIKLmPFf9+
	aqTJHW+4SJGAk0+YRVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weilB-00000000PsL-1YYr;
	Wed, 01 Jul 2026 00:25:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weil9-00000000Pri-2vjT
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 00:24:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF19043FDF;
	Wed,  1 Jul 2026 00:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB94E1F000E9;
	Wed,  1 Jul 2026 00:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782865498;
	bh=dci6dX6+MP6gKFnB5cQVptU1hDsXvIN+MC/UNHCIfHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=foX0Ox/QwIvyIleWA2WFWcoNl7Zwe7QcewaoAY2tu2MSXtSQlxkdP9idrRq6oIPd2
	 FwXoxH+6DXIVebeRVKDms+XGKkBbFgACM3qE+PS3ZsEgb6wn2lNVZ5uZtfpFBR2Bya
	 LsEd1TQbW+fO1cs1LA/395KjC58z8odqcLEKOgHhzOywrhNu0ICHgDaR32Li7P0Ki5
	 rgmtyzSaFxp7LVM7rV7qZdEifyHU3R05ceoMZW272Ok/7P/SsDPttz0e9I6+zObO0Q
	 sUmnrLp2N1+dT6sMtQY5EFEa99wqb4MqTeO/FA33k7cEsCJtqid7XZU9lODDydXFfI
	 2uLKCzM3Rzqlg==
Date: Tue, 30 Jun 2026 17:24:57 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/8] riscv_cbqri: Add capacity controller probe and
 allocation device ops
Message-ID: <akReWcXqVmmIxPmM@thelio>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-4-c9c1342fe3cf@kernel.org>
 <20260628212810.05F6D1F00A3A@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260628212810.05F6D1F00A3A@smtp.kernel.org>
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

On Sun, Jun 28, 2026 at 09:28:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unspecified evaluation order in `cbqri_readq` causes a torn read during hardware polling, leading to false AT capability detection.
> --
> 
> commit a52377aec62b1aa81e5439ad733c3839af6693c6
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: Add capacity controller probe and allocation device ops
> 
> Add support for the RISC-V CBQRI capacity controller. A platform driver
> passes a cbqri_controller_info descriptor together with the cache level
> to riscv_cbqri_register_cc_dt(), which probes the controller and adds it
> to the controller list.
> 
> > diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
> > new file mode 100644
> > index 0000000000000..69df46e07df17
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_devices.c
> [ ... ]
> > +static u64 cbqri_readq(void __iomem *addr)
> > +{
> > +	return (u64)readl(addr) | ((u64)readl(addr + 4) << 32);
> > +}
> 
> [Severity: Medium]
> Could the unspecified evaluation order here cause a torn read during hardware
> polling?
> 
> Since the C standard does not specify the evaluation order of the operands
> to the bitwise OR operator, the compiler may emit the lower 32-bit read
> before the upper 32-bit read.
> 
> During the polling loop, if the final iteration reads the lower 32 bits
> while the busy flag is still set, and then the hardware completes the
> operation and clears the busy flag before the upper 32-bit read executes,
> the loop will terminate and return this torn value.

A tear is theoretically possible, but it is harmless here because the
two halves carry independent fields. BUSY and STATUS both live in the
high word, so a single readl(addr + 4) reads both at once. AT lives in
the low word, which the poll never inspects. The poll consumes only BUSY
and STATUS, so a tear cannot change when it ends or the STATUS it
returns.

> [ ... ]
> > +static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_offset,
> > +			       int operation, int *status, bool *access_type_supported)
> > +{
> [ ... ]
> > +		writel(lower_32_bits(reg), ctrl->base + reg_offset);
> > +		if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> > +			pr_err("BUSY timeout setting AT field\n");
> > +			return -EIO;
> > +		}
> > +
> > +		/*
> > +		 * If the AT field value has been reset to zero,
> > +		 * then the AT support is not present
> > +		 */
> > +		at = FIELD_GET(CBQRI_CONTROL_REGISTERS_AT_MASK, reg);
> > +		if (at == CBQRI_CONTROL_REGISTERS_AT_CODE)
> > +			*access_type_supported = true;
> 
> [Severity: Medium]
> Does the torn read from cbqri_readq() result in misdetecting capability
> support here?
> 
> If cbqri_wait_busy_flag() returns a torn value with a stale lower half, the
> driver may incorrectly detect Access Type support on hardware that does not
> support it.
> 
> This could break cache allocation isolation guarantees, as the driver will
> split capacity blocks into CODE and DATA masks, but the hardware will silently
> treat them as a single pool.

No. The AT read back is the result of the drivers's own AT=CODE write,
not a live hardware status. A tear cannot catch it mid-change. Per the
CBQRI spec, a controller without AT support makes AT read-only zero. The
write is dropped and AT reads 0, never transiently CODE. On hardware
that does support AT, the write takes effect and AT reads back CODE, so
that direction is correct too.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
