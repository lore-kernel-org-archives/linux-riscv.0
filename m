Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1B4C021BE
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 22:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcpAZAR4GoFjeL1Q4deMYzCGkK+qS+HYAk8yFf5gixc=; b=pf71fXcMXKyuoz2NNlgqliNItz
	iBKqgz06SqEzKhIOHCDee4MdkSgC1nBUUQY+CxuamV/NXA/U41XOVt1yMKapHsz3Hx/c12lBfb2E0
	4mYLNXjrY6WEMa7UHU9Vl/Kd55qXU3+uY6cZ5VIhrz2yUFD/v7KfXqFx0+QKn8naqzLhxpbE2vaKq
	5ekqzkHTdUM2bM1y7hNn9edSpYMmrkV5jA+IirLAaQfLd0AQkSotnpJVblGLlKZrlU2ybCEQKlzQi
	thZPFrdZAVZ2YwSKD3fyOCB0PajX4veoDZ4J5Z7peB6vKTZMbN5ROqkluz28wq4PqZPCSLxM9keko
	bY3TZ/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spb6i-00000001Jiy-1421;
	Sat, 14 Sep 2024 22:19:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spb3K-00000001JON-0uMs;
	Sat, 14 Sep 2024 22:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36850A400FD;
	Sat, 14 Sep 2024 22:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF7BC4CEC0;
	Sat, 14 Sep 2024 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726352135;
	bh=CbuOYtL+nJOrUCr5pQsOYq97OPNcveR8zM/nfsn08qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQDKnls003f8BK0pKf1mAStEZ9zE6wsWHaExX8l8zaWXnpDiBsz1jZs7ZttGkqDSa
	 XatEWwLlqGA1c6lCIgeKGcsUk99gpo63jaFqtbfURKCUTk7glOMU4PdvuguR/Rk5xd
	 008Op3BGEMvHes4BgTBis51CxqO/Q+Lse+BZ0FWM4mdsg0ftYw9+Z70Cm920dhA5Go
	 FQzfzQCtDH1SqvgamYPu9C/Bj8QTuM0ENOBpC+tTr3Pnd4b1Ky+JSApbXwzGyLnIRA
	 gIIWc3a9hlYpEhltsut6EeWj1jdEBP8nCX/uOAHZ6fRNW7M03nXKHVj95BYfODd31K
	 Wt0mM0JoWMGTA==
Date: Sat, 14 Sep 2024 23:15:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
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
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
Message-ID: <20240914-romp-clothing-965a16cb4dd4@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud>
 <20240914173037.422902b9.gary@garyguo.net>
 <20240914-jitters-barber-a0e51e7b83a8@spud>
MIME-Version: 1.0
In-Reply-To: <20240914-jitters-barber-a0e51e7b83a8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_151538_430514_5017FC6E 
X-CRM114-Status: GOOD (  12.98  )
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
Content-Type: multipart/mixed; boundary="===============4536811819768069302=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4536811819768069302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aukCVL/k+hWQAKhq"
Content-Disposition: inline


--aukCVL/k+hWQAKhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 05:46:14PM +0100, Conor Dooley wrote:
> On Sat, Sep 14, 2024 at 05:30:37PM +0100, Gary Guo wrote:
> > On Fri, 13 Sep 2024 22:17:56 +0100
> > Conor Dooley <conor@kernel.org> wrote:
>=20
> > > error[E0425]: cannot find function `__mutex_init` in crate `bindings`
> > > --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28 =20
> > > |
> > > 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
> > > |                              ^^^^^^^^^^^^ help: a function with a s=
imilar name exists: `__mutex_rt_init`
> > > |
> > > ::: /stuff/brsdk/work/linux/rust/bindings/bindings_generated.rs:12907=
:5
> > > |
> > > 12907 | /     pub fn __mutex_rt_init(
> > > 12908 | |         lock: *mut mutex,
> > > 12909 | |         name: *const core::ffi::c_char,
> > > 12910 | |         key: *mut lock_class_key,
> > > 12911 | |     );
> > > | |_____- similarly named function `__mutex_rt_init` defined here
> > >=20
> > > error: aborting due to 1 previous error
> > >=20
> >=20
> > Do you have PREEMPT_RT enabled?
>=20
> I do indeed.


Turned it off, only to find out my board farm is non-functional! Looks
fine in QEMU however :)


--aukCVL/k+hWQAKhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuYK/wAKCRB4tDGHoIJi
0l1DAQCyyTAltATXfFiGsTKm9k1tm3bo1zh+Ka4em8UHR49XWgD+IOU3xgen2R5l
RRhM8jVPdaxa/BqvxrBHgqH4wRX5xgg=
=Fb0t
-----END PGP SIGNATURE-----

--aukCVL/k+hWQAKhq--


--===============4536811819768069302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4536811819768069302==--

