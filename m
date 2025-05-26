Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E293C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ENolN7oE2RjZDEEFnfAmD63hiadayZf4gOh3iDTuz4=; b=OBV6OEYyr/Yd2x
	3PUj52LyoyQBuk6E+m4lYYZ5ua+NGLXQhztU3RIqFVoDedreL1uj3e0DmTeKclYzQFVFBf7gxd+F/
	cdtXXUtIygmCGEdwB5avJ4hMXQsZgsG9gTkLuI0t3OvKxkIhdz3ECwF8ai2SSoCSOf5+vp+8UsP5s
	+kK5C3SM6fOuQRw6ORJItdtyTV1UZwiRtczudGbld7tqhVXT+lyLuSZlaKlCeW3t3sLuUBM1YG20v
	olEvcylDzMP+vKooJV/oWlhm3PUnwL73XeLkmbSfllPAWbxQBsPDn/1ntjtXoqa1YsAmaoGdYOPIo
	DKynkhfPU+Dcx0S0tHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUjA-00000008aWC-2Zjx;
	Mon, 26 May 2025 10:06:40 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUhJ-00000008a8Y-14t2
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 10:04:46 +0000
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DBB9D34306C;
	Mon, 26 May 2025 10:04:42 +0000 (UTC)
Date: Mon, 26 May 2025 10:04:33 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Huacai Chen <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 22/34] mmc: sdhci-of-k1: Drop the use of
 sdhci_pltfm_free()
Message-ID: <20250526100433-GYA52596@gentoo>
References: <cover.1747792905.git.zhoubinbin@loongson.cn>
 <a0906b1172c9452f700d97ff72484fda3023fbae.1747792905.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0906b1172c9452f700d97ff72484fda3023fbae.1747792905.git.zhoubinbin@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_030445_318801_68BA0C88 
X-CRM114-Status: GOOD (  15.35  )
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

hi Binbin,

On 14:06 Mon 26 May     , Binbin Zhou wrote:
> Since the devm_mmc_alloc_host() helper is already in
> use, sdhci_pltfm_free() is no longer needed.
> 
> Cc: Yixun Lan <dlan@gentoo.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index 6880d3e9ab62..40c1929f2de2 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -262,7 +262,7 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>  
>  	ret = mmc_of_parse(host->mmc);
>  	if (ret)
> -		goto err_pltfm;
> +		return ret;
>  
>  	sdhci_get_of_property(pdev);
>  
> @@ -276,18 +276,11 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>  
>  	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>  
> -	if (spacemit_sdhci_get_clocks(dev, pltfm_host))
> -		goto err_pltfm;
> -
> -	ret = sdhci_add_host(host);
> +	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
>  	if (ret)
> -		goto err_pltfm;
> -
> -	return 0;
> +		return ret;
>  
> -err_pltfm:
> -	sdhci_pltfm_free(pdev);
> -	return ret;
> +	return sdhci_add_host(host);
>  }
>  

although this patch looks good, but can you preserve the goto scheme?
we might add other error handlings as implement SD/SDIO in the future
(it also keeps the change minimal and easy to review)
 
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
