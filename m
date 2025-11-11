Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039BCCCFA18
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kuh/5WU+qM95Cc4Y+2vek9Xvz17Z50oaBnhG4IVKJls=; b=zfi+5fijgH6D9sqoIoh33CLeq7
	btEYNEhPrbPODXcnagj6NFy5R6pgIVBp/ag9uyJgkyeqPLfxZw0U5l0ue2G3+MlqhQ0LnFCUNC6Lr
	rBV2z7EZNRwKjsUeqaKUmmqQtEyMv02RcjiZrYUmOB6bNxlxXAIUxh/prgo9sWL4zNIQixhie8xbc
	4yNUFGTXi3HgOrkVfesYFonkd3lRci1FqUdlI1yGp5OrOXlV9uS22xyv//L92zaBYYdJMdOhGpj5g
	3SwYIN4THDW60ylKoqR60QTMNfMwvYlDO0zi0XjnGy7b7RdnyU/BZZmYeXf0dTWX3bfgRuEGYS+rQ
	7aaCnDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIt84-00000007c1V-0XAK;
	Tue, 11 Nov 2025 18:30:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIt81-00000007c13-04dW;
	Tue, 11 Nov 2025 18:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2475960203;
	Tue, 11 Nov 2025 18:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C796CC116D0;
	Tue, 11 Nov 2025 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762885803;
	bh=bR+S/G6a5cL9iT3wiJ+fUBO3PPAFX+/KEGXf+e9r7Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0mHU2Nb+JnDUJ/4AMKxFQjJfcJUtaWirZTAYNRVYPxqSANsAVDy2a028ZyS5NyNP
	 3QP8xJfxCiDysZ+4+9ymEwSxzapy72lZ4vUxQ4NMwWhNHNgSMF3vfFwCFbnkIzz4+Y
	 vVSObd5/n1x8A1MPQi6BqsxLMUn8ltJBTjGbSRGyrQ9XYIg2ERp2YKMe1ePl29J2GW
	 WeLmqb+20z2EgZ751maQmpVuULYUZol0NdMNKonJQMS9pIAtUmO6FYnIvNd6hJlqCv
	 rHVn1DX7gYOW0oPTCO1PIvNNvlN8JVs1fPp/pFOHRK1TnMfv387i3sF66ku/XMueCM
	 gtIfWA/RyEZyQ==
Date: Tue, 11 Nov 2025 18:29:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH RFC 05/13] dt-bindings: mfd: Add starfive,jh7110-hdmi-mfd
Message-ID: <20251111-late-sycamore-baff8bd0a5b7@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010500eucas1p1c8b73311765e359bea891ec783237910@eucas1p1.samsung.com>
 <20251108-jh7110-clean-send-v1-5-06bf43bb76b1@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20251108-jh7110-clean-send-v1-5-06bf43bb76b1@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============5384812152532022055=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5384812152532022055==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MHBF9IdfTAgSUpdQ"
Content-Disposition: inline


--MHBF9IdfTAgSUpdQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 02:04:39AM +0100, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI MFD (Multi-Function
> Device).
>=20
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the MFD parent device, which holds the shared register map and
> populates its two children: the PHY and the controller. This is
> necessary to resolve a circular clock dependency between the HDMI block
> and the VOUT clock generator.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/mfd/starfive,jh7110-hdmi-mfd.yaml     | 93 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 94 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-m=
fd.yaml b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.ya=
ml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2cbfb2b975083240575a0567b=
06e6cafd542cf9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/starfive,jh7110-hdmi-mfd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 HDMI MFD (Controller+PHY)
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description:
> +  The StarFive JH7110 HDMI block is a monolithic IP containing both
> +  the digital controller logic and the analog PHY logic in a single
> +  register space.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-hdmi-mfd

Drop "mfd" from this please, maybe using "subsystem" is a more suitable
alternative?

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^phy(@[0-9a-f]+)?$":
> +    $ref: ../phy/starfive,jh7110-inno-hdmi-phy.yaml#
> +  "^controller(@[0-9a-f]+)?$":
> +    $ref: ../display/bridge/starfive,jh7110-inno-hdmi-controller.yaml#

Can you make these absolute references please?

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

And drop any unused labels from here.
I definitely thing you could do away with the same example being in
three different places. Maybe one full one here, and two partials in
each of the children?

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
> +                compatible =3D "starfive,jh7110-inno-hdmi-controller";
> +                interrupts =3D <99>;
> +                clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                        <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                        <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                        <&hdmi_phy>;
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
> index 66fab45bbee8c1a5f73d09bb470d28029b8c6139..052876c6538f980f75ff64e78=
b6ebea460307904 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24048,6 +24048,7 @@ STARFIVE JH7110 DISPLAY SUBSYSTEM
>  M:	Michal Wilczynski <m.wilczynski@samsung.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno=
-hdmi-controller.yaml
> +F:	Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml
>  F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.y=
aml
>  F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-s=
ubsystem.yaml
> =20
>=20
> --=20
> 2.34.1
>=20

--MHBF9IdfTAgSUpdQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaROAogAKCRB4tDGHoIJi
0lFuAQCF+AFB3vd2cBEjM70iO0hvHejdfbLmbcZNcxt68vCp5gEAjTw9rqui2EYo
3QeXzLstfJTO5hhitM8svk5TR9ugnQM=
=eZh0
-----END PGP SIGNATURE-----

--MHBF9IdfTAgSUpdQ--


--===============5384812152532022055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5384812152532022055==--

