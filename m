Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044BCC4829D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 20:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFWIAQtr5QLy/guflyt8piaM+0nzj/aDglSaoqQGa0I=; b=xA3bUS4rmRzwmudg678XWjxXRs
	Yuopedmd8p1wvoAwhjqwWBAaL/33ytX+BiwA6FCEc6lO4XwPb9H3NXGk3rgeFVTG6jYcFoZ0q7PN+
	GWaVRHQbZRIONQ30ntuxHlKfaPV81kTkEbu2cf2Scy9xLSD2ErAzFQPeBOakbUkFS9wO4Ysgrm94H
	CthIOS5fdrLA62mJ6SyXTTm90XpGwupejmd9AcjMNwRiMknaagH8k67Umx5mR6Ndc9zpoRvOmVId8
	f0o4+V7ApT40BCrT5Wsm5PVtmtvEyiemKlqHCg8GMKLf9WV+cKcHjBncrIsswThh9cm/G7saR39Qm
	ZhnZ9dMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZd44-00000006t6d-01Eq;
	Mon, 12 Feb 2024 20:38:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZd41-00000006t5a-2CB5
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 20:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 705D1CE0A19;
	Mon, 12 Feb 2024 20:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680E0C433C7;
	Mon, 12 Feb 2024 20:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707770279;
	bh=Fpc0F+qyMdb3ioJ2lc0gnHuRhUOcZrHYZrPqSExGyO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERoYmQ4jogZzX3jGbXTPFUvQKZxZNyUDWD1L2SOQZHWtQ7IFM5lc9jiHFaHnsMIXX
	 FuaeoD3/gDRGSXA6Q0aG0m0mRh3347oJzaYWzkY2HfQuua1xc53rOETQSs9Vmn58Fd
	 rlAXeBece75Z0pCccGm6xTU/O3OCAnzS5JiJohr90Dm1DK5RWh46KFxwjnQxh4izeu
	 HSQOyL3bfOQ6/W3mqm1GuWLJUhB2EiNdWsxcrXqRmkbSgZBU1l7wRHclc3D9vN1pDk
	 azNptHEvsIBkkmmNalf8ik6jEbP/rpO/lgIQeQSrxowuNPYZiAq6webhKmgLTFpTrE
	 YoKwiqot/WBWg==
Date: Mon, 12 Feb 2024 20:37:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ramon de C Valle <rcvalle@google.com>, Trevor Gross <tmgross@umich.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Matthew Maurer <mmaurer@google.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20240212-outdoors-french-a40d57e38c71@spud>
References: <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy>
 <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud>
 <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud>
 <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZORDaHHH3jTL3GO7OsDubhhyQE0Uy2uAjJpiRzrKBgqaOw@mail.gmail.com>
 <CANiq72=VBFvB9O9c84YxpBBftpfNnnXx-+Xes0h8h6rN3EN5pA@mail.gmail.com>
 <20240212-demotion-blitz-1c9ab85dbc73@spud>
MIME-Version: 1.0
In-Reply-To: <20240212-demotion-blitz-1c9ab85dbc73@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_123805_926988_DE6AFD62 
X-CRM114-Status: GOOD (  21.19  )
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
Content-Type: multipart/mixed; boundary="===============8588667938234200967=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8588667938234200967==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7thX9cC6woknPGKe"
Content-Disposition: inline


--7thX9cC6woknPGKe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 08:17:31PM +0000, Conor Dooley wrote:
> On Mon, Feb 12, 2024 at 08:11:21PM +0100, Miguel Ojeda wrote:
> > On Mon, Feb 12, 2024 at 8:02=E2=80=AFPM Ramon de C Valle <rcvalle@googl=
e.com> wrote:
> > >
> > > Sorry for the late reply. Sami might be the best person to answer thi=
s, but KCFI (not CFI) tests are lowered by passes that are architecture spe=
cific (see https://reviews.llvm.org/D119296), so we'd need to add support f=
or RISC-V. There is no additional work required in the Rust compiler beside=
s enabling it for the new target.
> >=20
> > Thanks a lot Ramon!
> >=20
> > Then for RISC-V let's go for the `depends on` for the moment, and we
> > can remove when the support lands for RISC-V (ideally when someone has
> > managed to boot it at least under some configuration).
>=20
> If all you want is a boot under some configuration, that's not
> difficult. After all, I found the original issue by booting a kernel
> with CFI_CLANG enabled on the C side...

Also, regardless of depends on on RISC-V, things will still be broken
on arm64 and x86_64, since KCFI is not enabled in rustc there either?

> > There is no additional work required in the Rust compiler besides enabl=
ing it for the new target.
>=20
> This is not super clear though, it says "in the Rust compiler", not "in
> the kernel's buildsystem".

I realise I was not clear either. What I meant was that this talks about
rustc and not kbuild, so what is meant by "the new target" is not clear.
Do arm64 and x86_64 have functional support, so adding RISC-V in rustc
is needed, or did you mean for the new target in the kernel?



--7thX9cC6woknPGKe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcqBoQAKCRB4tDGHoIJi
0iGKAP97UKgRmbxcqgRIJWahLsNbdWqhmMMWsoa78Iykcp7gmQD+JtaSuLVZzvRC
7MFMT30bfndJIV8nNlMBmx4+XtVlHw8=
=gsZ6
-----END PGP SIGNATURE-----

--7thX9cC6woknPGKe--


--===============8588667938234200967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8588667938234200967==--

