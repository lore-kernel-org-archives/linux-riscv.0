Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64964C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpTZXeUUceGXW8PBG4MAu/kLUPlxJgnWTUJjej0mPwI=; b=kzWKh/XNCokyzqcNXZe7H8AGJt
	3nNIZ07ivzoSY6LMy1ikvAexYUL6XFG+59Nsw2MFd5CksZX9PLnlFy8ws8GFZWFHJitTjSAXOaJDz
	YuuX1soHWWoecnXURsGp5+WZy6lZ2DdrD8MYWuxhU4J2lOjH6zzOhFYt8Ojvalmb7PGkZZumAn+4n
	yRcijH+43dK06mz+Auzo9bt4Fm2yJCLYIXCkgL5QYgvvMstEa1RqLTuZbWdUObDdHyJguMTb6mzl1
	kP8hQSP75Hs9QtueAjkopMxsqmF/8NM23IRMcoU4YnPUxRhuy0sTkYkg6jllmKnREPHLj+OZFamJ4
	p2qSdD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfn8-00000001b10-2aED;
	Mon, 07 Jul 2025 06:57:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfn5-00000001azj-42RN
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 06:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E565944DD2;
	Mon,  7 Jul 2025 06:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD05C4CEF5;
	Mon,  7 Jul 2025 06:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751871446;
	bh=ZMFouIdoe+6RcOPHeEsSglmRRWZz5oi5nySTLlOt42c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T1w+w4uutQXOcN/7UKG46xcY0YEwfYJm5FRZDBeIhqH4cgcku5auLJYBiXF4TVHlp
	 jN/2XezsjyK3QJUzG47US7YzVEQh14BvazekCPd1AI4Wh0VfdrWuGIDZV+kECJ3BoT
	 z4cSISkynAqXgk4atyTOnFvBd/a4lwXeZMwZaZ4xNg/TOnZUjYhF2D+l7rh2zlbIwc
	 PRyoq2s5GrCJ9W/g9tqjdq2AyRuJzHraaLfAvAWEaGzslRlbUsobpmy6RoyfRM66o7
	 hsZJ7oMJBVR6xQQdUpWVJHqK9oZ+EuT4W2l956kIIruAL0McFd6AWJWKkRUwc8Elyr
	 QST5GpsMWFw+w==
Date: Mon, 7 Jul 2025 08:57:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 2/6] rust: pwm: Add complete abstraction layer
Message-ID: <yxtnwax73wkliqkbq5736tswbxrblpwx4bn6z257tyd2xu23jx@y6k6iwdhmsgy>
References: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
 <CGME20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2@eucas1p1.samsung.com>
 <20250706-rust-next-pwm-working-fan-for-sending-v9-2-42b5ac2101c7@samsung.com>
 <aGpqqGMTU3a3O8cn@pollux>
MIME-Version: 1.0
In-Reply-To: <aGpqqGMTU3a3O8cn@pollux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_235728_044159_C7F5034A 
X-CRM114-Status: GOOD (  14.79  )
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
Content-Type: multipart/mixed; boundary="===============5768829551983646995=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5768829551983646995==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="il3m5sp7a2busx2h"
Content-Disposition: inline


--il3m5sp7a2busx2h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 2/6] rust: pwm: Add complete abstraction layer
MIME-Version: 1.0

Hello Danilo,

On Sun, Jul 06, 2025 at 02:23:04PM +0200, Danilo Krummrich wrote:
> On Sun, Jul 06, 2025 at 01:45:13PM +0200, Michal Wilczynski wrote:
> > +    /// # Safety
> > +    ///
> > +    /// `dev` must be a valid pointer to a `bindings::device` embedded=
 within a
> > +    /// `bindings::pwm_chip`. This function is called by the device co=
re when the
> > +    /// last reference to the device is dropped.
> > +    unsafe extern "C" fn release_callback(dev: *mut bindings::device) {
> > +        // SAFETY: The function's contract guarantees that `dev` point=
s to a `device`
> > +        // field embedded within a valid `pwm_chip`. `container_of!` c=
an therefore
> > +        // safely calculate the address of the containing struct.
> > +        let c_chip_ptr =3D unsafe { container_of!(dev, bindings::pwm_c=
hip, dev) };
> > +
> > +        // SAFETY: `c_chip_ptr` is a valid pointer to a `pwm_chip` as =
established
> > +        // above. Calling this FFI function is safe.
> > +        let drvdata_ptr =3D unsafe { bindings::pwmchip_get_drvdata(c_c=
hip_ptr) };
> > +
> > +        if !drvdata_ptr.is_null() {
>=20
> Is this check needed? I think one can't create a pwm::Chip instance witho=
ut
> providing a T, so this pointer can't be NULL I think.

There are currently a few C drivers, that don't use a private data
struct that is managed by the pwmchip. One of them doesn't make use of
the pwmchip's drvdata at all. The latter is drivers/pwm/pwm-twl-led.c.

Best regards
Uwe

--il3m5sp7a2busx2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhrb9EACgkQj4D7WH0S
/k73WQgAtGaf05GK6mp6VId6WGdPMpI5HvMe59Y9FzSAgjuK2ocbufXwhIeC4B2Z
iKbYy6iSEiKnvxwgtSZBx4g7t9ple3Tn36phcBKy+dJ0RwpiIVXydM5F8LqT0wwG
FLSCJ70vlb2c6Ot2qkfNHRxG8UcHmx/Jj4irYFivjUc2tify4Y+k4L9eZXR6JPXs
rEIhqFdncvPn86sx0voin34rS+UwAilvxxLgxB1zLgxjlzdbUB0Ggfng+4PcQVHf
6FX8qctUfqKFio4Zq6EkTEMNhc91Gx5VENyuzRzhuOYYM2huuOn71N+TdxiUPc7q
nG3/xHL2aZvxO+P+HHLYxapSy+M34w==
=lM1B
-----END PGP SIGNATURE-----

--il3m5sp7a2busx2h--


--===============5768829551983646995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5768829551983646995==--

