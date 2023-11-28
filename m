Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA38C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 03:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efVnjhs9A199QQtAQHYBg6H2PIPfIu7DL6aPUdoROw4=; b=kx83l5KCaSdS/7
	4hI4BbMyS65CV5Z1p/6//+F8JkoKxQfFtz1qA72AYVwor0CgBwRN4my+FNHKitnYS1Ad+E/hO+WaB
	pTRJ1IStSIhyWYpU1vTl2sb5RDK0GYKAfNYU/FNJ3FWiJS41wWwN0zoMskHu6+AVm73CyvH9vYtd/
	ts1jZyYAxUzbGmJtkfxqoiqUZD4qaJj1ldGKbSamVkhlhAfZNrUBRZndWVVLI55UMW/bAYxAS4QPK
	DjYvvX+/o84wPtxXvt044MtcV4Xk3R9Y0pwGo8BNzzjAKzBtk4tWjprkRv1qYu3JMiMv1jlaX0u1Y
	oUmQ8EBF3P8kmlm5bQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pDE-0040PR-0K;
	Tue, 28 Nov 2023 03:56:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pDA-0040OO-2B
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 03:56:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7B091CE0AE9;
	Tue, 28 Nov 2023 03:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AB4C433C8;
	Tue, 28 Nov 2023 03:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701143792;
	bh=WjCFklQtOqf81uorIGsoppOMkx+RH2HrsqXNbDg296w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXn+gVLYClewyVh4gauMobUQySkuWPZlNWRXYOqVBZOndYo80wvV+QXyKy7lyRrXR
	 P4x9KxE+Z8BGAKzNtvE0/hUH/xuy7ochY4+j0gjlFgZ2VE/vE279bsx2IAZNTO5DBm
	 t3jCbNSguAnMBfYueuZjUNc8nD2BkCjQXWEtZ1JkjLxSsayyR7ocfEVeLgUVKikHXJ
	 Vsc4X4CjHaWvrzML0PPVbtfvUS0qcqWJalReTbX1zcbdUXv7gZkj4I6amM46ne/rSl
	 XUjxBqTprF5Zbw01ztPhc37bJLmpAsaP1un28ub4bE/jHdgojhy3fr5nJcx57Up0nV
	 1z10T2CiJb9Wg==
Date: Mon, 27 Nov 2023 19:56:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 04/13] RISC-V: crypto: add Zvkned accelerated AES
 implementation
Message-ID: <20231128035630.GG1463@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-5-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-5-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_195636_913250_A539533C 
X-CRM114-Status: GOOD (  17.60  )
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

On Mon, Nov 27, 2023 at 03:06:54PM +0800, Jerry Shih wrote:
> +int riscv64_aes_setkey(struct crypto_aes_ctx *ctx, const u8 *key,
> +		       unsigned int keylen)
> +{
> +	int ret;
> +
> +	ret = aes_check_keylen(keylen);
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * The RISC-V AES vector crypto key expanding doesn't support AES-192.
> +	 * Use the generic software key expanding for that case.
> +	 */
> +	if ((keylen == 16 || keylen == 32) && crypto_simd_usable()) {
> +		/*
> +		 * All zvkned-based functions use encryption expanding keys for both
> +		 * encryption and decryption.
> +		 */
> +		kernel_vector_begin();
> +		rv64i_zvkned_set_encrypt_key(key, keylen, ctx);
> +		kernel_vector_end();
> +	} else {
> +		ret = aes_expandkey(ctx, key, keylen);
> +	}

rv64i_zvkned_set_encrypt_key() does not initialize crypto_aes_ctx::key_dec.
So, decryption results will be incorrect if !crypto_simd_usable() later.

> +static int aes_setkey(struct crypto_tfm *tfm, const u8 *key,
> +		      unsigned int keylen)

It's best to avoid generic-sounding function names like this that could collide
with functions in crypto/ or lib/crypto/.  A better name for this function, for
example, would be aes_setkey_zvkned().

> diff --git a/arch/riscv/crypto/aes-riscv64-zvkned.pl b/arch/riscv/crypto/aes-riscv64-zvkned.pl
> new file mode 100644
> index 000000000000..303e82d9f6f0
> --- /dev/null
> +++ b/arch/riscv/crypto/aes-riscv64-zvkned.pl
[...]
> +L_enc_128:
[...]
> +L_enc_192:
[...]
> +L_enc_256:

There's some severe source code duplication going on in the AES assembly, with
the three AES variants having separate source code.  You can just leave this
as-is since this is what was merged into OpenSSL and we are borrowing that for
now, but I do expect that we'll want to clean this up later.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
