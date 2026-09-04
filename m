Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D72C624DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xucVtkY3eOhAWRfOUltQUClXleOrNes+miQ/wLjsITI=; b=cNNw+h9zZLwrf94erZO/Oioy6N
	RHWyt0rKgJJ1n23q1Yj59iimOakg15Qh+aT5ugzfP1WFuTNpUa44P6nRZdqE49B3ljSTManm38+Ig
	tDKYflTuBWR0pE33cmrQTW3g/fU0LNbje5eRWFX2YX9fnmla/az6VKBnjSVkxET9UhYNEi55FNl9T
	lVQtXk5ab21b312cpSh6migxHufhpfkM5gpxkRtyySBtOioPNn98a7DEt2tnxVT9hCHax9AXPgZHI
	Qi73suEh+edqYy8kXjw3YVjvGPncoNjFgbuTXUflhBcwpPF0IQT8sq+xJZhfHZvjDVTiegrQRc93T
	6RVhbpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ar3-00000003Hdt-0s9H;
	Fri, 04 Sep 2026 20:49:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ar0-00000003HdV-4712
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 20:49:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AEB141935;
	Fri,  4 Sep 2026 20:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4F41F00A3D;
	Fri,  4 Sep 2026 20:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788554982;
	bh=yv0otkI4R3GXS81uLq6Au1MGNUzomyZRVJ0cIST0K2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oftt+C177df3SD8JCk4/ygJrGu/v6qf0D/JTfSn3l/7d23chMcQP3Y1rc6iwqVCyI
	 gw9/d/GkFudw5128IJ++gyEmJNBmVxrSWKFAmCAktxBPWOzR7qSrjrS+hHhP7x0VHa
	 xIgObrqftMKlh4vA8WX/7G4AHbsC2KyvgsQ2XyNKhJDVsmUYQog+pS+bWlMvm+c58F
	 n2XNLBaHgVIlTkKC5opSqy6lxwUiqCC7nvRBeL44C+y/iAodR7g4e2Dv98x5oR2+8U
	 WYjtWB/8GrtfphOrqhvzyq4/RA8pUd1uXR9PsKyg7hDIygsxKPx1/k+bVBnRTHxGJK
	 jKhMW3cIwOMYw==
Date: Fri, 4 Sep 2026 21:49:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: introduce cap framework and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <20260904-semantic-quiet-24fff0973cc2@spud>
References: <20260830170414.4505-1-jszhang@kernel.org>
 <20260830170414.4505-4-jszhang@kernel.org>
 <20260831-falsify-arrogance-6917870b8596@spud>
 <apYafAJvKqz_hRzR@xhacker>
 <apZa3EnjGjpaydGm@xhacker>
 <20260901-mountable-engraved-f47c899ed194@spud>
 <apdeoLGpeBW0Hq4y@xhacker>
MIME-Version: 1.0
In-Reply-To: <apdeoLGpeBW0Hq4y@xhacker>
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
Content-Type: multipart/mixed; boundary="===============1718358328168857479=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1718358328168857479==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GG0dE94JHQf052MT"
Content-Disposition: inline

--GG0dE94JHQf052MT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 07:24:16AM +0800, Jisheng Zhang wrote:
> > > other cap usage PoV: the cap can be used to replace various static
> > > branch usage in arch/riscv, for example the fast_unaligned_access_spe=
ed_key
> > > As is known, the static branch has some drawbacks.
> > >=20
> > > So no matter which direction this series goes to, we need similar cap
> > > framework. The key question is whether we can extend the
> > > riscv_has_extension_*() to cover cpu/HW cap,
> >=20
> > It'd be nice to see if we could reuse the functions, if we don't
> > want to invent a bunch of XLINUXFOO for them. The vendor extension stuff
> > that Charlie added reuses it, but since there's no Linux Foundation
> > JEDEC ID (AFAIK anyway) perhaps there's just no easy way to do it and
> > duplicating the functions with a different name is required.
>=20
> what about if convert fast_unaligned_access_speed_key from static branch
> to alternative? It's a cpu HW capbility not extension. rename the
> riscv_has_extension_*() to riscv_has_cap_*()?


Is there any value in actually moving that one to an alternative? I
think it currently only has one user?

If there is value, I'd rather see __riscv_has_extension_*() get renamed
to __riscv_has_cap*(), so that things like unaligned access speed get a
different namespace to standard and vendor extensions. IOW you'd end up
with

static __always_inline bool riscv_has_extension_unlikely(const unsigned lon=
g ext)
{
	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_M=
AX");

	return __riscv_has_cap_unlikely(STANDARD_EXT, ext);
}

static __always_inline bool riscv_has_vendor_extension_unlikely(const unsig=
ned long vendor,
								const unsigned long ext)
{
	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
		return false;

	return __riscv_has_cap_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVE=
S_BASE);
}

static __always_inline bool riscv_has_cap_unlikely(const unsigned long cap)
{
	return __riscv_has_cap_unlikely(LINUX_CAP, cap);
}

Currently standard extensions use 0 as the vendor, perhaps we could then
use -1 (the value is an unsigned long) for non extension related caps?


--GG0dE94JHQf052MT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapsu4gAKCRB4tDGHoIJi
0sbxAQDD0972SFMaZj7AaksRhMd64kn+GSb6fXOk3mnVmeDRLQEAsGi9D+KNoVsv
z+fOmb4fa34uegQWg4zaQQs+Iv220A0=
=BIVN
-----END PGP SIGNATURE-----

--GG0dE94JHQf052MT--


--===============1718358328168857479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1718358328168857479==--

