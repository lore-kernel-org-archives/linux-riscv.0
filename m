Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3FBC369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEz+yDdwKTC542tIKrH1jZYkfJkQiwS2+Y+rh4NGDAc=; b=nLkJjqkrH/g+zq
	GvQxrsEWZXTMoRy8duutB9nzkIgxBsjGrn9JH4MbpgrIM1ESlWDrZu2hvTSRk/E+KeMsyfCdukmX3
	SYWnp1jnE0fi013dINtou8XV3M5JamIenLFUdw3kEu/rnc7c8LoOU1Go8N1KBLU3vb+VHzmAxIIvx
	VfVewAb6lOHFSetgoSnyAKteYOo7CU0lCXefiufOKzO+iniGWqjj73O2bnNnAHGwle1FduuBmV3m6
	UArQE3ZR2XGDc0slIUJRMG2q4sns+9xbCFEf9x9TruqhtBa/usHzI3mRdG3/PU62J3+7gYnKxmYg2
	gSyqO1f5qgJtViSWvEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JZI-0000000C4L3-3U71;
	Thu, 17 Apr 2025 07:21:52 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JZG-0000000C4K6-1Llf
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 07:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9kw9FMXD/wPGWa+Txh7gPuISKMppmLAsTHqS5svg0z0=; b=m2xZjzmnbaV1GAQlzHYGXRlrUL
	fdZofOEhaKFYsBYK18yKTMJ7q+s63Jm2OLSXzwAFwFxMuHCkBBa5GlFl7OI3Ru2Ybj9o19CxLrS2B
	7m5EQ2MbXd1ZtKBI6l7w1VdX6MY/RKnZxu/CgnA0/XkP9xO5ov8kTIZEdIHJKhYVECy+bPd0UmE7h
	/fSgTR/5nJdbdiWzrn48HfJ+1nqj9YyUOq1PAWQsC+mmRzZicngojjAaIu24RtFza+IZ73cNQyVcQ
	elbTrGBfe2aY0GdLyTHSrVBiniwvb4U/axuz/sEKkAREUY4ffQ3BRIGbhwwUu2/xbNPdkS47Jd7pH
	t5TeE0DA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5JZ3-00GPE6-0G;
	Thu, 17 Apr 2025 15:21:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 17 Apr 2025 15:21:37 +0800
Date: Thu, 17 Apr 2025 15:21:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Qingfang Deng <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
Message-ID: <aACsAT0sOzkqFblQ@gondor.apana.org.au>
References: <20250417064940.68469-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417064940.68469-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_002150_358042_A0505959 
X-CRM114-Status: GOOD (  10.20  )
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

On Thu, Apr 17, 2025 at 02:49:38PM +0800, Qingfang Deng wrote:
>
> +static int riscv64_clmul_ghash_update(struct shash_desc *desc, const u8 *src, unsigned int srclen)
> +{
> +	struct riscv64_clmul_ghash_ctx *ctx = crypto_shash_ctx(desc->tfm);
> +	struct riscv64_clmul_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
> +	unsigned int len;
> +
> +	if (dctx->bytes) {
> +		if (dctx->bytes + srclen < GHASH_DIGEST_SIZE) {
> +			memcpy(dctx->buffer + dctx->bytes, src, srclen);
> +			dctx->bytes += srclen;
> +			return 0;
> +		}
> +		memcpy(dctx->buffer + dctx->bytes, src, GHASH_DIGEST_SIZE - dctx->bytes);
> +
> +		gcm_ghash_rv64i_zbc(&dctx->shash, ctx->key, dctx->buffer, GHASH_DIGEST_SIZE);
> +
> +		src += GHASH_DIGEST_SIZE - dctx->bytes;
> +		srclen -= GHASH_DIGEST_SIZE - dctx->bytes;
> +		dctx->bytes = 0;
> +	}

If this progresses beyond an RFC, you will need to do convert this
into a block-only algorithm on top of:

https://patchwork.kernel.org/project/linux-crypto/patch/b2eb753b083c029785c5e18238ca6cf06f48c86a.1744784515.git.herbert@gondor.apana.org.au/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
