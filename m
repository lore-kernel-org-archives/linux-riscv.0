Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37398C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZQ6hbP/1WDH3EskzRYFwnOKUMT5DXLTQV0vkA7wxnU=; b=EBK5WT8mx/57gTdP7poUgGTFfu
	lztZLEbw25b81MvoQUWBu+qoG8I1wMx1eNnV7EGVj11Rkg6dtDIXAgx17if46o+hEu+JrnTMYcl0Y
	BXCF1xFkkGOthK0yIyz0hrvyazVxxEbUplaO3KmBpGRCIp0sjQaGx5zYYC9AsUr1GwUJPpoLQbm7j
	NyuPgn1f0IN2eEz2vfh0qY4juDAhFrP5xqpeQyObO2hfip9hGtKJwVMiQ+7yX3mgyCkXvn71mK6Xk
	ekVymgG5oGShKwIRbA7DB437XKYGADEj/S9Zj7EQFz3xpM7793kG8/guFN9T1m9RA0WQsIibbIj8m
	lg//2XuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDjS-0000000AQ9z-2r6b;
	Thu, 03 Jul 2025 06:47:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDe8-0000000APAx-0JyV
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 06:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 675A7A53673;
	Thu,  3 Jul 2025 06:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DD1C4CEEB;
	Thu,  3 Jul 2025 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751524931;
	bh=cj9NFtN0xsWiVmMtfQkfpbIOndV8+ifluU4LHQQxzFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQ4uNE78oOdm1TrK/C+9W1ZcQRpJEDoLeMh2Q891i2oZUfNuQC9x9ASxlBjBehDjV
	 hf5grWtAx5wGkGNO12BwAsksZDxw/m/CTKBSin7i8XggvWBsnFY8jLcO/rXEKLCW/p
	 yACAPwI7zcMvXfIw1gZ+FB3PaRJqMh/l1kiPpTTwt9fscVTyZJYgvsxAf5yTInlI8I
	 1KkDJzQNB4DFmY5tBaASWf9VPdc902hMnxlMjcsv8RN5/gXFaleqLy1zHcLidZexXf
	 8jm9mXqE+dAHArWZUmoi7+IUXAGPGg7iOVU+9rLgXpXecJbQTAUMS378Dhp/hmPqqf
	 pCBxq/moUoNbQ==
Date: Thu, 3 Jul 2025 08:42:08 +0200
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
Subject: Re: [PATCH v7 3/8] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
Message-ID: <hdc4gweo5orxjzfggelvddpmhesmzkav2w3il7asewg5lswrxh@rslvwmzofedu>
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
 <CGME20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6@eucas1p1.samsung.com>
 <20250702-rust-next-pwm-working-fan-for-sending-v7-3-67ef39ff1d29@samsung.com>
 <aGVMnmoepIVSS0yK@pollux>
MIME-Version: 1.0
In-Reply-To: <aGVMnmoepIVSS0yK@pollux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_234212_179019_2EA26C34 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5209489997450529482=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5209489997450529482==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uhbdmr5uuwnvygor"
Content-Disposition: inline


--uhbdmr5uuwnvygor
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 3/8] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
MIME-Version: 1.0

Hello Danilo,

On Wed, Jul 02, 2025 at 05:13:34PM +0200, Danilo Krummrich wrote:
> I assume the C API does guarantee that a struct pwm_device *always* holds a
> valid pointer to a struct pwm_chip?

Yes, a pwm_device holds a reference to the chip's dev. So until pwm_put
is called the chip won't go away.

Best regards
Uwe


--uhbdmr5uuwnvygor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhmJj0ACgkQj4D7WH0S
/k4x3ggAkwamiLd6r0eMJ9/ItKu0S1EKf3GNLQ7p7k9gEWSCQwPbKAiFtWCLYWkp
1BcEI20bHheXAOH5K2vryRS4WOaoy2lP5F8CgYseqkSnfIeWbeUIyR5RuS+Gmfj8
UT937rxoH1bvHiu9X0PYtoN5/DwH423JsT7EhLjyL62ycXzDU6zhB/De7MoIGo05
NSMdLALW12xCzKbAstogGf2v/WwGUvk9bynefxzU0GYpdgX+tl1U6cy7BQR+T6PD
WH6EXgXFcZymtIZ1N1nk7Jt7REFP3vh63x7+bNFRwGJSmyj7pMDU2wR4YYKCcCdi
HRunXxiTYVmJ5jnxMTs2zoE2fIDVNA==
=6vvA
-----END PGP SIGNATURE-----

--uhbdmr5uuwnvygor--


--===============5209489997450529482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5209489997450529482==--

