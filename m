Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2911C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 05:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xsm9avRQaokKPVZ3HQWT/wAzDjNFrHZjXUv3ZdpQd9o=; b=nYQ1QYW6zEeNzA
	D01sAHIDiz3UWi71yMfnIfwPYYu09v/pSGho9TUPHoQB4adCOboChSS74rRgpJ8wavorOce5y4ft2
	9Fs142+z38DG2j791Udyvfjz75Wc1ZWpyHSAdzb7G5jt7NDjBUTu4IGaR5WAxmQLYN9a0OXERDk9E
	Q/jxZTMqJLG5UQz2IOtTo8bzHZ8H/muPu8ugCKQeCv98fUTzqtE1xfECCcFtXcLU2iY1vd7ewBDFO
	8e1Kir98ELS44e3eDixxypPonCCJ+BKxcB7cAlk7n/Z6NEA9TbqNEJNeLziy6HdNtBp9rT0QAvEXC
	d4/tzkp84HjGHiPE75Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQ4W-008kLb-1c;
	Thu, 02 Nov 2023 05:16:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQ4S-008kKn-1O
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 05:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87F67CE1F31;
	Thu,  2 Nov 2023 05:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35137C433C8;
	Thu,  2 Nov 2023 05:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698902201;
	bh=CkuAO4YfABv6nx78RNeYwkWi8XTCIrEQLGEg/E2HryQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSYepTXPWoR7riWtRFAmmKQQiXRHmxeMoohJRM6BkLJCkcAMhVOZ0cSdG97H8j8V6
	 y9f1XRke/cmD38xmbDgTOw2vWKPYf4pqhWW+XSNfB26nOJEwU0/FvYTZa9E9qdBS7O
	 WC3M2Cu/4qsdWwxQrvF8qpAu3vskQL6bcWoG/kf25kll8Yw2cvvLIbedJwP4Wv2Chq
	 z1RGVvl4IV0hrLcIII8OFI139lUeY0uNi9RwKQKo+Ae20xJb2Juarh4X76vMhZCCrK
	 /cN3ZT6W/WymVFEybO+/l2+0M3igefmmqCfTu9CJ2P+Sy05tkrENxaote4Oiy+NzdE
	 G6z9zz6IW+hKA==
Date: Wed, 1 Nov 2023 22:16:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231102051639.GF1498@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025183644.8735-7-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_221644_821918_6584AE57 
X-CRM114-Status: GOOD (  23.70  )
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

On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
> +config CRYPTO_AES_BLOCK_RISCV64
> +	default y if RISCV_ISA_V
> +	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS"
> +	depends on 64BIT && RISCV_ISA_V
> +	select CRYPTO_AES_RISCV64
> +	select CRYPTO_SKCIPHER
> +	help
> +	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
> +	  with block cipher modes:
> +	  - ECB (Electronic Codebook) mode (NIST SP 800-38A)
> +	  - CBC (Cipher Block Chaining) mode (NIST SP 800-38A)
> +	  - CTR (Counter) mode (NIST SP 800-38A)
> +	  - XTS (XOR Encrypt XOR Tweakable Block Cipher with Ciphertext
> +	    Stealing) mode (NIST SP 800-38E and IEEE 1619)
> +
> +	  Architecture: riscv64 using:
> +	  - Zvbb vector extension (XTS)
> +	  - Zvkb vector crypto extension (CTR/XTS)
> +	  - Zvkg vector crypto extension (XTS)
> +	  - Zvkned vector crypto extension

Maybe list Zvkned first since it's the most important one in this context.

> +#define AES_BLOCK_VALID_SIZE_MASK (~(AES_BLOCK_SIZE - 1))
> +#define AES_BLOCK_REMAINING_SIZE_MASK (AES_BLOCK_SIZE - 1)

I think it would be easier to read if these values were just used directly.

> +static int ecb_encrypt(struct skcipher_request *req)
> +{
> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> +	const struct riscv64_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct skcipher_walk walk;
> +	unsigned int nbytes;
> +	int err;
> +
> +	/* If we have error here, the `nbytes` will be zero. */
> +	err = skcipher_walk_virt(&walk, req, false);
> +	while ((nbytes = walk.nbytes)) {
> +		kernel_vector_begin();
> +		rv64i_zvkned_ecb_encrypt(walk.src.virt.addr, walk.dst.virt.addr,
> +					 nbytes & AES_BLOCK_VALID_SIZE_MASK,
> +					 &ctx->key);
> +		kernel_vector_end();
> +		err = skcipher_walk_done(
> +			&walk, nbytes & AES_BLOCK_REMAINING_SIZE_MASK);
> +	}
> +
> +	return err;
> +}

There's no fallback for !crypto_simd_usable() here.  I really like it this way.
However, for it to work (for skciphers and aeads), RISC-V needs to allow the
vector registers to be used in softirq context.  Is that already the case?

> +/* ctr */
> +static int ctr_encrypt(struct skcipher_request *req)
> +{
> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> +	const struct riscv64_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct skcipher_walk walk;
> +	unsigned int ctr32;
> +	unsigned int nbytes;
> +	unsigned int blocks;
> +	unsigned int current_blocks;
> +	unsigned int current_length;
> +	int err;
> +
> +	/* the ctr iv uses big endian */
> +	ctr32 = get_unaligned_be32(req->iv + 12);
> +	err = skcipher_walk_virt(&walk, req, false);
> +	while ((nbytes = walk.nbytes)) {
> +		if (nbytes != walk.total) {
> +			nbytes &= AES_BLOCK_VALID_SIZE_MASK;
> +			blocks = nbytes / AES_BLOCK_SIZE;
> +		} else {
> +			/* This is the last walk. We should handle the tail data. */
> +			blocks = (nbytes + (AES_BLOCK_SIZE - 1)) /
> +				 AES_BLOCK_SIZE;

'(nbytes + (AES_BLOCK_SIZE - 1)) / AES_BLOCK_SIZE' can be replaced with
'DIV_ROUND_UP(nbytes, AES_BLOCK_SIZE)'

> +static int xts_crypt(struct skcipher_request *req, aes_xts_func func)
> +{
> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> +	const struct riscv64_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct skcipher_request sub_req;
> +	struct scatterlist sg_src[2], sg_dst[2];
> +	struct scatterlist *src, *dst;
> +	struct skcipher_walk walk;
> +	unsigned int walk_size = crypto_skcipher_walksize(tfm);
> +	unsigned int tail_bytes;
> +	unsigned int head_bytes;
> +	unsigned int nbytes;
> +	unsigned int update_iv = 1;
> +	int err;
> +
> +	/* xts input size should be bigger than AES_BLOCK_SIZE */
> +	if (req->cryptlen < AES_BLOCK_SIZE)
> +		return -EINVAL;
> +
> +	/*
> +	 * The tail size should be small than walk_size. Thus, we could make sure the
> +	 * walk size for tail elements could be bigger than AES_BLOCK_SIZE.
> +	 */
> +	if (req->cryptlen <= walk_size) {
> +		tail_bytes = req->cryptlen;
> +		head_bytes = 0;
> +	} else {
> +		if (req->cryptlen & AES_BLOCK_REMAINING_SIZE_MASK) {
> +			tail_bytes = req->cryptlen &
> +				     AES_BLOCK_REMAINING_SIZE_MASK;
> +			tail_bytes = walk_size + tail_bytes - AES_BLOCK_SIZE;
> +			head_bytes = req->cryptlen - tail_bytes;
> +		} else {
> +			tail_bytes = 0;
> +			head_bytes = req->cryptlen;
> +		}
> +	}
> +
> +	riscv64_aes_encrypt_zvkned(&ctx->ctx2, req->iv, req->iv);
> +
> +	if (head_bytes && tail_bytes) {
> +		skcipher_request_set_tfm(&sub_req, tfm);
> +		skcipher_request_set_callback(
> +			&sub_req, skcipher_request_flags(req), NULL, NULL);
> +		skcipher_request_set_crypt(&sub_req, req->src, req->dst,
> +					   head_bytes, req->iv);
> +		req = &sub_req;
> +	}
> +
> +	if (head_bytes) {
> +		err = skcipher_walk_virt(&walk, req, false);
> +		while ((nbytes = walk.nbytes)) {
> +			if (nbytes == walk.total)
> +				update_iv = (tail_bytes > 0);
> +
> +			nbytes &= AES_BLOCK_VALID_SIZE_MASK;
> +			kernel_vector_begin();
> +			func(walk.src.virt.addr, walk.dst.virt.addr, nbytes,
> +			     &ctx->ctx1.key, req->iv, update_iv);
> +			kernel_vector_end();
> +
> +			err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
> +		}
> +		if (err || !tail_bytes)
> +			return err;
> +
> +		dst = src = scatterwalk_next(sg_src, &walk.in);
> +		if (req->dst != req->src)
> +			dst = scatterwalk_next(sg_dst, &walk.out);
> +		skcipher_request_set_crypt(req, src, dst, tail_bytes, req->iv);
> +	}
> +
> +	/* tail */
> +	err = skcipher_walk_virt(&walk, req, false);
> +	if (err)
> +		return err;
> +	if (walk.nbytes != tail_bytes)
> +		return -EINVAL;
> +	kernel_vector_begin();
> +	func(walk.src.virt.addr, walk.dst.virt.addr, walk.nbytes,
> +	     &ctx->ctx1.key, req->iv, 0);
> +	kernel_vector_end();
> +
> +	return skcipher_walk_done(&walk, 0);
> +}

This function looks a bit weird.  I see it's also the only caller of the
scatterwalk_next() function that you're adding.  I haven't looked at this super
closely, but I expect that there's a cleaner way of handling the "tail" than
this -- maybe use scatterwalk_map_and_copy() to copy from/to a stack buffer?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
