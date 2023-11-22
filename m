Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2E5C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEFAI5P791pgtQeukYqT44kFB4r0PPelbgPcz4wRL8g=; b=nbtCFgPemOKKJX
	IJb4bFJpJRu0mnYbpsz2kV6fy+DbAuEpxmF836WTLwb3+3ppq3S7s/IAmMa1dJHQq3QUjSiYVok3P
	WgWBT3P6k9vLV+rifGQ4k4YAKYq+5FwnohSELdJynN6QkiFe0XeTFv5p45USSfW+7fa8MIXAJ+H+w
	r+FNhg1etoLZRzD7Rxb7KfMe9AmK36E72OUltiKK2B2CgKwU0Q0lcj5UqCh54DIu0Z0AqzLM0f4VY
	Z+i4Qhed3Ahl7mbAk5a9H75y6ACS/sij8CaWkL1uaP4qcoPfg+DL9LD5Z4Lzxfg+nJxy7sA1orl0A
	YtOn/pGgfhYKKigHWYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5c6C-000QES-06;
	Wed, 22 Nov 2023 01:32:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5c69-000QDu-0c
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77FC5616AA;
	Wed, 22 Nov 2023 01:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986FBC433C8;
	Wed, 22 Nov 2023 01:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700616732;
	bh=bm2hc6HT2WoAs5lqntk0P/geqlIujjMacD9zqFmU6zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+oEnfydqCQHukpHD415uJw6zLd4ltiB/0o5AEVdE2OaAaItk4smuVw9AvNBXVXxQ
	 jK25tuFtjUmGF5101V7+MFPf0juQxLbF1hZleJHVnSJhNubWO1W0TB38gNGIE922lI
	 JwVIuVwtptrIgX+gxtMwwz9ufc87izVGDW+hYQt7eO1rxh97JXEGNNcZnOQfKP5ffs
	 vUpGkia7APJFkH3MDQUrxKKjPV0i5w53IJ4jHQqUomSRgWvHUelFIWFajNZo032+12
	 LwGA5svWtSqmdRq3cqaGIP/LpJeSoBmyrfXrKbTZoV6ITOuVXzfwXDk4yTP8q9889o
	 ggJyqziI8AeNQ==
Date: Tue, 21 Nov 2023 17:32:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 09/12] RISC-V: crypto: add Zvknhb accelerated SHA384/512
 implementations
Message-ID: <20231122013210.GH2172@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-10-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025183644.8735-10-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_173213_292693_18DDD97D 
X-CRM114-Status: GOOD (  10.69  )
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

On Thu, Oct 26, 2023 at 02:36:41AM +0800, Jerry Shih wrote:
> +static int riscv64_sha512_update(struct shash_desc *desc, const u8 *data,
> +				 unsigned int len)
> +{
> +	int ret = 0;
> +
> +	/*
> +	 * Make sure struct sha256_state begins directly with the SHA256
> +	 * 256-bit internal state, as this is what the asm function expect.
> +	 */
> +	BUILD_BUG_ON(offsetof(struct sha512_state, state) != 0);

There's a copy-paste error here; all the 256 above should be 512.

> +static struct shash_alg sha512_alg[] = {
> +	{
> +		.digestsize = SHA512_DIGEST_SIZE,
> +		.init = sha512_base_init,
> +		.update = riscv64_sha512_update,
> +		.final = riscv64_sha512_final,
> +		.finup = riscv64_sha512_finup,
> +		.descsize = sizeof(struct sha512_state),
> +		.base.cra_name = "sha512",
> +		.base.cra_driver_name = "sha512-riscv64-zvkb-zvknhb",
> +		.base.cra_priority = 150,
> +		.base.cra_blocksize = SHA512_BLOCK_SIZE,
> +		.base.cra_module = THIS_MODULE,
> +	},
> +	{
> +		.digestsize = SHA384_DIGEST_SIZE,
> +		.init = sha384_base_init,
> +		.update = riscv64_sha512_update,
> +		.final = riscv64_sha512_final,
> +		.finup = riscv64_sha512_finup,
> +		.descsize = sizeof(struct sha512_state),
> +		.base.cra_name = "sha384",
> +		.base.cra_driver_name = "sha384-riscv64-zvkb-zvknhb",
> +		.base.cra_priority = 150,
> +		.base.cra_blocksize = SHA384_BLOCK_SIZE,
> +		.base.cra_module = THIS_MODULE,
> +	}
> +};

*_algs instead of *_alg when there's more than one, please.
I.e., sha512_alg => sha512_algs here.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
