Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786C8C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 04:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/Yx2MGA+PGOw+GandKMssKqF6VVr0C6i9xqdedLzS0=; b=zhZfhXKckmu8Lw
	WZbvRSXfD0xM0SlyeylD0+iTeHt1xrPeyxe3zcKpff/OKne51W9uBAG7yiuST6cRSzqEB0ToJ1b/0
	wQjZ+u1HUTCZZi2Pyx9KQ/2ew+BkpjSdZS9Mg+/vqpWvWqdSpeZzRCjipzLoUGvjIRQioabQ2nRpy
	RYFC3lOor29S3UzxMqaZB4XJZXiOuFI7Dv0QNPx3F45qu3ppZrSJqTcoiI5B2t88tHfd9YwwI7eCa
	onZnawV06FBpYEXG5xvspylWXZKLn/19TnwtvAsghtwdQDzjFas/vdjIuX1WkEGjQOpIvTIOz491Z
	WGmo5bQ31PqYjnLvI25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyPgX-008iob-2v;
	Thu, 02 Nov 2023 04:52:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyPgV-008io5-04
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 04:52:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2A9EDCE1F31;
	Thu,  2 Nov 2023 04:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C998EC433C7;
	Thu,  2 Nov 2023 04:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698900716;
	bh=N5PhYckyJitNvUVEQLxwfu9qQj+65o8OQSQa8fX1Z4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1SQS0MHoqVwhvRH46guTdDbWvcHFjJubtcCBXl2LP/liJt/QnAk4oIMabRWHzSBu
	 tfNJ03Bil97OTREOXuvpb9/fihGxVpjy+TaOx1bDzqK+E5zVRNRq4Uo6ngrQ1BRXHQ
	 rTWCcO+YvS9Xv7aRJgBYt8q1+b9D7p1EMHK6GuZTB8uFX+5eKNNbtAjZ/bib7XlbmP
	 1COfydaKwVcY73i+IKI68UB5xFvl2fsXz9Kda4l40itjtgc6I2N1Tja1kuSwY4+/xT
	 xbt19c6AmHbu0hPjDm3E/KbqXASc2o4C+SSUVm74K8fFLdviT2obMlPEcB3yx5kZOC
	 gq9miRdJL3iEg==
Date: Wed, 1 Nov 2023 21:51:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 04/12] RISC-V: crypto: add Zvkned accelerated AES
 implementation
Message-ID: <20231102045154.GE1498@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-5-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025183644.8735-5-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_215159_398737_6A441E42 
X-CRM114-Status: GOOD (  22.27  )
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

On Thu, Oct 26, 2023 at 02:36:36AM +0800, Jerry Shih wrote:
> diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
> index 10d60edc0110..500938317e71 100644
> --- a/arch/riscv/crypto/Kconfig
> +++ b/arch/riscv/crypto/Kconfig
> @@ -2,4 +2,16 @@
>  
>  menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
>  
> +config CRYPTO_AES_RISCV64
> +	default y if RISCV_ISA_V
> +	tristate "Ciphers: AES"
> +	depends on 64BIT && RISCV_ISA_V
> +	select CRYPTO_AES
> +	select CRYPTO_ALGAPI
> +	help
> +	  Block ciphers: AES cipher algorithms (FIPS-197)
> +
> +	  Architecture: riscv64 using:
> +	  - Zvkned vector crypto extension

kconfig options should default to off.

I.e., remove the line "default y if RISCV_ISA_V"

> + *
> + * All zvkned-based functions use encryption expending keys for both encryption
> + * and decryption.
> + */

The above comment is a bit confusing.  It's describing the 'key' field of struct
aes_key; maybe there should be a comment there instead:

    struct aes_key {
            u32 key[AES_MAX_KEYLENGTH_U32]; /* round keys in encryption order */
            u32 rounds;
    };

> +int riscv64_aes_setkey(struct riscv64_aes_ctx *ctx, const u8 *key,
> +		       unsigned int keylen)
> +{
> +	/*
> +	 * The RISC-V AES vector crypto key expending doesn't support AES-192.
> +	 * We just use the generic software key expending here to simplify the key
> +	 * expending flow.
> +	 */

expending => expanding

> +	u32 aes_rounds;
> +	u32 key_length;
> +	int ret;
> +
> +	ret = aes_expandkey(&ctx->fallback_ctx, key, keylen);
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * Copy the key from `crypto_aes_ctx` to `aes_key` for zvkned-based AES
> +	 * implementations.
> +	 */
> +	aes_rounds = aes_round_num(keylen);
> +	ctx->key.rounds = aes_rounds;
> +	key_length = AES_BLOCK_SIZE * (aes_rounds + 1);
> +	memcpy(ctx->key.key, ctx->fallback_ctx.key_enc, key_length);
> +
> +	return 0;
> +}

Ideally this would use the same crypto_aes_ctx for both the fallback and the
assembly code.  I suppose we don't want to diverge from the OpenSSL code (unless
it gets rewritten), though.  So I guess this is fine for now.

> void riscv64_aes_encrypt_zvkned(const struct riscv64_aes_ctx *ctx, u8 *dst,
>                                const u8 *src)

These functions can be called from a different module (aes-block-riscv64), so
they need EXPORT_SYMBOL_GPL.

> +static inline bool check_aes_ext(void)
> +{
> +	return riscv_isa_extension_available(NULL, ZVKNED) &&
> +	       riscv_vector_vlen() >= 128;
> +}
> +
> +static int __init riscv64_aes_mod_init(void)
> +{
> +	if (check_aes_ext())
> +		return crypto_register_alg(&riscv64_aes_alg_zvkned);
> +
> +	return -ENODEV;
> +}
> +
> +static void __exit riscv64_aes_mod_fini(void)
> +{
> +	if (check_aes_ext())
> +		crypto_unregister_alg(&riscv64_aes_alg_zvkned);
> +}
> +
> +module_init(riscv64_aes_mod_init);
> +module_exit(riscv64_aes_mod_fini);

module_exit can only run if module_init succeeded.  So, in cases like this it's
not necessary to check for CPU features before unregistering the algorithm.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
