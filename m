Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00072C83F26
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73q/BLz3eT48fbr6pUfRv5UY+16DusGXtmq1uqk9Aw8=; b=WUKLjg90HZ66kY
	mk2Asahz+yzTAcriKO3uyf2/SHtCikVHG8Qoouw2ffR92wJwfWI/oxhXZdJ7vbGAv+Z3WBKQamMpH
	8lMn/7qosYr6+SHfrVAM8Fz5J4pdDpyf6pg/kIqtkcqpBzb85rw9QlZ+rW6HMasNyRLZw2MCdDkP1
	IDKD82Xn0ToKGjbdS7W5dRC8DRPVCWlPW++E0WgTz2mFB/YLdWpyhqnQdE16ghoq7HosnjM6ef/h5
	l7PFzR/xTtFEgqaxpTx2x13bplhsFwtbUJzc4vFe1G0ahtVEkRaR6vKY0T1VZRgj3f7xp9JqvBGsh
	6w6aCX/rkcl8WQNYMCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOz-00000007cYW-4AUl;
	Thu, 24 Jul 2025 13:54:30 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uev6m-00000007Q0E-0VDy
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 12:31:37 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AAFFB341044;
	Thu, 24 Jul 2025 12:31:33 +0000 (UTC)
Date: Thu, 24 Jul 2025 20:31:28 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 2/8] dmaengine: mmp_pdma: Add optional clock support
Message-ID: <20250724123128-GYB748228@gentoo>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-2-8b0f5cd71595@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714-working_dma_0701_v2-v3-2-8b0f5cd71595@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_053136_191141_3FAD809B 
X-CRM114-Status: GOOD (  17.70  )
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

Hi Guodong,

I personally find the word 'optional' introducing some confusions..
I can understand from driver perspective, it's kind of optional,
but from SpacemiT K1 perspective, it's mandatory for this driver
(the 'clocks' property of DT is in 'required' section)

feel free to improve the commit message, maybe add some motivation
hehind this

On 17:39 Mon 14 Jul     , Guodong Xu wrote:
> Add support for retrieving and enabling an optional clock during
> mmp_pdma_probe().
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: No change.
> v2: No change.
> ---
>  drivers/dma/mmp_pdma.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index a95d31103d3063a1d11177a1a37b89ac2fd213e9..4a6dbf55823722d26cc69379d22aaa88fbe19313 100644
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
> 
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
