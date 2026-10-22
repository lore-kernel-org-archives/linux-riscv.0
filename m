Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DAA606A335
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i09JE6nR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLfpY2NM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yduyWTj6+z0SQbtAnZNZMRLeuztbrcVRKwOOU5PaJoU=; b=i09JE6nR+TrttDDri9tOMhpevh
	rX+2+P5kFDeX5s6DpOomw2UsjZnq3h2O8giaDVob3781ajVz8xXXbOyDK6ETJHruZh0axCixD2kCN
	DDOaa6eCZThR0kFND+43aMzUD6MoIpJPBe5qD0nKdCJsGlWrSc9JIo1gihrKFTIPvFnpTHrvTsKGV
	E2drVH9qmCronkmdMPNQ2eWDTkfVvUlLxCq2GwRu6RKlFvdDWSahqN/1GrFUTZOOENs7a+RGFKdaX
	Tu8GRpZ+99uMRKWP7yootc2dVJVHuqmmE8pNpEtGTT3amd4T435xo1vYWKEiqWFx1yLE5NLQUJ4I6
	MRaxv4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy2p-0000000EmA2-1Kkx;
	Thu, 22 Oct 2026 19:01:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy2o-0000000Em9o-1OSh
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 19:01:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7890A60098;
	Thu, 22 Oct 2026 19:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBDB1F01825;
	Thu, 22 Oct 2026 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792695701;
	bh=rs0wUm4z/DbVk/Ptat8LwHiYek8GxKp3J9MUJ5meML4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LLfpY2NM38Ectvk595i3sSkrIIB1Qa09Zn/6PYQFjtkZL9ZQByfimQ1AWSL4vLocN
	 nKgt84BXHt++6ODdDkpRfuYSCDxsE1n9A7wW5KQeyx9+IVEGOh6uFWPvDL9YrSjKvL
	 QKXQYYeLMM79aRZrQpnxqxYurg2Jl0WbXnRX75zfOFVWvhbgiGKbNkIv+ZNUBzEjZX
	 jqLk9qKhrdW8Gd4nBeIS5uxLXPPXBdeow0ZMeuc2CQjtdysldaBB/74jWGAofFIIg6
	 DlCc9R887q9NAkNtYHBDSVJxvRZ96nR6J4GpoWS5saz2dFGX4C2hVJBtS6iFtF+gS+
	 1TeiO25XLS88A==
Date: Thu, 22 Oct 2026 20:01:33 +0100
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH 08/18] dt-bindings: pinctrl: add Zhihe A210 pin controller
Message-ID: <20261022-gyration-rimmed-98c5a8e1138d@spud>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
 <20261022-a210-init-v1-8-5e438f972d24@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261022-a210-init-v1-8-5e438f972d24@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>
Content-Type: multipart/mixed; boundary="===============4484744515370181490=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4484744515370181490==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2O9Ps+gKElYzliia"
Content-Disposition: inline

--2O9Ps+gKElYzliia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 03:53:28AM +0800, Han Gao via B4 Relay wrote:
> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
>=20
> Add bindings for the four A210 pad controllers. Describe the shared
> PERI3 SDIO mux and per-pad bias controls.
>=20
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../bindings/pinctrl/zhihe,a210-pinctrl.yaml       | 206 +++++++++++++++=
++++++
>  1 file changed, 206 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl=
=2Eyaml b/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
> new file mode 100644
> index 000000000000..51cbb0189f47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
> @@ -0,0 +1,206 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/zhihe,a210-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZhiHe A210 pin controller
> +
> +maintainers:
> +  - Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> +
> +description: |
> +  Pinmux and pinconf controller of the ZhiHe A210 RISC-V SoC.
> +
> +  The pads of the A210 are split into four groups, each managed by its
> +  own pad controller with a separate register range:
> +
> +    AON pad controller     -> zhihe,a210-aon-pinctrl
> +    PADCTRL0 (peripheral1) -> zhihe,a210-peri1-pinctrl
> +    PADCTRL1 (peripheral2) -> zhihe,a210-peri2-pinctrl
> +    PADCTRL2 (peripheral3) -> zhihe,a210-peri3-pinctrl
> +
> +  Each pad can be muxed individually to up to 8 different functions,
> +  though for most pads only a few of those configurations are valid.
> +  A few pads in the AON group do not support muxing or configuration
> +  at all.
> +
> +  AON, PERI1 and PERI2 pads support configurable drive strength, bias,
> +  input enable, Schmitt trigger and slew rate. PERI3 has a separate pad
> +  layout: its six SDIO pads share one mux bit. Select their function with
> +  the "sdio" group. Per-pad bias can be configured independently.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - zhihe,a210-aon-pinctrl
> +      - zhihe,a210-peri1-pinctrl
> +      - zhihe,a210-peri2-pinctrl
> +      - zhihe,a210-peri3-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: pclk
> +
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object
> +
> +    description:
> +      A pinmux group referenced by a consumer's pinctrl phandle. It
> +      contains one subnode per set of pads sharing the same pinmux and
> +      pinconf settings.
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +
> +        description:
> +          A pinctrl node describing the pinmux and pinconf settings of
> +          one or more pads.
> +
> +        properties:
> +          pins:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pins
> +            description: List of pads that properties in the node apply =
to.
> +
> +          groups:
> +            items:
> +              - const: sdio
> +
> +          function:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/function
> +            enum: [ aouart, aouart_ir, aogpio0, aogpio1, aoi2c0, aoi2c1,
> +                    aospi, jtag, reset, por, pmic, dvs, uart0, uart1,
> +                    uart2, uart3, uart4, uart5, uart6, uart7, uart8,
> +                    uart9, uart0_ir, uart1_ir, uart2_ir, uart3_ir,
> +                    uart4_ir, uart5_ir, uart6_ir, uart7_ir, uart8_ir,
> +                    uart9_ir, gpio0, gpio1, gpio2, gpio3, gpio4, gmac0,
> +                    gmac1, spi0, spi1, qspi0, qspi1, pwm0, pwm1, pwm2,
> +                    can0, can1, can2, i2s0, i2s1, i2s2, i2s3, i2c0, i2c1,
> +                    i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c7_smb, sdio,
> +                    isp0, dptx, usb31, sata_p0, sata_p1, hdmi, zmac,
> +                    bsel, dbgm, cdbg, pdm, tdm, pcie_x1, pcie_x4,
> +                    sen_vclk ]

These sorts of things always make me wonder: do uart4 and uart5 actually
need to be different functions, or can you just use a uart function
because no pin can potentially have more than one uart muxed to it?
Ditto for spi, i2c, gpio etc.

> +            description: The mux function to select for the given pins.
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23,
> +                    25 ]
> +            description: Drive strength in mA.
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            maximum: 1
> +
> +        oneOf:
> +          - required: [pins]
> +          - required: [groups]
> +
> +        additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: zhihe,a210-peri3-pinctrl
> +    then:
> +      patternProperties:
> +        '-[0-9]+$':
> +          patternProperties:
> +            '-pins$':
> +              properties:
> +                pins:
> +                  items:
> +                    enum: [SDIO_CLK, SDIO_CMD, SDIO_DAT0, SDIO_DAT1,
> +                           SDIO_DAT2, SDIO_DAT3]

Where do these SDIO_CLK etc come from?

> +                function:
> +                  enum: [sdio, gpio4]
> +                drive-strength: false
> +                input-enable: false
> +                input-disable: false
> +                input-schmitt-enable: false
> +                input-schmitt-disable: false
> +                slew-rate: false
> +              if:
> +                required: [function]
> +              then:
> +                required: [groups]

Can you please explain why this uses a group for sdio when the binding
would be more straightforward if you just used pins?

> +    else:
> +      patternProperties:
> +        '-[0-9]+$':
> +          patternProperties:
> +            '-pins$':
> +              properties:
> +                groups: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@2026000 {
> +        compatible =3D "zhihe,a210-peri1-pinctrl";
> +        reg =3D <0x2026000 0x1000>;
> +        clocks =3D <&clk 0>;
> +        clock-names =3D "pclk";
> +
> +        gmac0-0 {
> +            gmac0-pins {
> +                bias-disable;
> +                drive-strength =3D <13>;
> +                function =3D "gmac0";
> +                input-disable;
> +                input-schmitt-disable;
> +                pins =3D "GPIO0_0", "GPIO0_12";

This is confusingly ordered. pins then function, followed by config
properties please.

> +                slew-rate =3D <0>;
> +            };
> +        };
> +    };
> +
> +  - |
> +    pinctrl@542000 {
> +        compatible =3D "zhihe,a210-peri3-pinctrl";
> +        reg =3D <0x542000 0x1000>;
> +        clocks =3D <&clk 0>;
> +        clock-names =3D "pclk";
> +
> +        sdio-0 {
> +            cmd-data-pins {
> +                bias-pull-up;
> +                pins =3D "SDIO_CMD", "SDIO_DAT0", "SDIO_DAT1",
> +                       "SDIO_DAT2", "SDIO_DAT3";
> +            };
> +
> +            sdio-pins {
> +                function =3D "sdio";
> +                groups =3D "sdio";
> +            };
> +        };
> +    };
>=20
> --=20
> 2.55.0
>=20
>=20

--2O9Ps+gKElYzliia
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpdjQAKCRB4tDGHoIJi
0srGAQD8Wmx4MSx/QsFYOVhzBdh5CqeN76etlocPbBI1pNK9IgD/TU0qur/KGsux
BhBTt6yZ/hpnHcUVC8fuGBwPAx1ltQs=
=DM3s
-----END PGP SIGNATURE-----

--2O9Ps+gKElYzliia--


--===============4484744515370181490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4484744515370181490==--

