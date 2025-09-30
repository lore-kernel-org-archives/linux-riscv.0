Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DCECAC5B8
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 22:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHg6gUSLJbENGtv+/xqgBL6FfTZa9o4OlI+lHCxj7AQ=; b=g1m79ryPSSo3tR
	XQ5EVWZq/1anpcv4LJvtxFCNCjfzBnv71jbkQT4fY7OyWazITNTOBa52oX8HeQ49pbPdNTV12/1tn
	Lbl3yTsVym7nQlrjz8CsOp28xeyzmUf9DkkH6F4yWESWGGZYVq0fMQaNtlpunDzHc8Cbwb7FL/Roj
	NA+L+6ncw3EzUF+RCOGGJvz/6VDQIn/1LyDySY8z699mP0zJ2+kQAocXi1tQKPkg+P58YvMZ7uli5
	2aTljUFAToQrNLkUADrMis79pAor4ua3uuaWpOWH18yEoShEceoIwYt2rKbrrNhqD0YvysHmrlGwo
	3CVNkB5O98klIiR5X1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3iXz-00000006IO7-2YG0;
	Tue, 30 Sep 2025 22:10:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3iXx-00000006INf-2CMR
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 22:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D2DE45318;
	Tue, 30 Sep 2025 22:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6719BC4CEF7;
	Tue, 30 Sep 2025 22:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759270207;
	bh=hMd/AM3ewIb0jj5ghCyFKoP7KwuS14FKJyK/ph0ODyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPNh/vzOa3u/0div8i87Dy9LaaSnw20oVgnYVKRcud+Zud4VcP9sdUT86mvKLNaSX
	 4hAApTJERCXEwxyMUHksxymNDRP4jpQlEa1yLP9f1nLujyT+hadzblmndZVvy4p/rN
	 kOvmUxDy/rtBUz2UkbWzN91Jesm1MVMAi+AKlbwZDWllnPORuKW0YFM6lCesag4T+R
	 ktUTXq0voYdslGUv0vH5HEgr967cRvQ7H6pJ+xvbq+nzn+hE5n4JxEQ6kyutWDpaKH
	 yYySGG4kJxBv0Sgb1y64k4KJ/MGp+Ijc6HtSg8ejVMd3/U/YpesfI3fgqa4fwUEJCP
	 TEoo88EOFh0mw==
Date: Tue, 30 Sep 2025 15:10:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guodong Xu <guodong@riscstar.com>, Vinod Koul <vkoul@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Yixun Lan <dlan@gentoo.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, elder@riscstar.com,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix DMA mask handling
Message-ID: <20250930221001.GA66006@ax162>
References: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_151009_609248_AA118BA2 
X-CRM114-Status: GOOD (  31.90  )
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

On Thu, Sep 18, 2025 at 10:27:27PM +0800, Guodong Xu wrote:
> The driver's existing logic for setting the DMA mask for "marvell,pdma-1.0"
> was flawed. It incorrectly relied on pdev->dev->coherent_dma_mask instead
> of declaring the hardware's fixed addressing capability. A cleaner and
> more correct approach is to define the mask directly based on the hardware
> limitations.
> 
> The MMP/PXA PDMA controller is a 32-bit DMA engine. This is supported by
> datasheets and various dtsi files for PXA25x, PXA27x, PXA3xx, and MMP2,
> all of which are 32-bit systems.
> 
> This patch simplifies the driver's logic by replacing the 'u64 dma_mask'
> field with a simpler 'u32 dma_width' to store the addressing capability
> in bits. The complex if/else block in probe() is then replaced with a
> single, clear call to dma_set_mask_and_coherent(). This sets a fixed
> 32-bit DMA mask for "marvell,pdma-1.0" and a 64-bit mask for
> "spacemit,k1-pdma," matching each device's hardware capabilities.
> 
> Finally, this change also works around a specific build error encountered
> with clang-20 on x86_64 allyesconfig. The shift-count-overflow error is
> caused by a known clang compiler issue where the DMA_BIT_MASK(n) macro's
> ternary operator is not correctly evaluated in static initializers. By
> moving the macro's evaluation into the probe() function, the driver avoids
> this compiler bug.
> 
> Fixes: 5cfe585d8624 ("dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

It would be great if this could be picked up before the 6.18 DMA pull
request so that I do not have to patch our CI to avoid this issue.

>  drivers/dma/mmp_pdma.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index d07229a748868b8115892c63c54c16130d88e326..86661eb3cde1ff6d6d8f02b6f0d4142878b5a890 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -152,8 +152,8 @@ struct mmp_pdma_phy {
>   *
>   * Controller Configuration:
>   * @run_bits:   Control bits in DCSR register for channel start/stop
> - * @dma_mask:   DMA addressing capability of controller. 0 to use OF/platform
> - *              settings, or explicit mask like DMA_BIT_MASK(32/64)
> + * @dma_width:  DMA addressing width in bits (32 or 64). Determines the
> + *              DMA mask capability of the controller hardware.
>   */
>  struct mmp_pdma_ops {
>  	/* Hardware Register Operations */
> @@ -173,7 +173,7 @@ struct mmp_pdma_ops {
>  
>  	/* Controller Configuration */
>  	u32 run_bits;
> -	u64 dma_mask;
> +	u32 dma_width;
>  };
>  
>  struct mmp_pdma_device {
> @@ -1172,7 +1172,7 @@ static const struct mmp_pdma_ops marvell_pdma_v1_ops = {
>  	.get_desc_src_addr = get_desc_src_addr_32,
>  	.get_desc_dst_addr = get_desc_dst_addr_32,
>  	.run_bits = (DCSR_RUN),
> -	.dma_mask = 0,			/* let OF/platform set DMA mask */
> +	.dma_width = 32,
>  };
>  
>  static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
> @@ -1185,7 +1185,7 @@ static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
>  	.get_desc_src_addr = get_desc_src_addr_64,
>  	.get_desc_dst_addr = get_desc_dst_addr_64,
>  	.run_bits = (DCSR_RUN | DCSR_LPAEEN),
> -	.dma_mask = DMA_BIT_MASK(64),	/* force 64-bit DMA addr capability */
> +	.dma_width = 64,
>  };
>  
>  static const struct of_device_id mmp_pdma_dt_ids[] = {
> @@ -1314,13 +1314,9 @@ static int mmp_pdma_probe(struct platform_device *op)
>  	pdev->device.directions = BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM);
>  	pdev->device.residue_granularity = DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
>  
> -	/* Set DMA mask based on ops->dma_mask, or OF/platform */
> -	if (pdev->ops->dma_mask)
> -		dma_set_mask(pdev->dev, pdev->ops->dma_mask);
> -	else if (pdev->dev->coherent_dma_mask)
> -		dma_set_mask(pdev->dev, pdev->dev->coherent_dma_mask);
> -	else
> -		dma_set_mask(pdev->dev, DMA_BIT_MASK(64));
> +	/* Set DMA mask based on controller hardware capabilities */
> +	dma_set_mask_and_coherent(pdev->dev,
> +				  DMA_BIT_MASK(pdev->ops->dma_width));
>  
>  	ret = dma_async_device_register(&pdev->device);
>  	if (ret) {
> 
> ---
> base-commit: cc0bacac6de7763a038550cf43cb94634d8be9cd
> change-id: 20250904-mmp-pdma-simplify-dma-addressing-f6aef03e07c3
> 
> Best regards,
> -- 
> Guodong Xu <guodong@riscstar.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
