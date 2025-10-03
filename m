Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2260CAC5B0
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 22:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPTRxlnGNm0H3N6iw++tFU/1Uu+MvHRyEPEvBLre8OI=; b=faOzKMb3osjJwe89io2J/ZlyLl
	9/EHBI3Ln71K/OZ7CRGHpAomZKq7xdKykRy0A5WCaaCEBFoY4O+5A4tJt2uSqhBwmGlNhfZgi4cGV
	7LQRl5Ob+ePJ7qmImdC294oUSL9w+nR8BnfcQ6/umBXvAXbzawPhqA7qvFOgTEjBQEi280xEYwY1K
	iQpAV/ztHCmjzPF9QfhzggayET8FMauYFkki2+XoW2TkGxw64/XUe2zUHKhAO3Ki1xiymbbX5d6dv
	2J3UQFoJYcLXUVMfyBQkUDslCwm+PKQdw6Moevst+0Ot6UNJjsMjOfrW7uLb6/ceLVuBelUurBlN2
	ePnVWOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4nvk-0000000DCAT-2cf9;
	Fri, 03 Oct 2025 22:07:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4nvi-0000000DC9u-0KaR
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 22:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DC0143762;
	Fri,  3 Oct 2025 22:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AECC4CEF5;
	Fri,  3 Oct 2025 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759529229;
	bh=w+IacxaWuWyWgcXzziS0Xsget5PpIhVBKXaCaaHjjko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHM+6P3hzDiHwELDQAhkeiz8mw2nMCQVlm1fS3GWsMAyam4EX3sS/XLGzQSGt5kGg
	 w1XN2nWU4htbdSCEoumczNKjRymN9PDNBufoqy+enaU30jeRTesC5X2Eomt+NeVOJx
	 4UwUN7uKpACDm9TU1QWc+XQBKhJFRn/H8nUKEL4x1J4aamBX8mx+CYRRDDDsD/vUjZ
	 Cfe4D+QBUg79DADnHVIa1gE2LJQjkSXN+AXP0KTT2BXXDWba2Sw6iWb5il01akjLpw
	 mhdSgQ0J/Yji5Wv9eKSo/O3i3jNOPsxcWb2KLUpaw0Q82X28Gp3hxDDz+wL/n+CuOG
	 8IGiKIBo+hDfg==
Date: Fri, 3 Oct 2025 23:07:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Matthew Maurer <mmaurer@google.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: cfi: only 64-bit arm and x86 support CFI_CLANG
Message-ID: <20251003-viewing-residency-d4f849c6fbe6@spud>
References: <20250908-distill-lint-1ae78bcf777c@spud>
 <CANiq72mw36RzCtNVax650fJ=+cYjuGNF722_Mn2Oy1FAvxWc8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72mw36RzCtNVax650fJ=+cYjuGNF722_Mn2Oy1FAvxWc8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_150710_163460_F2A78C2C 
X-CRM114-Status: GOOD (  21.04  )
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
Content-Type: multipart/mixed; boundary="===============6710532815633219113=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6710532815633219113==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3LGMo/RvwtuM22VG"
Content-Disposition: inline


--3LGMo/RvwtuM22VG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 08, 2025 at 04:36:09PM +0200, Miguel Ojeda wrote:
> On Mon, Sep 8, 2025 at 3:13=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > The kernel uses the standard rustc targets for non-x86 targets, and out
> > of those only 64-bit arm's target has kcfi support enabled. For x86, the
> > custom 64-bit target enables kcfi.
> >
> > The HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC config option that allows
> > CFI_CLANG to be used in combination with RUST does not check whether the
> > rustc target supports kcfi. This breaks the build on riscv (and
> > presumably 32-bit arm) when CFI_CLANG and RUST are enabled at the same
> > time.
> >
> > Ordinarily, a rustc-option check would be used to detect target support
> > but unfortunately rustc-option filters out the target for reasons given
> > in commit 46e24a545cdb4 ("rust: kasan/kbuild: fix missing flags on first
> > build"). As a result, if the host supports kcfi but the target does not,
> > e.g. when building for riscv on x86_64, the build would remain broken.
> >
> > Instead, make HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC depend on the only
> > two architectures where the target used supports it to fix the build.
> >
> > CC: stable@vger.kernel.org
> > Fixes: ca627e636551e ("rust: cfi: add support for CFI_CLANG with Rust")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> If you are taking this through RISC-V:
>=20
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Hopefully someone can take it! I was hoping it'd be 6.18 material, can
someone grab it for fixes please?

--3LGMo/RvwtuM22VG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOBJBgAKCRB4tDGHoIJi
0hn2AQDcRLVCHp2IPXIs5re6hj5zLylHHpS/BPI8BgjOwOBFwwEA/TM7CNhkYPZK
8W+W/SJgbmEWAv5y6PlKgzmM5lGFrAI=
=4bNn
-----END PGP SIGNATURE-----

--3LGMo/RvwtuM22VG--


--===============6710532815633219113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6710532815633219113==--

