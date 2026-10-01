Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161F5CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 06:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiVDezWvQeJdgmzfxqjvfz41miq7xlYNe60RlUj3WR8=; b=KUNv9e8HQRfDa9L1rcgRkILCbl
	rZLITyo7M/1t8Pvn/9qQ1j2TyP3EPYkmD7u613Op6/DtWE+Va6JSd4gHNTl+l9kzee7KMjeasERiG
	UEX9e8o32pkpmxw72jSPsqB4ND9A7qX/kx63wz/YBARofxwIeJAu08H3imNu1Dl092jAbQdc+KKrz
	D9iqrGzmi5kRxHT88IP7Sl0NSRrUBnfvIUiZx8erOd+Zb2dl7jrpSua0H15A5RjitLR580nSK8l3L
	oT1z0RzmEEQm/0fku5E1Z/xUZQAAIoi+Ab4aM0vCCoOUYNCJ+WN5x8bxuF9yjsQpDxiYQfPaBQmy9
	VcmMcljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAGl-00000007tE6-0uNy;
	Thu, 01 Oct 2026 06:27:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAGj-00000007tDt-1rZf
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 06:27:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id D570540429;
	Thu,  1 Oct 2026 06:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2D9051F000FF;
	Thu,  1 Oct 2026 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790836068;
	bh=r2CPx4Pf1KhkRJ8d7Y2xOX9yFZxqZFrZ0p+dx0BeQAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F946ULR8rmlyOwkZs/oFd62UfkJGKAO+LW7WoXvLaXulDZRCx0/FnyavJt6R8/NhB
	 BYX8RUE4x36611USodHkcTunOP9BEM5Ona+OrUOFrrUQoGg0z958dZwN9om8otNo1u
	 gq2RCcBbGXHbOWugOMLhY0jPy23+Pv5E7gC1DbP68tScTmOWMatGkejL8zHp1ipjqZ
	 2T2faDBbQeMIkV1AC0wkS5mO0p1XRjMMrPsUmj4csBnKpAgDZL5VcaO6SZdh33wu9+
	 mHfoc9Rgka6kduLBXBMRExUmFMpXJwdpxOj/6vsFYE6kuJ3Nnmw32GcV/OrsTE7eaJ
	 qX/0oRkflmV0w==
Date: Thu, 1 Oct 2026 08:27:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fustini@kernel.org, guoren@kernel.org, wefu@redhat.com, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org, 
	m.wilczynski@samsung.com, ojeda@kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	fujita.tomonori@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Message-ID: <ar38qq0q8f2Vecuw@monoceros>
References: <20260930101257.1649945-1-tomo@flapping.org>
 <arz487DLBlaBrWLN@monoceros>
 <20261001.070215.521963012921142699.tomo@flapping.org>
MIME-Version: 1.0
In-Reply-To: <20261001.070215.521963012921142699.tomo@flapping.org>
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
Content-Type: multipart/mixed; boundary="===============3632776773792910715=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3632776773792910715==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="stj2fwtn3fuo7uyp"
Content-Disposition: inline


--stj2fwtn3fuo7uyp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
MIME-Version: 1.0

Hello,

On Thu, Oct 01, 2026 at 07:02:15AM +0900, FUJITA Tomonori wrote:
> On Wed, 30 Sep 2026 13:57:31 +0200
> Uwe Kleine-K=F6nig <ukleinek@kernel.org> wrote:
>=20
> >> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> >> index 729776086879..abecd95b0c3c 100644
> >> --- a/drivers/pwm/Kconfig
> >> +++ b/drivers/pwm/Kconfig
> >> @@ -772,7 +772,7 @@ config PWM_TEGRA
> >> =20
> >>  config PWM_TH1520
> >>  	tristate "TH1520 PWM support"
> >> -	depends on ARCH_THEAD || COMPILE_TEST
> >> +	depends on ARCH_THEAD || (COMPILE_TEST && 64BIT)
> >>  	depends on RUST
> >>  	depends on HAS_IOMEM && COMMON_CLK
> >>  	select RUST_PWM_ABSTRACTIONS
> >=20
> > Can't we do better than that? For C code the right thing to do is to use
> > one of the div helpers instead of a plain / for types bigger than long.
>=20
> Indeed. Rust code already uses some div helpers. However, the kernel
> crate does not have Rust wrappers for the helpers this driver needs,
> such as mul_u64_u64_div_u64(), so we need to add them first. The
> changes would be too large for stable.
>=20
> So how about merging this as a fix? I will work on patches to use div
> helpers in the driver.

Fine, then let me just wonder about the expression you chose, that makes
it look as if 64BIT was only needed for COMPILE_TEST.

How about making this

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 729776086879..4cc2911a0673 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -774,6 +774,7 @@ config PWM_TH1520
 	tristate "TH1520 PWM support"
 	depends on ARCH_THEAD || COMPILE_TEST
 	depends on RUST
+	depends on 64BIT # no 64bit division available on 32 bit builds
 	depends on HAS_IOMEM && COMMON_CLK
 	select RUST_PWM_ABSTRACTIONS
 	help

instead?

Best regards
Uwe

--stj2fwtn3fuo7uyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq9/V8ACgkQj4D7WH0S
/k5Drwf/Sw5Vll4mVUIaUUIfPVOTKcvnUPTbSsiEPg/zQCFDF+2xbpHGqSzWAOKO
I53Fjvjcij0Lml9edp+4pfDyYoMRkkvFQb0j85wphCv9+SNEIBbiM0SVNyd/Ia6W
csXCuvU7WDJ5bmDbf+25dDjYKuSqgsiNIlx9lrmHFP8qllxTFo6T7xUbsIAxkgzE
kUIfMstkJ3K7ptzP4xzswX0pt/w5Ae+3GrwI+hJasrZiOO97FRhVFd8L6+ffu5rz
Uj76zQUPOWZPSELZa3Lk86Rc1ejd/siAYTjaeG8IRCxjtoseBVa3wTkLopVuT8Gs
ZUsb3LFu+IWbIcojTrp36W1R2rGVaw==
=KnGj
-----END PGP SIGNATURE-----

--stj2fwtn3fuo7uyp--


--===============3632776773792910715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3632776773792910715==--

