Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8D5C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R89u9b7Hl62kLEaF882FwDoIuu3SAUTFgahyH5TxmKg=; b=TAH/8vOyqihyscVDmhYoUpL36u
	mEV9UXlsWvUIvHe90Gt5qjCv7OD/AJ1woDqnVZBF1M8FZdANUjFoIT23lKUAp5Hd/PZC9uAfmirIQ
	56uKCpOcyjJlj4J5eI4R7jhrUfSfnM3UnL9l4M/eYHvVDn48SKWgQklOlIEkd1O4315UvEm8uHMSB
	zSc46j9k2xGmURgV93XSfOxNcQPNUT22Pv4kt6NcaIOK5TqJTfclTuuO9SzluTeKifn58J1DfRSrY
	BCm1BuCpt47eK86/qwWISf9rNqJhL2/Oct9DyydajadA8XR0a0bPJn1V6UTRpgUihwf/XGwnH2Gzf
	ZrOiUJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPogP-0000000EViz-1ZZN;
	Thu, 12 Jun 2025 20:37:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoez-0000000EVUp-3iNM
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 20:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 275A4629D1;
	Thu, 12 Jun 2025 20:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D087C4CEEA;
	Thu, 12 Jun 2025 20:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749760588;
	bh=X6ZFmCqv+rVQiA6r4vfqa/BBIukFpY3bI33k6qaoFMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0S2M7k7+SGKzMwSIMzZZEk5sL16d2Rz/FLrH5H6V05cfgV2rfDn9SNLK/jxRW7rO
	 /rDPqMCHc8CpiB0/icznBRUOQj5wcOGy8TVaWLyESU19XBnPcUVOJIAlDRgNRGVsaX
	 g/RGKFXImxrbR92yDWJ/gf7hnH7oRhJon9+YYETDW8FmgaV6KdsleDippxdoFRMQ7m
	 prEEf3bxSA+1gRObi5g80zpz0ZRa3j+asn6UOwy27WAGZud4eqrqdTkhw12dBwmpcv
	 esj6IuleWtNd7rkPZFhwf5Naojmoo0lXKfBbESHB+Du9+kRt5l7Hdwd0JC8wqEF7Vt
	 4YLz04gqNL4bA==
Date: Thu, 12 Jun 2025 22:36:22 +0200
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
Message-ID: <5aam5ff3m24yzsqdh7w2zplccuwmmr2no7jhgmdnxggmhpo4hl@r6iawlw7f42m>
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
 <CGME20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d@eucas1p1.samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-2-753e2955f110@samsung.com>
 <jbm3qvowi5vskhnjyqlp3xek36gzzqjt35m66eayxi6lmi525t@iefevopxjl53>
 <d1523586-82ca-4863-964f-331718bb1f0e@samsung.com>
MIME-Version: 1.0
In-Reply-To: <d1523586-82ca-4863-964f-331718bb1f0e@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============2591795361614851867=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2591795361614851867==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5np625sv2e7hqcqz"
Content-Disposition: inline


--5np625sv2e7hqcqz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/7] pwm: Add Rust driver for T-HEAD TH1520 SoC
MIME-Version: 1.0

Hello Michael,

On Thu, Jun 12, 2025 at 10:14:13AM +0200, Michal Wilczynski wrote:
> On 6/11/25 08:58, Uwe Kleine-K=F6nig wrote:
> > Huh, if you do the newstyle stuff, .get_state() is wrong. It's either
> > .round_waveform_tohw() + .round_waveform_fromhw() + .read_waveform() +
> > .write_waveform() or .apply() + .get_state(), but don't mix these.
>=20
> In the process of implementing the full "newstyle" waveform API as you
> suggested, I discovered a hardware limitation. After writing new values
> to the period and duty cycle registers, reading them back does not
> return the programmed values, which makes it impossible to reliably
> report the current hardware state.
>=20
> This appears to be a known quirk of the hardware, as the reference C
> driver from T-HEAD [1] also omits the .get_state callback, likely for
> the same reason.

Do you read complete non-sense or e.g. the old configuration until
the current period ends?

I guess would be that .get_state wasn't implemented because this is an
oldoldstyle driver and it works also without that function.

> Given this, would it be acceptable to provide a write-only driver? My
> proposed solution would be to omit the .read_waveform() and
> .round_waveform_fromhw() implementations from my PwmOps trait. This

Please don't skip .round_waveform_fromhw(), that one is needed for
pwm_round_waveform_might_sleep().

I don't like it, but given that the hardware doesn't play along there is
no alternative.

> would mean the driver can correctly set the PWM state, but attempting to
> read it back via sysfs would fail (e.g., with -EOPNOTSUPP), reflecting
> the hardware's capability.

I think there might be another patch opportunity then to make PWM_DEBUG
work with that.

Best regards
Uwe

--5np625sv2e7hqcqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhLOkMACgkQj4D7WH0S
/k4ucQgAuqXHTYO1I3RV2AzSFsFd2LK5PaRAhfs5MWWKlBDbPjW95mxdlioBxzyq
+fee+3TYWq4FMe9u7ogpJKQvFn7yDZcR5Iy9SH78CnHEAugQG8L0GZ3OkRUQEc5P
OsuxPI6MY19uVPT/phoGVYdRb1X6/X9lvsVg/rItyJTNcChYmqm5cc9QHgv6wY+D
AKFTu2CUaSGuJUQR8WYz8+Z/Mtn/Zy8jgKkoMHosAfELqSZDK5sijuGrTnh03a52
J5FC1Pc5JaqXDJIDXwt3+HqkWi9vnms23HE4Kk4B8oFmJhHuCHP/Sbg6ocx8y5Om
sfhozLUhiIsfiZp/dXwaRpbOdkmJjA==
=jmz9
-----END PGP SIGNATURE-----

--5np625sv2e7hqcqz--


--===============2591795361614851867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2591795361614851867==--

