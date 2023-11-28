Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FA9C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 04:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sezM+HzcNuOcEnp06zAgwgyV49vTkJxwx/7+MRXuHk=; b=t2rvo1lq7cMWNS
	NF/bqBSM455q8yBzeZgKj1mj1ayZNiEMRP4JHwmpzXlxpKIR/iXZuSTNncvIXxbwk4ntaTrHa1qPS
	bipknvbGLyGTN/WEy2QKY6CTfPe5dar3WRXDYs1Ah9ypnyzyloxHZC2GYVlE63yq0IMx4s+HUCqL2
	UB5U4wAyD139Ur1IW7Tzhnsbs4uLZaosHotOHQIxq9Stx7zKP/bjwLCUME1xvfWXdyEuwHjubRnKE
	r+FeTrTVNKsuowUGXkrg3wJX2aF99uYGo7qXKRR8EDc75ouM2R/SeJb/pABKcr4ZNdqhniT761Jka
	SZ+BQb171+L4KhVIguoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pNf-0041LM-1h;
	Tue, 28 Nov 2023 04:07:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pNb-0041KZ-1o
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 04:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B3F5FCE11BD;
	Tue, 28 Nov 2023 04:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2B1C433C7;
	Tue, 28 Nov 2023 04:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701144439;
	bh=V2rKuLTlh3qLJnd3xvBBMHtL+0fSAxw4uf0Z7xUqYvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=czIQF659i35wLPWZtbxx5n6+JFL9eXiHD6OAuVN/mbgn8XW6v+5P5y1PMeIjASfTV
	 s0zyWtW9BM21cQLAN7NClQvzbCaIj7DKkD4eglqDDcLVCC20qxd6ChG2Y89ql8GZae
	 vOPZMUlFJBLIF/q1OKOCxB5VEeIVJPHbNBcEuaTPQWHFPyYsKz075OFX4IUUaUR2GE
	 qqRJftkRLSHhE1xJ33cjoaMlb4t5jnly1PTxyNztXtr63zMtJ81ytmFZMa/UO4z6dw
	 MJKD59fZ98Z6zDcKn3AQKoTOhdJx4Iwa7tqoplMSXlWjsf4dvVd3koEdNWXC9xS5Lb
	 WqnnmqDVzGFLg==
Date: Mon, 27 Nov 2023 20:07:16 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 07/13] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231128040716.GI1463@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-8-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-8-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_200724_801261_14488F5B 
X-CRM114-Status: GOOD (  23.90  )
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

On Mon, Nov 27, 2023 at 03:06:57PM +0800, Jerry Shih wrote:
> +typedef void (*aes_xts_func)(const u8 *in, u8 *out, size_t length,
> +			     const struct crypto_aes_ctx *key, u8 *iv,
> +			     int update_iv);

There's no need for this indirection, because the function pointer can only have
one value.

Note also that when Control Flow Integrity is enabled, assembly functions can
only be called indirectly when they use SYM_TYPED_FUNC_START.  That's another
reason to avoid indirect calls that aren't actually necessary.

> +			nbytes &= (~(AES_BLOCK_SIZE - 1));

Expressions like ~(n - 1) should not have another set of parentheses around them

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
> +	 * We split xts-aes cryption into `head` and `tail` parts.
> +	 * The head block contains the input from the beginning which doesn't need
> +	 * `ciphertext stealing` method.
> +	 * The tail block contains at least two AES blocks including ciphertext
> +	 * stealing data from the end.
> +	 */
> +	if (req->cryptlen <= walk_size) {
> +		/*
> +		 * All data is in one `walk`. We could handle it within one AES-XTS call in
> +		 * the end.
> +		 */
> +		tail_bytes = req->cryptlen;
> +		head_bytes = 0;
> +	} else {
> +		if (req->cryptlen & (AES_BLOCK_SIZE - 1)) {
> +			/*
> +			 * with ciphertext stealing
> +			 *
> +			 * Find the largest tail size which is small than `walk` size while the
> +			 * head part still fits AES block boundary.
> +			 */
> +			tail_bytes = req->cryptlen & (AES_BLOCK_SIZE - 1);
> +			tail_bytes = walk_size + tail_bytes - AES_BLOCK_SIZE;
> +			head_bytes = req->cryptlen - tail_bytes;
> +		} else {
> +			/* no ciphertext stealing */
> +			tail_bytes = 0;
> +			head_bytes = req->cryptlen;
> +		}
> +	}
> +
> +	riscv64_aes_encrypt_zvkned(&ctx->ctx2, req->iv, req->iv);
> +
> +	if (head_bytes && tail_bytes) {
> +		/* If we have to parts, setup new request for head part only. */
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
> +			nbytes &= (~(AES_BLOCK_SIZE - 1));
> +			kernel_vector_begin();
> +			func(walk.src.virt.addr, walk.dst.virt.addr, nbytes,
> +			     &ctx->ctx1, req->iv, update_iv);
> +			kernel_vector_end();
> +
> +			err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
> +		}
> +		if (err || !tail_bytes)
> +			return err;
> +
> +		/*
> +		 * Setup new request for tail part.
> +		 * We use `scatterwalk_next()` to find the next scatterlist from last
> +		 * walk instead of iterating from the beginning.
> +		 */
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
> +	func(walk.src.virt.addr, walk.dst.virt.addr, walk.nbytes, &ctx->ctx1,
> +	     req->iv, 0);
> +	kernel_vector_end();
> +
> +	return skcipher_walk_done(&walk, 0);
> +}

Did you consider writing xts_crypt() the way that arm64 and x86 do it?  The
above seems to reinvent sort of the same thing from first principles.  I'm
wondering if you should just copy the existing approach for now.  Then there
would be no need to add the scatterwalk_next() function, and also the handling
of inputs that don't need ciphertext stealing would be a bit more streamlined.

> +static int __init riscv64_aes_block_mod_init(void)
> +{
> +	int ret = -ENODEV;
> +
> +	if (riscv_isa_extension_available(NULL, ZVKNED) &&
> +	    riscv_vector_vlen() >= 128 && riscv_vector_vlen() <= 2048) {
> +		ret = simd_register_skciphers_compat(
> +			riscv64_aes_algs_zvkned,
> +			ARRAY_SIZE(riscv64_aes_algs_zvkned),
> +			riscv64_aes_simd_algs_zvkned);
> +		if (ret)
> +			return ret;
> +
> +		if (riscv_isa_extension_available(NULL, ZVBB)) {
> +			ret = simd_register_skciphers_compat(
> +				riscv64_aes_alg_zvkned_zvkb,
> +				ARRAY_SIZE(riscv64_aes_alg_zvkned_zvkb),
> +				riscv64_aes_simd_alg_zvkned_zvkb);
> +			if (ret)
> +				goto unregister_zvkned;

This makes the registration of the zvkned-zvkb algorithm conditional on zvbb,
not zvkb.  Shouldn't the extension checks actually look like:

    ZVKNED
        ZVKB
            ZVBB && ZVKG
        
- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
