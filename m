Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18951C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 04:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IN791K0giSGDykTNfhtjTgghCdN7ZNTh/6UJS53qwT4=; b=aA1i/EuHT2Tsdp
	x8GHJJx4sPdPoOfNL+ZX11akZom+tTYJYxiGcu5KAbFQJCS8m+JVtjvK0svTI0hk0Bw7kJgDkJD6J
	323OuTWvEryx35Raej903TTmxzyNV0TikoDsu0McO3RR+QNzxFqm/3qYO54Nm6ALhLFlyAlx6jO6y
	WcqpDvk+k/D8Yvk9TfF2JYO92yiiyRYra9h0ehFffl49NQXEiq6EaliCP7shuVvl98xjK29SzeEDH
	e/Q59nUq5GNpivCc/38pkbKvw5hTwVeow/rbagVwiBWrNDp72PPXaEbnudPMA8HhHeglTUpDVLNtS
	509fn86WRWSUx+4exgiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pSn-0041hR-0z;
	Tue, 28 Nov 2023 04:12:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pSh-0041gm-10
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 04:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AE7C9B80F98;
	Tue, 28 Nov 2023 04:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A027DC433C8;
	Tue, 28 Nov 2023 04:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701144757;
	bh=8sgnTlTTe9L/d3q6KejWDFP12I9AsyGGo8/4VhNtpCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEWumhAEPzcP6ei2al6jYGIp3TiLr1CvuhBdMYtBFRd4npdj1hflBmoIui2KHuHiX
	 rjCsWTYe/2Jf401q1YWW5Y9W3zJPFvHEB9Df4EdJqKUhUKQaPLg4mIu6mHj/1RH2Iw
	 8pfKefIpVE+XyPCSE4GrYI2IudRAyPwoIkZhhSZM1h5F70Lwzdt1t333/2Z+mm6Pap
	 HvrzKTSaaq9xkeRFrqC8+MW8TvOghwdacuvgAlkCG6NbwTI8fiE2fQ/x6RT4cLdVLj
	 qdGAFrpVTW07QHGRmBOKB7Ml2unZzzZAV6K8crtdLfy/OsO+A6RjUXQjOvq38CFjRu
	 HbbiG9Z+p8KJg==
Date: Mon, 27 Nov 2023 20:12:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 09/13] RISC-V: crypto: add Zvknha/b accelerated
 SHA224/256 implementations
Message-ID: <20231128041235.GJ1463@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-10-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-10-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_201242_711014_4671121A 
X-CRM114-Status: GOOD (  10.91  )
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

On Mon, Nov 27, 2023 at 03:06:59PM +0800, Jerry Shih wrote:
> +/*
> + * sha256 using zvkb and zvknha/b vector crypto extension
> + *
> + * This asm function will just take the first 256-bit as the sha256 state from
> + * the pointer to `struct sha256_state`.
> + */
> +asmlinkage void
> +sha256_block_data_order_zvkb_zvknha_or_zvknhb(struct sha256_state *digest,
> +					      const u8 *data, int num_blks);

The SHA-2 and SM3 assembly functions are potentially being called using indirect
calls, depending on whether the compiler optimizes out the indirect call that
exists in the code or not.  These assembly functions also are not defined using
SYM_TYPED_FUNC_START.  This is not compatible with Control Flow Integrity
(CONFIG_CFI_CLANG); these indirect calls might generate CFI failures.

I recommend using wrapper functions to avoid this issue, like what is done in
arch/arm64/crypto/sha2-ce-glue.c.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
