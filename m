Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A71CEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 05:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21TKLgVVobPV0N0ygbmxOE15XvgbTIGZpGmnjmk4R8A=; b=exClWpX0fOBFFx
	N38euJ0vbYxOg20nCsRQ1jZoQsi4WQi/u5MmGnhE03a0MQcS015WsTJNtOJpGSg3/wyM45lxIoP/K
	igkZUaqk5j3pZ+FHM9QscU2X2dnJZs3Qmdnxv9sB5Of5vxd7vWAAJ+rTEEWuN2uH8XBNJ6thg+jh5
	xRWGxgGmsiAsNK0IyNIo2sZ/L4zhRWq1jyHdayYh/+XZ3CjwL7ndwgTeBZaQUhdYIBj84QJonz5l5
	bYgaLaUpWrwkZ6nIDrDrhcRnLO+6UNpY10KSL4hfdXCXGtjhqnjF+dta8MOpa301qBC5M+yIrp7rp
	B1RaIm/xyWcpuORPp4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMisd-00CwWV-3B;
	Fri, 21 Jul 2023 05:40:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMisb-00CwW0-2i
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 05:40:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 625AF61059;
	Fri, 21 Jul 2023 05:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FC3C433C9;
	Fri, 21 Jul 2023 05:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689918038;
	bh=6woljF56EtGa36LjBB3B2sNwJQN8DkkmcmlzgApu4Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAOs35R/eyd+HK5UWNBpYRfZHI9b0+IzsTRKRrl2A6mGThbnVEdEk1D7CXQwb/l5h
	 H6zfH8hXAILEvg7woMboLuY62seV4GFsSq0WkG8URUbLLkTyEWMKZMQeoTl/8Eh+Gg
	 TowgGcFj3Kx+QYVZ9M6vx8Djp3zxgijWDCsaLA2JS7fQf2AQ39CyUeVj+jqwixX3rK
	 edJxrS6NwFbvINVDVSS+LIoEw2RTcYtluixH9mSYDnIBRQEireDYykqkCC7GpVS3/h
	 +jdsEziyDvcEkg2O1RCxaAY/xxkehV6I7URYj6+loKJ7bJ6vsRRox4TabYwYyVpJ8q
	 eZlCqwjSvNcrg==
Date: Thu, 20 Jul 2023 22:40:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 10/12] RISC-V: crypto: add Zvkned accelerated AES
 encryption implementation
Message-ID: <20230721054036.GD847@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-11-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711153743.1970625-11-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_224041_984298_B59E9E3F 
X-CRM114-Status: GOOD (  29.99  )
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

On Tue, Jul 11, 2023 at 05:37:41PM +0200, Heiko Stuebner wrote:
> +config CRYPTO_AES_RISCV
> +	tristate "Ciphers: AES (RISCV)"
> +	depends on 64BIT && RISCV_ISA_V
> +	select CRYPTO_AES
> +	help
> +	  Block ciphers: AES cipher algorithms (FIPS-197)
> +	  Length-preserving ciphers: AES with ECB, CBC, CTR, CTS,
> +	    XCTR, and XTS modes
> +	  AEAD cipher: AES with CBC, ESSIV, and SHA-256
> +	    for fscrypt and dm-crypt
> +
> +	  Architecture: riscv using one of
> +	  - Zvkns

I'm looking forward to having direct support for these AES modes, especially the
modes needed for storage encryption: XTS, and CBC or CTS!  None of these AES
modes is actually implemented in this patch yet, though, so they can't be
claimed in the kconfig help text yet.  This patch is just a starting point, as
it just adds support for the bare AES block cipher ("aes" in the crypto API).

(BTW, I'm much more interested in, say, AES-XTS support than SM4 support, which
this patchset does include.  SM4 is a "national pride cipher" which is somewhat
of a niche thing.  I suppose there are already people pushing it for RISC-V
though, as they are everywhere else, so that's to be expected...)

> diff --git a/arch/riscv/crypto/aes-riscv-glue.c b/arch/riscv/crypto/aes-riscv-glue.c
> new file mode 100644
> index 000000000000..85e1187aee22
> --- /dev/null
> +++ b/arch/riscv/crypto/aes-riscv-glue.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Linux/riscv port of the OpenSSL AES implementation for RISCV
> + *
> + * Copyright (C) 2023 VRULL GmbH
> + * Author: Heiko Stuebner <heiko.stuebner@vrull.eu>
> + */
> +
> +#include <linux/crypto.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <asm/simd.h>
> +#include <asm/vector.h>
> +#include <crypto/aes.h>
> +#include <crypto/internal/cipher.h>
> +#include <crypto/internal/simd.h>
> +
> +struct aes_key {
> +	u8 key[AES_MAX_KEYLENGTH];
> +	int rounds;
> +};
> +
> +/* variant using the zvkned vector crypto extension */
> +void rv64i_zvkned_encrypt(const u8 *in, u8 *out, const struct aes_key *key);
> +void rv64i_zvkned_decrypt(const u8 *in, u8 *out, const struct aes_key *key);
> +int rv64i_zvkned_set_encrypt_key(const u8 *userKey, const int bits,
> +				struct aes_key *key);
> +int rv64i_zvkned_set_decrypt_key(const u8 *userKey, const int bits,
> +				struct aes_key *key);
> +
> +struct riscv_aes_ctx {
> +	struct crypto_cipher *fallback;
> +	struct aes_key enc_key;
> +	struct aes_key dec_key;
> +	unsigned int keylen;
> +};

Can it just use 'struct crypto_aes_ctx'?  That's what most of the other AES
implementations use.

> +static int riscv64_aes_init_zvkned(struct crypto_tfm *tfm)
> +{
> +	struct riscv_aes_ctx *ctx = crypto_tfm_ctx(tfm);
> +	const char *alg = crypto_tfm_alg_name(tfm);
> +	struct crypto_cipher *fallback;
> +
> +	fallback = crypto_alloc_cipher(alg, 0, CRYPTO_ALG_NEED_FALLBACK);
> +	if (IS_ERR(fallback)) {
> +		pr_err("Failed to allocate transformation for '%s': %ld\n",
> +		       alg, PTR_ERR(fallback));
> +		return PTR_ERR(fallback);
> +	}
> +
> +	crypto_cipher_set_flags(fallback,
> +				crypto_cipher_get_flags((struct
> +							 crypto_cipher *)
> +							tfm));
> +	ctx->fallback = fallback;
> +
> +	return 0;
> +}
> +
> +static void riscv_aes_exit(struct crypto_tfm *tfm)
> +{
> +	struct riscv_aes_ctx *ctx = crypto_tfm_ctx(tfm);
> +
> +	if (ctx->fallback) {
> +		crypto_free_cipher(ctx->fallback);
> +		ctx->fallback = NULL;
> +	}
> +}
> +
> +static int riscv64_aes_setkey_zvkned(struct crypto_tfm *tfm, const u8 *key,
> +			 unsigned int keylen)
> +{
> +	struct riscv_aes_ctx *ctx = crypto_tfm_ctx(tfm);
> +	int ret;
> +
> +	ctx->keylen = keylen;
> +
> +	if (keylen == 16 || keylen == 32) {
> +		kernel_rvv_begin();
> +		ret = rv64i_zvkned_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
> +		if (ret != 1) {
> +			kernel_rvv_end();
> +			return -EINVAL;
> +		}
> +
> +		ret = rv64i_zvkned_set_decrypt_key(key, keylen * 8, &ctx->dec_key);
> +		kernel_rvv_end();
> +		if (ret != 1)
> +			return -EINVAL;
> +	}
> +
> +	ret = crypto_cipher_setkey(ctx->fallback, key, keylen);
> +
> +	return ret ? -EINVAL : 0;
> +}

It's a bit annoying that RISC-V doesn't support AES-192, though also not
particularly surprising, seeing as AES-192 is almost never used.  (Intel's Key
Locker, for example, is another recent CPU feature that doesn't support
AES-192.)  IMO the issue here is really with the kernel crypto API -- it should
treat AES-128, AES-192, and AES-256 as separate algorithms so that
implementations aren't forced to support all three key sizes...

Anyway, for now, as you noticed you do need a fallback to handle AES-192 to make
the kernel crypto API happy.

But, the fallback doesn't have to be a 'crypto_cipher' as you've implemented.
You could just use the AES library.  See what arch/arm64/crypto/aes-ce-glue.c
does, for example.  Have you considered that?  It would be simpler than the
crypto_cipher based approach.

> +
> +static void riscv64_aes_encrypt_zvkned(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
> +{
> +	struct riscv_aes_ctx *ctx = crypto_tfm_ctx(tfm);

Always use 'const' for the tfm_ctx in encrypt and decrypt functions, please, as
it must never be modified there.

> +struct crypto_alg riscv64_aes_zvkned_alg = {

static

> +	.cra_type = NULL,

Omit that line

> +	.cra_alignmask = 0,

Omit that line

> +MODULE_DESCRIPTION("AES (accelerated)");

Maybe "RISC-V accelerated"?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
