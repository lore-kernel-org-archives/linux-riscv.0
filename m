Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2FDC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 02:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGxA+0ZW/R2nFEeTml2fNU7vmmPddd2RzddIZ792At0=; b=MOMOI4R2nF/DFB
	kxiOXYa/YfJ4EEk0CsKEkR1uQAzboPwVgkcuheVi5VrwDk0v5Nge+vXKshI1nYAuEpDynLtJaR6+R
	biAxR9Wx+pAVnjc6CKJdJchjJ1k/AXbXq+6VRE3CFB6ggOYkpEqBBU4Mxxbl8iwfvAfzgSgq4SXSL
	g92VRCzyn7nw5fT7Q8Y+mEXAlI9PSbZP0T2nuodmRHaKI9C7RHww+NfX/oSVp//Hs4nrju5/969Rq
	9ab4XVZ/EeZp79z0nuOkzm9Nbul15Eg049TyghziNJsBEya+0hvFUf2Jk4QLh57dMBREjXtMJ72yu
	bz0bSRja/ySzKNqcyr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RgS-000wLN-1m;
	Mon, 27 Nov 2023 02:49:16 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RgO-000wID-1e
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 02:49:14 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cfafe3d46bso15153895ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 18:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701053351; x=1701658151; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKAcGhLjW+Mvs5EpwSa0BHJFl4vGnQQP4AO9iXzVC3M=;
        b=Ga4wfR9Nle3y3oiGw4LzG9XYXf1+iF9MdsOIP9fcqiDBWC3NhdoH9VST2QJyxKaweW
         jyigyndZeJrxoo59e7xv6nXiEDWEP8DnIRTJeBki9sFqWtmjrmUsx63b3hSntJmNWZ9j
         ji7AB5oBxnJfJfdqWEWygslHlQpNeaRXIcz2QbSGCA+M0wxtcl9FjMNxM2JekbpzzkLQ
         8hvv0OGf7sFKSfDmRPdn/bt8QyUIvafyLq+zksBpEnNoNa9xd+29bZ4rgGePDkJfEFIj
         hRWaKD4MMSGv0bevoestut39ADAo3LXxYVe33NASOINvUAdUpYkelNbQsitAXS87b3nW
         ZsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701053351; x=1701658151;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKAcGhLjW+Mvs5EpwSa0BHJFl4vGnQQP4AO9iXzVC3M=;
        b=XvGfijBXBy0pzesBQcheA4iuH79K9SooGNZ3w6PFckbgaKCdRmMznQ8YK+F+5FQO7b
         hIwOeuKbYMfBuZRU30DOXQrEdPh8l/qX3Lg6b552LTYxN7nyloUykMYTybf4tvCzMb8p
         xa+qV5+YCrRC3hvIEfi6IhXYbxNs7wfjXakDbfwtxBKPOKV4avSPhaWUmfGI/TVjvk8G
         033M5peO8Xe4S8WtypilV8Fyj4uXsmplOV+nq0nnN/NRE2OE6icgFyotAX7QRSUn0yrr
         UkmW8Z2pQscbFIq0P68oWWw/+exBmHZXnOnd1AYAQcdPEGl/IroTyTAhdZNnNhGyM67R
         FlFQ==
X-Gm-Message-State: AOJu0YxMrTpLEOHa0Hk60YL1IHS+BFhtFukNfwvyxFckmIg/EonWXr2t
	RfiWsK2BhAs8VLFUmPbnGHYLVw==
X-Google-Smtp-Source: AGHT+IEJDX1ywIRA2yybgn0V12rpBI4hcbgHrdWUbOpGdBuIKseg3QyOMxgm76BvwV0ixIdrwd6rOQ==
X-Received: by 2002:a17:902:9f87:b0:1cc:4e46:3e45 with SMTP id g7-20020a1709029f8700b001cc4e463e45mr11188671plq.49.1701053351105;
        Sun, 26 Nov 2023 18:49:11 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:95c7:2856:b238:775:b338? ([2402:7500:4ce:95c7:2856:b238:775:b338])
        by smtp.gmail.com with ESMTPSA id o4-20020a1709026b0400b001b898595be7sm7028182plk.291.2023.11.26.18.49.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 18:49:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 07/12] RISC-V: crypto: add Zvkg accelerated GCM GHASH
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231122014216.GI2172@sol.localdomain>
Date: Mon, 27 Nov 2023 10:49:05 +0800
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
Message-Id: <D1C10635-7799-4400-B85E-746D156D714A@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-8-jerry.shih@sifive.com>
 <20231122014216.GI2172@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_184912_584285_0BD87754 
X-CRM114-Status: GOOD (  21.29  )
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

On Nov 22, 2023, at 09:42, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:39AM +0800, Jerry Shih wrote:
>> +struct riscv64_ghash_context {
>> +	be128 key;
>> +};
>> +
>> +struct riscv64_ghash_desc_ctx {
>> +	be128 shash;
>> +	u8 buffer[GHASH_BLOCK_SIZE];
>> +	u32 bytes;
>> +};
> 
> I recommend calling the first struct 'riscv64_ghash_tfm_ctx', and making the
> pointers to it be named 'tctx'.  That would more clearly distinguish it from the
> desc_ctx / dctx.

Fixed.

>> +
>> +typedef void (*ghash_func)(be128 *Xi, const be128 *H, const u8 *inp,
>> +			   size_t len);
>> +
>> +static inline void ghash_blocks(const struct riscv64_ghash_context *ctx,
>> +				struct riscv64_ghash_desc_ctx *dctx,
>> +				const u8 *src, size_t srclen, ghash_func func)
>> +	if (crypto_simd_usable()) {
>> +		kernel_vector_begin();
>> +		func(&dctx->shash, &ctx->key, src, srclen);
>> +		kernel_vector_end();
> 
> The indirection to ghash_func is unnecessary, since the only value is
> gcm_ghash_rv64i_zvkg.
> 
> This also means that ghash_update() should be folded into ghash_update_zvkg(),
> and ghash_final() into ghash_final_zvkg().

Fixed. The `gcm_ghash_rv64i_zvkg()` is folded into `ghash_update_zvkg()` and
`ghash_final_zvkg()`.

>> +	} else {
>> +		while (srclen >= GHASH_BLOCK_SIZE) {
>> +			crypto_xor((u8 *)&dctx->shash, src, GHASH_BLOCK_SIZE);
>> +			gf128mul_lle(&dctx->shash, &ctx->key);
>> +			srclen -= GHASH_BLOCK_SIZE;
>> +			src += GHASH_BLOCK_SIZE;
>> +		}
>> +	}
> 
> The assembly code uses the equivalent of the following do-while loop instead:
> 
>        do {
>                srclen -= GHASH_BLOCK_SIZE;
>        } while (srclen);
> 
> I.e., it assumes the length here is nonzero and a multiple of 16, which it is.
> 
> To avoid confusion, I recommend making the C code use the same do-while loop.

Fixed.

>>       const struct riscv64_ghash_context *ctx =
>>              crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
> 
> crypto_tfm_ctx(crypto_shash_tfm(tfm)) should be crypto_shash_ctx(tfm)

Fixed.
But the original code do the same thing.

>> +static int ghash_final(struct shash_desc *desc, u8 *out, ghash_func func)
>> +{
>> +	const struct riscv64_ghash_context *ctx =
>> +		crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
>> +	struct riscv64_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
>> +	int i;
>> +
>> +	if (dctx->bytes) {
>> +		for (i = dctx->bytes; i < GHASH_BLOCK_SIZE; i++)
>> +			dctx->buffer[i] = 0;
>> +
>> +		ghash_blocks(ctx, dctx, dctx->buffer, GHASH_BLOCK_SIZE, func);
>> +		dctx->bytes = 0;
>> +	}
>> +
> 
> Setting dctx->bytes above is unnecessary.

Fixed.

>> +static int ghash_init(struct shash_desc *desc)
>> +{
>> +	struct riscv64_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
>> +
>> +	*dctx = (struct riscv64_ghash_desc_ctx){};
>> +
>> +	return 0;
>> +}
>> +
>> +static int ghash_update_zvkg(struct shash_desc *desc, const u8 *src,
>> +			     unsigned int srclen)
>> +{
>> +	return ghash_update(desc, src, srclen, gcm_ghash_rv64i_zvkg);
>> +}
>> +
>> +static int ghash_final_zvkg(struct shash_desc *desc, u8 *out)
>> +{
>> +	return ghash_final(desc, out, gcm_ghash_rv64i_zvkg);
>> +}
>> +
>> +static int ghash_setkey(struct crypto_shash *tfm, const u8 *key,
>> +			unsigned int keylen)
>> +{
>> +	struct riscv64_ghash_context *ctx =
>> +		crypto_tfm_ctx(crypto_shash_tfm(tfm));
>> +
>> +	if (keylen != GHASH_BLOCK_SIZE)
>> +		return -EINVAL;
>> +
>> +	memcpy(&ctx->key, key, GHASH_BLOCK_SIZE);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct shash_alg riscv64_ghash_alg_zvkg = {
>> +	.digestsize = GHASH_DIGEST_SIZE,
>> +	.init = ghash_init,
>> +	.update = ghash_update_zvkg,
>> +	.final = ghash_final_zvkg,
>> +	.setkey = ghash_setkey,
> 
> IMO it's helpful to order the shash functions as follows, both in their
> definitions and their fields in struct shash_alg:
> 
>    setkey
>    init
>    update
>    final
> 
> That matches the order in which they're called.

I have different opinion. I reorder the initialization in the order declared.
That will help us to check whether the function/member is missed.

> - Eric


-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
