Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0917ACA0EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDjgSjg0Ol9U5Gi/YjH5/3NVtEl3ip7HgLQmCLy6LyY=; b=uZB7yzwoQks5W6bNSogpBmMHqr
	LRd76qab0G8TmdNSIK6tZIrEc8ar6PUOG2IPVGTM3t0o50RXS+U7+yrIKQtK7kM9LyRHEkl4PEB74
	Ee/PbIM/pe84oF8XT04Q/K89eE8Kg3wlkr2/N80TaO3xs7JzDwm9ckcigZPKh2ydDU3vhLhosOwKX
	oEXTPxGLxgrYhkcEpnccHxUS6HB05uQty3DiVXxBTu68CKIr2jdPen9gxt7VqOAzaQ6cY72mN6M8S
	TAcN6QnZ8sJZv+x6TkyVy0rIC3xn7k0v1VIMV+63qYkF2p1cLS0vJz7w1mhvg0a7xjQU6raOn8TY8
	HPfH0h0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usQ9F-00000008IFZ-41qE;
	Sat, 30 Aug 2025 18:17:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usQ9D-00000008IFT-3M1F
	for linux-riscv@lists.infradead.org;
	Sat, 30 Aug 2025 18:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC4FB60195;
	Sat, 30 Aug 2025 18:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7416C4CEEB;
	Sat, 30 Aug 2025 18:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756577874;
	bh=AaXzJegL0LXpBu/wgNxuQEKB9cIewaGfi4OXtiQRdAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiVOjf9jOkGjHJZOn6cWeFjeGb4NmxamBHRvpC+vQZMjcf9cpohVByIZNvS2Iax/p
	 FbXBosHi++OUrfdP5FDrXXKVrDh242WhB6R30jG+fg5V17Y29t6p0f7Tn85q0sEjye
	 ziFFoxGWRvld4gBDfAXJzsCbIGS6fEy005WhyX8wFzgzN69F1sWoP48paqhYHoLVNY
	 517v4PlIRFMhqdtvKJ76t7BmMay8AWn0FxcpIBBJnq0Sx1s7giQgyfgS5SXg2xWYNE
	 HHwcIjTZ8W0AU4uXXb/b2XUgVTIPkf+UX6pcjtuGVfGEemTFhBc6Hx97/qJozukK+g
	 yV8HsWhpcC3rQ==
Date: Sat, 30 Aug 2025 19:17:48 +0100
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
Message-ID: <20250830-cheesy-prone-ee5fae406c22@spud>
References: <68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com>
MIME-Version: 1.0
In-Reply-To: <68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1837720719904575679=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1837720719904575679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLgD4sybnROtocgd"
Content-Disposition: inline


--PLgD4sybnROtocgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 01:00:56PM +0800, Asuna Yang wrote:
> I noticed that GCC+Rust builds for RISC-V were disabled about a year ago,=
 as
> discussed in
> https://lore.kernel.org/all/20240917000848.720765-1-jmontleo@redhat.com/
>=20
> I'm a bit lost here. What are the main obstacles to re-enabling GCC builds
> now?
>=20
> Conor said:
> > Okay. Short term then is deny gcc + rust, longer term is allow it with =
the
> same caveats as the aforementioned mixed stuff.
> "the same caveats" means detecting what specifically?

There's "code" in the riscv Kconfig/Makefile that makes sure that the
assembler has the same understanding of what extensions are enabled as
the compiler. This is done by detecting which version of the tools are
in use, and adjusting march etc as a result. See
TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI for an example. When I wrote the
comment you're citing, there was no "off the shelf" way to figure out
the version of libclang in use to ensure that it has the same
understanding of -march as the version of gcc being used on the c side
does. For clang build, it's not a concern since it's almost certainly
the exact same as the compiler building the c side.

> We have a RISC-V PWM driver being written in Rust. Currently, GCC being
> disabled for building the kernel with Rust for RISC-V is the primary bloc=
ker
> for including these drivers in RISC-V distros. Therefore, I'd like to push
> forward and contribute to the re-enabling of GCC builds. Is there a more
> detailed direction on what I can do here?

Add the version of libclang as a Kconfig symbol, so that the kernel's
build system can ensure that both sides are built using the same
configuration. Off the top of my head, using a pre-17 libclang with a
new gcc would require having zicsr in -march for the c side and it
removed for rust. It's been a while (1 year+) since I fiddled with this
though, so my recollection there could well be inaccurate.

Cheers,
Conor.

--PLgD4sybnROtocgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLNASAAKCRB4tDGHoIJi
0vXYAQDgtR0RaOgK/BuuCweWdpp1h5+8Uf3iwmbxuqXRT+YFsgEAu3diokJiUzBm
ruXnlci8jwoUePp9tM9YndTyCztULQk=
=UFnw
-----END PGP SIGNATURE-----

--PLgD4sybnROtocgd--


--===============1837720719904575679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1837720719904575679==--

