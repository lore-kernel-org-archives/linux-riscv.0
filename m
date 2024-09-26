Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F49CDE017
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VO/gnHUr0Y653roL8vS1t4pPtr8EXU7FgXXQDw+/QG0=; b=HTiVp4Z+ZHeX/CCIgbq3HiUZdz
	MsGgLYkPAi/MHGulzeO5qbXAYZG9Y5r5SUZMVa7q0fotE8GlUQKEwbDnc1YeizmbgSf3psXHTn51D
	ech6AqNGIWm0/MAIaFlK5bykjgHGRjhtKkULo2ZxKSK3mGzgM0JEXUCkXYRd8YJDQtIMFLjeERBKf
	OCQN0j71Eq/765idexIYtnX6sV0MnHcdAqe67naAxSHxtklmhC0uqAbwDpj9wQUNFqnijqoEBAY+R
	oCBxSDTkGuvBCSc4OEjiSTBRP8kpZivJBuwXNtejGktH5H9akaC5OdEaW0ExUThBSXbHbIFPq5lid
	1Il9PozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqr2-00000008oGf-1xfL;
	Thu, 26 Sep 2024 15:56:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stqqz-00000008oFY-1zjs
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 15:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 506145C5ED0;
	Thu, 26 Sep 2024 15:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF65C4CEC5;
	Thu, 26 Sep 2024 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727366187;
	bh=1/qI2GP3Axi5UcQBFFO7yyGh9Go/5y6RvSagLxELw7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FU+oDtiT5Xcl/Iai3/8xWtZT7hPf9kRCjbT1q1NyX6z8NCljCQXow4AXGtuYmSlC+
	 AzmA96KBDfIGUsL2DhJkznlHWk+kLOYjzE5ZKagM4kbBZZDUcMDZN+aCjAVWjifoUi
	 ud94FqvxI/WXzT/7jaPN9whX0uaCYcpWIaMXRNAJN/0gZyJRYvk/8EFRkwCAto3jM6
	 /ldlX4vGj3/GcKzejRPsQJus+lCjaJxUTeTr3qvb0dB+n2nR/b91T6MfK9rtbtZ2Ap
	 qt26/lxcP30MKT8O/AwM851eNGKMEQiQxUva5E9qei+t/7w/cJ8WdUjWlO+c3ajx+r
	 Hxzq5XfQUHFew==
Date: Thu, 26 Sep 2024 16:56:21 +0100
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
Message-ID: <20240926-plated-guts-e84b822c40cc@spud>
References: <20240917000848.720765-1-jmontleo@redhat.com>
 <20240917000848.720765-2-jmontleo@redhat.com>
 <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org>
 <20240917142950.48d800ac@eugeo>
 <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org>
 <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_085629_801371_1D4FC97D 
X-CRM114-Status: GOOD (  22.51  )
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
Content-Type: multipart/mixed; boundary="===============0241697369107529748=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0241697369107529748==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nmXfaJxXZ5jvnxoJ"
Content-Disposition: inline


--nmXfaJxXZ5jvnxoJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 05:40:19PM +0200, Miguel Ojeda wrote:
> On Tue, Sep 17, 2024 at 5:26=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > Yes, but unfortunately I already knew how it worked. It's not flags I a=
m worried about, it is extensions.
> > Even using a libclang that doesn't match clang could be a problem, but =
we can at least declare that unsupported.
> > Not digging it out on an airport bus, but we discussed the lack of GCC =
support on the original patch adding riscv, and decided against it.
>=20
> Do you mean you would prefer to avoid supporting the mixed GCC-Clang
> builds?

Mixed builds are allowed on the c side, since we can figure out what the
versions of each tool are. If there's a way to detect the version of
libclang in use by the rust side, then I would be okay with mixed gcc +
rustc builds.

> If so, do you mean you would prefer to not pick the patch,
> i.e. avoid supporting this at all?

Yes, I would rather this was not applied at all. My plan was to send a
patch making HAVE_RUST depend on CC_IS_CLANG, but just ain't got around
to it yet, partly cos I was kinda hoping to mention this to you guys at
LPC last week, but I never got the chance to talk to any rust people (or
go to any rust talks either!).

> (If so, then perhaps it would be a
> good idea to add a comment there and perhaps a note to
> https://docs.kernel.org/rust/arch-support.html).

Sure, I can add a comment there.=20

> Otherwise, please let me know if I am misunderstanding -- thanks!

In sorta related news, is there a plan for config "options" that will
allow us to detect gcc-rs or the gcc rust backend?

Cheers,
Conor.

--nmXfaJxXZ5jvnxoJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWEJQAKCRB4tDGHoIJi
0oYrAPwMntj0z02QObS+IYmEmboJI6SyEUkngNBmw9pJE4dx/AD/aIavZrcUYEKA
wsXoLTaDPQ2Dv+rm0e1ziNyB8Bg2nA4=
=wItZ
-----END PGP SIGNATURE-----

--nmXfaJxXZ5jvnxoJ--


--===============0241697369107529748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0241697369107529748==--

