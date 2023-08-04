Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A4C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBC6WDYP7Hhlt66bz6j3rF571hSHX4tCmNDfTuWfeW0=; b=1JF/NEdyY8znJL
	RWA5HP05xz0Qh+dskXNKtVcHEXw14hVV1bBElmVFNyzFrBBi0ufhc5+56J3sOnkJYKJWOULAAr0eH
	VAAE7Qh8wRSTyG8kpIx+czIxc+uTXyLW1oDHCcCk7eJjhWtB8S1lFVIJJz6K6px/OuqSsnzYah2CC
	OYEItzM7hNVa8LC5vQapIVWFF6ioF1V8V5BK6PgjEB/paLblx0vYd2vp2vyhEDu69pWS7RDuWdtRW
	HBETUATSHnwfW2VZMgauVeaHvXtw+roimdYfFRvrcFVOhuJhVQu7JWJ2ddFD4GFbx7+zyhSVnzNDu
	XLCrwflLShJYK7gdyl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRq4C-00BrwH-1S;
	Fri, 04 Aug 2023 08:21:48 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRq49-00BrvO-2P
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:21:47 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qRq3y-003ZoP-IB; Fri, 04 Aug 2023 16:21:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 04 Aug 2023 16:21:34 +0800
Date: Fri, 4 Aug 2023 16:21:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, ebiggers@kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH] crypto: riscv/aes - Implement scalar Zkn version for RV32
Message-ID: <ZMy1DkYRBc1PxC8e@gondor.apana.org.au>
References: <20230726172958.1215472-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726172958.1215472-1-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_012145_788192_7A0387F0 
X-CRM114-Status: GOOD (  14.43  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 26, 2023 at 07:29:58PM +0200, Ard Biesheuvel wrote:
> The generic AES implementation we rely on if no architecture specific
> one is available relies on lookup tables that are relatively large with
> respect to the typical L1 D-cache size, which not only affects
> performance, it may also result in timing variances that correlate with
> the encryption keys.
> =

> So we tend to avoid the generic code if we can, usually by using a
> driver that makes use of special AES instructions which supplant most of
> the logic of the table based implementation the AES algorithm.
> =

> The Zkn RISC-V extension provides another interesting take on this: it
> defines instructions operating on scalar registers that implement the
> table lookups without relying on tables in memory. Those tables carry
> 32-bit quantities, making them a natural fit for a 32-bit architecture.
> And given the use of scalars, we don't have to rely in in-kernel SIMD,
> which is a bonus.
> =

> So let's use the instructions to implement the core AES cipher for RV32.
> =

> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Christoph M=FCllner <christoph.muellner@vrull.eu>
> Cc: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/crypto/Kconfig             |  12 ++
>  arch/riscv/crypto/Makefile            |   3 +
>  arch/riscv/crypto/aes-riscv32-glue.c  |  75 ++++++++++++
>  arch/riscv/crypto/aes-riscv32-zkned.S | 119 ++++++++++++++++++++
>  4 files changed, 209 insertions(+)

Hi Ard:

Any chance you could postpone this til after I've finished removing
crypto_cipher?

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
