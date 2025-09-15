Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B75CAC598
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5sFqrGvlZ+tMLT8lr42xvjTHT3+ApIDX4jAG3FShdQ=; b=hImM0lzuKJDqoRYoMg3iNwWiCd
	f4IeZGbiEM9YCxxTOtMozrPhxnBC0FX4gM+haP14t1xxqn2kNxEwst+4bF4CTP3cZrscgaGFImJJ0
	eyrtf0FQzYz5lKJwK2Kp5xSll/YqVSXb7oBAaUuB0HLf8jwMzrMMQxjCfwvtb38dwWpAubOUKQLYl
	yR74QGajUbxLf5aWlM5+88TQVwMvmJNnWQqdmcaoskESSVUBgfAQadom5CQ+cgGaVogiQBklg3hk1
	tuSSq0WZnvSq/I7pUyzL4oVBRu9fOsDEA75R/8N2g0Ih/rg1K+Y3uNRoS8CxHPj7ZeL44G88/jZeT
	lF8wbDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Co-00000003anL-2oPc;
	Mon, 15 Sep 2025 10:13:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Cn-00000003amo-1YHs
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 10:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBB27601DF;
	Mon, 15 Sep 2025 10:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD41C4CEF7;
	Mon, 15 Sep 2025 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757931184;
	bh=bb9Mg/D/jEHiaHsLAgrg6OSUxGwRv1ubjnV9xw/kiW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOwoYI0pzlw7L57/NjzW0kWEOhTeYrPAPpgYGQ+Sb3S7oWReSYYhzrBAzW3yCFmVw
	 LkIGEggrjiW//byAc4Lh9OmKKssKd0v1WGASy9HhwnxwDB5net5ZNWuNGdx5zoZZeA
	 lozqdOKVq/gKDD2zfdHOzTI8oRZzwkA6kHqAGpqHPFzFaJf11ITrsE3SksLByb4KTV
	 UxRvvTVEjyjaeZMTpAWKqWH2CG12frOfhQCJye9XpSxfRpDOIiBKEwiRDVRwwVfpWS
	 tRQfQsGQm032z0j7fhruWg7hFL4rQApVCUicVG9YGIUy7PoHjnJH6v8sz9X6WsR49M
	 hkbTjspEj/ZLw==
Date: Mon, 15 Sep 2025 12:13:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benno Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Drew Fustini <fustini@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 2/7] rust: pwm: Add Kconfig and basic data structures
Message-ID: <upgthwp3cyohhe2gkzsramzshmvz3icjbhro6hgk2drbbqczi4@ygaanetydgjv>
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
 <CGME20250820083542eucas1p221dacb3b69524b0dd6f7abf870adbe04@eucas1p2.samsung.com>
 <20250820-rust-next-pwm-working-fan-for-sending-v14-2-df2191621429@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-2-df2191621429@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============0604376446315964845=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0604376446315964845==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zryfvf6d45dfcezd"
Content-Disposition: inline


--zryfvf6d45dfcezd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 2/7] rust: pwm: Add Kconfig and basic data structures
MIME-Version: 1.0

Hello Michal,

On Wed, Aug 20, 2025 at 10:35:37AM +0200, Michal Wilczynski wrote:
> Introduce the foundational support for PWM abstractions in Rust.
>=20
> This commit adds the `RUST_PWM_ABSTRACTIONS` Kconfig option to enable
> the feature, along with the necessary build-system support and C
> helpers.
>=20
> It also introduces the first set of safe wrappers for the PWM
> subsystem, covering the basic data carrying C structs and enums:
> - `Polarity`: A safe wrapper for `enum pwm_polarity`.
> - `Waveform`: A wrapper for `struct pwm_waveform`.
> - `Args`: A wrapper for `struct pwm_args`.
> - `State`: A wrapper for `struct pwm_state`.

Args, State and Polarity are only needed for the consumer side of the
PWM API in Rust, right?

I don't particularily like like pwm_args and wonder if this really has
to be exposed to Rust.

I think for State (and thus Polarity) we have to have it for the
forseeable future.

Best regards
Uwe

--zryfvf6d45dfcezd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjH5qsACgkQj4D7WH0S
/k4H1QgApRy8liAOZrzb3w50HXnIjFUP1zT9oN5uSbu1nwLFcoyPu1JvjbpxW7g1
aMBxeARi3PXREgQ6tZSbrWcb9+PiqySUS8tXIEawBr6Kskazxjtiz1LPYt0sLsuF
z+IRMCWg4pPm8g3t47tYvNOFaBnd49AjzrbPJrrlsDV13eisMsbVfYdr+7ZdPQPC
Evo9Pjzeg6jpKVWmp3OgFN6Mf83dFDB2XJKiZsDYRWuBjM6uJb3roiinPQfzKOAF
zAF32eplMf+6CcGLoBgdVJlkG2hVh/5xBgjYw7Zk9I2zcwuDJ13wvM2umgbtBCVI
aCZYiiFaLX1WA4w+SH6oQNi+C2WebQ==
=pc6O
-----END PGP SIGNATURE-----

--zryfvf6d45dfcezd--


--===============0604376446315964845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0604376446315964845==--

