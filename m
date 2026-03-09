Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C70EF36E0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 06:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1foU8PMDI8kTjznfHtlcbq9pW0PvErTHFrNr2sAWhFk=; b=qz12jk8d9cc61N
	2QxYf+OVuXhXB+A3ccxt7N8TQGaQLGET9t7sAAMT9EWqIcPHr2ogFYwk1tsSb/E5rCQJ5d/C9MWsM
	pF5tWkvgFH0pYSN72NSzh2e6R8ZTyeH0cEUcxYa68ayM6RG9QtFtk7aWA3ZUHAVPT3z7ZurJni5WZ
	uk6ELVBXfw0Ogq4t5hZG6loupgZcR4ikdAIvyq6NcrrcexFEBjmJuPj8mg9brJJHp5dZaKV3cy8ZD
	fe2MsPuPpBYznF1ji1LfXIYhTaZizukDY8D7sGv5c/jri68nzBLrOgnHobLxQ/Qegj1zIstKQ/pXf
	0Ji5K9AGP7BPeWoeMuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUCG-00000006jwh-0TKW;
	Mon, 09 Mar 2026 06:34:32 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUCD-00000006jvi-2Yhw
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 06:34:31 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC5C4335DB5;
	Mon, 09 Mar 2026 06:34:23 +0000 (UTC)
Date: Mon, 9 Mar 2026 14:34:16 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] mmc: sdhci-of-k1: add regulator framework support
Message-ID: <20260309063416-GYB318052@gentoo.org>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-3-89c219973c0c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-3-89c219973c0c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_233429_708004_E8D69AC2 
X-CRM114-Status: GOOD (  18.57  )
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

Hi IKer,

On 16:13 Mon 02 Mar     , Iker Pedrosa wrote:
> Add regulator framework support for voltage switching operations. This
> enables proper PMIC control for UHS voltage switching between 3.3V and
> 1.8V signaling levels.
> 
> - Add regulator supply parsing
> - Implement voltage switching callback
> - Enable mmc regulator framework integration
> 
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index b703b78282ed8d89183c816477c149c0a565618a..c260cb89704ae7a25bec0f07831d495553405bbd 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -216,6 +216,12 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
>  			       SPACEMIT_SDHC_PHY_CTRL_REG);
>  }
>  
> +static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
> +						      struct mmc_ios *ios)
> +{
> +	return sdhci_start_signal_voltage_switch(mmc, ios);
> +}
I'd suggest to implement voltage_switch() instead of start_signal_voltage_switch(),
and put the pinctrl state switch here, which will be called by
start_signal_voltage_switch(), see drivers/mmc/host/sdhci.c for more detail

sdhci_start_signal_voltage_switch() -> voltage_switch()

static const struct sdhci_ops spacemit_sdhci_ops = {
..
	.voltage_switch         = spacemit_sdhci_voltage_switch,
..

> +
>  static inline int spacemit_sdhci_get_clocks(struct device *dev,
>  					    struct sdhci_pltfm_host *pltfm_host)
>  {
> @@ -291,6 +297,12 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>  
>  	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>  
..
> +	ret = mmc_regulator_get_supply(host->mmc);
I think this is unnecessary which already handled in core framework, see
spacemit_sdhci_probbe() -> sdhci_add_host() -> sdhci_setup_host()

https://github.com/torvalds/linux/blob/v7.0-rc3/drivers/mmc/host/sdhci.c#L4289

> +	if (ret)
> +		dev_warn(dev, "Failed to get regulators: %d\n", ret);
> +
> +	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
> +
with above, this line can be dropped too

>  	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
>  	if (ret)
>  		goto err_pltfm;
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
