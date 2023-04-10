Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4CCC77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kry2I7bHwxlVFQwtjhwg0qy7A9k/nVJw/qq7l+DveJ8=; b=AgH5DHvLqgVPno
	N1A5lkRvxHbjMzlYmdu4oqMn8XCN+3PeVC/mvIvclUOjcp7xzdKVdcGZUdez1r0DMgQjORkFE7hrZ
	MzT/hltCC6SFZElhBoKdNWNRFHbpNcBIfz1EvhpYQvu8mtcrPKa4Y/b7Ds/kQ5jKgH2U/hsLuZjKM
	adM2SablijFJZfEV2s0h2aPHR5+KBqgffuy5/ETClSjYLH1vdOHUkSrbT8BnVvBnb2/UDEdQd7rxB
	To7yPcJ0ymor9PCp3LgJkCBrfKuYJoX7Ptgq25JcVGwTTnD3++bKqPjNUvkyc7fnX4d4GT8cfWEGe
	yPUF+H0GTaHP9cnQXYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plmJT-00EkvW-1H;
	Mon, 10 Apr 2023 07:51:43 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plmJP-00EktZ-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 07:51:42 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1plmIR-00EEnN-4P; Mon, 10 Apr 2023 15:50:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 10 Apr 2023 15:50:39 +0800
Date: Mon, 10 Apr 2023 15:50:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <ZDO/z++4/TE6AiIz@gondor.apana.org.au>
References: <20230410073752.39506-1-jiajie.ho@starfivetech.com>
 <20230410073752.39506-5-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230410073752.39506-5-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_005139_835341_977EBD98 
X-CRM114-Status: GOOD (  11.38  )
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

On Mon, Apr 10, 2023 at 03:37:52PM +0800, Jia Jie Ho wrote:
>
> +static void starfive_hash_start(void *param)
> +{
> +	struct starfive_cryp_ctx *ctx = param;
> +	struct starfive_cryp_request_ctx *rctx = ctx->rctx;
> +	struct starfive_cryp_dev *cryp = ctx->cryp;
> +	union starfive_alg_cr alg_cr;
> +	union starfive_hash_csr csr;
> +
> +	dma_unmap_sg(cryp->dev, rctx->in_sg, rctx->in_sg_len, DMA_TO_DEVICE);
> +
> +	alg_cr.v = 0;
> +	alg_cr.clear = 1;
> +
> +	writel(alg_cr.v, cryp->base + STARFIVE_ALG_CR_OFFSET);
> +
> +	csr.v = readl(cryp->base + STARFIVE_HASH_SHACSR);
> +	csr.firstb = 0;
> +	csr.final = 1;
> +
> +	reinit_completion(&cryp->hash_done);
> +	writel(~STARFIVE_IE_MASK_HASH_DONE, cryp->base + STARFIVE_IE_MASK_OFFSET);
> +	writel(csr.v, cryp->base + STARFIVE_HASH_SHACSR);
> +}

Why are you still using a completion? The callback function should
invoke the crypto_engine finalize_request call directly.

> +static int starfive_hash_xmit(struct starfive_cryp_ctx *ctx)
> +{
> +	struct starfive_cryp_request_ctx *rctx = ctx->rctx;
> +	struct starfive_cryp_dev *cryp = ctx->cryp;
> +	int ret;
> +
> +	rctx->csr.hash.v = 0;
> +	rctx->csr.hash.reset = 1;
> +	writel(rctx->csr.hash.v, cryp->base + STARFIVE_HASH_SHACSR);
> +
> +	if (starfive_hash_wait_busy(ctx))
> +		return dev_err_probe(cryp->dev, -ETIMEDOUT, "Error resetting engine.\n");
> +
> +	rctx->csr.hash.v = 0;
> +	rctx->csr.hash.mode = ctx->hash_mode & STARFIVE_HASH_MODE_MASK;
> +	rctx->csr.hash.ie = 1;
> +
> +	if (ctx->hash_mode & STARFIVE_HASH_HMAC_FLAGS) {
> +		ret = starfive_hash_hmac_key(ctx);
> +		if (ret)
> +			return ret;
> +	} else {
> +		rctx->csr.hash.start = 1;
> +		rctx->csr.hash.firstb = 1;
> +		writel(rctx->csr.hash.v, cryp->base + STARFIVE_HASH_SHACSR);
> +	}
> +
> +	ret = starfive_hash_xmit_dma(ctx);
> +	if (ret)
> +		return ret;
> +
> +	if (!wait_for_completion_timeout(&cryp->hash_done, msecs_to_jiffies(10000)))
> +		return dev_err_probe(cryp->dev, -ETIMEDOUT, "Timeout waiting for hash done\n");

There is no point in waiting for completion.  Just return 0 and
you're done.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
