Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5825AC71155
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 06:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hqqdgv1bAcTAiWt2p768KH0qKx2k8+q+i5A4/War8s=; b=XIu0LukxycO58D
	Ffv1vWwppEw1iz2Zre3XePTpICJDKP6HFhuBIQrVytTdqS3wIqwWXbvqMCwPvF1n+hhb4Xr8YcDRy
	yCOcFdpmG2hLejcCaRahEfZ1vbPL/FZw5/+nZaagmwOaFQLS8DR9glsClRqwKatZ7Qa24dScZCy0V
	abGeOnCbQ/S26f0LUNBTxbDCZtFOjSXnXNEb4mvPPUWY2iR9BvIEsz0Jfe9T24xYQ5pIP7l3pvrYj
	uJjEovMXbhoEGoUy1RVXbC9VFSruWl8stnY6YflEtukI0ZMxgh6tWl55ht6zjZzaOiYzGINCIs/06
	Pv9lLR93t8fL0x3/0bFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPNE-00000006JCg-2qNS;
	Tue, 17 Jun 2025 06:00:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPND-00000006JCY-34L4
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 06:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1EBD629EF;
	Tue, 17 Jun 2025 06:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C90C4CEE3;
	Tue, 17 Jun 2025 06:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750140042;
	bh=12KagmyykjPqQMTUr7/Xg6vcmrHrd0PDZscIpv7eR6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+n75FWsGqTzvmHUfHuMgS8O6lwy9yaKs48ViOPWs569cr3u+we5FiHAA0vYfyqk+
	 my6j6uttoFlsLTeK0k49Nj1iRK3xyV/SjceCjivB1g9kE3w3AQiaGhUjNEaRZNx6ME
	 wYsci9Ej9IZ7BSag4Bx0P8gxTFfX/Z6x+hKnVxO9ET+FzwfZGKeyDy/aYwZR8u+Obr
	 gWoUbDVHZDcivZLjzpmcY8l0/UH8QWcenREytrBpxe9f5bNsjHfHzH8FbC7EOZvL6g
	 GmxGfx+IxjKctiwGB2tKQovlgzAELQpypBfLvhOIBcySeYGe6aA+ypExS5hDA4f2GX
	 qQ0/CB6XuX+DA==
Date: Tue, 17 Jun 2025 11:30:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, emil.renner.berthing@canonical.com,
	inochiama@gmail.com, geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	elder@riscstar.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/8] dma: mmp_pdma: Add optional clock support
Message-ID: <aFEEhik8x2k5_myN@vaman>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-3-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611125723.181711-3-guodong@riscstar.com>
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

On 11-06-25, 20:57, Guodong Xu wrote:
> Add support for retrieving and enabling an optional clock using
> devm_clk_get_optional_enabled() during mmp_pdma_probe().

Its dmaengine, please tag them as such

> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  drivers/dma/mmp_pdma.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index a95d31103d30..4a6dbf558237 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>
>  #include <linux/platform_data/mmp_dma.h>
>  #include <linux/dmapool.h>
> +#include <linux/clk.h>
>  #include <linux/of_dma.h>
>  #include <linux/of.h>
>  
> @@ -1019,6 +1020,7 @@ static int mmp_pdma_probe(struct platform_device *op)
>  {
>  	struct mmp_pdma_device *pdev;
>  	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
> +	struct clk *clk;
>  	int i, ret, irq = 0;
>  	int dma_channels = 0, irq_num = 0;
>  	const enum dma_slave_buswidth widths =
> @@ -1037,6 +1039,10 @@ static int mmp_pdma_probe(struct platform_device *op)
>  	if (IS_ERR(pdev->base))
>  		return PTR_ERR(pdev->base);
>  
> +	clk = devm_clk_get_optional_enabled(pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
>  	if (pdev->dev->of_node) {
>  		/* Parse new and deprecated dma-channels properties */
>  		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",
> -- 
> 2.43.0

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
