Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D538C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 03:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBANEp2DQyqiWburvnayJuX/OQNgqJzH/j9n1vEmEhQ=; b=2agvcjh1JRdYDH
	RPJmJcf/D3ugT26yNuhevdpm6LM8etq994xEOM3rh4TTWz3vYXBFSERyOevXwHzR00GwzLFLDeDWU
	zCn3ti+p1d9EvxGbFs7csaLdu4A1BFdbuVWHYgb08ytJLZ+KQSSDqn//sFHULkcL+yjgRzBlGYKG5
	1jLdi9IvwbVaavFW7sg6P2uGNVUe01RabSDU6sBsiRsOSyIfZw0ldIliplNh/BtdkfdBkUuY305Pg
	dtzLC9oFLBCZHRCrlyO3QsOtERcetQJA2CkEVHGeeOcLXTdSKTZhEBU1ekZG7nbFu8HZp0hcnQ5ZD
	ljz4mT2aZ0iEkOXY9G8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pEs-0040aS-2Z;
	Tue, 28 Nov 2023 03:58:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pEq-0040Zc-0m
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 03:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4284E61500;
	Tue, 28 Nov 2023 03:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808A6C433C9;
	Tue, 28 Nov 2023 03:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701143896;
	bh=klY2qd5BBTUFI2nKApEyF/o8Si9A4Wtb/ZgzMzwBObU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzevbdpqhmhpmwTwMiKkHq1bskohNUwuQfXQeOf7Ch/TVNVhZeVRK1CT1GjSQOmoF
	 C6bhekI0ZJVb1FVTvBskim8XI7ZODFyyf8iuS9eeCnyBMmkcu6VE3HnRAoAE2TH7UZ
	 KI7oVZ+kXnp8gby6MaWucK8q7ZgmwCim2keIlGrl1Dsknz9XJTTDbEJ7gWc/puMijd
	 9q4ekHg9SVrHHlIiSPuty/WEaZ94iY0t6L7lU3fe+8Bfkn6FnNxVFpZKnpXnbDh2Q/
	 4W0BjIlI4QU7x0Mt+wRtDzeFPZ8ka7d7mEsacC6BpgevdejvAbOXC9Kheb/q5UpD2O
	 LQi7JQFnaXHAw==
Date: Mon, 27 Nov 2023 19:58:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 05/13] crypto: simd - Update `walksize` in simd
 skcipher
Message-ID: <20231128035814.GH1463@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-6-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-6-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_195820_320038_0DDCB4A1 
X-CRM114-Status: GOOD (  14.15  )
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

On Mon, Nov 27, 2023 at 03:06:55PM +0800, Jerry Shih wrote:
> The `walksize` assignment is missed in simd skcipher.
> 
> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
> ---
>  crypto/cryptd.c | 1 +
>  crypto/simd.c   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/crypto/cryptd.c b/crypto/cryptd.c
> index bbcc368b6a55..253d13504ccb 100644
> --- a/crypto/cryptd.c
> +++ b/crypto/cryptd.c
> @@ -405,6 +405,7 @@ static int cryptd_create_skcipher(struct crypto_template *tmpl,
>  		(alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
>  	inst->alg.ivsize = crypto_skcipher_alg_ivsize(alg);
>  	inst->alg.chunksize = crypto_skcipher_alg_chunksize(alg);
> +	inst->alg.walksize = crypto_skcipher_alg_walksize(alg);
>  	inst->alg.min_keysize = crypto_skcipher_alg_min_keysize(alg);
>  	inst->alg.max_keysize = crypto_skcipher_alg_max_keysize(alg);
>  
> diff --git a/crypto/simd.c b/crypto/simd.c
> index edaa479a1ec5..ea0caabf90f1 100644
> --- a/crypto/simd.c
> +++ b/crypto/simd.c
> @@ -181,6 +181,7 @@ struct simd_skcipher_alg *simd_skcipher_create_compat(const char *algname,
>  
>  	alg->ivsize = ialg->ivsize;
>  	alg->chunksize = ialg->chunksize;
> +	alg->walksize = ialg->walksize;
>  	alg->min_keysize = ialg->min_keysize;
>  	alg->max_keysize = ialg->max_keysize;

What are the consequences of this bug?  I wonder if it actually matters?  The
"inner" algorithm is the one that actually gets used for the "walk", right?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
