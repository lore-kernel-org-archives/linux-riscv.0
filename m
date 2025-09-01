Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14D6CA0FFF
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZjq4E/cWtkhzUky4/wGmdXCB25uCcHCjFUKh3lgfEc=; b=cf/tD/8qNP6B0oRlr4GND733uE
	/rDucEp44ZMdqyf/u8oxfgXxoy/LzKIkHgG1hmIlKeXvQfo11I8lfBf5rzspwD2qpFzC5ZbKUhePe
	kC71XCqC1c0Ub9AwZQXxm8tqw8OCoMaTMbdlj/GKarmSYbp+wIeizrdnE2dOcRhK0VSiBbP9Kwqvp
	I47dN9UG7DNr++I0MCqFr6zlX55n6tZWEg7M2OosuyfTk7Na2eDKJ5SDNDQ8ElqL/QAV2vhQDzpJd
	cFoeoLJ9B9lXk6ao7LgxAuvE9FpViaZTFRzz4KpuTi1+vKe4pCmdsboxBLQ9EGmG2KgiPrueh283q
	gbb30KRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8Kg-0000000DSSh-40ed;
	Mon, 01 Sep 2025 17:28:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5D4-0000000Co98-04oq
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 14:08:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 397DF601D9;
	Mon,  1 Sep 2025 14:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7648BC4CEF0;
	Mon,  1 Sep 2025 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756735716;
	bh=OzrZGhKo/ziOjxea3LbChAg6YdR7N5Q5yFK9R2DNJh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F36Mm7TAG2ZXqQS5iz0To3BlcsCl3TjF2sTAsYJb1ofTvk6fKWhIqUkPGqY8bvxwe
	 0pa/3fgbu7dNrXFPkHyvqO9BXvhqfgvmvhiAsMyYFMTy7WyN418oHko3iuJbgypFE4
	 FogGFZaNorIQlh5buUNME03E1M/zzshJ6tS41bflbC+eocpkm9f6kazHPowy1R6SeU
	 PLq4BkXJxy+yzMWRkltpXs2zqBrUsFOXCRiJaeh0FF/1SmrHv6/tQKt9v8ZIg7XuLC
	 ZvFRI9lr/m+RjO71djzSSwGhgqrSYPVsIcaSaXSWIm/U9Jrc3KeWeiscsxwArnI9tF
	 7/6QlalL2NScA==
Date: Mon, 1 Sep 2025 15:08:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna Yang <spriteovo@gmail.com>
Cc: Jason Montleon <jmontleo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: RISC-V: Re-enable GCC+Rust builds
Message-ID: <20250901-lasso-kabob-de32b8fcede8@spud>
References: <68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com>
 <20250830-cheesy-prone-ee5fae406c22@spud>
MIME-Version: 1.0
In-Reply-To: <20250830-cheesy-prone-ee5fae406c22@spud>
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
Content-Type: multipart/mixed; boundary="===============8586429601023951527=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8586429601023951527==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OdIo6g+XUcHBw6vM"
Content-Disposition: inline


--OdIo6g+XUcHBw6vM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 07:17:48PM +0100, Conor Dooley wrote:
> On Sat, Aug 30, 2025 at 01:00:56PM +0800, Asuna Yang wrote:
> > I noticed that GCC+Rust builds for RISC-V were disabled about a year ag=
o, as
> > discussed in
> > https://lore.kernel.org/all/20240917000848.720765-1-jmontleo@redhat.com/
> >=20
> > I'm a bit lost here. What are the main obstacles to re-enabling GCC bui=
lds
> > now?
> >=20
> > Conor said:
> > > Okay. Short term then is deny gcc + rust, longer term is allow it wit=
h the
> > same caveats as the aforementioned mixed stuff.
> > "the same caveats" means detecting what specifically?
>=20
> There's "code" in the riscv Kconfig/Makefile that makes sure that the
> assembler has the same understanding of what extensions are enabled as
> the compiler. This is done by detecting which version of the tools are
> in use, and adjusting march etc as a result. See
> TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI for an example. When I wrote the
> comment you're citing, there was no "off the shelf" way to figure out
> the version of libclang in use to ensure that it has the same
> understanding of -march as the version of gcc being used on the c side
> does. For clang build, it's not a concern since it's almost certainly
> the exact same as the compiler building the c side.
>=20
> > We have a RISC-V PWM driver being written in Rust. Currently, GCC being
> > disabled for building the kernel with Rust for RISC-V is the primary bl=
ocker
> > for including these drivers in RISC-V distros. Therefore, I'd like to p=
ush
> > forward and contribute to the re-enabling of GCC builds. Is there a more
> > detailed direction on what I can do here?
>=20
> Add the version of libclang as a Kconfig symbol, so that the kernel's
> build system can ensure that both sides are built using the same
> configuration. Off the top of my head, using a pre-17 libclang with a
> new gcc would require having zicsr in -march for the c side and it
> removed for rust. It's been a while (1 year+) since I fiddled with this
> though, so my recollection there could well be inaccurate.

Hmm, while I think of it, there's some other things that are problematic
that are not currently checked but would have to be. For example,
there's a check in the riscv Kconfig menu to see if
stack-protector-guard=3Dtls can be used via a cc-option check. If that
check passes with gcc as the compiler that option will be passed to the
rust side of the build, where llvm might not support it.
Similarly, turning on an extension like Zacas via a cc-option check could
pass for gcc but not be usable when passed to the rust side, causing
errors. These sorts of things should be prevented via Kconfig, not show
up as confusing build errors.


--OdIo6g+XUcHBw6vM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLWo3AAKCRB4tDGHoIJi
0uC6AQCE+OLBYrLOFf+asyXURIHL6RWs7lgeAYlu+2yTHkHJ4gD+PaXpb+dmGhrF
EJv4oLQmRVAC2xUCUy+a0Iy+/t+IRgc=
=tQwP
-----END PGP SIGNATURE-----

--OdIo6g+XUcHBw6vM--


--===============8586429601023951527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8586429601023951527==--

