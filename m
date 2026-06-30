Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F23C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4jBemTSgo4eg418mq08kzu46g24bkxcincpFk98JoM=; b=qgUzHKkWlYX4EW
	Fr/C15s2PocosIFhfioxJBBppMjX3ZNjQe06bjHD0/E+wFD03ClH4/V5bzoXoPgqYmVjQtUmcDpSj
	CdACkMicr0TQUloWodx2yuMPQSTQRSzZnsO1Bx94PjY6A5mJ+Q7KYExD9wMN0qS84izVHiru6kFmg
	KLNkitgB0F4zi78VspcbZL+hGcvUhgeXeQj9WyJ2ODwAZecQBeMVg9hGf1S+A5x6UPHGQYCfoojV7
	IVPojpdlNoSkVthYFuQASdmxerVTaMgi875IxnNGEqOJlOMxNUfYpJsyWvsyOJE5aiWPJIYr69HPQ
	4S9sQUDtybCufTV5vFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weW4D-0000000GiV6-39V3;
	Tue, 30 Jun 2026 10:51:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weW4C-0000000GiUN-1o2q;
	Tue, 30 Jun 2026 10:51:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E178A43AFC;
	Tue, 30 Jun 2026 10:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AA31F00A3A;
	Tue, 30 Jun 2026 10:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782816707;
	bh=LSagnXkfjr27HV2tQfAz+rj7AUU5/hzRn7I5KK3CMLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B1u/Y2Pf6zMk7tnbTzi4v6nU2Lv2weLjO53pAUXXJHjaSnLhV3I5y/EU4ZQI2Ms8y
	 s7aCEHs5W1c7/Xqrm428GfYbtuEYXFNpcaZi6NuVn5iPNk8vFMEz4RCD2HVTiSHZic
	 +PbRGt49XhFnG50RlWiHtmRFq97MIDncdkWoc21g8UP9tcviNTjNyN0Cz2Y4R2GxEV
	 F5w5AA+32iv+09J11nDfNsQTIJ3TUdwGbllDMnKejLr9iYGbIcm9lgJEHJC1Lfqp5b
	 3x+g7YwFCe8wuwkIZIzl8vuFrD0OpK1/LuyJfMFn3QUaR/mmPuExwJ8jZIw3x7KL9a
	 2BoQHjkpr8SXQ==
Date: Tue, 30 Jun 2026 12:51:39 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
Message-ID: <akOfu2EIQq3CJgqw@lpieralisi>
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
 <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 08, 2026 at 07:18:15PM +0200, Rafael J. Wysocki wrote:

[...]

> > +#ifdef CONFIG_ACPI
> > +       if (has_acpi_companion(&pdev->dev))
> > +               acpi_dev_clear_dependencies(ACPI_COMPANION(&pdev->dev));
> > +#endif
> 
> I would rather add a wrapper for this, along with an empty stub for
> the !CONFIG_ACPI case.

#ifdef CONFIG_ACPI
static inline void acpi_device_clear_dep(struct device *dev)
{
	if (has_acpi_companion(dev))
		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));

}
#else
static inline void acpi_device_clear_dep(struct device *dev) {}
#endif

Something like that ?

Thanks,
Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
