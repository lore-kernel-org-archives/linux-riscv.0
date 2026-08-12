Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D810C5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBkI23BK2roZ+cs2HViGfUvHGVJpwEm8o0fOg/dhspM=; b=ykj0tKI3Dy8N6fFqtSDR4oM+UW
	FcX0t0nfg4S7H7iV09Lw3whAQ8Zk1/qnKXva9G7RhJ7z/cGCgN4bXP3zQtSOadLTkVj9OsJWWH/yy
	V+4P18BejSiPiWQVQZ1cQfqhiM1CjLppsjbbEiWE1v/Wjf1nKFh1PfC98s7hHr9sW0l9LtvpQaFck
	6/IFOjv3vl6OyvxfBgSaCJl61mQ2/aUFEZy3QWs2RpgSNV/i7pZwIHp5vz+mAwga9LtcU1nAR6y7Z
	hbdCp8uhYnjtpxPkM04eBqMz94UuFvBMtgMiaOlV7vtBMIITLC4yvj7796tedPd82TSahg1QEKPZe
	drsEJrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBN0-0000000GXul-1VLP;
	Wed, 12 Aug 2026 15:59:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBMy-0000000GXuW-3fjI
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 15:59:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E521060A9E;
	Wed, 12 Aug 2026 15:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2C61F000E9;
	Wed, 12 Aug 2026 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550395;
	bh=NJMRKZ9D8pGUWxUVQCuDMkaEokEMslK+PwySCE/fC+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I4x2CJISHc2FxH+B7UiF7P/CqeEUKKowIsan/P2PhclryvOb5Wh4AHVLrIADFuUCT
	 3CgcHzSzzqKY6kvrm3Qk2u4z7P/1g2NMASzyhdGi77YRofUgjIWLqfDi2Z5DYuyPGx
	 j/K24JunkZXfk8zc4FQzotmgKXRozW97FqCSUIkb/D4tYB02W/TWZw8qUefsRTgZ3u
	 XjYIN8B2KvDorq4w8AVcVu6umKTwi0ifne2raoqr6jfUC9OCcVGYe9lp3YJSN1kcXd
	 3taGXmyCh5OPHJKwxJ4h/4I5PXGiqB2MdxpYeJG1B/RoqaoGpJlzIBCzJWL73hcVd0
	 M+kvV8FeUe68Q==
Date: Wed, 12 Aug 2026 16:59:49 +0100
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
Message-ID: <20260812-snowplow-punctured-28d19616f707@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============3341135709213442762=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3341135709213442762==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0/8ZYX86hXcV68ER"
Content-Disposition: inline

--0/8ZYX86hXcV68ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrote:
> >=20
> > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:
> >=20
> > > > > +static int __init starfive_socinfo_init(void) {
> > > > > +	struct soc_device_attribute *attrs;
> > > > > +	struct soc_device *soc_dev;
> > > > > +	const char *machine =3D NULL;
> > > > > +	struct device_node *np;
> > > > > +	struct regmap *regmap;
> > > > > +	char rev_char;
> > > > > +	u32 rev_id;
> > > > > +	int ret;
> > > > > +
> > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > +"starfive,jhb100-sys0-syscon");
> > > >
> > > > Remind me again why this is not just probed as an mfd cell from the
> > > > syscon driver?
> > > >
> > > > (Hint: please put this info in the commit message).
> > >
> > > The discussion result with Krzysztof at that time is recorded here:
> > > https://lore.kernel.org/all/20260405-strong-watchful-marmot-fdfad6@quo
> > > ll/
> > >
> > > One register should not be treated as a separate device node.
> >=20
> > That's a different question. In the case of an mfd cell probed from the=
 syscon
> > driver there would be no devicetree modifications required compared to =
what
> > you have now. e.g. sg2044-topsys.c
>=20
> This seems feasible, and I can introduce this modification in the next ve=
rsion.


In fact, you don't even need the mfd cell, because your driver is going
to be in drivers/soc/starfive anyway? You can just bind directly to the
sys0 syscon I think.

--0/8ZYX86hXcV68ER
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanyYdQAKCRB4tDGHoIJi
0mobAQDzgMmD/jVoYQZei6nTfuveJwdi4b685lws443NIXWP0QD8DBQJ1Xj3fQIg
zQ75R8EGuONF53vKAnR/U0HiwfckDgE=
=Qh9P
-----END PGP SIGNATURE-----

--0/8ZYX86hXcV68ER--


--===============3341135709213442762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3341135709213442762==--

