Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1594C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fp+232YuR5hYhoJyQwsKuCqQTjJaynsCyLxfq41qpl4=; b=lwfQUuu2GwNhJW
	1u3fyj+6OLhY+ftfez9K4cgr+Yg9TQIGg96qLt5OXRZ1efDJC6IxYNkR0EVNKCcTCXWjtmxs5A2/r
	IOtk59PBTS2i9IPSL0Cgg/MwuQXuJJXC4c60MuELO+vR0hph4HuwuCaX7TKqbixSU4MjGhTyD9SnO
	QrQZvVP6gaegarX0sTrbk6j0axGGb38aNqxsbvtuC2kJVMT/BsoL8YwNn4E3u7MT/SylEtSre/uCW
	7o4IfpAbPG7vwB1Kg2zR8amq1m3Bm1APkO5D2hNG6ua4fqzDJzgqcjkb8Bb9iL2G5E3IaaqUN8bnb
	e5Z3OMGjRl8q/GSJROnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXWZ-004tEp-1H;
	Fri, 22 Dec 2023 04:52:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXWV-004tEK-2H
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C2DFAB81ACB;
	Fri, 22 Dec 2023 04:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D633CC433C7;
	Fri, 22 Dec 2023 04:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703220753;
	bh=Mu4nPZC3NYzqa5KLa5exHzdEdFc25nyFrTi4UQ9rNBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rw/ooVoveUFs91tCBZEnBnmCofcXiScCjMUoAyRAy77AVQVTAW5nioT+cgXD1L5La
	 btxOLV06PsPckESHWuy8zq5UzZLW+wOhTgA66qlU9HNP37JnHcLx+GnW96Zp/COekT
	 ZH7FInFgsI+bGj7w6mkEtEvhdx5Svg5NAwCgfLzlBFMzrilXzWuECXUWA2pmywpZJ2
	 rbEDL9FjUbJ6tavkY1MjQqGHHqG6avYpAj6D5FGdp6sGUFw0dzALWNkJ1vhzonTBTX
	 In1nfwt4Cl/Hd+TmYZYVCj3zXAs7VUh0owCcDx3z2Ky8FqtLNRc425L3ixGji+Ueze
	 ZlZ2/y1wtsW9A==
Date: Thu, 21 Dec 2023 22:52:27 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	Christoph Muellner <christoph.muellner@vrull.eu>
Subject: Re: [PATCH] crypto: riscv - use real assembler for vector crypto
 extensions
Message-ID: <20231222045227.GA52600@quark.localdomain>
References: <20231220065648.253236-1-ebiggers@kernel.org>
 <3C51992F-B8F8-4023-81EE-3C95102B072A@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C51992F-B8F8-4023-81EE-3C95102B072A@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_205235_895545_BE37F268 
X-CRM114-Status: GOOD (  15.52  )
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

On Fri, Dec 22, 2023 at 10:15:04AM +0800, Jerry Shih wrote:
> On Dec 20, 2023, at 14:56, Eric Biggers <ebiggers@kernel.org> wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > LLVM main and binutils master now both fully support v1.0 of the RISC-V
> > vector crypto extensions.  Therefore, delete riscv.pm and use the real
> > assembler mnemonics for the vector crypto instructions.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> > 
> > Hi Jerry, this patch applies to your v3 patchset
> > (https://lore.kernel.org/linux-crypto/20231205092801.1335-1-jerry.shih@sifive.com).
> > Can you consider folding it into your patchset?  Thanks!
> 
> Thank you for the vector crypto asm mnemonics works.
> Do you mean that fold this patch or append this one as the separated
> commit into my next v4 patchset?

Just fold the changes into your individual patches, please.  Thanks!

> > config TOOLCHAIN_HAS_ZBB
> > 	bool
> > 	default y
> > 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
> > 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> > 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > 	depends on AS_HAS_OPTION_ARCH
> > 
> > +# This option indicates that the toolchain supports all v1.0 vector crypto
> > +# extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
> > +# binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
> > +config TOOLCHAIN_HAS_ZVK
> > +	def_bool $(as-instr, .option arch$(comma) +zvkb)
> > +
> 
> Could we rename to other terms like
> `TOOLCHAIN_HAS_VECTOR_CRYPTO/TOOLCHAIN_HAS_V_CRYPTO `?
> Some ciphers don't use `ZVK*` extensions.

Yes, TOOLCHAIN_HAS_VECTOR_CRYPTO sounds good.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
