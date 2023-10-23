Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620B8C25B45
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 18:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5j5j8e7VjrEVoy5B2O7Bd4waFY0Ldhg3U2kUOHq3xc=; b=0nNyn0dpFNDezK
	owtetqOGq4SkS7c56q57iXP6gn2IBxw8BIlV3yXObq5kYnO9RwtMKPPYaD0LfjtxfLaN7baFqyDjZ
	ul9YuuVk090+zpVU1fvkhA2NID/vaU73NxKK7Y9p0q/poz+2SrFbs+6/MxdiUdJ3W1bGUKHvRJ9EM
	GsZqVkBvbif1DG4MgKMngeQ6t0IoLm3yCld0jKybWEYFmZPYeUFWl7tWC8RJgMDrpo4pPZRBK4V93
	HgkDvphleG3XwkdrIJIALLc2IYHssbfWO+v6LSy2Bxqw6VVV2R3IAZLvYhRGFLaG3cXLqiBsS6Cns
	3CuqTMlmTK1E53Fq02XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv08d-0087vb-2L;
	Mon, 23 Oct 2023 18:58:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv08a-0087tk-2A;
	Mon, 23 Oct 2023 18:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7A0pd5ea/mWj9XmmTvRG6wtE18VpprIFdxTUBKRhNM0=; b=gtirJysCoPrK4qOy7mI9wMUvVz
	P33fMEnvCKyA74eRCvoEqjBQtXgT+ZfZaYwQdCj+oxzxDcBug/ZRYPHaMwfrVDsRg+SeYQ4ERiw3e
	maPZCTvvgkS2b147zcO7rUOaomZAQ0kPL5PTN6DNCaANEnB1lTAFW0ykLuziDuf+Dy8K+AE8O2k19
	PvdUnlkuD7/LMRkrQnfpX5g/p4kiD3Mj609pBiwd4YrNm3Zrc0ezR23xIBfNb1xScxybdK96le6aG
	0NeJcWgxNT5jq7CPNUlJH/PqpwF9p1KbFSX+6WabCSjxQo+VlGAEyfwtwC06L6xyK1qMiXK41UoIG
	5ILYltUQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45546)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qv08O-0003OY-1Z;
	Mon, 23 Oct 2023 19:58:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qv08N-00052v-CV; Mon, 23 Oct 2023 19:58:39 +0100
Date: Mon, 23 Oct 2023 19:58:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 29/35] irqchip/gic-v3: Don't return errors from
 gic_acpi_match_gicc()
Message-ID: <ZTbCX0n2SrhUBESf@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-30-james.morse@arm.com>
 <20230914160223.0000782f@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914160223.0000782f@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_115852_713906_DBEA99F4 
X-CRM114-Status: GOOD (  28.46  )
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

On Thu, Sep 14, 2023 at 04:02:23PM +0100, Jonathan Cameron wrote:
> On Wed, 13 Sep 2023 16:38:17 +0000
> James Morse <james.morse@arm.com> wrote:
> 
> > gic_acpi_match_gicc() is only called via gic_acpi_count_gicr_regions().
> > It should only count the number of enabled redistributors, but it
> > also tries to sanity check the GICC entry, currently returning an
> > error if the Enabled bit is set, but the gicr_base_address is zero.
> > 
> > Adding support for the online-capable bit to the sanity check
> > complicates it, for no benefit. The existing check implicitly
> > depends on gic_acpi_count_gicr_regions() previous failing to find
> > any GICR regions (as it is valid to have gicr_base_address of zero if
> > the redistributors are described via a GICR entry).
> > 
> > Instead of complicating the check, remove it. Failures that happen
> > at this point cause the irqchip not to register, meaning no irqs
> > can be requested. The kernel grinds to a panic() pretty quickly.
> > 
> > Without the check, MADT tables that exhibit this problem are still
> > caught by gic_populate_rdist(), which helpfully also prints what
> > went wrong:
> > | CPU4: mpidr 100 has no re-distributor!
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > ---
> >  drivers/irqchip/irq-gic-v3.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index 72d3cdebdad1..0f54811262eb 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -2415,21 +2415,15 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
> >  
> >  	/*
> >  	 * If GICC is enabled and has valid gicr base address, then it means
> > -	 * GICR base is presented via GICC
> > +	 * GICR base is presented via GICC. The redistributor is only known to
> > +	 * be accessible if the GICC is marked as enabled. If this bit is not
> > +	 * set, we'd need to add the redistributor at runtime, which isn't
> > +	 * supported.
> >  	 */
> > -	if (acpi_gicc_is_usable(gicc) && gicc->gicr_base_address) {
> > +	if (gicc->flags & ACPI_MADT_ENABLED && gicc->gicr_base_address)
> 
> Going in circles...

It does seem that way. Are you suggesting something should change here?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
