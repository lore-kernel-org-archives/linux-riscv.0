Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7881C5CFEB
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/lZFNc8eJyIDiXn+K2p9AJ+mx8gkNEoFhheVVRavsk=; b=heh3Tz5/dICPdVVvY9VVTofFgy
	QTadybx0DDmR0Ihch7S1eZY5GmPosnjZ0DM1XdbzJKv3ENR5DZMLj+xxlP79IycEgxF+eGREzFKeB
	Lp9uvo4FjxTt2Ucd8dM1Emt69hBwV6bp6WwHFRJ0hZ30bMwSJgetUo/qsVQTKoSYBqK/LxXFS3GgR
	ty6vjeRwbNY6uW4ULPkqacFwOpo+I8FanY1hTvHvYtO4nvFLM6nQwp81IE5x6868v3rIsf+y8jiMh
	tYHbGrS8xrmAdkljKaxvnheB1ex6sVFyX1gFEiiFPiGfJjz/GAEEVwVxbbUC7sZbWGK3Q92NTcSJX
	mb4n61Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtppn-0000000EZqi-2Smt;
	Tue, 11 Aug 2026 17:00:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtppl-0000000EZqH-35m8
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 17:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DCF6F600AD;
	Tue, 11 Aug 2026 17:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1D11F000E9;
	Tue, 11 Aug 2026 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467612;
	bh=uW8hLwKwvgMfYIPD0vwwNI5aDIVNxy/Ai/c+z6t5lHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FESLREwKFLBlegXCXYT/pv+Nb0HnRmaCuEj+Iw9y85ATS6bMesQ6zx44iH1sWzaFn
	 ncYjvjiPDc+AxYqM39dtCSjfL8JMfWR59F2TkPiSz5F4ydRp2CPSV/DYQOxlAL1nvk
	 18H9IsmnLhIiRU7nc4l8r68q2XSPct3og4r6Jo4P8CKtI94p315/Mobm/yb5XrTkUH
	 IQSbOmYsgWMStAba4L/mCnnUGHlMx6nW9hh9GCSDJLPTwxTdFwYPFUHj7SrOlU+Od/
	 cT27FtbUiJ6G3l7AHdr1hF0fzrQu/axY6A0JA7wOeSc2f38VcjtyJvTujRktQBX4p9
	 V31UL7S6dKSzA==
Date: Tue, 11 Aug 2026 18:00:06 +0100
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
Message-ID: <20260811-populace-afflicted-40a40e0f484c@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============5879191203843708447=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5879191203843708447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CtK5EKNoAsQivl3f"
Content-Disposition: inline

--CtK5EKNoAsQivl3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrote:

> > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:

> > > +static int __init starfive_socinfo_init(void) {
> > > +	struct soc_device_attribute *attrs;
> > > +	struct soc_device *soc_dev;
> > > +	const char *machine =3D NULL;
> > > +	struct device_node *np;
> > > +	struct regmap *regmap;
> > > +	char rev_char;
> > > +	u32 rev_id;
> > > +	int ret;
> > > +
> > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > +"starfive,jhb100-sys0-syscon");
> >=20
> > Remind me again why this is not just probed as an mfd cell from the sys=
con
> > driver?
> >=20
> > (Hint: please put this info in the commit message).
>=20
> The discussion result with Krzysztof at that time is recorded here:=20
> https://lore.kernel.org/all/20260405-strong-watchful-marmot-fdfad6@quoll/
>=20
> One register should not be treated as a separate device node.

That's a different question. In the case of an mfd cell probed from the
syscon driver there would be no devicetree modifications required
compared to what you have now. e.g. sg2044-topsys.c

--CtK5EKNoAsQivl3f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCantVFgAKCRB4tDGHoIJi
0lFUAQDQvErhGWh1GPKjl5npBVRgz0mxYgiMDD3N+RV5dXnjfQEA2tMdSc2XqHx8
20d6W/Qs1vDPymVXp1wbnroZbe4nog8=
=lAVE
-----END PGP SIGNATURE-----

--CtK5EKNoAsQivl3f--


--===============5879191203843708447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5879191203843708447==--

