Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C05CD4F25
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/maPSYI1fbzfmm6qrDzDEY+LQvM9OTvx/cZ3+S4G4ks=; b=2hnfDecODDYmgdtyqK8e9ymx0a
	d1ZAcIl49h6xplKzqb5aU6DkA352Dq+P+17yMiSXCB0GkmOOGVs4ScVkcsFwXOZJPzvhCO/0JWIkL
	rlYFzx96KNnYxBT2TF5VrW8UL79lQajUSh6LRnc4DM2jfwsAZhbUHYmiBWmlDciIQ0O2cET2NbsyF
	iR+wiOW5stl5zXVJMM+iMc4ViHDC1ExrG6oLrRXzRT5KcFHdp9270hR+2FalwdcDI0iGxpoEeg50c
	cKxRsAI6zVuSDGIZuADyuCPT0i60d2FVhaECd08hDaMB+ozJ2yz4PPoCn1Jan9przA4zabF8xI99D
	FFrNeeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvrZ-00000008vrR-2i5G;
	Fri, 15 May 2026 16:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvrY-00000008vrC-3BRS
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 16:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/s8FR4wyxbawTu1GjKNrhGHBFNwnVdK6ju78tqMPUI8=; b=LfjPZZjLQZwf+/XiO5o0CEQgH7
	rVykZtAfS1hXh7G2CEWgQXqSdPveKW+vPIPmEC/D9RTv/KgaGfnfd1Ivv3ttcbvttH6aJ84U9bMuA
	e28+/F2wyiNe/D740+3WDaIGlJiLypaYpCxHRxDyvEXOpeqRtfzNKZrGBtwsiSHt5XJneCgvdh5cY
	jUlXhHk1AkEfNK8WmnbWMyLlKPM7yd26aq/P1IneI/mZzJn/rR/vlFnhJk4pgMK8dVQ+u3HHLyC4z
	6lFgWhOUThQyXk3YV2/XoST4jG5dZh8j0/8YdoiXhNZt4VCpCv1GTlNUohg4HZBf1RSyW/vKvI9qI
	VogMg4lQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvrU-00000005k0i-3LYZ
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 16:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34CF9445E1;
	Fri, 15 May 2026 16:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB3FC2BCB0;
	Fri, 15 May 2026 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778864287;
	bh=+uvwRRXb0+ag+SzLI9XwgxVtGQw0racVNBs8qolbmd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nv+CMK0dIIDJ16d8jDglGtsTecbrA3gz6no2bADm+YJFI43q6uvZAjo8+1dryXXhz
	 hn3f6ALLPmrtT2d5zIviNvwOPOXEILIkqvUj3B1feh3myA4YnGccVIK9sRFBsw1rg5
	 6h7hGS9+o4CAjKGa9lgk+bZbKUxHb8vGuWRZcPIk26YsbcQZtI31iVUKMwMIKIeQ/s
	 shO1d8E5i5esuR/n7OGH3LDuRZAEaQ8VqXyGGg7EpDX5bJRxd3wtCu/nHn4wGYIOmT
	 vB7PyebUZsUN7gyBqAn86N0q1/WyGd7G6N0ZzsUy7YvBrfplNnOr+gjDJqLV9P4KpK
	 h32H2/e0EdWoQ==
Date: Fri, 15 May 2026 17:58:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Message-ID: <20260515-outplayed-java-635f7231d394@spud>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
 <20260514-operation-remix-9f9fcf9a6102@spud>
 <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-dandruff-shorts-d7417c6e977a@wendy>
 <ZQ4PR01MB1202D30B108C4562242C1ED8F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-bounce-lather-23de8e36754c@wendy>
 <ZQ4PR01MB12021791B5A255F9EB91D9F6F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB12021791B5A255F9EB91D9F6F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_175809_501064_32420D1F 
X-CRM114-Status: GOOD (  62.97  )
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
Content-Type: multipart/mixed; boundary="===============1511709906773815389=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1511709906773815389==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZZhM5VJBeP8Nh3yc"
Content-Disposition: inline


--ZZhM5VJBeP8Nh3yc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 10:30:38AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the comments.
>=20
> > On Fri, May 15, 2026 at 08:23:55AM +0000, Changhuang Liang wrote:
> > > > On Fri, May 15, 2026 at 05:55:48AM +0000, Changhuang Liang wrote:
> > > > > > On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrot=
e:
> > > > > > > Some pinctrl subnodes only need to configure pin properties
> > > > > > > (e.g., power-source, bias, drive strength) without assigning =
any mux
> > function.
> > > > > > >
> > > > > > > Currently, the driver requires a valid "function" property for
> > > > > > > all pinctrl subnodes. This forces the addition of dummy or
> > > > > > > redundant "function" entries when only pin configuration is n=
eeded.
> > > > > > >
> > > > > > > Example use case:
> > > > > > > gpios-configs {
> > > > > > >     config {
> > > > > > >         pins =3D <0 1 2 3>;
> > > > > > >         power-source =3D <0>;
> > > > > > >     };
> > > > > > > };
> > > > > > >
> > > > > > > Make the "function" property optional. If it is missing, skip
> > > > > > > adding the mux map and only process the pin configuration.
> > > > > >
> > > > > > I looked through the series though and all controllers appear to
> > > > > > have pins and functions, is it the case that gpio is the default
> > > > > > for these pins, so you are omitting the functions property when
> > > > > > you are using
> > > > the pin in gpio mode?
> > > > > > Saying that the functions property is "redudant" makes it seem
> > > > > > like this might be the case?
> > > > > >
> > > > > > I've got some feedback here, but I can't really provide it
> > > > > > without knowing the answer to that question.
> > > > >
> > > > >
> > > > > "From v1, copying Linus's suggestion:
> > > > >
> > > > > > +  This domain contains 4 IO groups which support voltage levels
> > > > > > + 1.8V and 3.3V  gpioe-spi - comprises PAD_GPIO_C0 through
> > > > PAD_GPIO_C4.
> > > > > > +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> > > > > > +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> > > > > > +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> > > > > > +
> > > > > > +  Each of the above IO groups must be configured with a voltage
> > > > > > + setting that matches the external  voltage level provided to
> > > > > > + the IO
> > > > group.
> > > > >
> > > > > So your hardware has groups and support some properties on the
> > > > > group
> > > > level.
> > > > >
> > > > > So expose these groups and make these properties configurable per
> > > > > group instead of inventing per-group properties.
> > > > >
> > > > > > +  gpioe-spi-vref:
> > > > > > +  gpioe-qspi0-vref:
> > > > > > +  gpioe-qspi1-vref:
> > > > > > +  gpioe-qspi2-vref:
> > > > >
> > > > > Create proper groups in the pin controller then use the standard
> > > > > pincfg property power-source =3D <...>; for this.
> > > > >
> > > > > Example for a simple default hog:
> > > > >
> > > > > pinctrl {
> > > > >     /* Hog the QSPI pins */
> > > > >     pinctrl-names =3D "default";
> > > > >     pinctrl-0 =3D <&qspi_default>;
> > > > >
> > > > >     qspi_default: pinctrl-qspi {
> > > > >         config {
> > > > >             groups =3D "gpioe-qspi-pins";
> > > > >             power-source =3D <2>;
> > > > >         };
> > > > >     };
> > > > > };
> > > > >
> > > > > The groups can be orthogonal to other pin handling, that's fine.
> > > > > Implement .pin_config_group_set in struct pinconf_ops.
> > > > >
> > > > > However, I found that
> > > > > pinctrl_generic_pins_function_dt_node_to_map()
> > > > > does not handle the groups property,
> > > >
> > > > That's kind of the whole point of the function, see the comment
> > > > about
> > > > it:
> > > > /*
> > > >  * For platforms that do not define groups or functions in the
> > > > driver, but
> > > >  * instead use the devicetree to describe them. This function will,
> > > > unlike
> > > >  * pinconf_generic_dt_node_to_map() etc which rely on driver defined
> > > > groups
> > > >  * and functions, create them in addition to parsing pinconf
> > > > properties and
> > > >  * adding mappings.
> > > >  */
> > > >
> > > > If you have the groups property in your devicetree, it contains
> > > > strings that the driver uses to match against the groups it has def=
ined in it.
> > > > See my recently added microchip,pic64gx-pinctrl-gpio2 for an example
> > > > of that if you like.
> > > >
> > > > However, if you are using the pins or pinmux properties, the groups
> > > > are not defined in the driver, and need to be created at runtime.
> > > > That's what
> > > > pinctrl_generic_pins_function_dt_node_to_map() is for - it creates
> > > > the groups at runtime when using the *pins* and *function* properti=
es.
> > > > It's in the name!
> > > >
> > > > Judging by your drivers, and how many structures you have that look
> > > > very like groups from a quick glance, probably you can still make
> > > > use of the groups property. The equivalent function to
> > > > pinctrl_generic_pins_function_dt_node_to_map() when you're using
> > > > driver defined groups is pinconf_generic_dt_node_to_map().
> > >
> > > I feel that for the current platform, initializing pin voltage is
> > > suitable for using `pinconf_generic_dt_node_to_map()`,
> > > and configuring pin mux is suitable for using
> > > `pinctrl_generic_pins_function_dt_node_to_map()`. Should I use both of
> > them at the same time?
> >=20
> > No, pick either groups or pins across the board and then use the approp=
riate
> > function after that. Mixing and matching just adds complication for no =
real
> > reason.
> >=20
> > > > Also, I notice that you never actually answered the question that I
> > > > asked:
> > > > > > I looked through the series though and all controllers appear to
> > > > > > have pins and functions, is it the case that gpio is the default
> > > > > > for these pins, so you are omitting the functions property when
> > > > > > you are using
> > > > the pin in gpio mode?
> > > > > > Saying that the functions property is "redudant" makes it seem
> > > > > > like this might be the case?
> > > >
> > > > Are you omitting the functions property from your nodes when they're
> > > > using gpio because it is a default, or is there some other reason
> > > > why you're omitting the functions property sometimes?
> > >
> > > Sorry, I missed that question. What I meant by making 'functions'
> > > optional is that I don't care whether the current pin's default value=
 is GPIO
> > or some other function.
> > > Here, I just want to initialize the default voltage of these pins, not
> > > configure their pin function.
> >=20
> > You're making them gpios in all the cases that I saw, so I think you're=
 best
> > served by using the "gpio" function and thereby being able to have func=
tion as
> > a required property. Unless the pins are unused, you need to set the fu=
nction
> > anyway, and if they're unused and survived on the values set by reset o=
r prior
> > boot stages, why do you need to set the voltage anyway?
> >=20
> > Looking at this node, it looks completely wrong to me:
> > +&pinctrl_sys2 {
> > +	gpiow0_configs: gpiow0-hog-grp {
> > +		gpiow0-hog-pins {
> > +			pins =3D <PADNUM_SYS2_GPIO_A36
> > +				PADNUM_SYS2_GPIO_A37
> > +				PADNUM_SYS2_GPIO_A38
> > +				PADNUM_SYS2_GPIO_A39>;
> > +			power-source =3D <JHB100_PINVREF_3_3V>;
> > +		};
> > +	};
> > +
> > +	gpiow_inner_configs: gpiow-inner-hog-grp {
> > +		gpiow-inner-hog-pins {
> > +			pins =3D <PADNUM_SYS2_GPIO_A40
> > +				PADNUM_SYS2_GPIO_A41
> > +				PADNUM_SYS2_GPIO_A42
> > +				PADNUM_SYS2_GPIO_A43>;
> > +			power-source =3D <JHB100_PINVREF_3_3V>;
> > +		};
> > +	};
> > +
> > +	uart6_pins: uart6-grp {
> > +		uart6-tx-pins {
> > +			pins =3D <PADNUM_SYS2_GPIO_A38>;
> > +			function =3D "uart";
> > +		};
> > +
> > +		uart6-rx-pins {
> > +			pins =3D <PADNUM_SYS2_GPIO_A39>;
> > +			function =3D "uart";
> > +			input-enable;
> > +		};
> > +	};
> > +};
> >=20
> > The pins used by uart appear also in your hog node and...
> >=20
> > > This part of the voltage configuration only has one register, but it
> > > applies to many pins, so currently it seems I can only use pinctrl ho=
g to
> > initialize it.
> >=20
> > ...I think that relates to the point you make here. If a setting for the
> > power-source applies across an entire set of pins, there's no need to
> > preemptively apply this across the whole set. It's usually sufficient t=
o just set
> > the power-source in the nodes that describe pins that are actually in u=
se, for
> > example:
> >=20
> > | &pinctrl_sys2 {
> > | 	uart6_pins: uart6-grp {
> > | 		uart6-tx-pins {
> > | 			pins =3D <PADNUM_SYS2_GPIO_A38>;
> > | 			function =3D "uart";
> > | 			power-source =3D <JHB100_PINVREF_3_3V>;
> > | 		};
> > |
> > | 		uart6-rx-pins {
> > | 			pins =3D <PADNUM_SYS2_GPIO_A39>;
> > | 			function =3D "uart";
> > | 			input-enable;
> > | 			power-source =3D <JHB100_PINVREF_3_3V>;
> > | 		};
> > | 	};
> > | };
>=20
> I think this approach is suitable for cases where each pin has its own in=
dependent register filed.=20
> I'm not sure if it's suitable for this kind of voltage configuration wher=
e multiple pins share a=20
> single register field.
>=20
> With this approach, the driver would end up writing the same value to the=
 same register twice,=20
> once for A38 and once for A39. Is that acceptable?

IMO, yes. This wouldn't be the only driver that does this. Only problem
is potentially using the wrong voltage in two nodes that affect pins in
the same vref group - but that's a flaw with the current setup too,
since nothing stops you putting power-source into multiple nodes at
present either. It's not ideal, but it's definitely more acceptable than
what you have here at the moment.

>=20
> If that's acceptable, the code would indeed become much simpler.

And you can make pins and functions required properties then too I
think, which is a win. Or groups and functions if you pivot there.

--ZZhM5VJBeP8Nh3yc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdQmQAKCRB4tDGHoIJi
0nMjAQC21w7gXszUg0gQDJ/WIXbLjOt/jmJMTZulnr/4B8XojAEApJ9RI5ZwjiUU
wevelOpAo4+3T0VNQGPxGgXfPyJK+gI=
=jV/c
-----END PGP SIGNATURE-----

--ZZhM5VJBeP8Nh3yc--


--===============1511709906773815389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1511709906773815389==--

