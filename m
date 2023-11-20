Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21035C5ACB3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 02:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elIq+t+8TYL4swmZWDAJbq1JNd24bJ/3Hd+oRey+J+w=; b=MOuXtgvfnLgBpD
	I6vd2CBZvCNDdVQ+LMILXWg3SbxdXy0eKv8zvTfFDc8id8tCG7MGO3oeNzcV5W4q91JBZl57LGKDH
	bECCfJl76yVbuXRNLx1A8DrQD3JHSZDpDYNBdYoiNpmYjVjHHz3KlH4lsxt0EDUQij2jDvXjPztbT
	i67Ml0B6G6eGf/16DkbaWJcBvWLvg0FwLYpt/bTYeoIgthGkkrimU+2Yfgp6ngMz0VIqtPgRMsY55
	Z5VrnZV2Ke3xrTL57rJouPxb7XnL/KIqgpBamTirBuVlyuLsvMe42ujPKUFEOm4tpXkLjMUQF3jn8
	0mt1o3EkMMkCPrlBDNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uPu-00AyyG-03;
	Mon, 20 Nov 2023 02:53:42 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uPr-00Ayxm-1T
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 02:53:41 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-581fb6f53fcso2474822eaf.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 18:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700448817; x=1701053617; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgw7AKOcjzQj/Rejwnwc+8bVuVEALNE76ynoPJrneqk=;
        b=P95bx8RTHKdMJJ3FaqA0NK5LTTobjNEzmPAAEPnDXjNGasRvEncpcwbGW0XiPV7haD
         h71pA0wP7gETfNckeQ7kxIXmTls839clhn7oADGTzf3QcDEvh1jLekTSrH31TKndOUi1
         ma9yRwwSMdBL0u0Tpl3J+ZhnHXVnxewwAaTH/zA3DZ1a9PUW2CjQPpx+zKxviOnIokuA
         Ds5U/6FallFOzkxJH+dKLOz8zmDVr6APgcz+bgypRso0i149tt/bfRo34XM8G3qiY73n
         iNZEV566bIuQZQL4YqXD1d+d8+087/stO4bvHHYsKLQC51U7mQVX2TuUbz4sSAGN21J7
         U7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700448817; x=1701053617;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zgw7AKOcjzQj/Rejwnwc+8bVuVEALNE76ynoPJrneqk=;
        b=EhI1ygfQwMMAS4u8La3tY1idlqyjFR7vuZ5aNFPHtbMJ6j5VAuO2D1nuauyFUQ9/Iy
         L1LOFF+Qu1/s3WnVVO9T/aQk4f1ni+VujlbcQZW27ZtV63Lj1wK4zeh+ylFpyJ9f9XbZ
         TFp6Vg3HMr3s7a0E6XXg6nkc8wqA1ejwm9CXWqKe4Vxb1xemgcVCcUssTwjDeVyhjX4p
         ORO5Uuy0vR0rbU3fxdtdAXb+fhsiKexXBHlUkyPeMcdUxc2ZTooIxuEK48lqStu21Oyk
         LIcqOXN5YlbHTBkhPUfH5SKRjCkTXo3hN6+BF9AShUM8IKTa5P2yliwnuzF9V+BX9GUo
         AFIg==
X-Gm-Message-State: AOJu0YwAIZkTSXFZL1Khf85rCqZY6zcg2rDuyTe4KvUx5aCS8ICJJlUo
	BFLRZRNHwDMQQSNDBXpIuNo5HQ==
X-Google-Smtp-Source: AGHT+IG8+zVUvIfaj6M56TYlUd2Q7PRlGTniaXvKvPTlRS7k2ULTLBqGIip0cGvEtuCSCawFt277vg==
X-Received: by 2002:a05:6358:63a9:b0:16b:fa63:4f44 with SMTP id k41-20020a05635863a900b0016bfa634f44mr6528197rwh.10.1700448816832;
        Sun, 19 Nov 2023 18:53:36 -0800 (PST)
Received: from ?IPv6:2402:7500:5d5:bc21:3420:fefa:20d4:2a2f? ([2402:7500:5d5:bc21:3420:fefa:20d4:2a2f])
        by smtp.gmail.com with ESMTPSA id u31-20020a63471f000000b0058c1383fa8bsm4979080pga.0.2023.11.19.18.53.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Nov 2023 18:53:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 04/12] RISC-V: crypto: add Zvkned accelerated AES
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231102045154.GE1498@sol.localdomain>
Date: Mon, 20 Nov 2023 10:53:30 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 andy.chiu@sifive.com,
 greentime.hu@sifive.com,
 conor.dooley@microchip.com,
 guoren@kernel.org,
 bjorn@rivosinc.com,
 heiko@sntech.de,
 ardb@kernel.org,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <4C199F94-3797-4163-9EAD-D3A4EF6D2C41@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-5-jerry.shih@sifive.com>
 <20231102045154.GE1498@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_185339_508972_CBBCF748 
X-CRM114-Status: GOOD (  22.39  )
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

On Nov 2, 2023, at 12:51, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:36AM +0800, Jerry Shih wrote:
>> diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
>> index 10d60edc0110..500938317e71 100644
>> --- a/arch/riscv/crypto/Kconfig
>> +++ b/arch/riscv/crypto/Kconfig
>> @@ -2,4 +2,16 @@
>> 
>> menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
>> 
>> +config CRYPTO_AES_RISCV64
>> +	default y if RISCV_ISA_V
>> +	tristate "Ciphers: AES"
>> +	depends on 64BIT && RISCV_ISA_V
>> +	select CRYPTO_AES
>> +	select CRYPTO_ALGAPI
>> +	help
>> +	  Block ciphers: AES cipher algorithms (FIPS-197)
>> +
>> +	  Architecture: riscv64 using:
>> +	  - Zvkned vector crypto extension
> 
> kconfig options should default to off.
> 
> I.e., remove the line "default y if RISCV_ISA_V"

Fixed.

>> + *
>> + * All zvkned-based functions use encryption expending keys for both encryption
>> + * and decryption.
>> + */
> 
> The above comment is a bit confusing.  It's describing the 'key' field of struct
> aes_key; maybe there should be a comment there instead:
> 
>    struct aes_key {
>            u32 key[AES_MAX_KEYLENGTH_U32]; /* round keys in encryption order */
>            u32 rounds;
>    };

I have updated the asm implementation to use `crypto_aes_ctx` struct.

>> +int riscv64_aes_setkey(struct riscv64_aes_ctx *ctx, const u8 *key,
>> +		       unsigned int keylen)
>> +{
>> +	/*
>> +	 * The RISC-V AES vector crypto key expending doesn't support AES-192.
>> +	 * We just use the generic software key expending here to simplify the key
>> +	 * expending flow.
>> +	 */
> 
> expending => expanding

Thx.
Fixed.

>> +	u32 aes_rounds;
>> +	u32 key_length;
>> +	int ret;
>> +
>> +	ret = aes_expandkey(&ctx->fallback_ctx, key, keylen);
>> +	if (ret < 0)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Copy the key from `crypto_aes_ctx` to `aes_key` for zvkned-based AES
>> +	 * implementations.
>> +	 */
>> +	aes_rounds = aes_round_num(keylen);
>> +	ctx->key.rounds = aes_rounds;
>> +	key_length = AES_BLOCK_SIZE * (aes_rounds + 1);
>> +	memcpy(ctx->key.key, ctx->fallback_ctx.key_enc, key_length);
>> +
>> +	return 0;
>> +}
> 
> Ideally this would use the same crypto_aes_ctx for both the fallback and the
> assembly code.  I suppose we don't want to diverge from the OpenSSL code (unless
> it gets rewritten), though.  So I guess this is fine for now.

I have updated the asm implementation to use `crypto_aes_ctx` struct.

>> void riscv64_aes_encrypt_zvkned(const struct riscv64_aes_ctx *ctx, u8 *dst,
>>                               const u8 *src)
> 
> These functions can be called from a different module (aes-block-riscv64), so
> they need EXPORT_SYMBOL_GPL.

Fixed.

>> +static inline bool check_aes_ext(void)
>> +{
>> +	return riscv_isa_extension_available(NULL, ZVKNED) &&
>> +	       riscv_vector_vlen() >= 128;
>> +}
>> +
>> +static int __init riscv64_aes_mod_init(void)
>> +{
>> +	if (check_aes_ext())
>> +		return crypto_register_alg(&riscv64_aes_alg_zvkned);
>> +
>> +	return -ENODEV;
>> +}
>> +
>> +static void __exit riscv64_aes_mod_fini(void)
>> +{
>> +	if (check_aes_ext())
>> +		crypto_unregister_alg(&riscv64_aes_alg_zvkned);
>> +}
>> +
>> +module_init(riscv64_aes_mod_init);
>> +module_exit(riscv64_aes_mod_fini);
> 
> module_exit can only run if module_init succeeded.  So, in cases like this it's
> not necessary to check for CPU features before unregistering the algorithm.
> 
> - Eric

Fixed.

-Jerry


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
