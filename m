Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24446C7EE2F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 14:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahEwviwo0fX8Scrhr+UORWcAacenvuUVdjg1ZBKk0mY=; b=fyqnW4j5B1gZYf0mgc9Itwlm1Z
	1CS9TYkCZkYc3/vtmxqyKH00nprAbkENBmyLhwGVRQgA5CY1qO3wMxG1tifn3RWXLEJCtI993Lwzx
	/vy0OG3rGnzhn4KbROX/+DdD/6MiWpPLjXb+gCOcboRg87YSSvkpDMUOclZzcNsGMBRov0NyrV7o2
	YdW5sVdtF9FcxdyazHMDV7sz3yCQPGdspMPTS9EkGSFx50zHVe+fJi+MFfgvPhffehGrC1mAZ60DJ
	02Kidtmpzbq9EEIrotu6M7NC7fro5qeczAUmwAYkD0hq15tWpkjKThu1/tbmvGiRFKTSVM07gUhNj
	XJ6Iu92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zxi-00GOik-25;
	Sat, 10 Jun 2023 14:53:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zxf-00GOhg-0g;
	Sat, 10 Jun 2023 14:53:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B19BF60B42;
	Sat, 10 Jun 2023 14:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F6BC433D2;
	Sat, 10 Jun 2023 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686408776;
	bh=OzWir0L/faofH0wFxhfFc9Ju6SnxPtP2Z/T/v66ar6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbjqcWOfsPHzuDV2DHbosqFH7qWOxIu3pfd+g/fa9y1dXEEz984da0S1n/PNw14Tu
	 oZs4LUq+AF+KGNO/NVO7nAeZuDumg9Hclgu/oIXsV3cBIvw4DvE6YNnIMXyz7bbusd
	 cQ2YmxnmumNFfzA0l+MzlRXs0PhBPxXiOGFApjPOJqPLvUtP01J8v6bJpxOTkUm4Of
	 vkbYqht8Y00StTqCQWAjM2JEG8nrMjX9gtGe1GQhg7UG9P2aq8auv49G3FXNdyxqg6
	 eMX5W2w2d3XV6F7vOx4Qd3D9Qaf7Ub74NOIqanhx+eUmpVqfkTODBNzSMLLq0leGII
	 XJ7FsnHM0cAvg==
Date: Sat, 10 Jun 2023 15:52:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 3/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
Message-ID: <20230610-rehire-amid-2517f43504c0@spud>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
 <20230610141739.999268-4-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230610141739.999268-4-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_075303_367805_F8DDDCD0 
X-CRM114-Status: GOOD (  17.94  )
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
Content-Type: multipart/mixed; boundary="===============1215536580950554420=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1215536580950554420==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H0Cwx1inMVbzJjEQ"
Content-Disposition: inline


--H0Cwx1inMVbzJjEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 05:17:34PM +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> Add a binding for D1/T113s thermal sensor controller.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Why do you have 2 sign-offs that are both you w/ different spellings?
Content looks fine to me, other than one commit below.

> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a8=
3t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83=
t-ths.yaml
> index fbd4212285e2..001faa37fc27 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> @@ -16,6 +16,7 @@ properties:
>        - allwinner,sun8i-a83t-ths
>        - allwinner,sun8i-h3-ths
>        - allwinner,sun8i-r40-ths
> +      - allwinner,sun20i-d1-ths
>        - allwinner,sun50i-a64-ths
>        - allwinner,sun50i-a100-ths
>        - allwinner,sun50i-h5-ths
> @@ -61,6 +62,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - allwinner,sun20i-d1-ths
>                - allwinner,sun50i-a100-ths
>                - allwinner,sun50i-h6-ths
> =20
> @@ -84,7 +86,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: allwinner,sun8i-h3-ths
> +            enum:
> +              - allwinner,sun8i-h3-ths
> +              - allwinner,sun20i-d1-ths
> =20
>      then:
>        properties:
> @@ -103,6 +107,7 @@ allOf:
>              enum:
>                - allwinner,sun8i-h3-ths
>                - allwinner,sun8i-r40-ths
> +              - allwinner,sun20i-d1-ths
>                - allwinner,sun50i-a64-ths
>                - allwinner,sun50i-a100-ths
>                - allwinner,sun50i-h5-ths
> @@ -159,4 +164,17 @@ examples:
>           #thermal-sensor-cells =3D <1>;
>      };
> =20
> +  - |
> +    thermal-sensor@2009400 {
> +          compatible =3D "allwinner,sun20i-d1-ths";
> +          reg =3D <0x02009400 0x400>;
> +          interrupts =3D <0 90 0>;
> +          clocks =3D <&ccu 0>;
> +          clock-names =3D "bus";
> +          resets =3D <&ccu 2>;
> +          nvmem-cells =3D <&ths_calibration>;
> +          nvmem-cell-names =3D "calibration";
> +          #thermal-sensor-cells =3D <0>;

Is this calibration required, or optional, for the d1?

Cheers,
Conor.

> +    };
> +
>  ...
> --=20
> 2.39.2
>=20

--H0Cwx1inMVbzJjEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZISOLgAKCRB4tDGHoIJi
0oiQAQD0e1/NNmNVXU79UTT9xgswzUE0nkSKgBA12mUl1HHeRQEAz+80y9RHNKcb
U9PFIasihnSHDbwri3kPol5LaFM7Tg4=
=eh+H
-----END PGP SIGNATURE-----

--H0Cwx1inMVbzJjEQ--


--===============1215536580950554420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1215536580950554420==--

