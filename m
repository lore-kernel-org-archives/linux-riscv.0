Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D30DCCF9EB
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz1qqrtkhcTaxR8nrchKcJLJqFl6e52DL5SShjvVB+4=; b=beXRc4uVy4L0MwGAFWlpwY5qT3
	n3K1bG+CZ9SmlXr1RmXZ2XYVnKOP+2CgbZ2yDAe4xwIr45GKPiYSMm9lggmLvs9+uDiLp2yid+Nlk
	Cfc8dYCXPDy7L+jIGSeS1ksJK1zuMQBGX5flHqUYppuqpzRd4sjDmacxgTzNC6ac57rjdoFEKSPkP
	0ESWk5U+9QtmV4fWJxP5rrAABjBe9NtYdt0eUH+wAJuX4f/LglMEvdVl0jxtaxW8bYjPk8w4mvQt4
	Mw/hduxfea1Ef85NOiFihstizgy8qbBtr42y9YnEqQDrS7yQwiEKaZ1bYht48WcWds4R6RcqKejwT
	QFC/HfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjrN-00000005Z7c-0ZEf;
	Fri, 31 Oct 2025 07:47:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjrK-00000005Z7E-18EE
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 07:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96FF940ACF;
	Fri, 31 Oct 2025 07:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DACC4CEF8;
	Fri, 31 Oct 2025 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761896859;
	bh=7GmpMUcbzk3IQ7Nc39bFAOvP0kWu7uS4b5WKDgdELi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPhR7nl2fhn2TNbDxPnu9RgTr3vBzLt1y7c26zXBBCO0tkA1GR2wSDFXagCGhCBzl
	 HV35U/h4eoM9O6dxrv6UcjV8VQvpJduydaNFEMCJC05nzGJgwt6zSoLMkGkA85q0RK
	 mFvql6USWFFEb2/XJsR0W3JZqNm89fVoHsIo4Sny/Tw7Enk3imrpixHLz3xsy4a/uA
	 +6jlx/+0V0EU12obrPIaAP5oCzcxazoL9hsXWY4qI6hlAiNCKLkNdStudLg2ap4TL/
	 zi1s11JBuOnEcXV44LUUuPjJEiIkGWSxWPwu80hs2aNXJj3VttFW0y4HC9WyU1dU6S
	 9hLZW5Sv6yXGA==
Date: Fri, 31 Oct 2025 08:47:36 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
Message-ID: <h3sivr3uuzr5oodqe326svchbw3rzo4f4nw4chpeee2jwzjq3j@bdtecauehkn4>
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a@eucas1p2.samsung.com>
 <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_004742_490903_8E1E4869 
X-CRM114-Status: GOOD (  15.58  )
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
Content-Type: multipart/mixed; boundary="===============8951990068293424856=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8951990068293424856==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ecrpz7cwozvvwprk"
Content-Disposition: inline


--ecrpz7cwozvvwprk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
MIME-Version: 1.0

Hello,

I already asked this in reply to the cover letter, but the question was
lost on the way (no offense!), so I'm asking again. As it only really
affects this patch, I'm doing that here:

On Tue, Oct 28, 2025 at 01:22:32PM +0100, Michal Wilczynski wrote:
> Kernel modules that use C symbols exported via `EXPORT_SYMBOL_NS` must
> declare this dependency for `modpost` verification. C modules achieve
> this by using the `MODULE_IMPORT_NS(NAMESPACE)` macro, which embeds an
> `import_ns=3D<NAMESPACE>` tag into the `.modinfo` section.
>=20
> The Rust `module!` macro lacked the ability to generate these tags,
> resulting in build warnings for Rust drivers (like the PWM driver) that
> call namespaced C functions.
>=20
> Modify the `module!` macro's internal parser (`ModuleInfo`) to accept a
> new optional field `imports_ns`, which takes an array of namespace
> strings.  Update the code generator (`ModInfoBuilder::emit`) loop to
> iterate over these strings and emit the corresponding
> `import_ns=3D<NAMESPACE>` tags into the `.modinfo` section using the
> existing `#[link_section]` mechanism.
>=20
> This provides the necessary infrastructure for Rust modules to correctly
> declare their C namespace dependencies.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  rust/macros/module.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)

Can I have some blessing to take this patch via my pwm tree? Would you
prefer a tag to also merge it into your tree? Then I would apply it on
top of 6.18-rc1 and provide a tag for you to merge.

Best regards
Uwe

--ecrpz7cwozvvwprk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkEaZUACgkQj4D7WH0S
/k43lgf+LJYRV7/XhylyloNNOExBGW6OxuOAexD36boCRoglcjhV86Q2uMyIjEzN
i8a/laz8cvofAPfyuKZINk44WfDiGolM6Ncee2fXergLU/wQ1BNCHjBv5ceRzF7h
hYMXVSkFZXdpQIFT3Fb/dVlPhTvYH/MNHKPsYKBvSb3gnmJZi6VB/JnEq3rFCMDk
GhOmZURIVBPZZ47EqWPAxkF3uxwZMXcDrgcYp5SidQgsXkTiR8oRMutPMm6TGdu6
MgR62vBP6MalplxmqsxDJ1YNB/e7cNxxv6vo/O/ljyqZUBDr2GEkBxPysxWcm48N
5LhG2qlEyrGDF/mw46sdzgJhkm7+NQ==
=Hn2I
-----END PGP SIGNATURE-----

--ecrpz7cwozvvwprk--


--===============8951990068293424856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8951990068293424856==--

