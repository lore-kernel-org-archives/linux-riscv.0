Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8EBC83038
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 15:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DfarCxltXa3gaTvdlpFS5EDy5G1hl0gQNWICCoVVaY=; b=3WJ0AxP5JN0Kov5DBcNFA0JjQF
	EEk4YZuRLgwirLAVSDqnom+Ukc/nPXxr4b6GQpJ2kkqIV/cepijCrOIiLKKN9yARGkwQx0yJJI5mp
	QYKgjD0P7wRIK2IwFhGMvQ6+f3/9hx7F6lE4pAQiFwXA4JfxbRJP2msdnKQghP5Mb6tFOR0agCSCZ
	ooiryuwraYhNEEIjbC9tWP5OSWWTk6kxmqmJrAxpk5HGivCG5r6ZTWeo+gNcvfwQUY8GyNrDs3XV0
	OYom8sRqb60a/yQRdDOBWPuMTk+0LyYoLLhm+rfuGxrrQmfofpDmzcAagkHNNwpXDc7fa73yp8Apo
	m3TIL1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWctA-00000005sqR-0dTf;
	Tue, 01 Jul 2025 15:27:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbL1-00000005ZRx-2iPd
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 13:47:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BD2A6143F;
	Tue,  1 Jul 2025 13:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA291C4CEEB;
	Tue,  1 Jul 2025 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751377674;
	bh=BJoRfhtEL+X1bH/jHqhnpouOMrtPwiiWI2DW54qSaAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKP8WDWFQdAxIkofySD3R0UNvP/6lJYjlUArVy1GUBHMQ2n59LMtoTmERDI7fHBcR
	 tDGFl4wmyZj07pPEA4II5Kpy0C+EF0wyENGWgdZ5nFpE/gvEfVUuwNsUPvpw91kcSt
	 mKDgTEpdxdUrmhQ97sNkYt9BgbwFNXkFN/RSmxvV3P1XZUQApED6Z06R6YqYIahV+4
	 D0NqogZd6jr629Km1IGner83srqGMqXnUCsG8cS69bDb/3cK4E6Aq10p689ifbLolL
	 j3MFZwVNnyHJ0/xTS+e8qCkDvoH2d84I5arsh8ookOXd+8vRWqgKxOJ6zRBUbqgi5w
	 TdLOM7wRWjSOw==
Date: Tue, 1 Jul 2025 15:47:51 +0200
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
Subject: Re: [PATCH v5 1/9] rust: pwm: Add Kconfig and basic data structures
Message-ID: <wee6qrsgqojb36pb2ykle5dzlt3x3vscjx6nedy3xlrtdgy3wm@sgduuiflto2p>
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
 <CGME20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5@eucas1p1.samsung.com>
 <20250623-rust-next-pwm-working-fan-for-sending-v5-1-0ca23747c23e@samsung.com>
 <q7sz7uci5vnyc24laqzs56vgt4i2jamb3ifyxkqom6qcml5kkv@642prvwxjkxc>
 <c127e368-8c1f-4299-b222-a105940ac34e@samsung.com>
 <1450a457-4bd3-4e9c-a74f-3be15c9ec84f@samsung.com>
 <n5zfbzu3hn7kqdf3xc7orpeovvdprc2xlf7w3f62uoohkxdk5c@cc24urt5xf36>
 <ca58f110-7f9a-427d-b018-e514cf34adaf@samsung.com>
MIME-Version: 1.0
In-Reply-To: <ca58f110-7f9a-427d-b018-e514cf34adaf@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============6346167562710554710=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6346167562710554710==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a3yx2qm3x3iy6jfn"
Content-Disposition: inline


--a3yx2qm3x3iy6jfn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/9] rust: pwm: Add Kconfig and basic data structures
MIME-Version: 1.0

Hello Michal,

On Tue, Jul 01, 2025 at 10:24:54AM +0200, Michal Wilczynski wrote:
> On 6/29/25 12:29, Uwe Kleine-K=F6nig wrote:
> > On Sat, Jun 28, 2025 at 09:47:19PM +0200, Michal Wilczynski wrote:
>=20
> >>>>> +    /// Sets the polarity of the PWM signal.
> >>>>> +    pub fn set_polarity(&mut self, polarity: Polarity) {
> >>>>> +        self.0.polarity =3D polarity.into();
> >>>>> +    }
> >>>>
> >>>> Please don't expose these non-atomic callbacks. pwm_disable() would =
be
> >>>> fine.
> >>
> >> Hmm, I've just realized that without those setters it would most likely
> >> impossible to correctly implement the get_state callback.
> >=20
> > You shouldn't implement the get_state callback for a waveform driver.
>=20
> You're right that a new driver using the waveform API shouldn't
> implement .get_state.
>=20
> My goal for the abstraction layer, however, is to be flexible enough to
> support writing both modern waveform drivers and legacy style drivers
> that use the .apply and .get_state callbacks.

No, please don't. New C drivers should implement the waveform API. The
same holds true for Rust drivers. So don't create a door that isn't
supposed to be used.

Best regards
Uwe

--a3yx2qm3x3iy6jfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhj5wQACgkQj4D7WH0S
/k57mggAjV/gPHEZEhCbpbGaA0U7iyTFgEmMeVkkJxzImAE2AmC1ed9voHg64BLd
TLDis9YSPhntR2Km1fd4c5x1ina+fVZITIPTm8z9XUaQJk99UfsSuZPX0mTsyo4o
O4jBd2cpo/MPcv/FodAIhNfILnnArRfMkOJTTSl+L8H5g7IUXOcGVtF+3EkgP3gh
pClTe7NYPLD5I4MDBV+eK0JopHWbTfQJ608ob/vcPZdycjfyYE45fhXrYFEFjvnB
12jFYYENaO3/HTGs92o4NvjVdYgPLOj3TsiUU4c+UPrxRpLlsJS4J6Pu1TRxt+Jl
q9K1u2WtSUbHvMEl7Y61fbNlEOwgPg==
=Q8/O
-----END PGP SIGNATURE-----

--a3yx2qm3x3iy6jfn--


--===============6346167562710554710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6346167562710554710==--

