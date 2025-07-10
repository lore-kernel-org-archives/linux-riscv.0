Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A3AC83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lTqMbmdAedp1Ii64ni6vfhV3r+3Va4unVtXM9QcaVA=; b=Qjt9rR1+aNMbd5BS0YQm1T4htQ
	/70A4pOfmvXQZ1VNn61u7oXgOqHO3XDe7conTbgnrRiuh+g2e3Sce4Bor6Aq5ZEx7aqpSOcCWh++W
	zZA62meSHDVa2wZndMOT5WIKf75z21Ou7RFBJGo2B9M3X8kU+wCcXrnSFY/b3baE64zoIfOUs4i0X
	QWhOdrhWYM9E3hHvG+sL4sR2cSt7NnTd+trdqviobdXtSz+q3Aeg+BPjIRyHI12g1bjFHT7zjLtGM
	JREJYhcFbJU2Ykvqpz7QZSTfeC3LAirg1i7YGwbQNcuCSphzpdu6GIH2xcu+3/Sp1mGdr2uCtdEnI
	YNPLOs+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Px-0000000DPtv-0cHQ;
	Fri, 11 Jul 2025 01:19:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyKS-0000000D0ZE-1a8f
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 20:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6B5A5C6BBC;
	Thu, 10 Jul 2025 20:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C3DC4CEE3;
	Thu, 10 Jul 2025 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752181035;
	bh=dTj1PgRidTOLVLEtGfRLQxZmWoRdeTJS0WqL2NRwj5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8xFd1rCuogV5ElTbitVeh66XIJbqLQbP79wuAq4VWUFu+XwGY9oCcITJsjilwY65
	 YtnlgRO7HjHwI3Lq8DXAx+lrHvWcjTKOED6zQOfLe3tGXWu6e9Ie/saBjng84mnNiU
	 nMIzKlzO+LLznwKhGRmADgoWjtJ4ZdAMpXdqZEplGD4bZlxoJ5eY/HuVPwGkKeIHV5
	 IaKa1hUC+nDUNleSTO4Cr3qitVPOCxBMSfswcnaAmiXIdmvfJWk8NoMPRwBwhLL3OR
	 22YaIiphANk3NK3lX+hbSH8/E2MDDVb0Wk7aBclJFmvmh9/nspyow6CM22fBdFOZnf
	 LGGwXSUVXXzFA==
Date: Thu, 10 Jul 2025 22:57:12 +0200
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
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <cbxpqormchajfcnf7xxopd7j7igriqus4cuu5jfvxb3mbfb5tu@qz4rc67vjyif>
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com>
 <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
 <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
 <ipvaegqlkco5qinhvn33mqvg7ev2walvs74xtzvhimxsfsfzhv@gcmpxcdtetdn>
 <e77eab1c-446f-4620-95be-d343684d1e95@samsung.com>
 <4hmb3di5x2iei43nmrykrj5wzlltrf3vrnqvexiablonbscn57@4bbsz5c76t63>
 <DB8I5J8ZY7QF.2D8HEN6JX4HSZ@kernel.org>
MIME-Version: 1.0
In-Reply-To: <DB8I5J8ZY7QF.2D8HEN6JX4HSZ@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_135716_497377_E07D3728 
X-CRM114-Status: GOOD (  26.55  )
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
Content-Type: multipart/mixed; boundary="===============4277162054672493343=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4277162054672493343==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ytlf77dj6h472td"
Content-Disposition: inline


--3ytlf77dj6h472td
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
MIME-Version: 1.0

On Thu, Jul 10, 2025 at 06:06:26PM +0200, Danilo Krummrich wrote:
> On Thu Jul 10, 2025 at 5:25 PM CEST, Uwe Kleine-K=F6nig wrote:
> > Hello Michal,
> >
> > On Thu, Jul 10, 2025 at 03:48:08PM +0200, Michal Wilczynski wrote:
> >> On 7/10/25 15:10, Uwe Kleine-K=F6nig wrote:
> >> > On Thu, Jul 10, 2025 at 10:42:07AM +0200, Michal Wilczynski wrote:
> >> >> On 7/7/25 11:48, Michal Wilczynski wrote:
> >> >>> The series is structured as follows:
> >> >>>  - Expose static function pwmchip_release.
> >> >=20
> >> > Is this really necessary? I didn't try to understand the requirements
> >> > yet, but I wonder about that. If you get the pwmchip from
> >> > __pwmchip_add() the right thing to do to release it is to call
> >> > pwmchip_remove(). Feels like a layer violation.
> >>=20
> >> It's required to prevent a memory leak in a specific, critical failure
> >> scenario. The sequence of events is as follows:
> >>=20
> >>     pwm::Chip::new() succeeds, allocating both the C struct pwm_chip a=
nd
> >>     the Rust drvdata.
> >>=20
> >>     pwm::Registration::register() (which calls pwmchip_add()) fails for
> >>     some reason.
> >
>=20
> (Just trying to help clear up the confusion.)

Very appreciated!

> > If you called pwmchip_alloc() but not yet pwmchip_add(), the right
> > function to call for cleanup is pwmchip_put().
>=20
> That is exactly what is happening when ARef<Chip> is dropped. If the refe=
rence
> count drops to zero, pwmchip_release() is called, which frees the chip. H=
owever,
> this would leave the driver's private data allocation behind, which is ow=
ned by
> the Chip instance.

I don't understand that. The chip and the driver private data both are
located in the same allocation. How is this a problem of the driver
private data only then? The kfree() in pwmchip_release() is good enough
for both?!

> So, in Rust we not only have to free the chip itself on release, but also=
 the
> driver's private data. The solution Michal went for is overwriting the PWM
> chip's dev->release() with a callback that drops the driver's private dat=
a and
> subsequently calls the "original" pwmchip_release().
>=20
> This is a common pattern in Rust that we use in DRM as well. One thing th=
at is
> different in DRM is, that a struct drm_device (equivalent of struct pwm_c=
hip in
> this case), has it's own release callback for drivers that we can attach =
to.
>=20
> PWM does not have such a callback AFAICS, hence the Rust abstraction uses=
 the
> underlying device's release callback and then forwards to pwmchip_release=
().
>=20
> Hope this helps. :)

Not yet ... :-)

Best regards
Uwe

--3ytlf77dj6h472td
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhwKSUACgkQj4D7WH0S
/k7UEwf+Mq0EvPs5ErWpZyBBQ869gKjtt4JRWGGURz2WiXQSn4Q+QYjmzZsn3SRY
4xJ/3j5ydsPdPMAcwv+SnwafVqhQ3K1CYJcT44FPbuINvcaD9PD2Lx7p4juqsoHI
rcj6Ufi4oaQ+nQVL94LNzKFgFzR/HgN8QGjPcYUgjKEnhGntaAsRM3epvTL+AoJc
6UqUqmc/UGQV6++s3A/I/WRsXMAHuwqQ2KAg1UZbiZMZ6vR6IezKAkgNcY5sfcDE
PJfgzObnjZaWKwWR5wCrd2idtF8Emzfw2SpjrjMDpqmvvk/8TU9IXbVA5u055xHl
3fGdG/1ee1UvEY2o3Nchov/VstaN9A==
=MLfd
-----END PGP SIGNATURE-----

--3ytlf77dj6h472td--


--===============4277162054672493343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4277162054672493343==--

