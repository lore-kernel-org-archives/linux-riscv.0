Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA94C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UH6WabCzzcgPSVhHD6z2zQBuvwC6LlGu6+I0XVk85Os=; b=cKsynZQj2VFtwD
	jVGkFl6UTOIEPdBX41Tg34cXwXq/2G3LVlZ9pZQjapFLkEYgCAaMHjUYDJVZ5IsKbZ44gUET9uuW6
	VPlJvvMxMgdJakM/ATjik1cnhebUgAfMtAKCzUpiSDF066Iu6prtRB3L+EtEhy3Izq07kdYzXtleZ
	21dpkhw+DyEO1tV9m9JIBbyvTVn+ipaXi/BAFkIED9ye9TMWUqpTWy5Nhk0FLezYm4ok97xR0sw+L
	QdU7/z3bxQdXNLS4wJowuXGfElwOqiYmoOeS9J/7HYFY2LMJMM+TuNY0BHe2YZSbulREEdAc0npvh
	fcjeITEAAWY13of//3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppRGB-007eKK-2H;
	Thu, 20 Apr 2023 10:11:27 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppRG6-007eIy-2u
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 10:11:25 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1ppRF8-000YMk-Qu; Thu, 20 Apr 2023 18:10:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 20 Apr 2023 18:10:23 +0800
Date: Thu, 20 Apr 2023 18:10:23 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <ZEEPjzLIlZW6HaAM@gondor.apana.org.au>
References: <20230411081424.131912-1-jiajie.ho@starfivetech.com>
 <20230411081424.131912-5-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230411081424.131912-5-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_031122_938981_AB5E30B0 
X-CRM114-Status: GOOD (  12.84  )
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

On Tue, Apr 11, 2023 at 04:14:24PM +0800, Jia Jie Ho wrote:
>
> +static int starfive_hash_export(struct ahash_request *req, void *out)
> +{
> +	struct starfive_cryp_request_ctx *rctx = ahash_request_ctx(req);
> +	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
> +	struct starfive_cryp_ctx *ctx = crypto_ahash_ctx(tfm);
> +
> +	ahash_request_set_tfm(&rctx->ahash_fbk_req, ctx->ahash_fbk);
> +	ahash_request_set_callback(&rctx->ahash_fbk_req,
> +				   req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
> +				   req->base.complete, req->base.data);
> +
> +	ahash_request_set_crypt(&rctx->ahash_fbk_req, req->src,
> +				req->result, req->nbytes);
> +
> +	return crypto_ahash_export(&rctx->ahash_fbk_req, out);
> +}

You can't export a freshly created request.  The fallback
request needs to have been created by the usual init/update
calls.

The export function should simply invoke export.

> +static int starfive_hash_cra_init_algs(struct crypto_tfm *tfm,
> +				       const char *algs_hmac_name,
> +				       unsigned int mode,
> +				       const char *alg_name)
> +{
> +	struct starfive_cryp_ctx *ctx = crypto_tfm_ctx(tfm);
> +	struct crypto_ahash *ahash = __crypto_ahash_cast(tfm);
> +
> +	ctx->cryp = starfive_cryp_find_dev(ctx);
> +
> +	if (!ctx->cryp)
> +		return -ENODEV;
> +
> +	ctx->ahash_fbk = crypto_alloc_ahash(alg_name, 0,
> +					    CRYPTO_ALG_NEED_FALLBACK);
> +
> +	if (IS_ERR(ctx->ahash_fbk))
> +		return dev_err_probe(ctx->cryp->dev, PTR_ERR(ctx->ahash_fbk),
> +				     "starfive_hash: Could not load fallback driver.\n");
> +
> +	crypto_hash_alg_common(ahash)->statesize = crypto_ahash_statesize(ctx->ahash_fbk);

I've just posted a patch to linux-crypto to do this properly:

https://lore.kernel.org/linux-crypto/ZEEOXIHwqKblKfBJ@gondor.apana.org.au/T/#u

Please switch to using the helper that I added.

> +static int starfive_hash256_setkey(struct crypto_ahash *tfm,
> +				   const u8 *key, unsigned int keylen)
> +{
> +	struct starfive_cryp_ctx *ctx = crypto_ahash_ctx(tfm);
> +	unsigned int digestsize = crypto_ahash_digestsize(tfm);
> +	unsigned int blocksize;
> +	int ret = 0;
> +
> +	blocksize = crypto_tfm_alg_blocksize(crypto_ahash_tfm(tfm));

Please use crypto_ahash_blocksize.  We should never use crypto_ahash_tfm
in new code.

> +static int starfive_hash_cra_sha224_init(struct crypto_tfm *tfm)
> +{
> +	return starfive_hash_cra_init_algs(tfm, NULL,
> +					   STARFIVE_HASH_SHA224,
> +					   "sha224-generic");
> +}

Please switch to the new API and use init_tfm/exit_tfm instead of
cra_init/cra_exit.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
