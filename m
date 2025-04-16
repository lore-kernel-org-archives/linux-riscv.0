Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF6AC369BD
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6w65OGGVXvJO1moGul2J0rZhK9IpnH64cKaORFZi4Y=; b=uETXP7i/K8z1sOqc/nz9Fx5b44
	QSo1hnW8QruEKW8buCs9W9zOeFPNIOVb/H13cS5cwwWDZjK1m2f+lLVhM/tQvPcVHb/3ZxOjGL4vc
	oTva+DrMQfIVBRY/3dz5pHj6/HCoWpS/fObjBVlA+UCIEzpRVg+TBtcgw5xA/UmNx89Zc5G0AK1ln
	FU3OeGH3oaPBAbWJQbgWDiVWha/qzxH7D4a1A7d9TXuDqna3RGPbXI4VbOC7qN7Qu0tJM7pe1fZtA
	aJw1sb9lQwSGJ8bQnc0ZvJ49U7TWF3asz/+L8Wz6LnJFZQa4yoSQTTghchD3qKzTm/NUgHu0govkz
	PU16pYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54l3-0000000A5fH-3vxf;
	Wed, 16 Apr 2025 15:33:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Bc-00000009ya9-0CLK
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 14:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AEC65A4A0D7;
	Wed, 16 Apr 2025 14:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CDAC4CEE2;
	Wed, 16 Apr 2025 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744815382;
	bh=YgDN44xj67UxlkGlXq/z4BMLc1kLJK45drEaqMMTO8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oN++NVpNhHYAZSEooP4+g77Qm4SP7b7H6zm/n6fwLi56f0PdK07SvLGmtuq0ExnQQ
	 As5qC6nXvV/vYxKxVc3cpmD/djdYE9R1Wk/R2hc/R4jjshOxsTKKaHjFGIJMD3ApDu
	 C8V/D9Z/VwmG+QNTvDhJEvt+cIHp31kaYmuON349pMuuGuSIFct1v925eY0G4LyVxz
	 P7Lv5PeKZznsEX0CLYOLxq54s6pJimYGsU82/S9WEI89ZCQuIyNJ2ZIxgGttyzq6XB
	 gNd2dTGxboZxUrK2OG8XDjq04HNXatCdHpt6iC0CWX/LX4gm6bihIFhDdpZJ26xVOg
	 33cUK6i1KxNPg==
Date: Wed, 16 Apr 2025 16:56:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
Message-ID: <bnrfclqrbzqzg43b2yjypsolvvukpppa7lxceoocfm6ww6kjes@gkuoeygu5vwz>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
 <20250415101249-GYA30674@gentoo>
 <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
 <20250415122807-GYA30943@gentoo>
 <hogqotzzpzcow2xjrwh34qcuiu7ooc2qnvlhuvexzvqkrcsfop@mhz26t5vu35p>
 <3dfc300f-081c-4824-97c3-842f72d2a7d3@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <3dfc300f-081c-4824-97c3-842f72d2a7d3@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_075624_212470_01233458 
X-CRM114-Status: GOOD (  19.61  )
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
Content-Type: multipart/mixed; boundary="===============0403378455913172071=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0403378455913172071==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nvbqpn6aaa4mvleg"
Content-Disposition: inline


--nvbqpn6aaa4mvleg
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
MIME-Version: 1.0

Hello Alex,

On Wed, Apr 16, 2025 at 06:33:42AM -0500, Alex Elder wrote:
> On 4/16/25 12:18 AM, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Tue, Apr 15, 2025 at 12:28:07PM +0000, Yixun Lan wrote:
> > > maybe there are cases that users don't want to issue a reset..
> > > so, want to make it optional.. I can think one example that,
> > > display controller is up and working from bootloader to linux,
> > > reset it will got a flicker picture..
> >=20
> > Agreed. You can just deassert the reset at probe time. That shouldn't
> > interfere with a PWM that is already producing an output.
>=20
> I think you're saying reset can be a required property, to be
> harmlessly deasserted at probe time?  Yixun was suggesting it
> should not be required, because it might already be deasserted.
>=20
> Anyway, I don't feel strongly either way.  Maybe the DTS
> maintainers can recommend what to do.

IMHO you shouldn't have to modify the dts if you want to initialize a
display in the bootloader and than boot flicker-free into Linux.

If the only thing you do with the reset is
devm_reset_control_get_optional_shared_deasserted() (or a variant of
it), everything should work just fine.

I'm not a DTS maintainer, but still have my opinion and recommend that.
:-)

Best regards
Uwe

--nvbqpn6aaa4mvleg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf/xREACgkQj4D7WH0S
/k79QwgAumneJJTU70ctlA9cRnIOTKxwGWl3IxHMtKIMx/Knwy5qCFoGmtBgK5HO
9UflSaqdQ1pXi7MF5fIY7k8PvgkO9T/sVjAnyhdygEKUqiebkepSX6TCWcd4tJwb
71HCVPYmc7+YlDiYYgOsHrhBISHSugf4d1RyJ4PNs3Ad4IckmilMC0Wd0x2e45uG
CEn3JntNTBm1l+ddSW1Vrv3fdZkjJMjjUb2gRC34JFwYVhQF2JUMsE8zW8v6SO0h
d1Yfh03EEStFFH1HBZfIqOocV13snt9t+SeyaZaHTtnAPXER+97gr1cfoqBZG+kC
y9eC+Ru1+1AS6Szu5MBpVwSrtD8fyQ==
=myXU
-----END PGP SIGNATURE-----

--nvbqpn6aaa4mvleg--


--===============0403378455913172071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0403378455913172071==--

