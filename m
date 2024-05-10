Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DACC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 22:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMM9SiVvc0A87eYahBSTr24oqAzcriqVn9J3aFdg8OQ=; b=NVKh182KEhA94jROFHWUG/hvFu
	ZsyJ+ppLMsnRVxw61hPXSSxNyOXCJBkSpCzYCSOto/VJANtfwwTs1Rivce81sWsdKTm/bZWA6AYjx
	ig/jBcXjEx7dZUXS6hsWQVlNBSXNg+b2IGnf8WmuQccmGVr58zxCfYyXVRFxFyabwjUCeEyTD9rxB
	2eWhkPas+Z1bTpLt5P8Y01RGh5ojJegE1mrizWawnFeTvyBaajHZHwJx+zUqLXMrlfhjkJsH7ZVLi
	/Q7upCnK+mTVcX/8R9Q169NLI3n0xsrd94qKlSaq+DgwI3xQ1SQ1Qu28gJx4fKzUa4cfg1KXYINQe
	0Ag2MaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5YhD-00000006etC-49vP;
	Fri, 10 May 2024 22:26:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5YhA-00000006erw-1dMI
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 22:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A598861F1F;
	Fri, 10 May 2024 22:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD57C113CC;
	Fri, 10 May 2024 22:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715379987;
	bh=7AiDI83wh1yuDTxM8zawvskTQliLVpgN03KQsOSmIbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5vbAAzyygPUoflDfm2+WfORsmKIWrU5hyDenSGkQpfTj3vlQ1o4tBqK+Hg0zTSiA
	 d69twgicFFhPkapfZVrTAjoh6J9jiO5lmuwlb7a38ykiZ2aD4+OiN0cuWnGPgkhyq2
	 zxLJoyITqmNPmfFFnwAl7iZikmc0lLP3KwbywOJpMfWG9d+hIj7Dg03jBMgaXQL8IQ
	 RBu3nrBZyoANA5z1DHPxL89svP9WQ8nTEHNpjcBvcpPkBxwuferQZg6wWvz8+vTURA
	 R62ZtkeuLBlKr9AsmxFxsuU3xJdvbxVb7BwZ/lSkl4bhC4yTgy5q6hEwxW52XhgWu2
	 DfN6Fc1hCQOZQ==
Date: Fri, 10 May 2024 23:26:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V
 Kconfig option
Message-ID: <20240510-pursuable-oppose-e0b8430271f6@spud>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240507-compile_kernel_with_extensions-v2-2-722c21c328c6@rivosinc.com>
 <20240510-earthly-regress-7a8c8dba55db@spud>
 <Zj6U7sZNNh8GQPYM@ghost>
MIME-Version: 1.0
In-Reply-To: <Zj6U7sZNNh8GQPYM@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_152628_618040_BDC4015B 
X-CRM114-Status: GOOD (  27.08  )
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
Content-Type: multipart/mixed; boundary="===============0672183765512933754=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0672183765512933754==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HEtmufuxgphf9/yt"
Content-Disposition: inline


--HEtmufuxgphf9/yt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 02:43:10PM -0700, Charlie Jenkins wrote:
> On Fri, May 10, 2024 at 09:43:33PM +0100, Conor Dooley wrote:
> > Hey Charlie,
> >=20
> > On Tue, May 07, 2024 at 06:36:28PM -0700, Charlie Jenkins wrote:
> > > Current versions of the kernel add "v" to the march and then immeidat=
ely
> > > filter it out such that "v" is not passed to CFLAGS.  Instead of doing
> > > this filtering, code blocks in the kernel that want to use vector
> > > assembly have been changed to locally enable vector (using ".option
> > > arch, +v").
> >=20
> > Other content in the series aside, since this is a change that could be
> > made independently of the main series objectives, I figured it was worth
> > pointing out that this is not a change without downsides: I think that
> > it would drop support for vector with most versions of LLVM as
> > .option arch support there is much more recent thing than it is for gcc.
> > Off the top of my head I don't know exactly the versions involved, but
> > it is something like LLVM-14 supports vector but only LLVM-17 and later
> > supports .option arch.
>=20
> Toolchain incompatibilities are always fun. It does look like .option
> arch was introduced in LLVM-17. That would be a regression. We do use
> .option arch for every other extension, but vector was treated special
> when it was introduced unfortunately so maybe we have to live with the
> weird march parsing hack.

I wrote out a long message about the history of some of this, but right
at the end I was scrolling through my chat logs with Andy and realised
we actually did make it depend on AS_HAS_OPTION_ARCH, so it should be
safe to do without regressing anything. I didn't notice in the diff that
the AS_HAS_OPTION_ARCH was a movement, not an addition. Maybe Andy knows
why, despite the dependency on the assembler having it, we didn't use it
everywhere.


--HEtmufuxgphf9/yt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj6fDgAKCRB4tDGHoIJi
0lfQAQD3cQ2CGBi7hXtxX18Wz1zL4peotma/GipMZCf24Lst1wD+Pe1HhV+6Rivu
m6xh9DDrjmnxYPbvbcSjixAM7a5evwc=
=FWXT
-----END PGP SIGNATURE-----

--HEtmufuxgphf9/yt--


--===============0672183765512933754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0672183765512933754==--

