Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E94C44503
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrSiE65VXp0YxpKk8htLKzVmg9k5/2cf8lGAO1+VOuw=; b=IAHKWiARKgTYc5
	quiiempHujV6FAT0wN5QbkX+fLEcM51injutyOYlKSO5wbD8jg9dz7yfTBPnjkXI5cKSuqQz1yib2
	+OREjY0aban6yWVGBP4C9xS1RtlzUoFy93gR5xbmI1ljNszuEwx9GJzPqcnzAQlUnXuNHb0Stn7QR
	M0LAHl/vLnassGk2YKP0YJWPyctXucVu0Am8TH8IKVXoX1az4g8ogFuudKKIwOKQ/k5jKeq4zFMQx
	jWRbAD5ZayeICZD867nAPKBe9Q8yotTEXOG7t38sZ97tOwXwTQZMJ38Nd6hMe78Kx1oX/UICxGqyu
	1A3ot91c3OxEKxQEWTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVhr-00000005IV6-03r8;
	Wed, 21 Jan 2026 10:44:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVhp-00000005IUj-1PHI
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 10:44:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEE3C4050D;
	Wed, 21 Jan 2026 10:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13358C16AAE;
	Wed, 21 Jan 2026 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768992296;
	bh=TOZuB+2yqLbtJOMDd2WB+YZbOWhoxkhnNzCazqbFRCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iiPtYKt9Si/btGlU9/TFr3qPVEcQOcRQPpIcJiSL5YCrbN5/ELnWMM177CE9wTxDM
	 le8mVg11Ne6WCa9i6ni2vxkgo6oXGFSR1mBIXFrXMacq61FoLSt9gfdvd3KzwS9XiO
	 V2ZH6D+utSEed4khFweEWJYllW9+IWH41loNFYzCCxjkRzymKi/6s1+Tg7A8yykqp/
	 BCOAa0g9IaJxvCeYwG01url82nsL/XFeHN8piti1CJcJE0z/h0PdT5gsvAetlf+VLy
	 yH7ptho0I/ZUPh+tDB/Joe6p4wmvgdhAQl4R7N4ebDtCGKDunxzeNUI+JYtL6qFi9m
	 becMyE3a+mhuw==
Date: Wed, 21 Jan 2026 18:44:53 +0800
From: Yixun Lan <dlan@kernel.org>
To: Yao Zi <me@ziyao.cc>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-k1: spacemit: Add support for K3 SoC
Message-ID: <20260121104453-GKD61591@kernel.org>
References: <20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org>
 <20260121-07-k3-mmc-v1-2-ff77c07bfdf6@kernel.org>
 <aXCg43ZepMm1DNHq@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXCg43ZepMm1DNHq@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_024457_418245_2DFE5A13 
X-CRM114-Status: GOOD (  24.52  )
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

On 09:48 Wed 21 Jan     , Yao Zi wrote:
> On Wed, Jan 21, 2026 at 03:27:36PM +0800, Yixun Lan wrote:
> > The SDHCI controller found on SpacemiT K3 SoC share the same IP with K1
> > generation and introduce a compatible data to denote the change that broken
> > 64BIT DMA issue has been fixed.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  drivers/mmc/host/sdhci-of-k1.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> > index a160e1d5d9bd..a56cb8a36982 100644
> > --- a/drivers/mmc/host/sdhci-of-k1.c
> > +++ b/drivers/mmc/host/sdhci-of-k1.c
> > @@ -259,8 +259,20 @@ static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
> >  		   SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> >  };
> >  
> > +static const struct sdhci_pltfm_data spacemit_sdhci_k3_pdata = {
> > +	.ops = &spacemit_sdhci_ops,
> > +	.quirks = SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK |
> > +		  SDHCI_QUIRK_NO_ENDATTR_IN_NOPDESC |
> > +		  SDHCI_QUIRK_32BIT_ADMA_SIZE |
> > +		  SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> > +		  SDHCI_QUIRK_BROKEN_CARD_DETECTION |
> > +		  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
> > +	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> > +};
> > +
> >  static const struct of_device_id spacemit_sdhci_of_match[] = {
> > -	{ .compatible = "spacemit,k1-sdhci" },
> > +	{ .compatible = "spacemit,k1-sdhci", .data = &spacemit_sdhci_k1_pdata },
> > +	{ .compatible = "spacemit,k3-sdhci", .data = &spacemit_sdhci_k3_pdata },
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, spacemit_sdhci_of_match);
> > @@ -271,10 +283,16 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
> >  	struct spacemit_sdhci_host *sdhst;
> >  	struct sdhci_pltfm_host *pltfm_host;
> >  	struct sdhci_host *host;
> > +	const struct sdhci_pltfm_data *data;
> >  	struct mmc_host_ops *mops;
> >  	int ret;
> >  
> > -	host = sdhci_pltfm_init(pdev, &spacemit_sdhci_k1_pdata, sizeof(*sdhst));
> > +
got one extra blank line here, will drop in next version

> > +	data = of_device_get_match_data(&pdev->dev);
> > +	if (!data)
> > +		return dev_err_probe(dev, -EINVAL, "failed to get platform data\n");
> 
> Is there a need to check against return value of
> of_device_get_match_data()? It isn't a user input, instead missing the
> data seems a kernel bug to me, and shouldn't happen in production.
> 
I agree, it should be safe to drop this check

> Regards,
> Yao Zi

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
