Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756B3C71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 22:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5fEP0ErkzSyRrMj9cYfxLq7adgKw2WGK9MPyghkqAM=; b=A/0asitd7DAbx5OI1hRmGoXwQ0
	V08/srQjQtN6kPO0U5WckoLNal5yL3O1q+rErs7Eeh/NF163LmLGrpHjG3QxN9vP1sugr7F2/ABtS
	Cx+68GvUU8dYByNxvjCxep135SDDL9KfNIf24nU6yQ+SfSB0/x65lLZAN6RU40bZ6p0rBPRz8HWBU
	VgIli8d3kNSHiFo2VINpVABOnFEhPgtiB/oBISOcAX/Grlzoq0J6NP3TQwey4Ppglkqpv2JIIUf7I
	zdTwdMtx3lduOQcfEe2GhmNQRlT5n8ehc6fxkFc0xJacd5sKIamnmtj2vt/JEldX4OcTkeea8DWr3
	0q8R0xbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUMX-0000000Ba6m-1Tah;
	Wed, 11 Jun 2025 22:56:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTBK-0000000BMjB-2Sto
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 21:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF48AA51AA2;
	Wed, 11 Jun 2025 21:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF79C4CEE3;
	Wed, 11 Jun 2025 21:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749678025;
	bh=f3ULnqeUNCfguIS7uPKUYOKOX1OGzPpp858gNE9M2lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0dwj1x75a/82eYbOmWFC/GxTSmvzPMQLtuzvRP7ESlPfavuaKCBQ3WHwMzlpArAU
	 jEDm8ALPOQ9CSvT06RBPrxka6hfcuVHK/3/H6bUzZ3wwQv54FJirrHWCYXfXmtuGjc
	 FOakJWLO6hMFtFwjjXKtdTXgrFTswNtU8QwkKXdslWCLSp4UoZf8RHm5o8HOxeUKUs
	 17wSEKBKdUht1t6yVaMVKw4YC9G/2InSkyICk0y7i1u9GNTNxGx+NjciR2Zi9I2JrB
	 InHV82NTpE7HmGYlIIQWCNI/3I1OzzhfatbDgbZucAup92/F5OUOZp0mcaOWtzONMA
	 mue/MGwPQTqig==
Date: Wed, 11 Jun 2025 23:40:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/7] pwm: Add Rust driver for T-HEAD TH1520 SoC
Message-ID: <fya3ewoofrazpwh725ms4yaw6faq6txjyhxkr7hpl5i4az2iq2@fvfpisv6hjml>
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
 <CGME20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d@eucas1p1.samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-2-753e2955f110@samsung.com>
 <jbm3qvowi5vskhnjyqlp3xek36gzzqjt35m66eayxi6lmi525t@iefevopxjl53>
 <1d9bba9e-0f30-4039-812e-60b160271e6b@samsung.com>
MIME-Version: 1.0
In-Reply-To: <1d9bba9e-0f30-4039-812e-60b160271e6b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_144026_752466_FF75BAC1 
X-CRM114-Status: GOOD (  27.69  )
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
Content-Type: multipart/mixed; boundary="===============6844041261213240655=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6844041261213240655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jsn4mudgmd7iaf66"
Content-Disposition: inline


--jsn4mudgmd7iaf66
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/7] pwm: Add Rust driver for T-HEAD TH1520 SoC
MIME-Version: 1.0

Hello Michal,

On Wed, Jun 11, 2025 at 10:04:54PM +0200, Michal Wilczynski wrote:
> On 6/11/25 08:58, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jun 10, 2025 at 02:52:50PM +0200, Michal Wilczynski wrote:
> > Some comments use 2 and other 3 slashes. Does this have any semantic?
>=20
> Yes, they have a semantic difference. /// denotes a documentation
> comment that is processed by rustdoc to generate documentation, while //
> is a regular implementation comment. The compiler is configured to
> require documentation for public items (like structs and functions),
> which is why /// is used on the struct definition.

ok, thanks.

> >> +        let period_ns =3D (period_cycles as u64)
> >> +            .mul_div(time::NSEC_PER_SEC as u64, rate_hz as u64)
> >> +            .unwrap_or(0);
> >=20
> > What does .unwrap_or(0) do? You need to round up in this mul_div
> > operation.
>=20
> The .unwrap_or(0) is to handle the case where the mul_div helper returns
> None, which can happen if the divisor (rate_hz) is zero. In that case,

It can *only* happen if rate_hz is zero? If we had
clk_rate_exclusive_get() we could rely on rate_hz being non-zero.

> the period  becomes 0. The mul_div helper is introduced in this commit
> [1].
>=20
> [1] - https://lore.kernel.org/all/20250609-math-rust-v1-v1-1-285fac00031f=
@samsung.com/
>=20
> >=20
> >> +        let period_cycles =3D wf
> >> +            .period_length_ns
> >> +            .mul_div(rate_hz as u64, time::NSEC_PER_SEC as u64)
> >> +            .ok_or(EINVAL)?;
> >=20
> > If period_length_ns is BIG, pick the biggest possible period_cycles
> > value, not EINVAL.
>=20
> In this case EINVAL mean the function would return EINVAL not
> 'period_cycles' =3D EINVAL. This won't happen here since
> time::NSEC_PER_SEC is a constant, so this won't return None. This is not
> checking for overflow.

OK, so this is only there to please the rust compiler, right?

> >=20
> >> +        if period_cycles > u32::MAX as u64 {
>=20
> In here I could pick period_cycles =3D u32::MAX.

indeed.

> >=20
> >> +        iomap.write32(ctrl, th1520_pwm_ctrl(hwpwm));
> >> +        iomap.write32(wfhw.period_cycles, th1520_pwm_per(hwpwm));
> >> +        iomap.write32(wfhw.duty_cycles, th1520_pwm_fp(hwpwm));
> >> +        iomap.write32(wfhw.ctrl_val | PWM_CFG_UPDATE, th1520_pwm_ctrl=
(hwpwm));
> >> +
> >> +        if !was_enabled {
> >> +            iomap.write32(wfhw.ctrl_val | PWM_START, th1520_pwm_ctrl(=
hwpwm));
> >=20
> > Can this be combined with the above write?
>=20
> Per the TH1520 peripheral manual [2] (chapter 6.6.2.1), the PWM_START bit
> should only be asserted when enabling the PWM for the first time, not
> during a reconfiguration of an alreadyrunning channel. The separate if
> statement is there to handle this specific hardware requirement.

Yeah, I wondered if you could simplify that to (well, or make it a bit
faster at least) using:

	ctrl_val =3D wfhw.ctrl_val | PWM_CFG_UPDATE;
        if !was_enabled {
		ctrl_val |=3D PWM_START;
	}
	=09
        iomap.write32(ctrl_val, th1520_pwm_ctrl(hwpwm));

Best regards
Uwe

--jsn4mudgmd7iaf66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhJ98QACgkQj4D7WH0S
/k4EkAgAhvwWW2nW8s8HaHEbsyoN1pxYS7AKIL2TIYDDDBwv/sOyrGxBNnfAHzTM
2q8GZHrItPF3FwFOlf3OTK2aGKGNVH9YWL/uHKOdI/TFTq9YcFG/u/N+InLEugDY
Hha0aNG2NG4Rd9mpvhxTz9I7a4U+CsGkDsXrqLPyBo5zwce83fVw/u6NEpY8VtVx
GsHEJnOeL6BWhitn4QIt17CaJ/woggVwpr/qQ2TFPrYwD2hYFV1SH0oCBK/MRA7i
nO+qS6g3GzNbxJTuUI8gxXESv1hzbKdfhCuzePY0tD2NcnZtZ3SAEE/LRrcyIy4E
3OKJxYMmd2fQ27KRqV3aobmlMGliEQ==
=jsDl
-----END PGP SIGNATURE-----

--jsn4mudgmd7iaf66--


--===============6844041261213240655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6844041261213240655==--

