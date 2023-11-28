Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD89C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6ZbWmjZjM8dbn/8WuzRUge3Ju6UbNrsn5PkTptR3sA=; b=B2xEa4mDHl/Vv8
	OjC4mWMQuTXjSixNPtkpwlKVTrAtmaGqxIlzBd2FhryeJ2R5xeINfeXnIx8kEvpHk2gCy0lVw9z/y
	iimFc+KyCXhnfMshJKJJFFb0s9yGParYuBcKBHvRTfj2GTA7JKdhwhm8gf6L9Sl3WFvMLMM9lxb/I
	IirqZR56aKc3coxXzVNSXNuqlUfCpNE+tnaZqO+ZE1E9wmVcZOEY6NwyAX3MhXHzpyR2rFSyWEE9d
	Ajc+v9UcuUe9e2VNdwLnVrI7EkoOvlFKMuWnTAYbP1G/3JuVtmGT91QkgkueMJmTuk1S+VMYPoW1O
	W9BqwPLyMVAGGI5fNeXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r81mk-005vKY-16;
	Tue, 28 Nov 2023 17:22:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r81mh-005vJU-1u
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 17:22:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE51F617D8;
	Tue, 28 Nov 2023 17:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE15C433C7;
	Tue, 28 Nov 2023 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701192126;
	bh=BxgWMmNBAAOSdm8WwYO/5VPHyP5a/HefoiG82LTsiXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IAOVcukNJWQoC/k0OdYjlcEP792sUnsYaWtVoTIo4iXOi/TA8Iw0d8UEWTi520RkM
	 jF5s+XnbodDqETNhdgXZoVG2xKlSu/WgD9Ywvix02FSGf+X68Bs62BvAH3YXfV0Rli
	 x9fCU1nlCNsaq0hwmvnUHSOkfPdf9a/3DNwprFErBki44OWBvyzB2N5durYIG7AA5F
	 FKnLRzcw+2Uy+/6ny2AxqcyvitfRO5Bzbu7gFaoJp0uro8GInmVlrBfEj7PmTPR6vX
	 lMhkqWuLynzYE/P6XcGaoIq0msxDNqxVW8Ew6Zqsb1VlWcBWEl3vchxLRTB7yvvl7N
	 hqq1vB0ELYDwQ==
Date: Tue, 28 Nov 2023 09:22:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, conor.dooley@microchip.com, ardb@kernel.org,
	heiko@sntech.de, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 05/13] crypto: simd - Update `walksize` in simd
 skcipher
Message-ID: <20231128172204.GB1148@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-6-jerry.shih@sifive.com>
 <20231128035814.GH1463@sol.localdomain>
 <56F07E23-CA7D-466B-84C7-643F2839E199@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56F07E23-CA7D-466B-84C7-643F2839E199@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_092207_714143_C7FCB591 
X-CRM114-Status: GOOD (  25.11  )
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

On Tue, Nov 28, 2023 at 01:38:29PM +0800, Jerry Shih wrote:
> On Nov 28, 2023, at 11:58, Eric Biggers <ebiggers@kernel.org> wrote:
> > On Mon, Nov 27, 2023 at 03:06:55PM +0800, Jerry Shih wrote:
> >> The `walksize` assignment is missed in simd skcipher.
> >> 
> >> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
> >> ---
> >> crypto/cryptd.c | 1 +
> >> crypto/simd.c   | 1 +
> >> 2 files changed, 2 insertions(+)
> >> 
> >> diff --git a/crypto/cryptd.c b/crypto/cryptd.c
> >> index bbcc368b6a55..253d13504ccb 100644
> >> --- a/crypto/cryptd.c
> >> +++ b/crypto/cryptd.c
> >> @@ -405,6 +405,7 @@ static int cryptd_create_skcipher(struct crypto_template *tmpl,
> >> 		(alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
> >> 	inst->alg.ivsize = crypto_skcipher_alg_ivsize(alg);
> >> 	inst->alg.chunksize = crypto_skcipher_alg_chunksize(alg);
> >> +	inst->alg.walksize = crypto_skcipher_alg_walksize(alg);
> >> 	inst->alg.min_keysize = crypto_skcipher_alg_min_keysize(alg);
> >> 	inst->alg.max_keysize = crypto_skcipher_alg_max_keysize(alg);
> >> 
> >> diff --git a/crypto/simd.c b/crypto/simd.c
> >> index edaa479a1ec5..ea0caabf90f1 100644
> >> --- a/crypto/simd.c
> >> +++ b/crypto/simd.c
> >> @@ -181,6 +181,7 @@ struct simd_skcipher_alg *simd_skcipher_create_compat(const char *algname,
> >> 
> >> 	alg->ivsize = ialg->ivsize;
> >> 	alg->chunksize = ialg->chunksize;
> >> +	alg->walksize = ialg->walksize;
> >> 	alg->min_keysize = ialg->min_keysize;
> >> 	alg->max_keysize = ialg->max_keysize;
> > 
> > What are the consequences of this bug?  I wonder if it actually matters?  The
> > "inner" algorithm is the one that actually gets used for the "walk", right?
> > 
> > - Eric
> 
> Without this, we might still use chunksize or cra_blocksize as the walksize
> even though we setup with the larger walksize.
> 
> Here is the code for the walksize default value:
> 	static int skcipher_prepare_alg(struct skcipher_alg *alg)
> 	{
> 		...
> 		if (!alg->chunksize)
> 			alg->chunksize = base->cra_blocksize;
> 		if (!alg->walksize)
> 			alg->walksize = alg->chunksize;
> 
> And we already have the bigger walksize for x86 aes-xts.
> 		.base = {
> 			.cra_name		= "__xts(aes)",
> 			...
> 		},
> 		.walksize	= 2 * AES_BLOCK_SIZE,
> 
> The x86 aes-xts only uses one `walk` to handle the tail elements. It assumes
> that the walksize contains 2 aes blocks. If walksize is not set correctly, maybe
> some tail elements is not processed in simd-cipher mode for x86 aes-xts.

With the SIMD helper there are three "algorithms": the underlying algorithm, the
cryptd algorithm, and the simd algorithm.  This patch makes the "walksize"
property be propagated from the underlying algorithm to the cryptd and simd
algorithms.  I don't see how that actually makes a difference, since the only
place the skcipher_walk happens is on the underlying algorithm.  So it uses the
"walksize" from the underlying algorithm, right?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
