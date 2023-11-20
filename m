Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC25C5ACB3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 02:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKg1VeUMUSBnzH+cISHuRrOJe5yhOSpjfMuCK9/2LO0=; b=Cro+6Ri62XJ22K
	3dYOnnXbrgNrh1uH00VrSjPSjAeu26RpSEQgB9ZsJ977YMQLaI6aeCmODGQiCkWbh6R09pWo1agTS
	mwBL7PiXD4ZRe0uAenRbo3ZiFDJLQdoScELr+QVug+YgWsgzys2V6VTz7AueIjFeG2sFCRxXgD7Fx
	/krI5TvjMRLQmV5jlRN76dVz/N04kORmp5y1tMlVHcN7gbpn2cNALgn7mOjdYoNxLn28YtVB1thIL
	TsIi45Ts+SJIYzFo2sNkCTEb7SGTkAKQgUUkmQ3hHCZ/dYr9k5gtYrQEwpusjA+Q/d6D35iCYInMT
	hNNpIDZ2WJtiWRVg8pNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uK5-00AyHI-2z;
	Mon, 20 Nov 2023 02:47:42 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uK2-00AyGq-0R
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 02:47:40 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6ce2ea3a944so2593480a34.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 18:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700448456; x=1701053256; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU/ggVYx2HP9QVrpc118lNpu44S80Eqnc57DemebZM8=;
        b=N0soi5h5049c7/fOmCoap6XqpJZxiyA2il3k2b25AtJdsyawh3N49Dke4EjeIoUCs2
         UVw6ZmobSPkBlln4R3ieS4eiGLAV+0Xj+s65qEdJgZu9ZU3G8Gx0nKBrxLjjFNJE9fi8
         ZK/jGaT4e6i5ay0WxrsJtpq83jjFracIsVHOqZok5f5e3pwkt4Zqqqw/3p7hKHVqpB6u
         eH4SSXiuI2CCvsSlOYbnU5+cgT+ZLfKgi6nkEBa407ZU5JWzsgYjRjVtqbNzOUPeSx8Y
         wfC1mUKcUjq9nbwLcmr+G77UGU/sW47htlDUMvQkA+mfufxuT454Jr4J2uNa+PRafj28
         VmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700448456; x=1701053256;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VU/ggVYx2HP9QVrpc118lNpu44S80Eqnc57DemebZM8=;
        b=pGrms/EUVRQXgdIGpA7ryxvDbiNcKXsTxskaGmR/GXfCvvdyooVwAfGWEhN7y8hK3p
         m1cwKlxrI+C4EcMbLgERPPRdGdA2gr0esvHxtHy86GSFsrmvD8CbDdIcayUxBJujgrFW
         IKNjpJmijaTdHqqA9MOLw5PQ8nWkJzCKBu0sfV6d3DIGgFWnl4CS9hpt1x97tex3AM/5
         L6I/as1KhKidIYA1L/ryin85V/wWogXd0c/jNcxeIU/kaQN+zCFPhgj1YsEIU0s3sdD9
         9ASBwUUsICn0aibjQMLZYX8Pjf86Kd5zg9SLvDdQsT5Apq37QLkY092gUHO9iq8E38F6
         JZ4Q==
X-Gm-Message-State: AOJu0YxBLL3z6+jJyxzzBtqppMRvKlhVvvuiaRQPQ92OOmDloDgtXEUS
	ouAMImEZbfI+pE3oBHi4CVAtmw==
X-Google-Smtp-Source: AGHT+IG2yVOZskv7kdmEs8Y1YsZ/XPgdjGJmM54ZpbOJcfIJtiwxdqNWPxS3wLqNO1ObFLA2tMXR5Q==
X-Received: by 2002:a05:6870:a489:b0:1ef:b16f:d294 with SMTP id j9-20020a056870a48900b001efb16fd294mr7688617oal.38.1700448456607;
        Sun, 19 Nov 2023 18:47:36 -0800 (PST)
Received: from ?IPv6:2402:7500:5d5:bc21:3420:fefa:20d4:2a2f? ([2402:7500:5d5:bc21:3420:fefa:20d4:2a2f])
        by smtp.gmail.com with ESMTPSA id j2-20020a056a00234200b006cb638ba1aasm2599324pfj.49.2023.11.19.18.47.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Nov 2023 18:47:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS
 implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231102051639.GF1498@sol.localdomain>
Date: Mon, 20 Nov 2023 10:47:29 +0800
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
Message-Id: <267FDF51-7720-40AC-9416-B5361C45393B@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_184738_203161_63F6F22B 
X-CRM114-Status: GOOD (  24.99  )
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

On Nov 2, 2023, at 13:16, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
>> +config CRYPTO_AES_BLOCK_RISCV64
>> +	default y if RISCV_ISA_V
>> +	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS"
>> +	depends on 64BIT && RISCV_ISA_V
>> +	select CRYPTO_AES_RISCV64
>> +	select CRYPTO_SKCIPHER
>> +	help
>> +	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
>> +	  with block cipher modes:
>> +	  - ECB (Electronic Codebook) mode (NIST SP 800-38A)
>> +	  - CBC (Cipher Block Chaining) mode (NIST SP 800-38A)
>> +	  - CTR (Counter) mode (NIST SP 800-38A)
>> +	  - XTS (XOR Encrypt XOR Tweakable Block Cipher with Ciphertext
>> +	    Stealing) mode (NIST SP 800-38E and IEEE 1619)
>> +
>> +	  Architecture: riscv64 using:
>> +	  - Zvbb vector extension (XTS)
>> +	  - Zvkb vector crypto extension (CTR/XTS)
>> +	  - Zvkg vector crypto extension (XTS)
>> +	  - Zvkned vector crypto extension
> 
> Maybe list Zvkned first since it's the most important one in this context.

Fixed.


>> +#define AES_BLOCK_VALID_SIZE_MASK (~(AES_BLOCK_SIZE - 1))
>> +#define AES_BLOCK_REMAINING_SIZE_MASK (AES_BLOCK_SIZE - 1)
> 
> I think it would be easier to read if these values were just used directly.

Fixed.

>> +static int ecb_encrypt(struct skcipher_request *req)
>> +{
>> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
>> +	const struct riscv64_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
>> +	struct skcipher_walk walk;
>> +	unsigned int nbytes;
>> +	int err;
>> +
>> +	/* If we have error here, the `nbytes` will be zero. */
>> +	err = skcipher_walk_virt(&walk, req, false);
>> +	while ((nbytes = walk.nbytes)) {
>> +		kernel_vector_begin();
>> +		rv64i_zvkned_ecb_encrypt(walk.src.virt.addr, walk.dst.virt.addr,
>> +					 nbytes & AES_BLOCK_VALID_SIZE_MASK,
>> +					 &ctx->key);
>> +		kernel_vector_end();
>> +		err = skcipher_walk_done(
>> +			&walk, nbytes & AES_BLOCK_REMAINING_SIZE_MASK);
>> +	}
>> +
>> +	return err;
>> +}
> 
> There's no fallback for !crypto_simd_usable() here.  I really like it this way.
> However, for it to work (for skciphers and aeads), RISC-V needs to allow the
> vector registers to be used in softirq context.  Is that already the case?

I turn to use simd skcipher interface. More details will be in the v2 patch set.

>> +/* ctr */
>> +static int ctr_encrypt(struct skcipher_request *req)
>> +{
>> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
>> +	const struct riscv64_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
>> +	struct skcipher_walk walk;
>> +	unsigned int ctr32;
>> +	unsigned int nbytes;
>> +	unsigned int blocks;
>> +	unsigned int current_blocks;
>> +	unsigned int current_length;
>> +	int err;
>> +
>> +	/* the ctr iv uses big endian */
>> +	ctr32 = get_unaligned_be32(req->iv + 12);
>> +	err = skcipher_walk_virt(&walk, req, false);
>> +	while ((nbytes = walk.nbytes)) {
>> +		if (nbytes != walk.total) {
>> +			nbytes &= AES_BLOCK_VALID_SIZE_MASK;
>> +			blocks = nbytes / AES_BLOCK_SIZE;
>> +		} else {
>> +			/* This is the last walk. We should handle the tail data. */
>> +			blocks = (nbytes + (AES_BLOCK_SIZE - 1)) /
>> +				 AES_BLOCK_SIZE;
> 
> '(nbytes + (AES_BLOCK_SIZE - 1)) / AES_BLOCK_SIZE' can be replaced with
> 'DIV_ROUND_UP(nbytes, AES_BLOCK_SIZE)'

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
>> +	 * The tail size should be small than walk_size. Thus, we could make sure the
>> +	 * walk size for tail elements could be bigger than AES_BLOCK_SIZE.
>> +	 */
>> +	if (req->cryptlen <= walk_size) {
>> +		tail_bytes = req->cryptlen;
>> +		head_bytes = 0;
>> +	} else {
>> +		if (req->cryptlen & AES_BLOCK_REMAINING_SIZE_MASK) {
>> +			tail_bytes = req->cryptlen &
>> +				     AES_BLOCK_REMAINING_SIZE_MASK;
>> +			tail_bytes = walk_size + tail_bytes - AES_BLOCK_SIZE;
>> +			head_bytes = req->cryptlen - tail_bytes;
>> +		} else {
>> +			tail_bytes = 0;
>> +			head_bytes = req->cryptlen;
>> +		}
>> +	}
>> +
>> +	riscv64_aes_encrypt_zvkned(&ctx->ctx2, req->iv, req->iv);
>> +
>> +	if (head_bytes && tail_bytes) {
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
>> +			nbytes &= AES_BLOCK_VALID_SIZE_MASK;
>> +			kernel_vector_begin();
>> +			func(walk.src.virt.addr, walk.dst.virt.addr, nbytes,
>> +			     &ctx->ctx1.key, req->iv, update_iv);
>> +			kernel_vector_end();
>> +
>> +			err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
>> +		}
>> +		if (err || !tail_bytes)
>> +			return err;
>> +
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
>> +	func(walk.src.virt.addr, walk.dst.virt.addr, walk.nbytes,
>> +	     &ctx->ctx1.key, req->iv, 0);
>> +	kernel_vector_end();
>> +
>> +	return skcipher_walk_done(&walk, 0);
>> +}
> 
> This function looks a bit weird.  I see it's also the only caller of the
> scatterwalk_next() function that you're adding.  I haven't looked at this super
> closely, but I expect that there's a cleaner way of handling the "tail" than
> this -- maybe use scatterwalk_map_and_copy() to copy from/to a stack buffer?
> 
> - Eric

I put more comments in v2 patch set. Hope it will be more clear.
Even though we use `scatterwalk_map_and_copy()`, it still use
`scatterwalk_ffwd()` inside. The `scatterwalk_next()` is used
for just `moving the next scatterlist` from from the previous
walk instead of iterating from the head.

-Jerry


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
