Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435E3C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 02:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZfdvieG66/ead1whVKzD/4hnW5/JB74m51VX7IcZX4=; b=KEhfvRVrz+4yuw
	e7lIIgeSHlA3ctAfvoQT7txKylurZkF2oQIgiDvGkchWMADBjLReNwfCc9H1Aig6HFJZZqHy9s2WB
	DuBiCzCGunxe3tElYXMH59iDnAW9t+3aFY0BrwRMM7aafOHS8GuTkhEWwJOm7wwLGVs5v6Lj3W+l/
	0clOpLbQzLH0EsyF6WvX4ds6maDsX54Jm6dcIJc5CfETq7u74m2wpDU/FK++LniZnBo+AamCJZsmH
	h/Zx6+/qL6Md1XLNFE5yv2LpGt9Y28sxIlvmED4UNyHD6Ep6S2MyxRZDlOciBSz9Oxm7VFEasdile
	+I1lTjbI5fbE5e8fTtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u898K-0000000Forj-2qrZ;
	Fri, 25 Apr 2025 02:49:44 +0000
Received: from [144.6.53.87] (helo=abb.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u897g-0000000FomR-08cq
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 02:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cnV8pteBUZTuj+uhOfEOc824fXoOdF+CLlRvwwfF0wI=; b=ANccXNGdGcg2JeipvXlhXmq2p1
	kOhXe1gyb33uDHyNvPxiIN9ZmFF1oQmf7i9p8dT6Usdeqsxia/QmihmTYdiCK2oRCRCExSKgvIt6P
	IiK9JUiK0T91CqTXL5/W1Z89FX5nMz3a9BC/c3pTpOkoCbP73bO1bbSteqoOUojhrn+1wFeEvagDH
	ELlsKqjlhgpYvzc0q5y3FigvrvR1oqsWq3Ip0iJp0yBU8Km5u4acHS5mdjb0XUSVqmxH2p0MNfz5h
	0nZ1hY8DfbgtyAbIS3gvjfGePHljQIRNQY927YkhFzF07YTqix8Y70UrX/bmbQ9LDZPs3kM4eDXpy
	+Y0LY7UQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u897M-000rbH-26;
	Fri, 25 Apr 2025 10:48:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 25 Apr 2025 10:48:44 +0800
Date: Fri, 25 Apr 2025 10:48:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: crypto - Use SYM_FUNC_START for functions only
 called directly
Message-ID: <aAr4DFlbPiNKpBmp@gondor.apana.org.au>
References: <20250424-riscv-crypto-fix-cfi-build-v1-1-2d7516737379@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-riscv-crypto-fix-cfi-build-v1-1-2d7516737379@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_194904_072707_6F27B825 
X-CRM114-Status: GOOD (  12.79  )
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

On Thu, Apr 24, 2025 at 05:23:22PM -0700, Nathan Chancellor wrote:
> After some recent changes to the RISC-V crypto code that turned some
> indirect function calls into direct ones, builds with CONFIG_CFI_CLANG
> fail with:
> 
>   ld.lld: error: undefined symbol: __kcfi_typeid_sm3_transform_zvksh_zvkb
>   >>> referenced by arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.o:(.text+0x2) in archive vmlinux.a
> 
>   ld.lld: error: undefined symbol: __kcfi_typeid_sha512_transform_zvknhb_zvkb
>   >>> referenced by arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.o:(.text+0x2) in archive vmlinux.a
> 
>   ld.lld: error: undefined symbol: __kcfi_typeid_sha256_transform_zvknha_or_zvknhb_zvkb
>   >>> referenced by arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.o:(.text+0x2) in archive vmlinux.a
> 
> As these functions are no longer indirectly called (i.e., have their
> address taken), the compiler will not emit __kcfi_typeid symbols for
> them but SYM_TYPED_FUNC_START expects these to exist at link time.
> 
> Switch the definitions of these functions to use SYM_FUNC_START, as they
> no longer need kCFI type information since they are only called
> directly.
> 
> Fixes: 1523eaed0ac5 ("crypto: riscv/sm3 - Use API partial block handling")
> Fixes: 561aab1104d8 ("crypto: riscv/sha512 - Use API partial block handling")
> Fixes: e6c5597badf2 ("crypto: riscv/sha256 - Use API partial block handling")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S | 4 ++--
>  arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S           | 4 ++--
>  arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.S               | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
