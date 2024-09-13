Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3C0FC6172
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 21:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzm1CU0coJqQ5YJyxHODrKfF8hWL+FG/RsVfaaLobxA=; b=xqyiFgmcmQVppSqRZAHCafmyeJ
	vFCj3shYTD7Vs6KXypweHigb5wWJeEe870G4BLvzAdz11jOPCRiMFh719pTuHKJcL0YQwwU96qjWn
	mGh2osp2E5jbafKxedYhow/eRMs0m3t3ZwULGDiJn1NC4t6umonSgVvfx0G7/L6ofNvx6gEcyaziP
	LWNjL8Mv+h25ECr8ejDxS7b0UHBXa5y7EbpvHVfKBnz8K/oRieIaFy14l9+/lmJBgKmRj+VQQ8R/D
	WUbJRQphhDiFOK7Qlzrzb+ZOigfkNtGuqIZQs+IcI2pULMisGm313nnzMRcfeUnPM/dF9yHzAPpXI
	29uGqACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spDhD-0000000H98A-2VVd;
	Fri, 13 Sep 2024 21:19:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spDg5-0000000H903-3rHN;
	Fri, 13 Sep 2024 21:18:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 179BCA41625;
	Fri, 13 Sep 2024 21:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800D0C4CEC0;
	Fri, 13 Sep 2024 21:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726262284;
	bh=RuPrAU4bZnhY3Wyzxzt/JEXLr9Rmcb4tQI/BYwh/mJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1x1OZ2igt/94pR3CkGpZoH7RhxZeNP8Ey1dji1IgNIfzG1CC73ZPIRv4uTASM8rM
	 kzghfznvxXVxL1XkSVoltFpae+bcXMI9lvek3/t5e+2UdJdOeSuvPhkQJUT/Uz6o6p
	 QnvkjlHW+hmpnobRgPLzv4mc5HjQoCwayWSL8SOfvn3p+9Dwm0E/t9PQkrrfM0KW/h
	 5yuWA2NEisDw2aV1WbSmG325zyZfwGFSub4lwaf2ELbQETYQTLiM1MjN5k54+gE7Yc
	 aat2e6Yb6MD6OphnFuduZwc4UaNK9kEKSCb2DLIIGOC5p8/y4r+aPIRm52hBj/eG3n
	 ICMvmnD9e3aBQ==
Date: Fri, 13 Sep 2024 22:17:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
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
Message-ID: <20240913-shack-estate-b376a65921b1@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_141806_118025_6A8922E1 
X-CRM114-Status: GOOD (  20.51  )
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
Content-Type: multipart/mixed; boundary="===============7234027059614271128=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7234027059614271128==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/xsIueD3ju/hMl6p"
Content-Disposition: inline


--/xsIueD3ju/hMl6p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 12:08:20AM +0200, Miguel Ojeda wrote:
> On Thu, Aug 29, 2024 at 10:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Add all of the flags that are needed to support the shadow call stack
> > (SCS) sanitizer with Rust, and updates Kconfig to allow only
> > configurations that work.
>=20
> Applied to `rust-next` -- thanks everyone!
>=20
> Paul/Palmer/Albert/RISC-V: I think you were not Cc'd (at least in this
> version?), so please shout if you have a problem with this.

For some reason I deleted the series from my mailbox, must've been in
dt-binding review mode and hit ctrl + d. I've been away and busy, so my
apologies Alice for not trying this out sooner.
It's sorta annoying to test rust + scs on riscv, cos you need (unless I
am mistaken) llvm-19. llvm-18 + rust built fine, but has no SCS.

llvm-19 + rust failed to build for me riscv, producing:

In file included from /stuff/linux/rust/helpers/helpers.c:22:
/stuff/linux/rust/helpers/spinlock.c:10:23: error: call to undeclared funct=
ion 'spinlock_check'; ISO C99 and later do not support implicit function de=
clarations [-Wimplicit-function-declaration]
__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
^
/stuff/linux/rust/helpers/spinlock.c:10:23: error: incompatible integer to =
pointer conversion passing 'int' to parameter of type 'raw_spinlock_t *' (a=
ka 'struct raw_spinlock *') [-Wint-conversion]
__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
^~~~~~~~~~~~~~~~~~~~
/stuff/linux/include/linux/spinlock.h:101:52: note: passing argument to par=
ameter 'lock' here
extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
^
2 errors generated.

This occurs because I have DEBUG_SPINLOCK enabled. I didn't check why,
but Andreas seems to have introduced that code - luckily he's already on
CC here :)

With that disabled, there are dozens of warnings along the lines of:
/stuff/linux/rust/helpers/err.c:6:14: warning: symbol 'rust_helper_ERR_PTR'=
 was not declared. Should it be static?
If those are okay for rust code, it would be rather helpful if the
warnings could be disabled - otherwise they should really be fixed.

Following that, I got a build error:

error[E0425]: cannot find function `__mutex_init` in crate `bindings`
--> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28
|
104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
|                              ^^^^^^^^^^^^ help: a function with a similar=
 name exists: `__mutex_rt_init`
|
::: /stuff/brsdk/work/linux/rust/bindings/bindings_generated.rs:12907:5
|
12907 | /     pub fn __mutex_rt_init(
12908 | |         lock: *mut mutex,
12909 | |         name: *const core::ffi::c_char,
12910 | |         key: *mut lock_class_key,
12911 | |     );
| |_____- similarly named function `__mutex_rt_init` defined here

error: aborting due to 1 previous error

I stopped there, Space Marine 2 awaits.

Hopefully I'll get to say hello next week,
Conor.

--/xsIueD3ju/hMl6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuSsBAAKCRB4tDGHoIJi
0vtiAQCY+OLWcVZf0fpqur8tYsRgYAJPjNJ2P0PCVhfZCICfegD/QuzWgPhDgx3e
FEKT34MNfaoZAH0lOGq4JmHedMgOqQs=
=5XHB
-----END PGP SIGNATURE-----

--/xsIueD3ju/hMl6p--


--===============7234027059614271128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7234027059614271128==--

