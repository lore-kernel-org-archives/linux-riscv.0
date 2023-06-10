Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB8DC7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNWO3zBGfXhuN9fVwWDg9SA1mU3Rt5pJ7YVw1YP3N/U=; b=BPVLwZX9M4n3WeHnVeItSq+wP8
	yMgURK25LngvnOKAeYiJsnkW351wl7ruDyhUKsygHK7zvAo/FAWXHY6pXaPo8zadAffKTWJ+iZz2r
	hrc4+CcWBMHb0oZyF6BQ4hiWit0HE/cm+9175dTtOQgKSBeicYTov+Tem7CsUKcbsN79niF+xb5Lt
	JBwqRv9g9J6BL0uKEIF/Gk/Avncb7P87nG9MUrJFkwcwfdjJOnQG+KaxfN9a7Fl8PMKWhKcN1Abrm
	6ZpGQ0a7PFT+2U7mwcghW+Kh0XjgIO51alZnf2sgqDRexF9z4s5FYAxuEj5V8xgZH58YdGp44EMZ7
	TQ5pEhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q86u1-00HAzC-2h;
	Sat, 10 Jun 2023 22:17:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q86ty-00HAyM-1N;
	Sat, 10 Jun 2023 22:17:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E513B61861;
	Sat, 10 Jun 2023 22:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1D3C433EF;
	Sat, 10 Jun 2023 22:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686435461;
	bh=iPCNRHIK3Pj5zhVltUCKRZCkjsC5p0Cp7eGGBoVlFUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mcV/L+4qbM/r3gE394dVVDAhi7j1GmgOpTn9nPsaSlM2HjceDm/1/8qu7vSAM8W3h
	 ghJhSzA0xY2vVTtDOQSm/LHFvpyPFRloIgvCrt0ucQR9A25b/BgQsfVxhoRmB3kFZJ
	 pX1yjkK99Wgaxlcigw6PDSzzncRxNWFbUDeJTZbC3DMh8n9t/vLEZGJYh8er5oJKY3
	 StxCgC74J8W21eAQr0kb1tHEtXfio8eW/gbSUL75XhRoasU0joGxKQZc4fXdA4DkEk
	 QlFJLlLE9Q4FRFongl4R5tujxb3S5Zp5JieNIAmJOlzMwzikMaC5VEQryjFO5/69Ij
	 TS8msKVKdKvEQ==
Date: Sat, 10 Jun 2023 23:17:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Message-ID: <20230610-thinner-sector-795141d97f40@spud>
References: <20230610202005.1118049-1-bigunclemax@gmail.com>
 <20230610202005.1118049-3-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230610202005.1118049-3-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_151742_557185_270C05A6 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Type: multipart/mixed; boundary="===============2908699658651771564=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2908699658651771564==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SGD9UZV1OU3mbFIW"
Content-Disposition: inline


--SGD9UZV1OU3mbFIW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 11:19:49PM +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

Looks fine to me chief.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,s=
un20i-d1-gpadc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml
> new file mode 100644
> index 000000000000..43256ad2b7ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
=2Eyaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/allwinner,sun20i-d1-gpadc.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner D1 General Purpose ADC
> +
> +maintainers:
> +  - Maksim Kiselev <bigunclemax@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun20i-d1-gpadc

btw, do you intend coming along later and adding some of the other ones,
or do you only have the d1 yourself?

Cheers,
Conor.

--SGD9UZV1OU3mbFIW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIT2fAAKCRB4tDGHoIJi
0vPXAP9aQLXN+V9qv4WJvylU1e1YEs5nQZv59+ccPZXpauxUFAD6ApBn6gx6uIwZ
WyzNup+1zJrn+/u59jc7JlHJQrKtzQQ=
=c3Gc
-----END PGP SIGNATURE-----

--SGD9UZV1OU3mbFIW--


--===============2908699658651771564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2908699658651771564==--

