Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AADC636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbRb+k5BCX75z+PnLurCamlhtRc8EkxqoMYlGvRdpaU=; b=3YpufgGZ5pGNbvS9qwpceJDYMY
	9R5/AbjOz3u/JYlFxEDC46mS6GQflNwwA7Y+hG4Mj0Ze1MclX1ZvoYIgg10DOb3XmDG/ZXmVglkSa
	cru0BwSUl+98CewCfzkc9qdm5shC/7ZAE8Y1hfSZKTzB8LVfbZAlJwQoTOYocmZIxhhCTONXZQ77e
	ehSHovetgSb3SqbUuNxiMLeIzDbc5MXMwHpQ7nCnOHm+xY+C/ciRPzMtv1Qk6VZuwMJtsCm3o6kiI
	3B8rdtHBMvRusJRM3zeM2PYj37NIH6KE9K2kC0lCb5HJAswpwTif5a2H3IwHgSyZ+LS1NqBgimhLs
	+OEKjc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWMk-0098f9-Ln; Tue, 21 Feb 2023 17:23:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWMh-0098dr-UQ
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 17:23:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 735EF61146;
	Tue, 21 Feb 2023 17:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FD5C4339C;
	Tue, 21 Feb 2023 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677000222;
	bh=Pl03WP9pz1cQTTx/VsalIyGu1+sZ9/CZMBhlsy+Pc0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZW7tDNOashB0Kv+TDpNQFEyvqNaTUZg/H1F524al5ypnIaxXNFxL5wXCstQSnehc/
	 88n2kAios7WCSwxef2XI3HUS0hWu5STws51g0jbgFfToXi/vBjelqlAvasfBUYoee5
	 KsGD4PYYyNOM5i5YJs9FVHCG7HlynXXig/IdJKA9Xhkizxaem5mNN9W6KoZFrhkNaq
	 rmOc+RIGgi7NN0KkbLGmHQnblhdBmKa+aSyUEWu5biKRO9S/cf0/DoeiCBARCPccaO
	 wVRG90y7YbI2ZvXmVjenZP+agf+uoUfzcF3dgUby5nT9iC07nL1Uh62S8z8HxQxFDD
	 mOqtVkiP4ZyCw==
Date: Tue, 21 Feb 2023 17:23:36 +0000
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
Subject: Re: [PATCH v4 09/19] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y/T+GNQAXLGyUtCH@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-10-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221024645.127922-10-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_092344_077463_898BFA93 
X-CRM114-Status: GOOD (  18.59  )
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
Content-Type: multipart/mixed; boundary="===============2354206950473548601=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2354206950473548601==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5z4OmeN+mDwxYA7S"
Content-Disposition: inline


--5z4OmeN+mDwxYA7S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Hal,

On Tue, Feb 21, 2023 at 10:46:35AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add bindings for the system clock and reset generator (SYSCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-sysc=
rg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.ya=
ml
> new file mode 100644
> index 000000000000..ec81504dcb27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 System Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-syscrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: GMAC1 RMII reference
> +      - description: GMAC1 RGMII RX
> +      - description: External I2S TX bit clock
> +      - description: External I2S TX left/right channel clock
> +      - description: External I2S RX bit clock
> +      - description: External I2S RX left/right channel clock
> +      - description: External TDM clock
> +      - description: External audio master clock

You didn't reply to the conversation I had with Krzysztof about how to
represent the optional nature of some of these clocks, contained in this
thread here:
https://lore.kernel.org/all/7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivete=
ch.com/

What happens to the gmac1 mux if only one of the input clocks is
provided?
And I mean what does the hardware do, not the software representation of
that mux in the driver.

> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: gmac1_rmii_refin
> +      - const: gmac1_rgmii_rxin
> +      - const: i2stx_bclk_ext
> +      - const: i2stx_lrck_ext
> +      - const: i2srx_bclk_ext
> +      - const: i2srx_lrck_ext
> +      - const: tdm_ext
> +      - const: mclk_ext

--5z4OmeN+mDwxYA7S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/T+GAAKCRB4tDGHoIJi
0pRkAQC6ht/DbBLlbYtspRHjx7cCxZOkTEjjNHlLyj+f8sZeswD8C+0TU6D7Ciun
VaHOn1Vw8T9AeqqwUsyerL6bkIj/+QA=
=ZCkp
-----END PGP SIGNATURE-----

--5z4OmeN+mDwxYA7S--


--===============2354206950473548601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2354206950473548601==--

