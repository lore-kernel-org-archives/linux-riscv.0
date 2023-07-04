Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA4EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 22:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQJdBZJC71S9n7c0atXjciF8wCkhtbaah3ijrkHn+Qc=; b=ZEiTyn1bZrhYYDJFoDS8kkeN+j
	QiNxVavVNySsdottzaM2UDVoc8h690w9ZKJdly3lT96VhCW8MYYIca857XasX732cIYUThtRPuY+d
	1v0X/aonm25k+A9ReyFYHrkwISWQuc21i9KjIj0JTE5DBVyJBgehfP24MquAVGqp6Ymo6Ay8r8rJL
	36Ty5am+IIN9FXAPMv/nVi9SnQRt5jDd0RdQ75Ae4AMz4Zx8BT04NNh+AUH3GeDwP8vKujI53PCJN
	v6leIY22ObWRaPrMcxmwOj6eq3g0NwmqoiyjWVb9MeDsGrRTQo8gZFtg1Up0tykJiTHfhuRhfzaYg
	+GdrxlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGoQs-00EIB0-1g;
	Tue, 04 Jul 2023 22:23:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGoQp-00EIA6-1F
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 22:23:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A720661377;
	Tue,  4 Jul 2023 22:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F133FC433C8;
	Tue,  4 Jul 2023 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688509414;
	bh=UgTDdViy1/awgvU32jQWoQqMz3aYBpHqsQN3TpWOtj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UP01IKsINQtFXG8k+1ZU8Q42b9H44Zq5I4YknUGeIpQma1H09OL8rd5PbPT55706F
	 uCRNzf6YqhtLV8KHI9GPjp+54oBV2p0lRNmoQZZMsPn4t8lxGGzn37t+MLQLOs0PH8
	 TKP7DsLRPrgTwFDL4XljZU5gKUgP9lxZ3Rlm79CjXaQRx2H76CR975OV09BtwxGAq/
	 5fUcnqwx/3QUtBZWUmeiTo3lU+bM4pw2d1gu/hRv6PMJMB04T2neZVKGYN/mbhAF25
	 gSm/nEyXKUEI0aLDe+X2bNOQG7NpCi/T7YgDA/+lP32elNVOr+htdfkQ/W7Q8VxBlD
	 /ADXlHJvEhyaA==
Date: Tue, 4 Jul 2023 23:23:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH v6 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL
 clock inputs
Message-ID: <20230704-tingling-automaker-22460e884793@spud>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-4-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230704064610.292603-4-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_152335_507883_5830682E 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: multipart/mixed; boundary="===============7908909889464366936=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7908909889464366936==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="moQ3gT+gahpFttN/"
Content-Disposition: inline


--moQ3gT+gahpFttN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 02:46:06PM +0800, Xingyu Wu wrote:
> Add PLL clock inputs from PLL clock generator.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

As expected this produces warnings for the existing, in-tree,
devicetrees which go away when the later dts patches are applied.
It'd be good to mention that its intentional if you end up sending
another version of the series.

Otherwise, this looks good to me too.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/clock/starfive,jh7110-syscrg.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-sysc=
rg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.ya=
ml
> index 84373ae31644..5ba0a885aa80 100644
> --- a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -27,6 +27,9 @@ properties:
>            - description: External I2S RX left/right channel clock
>            - description: External TDM clock
>            - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2
> =20
>        - items:
>            - description: Main Oscillator (24 MHz)
> @@ -38,6 +41,9 @@ properties:
>            - description: External I2S RX left/right channel clock
>            - description: External TDM clock
>            - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2
> =20
>    clock-names:
>      oneOf:
> @@ -52,6 +58,9 @@ properties:
>            - const: i2srx_lrck_ext
>            - const: tdm_ext
>            - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out
> =20
>        - items:
>            - const: osc
> @@ -63,6 +72,9 @@ properties:
>            - const: i2srx_lrck_ext
>            - const: tdm_ext
>            - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out
> =20
>    '#clock-cells':
>      const: 1
> @@ -93,12 +105,14 @@ examples:
>                   <&gmac1_rgmii_rxin>,
>                   <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>                   <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> -                 <&tdm_ext>, <&mclk_ext>;
> +                 <&tdm_ext>, <&mclk_ext>,
> +                 <&pllclk 0>, <&pllclk 1>, <&pllclk 2>;
>          clock-names =3D "osc", "gmac1_rmii_refin",
>                        "gmac1_rgmii_rxin",
>                        "i2stx_bclk_ext", "i2stx_lrck_ext",
>                        "i2srx_bclk_ext", "i2srx_lrck_ext",
> -                      "tdm_ext", "mclk_ext";
> +                      "tdm_ext", "mclk_ext",
> +                      "pll0_out", "pll1_out", "pll2_out";
>          #clock-cells =3D <1>;
>          #reset-cells =3D <1>;
>      };
> --=20
> 2.25.1
>=20

--moQ3gT+gahpFttN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKSb4AAKCRB4tDGHoIJi
0mP6AQDmJ5AWe304kFicAoMhDUQFz3DM3yboaw3sS/h4Hqn5cgEA7YVjLYsd40eM
xMJd2TNxa7X70zPGx7MTA2AeS/5DlgU=
=WZiY
-----END PGP SIGNATURE-----

--moQ3gT+gahpFttN/--


--===============7908909889464366936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7908909889464366936==--

