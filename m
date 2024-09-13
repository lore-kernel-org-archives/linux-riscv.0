Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD646FC6181
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 21:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0W+fGs1oyS5ciXBtf/VG6hXVIa5xyGubLVx6XGzu+6k=; b=1iaCOEZRpMVVAFO46BdHTmgZgT
	VyzlhCkf3SPNDrGg3JOBK2pNdbxfLXtKCqEWseMGsSAv0Ifw0vIKChrZW3g07LeN6NyzoGQjd9CtE
	Eo7ksTmLPAI10yJdpY4ALo5Miff/oS6s4tsQMBb7ZZXt8rTxQzIn1ZaTFUqhezUO7XSC+VATrFJIC
	qeQQppE1CXeq77Eim+gFCX61ZV7qOlVymQRLjTYo8rgUeW1vI1D8kJrD3rFv0yyM7kffOkSln52CD
	ljwuTg4rKgJ2dCAyZfwEvD/g1p+WehWSRyfEZ4trT6O08GEWXwTGz0KYZU4vwkznwZvXAadRa6hvO
	SlQ8Q+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spEA9-0000000HD4V-1ONo;
	Fri, 13 Sep 2024 21:49:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spE94-0000000HCwq-0wz0;
	Fri, 13 Sep 2024 21:48:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C8795C5A4F;
	Fri, 13 Sep 2024 21:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E68C4CEC0;
	Fri, 13 Sep 2024 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726264080;
	bh=DcEJaz7/MqaLtQJcgIq177t7RurKuxBUY+gSzhJcMig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTQMeOYC7hBejIAS7xCTTvIgO3RtoNfJVnYcFiygoUYS4781paKqk1giyRo52IzcY
	 NrCZUMR0EMKFi6zxCtzZ3Y8TJc110tLnYejZCD29xytiVQ5C+o6EewjV7Gx7Vn9HOz
	 NxcsQFXTPlHZ86HNvVqv+TOI1pWOA9sLdW9O9PqIQEP8wULk+bqDlMMs1MrzGrWluL
	 9wuvqRfdw6gm8lvELOBI4LzoLesWSeNeDGpDGGMr7PubfEqeAlIFLFZfd5NQyVwidn
	 vyeytts8flGijB0Ssd3eevN/tvw5lroKtQWREMP38m7ZKBGqoIyTRd4Im97pSOd6Pl
	 hEkpwaYae4kvg==
Date: Fri, 13 Sep 2024 22:47:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
Message-ID: <20240913-pastime-unsheathe-1c7d9161bbea@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud>
 <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_144802_417762_A1FCB5E7 
X-CRM114-Status: GOOD (  24.72  )
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
Content-Type: multipart/mixed; boundary="===============0146200485268342160=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0146200485268342160==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XmBt+U4mG1ij8T4e"
Content-Disposition: inline


--XmBt+U4mG1ij8T4e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:44:26PM +0200, Alice Ryhl wrote:
> On Fri, Sep 13, 2024 at 11:18=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Fri, Sep 13, 2024 at 12:08:20AM +0200, Miguel Ojeda wrote:
> > > On Thu, Aug 29, 2024 at 10:23=E2=80=AFAM Alice Ryhl <aliceryhl@google=
=2Ecom> wrote:
> > > >
> > > > Add all of the flags that are needed to support the shadow call sta=
ck
> > > > (SCS) sanitizer with Rust, and updates Kconfig to allow only
> > > > configurations that work.
> > >
> > > Applied to `rust-next` -- thanks everyone!
> > >
> > > Paul/Palmer/Albert/RISC-V: I think you were not Cc'd (at least in this
> > > version?), so please shout if you have a problem with this.

> > error[E0425]: cannot find function `__mutex_init` in crate `bindings`
> > --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28
> > |
> > 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
> > |                              ^^^^^^^^^^^^ help: a function with a sim=
ilar name exists: `__mutex_rt_init`
> > |
> > ::: /stuff/brsdk/work/linux/rust/bindings/bindings_generated.rs:12907:5
> > |
> > 12907 | /     pub fn __mutex_rt_init(
> > 12908 | |         lock: *mut mutex,
> > 12909 | |         name: *const core::ffi::c_char,
> > 12910 | |         key: *mut lock_class_key,
> > 12911 | |     );
> > | |_____- similarly named function `__mutex_rt_init` defined here
> >
> > error: aborting due to 1 previous error
>=20
> This looks like an unrelated problem to me. This patch only changes
> the rustc flags, but these errors have to do with the Rust
> helpers/bindings, which get generated before the rustc flags are used
> at all. Most likely, there is a problem under the particular
> configuration you are using. Were you able to reproduce these errors
> without this patch?

Oh I'm not blaming you for it, don't worry. I didn't think it would be
related, but it did stop me from being trivially able to check whether
there was any problems with the applied patch. I'll give it another go
tomorrow, with all of the other rust code stripped out and just this
patch applied.

--XmBt+U4mG1ij8T4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuSzCAAKCRB4tDGHoIJi
0issAP9GjxTOIzL/cqkl1wZ2tWAlpPVRF5uvk4HLHAQG6GT4QgD5AcVnWQaXw4+H
qjvlVjN40TlXvEnLWp+lmPZDXlHyLg8=
=Kpsx
-----END PGP SIGNATURE-----

--XmBt+U4mG1ij8T4e--


--===============0146200485268342160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0146200485268342160==--

