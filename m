Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E27C5B549
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8l1Pfj0jYZM7XJXUwa4AgnI2+nQ8p51pdixtSQHlxZ0=; b=pr77MMWEKg4z8g
	JYtAUyFucvY0mE3CEi904k8n2xyu2Nv60egTJ7uJETq0+Mnw4DyKL2QMMKo+LNULMMFCoaxfri8Dr
	kfSxMkTUbG1JHQnWlDYMmvi+0vyNuntAhrvV1Ld+ga6lwrEqq9vdfeWorNxl0AdhZQSzB/MJl2i/9
	S6ggVhZfR4kzbP9ScLGgkfj++tTsnwoXkrw5oO+wvb2Y1u9LFA9AWsIzXqIs6GFkKkDsG2DT0mvi/
	eehgQD9ub8/j4Hn6fg3X+4Mg2KN+dxC4BPNaPqh8ocNvAWedQMORSsaI/zEbCWFGB9Nx+YQ2wt5xV
	YE1TQbAImx8H2cmtRgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoQp-0000000A7KH-0XT0;
	Tue, 27 May 2025 07:09:03 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoGu-0000000A5yj-1bBP
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 06:58:50 +0000
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 54030343086;
	Tue, 27 May 2025 06:58:46 +0000 (UTC)
Date: Tue, 27 May 2025 06:58:41 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mmc: sdhci-of-k1: Fix error code in probe()
Message-ID: <20250527065841-GYB55693@gentoo>
References: <aDVTtQdXVtRhxOrb@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aDVTtQdXVtRhxOrb@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_235848_459974_09FAB61E 
X-CRM114-Status: GOOD (  15.47  )
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

Hi Dan,

On 08:55 Tue 27 May     , Dan Carpenter wrote:
> If spacemit_sdhci_get_clocks() fails, then propagate the error code.
> Don't return success.
> 
> Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index 6880d3e9ab62..2e5da7c5834c 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -276,7 +276,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>  
>  	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>  
> -	if (spacemit_sdhci_get_clocks(dev, pltfm_host))
> +	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
> +	if (ret)
>  		goto err_pltfm;
>  
>  	ret = sdhci_add_host(host);
> -- 
> 2.47.2
> 
Thanks for catching this..

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
