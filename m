Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A20C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 07:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVB9xp5rAT+jkseFB2uHTIIRC0heGxuPD6KFvlHPsmY=; b=2hv6UcDGSKwZ2cXz4n6EsRwF4E
	LpGs2697k843wulN2uE5TSg5bzc8Q9iMNO1gFlroaSidarELVzHuehpAo4F+7mGncibnKisIBpHdF
	1pSdK5zUgyD/x9Hq5h7F4H8jKqTYr9P4xAZZZZ5QVEXeEu+TMHXDrssr1Jcz8++/qC3lSTFARcalf
	OY+3UFl76iJWS71pJmSj4SDFLFJra8RZig2wdl8EDLv4pQrBoVxpx1nG91dRnG65S/yx1rZll4MKn
	xQeEtEWogW2/Yggc1+Mr1xyiBlkEgufKGUvf6JUw0/Bjqx2UpoChDm6yfnxWpbjvz3PzS+wv9+lXF
	pRyQzz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEo3z-00BRGG-HJ; Tue, 01 Feb 2022 07:58:55 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEo3x-00BRFb-5b
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 07:58:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nEo3e-00046y-6s; Tue, 01 Feb 2022 08:58:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nEo3V-00Dmxz-QK; Tue, 01 Feb 2022 08:58:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nEo3U-002kWK-5c; Tue, 01 Feb 2022 08:58:24 +0100
Date: Tue, 1 Feb 2022 08:58:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com,
 lee.jones@linaro.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 atishp@rivosinc.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Message-ID: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-7-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220131114726.973690-7-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_235853_243932_2C4BF1FE 
X-CRM114-Status: GOOD (  26.00  )
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
Content-Type: multipart/mixed; boundary="===============2134986020160647425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2134986020160647425==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqylyjr6p2p3xcpl"
Content-Disposition: inline


--pqylyjr6p2p3xcpl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 11:47:21AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corep=
wm.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml=
 b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> new file mode 100644
> index 000000000000..26a77cde2465
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/microchip,corepwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip ip core PWM controller bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  corePWM is an 16 channel pulse width modulator FPGA IP
> +
> +  https://www.microsemi.com/existing-parts/parts/152118
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: microchip,corepwm-rtl-v4
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +  microchip,sync-update:
> +    description: |
> +      In synchronous mode, all channels are updated at the beginning of =
the PWM period.
> +      Asynchronous mode is relevant to applications such as LED control,=
 where
> +      synchronous updates are not required. Asynchronous mode lowers the=
 area size,
> +      reducing shadow register requirements. This can be set at run time=
, provided
> +      SHADOW_REG_EN is asserted. SHADOW_REG_EN is set by the FPGA bitstr=
eam programmed
> +      to the device.
> +      Each bit corresponds to a PWM channel & represents whether synchro=
nous mode is
> +      possible for the PWM channel.
> +
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    default: 0

I'm not sure I understand this correctly. This is a soft-core and you
can synthesize it either with or without the ability to do synchronous
updates or not, right? All 16 channels share the same period length and
in the simple implementation changing the duty cycle is done at once
(maybe introducing a glitch) and in the more expensive implementation
there is a register to implement both variants?


> +  microchip,dac-mode:
> +    description: |
> +      Optional, per-channel Low Ripple DAC mode is possible on this IP c=
ore. It creates
> +      a minimum period pulse train whose High/Low average is that of the=
 chosen duty
> +      cycle. This "DAC" will have far better bandwidth and ripple perfor=
mance than the
> +      standard PWM algorithm can achieve.
> +      Each bit corresponds to a PWM channel & represents whether dac mod=
e is enabled
> +      that PWM channel.

In the last sentence a "for" is missing?

These two properties are not detectable in software?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pqylyjr6p2p3xcpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmH46B0ACgkQwfwUeK3K
7Am3Sgf/UTtQSsIPttdHYyNUxSYZF6fH8Mu324npdIKQ+39Z6OX/+MjR27kWtIP9
PnRVaiT3ysheX8NpDwOr4mFokpvxx6yswleZStNKVh+xzGfPDwvGMbCElcf/RL7P
UdSovN/QCVE/X+dCUDz+sZtlbnXMW3+mJmDr2Qs1xh0/R+wuHwIwetY/8jW8t1Hy
AkxUBTyiszRkAlXctrW+k+NaoXvtJnLLS3oCyp/vuHXvsCuwzp5GwHjL7alf89uE
h/EMEzivdI/Bks9p9w9jDMg6GNp3KoL4RYeQwCWz4DkO3kezyhIwIgbMRLF57IqZ
HYcnZow7dopjm+dWBk/s32mz7/prow==
=622s
-----END PGP SIGNATURE-----

--pqylyjr6p2p3xcpl--


--===============2134986020160647425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2134986020160647425==--

