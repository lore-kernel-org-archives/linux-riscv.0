Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DE4C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dNIy9/oQzjYd9GZZFLdANUex7dsRVTMtE85N0ARndU=; b=aTYGg86LG5VNloF7QLStKJcLLZ
	XyXuVhWoX9Ad0MOyb9IQi4i/daaeE/lhsrOWBX+BUCCjQcJ5vZ47pAsreGmwU9w6Q4cfjqHv01PQv
	YMdt3mqXyXFE6ST90Zu3ZWtL2WJy+0V8B3XGA/caP7FUX4YuzrTD6/NcH4JWa/Kuf/OCS4E3oN4WL
	NRk6YhKdUFnXLHpJKH9jZbHoKfuP36Q9f4236znO9CtCJlGTeeSOAiCFdhNWLGdlN4Twv66jriDUE
	ylAlzrn7M10ZP6pa0VEhh3pQes/93fPaoX10hpQzobHvVagiNIdb25CzBg0krTscR5F10J71oaysC
	jQ3lMlfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvFQF-00D6yG-2V;
	Sat, 06 May 2023 10:45:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvFQB-00D6xd-07;
	Sat, 06 May 2023 10:45:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 523BF60AF4;
	Sat,  6 May 2023 10:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F0DC433D2;
	Sat,  6 May 2023 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683369945;
	bh=mdAeXvDvAsh4oPGhPgeDNTs48DKzuWnkMpws6AcGyeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGlRVoqEN1sSxivM1kUzgH5wR3j2dq3vSSXS1YcaQMh8lsuR40Zch7rxHIT1izzPa
	 VxFMPZ1JVUXB35MCW7DFvTHjEFADBeOS+y7bnRDcyGhgy9o0lFi3wvzCTghCxxr6RO
	 9QW1NTulQe4GSNXW1DJm71do0fOwnOLF2cq8tYdJucvh3ovnhtvR3rHCzXTOhPFcdU
	 MrUSyIVBnn94efl0E5OL2i4EcjuzkIBlGmP/L90Ue4lJS/sZKS2BehNe1GnJgycIch
	 JVl7fOXIYhrLh9MOdB6vx+pELbLdbgmDMEWK3zJ0eEPwJ4fTdhGX+jSrvS1CR3TW9w
	 qmQbcB3i/j30Q==
Date: Sat, 6 May 2023 11:45:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329 SPI
Message-ID: <20230506-mobility-judge-11bf5e258c2e@spud>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-2-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230506073018.1411583-2-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_034547_174891_DDFB7082 
X-CRM114-Status: GOOD (  18.21  )
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
Content-Type: multipart/mixed; boundary="===============2468546955658034535=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2468546955658034535==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Eic5fH4KMQjsoFCn"
Content-Disposition: inline


--Eic5fH4KMQjsoFCn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Maksim,

On Sat, May 06, 2023 at 10:30:09AM +0300, Maksim Kiselev wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
>=20
> Allwinner R329 SPI has two controllers, and the second one has helper
> functions for MIPI-DBI Type C.
>=20
> Add compatible strings for these controllers
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-sp=
i.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index de36c6a34a0f..2c1b8da35339 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -21,6 +21,8 @@ properties:
>      oneOf:
>        - const: allwinner,sun6i-a31-spi
>        - const: allwinner,sun8i-h3-spi
> +      - const: allwinner,sun50i-r329-spi
> +      - const: allwinner,sun50i-r329-spi-dbi

=46rom the driver patch:
"Add basical support for these controllers. As we're not going to
support the DBI functionality now, just implement the two kinds of
controllers as the same."

Should this not be set up as a fallback compatible, per Samuel's
suggestion here:
https://lore.kernel.org/lkml/9ae7d1ee-4e2d-f3c1-f55f-e96b0e449b63@sholland.=
org/

Thanks,
Conor.

>        - items:
>            - enum:
>                - allwinner,sun8i-r40-spi
> --=20
> 2.39.2
>=20

--Eic5fH4KMQjsoFCn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFYv0gAKCRB4tDGHoIJi
0kNKAQCc6YXuweRIlRrDgRAXOJnIG0uN5R2tL/fxIzNV8q9KxQD9GRVzBGOPGztP
hupgvwOSJKKM5Q0DMouV7dpmWU5aZwk=
=btCb
-----END PGP SIGNATURE-----

--Eic5fH4KMQjsoFCn--


--===============2468546955658034535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2468546955658034535==--

