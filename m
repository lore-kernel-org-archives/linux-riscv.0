Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0128C624D7
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 10:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/76h5IAw9bafUcLpFiR2p00EIaelhIOcTfz9ftp3Tg=; b=yudrVS/Z8AxNJK
	t6H7CNB3L9hpKf+FRoWXNkvJvX+N5hLoLMCCJcCyYxZqd56YpWfhQv/Y5xMAuv7MkoPDO3LJcA67o
	zkEFPNuFhqR2VUXJnZ67uqkdHqeeKyg8JiCaa+aiKWR+Dr3AG6GOHlCqAgyekI8idFuGMNWsqX10R
	lQ9RXJV7n8ZQVdJBsiUYkFxV3h7wGcfHdOrDc8YjIlPc5hGwVvX1GgflIYvTC3S9K0Fc0FbwJ73lm
	SL4eb7/QWH42blJj7C9CLeKz4FMmGa5504ZscnbgL7+J75gB79F/irXTJvyesxir0Ds0gEc1p4lcD
	/678DSMs+FfjmdLB+Trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24pP-0000000H6fF-2cqm;
	Thu, 03 Sep 2026 10:37:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24pO-0000000H6f9-0GTN
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 10:37:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FA64600D4;
	Thu,  3 Sep 2026 10:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856F91F000E9;
	Thu,  3 Sep 2026 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788431873;
	bh=LfEUm61UAnFxFCDwYCcGPaECxT78ZX20G6SRen0PmCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lapq4JcpXh2EdT5CtHGldRjhzK+EeM7FDQ17fM8aayLExDmULweYBoUFvnSTgV/CG
	 oyH1ZIinJ2W8x2FCDvfAMyqLw7OuDepb81Ei9a6k5Mxo9KIbts6HZuqaju7VriutUz
	 fu8Lhi0Nx0FDGrjzbCa8pppqq7h37FnceKSX7ULZI6dmHrTVHvDpDTiPrSNYfun2pG
	 8t484gzCyEJcmpqkGoS+WUBG0JVoQeGLZSZ/4aMsWOfB9prh4NPTXksFAB2hmtgJu6
	 OMhVJZwriZS/YNlnkkG77YFgSxQYH0foS7EM2igTWJ4nLr2OHIlWm24nn21yNDO1/8
	 X8VPHQAGUV6Cw==
Date: Thu, 3 Sep 2026 10:37:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mmc: sdhci-of-k1: Add TX tuning parameter
Message-ID: <20260903103751-GKA53903@kernel.org>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-4-4e7909cf4233@kernel.org>
 <DL5D12BKMIWN.QUCX18JF8GDU@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DL5D12BKMIWN.QUCX18JF8GDU@linux.spacemit.com>
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

Hi Troy,

On 11:27 Thu 03 Sep     , Troy Mitchell wrote:
> On Wed Sep 2, 2026 at 3:03 PM +08, Yixun Lan wrote:
> > From: Long Wan <long.wan@linux.spacemit.com>
> >
> > Instead of setting the TX delay code via hardcoded parameter, configuring
> > it via device tree property, which make it able to adapt according to
> > board specific tuning requirement.
> >
> > Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  drivers/mmc/host/sdhci-of-k1.c | 25 +++++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> > index e6ab40c9a555..6cab06332747 100644
> > --- a/drivers/mmc/host/sdhci-of-k1.c
> > +++ b/drivers/mmc/host/sdhci-of-k1.c
> > @@ -97,6 +97,7 @@ struct spacemit_sdhci_host {
> >  	struct pinctrl *pinctrl;
> >  	struct pinctrl_state *pinctrl_default;
> >  	struct pinctrl_state *pinctrl_uhs;
> > +	u8 tx_delaycode;
> >  };
> >  
> >  /* All helper functions will update clr/set while preserve rest bits */
> > @@ -263,6 +264,7 @@ static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
> >  	int max_pass_len = 0, max_pass_start = 0;
> >  	struct mmc_host *mmc = host->mmc;
> >  	struct mmc_ios ios = mmc->ios;
> > +	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(sdhci_priv(host));
> This is only a minor style suggestion, not a requirement. Would it be
> clearer to make `sdhst` the first local declaration? That would make the
> declaration block easier to scan.

somehow I hate to bring extra unnecessary changes..
but if we want to follow reverse christmas tree style and put struct declaration first,
then we should also move "int max_pass_len = 0, max_pass_start = 0;" down below

I can adjust this if maintainer/others don't mind..

> >  	u8 final_delay;
> >  	int ret = 0;
> >  	int i;
> > @@ -279,11 +281,11 @@ static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
> >  
> >  	if (mmc->caps2 & MMC_CAP2_NO_MMC) {
> >  		spacemit_sdhci_set_tx_dline_reg(host, SPACEMIT_TX_TUNING_DLINE_REG);
> > -		spacemit_sdhci_set_tx_delay(host, SPACEMIT_TX_TUNING_DELAYCODE);
> > +		spacemit_sdhci_set_tx_delay(host, sdhst->tx_delaycode);
> >  		spacemit_sdhci_tx_tuning_prepare(host);
> >  
> >  		dev_dbg(mmc_dev(host->mmc), "TX tuning: dline_reg=%d, delaycode=%d\n",
> > -			SPACEMIT_TX_TUNING_DLINE_REG, SPACEMIT_TX_TUNING_DELAYCODE);
> > +			SPACEMIT_TX_TUNING_DLINE_REG, sdhst->tx_delaycode);
> >  	}
> >  
> >  	spacemit_sdhci_prepare_tuning(host);
> > @@ -496,6 +498,23 @@ static inline void spacemit_sdhci_get_pins(struct device *dev,
> >  		sdhst->pinctrl_default, sdhst->pinctrl_uhs);
> >  }
> >  
> > +static void spacemit_sdhci_get_tuning_params(struct device *dev,
> > +					     struct sdhci_pltfm_host *pltfm_host)
> > +{
> > +	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
> > +	u32 val;
> > +
> > +	sdhst->tx_delaycode = SPACEMIT_TX_TUNING_DELAYCODE;
> > +
> > +	/* Override from DT property */
> > +	if (!device_property_read_u32(dev, "spacemit,tx-delay", &val)) {
> > +		if (val <= U8_MAX)
> > +			sdhst->tx_delaycode = val;
> > +		else
> > +			dev_warn(dev, "ignoring invalid tx delay: %u\n", val);
> Should this warning also report the default delay code that will be used
> instead?
> 
yes, can improve a bit

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
