Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CA1C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3iubVlkuHzfUZWEkjiCjtwIzqjyLtPJYGZwS0YGWP8=; b=VOir0AV8b1aKQGA58GlwORfeQm
	XQ3DNU1PKawYFXI3C2DFL+/5zrMXV6FwVn+qbIBEZer7Eoni6SXe8kdyrJ09dzF/oHCT9KO8XiWJW
	JgGs8oDDuw09Hd53i/oxYCjzeJIHASAg4t8lbh2S4px6oeOvR0VWHcdaobCKKXxVPfcqV28ALM3bD
	Rfgnto+Q0AzZYqVFj8p/NDVlWtfiHbHHyauDIOhoqbkgJ9ka1N0clCt4JCNyZU6N8tmBmEY3J+zdv
	Q5CKsETfFpDb91atbg7G97C8/ACFG6BTjQnqtUnUIrOSoJ0DHdHNMy3iXaq6FSV389FI7GZFUJ5oS
	5ACeStlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpyO-002WHz-0W;
	Tue, 01 Aug 2023 14:03:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpyK-002WHR-2y
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 14:03:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A6B6615B9;
	Tue,  1 Aug 2023 14:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D135C433C8;
	Tue,  1 Aug 2023 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690898615;
	bh=J1Kv0/7tNUUdsgbJSV348cn2wjwWWI28VoiCD919J1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRKTjP5gMBMuoyifvof5VTmSNc6vDWI9l5DkvIxTqN4QHv+XXe7n40Rbnar0jyB4E
	 rhzGXQd0Q8thtuaf289xIFb0DvaVXzgJVlzdMSSBd/iKa+Qsk6cZ4BASCYKiYFl7Lv
	 4LeI9+5CILuHfqT6mu+1xMMp4xTeO/aq+4C5lV+nn+MyUx9K2nZm5fqbFE0jMorNaY
	 F4Y0KAz2vf1Y5mAyR0sUaDzx6kSNKGJcFwA2RFubIphJqnavP/xqSqNA6BPYP0PgPL
	 xsAaz/2mMR9o2fYVFrN8Ywj0stbVbxxK9a6VfXgdK5h9RXbPUX4BczmD/9tT+6NkRX
	 7BnuQyIex18Pw==
Date: Tue, 1 Aug 2023 15:03:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Bjorn Andersson <andersson@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Shengyang Chen <shengyang.chen@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 v1 2/7] dt-bindings: display: Add yamls for JH7110
 display system
Message-ID: <20230801-cash-squad-8a2e9154af8b@spud>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-3-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230801101030.2040-3-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_070337_044575_5191CD45 
X-CRM114-Status: GOOD (  27.23  )
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
Content-Type: multipart/mixed; boundary="===============6734463449370286278=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6734463449370286278==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e6NUZOkjskRZqTKd"
Content-Disposition: inline


--e6NUZOkjskRZqTKd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 06:10:25PM +0800, Keith Zhao wrote:
> StarFive SoCs JH7110 display system:
> lcd-controller bases verisilicon dc8200 IP,
> and hdmi bases Innosilicon IP.
> Add bindings for them.

Please, you can use more than 46 characters in a line!

Also, "v1 v1" does not a v2 make.

>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../starfive/starfive,display-subsystem.yaml  |  41 +++++++
>  .../starfive/starfive,jh7110-dc8200.yaml      | 107 ++++++++++++++++++
>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |  92 +++++++++++++++
>  3 files changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,display-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,jh7110-dc8200.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,jh7110-inno-hdmi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
display-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive=
/starfive,display-subsystem.yaml
> new file mode 100644
> index 000000000..86018a8e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,display=
-subsystem.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,display-sub=
system.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starfive DRM master device
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> +
> +description:
> +  The Starfive DRM master device is a virtual device needed to list all
> +  display controller or other display interface nodes that comprise the
> +  graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: starfive,display-subsystem
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |

A | is not needed when you do not have formatting to preserve.

> +      Should contain a list of phandles pointing to display interface po=
rts
> +      of display controller devices. Display controller definitions as d=
efined
> +      in Documentation/devicetree/bindings/display/starfive/
> +      starfive,jh7110-dc8200.yaml
> +
> +required:
> +  - compatible
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    display-subsystem {
> +        compatible =3D "starfive,display-subsystem";
> +        ports =3D <&dc_out>;
> +    };

Given Rob's bot complains, it looks like you never tested this.

> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
jh7110-dc8200.yaml b/Documentation/devicetree/bindings/display/starfive/sta=
rfive,jh7110-dc8200.yaml
> new file mode 100644
> index 000000000..bebe2050c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-=
dc8200.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-dc82=
00.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive display controller
> +
> +description:
> +  The StarFive SoC uses the display controller based on Verisilicon IP
> +  to transfer the image data from a video memory
> +  buffer to an external LCD interface.
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-dc8200
> +
> +  reg:
> +    maxItems: 3

What do each of these represent?

> +
> +  interrupts:
> +    items:
> +      - description: The interrupt will be generated when DC finish one =
frame
> +
> +  clocks:
> +    items:
> +      - description: Clock for display system noc bus.
> +      - description: Pixel clock for display channel 0.
> +      - description: Pixel clock for display channel 1.
> +      - description: Clock for axi interface of display controller.
> +      - description: Core clock for display controller.
> +      - description: Clock for ahb interface of display controller.
> +      - description: External HDMI pixel clock.
> +      - description: Parent clock for pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: vout_noc_disp
> +      - const: vout_pix0
> +      - const: vout_pix1
> +      - const: vout_axi
> +      - const: vout_core
> +      - const: vout_vout_ahb
> +      - const: hdmitx0_pixel
> +      - const: vout_dc8200
> +
> +  resets:
> +    items:
> +      - description: Reset for axi interface of display controller.
> +      - description: Reset for ahb interface of display controller.
> +      - description: Core reset of display controller.
> +
> +  reset-names:
> +    items:
> +      - const: vout_axi
> +      - const: vout_ahb
> +      - const: vout_core

Please trim all the vouts from here & the clocks - especially the one
named "vout_vout_ahb".

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.

This file is empty, it has been converted to yaml.

> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
jh7110-inno-hdmi.yaml b/Documentation/devicetree/bindings/display/starfive/=
starfive,jh7110-inno-hdmi.yaml
> new file mode 100644
> index 000000000..f6927acf6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-=
inno-hdmi.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-inno=
-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starfive JH7110 HDMI controller
> +
> +description:
> +  The StarFive JH7110 SoC uses the HDMI signal transmiter based on innos=
ilicon IP
> +  to generate HDMI signal from its input and transmit the signal to the =
screen.
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: "starfive,jh7110-inno-hdmi"
> +
> +  reg:
> +    minItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: The HDMI hot plug detection interrupt.
> +
> +  clocks:
> +    items:
> +      - description: System clock of HDMI module.
> +      - description: Mclk clock of HDMI audio.
> +      - description: Bclk clock of HDMI audio.
> +      - description: Pixel clock generated by HDMI module.
> +
> +  clock-names:
> +    items:
> +      - const: sysclk
> +      - const: mclk
> +      - const: bclk
> +      - const: pclk
> +
> +  resets:
> +    items:
> +      - description: Reset for HDMI module.

For this & resets, you don't have a list & don't need items:

Cheers,
Conor.

--e6NUZOkjskRZqTKd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMkQrwAKCRB4tDGHoIJi
0hF/AQC/1GTXuwyc+w2g9RKifKromVQFlvBvFI0JlmYNLu6I9gEAqVJE6rLiklf3
jktEbPFxEUmQR4+8/IvlY0DbYWbksgw=
=bnBb
-----END PGP SIGNATURE-----

--e6NUZOkjskRZqTKd--


--===============6734463449370286278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6734463449370286278==--

