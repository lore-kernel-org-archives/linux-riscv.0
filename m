Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA31CD3440
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTM9GMb9lPo88T4tNddchwp3ZXME32NXOpN+TILbCTU=; b=jZc4BsNOUH+wln0bHU75nsI/nP
	3TBZfoEnYnZpLPn30T/N3DSrwA7O1ELISZsXRG6S6RnB3NdRV2J7dO9fEbINfz3jvQWZtIbAlRoQL
	ZPgaxKhesPPd1eIjY4qSpY6CbS8/ViJR8buQNzlw+giUryDfD0NAlv2RBPTN2rQHPROxDPIUP3VkE
	C2J/1j41bhIvlwJKADXfvNb0n6w8PlfwmclkTbEBab5ldFj/47WscTmZ5LqSEaqhhMKuVZ9lVXp12
	z7ZYj+IwqOIHbvx1RrvEYWnx0vFT7PW0JILypwcQOdapsl0ts7f94OQb/Rs4xKyNEiPEwOLvkG3lw
	V3uXCvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFhr-00000009Mnw-3V07;
	Wed, 12 Nov 2025 18:36:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFhp-00000009MnC-06EO;
	Wed, 12 Nov 2025 18:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34FCF40841;
	Wed, 12 Nov 2025 18:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0D8C4CEF7;
	Wed, 12 Nov 2025 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762972592;
	bh=WnOMdyUM9PIIBDXqCoag+EQM65Uhfsy8dLkk4QRpRf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GI/5YeOfpZMmZVaVUwRR6Fbye59/PSnaqF/DdPeOXtxbGIbwfNWHeDbyV4p3QU59G
	 +D16rYwVg8D32b2bSej61a9lz1kZvGXw4j2I4QZjsAGx51e7Ii55bzmRx4GzrabPNV
	 mH65mLBEOVxrZrmT1myfF7c0stIgBhYKzqvc5IucEk7P5fdNM+Otbxh4ArAdwhvcMi
	 NckYMl5HBmZIJ/uE9MEYAty8k1PvYxgpB8Jpndc0cf+bWFdSVcpht76AC40ennmRKz
	 2VRPWg1FFoOgEYPXvOxetk/BAQlONtL5gVFzR85UdiF0GprVVpSdLPLtk9kodpMpah
	 eazHG4E1gMLGA==
Date: Wed, 12 Nov 2025 18:36:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add vout-subsystem
 IP block
Message-ID: <20251112-skating-robust-81be8dee0a8b@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
 <20251111-massager-twistable-1e88f03d82f8@spud>
 <20251111-unsaid-rockslide-67b88b2e34bd@spud>
 <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_103633_111089_D595AC1A 
X-CRM114-Status: GOOD (  21.69  )
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
Content-Type: multipart/mixed; boundary="===============8554501272197027999=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8554501272197027999==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z01jU0pczI5X5Okr"
Content-Disposition: inline


--z01jU0pczI5X5Okr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 02:34:39PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2025-11-11=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 18:36 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, Nov 11, 2025 at 06:18:16PM +0000, Conor Dooley wrote:
> > > On Sat, Nov 08, 2025 at 02:04:35AM +0100, Michal Wilczynski wrote:
> > > > Add the dt-binding documentation for the StarFive JH7110 Video

> > > > +patternProperties:
> > > > +=C2=A0 "^display@[0-9a-f]+$":
> > >=20
> > > Personally I'd like to see these being regular properties, since
> > > there's
> > > exactly one possible setup for this.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 type: object
> > > > +=C2=A0=C2=A0=C2=A0 description: Verisilicon DC8200 Display Control=
ler node.
> > >=20
> > > Can you add the relevant references here instead of allowing any
> > > object?
> >=20
> > I don't think that if you did, this would pass the binding checks,
> > because there's no "verisilicon,dc" binding. I think I saw one in
> > progress, but without the soc-specific compatible that I am going to
> > require here - if for no reason other than making sure that the
> > clocks
> > etc are provided correctly for this device.
>=20
> Well I didn't specify any soc-specific compatible because that IP has
> its own identification registers.

I still require one because I want to make sure that clocks etc are
handled correctly. You can ignore it in the driver if you wish, but when
the next user comes along with one more or less clock, I want the
jh7110 one to be forced to use the correct configuration.

--z01jU0pczI5X5Okr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTTpwAKCRB4tDGHoIJi
0n08APwON6v69gaWnOdNIAfYHKE57muDvt77iLW9YOkBpmJ8gQD/SCB3VfMB5jCd
kGuaHJbvedczk5aTkG39KaIgYoNexAc=
=8HDy
-----END PGP SIGNATURE-----

--z01jU0pczI5X5Okr--


--===============8554501272197027999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8554501272197027999==--

