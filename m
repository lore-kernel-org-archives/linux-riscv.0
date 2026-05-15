Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6E6CD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vi/t7nErHY59WEerfRl9cOYqRfhy5BB+rIjXKqoHGdU=; b=PYteSRE3g+kofgOim5NnjZiOeg
	lCcGo8lKAYah04+3tLgQGMguxUWTIq8ln7XDRnSDX52sKToPSUHwJ9XwoGMY/yppRMlSGoANTRc0C
	cSYns7USsCJfF90t9QMFIXCSdpakqtGf55mLRSILzh4HRNiZstPMzH90gOpOU+i20fQGxTdHbuyh1
	Y/+Y4JUkyXQRrAT7sku+kH5qgsZCrNuprH9gMm10DZNg9XJc9cJlQylB9F+FPzvV2mFuchn//hFJT
	sLLTccGS2QFf9eOtekoYqLBzlWRnC+y+42re/dWa5N/Qc1wP1PheML08/cebZEAUF84niyKryiPTo
	mtrSdqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNn8H-00000007ddh-0Nwr;
	Fri, 15 May 2026 07:38:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNn8E-00000007dd1-1yQ3
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 07:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778830730; x=1810366730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRLf0lurFbfXEuuPH6jbfmoCndoC1re7fD+TOa1Oyjk=;
  b=ak+cn/8r0zgFH1D/ncLwc848RgwuI3VOhPWpJsXdzGHZJ/pKO5Pa5Jn2
   GQsUw3UgXtDVVKQcLWZuzjvhyfPpe1LnsbB0+40tL4PxB035KNiK6fqXU
   koqXrgpgWfMkQG9+aEq2mUIOXWJTot9BOjNK9NUpNrmD+WgGIWpBoF4sL
   ZVYE9eckDO6pRAYBXfzgLTQf9YFaEb5dGCcyltKzxFSJe7k8Avmg89Bz0
   WVUhwuIl4PvRMoCbNj28grtdINdaSfK/FfQtL2huNzDZbeOxorUu5U2uF
   fN+Ul3piOs8Q61WMrMVhvnMQvgmCqO7o3i9Zkl5QrT3JCYb2eQEPNOlzu
   Q==;
X-CSE-ConnectionGUID: v9Dn61O4RUWO9G2t+3/DGg==
X-CSE-MsgGUID: h7E9LxoKTimEBkOISndbBw==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="224790273"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 00:38:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Fri, 15 May 2026 00:38:48 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 00:38:44 -0700
Date: Fri, 15 May 2026 08:38:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul
 Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt
	<palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Message-ID: <20260515-dandruff-shorts-d7417c6e977a@wendy>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
 <20260514-operation-remix-9f9fcf9a6102@spud>
 <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_003850_579031_28A5366C 
X-CRM114-Status: GOOD (  35.84  )
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
Content-Type: multipart/mixed; boundary="===============7673783265656003181=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7673783265656003181==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TfqgCJgMGabClEuj"
Content-Disposition: inline

--TfqgCJgMGabClEuj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 05:55:48AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrote:
> > > Some pinctrl subnodes only need to configure pin properties (e.g.,
> > > power-source, bias, drive strength) without assigning any mux functio=
n.
> > >
> > > Currently, the driver requires a valid "function" property for all
> > > pinctrl subnodes. This forces the addition of dummy or redundant
> > > "function" entries when only pin configuration is needed.
> > >
> > > Example use case:
> > > gpios-configs {
> > >     config {
> > >         pins =3D <0 1 2 3>;
> > >         power-source =3D <0>;
> > >     };
> > > };
> > >
> > > Make the "function" property optional. If it is missing, skip adding
> > > the mux map and only process the pin configuration.
> >=20
> > I looked through the series though and all controllers appear to have p=
ins and
> > functions, is it the case that gpio is the default for these pins, so y=
ou are
> > omitting the functions property when you are using the pin in gpio mode?
> > Saying that the functions property is "redudant" makes it seem like thi=
s might
> > be the case?
> >=20
> > I've got some feedback here, but I can't really provide it without know=
ing the
> > answer to that question.
>=20
>=20
> "From v1, copying Linus's suggestion:
>=20
> > +  This domain contains 4 IO groups which support voltage levels 1.8V a=
nd 3.3V
> > +  gpioe-spi - comprises PAD_GPIO_C0 through PAD_GPIO_C4.
> > +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> > +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> > +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> > +
> > +  Each of the above IO groups must be configured with a voltage settin=
g that matches the external
> > +  voltage level provided to the IO group.
>=20
> So your hardware has groups and support some properties on the group leve=
l.
>=20
> So expose these groups and make these properties configurable per group
> instead of inventing per-group properties.
>=20
> > +  gpioe-spi-vref:
> > +  gpioe-qspi0-vref:
> > +  gpioe-qspi1-vref:
> > +  gpioe-qspi2-vref:
>=20
> Create proper groups in the pin controller then use the
> standard pincfg property power-source =3D <...>; for this.
>=20
> Example for a simple default hog:
>=20
> pinctrl {
>     /* Hog the QSPI pins */
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&qspi_default>;
>=20
>     qspi_default: pinctrl-qspi {
>         config {
>             groups =3D "gpioe-qspi-pins";
>             power-source =3D <2>;
>         };
>     };
> };
>=20
> The groups can be orthogonal to other pin handling, that's
> fine. Implement .pin_config_group_set in struct pinconf_ops.
>=20
> However, I found that pinctrl_generic_pins_function_dt_node_to_map() does=
 not=20
> handle the groups property,

That's kind of the whole point of the function, see the comment about
it:
/*
 * For platforms that do not define groups or functions in the driver, but
 * instead use the devicetree to describe them. This function will, unlike
 * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
 * and functions, create them in addition to parsing pinconf properties and
 * adding mappings.
 */

If you have the groups property in your devicetree, it contains strings
that the driver uses to match against the groups it has defined in it.
See my recently added microchip,pic64gx-pinctrl-gpio2 for an example of
that if you like.

However, if you are using the pins or pinmux properties, the groups are
not defined in the driver, and need to be created at runtime. That's
what pinctrl_generic_pins_function_dt_node_to_map() is for - it creates
the groups at runtime when using the *pins* and *function* properties.
It's in the name!

Judging by your drivers, and how many structures you have that look very
like groups from a quick glance, probably you can still make use of the
groups property. The equivalent function to
pinctrl_generic_pins_function_dt_node_to_map() when you're using driver
defined groups is pinconf_generic_dt_node_to_map().

Also, I notice that you never actually answered the question that I
asked:
> > I looked through the series though and all controllers appear to have p=
ins and
> > functions, is it the case that gpio is the default for these pins, so y=
ou are
> > omitting the functions property when you are using the pin in gpio mode?
> > Saying that the functions property is "redudant" makes it seem like thi=
s might
> > be the case?

Are you omitting the functions property from your nodes when they're
using gpio because it is a default, or is there some other reason why
you're omitting the functions property sometimes?


> currently, my node uses pins instead, so it looks like this:
>=20
> +&pinctrl_per3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gpios_configs>;
> +
> +	gpios_configs: gpios-hog-grp {
> +		gpios-hog-pins {
> +			pins =3D <PADNUM_PER3_GPIO_E0
> +				PADNUM_PER3_GPIO_E1
> +				PADNUM_PER3_GPIO_E2
> +				PADNUM_PER3_GPIO_E3
> +				PADNUM_PER3_GPIO_E4
> +				PADNUM_PER3_GPIO_E5
> +				PADNUM_PER3_GPIO_E6
> +				PADNUM_PER3_GPIO_E7
> +				PADNUM_PER3_GPIO_E8
> +				PADNUM_PER3_GPIO_E9
> +				PADNUM_PER3_GPIO_E10>;
> +			power-source =3D <JHB100_PINVREF_1_8V>;
> +		};
> +	};
> +};
>=20
> Best regards,
> Changhuang
>=20

--TfqgCJgMGabClEuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbNXgAKCRB4tDGHoIJi
0hDOAP9QsmueYrhT6e0GNFL/p7Lhrcf5L/7S/ufZj4VmRodEHgD6A2+iq8ip2Jsc
wOX3AS5YYYdkLDxh/V4ZlxG20GuG9Qg=
=miil
-----END PGP SIGNATURE-----

--TfqgCJgMGabClEuj--


--===============7673783265656003181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7673783265656003181==--

