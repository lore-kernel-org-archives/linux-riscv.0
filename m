Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED58C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 16:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyohTu4PEpC0yDY5e1bPiQCZCUIhoAtW5o/cVOfPNz0=; b=MQNycs1HTIOvSUAPrhTA4tVzkP
	sbBcUvW7Vcp+r6JHHgqHSs3frjr2yWE3A5ng+qoJtqAd/OhWZthbtMQ4IrqMbEM4gEm/7qqb7Ucpf
	XMDKAGhOb4+3Pkfg2nfBmW+5uNZd5t96mJgGaQo5KcRCrlOPlxTKNNRtA+IX46XLUrXT0hhj28jRu
	SCs1CoE6tlEt/ilDOI4Gfk21K4NWqJToYO55/ILxNKx68y66Xt42Oxk1LMJpwPW/H8wCtkn83a4zz
	pteXpGBA42/6v0k6MCORW26eMOhf9nZDafAYB15wpdqNzS9mNX/SZeEhNPAR+BVNTntI/HNDkLz/p
	+7QJaaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVtX-0000000A0r3-2RTx;
	Mon, 12 May 2025 16:20:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVTl-00000009wuV-3BpV
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 15:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0A27A4D88F;
	Mon, 12 May 2025 15:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0F0C4CEEE;
	Mon, 12 May 2025 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747065248;
	bh=ardgSaLF+Xzy6IuCgpd3Vkzram81Uc0c2cE1fOWBWbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJQuR80lByNZISu3PMcvRfdar/46craiwyvRfxH6qwaBIaKgVN9lld7eN6lMOenYm
	 nYxeWccZ1cW4nZCKj2VchptdnthkDFu/uEesq1e9irdeXR/Xfwa4g1liYvMm2QQabc
	 syC5HEpxoUPK5Za/KRD5vYFMMYCznB0U2cbH1bDqNajhPeqaxTQpcvuFZR38gn8Kr7
	 elQ9XuucoHOSFEIhetmwBTlVPGDs9klgcQHSr9hNPsWVGnNcySwKn5KIGxK7iYGCfi
	 +cuj5O0+5l1OHUiqLy2ROwMtTQyXUSRuuMZyTvtm/p4bi/cfnmm22o3Pq1WBZV/xX0
	 Hu7OYGL3mXhCg==
Date: Mon, 12 May 2025 16:54:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: renesas: add specific RZ/Five cache
 compatible
Message-ID: <20250512-neglector-scope-65dd0e24db8f@spud>
References: <20250512-daily-saga-36a3a017dd42@spud>
 <20250512-sphere-plenty-8ce4cd772745@spud>
 <CAMuHMdVwBqC3jHgwLJkLcNZo8W0Aw9ZfoXL1tRaL7B2EpKuWvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVwBqC3jHgwLJkLcNZo8W0Aw9ZfoXL1tRaL7B2EpKuWvg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_085409_868964_9023B448 
X-CRM114-Status: GOOD (  18.73  )
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
Content-Type: multipart/mixed; boundary="===============1904285958467405685=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1904285958467405685==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z6jVGgc2yAbBL/YK"
Content-Disposition: inline


--Z6jVGgc2yAbBL/YK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 03:57:41PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Mon, 12 May 2025 at 15:48, Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > When the binding was originally written, it was assumed that all
> > ax45mp-caches had the same properties etc. This has turned out to be
> > incorrect, as the QiLai SoC has a different number of cache-sets.
> >
> > Add a specific compatible for the RZ/Five for property enforcement and
> > in case there turns out to be additional differences between these
> > implementations of the cache controller.
> >
> > Acked-by: Ben Zong-You Xie <ben717@andestech.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for the update!
>=20
> > --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > @@ -143,7 +143,8 @@ plic: interrupt-controller@12c00000 {
> >         };
> >
> >         l2cache: cache-controller@13400000 {
> > -               compatible =3D "andestech,ax45mp-cache", "cache";
> > +               compatible =3D "renesas,r9a07g043f-ax45mp-cache", "ande=
stech,ax45mp-cache",
> > +                            "cache";
> >                 reg =3D <0x0 0x13400000 0x0 0x100000>;
> >                 interrupts =3D <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_=
HIGH>;
> >                 cache-size =3D <0x40000>;
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.16 if there are no objections.

I'll grab the binding then on that basis. :+1:

--Z6jVGgc2yAbBL/YK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIZnAAKCRB4tDGHoIJi
0qXTAPwP/YNKxUjnsoWI2eR0P927XpvMHJh8iXZEVodQF9EU0wEAtk1y4MXzjY2B
SKRgAqtfnm7hZ972QpmZqhPgXVaxGwk=
=xOTE
-----END PGP SIGNATURE-----

--Z6jVGgc2yAbBL/YK--


--===============1904285958467405685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1904285958467405685==--

