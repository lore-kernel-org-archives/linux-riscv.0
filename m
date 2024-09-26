Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1120ECDE020
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ECwlAT4qqYuKeGmxcdarPYa5oKCtu69wsC+o3IhJ5M=; b=gS2DKwc3ttXjAxD56b7FGsZ5Zc
	lSk1Cfs6byQuL2ks+7Z57+QmaC064FjSe1qTLJfunCL4ZsQfV79c1rQf7qyFMmiT0gCtv7msvpCTf
	rDDXFpNoBKIXUsKxWzC2y1weDqbpxS2xr5nyWKcVHvWUUBQ8+8zxsFjUda4L25zn+qZ/ox23IwOTT
	7rG3WlHnDJa603/TwtfxQomolhUDWWjiNx4WSmcPDu79ZNfR97enpvk3JO1rVkK3O/MjivakUDnqj
	NoZ6PK2Gp7BVTAtq9EnzvVviQhRERnC/9g7qX9+Scrlyp/OyDKDq8L99yNoTSQan1Ei8K7y0iREvo
	Wwnia96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1strFo-00000008sRS-07uv;
	Thu, 26 Sep 2024 16:22:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1strF0-00000008sKf-495X
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 16:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 752E45C5C95;
	Thu, 26 Sep 2024 16:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BABC4CEC5;
	Thu, 26 Sep 2024 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727367678;
	bh=WRsqfac2hKLCDH03X7aLQwER6nnZNkaG9i+aBGCIQlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F54g5pPT18+0JmNaLhrAEpuF4IysWci5TcL5035/ctiBgNPeTz87P1CtUJaIgxSuI
	 FX3lmhfOn5oli5sZOJiMR67i9sXO3tyOu4wZs2m5p0Dby3zyyaGamPl0XcVW6J5CkV
	 Nm9o95KfD4hPfojrPEXNES7YBNXfM6KRCwTJmgnO5nwDxvRhjastIHO+kMPvkLTyYL
	 pIO1F/R4efjIrAFWCaQmbWtNFtxN/LfkiyU0ZrBtwcBQspPeDv1EKNCGJsq1Cj9/IY
	 AmKk7GZHmgF16nX2XiDuftx+k+aB7/Y8yBt7EDmv3jt5hSOAxLVEAIa8yyxeaUMPx5
	 ZWWSQ1giam7KA==
Date: Thu, 26 Sep 2024 17:21:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Jason Montleon <jmontleo@redhat.com>,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Fix building rust when using GCC toolchain
Message-ID: <20240926-battering-revolt-6c6a7827413e@spud>
References: <20240917000848.720765-1-jmontleo@redhat.com>
 <20240917000848.720765-2-jmontleo@redhat.com>
 <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org>
 <20240917142950.48d800ac@eugeo>
 <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org>
 <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
 <20240926-plated-guts-e84b822c40cc@spud>
 <CANiq72=ShT8O0GcN8G-YRE1CB8Z9Ztr-ZNcQ6cphHYvDGanTKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72=ShT8O0GcN8G-YRE1CB8Z9Ztr-ZNcQ6cphHYvDGanTKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_092119_144961_CDC9524B 
X-CRM114-Status: GOOD (  31.51  )
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
Content-Type: multipart/mixed; boundary="===============5923451554484762382=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5923451554484762382==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jQkvOklAUWnSslpM"
Content-Disposition: inline


--jQkvOklAUWnSslpM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 06:11:17PM +0200, Miguel Ojeda wrote:
> On Thu, Sep 26, 2024 at 5:56=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > Mixed builds are allowed on the c side, since we can figure out what the
>=20
> I am not sure what you mean by allowed on the C side. For out-of-tree
> modules you mean?

No. Things like clang + ld & gas.
I don't care about out of tree modules ;)

> > versions of each tool are. If there's a way to detect the version of
> > libclang in use by the rust side, then I would be okay with mixed gcc +
> > rustc builds.
>=20
> If you mean the libclang used by bindgen, yes, we have such a check
> (warning) in scripts/rust_is_available.sh. We can also have it as a
> Kconfig symbol if needed.

Okay. Short term then is deny gcc + rust, longer term is allow it with
the same caveats as the aforementioned mixed stuff.

> Regarding rustc's LLVM version, I wanted to have a similar check in
> scripts/rust_is_available.sh (also a warning), but it would have been
> quite noisy, and if LTO is not enabled it should generally be OK. So
> we are adding instead a Kconfig symbol for that, which will be used
> for a couple things. Gary has a WIP patch for this one.

Cool, I'll check that out.

> > Yes, I would rather this was not applied at all. My plan was to send a
> > patch making HAVE_RUST depend on CC_IS_CLANG, but just ain't got around
> > to it yet, partly cos I was kinda hoping to mention this to you guys at
> > LPC last week, but I never got the chance to talk to any rust people (or
> > go to any rust talks either!).
>=20
> To be clear, that `depends on` would need to be only for RISC-V, i.e.
> other architectures are "OK" with those. It is really, really
> experimental, as we have always warned, but some people is using it
> successfully, apparently.

Yes, just for riscv. The logic in our Kconfig menu is currently something
like
select HAVE_RUST if RUSTC_SUPPORTS_RISCV
so that would just become
select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG

>=20
> > Sure, I can add a comment there.
>=20
> Thanks!
>=20
> > In sorta related news, is there a plan for config "options" that will
> > allow us to detect gcc-rs or the gcc rust backend?
>=20
> gccrs is way too early to even think about that. rustc_codegen_gcc,
> yeah, if needed, we can add a symbol for that when we start supporting
> the backend.

Cool, sounds good.

--jQkvOklAUWnSslpM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWJ9wAKCRB4tDGHoIJi
0kYkAQD/k60KM2HCPrXZ+0g/PWrqYoQ0W+csV7fk/qkJR/xxoQEAgfjfobdRiFEJ
qEEFFmJcu3ccLX2+R1YqyCfedleEfAc=
=94Il
-----END PGP SIGNATURE-----

--jQkvOklAUWnSslpM--


--===============5923451554484762382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5923451554484762382==--

