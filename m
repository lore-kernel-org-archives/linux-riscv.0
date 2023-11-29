Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F23C07CB1
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 07:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zvq/n9HmyIZnvbVhtDmS3puJye2LQVpSckMSST3CaMA=; b=RvPG3ChSg8p68L
	KhPRveMRLDnznvoLDuhIvKwF8YkwZSwWMoCERPP0x/EjD2LLsnO4L6v76kG+7kvQfgxZLSBc8hXjB
	/ASm4AnL0JPqt1DCS6tnQka6LGWCvp+hc9uVo1wUc86Lz7mAN77A4JSo9YM7qbkZr3kvziR6FL74U
	grWP+wvD3W2wiJdQQxy2rzcU/Vnf7EJyRA9s55LZxlmyyCtBgDMvCUE1wfLpv39UMGcbCoZf8JcYh
	IyQRD+BQCULwQF4WZENJSe8JwEJmj7bbyWSdxs1/9pkBrjMvERPwYHk34zpN8kG8g7hCQouyXYbBb
	V/W4ERqg5uG3jFCYMD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8FRy-007POF-2g;
	Wed, 29 Nov 2023 07:57:38 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8FRu-007PMu-2u
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 07:57:36 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6cdd584591eso185010b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 23:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701244651; x=1701849451; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFsbRvr1vOPA+ZRf+5P8m2yK/OJ4On0HVxmuOdxj8N8=;
        b=Ejh4vazgqOPb1HL8M0+NV2TAIdOBsihiLFCoAtFZ0c7mRmEBJMnFLfu8BM3N0rbMqz
         Stxcym5Dtfvh2VTkKegyyFbDOZ5a0Ygatakc9rlJadlEwBISqit2HSAylzt18tAukX2O
         kEVe+wLPTZVT9/SqiuoaEzMmCXwHHKqOtQGq4+3X3JB2cE14mR5p4aFZhsrtxAohZUmE
         K2JQb/B5oLZi40KxTFNiv36MaiDrGbpjW7HXsZWCs18T0sLsWgwM9umBztzd1JQMgEYA
         CHgW4pKHoJL5ej0LSOHzGQKAccp1k2Itqdd7WcGGLtE0y6ys/7Znrw1SCN6pkwtJJP5m
         zOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701244651; x=1701849451;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFsbRvr1vOPA+ZRf+5P8m2yK/OJ4On0HVxmuOdxj8N8=;
        b=YTsEvTEzhYE64vFpanIfVdwdnEedjW8bKaCw8dkhOx/6w45DS49IU0sWpKa1IBuKKH
         hWmYyycyqT2WQEROQuf3rb+UIH8U2VbYPT0VeBVz/FfZ7yX+xUsmQuZOkFCw3Yz+Vti1
         cY1jcT84nRA9rYeDbDims5hOOZSJxOrWTD1sdhJ9MpX0RpC5v4P8/xvT7iQ7ZKE+gK3q
         WXqrW9ch4/ulxNs5WOfLHN/4VlUCdEFSt5lV/DjqJPwVudWUz5iCP7GnverfxLl1fRWP
         PhiCtaM7zOa0qlttn863vHDukZDKLb1+ofqcKmq/zl7OPcUY3fLIZs1jEXERwJIMivpN
         JyJQ==
X-Gm-Message-State: AOJu0Yxtg+XEwtzSUREyqSNDAaEqyQI20LnQZk46s3bxsiGn5T5BkAUH
	aTizTy92FGE9nAedbQA3iI/U4ugJSekNbkvMefM=
X-Google-Smtp-Source: AGHT+IFK4o7xUXoWtsBPJh1GLeZc4kKnL2/MBs6AJBx/ToMjyQ9ACg9+9TEtywTSU4pBWYPIrKdNTA==
X-Received: by 2002:a05:6a00:1914:b0:68f:f38d:f76c with SMTP id y20-20020a056a00191400b0068ff38df76cmr19199016pfi.6.1701244650952;
        Tue, 28 Nov 2023 23:57:30 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:5a34:455:7149:7e47:1d5b? ([2402:7500:4ce:5a34:455:7149:7e47:1d5b])
        by smtp.gmail.com with ESMTPSA id f44-20020a056a000b2c00b006c4d1bb81d6sm10096862pfu.67.2023.11.28.23.57.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Nov 2023 23:57:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 07/13] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231128040716.GI1463@sol.localdomain>
Date: Wed, 29 Nov 2023 15:57:25 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 ardb@kernel.org,
 heiko@sntech.de,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <7DFBB20D-B8D4-409B-8562-4C60E67FD279@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-8-jerry.shih@sifive.com>
 <20231128040716.GI1463@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_235734_942205_9FD2E5C6 
X-CRM114-Status: GOOD (  27.82  )
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

On Nov 28, 2023, at 12:07, Eric Biggers <ebiggers@kernel.org> wrote:
> On Mon, Nov 27, 2023 at 03:06:57PM +0800, Jerry Shih wrote:
>> +typedef void (*aes_xts_func)(const u8 *in, u8 *out, size_t length,
>> +			     const struct crypto_aes_ctx *key, u8 *iv,
>> +			     int update_iv);
> 
> There's no need for this indirection, because the function pointer can only have
> one value.
> 
> Note also that when Control Flow Integrity is enabled, assembly functions can
> only be called indirectly when they use SYM_TYPED_FUNC_START.  That's another
> reason to avoid indirect calls that aren't actually necessary.

We have two function pointers for encryption and decryption.
	static int xts_encrypt(struct skcipher_request *req)
	{
		return xts_crypt(req, rv64i_zvbb_zvkg_zvkned_aes_xts_encrypt);
	}

	static int xts_decrypt(struct skcipher_request *req)
	{
		return xts_crypt(req, rv64i_zvbb_zvkg_zvkned_aes_xts_decrypt);
	}
The enc and dec path could be folded together into `xts_crypt()`, but we will have
additional branches for enc/decryption path if we don't want to have the indirect calls.
Use `SYM_TYPED_FUNC_START` in asm might be better.

>> +			nbytes &= (~(AES_BLOCK_SIZE - 1));
> 
> Expressions like ~(n - 1) should not have another set of parentheses around them

Fixed.

>> +static int xts_crypt(struct skcipher_request *req, aes_xts_func func)
>> +{
>> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
>> +	const struct riscv64_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
>> +	struct skcipher_request sub_req;
>> +	struct scatterlist sg_src[2], sg_dst[2];
>> +	struct scatterlist *src, *dst;
>> +	struct skcipher_walk walk;
>> +	unsigned int walk_size = crypto_skcipher_walksize(tfm);
>> +	unsigned int tail_bytes;
>> +	unsigned int head_bytes;
>> +	unsigned int nbytes;
>> +	unsigned int update_iv = 1;
>> +	int err;
>> +
>> +	/* xts input size should be bigger than AES_BLOCK_SIZE */
>> +	if (req->cryptlen < AES_BLOCK_SIZE)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * We split xts-aes cryption into `head` and `tail` parts.
>> +	 * The head block contains the input from the beginning which doesn't need
>> +	 * `ciphertext stealing` method.
>> +	 * The tail block contains at least two AES blocks including ciphertext
>> +	 * stealing data from the end.
>> +	 */
>> +	if (req->cryptlen <= walk_size) {
>> +		/*
>> +		 * All data is in one `walk`. We could handle it within one AES-XTS call in
>> +		 * the end.
>> +		 */
>> +		tail_bytes = req->cryptlen;
>> +		head_bytes = 0;
>> +	} else {
>> +		if (req->cryptlen & (AES_BLOCK_SIZE - 1)) {
>> +			/*
>> +			 * with ciphertext stealing
>> +			 *
>> +			 * Find the largest tail size which is small than `walk` size while the
>> +			 * head part still fits AES block boundary.
>> +			 */
>> +			tail_bytes = req->cryptlen & (AES_BLOCK_SIZE - 1);
>> +			tail_bytes = walk_size + tail_bytes - AES_BLOCK_SIZE;
>> +			head_bytes = req->cryptlen - tail_bytes;
>> +		} else {
>> +			/* no ciphertext stealing */
>> +			tail_bytes = 0;
>> +			head_bytes = req->cryptlen;
>> +		}
>> +	}
>> +
>> +	riscv64_aes_encrypt_zvkned(&ctx->ctx2, req->iv, req->iv);
>> +
>> +	if (head_bytes && tail_bytes) {
>> +		/* If we have to parts, setup new request for head part only. */
>> +		skcipher_request_set_tfm(&sub_req, tfm);
>> +		skcipher_request_set_callback(
>> +			&sub_req, skcipher_request_flags(req), NULL, NULL);
>> +		skcipher_request_set_crypt(&sub_req, req->src, req->dst,
>> +					   head_bytes, req->iv);
>> +		req = &sub_req;
>> +	}
>> +
>> +	if (head_bytes) {
>> +		err = skcipher_walk_virt(&walk, req, false);
>> +		while ((nbytes = walk.nbytes)) {
>> +			if (nbytes == walk.total)
>> +				update_iv = (tail_bytes > 0);
>> +
>> +			nbytes &= (~(AES_BLOCK_SIZE - 1));
>> +			kernel_vector_begin();
>> +			func(walk.src.virt.addr, walk.dst.virt.addr, nbytes,
>> +			     &ctx->ctx1, req->iv, update_iv);
>> +			kernel_vector_end();
>> +
>> +			err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
>> +		}
>> +		if (err || !tail_bytes)
>> +			return err;
>> +
>> +		/*
>> +		 * Setup new request for tail part.
>> +		 * We use `scatterwalk_next()` to find the next scatterlist from last
>> +		 * walk instead of iterating from the beginning.
>> +		 */
>> +		dst = src = scatterwalk_next(sg_src, &walk.in);
>> +		if (req->dst != req->src)
>> +			dst = scatterwalk_next(sg_dst, &walk.out);
>> +		skcipher_request_set_crypt(req, src, dst, tail_bytes, req->iv);
>> +	}
>> +
>> +	/* tail */
>> +	err = skcipher_walk_virt(&walk, req, false);
>> +	if (err)
>> +		return err;
>> +	if (walk.nbytes != tail_bytes)
>> +		return -EINVAL;
>> +	kernel_vector_begin();
>> +	func(walk.src.virt.addr, walk.dst.virt.addr, walk.nbytes, &ctx->ctx1,
>> +	     req->iv, 0);
>> +	kernel_vector_end();
>> +
>> +	return skcipher_walk_done(&walk, 0);
>> +}
> 
> Did you consider writing xts_crypt() the way that arm64 and x86 do it?  The
> above seems to reinvent sort of the same thing from first principles.  I'm
> wondering if you should just copy the existing approach for now.  Then there
> would be no need to add the scatterwalk_next() function, and also the handling
> of inputs that don't need ciphertext stealing would be a bit more streamlined.

I will check the arm and x86's implementations.
But the `scatterwalk_next()` proposed in this series does the same thing as the
call `scatterwalk_ffwd()` in arm and x86's implementations.
The scatterwalk_ffwd() iterates from the beginning of scatterlist(O(n)), but the 
scatterwalk_next() is just iterates from the end point of the last used
scatterlist(O(1)).

>> +static int __init riscv64_aes_block_mod_init(void)
>> +{
>> +	int ret = -ENODEV;
>> +
>> +	if (riscv_isa_extension_available(NULL, ZVKNED) &&
>> +	    riscv_vector_vlen() >= 128 && riscv_vector_vlen() <= 2048) {
>> +		ret = simd_register_skciphers_compat(
>> +			riscv64_aes_algs_zvkned,
>> +			ARRAY_SIZE(riscv64_aes_algs_zvkned),
>> +			riscv64_aes_simd_algs_zvkned);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (riscv_isa_extension_available(NULL, ZVBB)) {
>> +			ret = simd_register_skciphers_compat(
>> +				riscv64_aes_alg_zvkned_zvkb,
>> +				ARRAY_SIZE(riscv64_aes_alg_zvkned_zvkb),
>> +				riscv64_aes_simd_alg_zvkned_zvkb);
>> +			if (ret)
>> +				goto unregister_zvkned;
> 
> This makes the registration of the zvkned-zvkb algorithm conditional on zvbb,
> not zvkb.  Shouldn't the extension checks actually look like:
> 
>    ZVKNED
>        ZVKB
>            ZVBB && ZVKG

Fixed.
But we will have the conditions like:
	if(ZVKNED) {
		reg_cipher_1();
		if(ZVKB) {
			reg_cipher_2();
		}
		if (ZVBB && ZVKG) {
			reg_cipher_3();
		}
	}

> - Eric


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
