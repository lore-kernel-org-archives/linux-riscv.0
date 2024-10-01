Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B18CEACFB
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 19:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5E/mavrRAT7mXY3SMM6txkXnW21spIhq/rzEHYlI0Co=; b=OMWb9O1wIQ5S5BgKHurDcK8RGx
	ay/P8dIt+QbCeekekOIHRF8Rxi4R17v7PcG8GOjXcD8AvTljgE1xbji4ISfM8enjcfMfkG9FA1e9l
	z3YkhpHey/Eeokn8rg8gxmmtD2MB5+Z9otW/l1sN0Yfg0l3dyJj/AtKX8LNjva8Dy0+2jqVgmAJQO
	q2kFBcvpMhsq6bcynOxYeAlftxHFbHvQ9nPZJWG6s4fdlYxxrwb6mJbPrVxYoZZpuQ75M2KD1kD/S
	T2kIbE3NqEmawwViNmmGze2Mqkxuhrtelyg0V/4dF9ZXrsAhBFryFNNLAS/KQ8P7nHTkkC7lns9Bq
	J8IsNnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sviWx-00000003tBS-3JTP;
	Tue, 01 Oct 2024 19:27:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sviWu-00000003tB7-0ebS
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 19:27:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7593D5C0547;
	Tue,  1 Oct 2024 19:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A20C4CEC6;
	Tue,  1 Oct 2024 19:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727810847;
	bh=rnSA/NcPwgiGLvd5BCxGGNZTwr+1d1IAzw2KM2zG7Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BwgIKIHKQ8gxnjk6yl03Fc57ZAwxs4tQG19jwmNWWTxQx/6X33+tJAQHASUbE3bB3
	 dTAWiKzf6KJrCmfrkzm5XsIniZYRr79WWH/RMHfM8D7fhbxwb6McpFQdx+qxMvPGSY
	 6Ur+HZBuryDNDBXt4wa7tcNUvVZrIS//nVz9AQdoAgvWTDmeH5Xt9lZXT+m6lCy2RR
	 Y2EsVTgKQjUx+udH1OkFp01q486BP50GQFJlzKHq/dOwTdE2ZT0XGQC5DkghfiBVSS
	 DIp64nx2d88V1L7h4PavVuiMK6HJ6GMihBHwuxlpapfedsp7/spq9O+UKMTXeSnqOC
	 xALIDja8pMong==
Date: Tue, 1 Oct 2024 20:27:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Message-ID: <20241001-partition-family-e862797bad1e@spud>
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <20241001185525.GA29379@thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <20241001185525.GA29379@thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_122728_304669_4412395C 
X-CRM114-Status: GOOD (  21.49  )
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
Content-Type: multipart/mixed; boundary="===============7168647380999826569=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7168647380999826569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TarOnJ84/zi/70vf"
Content-Disposition: inline


--TarOnJ84/zi/70vf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 11:55:25AM -0700, Nathan Chancellor wrote:
> On Tue, Oct 01, 2024 at 12:28:13PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > During the discussion before supporting rust on riscv, it was decided
> > not to support gcc yet, due to differences in extension handling
> > compared to llvm (only the version of libclang matching the c compiler
> > is supported). Recently Jason Montleon reported [1] that building with
> > gcc caused build issues, due to unsupported arguments being passed to
> > libclang. After some discussion between myself and Miguel, it is better
> > to disable gcc + rust builds to match the original intent, and
> > subsequently support it when an appropriate set of extensions can be
> > deduced from the version of libclang.
> >=20
> > Closes: https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@re=
dhat.com/ [1]
> > Link: https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413=
e@spud/ [2]
> > Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with rust=
 support")
> > Reported-by: Jason Montleon <jmontleo@redhat.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Seems like a reasonable restriction to me.
>=20
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>=20
> I assume the difficulty is not in getting the libclang version itself
> but actually mapping extensions to the versions and then deciding how to
> make that available to the build system? Or is it more that a solution
> is somewhat known but someone has to actually implement it? Sorry if
> this has been talked about before.

It's mostly that someone has to take the time to go and do it. Miguel
and I discussed getting the libclang version a bit in [2] and mapping
the versions to extensions is no different (AFAIU) to mapping the
versions to extensions for Clang, so the work in figuring that out is
mostly done. It's a matter of going off and doing it, and testing the
various mixed tool configurations and versions to make sure it works
correctly.

--TarOnJ84/zi/70vf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvxNGQAKCRB4tDGHoIJi
0lE1AQDWWqq75fBmjONd1vkgn14O3Ry+Wd+YV+mwWrrx2ih/VwEA7vd7SwSL8noq
/GLsbc3JYDiN4dXJvAyG4VB4ih0/oQk=
=Yf0+
-----END PGP SIGNATURE-----

--TarOnJ84/zi/70vf--


--===============7168647380999826569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7168647380999826569==--

