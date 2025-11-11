Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DC6CCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OgZKs4KxRMPUEem7L/zoZY5bMsgzzDx+vwAlQMgrok=; b=0M5+Qa4ZXTa5anKshX0n4u8hmh
	/e1FadqmJqCeWTE6R5kxnCyKSJ5SVvD9VkmNgworTicbKFfH/MWIZpj6nOA5YgCdQyEamoa4bAxYS
	USB7J9KY3J2xzJv1FwzlL+tWwLpozHkPu5QZlvmnvN8dw7L/eH4fvat23kJu6YUTkJBCWOI3eE/h3
	ovE6wZCt8iwaoXn9vhKNAbstMPQ2d5m4DnhMDNPJlVqUGTAcFWZJC5PNpqh+1eY4mpX68Ygbl8X8r
	NpUB5a0iiWM5brO5Q3+XrWpyx2YFMLXmrVmyEo6NLfWkDrDWEpU9bhIe2n0cyczSL5ALkCR2lXMKn
	lJh7W3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIswm-00000007b1u-0VlI;
	Tue, 11 Nov 2025 18:18:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIswk-00000007b1c-1vGy;
	Tue, 11 Nov 2025 18:18:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92F1060209;
	Tue, 11 Nov 2025 18:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0EDC116D0;
	Tue, 11 Nov 2025 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762885105;
	bh=9A1g77d6NETJrsVEFwCGkGYcg7oNe/734nbYe0R1toY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DE1UvpH/bC9UZ2eBNdd8mq2OkWzJrQvT+sAdgbmfNQQBPEh/tAnmIjmopSsH+/i5E
	 U1rDhQJM6MweLo/ufwiBDM1lFfgKcPglJWSBD8nWcdG+Vr4fZgBqLOGcWOkbbkTgFP
	 qxrcE5TT/HeNEs2/29sSMaAT3+TvBpLE0BqHvBX3DLzbFSNvkQbKU/GZjwnEPwEnUC
	 jC93p3cJ384/NXhhyYsEV/eB0Jm+haN1qW16cidNuUY6nM7B/Q8WDq45uLjgnaf5td
	 /1NW0yt7iA2gNM7b0Id+r8yDnMfYFl70ge4s3ljjhcgKNlcbxqbej4tvEWtzceK24a
	 JhfIq7TMhW33g==
Date: Tue, 11 Nov 2025 18:18:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add vout-subsystem
 IP block
Message-ID: <20251111-massager-twistable-1e88f03d82f8@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============3984446731251278952=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3984446731251278952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LyJKcpcoYORwRgse"
Content-Disposition: inline


--LyJKcpcoYORwRgse
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 02:04:35AM +0100, Michal Wilczynski wrote:
> Add the dt-binding documentation for the StarFive JH7110 Video Output
> (VOUT) subsystem.
>=20
> This node acts as a parent for all devices within the VOUT power domain,
> including the DC8200 display controller, the VOUTCRG clock generator,
> and the HDMI MFD block. Its driver is responsible for managing the
> shared power domain and top-level bus clocks for these children.
>=20
> It is a bit similar to the display subsystem qcom,sdm845-mdss DT node.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-vout-subsystem.yaml   | 156 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 161 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh71=
10-vout-subsystem.yaml b/Documentation/devicetree/bindings/soc/starfive/sta=
rfive,jh7110-vout-subsystem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..4ad9423ea139a537b4cfea26b=
0ed4ed263aa14a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout=
-subsystem.yaml
> @@ -0,0 +1,156 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-vout-sub=
system.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 VOUT (Video Output) Subsystem
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description:
> +  The JH7110 video output subsystem is an IP block that contains
> +  the display controller (DC8200), HDMI controller/PHY, and VOUT
> +  clock generator (VOUTCRG).
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-vout-subsystem
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  ranges: true
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +patternProperties:
> +  "^display@[0-9a-f]+$":

Personally I'd like to see these being regular properties, since there's
exactly one possible setup for this.

> +    type: object
> +    description: Verisilicon DC8200 Display Controller node.

Can you add the relevant references here instead of allowing any object?

Cheers,
Conor.

> +
> +  "^hdmi@[0-9a-f]+$":
> +    type: object
> +    description: StarFive HDMI MFD (PHY + Controller) node.
> +
> +  "^clock-controller@[0-9a-f]+$":
> +    type: object
> +    description: StarFive VOUT Clock Generator (VOUTCRG) node.
> +
> +  "^syscon@[0-9a-f]+$":
> +    type: object
> +    description: StarFive VOUT Syscon node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - resets
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/power/starfive,jh7110-pmu.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        vout_subsystem: display-subsystem@29400000 {
> +            compatible =3D "starfive,jh7110-vout-subsystem";
> +            reg =3D <0x0 0x29400000 0x0 0x200000>;
> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            ranges;
> +
> +            power-domains =3D <&pwrc JH7110_PD_VOUT>;
> +            clocks =3D <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
> +            resets =3D <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
> +
> +            dc8200: display@29400000 {
> +                compatible =3D "verisilicon,dc";
> +                reg =3D <0x0 0x29400000 0x0 0x2800>;
> +                interrupts =3D <95>;
> +                clocks =3D <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
> +                         <&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
> +                         <&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
> +                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
> +                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX1>;
> +                clock-names =3D "core", "axi", "ahb", "pix0", "pix1";
> +                resets =3D <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
> +                         <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
> +                         <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
> +                reset-names =3D "axi", "ahb", "core";
> +            };
> +
> +            hdmi_mfd: hdmi@29590000 {
> +                compatible =3D "starfive,jh7110-hdmi-mfd";
> +                reg =3D <0x0 0x29590000 0x0 0x4000>;
> +                interrupts =3D <99>;
> +
> +                hdmi_phy: phy {
> +                    compatible =3D "starfive,jh7110-inno-hdmi-phy";
> +                    clocks =3D <&xin24m>;
> +                    clock-names =3D "refoclk";
> +                    #clock-cells =3D <0>;
> +                    clock-output-names =3D "hdmi_pclk";
> +                    #phy-cells =3D <0>;
> +                };
> +
> +                hdmi_controller: controller {
> +                    compatible =3D "starfive,jh7110-inno-hdmi-controller=
";
> +                    interrupts =3D <99>;
> +                    clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                             <&hdmi_phy>;
> +                    clock-names =3D "sys", "mclk", "bclk", "pclk";
> +                    resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +                    reset-names =3D "hdmi_tx";
> +                    phys =3D <&hdmi_phy>;
> +                    phy-names =3D "hdmi-phy";
> +                };
> +            };
> +
> +            voutcrg: clock-controller@295c0000 {
> +                compatible =3D "starfive,jh7110-voutcrg";
> +                reg =3D <0x0 0x295c0000 0x0 0x10000>;
> +                clocks =3D <&syscrg JH7110_SYSCLK_VOUT_SRC>,
> +                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
> +                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
> +                         <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
> +                         <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
> +                         <&hdmi_phy>;
> +                clock-names =3D "vout_src", "vout_top_ahb",
> +                              "vout_top_axi", "vout_top_hdmitx0_mclk",
> +                              "i2stx0_bclk", "hdmitx0_pixelclk";
> +                resets =3D <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
> +                reset-names =3D "vout_top";
> +                #clock-cells =3D <1>;
> +                #reset-cells =3D <1>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 348caaaa929a519bc0ec5c0c7b587468ef7532d5..99434e54dc39494153677a6ca=
359d70f2ba2ddb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24044,6 +24044,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> =20
> +STARFIVE JH7110 DISPLAY SUBSYSTEM
> +M:	Michal Wilczynski <m.wilczynski@samsung.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-s=
ubsystem.yaml
> +
>  STARFIVE JH7110 DPHY RX DRIVER
>  M:	Jack Zhu <jack.zhu@starfivetech.com>
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>=20
> --=20
> 2.34.1
>=20

--LyJKcpcoYORwRgse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRN96AAKCRB4tDGHoIJi
0op6AP94in4x/F+djtzX2cdGh5YC4XpNjLGROQ5E+6usNlM+lgEA8CLCphPZFJZM
EEQ1XnVlM99yRJUHnSZmsnWiZzmyCQo=
=wEbO
-----END PGP SIGNATURE-----

--LyJKcpcoYORwRgse--


--===============3984446731251278952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3984446731251278952==--

