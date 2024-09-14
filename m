Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB1FC021A7
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 16:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMexnncMAfhnRyoV/u3pvVIKGzHp/lrurcqeZBI1gn4=; b=li76rhWw4p2ejPxNNraIqVMh1d
	oU4S2jbTk2jP9OHRScRqa8oQOBk8qwsLz/kXS85c4WZ4wMHzf5nh+pvktp9c45HiVlm6IF4SV4rP1
	VM+9GiR/2JmPp1ayO0TTmmTJQu3uRLQcy6DgrP8atgs+TCfxuMQ5tIAdDM0bE6kuuUgNVoNwIfUQQ
	hUTDlZrOm8bC993Lg2R71+F9JcrQZ3ShC3riyt31/yaiW6T/cDw/GBtx0uqGNnu2Nuu9P+5qZd8ez
	vgnG8hmw3dSgb1vwBw+/0vdTh1rzxWMBKk3oJz+MMxooaJs6Fqbre2hJQ5UVa0cwPBwecKOSUhp35
	Uy6qHiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spVvn-00000000xw0-2JZt;
	Sat, 14 Sep 2024 16:47:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spVuh-00000000xos-3wJz;
	Sat, 14 Sep 2024 16:46:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B99FE5C5A14;
	Sat, 14 Sep 2024 16:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28943C4CEC0;
	Sat, 14 Sep 2024 16:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726332382;
	bh=Z9KLHDysHT+QZFA9N2DhaeAfpGSFeSGzTbu4CvQ+R/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ES4QW2+Uwsj+XxM5lsWtejDsyOt9ZxevTIIBqFbZx8Ekjs8gGHWSIh3a8CpIVW9HY
	 qNvzSPQulxAR2lc1Zc3mYbp1WxeuanQ/YnOtjtE4tbV7Dk3hpC2ZFMR9Ui/ZcXnJMd
	 joB8iOzpysPGpZoTeUIclgN/bkqEURdblOs3dA5z94M8KJohCAXAWf6e3+fv3tH/aS
	 w/hAMRF8JFDk28dxJwTeM70QvXD9PExnCQFxaf7pkYJ1pQtHWRvd23OFe9056W6CiY
	 9mOw0QVp9E0wRJnUMOiLwN8YTMDpTOuEy4jt3c/ZVaBHUvCUoEMFlZojKSaVomwxHJ
	 bBo2jcypLgsUQ==
Date: Sat, 14 Sep 2024 17:46:14 +0100
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
Message-ID: <20240914-jitters-barber-a0e51e7b83a8@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud>
 <20240914173037.422902b9.gary@garyguo.net>
MIME-Version: 1.0
In-Reply-To: <20240914173037.422902b9.gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_094624_141383_A464BFDC 
X-CRM114-Status: GOOD (  11.21  )
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
Content-Type: multipart/mixed; boundary="===============1755086303488815978=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1755086303488815978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B4QM7QVF324ySoAc"
Content-Disposition: inline


--B4QM7QVF324ySoAc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 05:30:37PM +0100, Gary Guo wrote:
> On Fri, 13 Sep 2024 22:17:56 +0100
> Conor Dooley <conor@kernel.org> wrote:

> > error[E0425]: cannot find function `__mutex_init` in crate `bindings`
> > --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28 =20
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
> >=20
> > error: aborting due to 1 previous error
> >=20
>=20
> Do you have PREEMPT_RT enabled?

I do indeed.


--B4QM7QVF324ySoAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuW91QAKCRB4tDGHoIJi
0g1AAP4jVE5sTjh7ZpAYSXX8cAez9VIN9z196SmWTQQotiAMIQEAglBSa7/hmf+1
k1drziNQUGk/j2h9jhXIhrEAGrRagwI=
=6Xln
-----END PGP SIGNATURE-----

--B4QM7QVF324ySoAc--


--===============1755086303488815978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1755086303488815978==--

