Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B81CCFA18
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSIA2HTUCQECIB2HweS3YGJRdluu1Iv71PM6AqMac9g=; b=an/5VJ4ky39JGBRh8zAJqlbzu/
	O39jX7R4chxPk5HQ0d2tUoppHDexbIS+2w8t+F5wlSuwHvVtHKP348nW+z4+2t0PNcroR0WUPIuos
	yzL1bChz9Ag9UYF1K6autoLuThb/U1eXic9bEPAuS9AH+XmKE+Y6XiFILsCL4np6buPIYmi7690Gp
	Qog5kDqB3hf81SRFvQi+AbuPoSUvYmpNj2It53UtkyV4CRR5cWGV0ONByEkrvxVaXCrMIEKKuf8zE
	4pCFAasQozv5rApk7k9oGDkOfUOvhlUhrwlHFqmxTcVz34OWFJuudqzsFgYqrQ2/xtdI5v1hVG9Lb
	YLQ645gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIt29-00000007bP7-3uUI;
	Tue, 11 Nov 2025 18:24:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIt27-00000007bOM-005J;
	Tue, 11 Nov 2025 18:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D32A40204;
	Tue, 11 Nov 2025 18:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC9CC16AAE;
	Tue, 11 Nov 2025 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762885438;
	bh=wEYcTbf1t7TK5WW9GO1kpaI4TRakvg9qgXLkq9cJOpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svEXRkNtCnUwLzz9/rJbkFLcNcd6SGYPjddbxn4Etm9Jt2qrErXd0qB2spLZdptHN
	 TB6QNXBuh+iOwtSg0W257gr4zpGKitMLxwsFiYmLNnu3FynnkwyB20He99hD08e5Ma
	 ZRKd8b8TwRtip9skzFP3yG7VSqUpCZyYSD3VY0W/I+Y32F2Wo88CPCOg+px6vQLJXA
	 PZvLZDa7nxRs1ylhtnkVEypmlO7dV2T95z0lnd4Q6fv7oyREOIhDAYVVoPXDB1ydv4
	 E5Dt9Ox6dMYp72GWkqCQvv5fHZH7QOHFK50VrpL1bsBfPaycV8x8IVmtToalySQQ0f
	 oSkwIuzURyHPQ==
Date: Tue, 11 Nov 2025 18:23:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH RFC 04/13] dt-bindings: display: bridge: Add
 starfive,jh7110-hdmi-controller
Message-ID: <20251111-filler-wisplike-2c30631e82a0@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010458eucas1p11d128a6dd0aab3171db7c001e69ecfc8@eucas1p1.samsung.com>
 <20251108-jh7110-clean-send-v1-4-06bf43bb76b1@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20251108-jh7110-clean-send-v1-4-06bf43bb76b1@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_102359_084555_FB09977C 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Lee Jones <lee@kernel.org>, Andy Yan <andyshrk@163.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hal Feng <hal.feng@starfivetech.com>, Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Maud Spierings <maudspierings@gocontroll.com>, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1210978962606990708=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1210978962606990708==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZI6TsvLTJLuPL419"
Content-Disposition: inline


--ZI6TsvLTJLuPL419
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 02:04:38AM +0100, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
> (DRM bridge).
>=20
> This device is the second child of the starfive,jh7110-hdmi-mfd node. It
> consumes register access clocks (sys, mclk, bclk) from the voutcrg and
> both the pixel clock (pclk) and the PHY from its hdmi_phy sibling.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive,jh7110-inno-hdmi-controller.yaml      | 123 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 124 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh=
7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/=
bridge/starfive,jh7110-inno-hdmi-controller.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3707c9dbff9c9fdc0ed7db472=
0a6dd8eabeeb774
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-in=
no-hdmi-controller.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/starfive,jh7110-inno-h=
dmi-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Innosilicon HDMI Controller
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description:
> +  The controller portion of the StarFive JH7110 INNO HDMI IP.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-inno-hdmi-controller
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System clock for register access
> +      - description: Module clock
> +      - description: Bus clock
> +      - description: Pixel clock from PHY
> +
> +  clock-names:
> +    items:
> +      - const: sys
> +      - const: mclk
> +      - const: bclk
> +      - const: pclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: hdmi_tx
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: hdmi-phy
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      A graph node with one input port and one output port.
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    soc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        hdmi_mfd: hdmi@29590000 {
> +            compatible =3D "starfive,jh7110-hdmi-mfd";
> +            reg =3D <0x29590000 0x4000>;
> +
> +            hdmi_phy: phy {
> +                compatible =3D "starfive,jh7110-inno-hdmi-phy";
> +                clocks =3D <&xin24m>;
> +                clock-names =3D "refoclk";
> +                #clock-cells =3D <0>;
> +                clock-output-names =3D "hdmi_pclk";
> +                #phy-cells =3D <0>;
> +            };
> +
> +            hdmi_controller: controller {

If this stuff doesn't make sense to have an example of without the phy,
then just have an example in the parent and drop it from both child
bindings. Or just drop the parent node and phy, and let the binding
checking tools "invent" a fake phy for checking purposes.

> +                compatible =3D "starfive,jh7110-inno-hdmi-controller";
> +                interrupts =3D <99>;
> +                clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                         <&hdmi_phy>;
> +                clock-names =3D "sys", "mclk", "bclk", "pclk";
> +                resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +                reset-names =3D "hdmi_tx";
> +                phys =3D <&hdmi_phy>;
> +                phy-names =3D "hdmi-phy";
> +
> +                ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                        reg =3D <0>;
> +                        hdmi_in: endpoint {
> +                            remote-endpoint =3D <&dpu_out_dpi0>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg =3D <1>;
> +                        hdmi_out: endpoint {
> +                            remote-endpoint =3D <&hdmi_con_in>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a75ba7a44ee84db6a75b91c1a0867a37db2ebcdb..66fab45bbee8c1a5f73d09bb4=
70d28029b8c6139 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24047,6 +24047,7 @@ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-star=
five.c
>  STARFIVE JH7110 DISPLAY SUBSYSTEM
>  M:	Michal Wilczynski <m.wilczynski@samsung.com>
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno=
-hdmi-controller.yaml
>  F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.y=
aml
>  F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-s=
ubsystem.yaml
> =20
>=20
> --=20
> 2.34.1
>=20

--ZI6TsvLTJLuPL419
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRN/NQAKCRB4tDGHoIJi
0mTRAQDrzGla63doQ7J4bgwmc6WLb+V4M/UVNE1RPfdo2TM/PwD/RU18YcQAMUxv
zYNvIsiBtHO1QpriMfcWzYUSA0r4WAA=
=LhXK
-----END PGP SIGNATURE-----

--ZI6TsvLTJLuPL419--


--===============1210978962606990708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1210978962606990708==--

