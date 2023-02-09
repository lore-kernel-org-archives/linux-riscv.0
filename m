Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B6DC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLxd9J/fmZPh3Q3BsC+sBARKes5c2hKt2TUDgwKRtug=; b=RSMN7saVNPxqZ8
	njTLNi9iEVxuNeQFX8NGS8sfXwFYE4BDXfqHgmInkezWWUPJzUyYSpneKACe09zxGseDHK+0D6FPn
	AMBnfi4YGV55uyyug1zX5nRwRbD9kzn9rLIjZSeqCXvMG5fLXJtpCmHPG8w3Y9Gf8SfQgy8IDXbOI
	icwebJY+dW54dZE0mdS5myV5lA4g7ojyvfg78NWDX0nc34cFX92z0lpfUE82f1kw3QickXWAuhc98
	vun5n918hlawhAMZAQe7XhMMAmDZSRXkHcC2i+NdOglQLQ8TzBxoI5GZnDi+FsMy77Dz/4RkvXhJD
	A6/TVUSiZR8APq3ivHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Ww-000ugi-Jl; Thu, 09 Feb 2023 09:47:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Wv-000ugC-Gg
	for linux-riscv@bombadil.infradead.org; Thu, 09 Feb 2023 09:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vj/wr+Ho2oZVDzzcc/BGRoyXqKuJz3jTrLa0qB27tvo=; b=JSkiFDqXrgixOfPGcqEpwyaMrN
	2MQca3BbQM4pbJHUsnv0lQz2pzocTHbncCX2EK4dFi4a7odXSVyfe3TVr6dI8qlENh5+jwFpYQ1Lb
	Xbx8/OEOr8fnWukEjVqLAhw/ZbhNY1rUN6+UDDvsnccQeRdR8my9PqJoVKe62Cx+S+f2ggDZcUstv
	lmMm5TcTdH/Z2Gloi5RJOm+NwyzHsTYZnJ/Wpb+ECpX3KBkrlfXnzwRWfWkn66EFOAWx8JHSyAXst
	Jqehdq1U/n34rh3Ux7F3dxE5Y8aQsBf6gZPZKVSnYMyUYoHhtHaeLtVG54y8HP0O7CkzbLmlufkev
	ooMPm8Xw==;
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38] helo=formenos.hmeau.com)
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Wr-0024rW-AV
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:47:48 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pQ3W2-009E9r-OF; Thu, 09 Feb 2023 17:46:55 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 09 Feb 2023 17:46:54 +0800
Date: Thu, 9 Feb 2023 17:46:54 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <Y+TBDqkjsuMiA/P7@gondor.apana.org.au>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130154242.112613-5-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_094745_835858_F464A140 
X-CRM114-Status: UNSURE (   7.94  )
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

On Mon, Jan 30, 2023 at 11:42:42PM +0800, Jia Jie Ho wrote:
>
> +static inline int starfive_hash_wait_hmac_done(struct starfive_cryp_ctx *ctx)
> +{
> +	struct starfive_cryp_dev *cryp = ctx->cryp;
> +	u32 status;
> +
> +	return readl_relaxed_poll_timeout(cryp->base + STARFIVE_HASH_SHACSR, status,
> +					  (status & STARFIVE_HASH_HMAC_DONE), 10, 100000);
> +}
> +
> +static inline int starfive_hash_wait_busy(struct starfive_cryp_ctx *ctx)
> +{
> +	struct starfive_cryp_dev *cryp = ctx->cryp;
> +	u32 status;
> +
> +	return readl_relaxed_poll_timeout(cryp->base + STARFIVE_HASH_SHACSR, status,
> +					  !(status & STARFIVE_HASH_BUSY), 10, 100000);
> +}
> +
> +static inline int starfive_hash_wait_key_done(struct starfive_cryp_ctx *ctx)
> +{
> +	struct starfive_cryp_dev *cryp = ctx->cryp;
> +	u32 status;
> +
> +	return readl_relaxed_poll_timeout(cryp->base + STARFIVE_HASH_SHACSR, status,
> +					  (status & STARFIVE_HASH_KEY_DONE), 10, 100000);
> +}

Is there no IRQ mechanism for this?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
