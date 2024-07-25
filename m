Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50330C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bko5nxZlxXwAN3NNLy4zi5cD6QKG43K4opslhGiIiQU=; b=NpDFXzmx7HiDBW+64na1ijRQ77
	F2IjFh1JkejQcR6hTAcSzdP1T1z2zeOm61Q24DLaqfnYFHILKDtwqa13+kIiupd9Hyc+LKfcbajrm
	xwjr3Ba1FcAgyGqPal2n47CBPTVY5gjwO0kRselwCFbKCeT9tknlOz944s21Yb4C9kuaY8Ijjxz84
	CFMkjUARpWq6R6Oe20Y7nc/aWWWGVD5zXy7Tqai3RgWsRdqm4njwZ/ZhSTL3ZpMuV/K2LhwlXUSxV
	AtiIXM1j+Ok0ctROZJBFVp3/zqoXS5rTW3tFhPp8Trmce6FOp4Mg6qAEQ8v2MuyjpdsSxD6TPv6m+
	UJHvCIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzPY-00000001FTD-45cq;
	Thu, 25 Jul 2024 14:25:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzPW-00000001FSi-34qc
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 14:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC1AB61359;
	Thu, 25 Jul 2024 14:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DFBC116B1;
	Thu, 25 Jul 2024 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721917537;
	bh=xTZKezumyZvFewXix8LuYU8I83b2VIsGQU7HHPsFcPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5+KiGD71alioIQpKvL+KMTnKQmsNAerGTGT5NUCU/DXyopGx4yvDwtSfqcyIRBYL
	 Ld/Wo62UA7Ij4R+LfALaf4koDIExxNbYXK13eaAUWlmNTLbco91L5T4pPyKBl/qmHC
	 POOp2Nf3HkE4QSugTH0vmPcHmTSmRx8DwbTb+g5MXPnm9By1g0OUuX+wGUudKwgJOn
	 aQYrpVWL6bc1rEitEVznbMh8v7e8Kh/QmtGWnyL1iBrfhGKNFn04JqYTW/Ukk23++J
	 0YpeoNws7y862wzVOxOYOQUgSUuPA9589Q4p8SeHq+p3xgknB9jTVF5opQznjjy2/+
	 Pm+AGBHPNrBNQ==
Date: Thu, 25 Jul 2024 15:25:33 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] dt-bindings: gpio: mpfs-gpio: Add PIC64GX GPIO
 compatibility
Message-ID: <20240725-prevalent-marry-66670630061f@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-6-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240725121609.13101-6-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_072538_859934_54BBB9EA 
X-CRM114-Status: GOOD (  14.41  )
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
Content-Type: multipart/mixed; boundary="===============4299969250705945840=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4299969250705945840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DQensbp2dRAb/Tqi"
Content-Disposition: inline


--DQensbp2dRAb/Tqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:15:57PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX GPIO is compatible with mpfs-gpio driver
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml       | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.y=
aml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> index d61569b3f15b..fdce88374a91 100644
> --- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> @@ -11,10 +11,14 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - microchip,mpfs-gpio
> -          - microchip,coregpio-rtl-v3
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-gpio
> +          - const: microchip,mpfs-gpio
> +      - items:
> +          - enum:
> +              - microchip,mpfs-gpio
> +              - microchip,coregpio-rtl-v3
> =20
>    reg:
>      maxItems: 1
> @@ -69,7 +73,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: microchip,mpfs-gpio
> +            enum:
> +              - microchip,mpfs-gpio
> +              - microchip,pic64gx-gpio

This hunk should not be needed, given you have an mpfs-gpio fallback.

Thanks,
Conor.

>      then:
>        required:
>          - interrupts
> --=20
> 2.30.2
>=20
>=20

--DQensbp2dRAb/Tqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJgXQAKCRB4tDGHoIJi
0re3AQD8QgYHuw3hyM5i+5EXK7rRvYGwlptD0eHB13uRHP7xQgEAoGmqq8CNrCbJ
4ipvOJ1zROMaN3JH0GIB7jvy80CLFg4=
=18I5
-----END PGP SIGNATURE-----

--DQensbp2dRAb/Tqi--


--===============4299969250705945840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4299969250705945840==--

