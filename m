Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B7ACAC58E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPG1yi/JkS58MX7mg4gv86yDlCrrqbxemxyvbLZxh4A=; b=Tw6uv0idQ/PkNREVagllWfsId7
	nyYPbUHHNHyehyNQXvj2Uf1+RIwgMiubjZKeskCN95rGCnvOM2DRibUxuDf0Q0SFJa/LgX3X1dS2L
	ZQwBlkGCYqod17ZzTvslsUggr5RQ/aig++QosxE04+Wfn9fs9g3TRaMTc1h/YYJJwZIHrkCy3kRbA
	ZcsK8+BDdfW3HRXGmd8Hx/3xC3M97x9i7oaJnz6ZHg6Q2xN3BRTLkS5TDrOEkM+GvEx1iq+jzHGGz
	BZ0qdJmpIbg8SvMetoL+Sw1DK51eKwDGbRGBQMMI0/dAsUs/M9prrFxCTtaMticdicb1Wlia5Kxww
	bvsJBxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy60Q-00000003YwF-27Nl;
	Mon, 15 Sep 2025 10:00:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy60P-00000003Yvk-1WsI
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 10:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C388060195;
	Mon, 15 Sep 2025 10:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2424C4CEF1;
	Mon, 15 Sep 2025 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757930416;
	bh=Pcd9ZToXPQQxmubV3rR5Zi6CoH4Kg5mSLyV/LY5hX/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=isaI4Le1IUPm5WO/FkjugGY5TihhnnOPPWBqXZATkJqCFu8K+uagSHjhYXaYdBJVO
	 pYj6cFzEwtrwxAkVKFerFQexukNRw9y3ZypQUnHgd14TkKkjUXhKvKhl5pOiCDXE/C
	 //8cMCshz8VQP2Btbaa2ZCG8IX/xMZ5RGNglwqHa4qDfgOFNww4g5zb3zUfsP8m8r+
	 /sRQBTMnpLAtOI52ZR96b0Hu5xrIvRTyXKf3bGrUuDQH5vLvtrFQD5FkhxEK0JCzvP
	 UxJCRydMKaMLvXso4KD37LJgVE2f1+Jy7+fwWUlHR+yofF0VS8dJqXl6YkCDTi/8HB
	 orORk55ceYQQQ==
Date: Mon, 15 Sep 2025 12:00:14 +0200
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
Subject: Re: [PATCH v14 1/7] pwm: Export `pwmchip_release` for external use
Message-ID: <3jxl6gpxwv376ooyny7qkeokeh7nzafttbyoehmwqzrccn5oip@747v6zdnogso>
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
 <CGME20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9@eucas1p2.samsung.com>
 <20250820-rust-next-pwm-working-fan-for-sending-v14-1-df2191621429@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-1-df2191621429@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============4614933766146137629=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4614933766146137629==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ieqpilfwwfgxf4dc"
Content-Disposition: inline


--ieqpilfwwfgxf4dc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 1/7] pwm: Export `pwmchip_release` for external use
MIME-Version: 1.0

Hello,

On Wed, Aug 20, 2025 at 10:35:36AM +0200, Michal Wilczynski wrote:
> The upcoming Rust abstraction layer for the PWM subsystem uses a custom
> `dev->release` handler to safely manage the lifetime of its driver
> data.
>=20
> To prevent leaking the memory of the `struct pwm_chip` (allocated by
> `pwmchip_alloc`), this custom handler must also call the original
> `pwmchip_release` function to complete the cleanup.
>=20
> Make `pwmchip_release` a global, exported function so that it can be
> called from the Rust FFI bridge. This involves removing the `static`
> keyword, adding a prototype to the public header, and exporting the
> symbol.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

I still somewhat dislike this patch. Isn't it possible to make the rust
abstraction use the pointer that .release is set to when it calls
pwmchip_alloc()?

(I wouldn't further delay this series for this discussion, this can be
handled just fine at a later point in time.)

Best regards
Uwe

--ieqpilfwwfgxf4dc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjH46sACgkQj4D7WH0S
/k5CPgf/d9VpIxfV66LPQ8LcyKGHr/z6WLe8e0mXCQBgmb+2uCpwZuAcfd87eAge
Gj0+iGdFuUvqg9fRbzhyd91BvVk/yCcPrg4kWxrECTxVq3ZqoMivnw7cngrXg1k5
gFdHV1Hd294DQHqM8cw4m2CpbS3Uo+2i17f2+hlQcIbGfrChb5Ge3HlZKsaMvd2k
QRw8M4TQVIzt/CUSPAwDgjB22tASqGcyOSczpasXB7XdPI2T8IdUF795FzZrvNvg
VKdgOVk2s82h9mVAImKZOCHPwE/N9Qbe25AaJAFDMkBLjebGEI2hkwFFjt406aNo
edMadB5H+bBdQwPhBaDbH4qsWO1paw==
=yBiS
-----END PGP SIGNATURE-----

--ieqpilfwwfgxf4dc--


--===============4614933766146137629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4614933766146137629==--

