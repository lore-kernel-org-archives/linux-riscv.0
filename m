Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7B4C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 04:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QhU6Ou/trnTaFC8V/DkmqfsHBI04BB98iCgeADS0dQ=; b=KrSrLw8Uy4MCzV
	rltDizjocnnpYBvPPBs289/GRcMvUPUsXFgbQvzPuO3lG9CWkEGOSLruDXErMIX3Qf6DxUyjqypyR
	1FdQIOq+VW3Mw1rPpDIq8LwEXi1O/FwnxA/YHG+zupthJhX0DBvf7S4UsdRAhrV+Btrn7cSZKjM4y
	SbydkBQYIsP0JS3p/cVnqCgW4cSFKom69tnShAnbU+V+0MYuJgiCiAIaC+wbnDmbaePMZiNLNuR0v
	9VjLG3qdc+loWYOTsYV+da5LLXtBUMEpDrmLDz0ECX65RfNxGtYSxGwNF7NIdKyc/KjwlS6uWA+4M
	E2qrVMF8YHDdU5tX4alw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBS7N-00EeRT-0j;
	Fri, 08 Dec 2023 04:05:37 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBS7J-00EeR2-2B
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 04:05:35 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rBS6u-008Icd-VH; Fri, 08 Dec 2023 12:05:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 08 Dec 2023 12:05:18 +0800
Date: Fri, 8 Dec 2023 12:05:18 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	davem@davemloft.net, conor.dooley@microchip.com,
	ebiggers@kernel.org, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 05/13] crypto: simd - Update `walksize` in simd
 skcipher
Message-ID: <ZXKV/nLAQpUx6AX0@gondor.apana.org.au>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-6-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-6-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_200533_717966_0B73CA3D 
X-CRM114-Status: GOOD (  12.12  )
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

On Mon, Nov 27, 2023 at 03:06:55PM +0800, Jerry Shih wrote:
> The `walksize` assignment is missed in simd skcipher.
> 
> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
> ---
>  crypto/cryptd.c | 1 +
>  crypto/simd.c   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/crypto/cryptd.c b/crypto/cryptd.c
> index bbcc368b6a55..253d13504ccb 100644
> --- a/crypto/cryptd.c
> +++ b/crypto/cryptd.c
> @@ -405,6 +405,7 @@ static int cryptd_create_skcipher(struct crypto_template *tmpl,
>  		(alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
>  	inst->alg.ivsize = crypto_skcipher_alg_ivsize(alg);
>  	inst->alg.chunksize = crypto_skcipher_alg_chunksize(alg);
> +	inst->alg.walksize = crypto_skcipher_alg_walksize(alg);
>  	inst->alg.min_keysize = crypto_skcipher_alg_min_keysize(alg);
>  	inst->alg.max_keysize = crypto_skcipher_alg_max_keysize(alg);

Sorry but this patch doesn't apply any more now that we have
lskcipher.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
