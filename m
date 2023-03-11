Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CF9C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+5sSSqg4QVTxLadOpW0LXxjiX32P4RViFkUm7Asi6M=; b=uL1Z2Cpv6pL4OxtB4/reWcyu4j
	nz0HM5YryXZozs2ua/93foxr0NznT8pcwdC6iP8vTzr8PzzegFcXdX3hnw8Pr1CAyjMXPlLEL1ygR
	5BD9Fs9KfxbIyE5IK1CHp7PHvMJsQlJRvIHBVgTtXnck5pN0lBluml7ffyLqIi5+Ir2w9NVtEMqd9
	oFm6OP3jwMPz2cW9ZZ5xxJwJG7EihVKLAYuTzRFugFtVdYdzjeTcY7WItd3R4W2oXDQGveDF+fgyu
	EXjeLuZCnYAw1t3VX1lCF5lAJ2FLiMRXfY4pV84jMfe01z+levUoVEz9m59MWv+rS9fXeKjwpgfkp
	8mGezVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paz3q-000aFb-PI; Sat, 11 Mar 2023 13:14:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paz3n-000aDi-7p
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 13:14:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 616E460C0F;
	Sat, 11 Mar 2023 13:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D74C433D2;
	Sat, 11 Mar 2023 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678540491;
	bh=/sUj6SImoQwcqn3L3Iqgqo5C9vE40g5C/oRswzjGIHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGk4IsU9zDp4jZv57w+INNUVac+U7keER5lHzNMZS0ss+wqWHe9k2P2X8lPXKHGEg
	 RWFn5S/nb4yCkClq3GY8JKe+F8q5XvZHRwy5qAgrF1jDuFZYIGIATaDAcjvrKYiyoS
	 S07VwcZvp8opedpeL4I7TaX1wByJwyv8JodZeo2QFBDh8YXFJTFossrzyU/QXofJI6
	 SUG40qeWnx3g4sE3hmH/WdEQ+fS99U1F8th4E+qerQkfqr5OInFicJBYhfIRRqfpkb
	 hYriYnZ/kDks09nDUwxmRQVZsofFurSTyaItNFCnVBOdRT4qSYmKYgZb4GdMkLBW5E
	 XaPXNGC/WLyWQ==
Date: Sat, 11 Mar 2023 13:14:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/21] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Message-ID: <b9a421c0-85df-4c8c-a3cb-8286328c5ed0@spud>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-13-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230311090733.56918-13-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_051455_374557_10A887A0 
X-CRM114-Status: GOOD (  12.35  )
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
Content-Type: multipart/mixed; boundary="===============1407884514163265436=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1407884514163265436==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pRAbb8i5dRo5W9vI"
Content-Disposition: inline


--pRAbb8i5dRo5W9vI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 05:07:24PM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add bindings for the always-on clock and reset generator (AONCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Always-On Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-aoncrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    oneOf:
> +      - items:
> +          - description: Main Oscillator (24 MHz)
> +          - description: GMAC0 RMII reference or GMAC0 RGMII RX
> +          - description: STG AXI/AHB
> +          - description: APB Bus
> +          - description: GMAC0 GTX
> +
> +      - items:
> +          - description: Main Oscillator (24 MHz)
> +          - description: GMAC0 RMII reference or GMAC0 RGMII RX
> +          - description: STG AXI/AHB or GMAC0 RGMII RX
> +          - description: APB Bus or STG AXI/AHB
> +          - description: GMAC0 GTX or APB Bus
> +          - description: RTC Oscillator (32.768 kHz) or GMAC0 GTX

Something tells me that the use of "or" means we're not doing this
correctly.
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +      - items:
> +          - description: Main Oscillator (24 MHz)
> +          - description: GMAC0 RMII reference
> +          - description: GMAC0 RGMII RX
> +          - description: STG AXI/AHB
> +          - description: APB Bus
> +          - description: GMAC0 GTX
> +          - description: RTC Oscillator (32.768 kHz)
> +
> +  clock-names:
> +    oneOf:
> +      - minItems: 5
> +        items:
> +          - const: osc
> +          - enum:
> +              - gmac0_rmii_refin
> +              - gmac0_rgmii_rxin
> +          - const: stg_axiahb
> +          - const: apb_bus
> +          - const: gmac0_gtxclk
> +          - const: rtc_osc
> +
> +      - minItems: 6
> +        items:
> +          - const: osc
> +          - const: gmac0_rmii_refin
> +          - const: gmac0_rgmii_rxin
> +          - const: stg_axiahb
> +          - const: apb_bus
> +          - const: gmac0_gtxclk
> +          - const: rtc_osc


--pRAbb8i5dRo5W9vI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAx+xQAKCRB4tDGHoIJi
0vwFAQCzqL0Ll88YmZd+49eMP9wRMW97pj9/CfujkrFk55QZUwEA5DG/4wVYYgiz
a4slnC3b+vLT49rbIVm8lcZdfbOtBgo=
=CBzW
-----END PGP SIGNATURE-----

--pRAbb8i5dRo5W9vI--


--===============1407884514163265436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1407884514163265436==--

