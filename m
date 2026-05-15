Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D49ACD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiyqbABRnPVe4UCmacIPkrQ3lFrcjTYkuKjsVVD96cI=; b=BB+pZ+b9Ai128vlEZBPqj6PPyX
	iVCTm0okJxv1/S2pu8WiRMYYF28lbnaYxilpqPGRidNRiP9Wwn41u0d23ocli/XCb9ncxNXOzWMjl
	rcaeLXqg10w50LYP7x5rVKNgodhOQcP45F/hjboJOvEkx2bLsU38LlzpOa7Q08NqT9cDdEkV+vqKx
	+aMhBLsZ08Oycfu/zklA7sEsIIjqQWWvt2ksN6mBVZAk2iHSBNINWM5C2dZlWk7vXJZW+VlcerKDP
	25MWrH7Lw+lcyR4lIXNxq5nDQnrz25ibhPZKM6Ho3B3Vg1wNUNRCtzjVmbWuOt8g9aHq6luPUuwhZ
	hlAi0jwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsFK-00000008P30-1py8;
	Fri, 15 May 2026 13:06:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsFH-00000008P2H-2Wot
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 13:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0D9440951;
	Fri, 15 May 2026 13:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C42C2BCB0;
	Fri, 15 May 2026 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778850386;
	bh=uUeWRpb6xVmmL+Lm7CLlmRxmdTh61MhPLeJ6UxoXK48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ki6lpypOzKMiHDITLyOYMf1T4BOaUqjbJKKxUd91YQRXBCpxXWYiJQzi7lEjX/VNk
	 GdGuMXvO6plYdYaEpO8DthgdPZXsYlO3nkMNEgPnyjDHj0+myWDE1FMHPtj9rmaPN1
	 Er++cWiIZIMdYHN/uFVIfdzylgJzHF3L22wa+B3NyiPJBxRJu/U4Pv1MCRkuKBNWjs
	 FGlz6skdhT2o1jxQwKBHUCYdotqPfQeQvEu1WY9Kw2VBeTmJ/Pb+WtTLZKi3H8u04D
	 c40CopEGAbuQtKljOUTRlz3genvU1aKhvRGujsSYZR8p4xEFzH/jLQ49uSYAwLeLTM
	 ioi2NqvjCplZQ==
Date: Fri, 15 May 2026 14:06:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 1/3] dt-bindings: pwm: opencores: Drop starfive
 compatibles and update maintainers
Message-ID: <20260515-blinked-gigabyte-d2882372b616@spud>
References: <20260515054723.25024-1-hal.feng@starfivetech.com>
 <20260515054723.25024-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260515054723.25024-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_060627_677295_C85B0BE1 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Type: multipart/mixed; boundary="===============5212983729400462326=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5212983729400462326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bsBRJFDfWIlVk/Sa"
Content-Disposition: inline


--bsBRJFDfWIlVk/Sa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 01:47:20PM +0800, Hal Feng wrote:
> Each of the StarFive JH7100/JH7110/JH8100 SoCs has 8 OpenCores PTC IP
> cores. One OpenCores PTC IP core can output one PWM channel. The only
> difference among them is the register base address. There is no need
> to add starfive compatibles to distinguish them.

NAK, that's not an acceptable reason to remove soc-specific compatibles.

pw-bot: changes-requested

>=20
> I will maintain the pwm module in place of William.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../devicetree/bindings/pwm/opencores,pwm.yaml         | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/D=
ocumentation/devicetree/bindings/pwm/opencores,pwm.yaml
> index 52a59d245cdb..834fb17ec595 100644
> --- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: OpenCores PWM controller
> =20
>  maintainers:
> -  - William Qiu <william.qiu@starfivetech.com>
> +  - Hal Feng <hal.feng@starfivetech.com>
> =20
>  description:
>    The OpenCores PTC ip core contains a PWM controller. When operating in=
 PWM
> @@ -20,10 +20,6 @@ allOf:
>  properties:
>    compatible:
>      items:
> -      - enum:
> -          - starfive,jh7100-pwm
> -          - starfive,jh7110-pwm
> -          - starfive,jh8100-pwm
>        - const: opencores,pwm-v1
> =20
>    reg:
> @@ -48,8 +44,8 @@ additionalProperties: false
>  examples:
>    - |
>      pwm@12490000 {
> -        compatible =3D "starfive,jh7110-pwm", "opencores,pwm-v1";
> -        reg =3D <0x12490000 0x10000>;
> +        compatible =3D "opencores,pwm-v1";
> +        reg =3D <0x12490000 0x10>;
>          clocks =3D <&clkgen 181>;
>          resets =3D <&rstgen 109>;
>          #pwm-cells =3D <3>;
> --=20
> 2.43.2
>=20

--bsBRJFDfWIlVk/Sa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagcaSgAKCRB4tDGHoIJi
0vz7AQDnchzrkgpD5wwGGsBP0yvNyXSvs8NxJBiUXVHJNmwg0wEAgZFhi1GnKqLB
ujHGBW3J5oDRwL4QP5p0t03/7ZjktQU=
=shV9
-----END PGP SIGNATURE-----

--bsBRJFDfWIlVk/Sa--


--===============5212983729400462326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5212983729400462326==--

