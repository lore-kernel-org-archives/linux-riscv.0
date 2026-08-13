Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4CCC5CFCF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYuH/SXulhRp16tWbKO5ryNcDkgpq7SoTItPsC3EoNY=; b=GOXno/LbuQNlokhIUurPPW51Xs
	WKRujcC4cBMghKbEXEWj4RRhOkAaBqFUuXSLuHfOqX9PzYIc5nqvHhUhReOXxgj3ih+2OMLsaHu0x
	MPpqQrO+aJOcUYVK0wBU9EO63uNQQb5quzI82G0sdvWzKIEViutcSUkhM5ESHP4ZQYtxg6IfPAzYG
	dA5j1M63BIFeGEDU3taal8q4gym2NVcifMsk2ueoDeB76egjBwRzvFb9OFBpgDuGfMoLSKDc4m43q
	RWL3cZqFcrOGeM2n4ZLZb5gdhEMWNJyMZlkCB2XnYxRSOg+XPy0hBRThL6YxXQKsV7U3o5d1LnhVU
	mBZ/F5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYZk-00000001CA2-1jJ1;
	Thu, 13 Aug 2026 16:46:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYZi-00000001C9l-2v9p
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 16:46:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA82C600AF;
	Thu, 13 Aug 2026 16:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70081F000E9;
	Thu, 13 Aug 2026 16:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786639597;
	bh=FB6WjC6V8WgzoH3BfkjMLBjleZvuxw4y6S8vLrv6/4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WZbAJXrZ49ltFgfZmedw3FJLqQOd0m1gHTqClg+czOxMht/OwnCGxxXDig4rfRrgI
	 oW4bQh6iVRyV4YTV4/j5CXTHpPLjw7xqzWMXnawdrK1MG/YfblPmu57x+YBzeueaV8
	 L+XWEVqUXLgL8fI8yWJ7KKoYT8m1J1YeBNT3nx8sI9h6l75Ic9VBG/AI6979REKHVO
	 Xm6cv2OAVQOnWrVLREMWzG+TZJ2Beqsr1KQuJ5jJ/mT2TSXXfbV8n7w2kbDxyIlQJx
	 dIhEDU5Xn1Cnfw9Ny+MkpO7+l7wNsQn4pT3odXqDFwni5bEjtVrdIX4Mx0/+a9gKSs
	 f+k4bOSItLdrw==
Date: Thu, 13 Aug 2026 17:46:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260813-presoak-scarily-b6cdecfcb7cc@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260812-snowplow-punctured-28d19616f707@spud>
 <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============1189626676720773234=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1189626676720773234==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3IBUAeGtjz87z4y"
Content-Disposition: inline

--u3IBUAeGtjz87z4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 08:10:12AM +0000, Changhuang Liang wrote:
> Hi ,Conor
>=20
> Thanks for the review.
>=20
> > On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang wrote:
> > > Hi, Conor
> > >
> > > Thanks for the review.
> > >
> > > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrote:
> > > >
> > > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrot=
e:
> > > >
> > > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > > +	struct soc_device_attribute *attrs;
> > > > > > > +	struct soc_device *soc_dev;
> > > > > > > +	const char *machine =3D NULL;
> > > > > > > +	struct device_node *np;
> > > > > > > +	struct regmap *regmap;
> > > > > > > +	char rev_char;
> > > > > > > +	u32 rev_id;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > +"starfive,jhb100-sys0-syscon");
> > > > > >
> > > > > > Remind me again why this is not just probed as an mfd cell from
> > > > > > the syscon driver?
> > > > > >
> > > > > > (Hint: please put this info in the commit message).
> > > > >
> > > > > The discussion result with Krzysztof at that time is recorded her=
e:
> > > > > https://lore.kernel.org/all/20260405-strong-watchful-marmot-fdfad6
> > > > > @quo
> > > > > ll/
> > > > >
> > > > > One register should not be treated as a separate device node.
> > > >
> > > > That's a different question. In the case of an mfd cell probed from
> > > > the syscon driver there would be no devicetree modifications
> > > > required compared to what you have now. e.g. sg2044-topsys.c
> > >
> > > This seems feasible, and I can introduce this modification in the next
> > version.
> >=20
> >=20
> > In fact, you don't even need the mfd cell, because your driver is going=
 to be in
> > drivers/soc/starfive anyway? You can just bind directly to the
> > sys0 syscon I think.
>=20
> I suddenly realized that I missed one issue: starfive,jhb100-sys0-syscon =
is already=20
> bound to the PLL driver by default, I can't use it to bind another device=
 anymore.=20
>=20
> which is why I used=20
>=20
> np =3D of_find_compatible_node(NULL, NULL, "starfive,jhb100-sys0-syscon")=
;=20
>=20
> in jhb100-socinfo.c.
>=20
> So it seems the MFD cell approach isn't really feasible either?

You could, in that case, probe the clock driver using the mfd_cell like
sg2044-topsys. What else other than the pll controls and the soc info
register is in this register region?

--u3IBUAeGtjz87z4y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan305wAKCRB4tDGHoIJi
0tqCAQDnOCdXow5y4UEH9HN1Ayp7UyioUDwiF4QVHavs/q1R7gD+K6A9t/cRtwyI
EoWcCEIq5L8aEecNUZlO9dJJ0Tt8PQ8=
=jzed
-----END PGP SIGNATURE-----

--u3IBUAeGtjz87z4y--


--===============1189626676720773234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1189626676720773234==--

