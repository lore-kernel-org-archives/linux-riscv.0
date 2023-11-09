Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB99C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 07:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBKi8Ovr7zJ8bM6JQGyLNZ7DhfUP3ulgtP88fEpQCPY=; b=km6O0ELevhNeyB
	D0Jsltl6OHdUglZ8PbySt/SDmK5mMdAcigRf6xhEwFIqDyHFG+O7z6lNPxkUlSV9NCQeaLwrI3AEy
	24wW4/SBHlSFebyRQ3zeD/7q5GqJY29qAb6W/URqmKs5l3CD0+WO4comZ2d47P5CxVqc5nIMYp1OW
	txyQl1Bqn114BpHrhHdxKEPReDFBfuffj8jWaKCxCny/rl/LW/kR3DydDyfWvC91Sb3E8v9lL3kK1
	EeYQedAuRP7udM3YCFEoxMnanND4XsyTnCthipEMV5J2o5Mk+dS8S6Oz+TRTwDxY1Tr41g4FD994T
	y396U6dx+m/nCGynSD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zHD-005U3X-2K;
	Thu, 09 Nov 2023 07:16:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zHB-005U2r-06
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 07:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 00CB5B81F03;
	Thu,  9 Nov 2023 07:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDEAC433C7;
	Thu,  9 Nov 2023 07:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699514186;
	bh=bXtq92H2lB9I1j4FNYbEXcH9mwbTZ3yucWnUpEsvSu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b53gh+xjIAMX5TIJgr2iD0QbJEC/4hWxmS8AAAUQYv7lmKQ9umk4k9gi9TCo1tw+M
	 svu0/XvTdxJaZQA0lEBUbNkhDZB/L1yO9RA6pzgMHzL6rEnaRyljRDVxg2mQfwkCwh
	 Kv/B2Oi0+gdx5gHMETqbd4aS93Zdnt7J811QH/+cqB+9Lk1LrOyy+haKhyJ6jNUiep
	 9Ifm795/MqeHQa93xPifVoL7kn+wWIxkH0HqpRVGVzcuJr3ayofZwDBrg1uTL6a4Ys
	 ut7HSxk6F8+NeWPjlRw4F3AaE6eagdYCANS8dzcSjXNf+WbLnKeBmxj/B1XCS0JIRC
	 Vw9az8ujLLo9w==
Date: Wed, 8 Nov 2023 23:16:23 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231109071623.GB1245@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
 <39126F19-8FEB-4E18-B61D-4494B59C43A1@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39126F19-8FEB-4E18-B61D-4494B59C43A1@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_231629_240736_09524AF5 
X-CRM114-Status: GOOD (  21.39  )
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

On Tue, Nov 07, 2023 at 04:53:13PM +0800, Jerry Shih wrote:
> On Nov 2, 2023, at 13:16, Eric Biggers <ebiggers@kernel.org> wrote:
> > On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
> >> +static int ecb_encrypt(struct skcipher_request *req)
> >> +{
> >> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> >> +	const struct riscv64_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
> >> +	struct skcipher_walk walk;
> >> +	unsigned int nbytes;
> >> +	int err;
> >> +
> >> +	/* If we have error here, the `nbytes` will be zero. */
> >> +	err = skcipher_walk_virt(&walk, req, false);
> >> +	while ((nbytes = walk.nbytes)) {
> >> +		kernel_vector_begin();
> >> +		rv64i_zvkned_ecb_encrypt(walk.src.virt.addr, walk.dst.virt.addr,
> >> +					 nbytes & AES_BLOCK_VALID_SIZE_MASK,
> >> +					 &ctx->key);
> >> +		kernel_vector_end();
> >> +		err = skcipher_walk_done(
> >> +			&walk, nbytes & AES_BLOCK_REMAINING_SIZE_MASK);
> >> +	}
> >> +
> >> +	return err;
> >> +}
> > 
> > There's no fallback for !crypto_simd_usable() here.  I really like it this way.
> > However, for it to work (for skciphers and aeads), RISC-V needs to allow the
> > vector registers to be used in softirq context.  Is that already the case?
> 
> The kernel-mode-vector could be enabled in softirq, but we don't have nesting
> vector contexts. Will we have the case that kernel needs to jump to softirq for
> encryptions during the regular crypto function? If yes, we need to have fallbacks
> for all algorithms.

Are you asking what happens if a softirq is taken while the CPU is between
kernel_vector_begin() and kernel_vector_end()?  I think that needs to be
prevented by making kernel_vector_begin() and kernel_vector_end() disable and
re-enable softirqs, like what kernel_neon_begin() and kernel_neon_end() do on
arm64.  Refer to commit 13150149aa6ded which implemented that behavior on arm64.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
