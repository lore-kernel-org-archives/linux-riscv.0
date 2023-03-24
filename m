Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E9AC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpGdixHtXjBDNsOYYNBgjn7Ok4uwh2cVk7N3jj7dJx4=; b=dWRU2plKx02osd
	nMfxF9OtI8iZUixDU42tNOJq4I5Neiv7vUMsx6lGQ38Z/OzC7Co+o0eI7Z/HMpcRPA17cOVF5CGfJ
	Xbk0PoicWF6iWkxv3lmbRTBsMyf89HkZP7Eu/6CJjuFCC4l3eWAFjTy1n0ShfoY8FkEhLaB+KoQV1
	q9JvaqlsJMLh9J5weA3Sy1eKZUCUVlfaAFXF/Es6JI3J5Zkmf1re4l6fKyP3h6Bx6obSGLKEUHegK
	Xql8QLlaQ9qHVX3nCOYGXSzBvfgQMKTUDGj8jpGY5RUdbmgWn9rZVC4QBlr0DymM7TfXEeDm/BC1K
	tXlt5cda/L4N/ZZo9fLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfe33-0045MA-2D;
	Fri, 24 Mar 2023 09:49:25 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfe30-0045Ki-22
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 09:49:23 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pfe2P-008EuX-M7; Fri, 24 Mar 2023 17:48:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 24 Mar 2023 17:48:45 +0800
Date: Fri, 24 Mar 2023 17:48:45 +0800
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
Message-ID: <ZB1x/bUdOSWzim+8@gondor.apana.org.au>
References: <20230313135646.2077707-1-jiajie.ho@starfivetech.com>
 <20230313135646.2077707-5-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313135646.2077707-5-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_024922_672148_26C9B95B 
X-CRM114-Status: UNSURE (   9.39  )
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
> +static int starfive_hash_copy_sgs(struct starfive_cryp_request_ctx *rctx)
> +{
> +	void *buf_in;
> +	int pages, total_in;
> +
> +	if (!starfive_hash_check_io_aligned(rctx)) {
> +		rctx->sgs_copied = 0;
> +		return 0;
> +	}
> +
> +	total_in = ALIGN(rctx->total, rctx->blksize);
> +	pages = total_in ? get_order(total_in) : 1;
> +	buf_in = (void *)__get_free_pages(GFP_ATOMIC, pages);

Please don't allocate the whole thing because it could be unlimited
in size (and triggered from user-space by untrusted users too).

If you have to copy, then just allocate a single page and copy
that, hash, and then repeat until it's all done.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
