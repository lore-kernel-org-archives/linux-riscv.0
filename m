Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A139CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6rsL1zPX7lmeWvPdpJveYTnKWxvbDgWr6Nxip5jSWk=; b=GXZ4ylR/ywUT8YOT4VqD9560+a
	afucIo5A+RMWz90tsiTC9kRgcoxmD4VCia4ppmEws4MWkZXg4Z0ePY68l3yKOG4SEkAL3N/a28puK
	2Xhy4xkobX1gZApV9fRjyeiy8YFB3RZCDjM5EYXaF9cJhQQn0KLEA4R/t7SmPEqClPhNR4zEGJ6AB
	cg0KC3r7Vd0a7cDlcipJF8Q7yeUUjxUyunAsg9/emE1gR9rB7aq9rWG9pRGqAXNY22mSP4/o6T8He
	EH96XjXbAMSKe4yp7WHorLlCk7r5yLvoNYr070WliR6HUxcHsYzk3DSfYfHiz9HJO4JxsNwzCHcKP
	jDh0WhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE32Q-00000000cbu-1f0z;
	Wed, 29 Oct 2025 10:04:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE32O-00000000cbk-2Grq
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 10:04:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6ABEC603A2;
	Wed, 29 Oct 2025 10:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0B2C4CEF7;
	Wed, 29 Oct 2025 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761732255;
	bh=9EkDS1DJ2fZOAXUw2/HfVLqWdqgIctXJK7bhJgzpr3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEPuyLSF2EDJR259VKbjKrbAixkoep3+mPQlbzCuFXXW8lk6JasA5n6gE4de/4xeO
	 Yr11i6FAuqWGikCB8lmtGECXyXXVvcEVrNIR7u/LUiYLyYwaKeiMEAFE6ibhdiRI6d
	 1n2mW7GrLXh5SRItmsfHxwD5gpDH/C3aOfM9A+kPtSd/VLZn0mtBi4/7yuU7WQcvvZ
	 FzjBFxv9yeviiF05ShfmE8KX5uyx5jnkcJOgYNfOOjWqU/DAxKA66mvvzPIo6EuSv/
	 XaOmL6xeI1LVAyIzTCZmNBO2iiQAhXXpXh+6IbAd/axzcmj7sSpWzn3sPShpGYI5Cx
	 WUSgAFhtpVBVw==
Date: Wed, 29 Oct 2025 11:04:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/4] Introduce import_ns support for Rust
Message-ID: <2dedlnknikkrwg5f6ocuvjrogdjuqyg4sg6zkkao4w4yyvvsje@dkt7rco3fen3>
References: <CGME20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5@eucas1p1.samsung.com>
 <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============5555432949253362411=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5555432949253362411==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lwldfp7ktswpmmdy"
Content-Disposition: inline


--lwldfp7ktswpmmdy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] Introduce import_ns support for Rust
MIME-Version: 1.0

Hello,

On Tue, Oct 28, 2025 at 01:22:31PM +0100, Michal Wilczynski wrote:
> This series addresses build warnings reported by `modpost` for the Rust
> PWM driver (`pwm_th1520`) in linux-next:
>=20
> WARNING: modpost: module pwm_th1520 uses symbol pwmchip_release from
> namespace PWM, but does not import it.
>=20
> These warnings occur because Rust modules, like C modules, need to
> declare their dependencies on C symbols exported to specific namespaces
> (using `EXPORT_SYMBOL_NS` in C). This is done by embedding
> "import_ns=3D<NAMESPACE>" tags into the module's `.modinfo` section, which
> `modpost` verifies.  The C macro `MODULE_IMPORT_NS()` handles this, but
> the Rust `module!` macro lacked equivalent functionality.
>=20
> This series introduces the necessary support:
>=20
> Patch 1 extends the core `module!` macro in `rust/macros/module.rs`
> to parse an optional `imports_ns: [...]` field and generate the required
> `import_ns` tags in the `.modinfo` section.
>=20
> Patch 2 adds a convenience macro `module_pwm_platform_driver!` to
> `rust/kernel/pwm.rs`. This macro wraps the standard
> `module_platform_driver!` and automatically adds `imports_ns: ["PWM"]`,
> simplifying module declaration for PWM driver authors.
>=20
> Patch 3 updates the `pwm_th1520` driver to use the new helper macro,
> fixing the build warnings.

Given that for now the pwm_th1520 driver is the only user, does it make
sense to merge this series via my pwm tree? If it goes via a different
tree, I'd like to have a tag to merge into my tree to hand over code
which is free of warnings to Linus in the next merge window.

> Patch 4 includes a minor clippy style fix for the `pwm_th1520` driver.

If you could mention the command that makes this warning visible, I'd be
glad to add that to my repertoire of build checks.

Thanks for addressing the issue
Uwe

--lwldfp7ktswpmmdy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkB5pkACgkQj4D7WH0S
/k6UYwf/aiVsmV7r/vjSJFC7oRNtghIAzmFFDcufzkGp1TwjNtiHxd4YrClxhsz/
MOcxmpcNkV/v2XVyNiKW0Xyyex/qwXN6tDX2JMFfcV09ShOCL9N4BTXznK0a7BEB
1IGAETAi5P9nQhgoTVFcOvC25+50BprwsewCeiHF/g/kV2RSQJWZnnqO/j4ldZjz
PDnj5fTuh+RlP0v5ylkA3zai6OehtTthAor6zx6MVjn+wrewOMQtD3wLYr/yIkdA
vvarCxMjRTfVV6fe77LkdLPpy+Dfj/j6eLaYGUckmgIyFKMuKu6SrJT5CDiHgtoK
sSpNMbCFNacM7GRgIdYJD70j71Xy+A==
=mmj+
-----END PGP SIGNATURE-----

--lwldfp7ktswpmmdy--


--===============5555432949253362411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5555432949253362411==--

