Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE5ACD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCDY4TSEiuZbz/N7EmB+m9TGPuss6uBKGzWtYJhQg6w=; b=GSfSFcPeR4aH7wyDaTmhee9UcO
	IPoQIEcCLsCVpHtEvQ7368HqJT70BbKz9/Htao60ozj+0Gp6w4cEWNOS0hnJiMfkstooCbV2thbaX
	VKkV2Es5WPG64UkEyJN6+vF3CcsQLoaKvXjxiIahtXaVIrUB2G1Per1/NnVoBbKoAkUymyRtwOYpw
	mv4oxacVk6fL0/BB/34I3bZgZMCTbqfVQNSUhpgqxBRspXWxnmFSbUBNNBE6Emr5JxpcyjZe5mPhu
	/1jqqdWobyTTIW3ov7VTx2O8lguo2VIq5V9oK74m9CEEzdw1015KMst3kdVGvEpI9NEYNZ5fN+ZC6
	FTuuGEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNp9I-00000007wvr-2x9o;
	Fri, 15 May 2026 09:48:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNp9G-00000007wvQ-2Et2
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 09:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778838482; x=1810374482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zA48xHY2LIiXSFU+rM5KjH6BYnO1EpvPkynbTP0ZLxg=;
  b=xHm2hVuGcQV5GSx9594kHcNTS03O4LZj4zZyWLNn4kYwKvkcmDa4U2rM
   tXbC19VqufHUYiP83A7tNt9/YoMozt4xdqvSwyuSEha2I1eg07pm7gxfb
   mOnkiAGJZKIewPiFLP9FP96bEx1sOZ6JzciTYKlKOzwX1qf7KeIqeU5rP
   116pHFiKTPE65RjddWxqGm2r5xqchjnRFS0EjNRyqlaZKabpqxjCs6+rd
   Vc1TtkidPAksWMCYQmpvlrmO5MG6eDk9PoJ7wlhDssdt0Q1Wq4oxCN3m0
   nVzv/xXkd3gFZAC0TqXSzg6RxQdYYPiWIaMQnA8qPJlPZ9Np8/HLfimVm
   Q==;
X-CSE-ConnectionGUID: I88ez8XZTuqhvcOOZtB7Tw==
X-CSE-MsgGUID: A+nfqdNNQgGTm7kqGfzYwA==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="56788417"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 02:48:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 02:48:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 02:47:57 -0700
Date: Fri, 15 May 2026 10:47:19 +0100
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
Message-ID: <20260515-bounce-lather-23de8e36754c@wendy>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
 <20260514-operation-remix-9f9fcf9a6102@spud>
 <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-dandruff-shorts-d7417c6e977a@wendy>
 <ZQ4PR01MB1202D30B108C4562242C1ED8F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202D30B108C4562242C1ED8F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_024802_650017_AD6EFB8B 
X-CRM114-Status: GOOD (  57.30  )
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
Content-Type: multipart/mixed; boundary="===============6151981923322886861=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6151981923322886861==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o+r/Y2FnyRfiN/5w"
Content-Disposition: inline

--o+r/Y2FnyRfiN/5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 08:23:55AM +0000, Changhuang Liang wrote:
> > On Fri, May 15, 2026 at 05:55:48AM +0000, Changhuang Liang wrote:
> > > > On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrote:
> > > > > Some pinctrl subnodes only need to configure pin properties (e.g.,
> > > > > power-source, bias, drive strength) without assigning any mux fun=
ction.
> > > > >
> > > > > Currently, the driver requires a valid "function" property for all
> > > > > pinctrl subnodes. This forces the addition of dummy or redundant
> > > > > "function" entries when only pin configuration is needed.
> > > > >
> > > > > Example use case:
> > > > > gpios-configs {
> > > > >     config {
> > > > >         pins =3D <0 1 2 3>;
> > > > >         power-source =3D <0>;
> > > > >     };
> > > > > };
> > > > >
> > > > > Make the "function" property optional. If it is missing, skip
> > > > > adding the mux map and only process the pin configuration.
> > > >
> > > > I looked through the series though and all controllers appear to
> > > > have pins and functions, is it the case that gpio is the default for
> > > > these pins, so you are omitting the functions property when you are=
 using
> > the pin in gpio mode?
> > > > Saying that the functions property is "redudant" makes it seem like
> > > > this might be the case?
> > > >
> > > > I've got some feedback here, but I can't really provide it without
> > > > knowing the answer to that question.
> > >
> > >
> > > "From v1, copying Linus's suggestion:
> > >
> > > > +  This domain contains 4 IO groups which support voltage levels
> > > > + 1.8V and 3.3V  gpioe-spi - comprises PAD_GPIO_C0 through
> > PAD_GPIO_C4.
> > > > +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> > > > +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> > > > +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> > > > +
> > > > +  Each of the above IO groups must be configured with a voltage
> > > > + setting that matches the external  voltage level provided to the =
IO
> > group.
> > >
> > > So your hardware has groups and support some properties on the group
> > level.
> > >
> > > So expose these groups and make these properties configurable per
> > > group instead of inventing per-group properties.
> > >
> > > > +  gpioe-spi-vref:
> > > > +  gpioe-qspi0-vref:
> > > > +  gpioe-qspi1-vref:
> > > > +  gpioe-qspi2-vref:
> > >
> > > Create proper groups in the pin controller then use the standard
> > > pincfg property power-source =3D <...>; for this.
> > >
> > > Example for a simple default hog:
> > >
> > > pinctrl {
> > >     /* Hog the QSPI pins */
> > >     pinctrl-names =3D "default";
> > >     pinctrl-0 =3D <&qspi_default>;
> > >
> > >     qspi_default: pinctrl-qspi {
> > >         config {
> > >             groups =3D "gpioe-qspi-pins";
> > >             power-source =3D <2>;
> > >         };
> > >     };
> > > };
> > >
> > > The groups can be orthogonal to other pin handling, that's fine.
> > > Implement .pin_config_group_set in struct pinconf_ops.
> > >
> > > However, I found that pinctrl_generic_pins_function_dt_node_to_map()
> > > does not handle the groups property,
> >=20
> > That's kind of the whole point of the function, see the comment about
> > it:
> > /*
> >  * For platforms that do not define groups or functions in the driver, =
but
> >  * instead use the devicetree to describe them. This function will, unl=
ike
> >  * pinconf_generic_dt_node_to_map() etc which rely on driver defined
> > groups
> >  * and functions, create them in addition to parsing pinconf properties=
 and
> >  * adding mappings.
> >  */
> >=20
> > If you have the groups property in your devicetree, it contains strings=
 that the
> > driver uses to match against the groups it has defined in it.
> > See my recently added microchip,pic64gx-pinctrl-gpio2 for an example of=
 that
> > if you like.
> >=20
> > However, if you are using the pins or pinmux properties, the groups are=
 not
> > defined in the driver, and need to be created at runtime. That's what
> > pinctrl_generic_pins_function_dt_node_to_map() is for - it creates the =
groups
> > at runtime when using the *pins* and *function* properties.
> > It's in the name!
> >=20
> > Judging by your drivers, and how many structures you have that look ver=
y like
> > groups from a quick glance, probably you can still make use of the grou=
ps
> > property. The equivalent function to
> > pinctrl_generic_pins_function_dt_node_to_map() when you're using driver
> > defined groups is pinconf_generic_dt_node_to_map().
>=20
> I feel that for the current platform, initializing pin voltage is suitabl=
e for using `pinconf_generic_dt_node_to_map()`,=20
> and configuring pin mux is suitable for using `pinctrl_generic_pins_funct=
ion_dt_node_to_map()`. Should I use both=20
> of them at the same time?

No, pick either groups or pins across the board and then use the
appropriate function after that. Mixing and matching just adds
complication for no real reason.

> > Also, I notice that you never actually answered the question that I
> > asked:
> > > > I looked through the series though and all controllers appear to
> > > > have pins and functions, is it the case that gpio is the default for
> > > > these pins, so you are omitting the functions property when you are=
 using
> > the pin in gpio mode?
> > > > Saying that the functions property is "redudant" makes it seem like
> > > > this might be the case?
> >=20
> > Are you omitting the functions property from your nodes when they're us=
ing
> > gpio because it is a default, or is there some other reason why you're =
omitting
> > the functions property sometimes?
>=20
> Sorry, I missed that question. What I meant by making 'functions' optiona=
l is that I=20
> don't care whether the current pin's default value is GPIO or some other =
function.=20
> Here, I just want to initialize the default voltage of these pins, not co=
nfigure their=20
> pin function.

You're making them gpios in all the cases that I saw, so I think you're
best served by using the "gpio" function and thereby being able to have
function as a required property. Unless the pins are unused, you need to
set the function anyway, and if they're unused and survived on the
values set by reset or prior boot stages, why do you need to set the
voltage anyway?

Looking at this node, it looks completely wrong to me:
+&pinctrl_sys2 {
+	gpiow0_configs: gpiow0-hog-grp {
+		gpiow0-hog-pins {
+			pins =3D <PADNUM_SYS2_GPIO_A36
+				PADNUM_SYS2_GPIO_A37
+				PADNUM_SYS2_GPIO_A38
+				PADNUM_SYS2_GPIO_A39>;
+			power-source =3D <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	gpiow_inner_configs: gpiow-inner-hog-grp {
+		gpiow-inner-hog-pins {
+			pins =3D <PADNUM_SYS2_GPIO_A40
+				PADNUM_SYS2_GPIO_A41
+				PADNUM_SYS2_GPIO_A42
+				PADNUM_SYS2_GPIO_A43>;
+			power-source =3D <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	uart6_pins: uart6-grp {
+		uart6-tx-pins {
+			pins =3D <PADNUM_SYS2_GPIO_A38>;
+			function =3D "uart";
+		};
+
+		uart6-rx-pins {
+			pins =3D <PADNUM_SYS2_GPIO_A39>;
+			function =3D "uart";
+			input-enable;
+		};
+	};
+};

The pins used by uart appear also in your hog node and...

> This part of the voltage configuration only has one register, but it appl=
ies to many=20
> pins, so currently it seems I can only use pinctrl hog to initialize it.

=2E..I think that relates to the point you make here. If a setting for the
power-source applies across an entire set of pins, there's no need to
preemptively apply this across the whole set. It's usually sufficient to
just set the power-source in the nodes that describe pins that are actually
in use, for example:

| &pinctrl_sys2 {
| 	uart6_pins: uart6-grp {
| 		uart6-tx-pins {
| 			pins =3D <PADNUM_SYS2_GPIO_A38>;
| 			function =3D "uart";
| 			power-source =3D <JHB100_PINVREF_3_3V>;
| 		};
|=20
| 		uart6-rx-pins {
| 			pins =3D <PADNUM_SYS2_GPIO_A39>;
| 			function =3D "uart";
| 			input-enable;
| 			power-source =3D <JHB100_PINVREF_3_3V>;
| 		};
| 	};
| };

The fact that you also are having to do
+&pinctrl_sys2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&gpiow0_configs
+		     &gpiow_inner_configs>;
+};
and have this sys2 pin controller use its own pinctrl state to apply
your hogs is another reason this looks wrong to me. I wouldn't be happy
to accept this dts.
It's also hardly a "hog" since it isn't actually hogging anything at all,
given uart6 also uses some of the pins.

Hope that helps?

Conor.


>=20
> Best Regards,
> Changhuang
>=20
> >=20
> > > currently, my node uses pins instead, so it looks like this:
> > >
> > > +&pinctrl_per3 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&gpios_configs>;
> > > +
> > > +	gpios_configs: gpios-hog-grp {
> > > +		gpios-hog-pins {
> > > +			pins =3D <PADNUM_PER3_GPIO_E0
> > > +				PADNUM_PER3_GPIO_E1
> > > +				PADNUM_PER3_GPIO_E2
> > > +				PADNUM_PER3_GPIO_E3
> > > +				PADNUM_PER3_GPIO_E4
> > > +				PADNUM_PER3_GPIO_E5
> > > +				PADNUM_PER3_GPIO_E6
> > > +				PADNUM_PER3_GPIO_E7
> > > +				PADNUM_PER3_GPIO_E8
> > > +				PADNUM_PER3_GPIO_E9
> > > +				PADNUM_PER3_GPIO_E10>;
> > > +			power-source =3D <JHB100_PINVREF_1_8V>;
> > > +		};
> > > +	};
> > > +};
> > >
> > > Best regards,
> > > Changhuang
> > >

--o+r/Y2FnyRfiN/5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbrpwAKCRB4tDGHoIJi
0u2+AQCw1TfWiVjA/dGMiQm0IWmh+bJDIyc6ZfdhXoZNhvduVgD+IhUrCABPXa1o
bGvgUjdIPvw3IUzKS4T5io57JpS/YwU=
=HHZG
-----END PGP SIGNATURE-----

--o+r/Y2FnyRfiN/5w--


--===============6151981923322886861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6151981923322886861==--

