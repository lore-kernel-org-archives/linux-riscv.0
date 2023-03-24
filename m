Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F09EC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 09:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZFwYkHcsN8afcXtRGYJFy7wpxasjuKsoV1od1YmmDY=; b=2/nb/PcVwna/P0
	OqIfIsAE56yLIa/p6v5nMldeyXBSK6nmLRtMpYoenl7kLiD5Se2MyxWEYMwOKzbi4zCD52lxdeMFG
	IBD5ZvqByKtkWU28PwNvOCIsO7rnbc6xj1fS35ElrK7tRKdLIaNWyuB4PnQ2hYFRjmxAjMzi6XWFd
	JD/lLdaQ6HouMUuMBNLDiM+u0TjfNze2bafsH8OUVkGogNKQDjS0iHXS3liNqYm1eStKcWVcd076Y
	eziFswhBQFVfInDpgM8PuhTJr01QpYjjn636l45VDp92vVHMJ//bC6cTvJwbPr+aIfv/tH8SUKfBE
	xDQ5+lUArlTYSb2sP2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfe6k-0045hc-29;
	Fri, 24 Mar 2023 09:53:14 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfe6i-0045gp-1i
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 09:53:13 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pfe62-008F1p-PV; Fri, 24 Mar 2023 17:52:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 24 Mar 2023 17:52:30 +0800
Date: Fri, 24 Mar 2023 17:52:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <ZB1y3l/IrtHrboiC@gondor.apana.org.au>
References: <20230313135646.2077707-1-jiajie.ho@starfivetech.com>
 <20230313135646.2077707-5-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313135646.2077707-5-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_025312_572726_517F28F3 
X-CRM114-Status: UNSURE (   7.22  )
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

On Mon, Mar 13, 2023 at 09:56:46PM +0800, Jia Jie Ho wrote:
>
> +static int starfive_hash_update(struct ahash_request *req)
> +{
> +	struct starfive_cryp_request_ctx *rctx = ahash_request_ctx(req);
> +	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
> +	struct starfive_cryp_ctx *ctx = crypto_ahash_ctx(tfm);
> +
> +	ahash_request_set_tfm(&rctx->ahash_fbk_req, ctx->ahash_fbk);
> +	rctx->ahash_fbk_req.base.flags = req->base.flags
> +		& CRYPTO_TFM_REQ_MAY_SLEEP;
> +	rctx->ahash_fbk_req.nbytes = req->nbytes;
> +	rctx->ahash_fbk_req.src = req->src;

Please don't modify the fields directly, use the ahash_request_set_*
helpers.  Since you allocated an async fallback, you should set the
callbacks too.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
