Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB436C6FD19
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 00:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJQ7kVhbPp1s5GywQnvgdSv8wAuWuuAgtCixF5/2WBw=; b=hycVRRykQlEmqa
	sA6kAx8eRBv4qaDA/QF5srtVgSFGSfF78mAScAUq7QdnzurAEA8/hhBzyA/mfaUf88OojFampHf9B
	wpBLndYbWVJBRNnBFJqh8CA0xcwBs0ciYGd4ncwzoUeXv1vBFXWMODF8Lm8xgOpo0BILbUwZNDCVF
	XWIKCyAPV8/3N82LEukU5Cuhjvoc7F7JSQ1fXZoX0dZ70yNZ4HqqQiw/vChsjTVKrEQWNdRonfb5O
	f0f7mk8C8YTo65jkkcbUO8OgDPfvWugz1FL66bRjBUeBV+b4MInekR/ESLHCRbDZWrAi+wvULeFyX
	d6m6rtC1hvTtOpIcjGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbsMr-008PBJ-3k; Tue, 14 Mar 2023 00:18:17 +0000
Received: from mail3-165.sinamail.sina.com.cn ([202.108.3.165])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbsMm-008PA2-PD
	for linux-riscv@lists.infradead.org; Tue, 14 Mar 2023 00:18:15 +0000
Received: from unknown (HELO localhost.localdomain)([114.249.61.130])
	by sina.com (172.16.97.32) with ESMTP
	id 640FBD140002BC27; Tue, 14 Mar 2023 08:17:25 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 614649628911
From: Hillf Danton <hdanton@sina.com>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/4] crypto: starfive - Add hash and HMAC support
Date: Tue, 14 Mar 2023 08:17:44 +0800
Message-Id: <20230314001744.1911-1-hdanton@sina.com>
In-Reply-To: <20230313135646.2077707-5-jiajie.ho@starfivetech.com>
References: <20230313135646.2077707-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_171813_037844_2DD0796F 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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

On 13 Mar 2023 21:56:46 +0800 Jia Jie Ho <jiajie.ho@starfivetech.com>
> +static int starfive_hash_xmit_dma(struct starfive_cryp_ctx *ctx)
> +{
> +	struct starfive_cryp_request_ctx *rctx = ctx->rctx;
> +	struct starfive_cryp_dev *cryp = ctx->cryp;
> +	struct dma_async_tx_descriptor	*in_desc;
> +	dma_cookie_t cookie;
> +	union  starfive_alg_cr alg_cr;
> +	int total_len;
> +	int ret;
> +
> +	if (!rctx->total)
> +		return 0;
> +
> +	writel(rctx->total, cryp->base + STARFIVE_DMA_IN_LEN_OFFSET);
> +
> +	total_len = rctx->total;
> +	total_len = (total_len & 0x3) ? (((total_len >> 2) + 1) << 2) : total_len;
> +	sg_dma_len(rctx->in_sg) = total_len;
> +
> +	alg_cr.v = 0;
> +	alg_cr.start = 1;
> +	alg_cr.hash_dma_en = 1;
> +
> +	writel(alg_cr.v, cryp->base + STARFIVE_ALG_CR_OFFSET);
> +
> +	ret = dma_map_sg(cryp->dev, rctx->in_sg, rctx->in_sg_len, DMA_TO_DEVICE);
> +	if (!ret)
> +		return dev_err_probe(cryp->dev, -EINVAL, "dma_map_sg() error\n");
> +
> +	cryp->cfg_in.direction = DMA_MEM_TO_DEV;
> +	cryp->cfg_in.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	cryp->cfg_in.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	cryp->cfg_in.src_maxburst = cryp->dma_maxburst;
> +	cryp->cfg_in.dst_maxburst = cryp->dma_maxburst;
> +	cryp->cfg_in.dst_addr = cryp->phys_base + STARFIVE_ALG_FIFO_OFFSET;
> +
> +	dmaengine_slave_config(cryp->tx, &cryp->cfg_in);
> +
> +	in_desc = dmaengine_prep_slave_sg(cryp->tx, rctx->in_sg,
> +					  rctx->in_sg_len, DMA_MEM_TO_DEV,
> +					  DMA_PREP_INTERRUPT  |  DMA_CTRL_ACK);
> +
> +	if (!in_desc)
> +		return -EINVAL;
> +
> +	reinit_completion(&cryp->tx_comp);

What breaks without reinit?
> +
> +	in_desc->callback = starfive_hash_dma_callback;
> +	in_desc->callback_param = cryp;
> +
> +	cookie = dmaengine_submit(in_desc);
> +	dma_async_issue_pending(cryp->tx);
> +
> +	if (!wait_for_completion_timeout(&cryp->tx_comp,
> +					 msecs_to_jiffies(10000))) {
> +		dev_err(cryp->dev, "wait_for_completion_timeout error, cookie = %x\n",
> +			dma_async_is_tx_complete(cryp->rx, cookie,
> +						 NULL, NULL));

What prevents wakeup from coming in case of timeout?
> +	}
> +
> +	dma_unmap_sg(cryp->dev, rctx->in_sg, rctx->in_sg_len, DMA_TO_DEVICE);
> +
> +	alg_cr.v = 0;
> +	alg_cr.clear = 1;
> +
> +	writel(alg_cr.v, cryp->base + STARFIVE_ALG_CR_OFFSET);
> +
> +	return 0;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
