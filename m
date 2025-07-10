Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13468C83F25
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sGDG//h5gFxCDtQ8X7G38R+rtQXguJwOjaIFdyYlM0=; b=HyeFS6U0o+s+LBExNFgS/BkG9P
	hvD5XKlkHPQDexXWuRKj4FIT77WtH5kZd7n3LorSlsGNc5MinBR2jdFwBmlIuBlzyyvnNT68TUcoQ
	Dp7btGNkro7ZihlGDYTamsj3yLd3Bu8HVpiXtgNf0VU+H7ELS71kFltrAhteBdGVcUDfI3CuM/LEx
	AT8RHcHW9Tb3aKI/x55YwMqyHFeTuftau62d7epjn7DllKJrCsKNAj6UUzck/ZSrbLWBIvNX6awhX
	75fsz+TW8CtDigkwbQO2xWEJ3KhdOFvw+B3xMVOkq3OC0geVKUaIukbMzXHbCyBAx9K7A947EeRJv
	y4TvbXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsZs-0000000CARk-2OBb;
	Thu, 10 Jul 2025 14:48:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZr2d-0000000Bsch-2WpE
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 13:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BCDCBA54A9C;
	Thu, 10 Jul 2025 13:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD26C4CEE3;
	Thu, 10 Jul 2025 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752153022;
	bh=T1QGcJNxK8BZy6hZ2D7Y/4Oab0tcD0n7rSuwkJBzXAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkJqyRRGBxuQi3JPKE7F07FeaVGgq/Qr4W2vFhQRw++dMOWbvgCEpS9ha9+oW4L1/
	 fqKoPBhLJIir6y9N14kKMzNcoZjFxCXHcjv1hAYl3NG/WC8D2cyRVrkFOM8+Bv/Uvy
	 r5I916QCGEOtXBhXnkBn1trmBAdJVvxI2lSReffjcjnSya4COhwK12gngoG3/zzwtH
	 ddszCdQGYibdS0CnOdT9i2eRNFU3ZLCmCC2I1vSVMtHQgTKFGdaT+etu+ZXG7Ll4RW
	 0dyA8HCuPH2bvKvvOhm4745UaM7qmI//Z7MSYc8OeGbNI18ayQeJU0aC8wR96rfAmE
	 emVc/E9zVMfsQ==
Date: Thu, 10 Jul 2025 15:10:19 +0200
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
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <ipvaegqlkco5qinhvn33mqvg7ev2walvs74xtzvhimxsfsfzhv@gcmpxcdtetdn>
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com>
 <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
 <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
MIME-Version: 1.0
In-Reply-To: <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_061023_771143_0B4D4EF4 
X-CRM114-Status: GOOD (  25.53  )
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
Content-Type: multipart/mixed; boundary="===============0390404663198904363=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0390404663198904363==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kx6t7rsvihyfkddm"
Content-Disposition: inline


--kx6t7rsvihyfkddm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
MIME-Version: 1.0

Hello,

On Thu, Jul 10, 2025 at 10:42:07AM +0200, Michal Wilczynski wrote:
> On 7/7/25 11:48, Michal Wilczynski wrote:
> > This patch series introduces Rust support for the T-HEAD TH1520 PWM
> > controller and demonstrates its use for fan control on the Sipeed Lichee
> > Pi 4A board.
> >=20
> > The primary goal of this patch series is to introduce a basic set of
> > Rust abstractions for the Linux PWM subsystem. As a first user and
> > practical demonstration of these abstractions, the series also provides
> > a functional PWM driver for the T-HEAD TH1520 SoC. This allows control
> > of its PWM channels and ultimately enables temperature controlled fan
> > support for the Lichee Pi 4A board. This work aims to explore the use of
> > Rust for PWM drivers and lay a foundation for potential future
> > Rust based PWM drivers.
> >=20
> > The core of this series is a new rust/kernel/pwm.rs module that provides
> > abstractions for writing PWM chip provider drivers in Rust. This has
> > been significantly reworked from v1 based on extensive feedback. The key
> > features of the new abstraction layer include:
> >=20
> >  - Ownership and Lifetime Management: The pwm::Chip wrapper is managed
> >    by ARef, correctly tying its lifetime to its embedded struct device
> >    reference counter. Chip registration is handled by a pwm::Registrati=
on
> >    RAII guard, which guarantees that pwmchip_add is always paired with
> >    pwmchip_remove, preventing resource leaks.
> >=20
> >  - Modern and Safe API: The PwmOps trait is now based on the modern
> >    waveform API (round_waveform_tohw, write_waveform, etc.) as recommen=
ded
> >    by the subsystem maintainer. It is generic over a driver's
> >    hardware specific data structure, moving all unsafe serialization lo=
gic
> >    into the abstraction layer and allowing drivers to be written in 100%
> >    safe Rust.
> >=20
> >  - Ergonomics: The API provides safe, idiomatic wrappers for other PWM
> >    types (State, Args, Device, etc.) and uses standard kernel error
> >    handling patterns.
> >=20
> > The series is structured as follows:
> >  - Expose static function pwmchip_release.

Is this really necessary? I didn't try to understand the requirements
yet, but I wonder about that. If you get the pwmchip from
__pwmchip_add() the right thing to do to release it is to call
pwmchip_remove(). Feels like a layer violation.

> [...]
> > ---
> > base-commit: 47753b5a1696283930a78aae79b29371f96f5bca

I have problems applying this series and don't have this base commit in
my repo.

Best regards
Uwe

--kx6t7rsvihyfkddm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhvu7gACgkQj4D7WH0S
/k6idAf7BH2gWVLF3hF8BnmdLYBZ0+8XBxqy4lGLYsGxaqfaca8W4jQVBO9vRFvr
Gyd4nJKC4VbtGYMMl643mIztR/mZg8848mNa9W1JoRdr188lvhES1WaDf8etUqgZ
+b4rnTHlafykGwVNr8tmC/OAA+TenvcE+mEw1fHvLVhRG13MEYzzj/+hHGud3sYO
D360+gcZxxWnPiKIU8xZV+NafY9H0iZfDqpq2ejV+qL5oCrDomxA3D658TyhZM0e
+w3pnzIFFw0r7JBKPEAbj5tf38KFITQmARETPEaqBuztkqUy29aNCGUr1cvF0qob
YxK1jPaHLcpSpzHpMwRdPK72MxyrOw==
=OJd8
-----END PGP SIGNATURE-----

--kx6t7rsvihyfkddm--


--===============0390404663198904363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0390404663198904363==--

