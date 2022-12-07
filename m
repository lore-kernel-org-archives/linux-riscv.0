Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7939C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGNs7xpbh3DuGHbVKB9TYovNvb0og4FrdeENCtdrYzk=; b=ZbvV4grMvg8WIBGk5JkPV5C2MO
	6QKa6qjKc47dZ434ZbcH12o8tXfcjNEO12rRpHFw5Qxg19vEe0vBUg5pO3H/a1a8hTGiTSp4Tzvag
	/cebHnnuLSH5fRlkEWjJTmEBfZp1UDg7qz56tL0rRcDL4OgK9YqfEqPpSwEo855tb7gCIKPW7hwWq
	1Tpdebpo7USLQLJ/ZMvkfLcSDs1in3GYpF1RSU+b+xeCE3hgUiDO8WuEPQfdwgrGV+6JM8up0W7A9
	lrBONDzYbSbEKjjFPt574rpoFvjn8S0d9tjKoT9F+g/k+l8c5ODjf0Z9FuDgiytBg7Rkv6YZeF0P3
	d5qCjGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2sg1-000uX7-HW; Wed, 07 Dec 2022 11:33:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2sfy-000uN6-6I
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 11:33:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA870B81D6D;
	Wed,  7 Dec 2022 11:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258F9C433D7;
	Wed,  7 Dec 2022 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670412799;
	bh=3iUZUuHkcIvwtOgND+IUFfeLoZ05Y/NDVmrMzsGnk6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceUfHsLwXidT2LV0zG8VgVjdgYF4UGdMFkvTuXrhlY0aeDko6+bV9FLQBG8LWBLy7
	 cmg2RaLjmQ/rvewb1fYfc4F7hRB5ToX7sXDEWyKnn2eYkOur76Pp0rgzAPQK2Txa1h
	 aXKDsv+IGMQV/A2xrTcSbl/i6tmss4V9t6Zruzww/xfcXpNHlEpZ96jZbgdtFi0IPm
	 oAfZqyTIwGcQ0DovBu3IHwpp0ZQ09nOv+/9iLL+XN6KX8K8o8VMeyCZ54b4ElXDa9Y
	 E/W6HpQ/Bj1jxdDIbPOC5KRwwXqsJMeljL8jmgHI9DhNquqvbdMAeSXG0pPxI5KyLD
	 GbpYPCdOWr4Rw==
Date: Wed, 7 Dec 2022 11:33:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: timer: sifive,clint: add comaptibles
 for T-Head's C9xx
Message-ID: <Y5B5+vUjYxepn53g@spud>
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-2-uwu@icenowy.me>
 <34fe4161718e395f5e9890f9358a25f697af9e24.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <34fe4161718e395f5e9890f9358a25f697af9e24.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_033322_571895_2C8B9950 
X-CRM114-Status: GOOD (  22.96  )
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
Content-Type: multipart/mixed; boundary="===============2533688763945180291=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2533688763945180291==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JWqOn8OBCdKsE8RV"
Content-Disposition: inline


--JWqOn8OBCdKsE8RV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 06:47:26PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2022-11-21=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 12:17 +0800=EF=
=BC=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> > T-Head C906/C910 CLINT is not compliant to SiFive ones (and even not
> > compliant to the newcoming ACLINT spec) because of lack of mtime
> > register.
> >=20
> > Add a compatible string formatted like the C9xx-specific PLIC
> > compatible, and do not allow a SiFive one as fallback because they're
> > not really compliant.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>=20
> Hi, could this patch be picked ASAP? Becuase it will be used then in
> further OpenSBI patches to enable proper operation of T-Head timer.
>=20
> I know the following 2 patches are in doubt and further rework for them
> are needed.

Since it's me that's asking the questions about the other patches, but
have no comments about this particular one:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

HTH Icenowy!

> > ---
> > =C2=A0Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8
> > ++++++++
> > =C2=A01 file changed, 8 insertions(+)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > index bbad24165837..aada6957216c 100644
> > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > @@ -20,6 +20,10 @@ description:
> > =C2=A0=C2=A0 property of "/cpus" DT node. The "timebase-frequency" DT p=
roperty
> > is
> > =C2=A0=C2=A0 described in Documentation/devicetree/bindings/riscv/cpus.=
yaml
> > =C2=A0
> > +=C2=A0 T-Head C906/C910 CPU cores include an implementation of CLINT t=
oo,
> > however
> > +=C2=A0 their implementation lacks a memory-mapped MTIME register, thus
> > not
> > +=C2=A0 compatible with SiFive ones.
> > +
> > =C2=A0properties:
> > =C2=A0=C2=A0 compatible:
> > =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > @@ -29,6 +33,10 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - starfive,jh7100-clint
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - canaan,k210-clint
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
ifive,clint0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - allwinner,sun20i-d1-clint
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: thead,=
c900-clint
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
ifive,clint0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: r=
iscv,clint0
>=20
>=20

--JWqOn8OBCdKsE8RV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5B59wAKCRB4tDGHoIJi
0l5EAP0d8+bmSdQwOL1zh+4ekUZkbwUid4O2E8SRuJ//7ZbjjAD/cbWLeF0c/mVr
WKzBDTFx9jlc7gXrewlZxdymFvnXZwQ=
=5Qqt
-----END PGP SIGNATURE-----

--JWqOn8OBCdKsE8RV--


--===============2533688763945180291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2533688763945180291==--

