Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28278C44501
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cC540x31H0K+mjjq75Mze0+sAJp1IxJSaP2jaZlFOM=; b=dP11CVMQLNryWm
	YFIHH0eYF+f6kUptcYNo2AzmxSMcPD+kgLGG3ixnOPEjxErxax7V0nrJrjdbyP5HoijfmjV70J7Vg
	ZxxZpFr8h9AFZPIIR+EQzqamCGVHP6OCtbYPNcZpr3YCX+sIl46Eo6GtL97O21NYrImVxQPeYoKH4
	SbVavKBoNc/g2YMgjoaa4p1lSG0L8q+uk8h9LoCaqFz915Q4CZPHQqLwdk9Md649T2ptqubNLilEi
	YQqUl/ifrJcu75Hli3JzTKrOf7ou6rP6uHFpHYGmrEQrETGVkvKSyv5aRD38yYTadJ+1DQC0XzCEf
	37/ENdCuTl0B/n+ZggRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUpJ-00000005D4m-2qtV;
	Wed, 21 Jan 2026 09:48:37 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUpH-00000005D3q-1QED
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 09:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768988912; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bD2gp45kFPvNMwF3ySU1AMZfN1sFmTE7Xt+QTbOj6iJge6qIgzPo67l/PxzlZoGXrOZBal0KQTKc27WYISBjNmA61s5rt3idyOt6AsguIkHfW8KeX81+E3HB/l+FFaxJ7eUFpYL/2GYJAZBJFI6pPbIQ8wv/XuBBUp+rILn/uFQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768988912; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ufXXGD5mAV0c390kumAehnWTdRsR7RIJF5HIUbbINyE=; 
	b=QksGkK7pE7yHtBoDPFiKXPc0abDGyjlDOHtrGGi80yCI+wy9NKPXeTJo691VUGeZCUYVKenczQNPeUNgaMC+q3vgLj/iAoHYPIq4j3tC1zq8i/qb7ExD3/HpYiJCQaflzF4sznXEcCvR/P15wGZdr32WrIqJnncCTLxk7VaZ5Ro=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768988912;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ufXXGD5mAV0c390kumAehnWTdRsR7RIJF5HIUbbINyE=;
	b=EnhSRichXNJut4xGlUb1vfKj2oR2wVBdjsmeaFWIJa7v/9FxEFOwDVUeRRGSDySK
	PZckRIoKS6hkqpxlxnrxTSfxjYV17/g3CgAY2J4UXJJEDhRTBlQ/+47nfj7oRREioTD
	kWtdAAYvNVdMafUv/3/jLxYo1GfLR1Otx5/4CtTM=
Received: by mx.zohomail.com with SMTPS id 1768988910308507.3525632519347;
	Wed, 21 Jan 2026 01:48:30 -0800 (PST)
Date: Wed, 21 Jan 2026 09:48:19 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-k1: spacemit: Add support for K3 SoC
Message-ID: <aXCg43ZepMm1DNHq@pie>
References: <20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org>
 <20260121-07-k3-mmc-v1-2-ff77c07bfdf6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121-07-k3-mmc-v1-2-ff77c07bfdf6@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_014835_624383_6A2139A3 
X-CRM114-Status: GOOD (  21.05  )
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

On Wed, Jan 21, 2026 at 03:27:36PM +0800, Yixun Lan wrote:
> The SDHCI controller found on SpacemiT K3 SoC share the same IP with K1
> generation and introduce a compatible data to denote the change that broken
> 64BIT DMA issue has been fixed.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index a160e1d5d9bd..a56cb8a36982 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -259,8 +259,20 @@ static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
>  		   SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
>  };
>  
> +static const struct sdhci_pltfm_data spacemit_sdhci_k3_pdata = {
> +	.ops = &spacemit_sdhci_ops,
> +	.quirks = SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK |
> +		  SDHCI_QUIRK_NO_ENDATTR_IN_NOPDESC |
> +		  SDHCI_QUIRK_32BIT_ADMA_SIZE |
> +		  SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> +		  SDHCI_QUIRK_BROKEN_CARD_DETECTION |
> +		  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
> +	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +};
> +
>  static const struct of_device_id spacemit_sdhci_of_match[] = {
> -	{ .compatible = "spacemit,k1-sdhci" },
> +	{ .compatible = "spacemit,k1-sdhci", .data = &spacemit_sdhci_k1_pdata },
> +	{ .compatible = "spacemit,k3-sdhci", .data = &spacemit_sdhci_k3_pdata },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, spacemit_sdhci_of_match);
> @@ -271,10 +283,16 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>  	struct spacemit_sdhci_host *sdhst;
>  	struct sdhci_pltfm_host *pltfm_host;
>  	struct sdhci_host *host;
> +	const struct sdhci_pltfm_data *data;
>  	struct mmc_host_ops *mops;
>  	int ret;
>  
> -	host = sdhci_pltfm_init(pdev, &spacemit_sdhci_k1_pdata, sizeof(*sdhst));
> +
> +	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return dev_err_probe(dev, -EINVAL, "failed to get platform data\n");

Is there a need to check against return value of
of_device_get_match_data()? It isn't a user input, instead missing the
data seems a kernel bug to me, and shouldn't happen in production.

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
