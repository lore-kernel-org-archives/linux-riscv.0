Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51595C5AD49
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7+9WH4wHfeVCr6eR1Q6OCJoZTQs2M2zpIXq9Saa/TQ=; b=MYjD2Kfnq+royv
	98yYpeE47LlT+TTn/PdmiNxh8IKTQA4+I5Okj+TnFeMjhCjTMSpVW+PsL9UrxSn5MWqw3rvx0z35Z
	XQLfK1JwzVGv0Rc1s+avebPSz3odHaxOwL+SpbVoUFJciT/HC+6FyZJjyNMjrouGSErD77WJW9i1R
	KP4TFQfPwSzh+4QV210MBjD/hkd6Hrq6mtr4sCqI6CoHpgYGfUkLcFcNTFHPFRMiwEhsaU46VqoY0
	V0ydc24uzxIKI9lK/nGFHtj1Xzk8NXbHPOhvDX0l6hbHeH9XoiRJymDA50HQQFu935kIcLNNvRQ5F
	d63i1MGjM3iskpNRj0pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfHI-0000000G5Jz-3b2d;
	Thu, 29 May 2025 15:34:44 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKf6o-0000000G3oe-3vSx
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 15:23:56 +0000
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 06FA1343169;
	Thu, 29 May 2025 15:23:43 +0000 (UTC)
Date: Thu, 29 May 2025 15:23:38 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Huacai Chen <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 22/35] mmc: sdhci-of-k1: Drop the use of
 sdhci_pltfm_free()
Message-ID: <20250529152338-GYC64143@gentoo>
References: <cover.1748515612.git.zhoubinbin@loongson.cn>
 <84cc84004d0bdbb2ee1c68dbea4b23eeefe8845b.1748515612.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84cc84004d0bdbb2ee1c68dbea4b23eeefe8845b.1748515612.git.zhoubinbin@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_082355_001977_D9146CDE 
X-CRM114-Status: GOOD (  13.89  )
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

On 21:00 Thu 29 May     , Binbin Zhou wrote:
> Since the devm_mmc_alloc_host() helper is already in use,
> sdhci_pltfm_free() is no longer needed.
> 
> Cc: Yixun Lan <dlan@gentoo.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
>  drivers/mmc/host/sdhci-of-k1.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index 6880d3e9ab62..026dc79af292 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -286,7 +286,6 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_pltfm:
> -	sdhci_pltfm_free(pdev);
>  	return ret;
>  }
>  
> -- 
> 2.47.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
