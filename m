Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DC3C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK/4GfjiywIoOdmkqOlInDLiHYhhr7kvBKaJjtmp+ZE=; b=1FLuZk3SVUHguyW192Fbyu5Ui6
	cO+5gSS/6igGWmc8o+wF6njoA+SLbzDsORd7wjl9TWSney8t+kBfyZsMGP0ERxzNF4e59xu8+dqu+
	DJBh/BkBRPV+xc6BbIgaiK95Bozh+6vUIbrLjtFcV7UL0Qf6d6/jdz6AphmV/NnOfEhqRl5TNdnGI
	lc8shdE0gVrXh29mQk5TiCMsTKdrx1ULqhgHSuUfeGoNLcErGPnGscDLhViO96x+qNress2g+dIxQ
	KZZn3Dqrx5GQLcTfKII5ZrZYwFgpZG3a8zUImKQWkqWyXG6H32WjXbRU9OR/Kj8yyRDGvtTQrSleJ
	LXrUxIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s80GV-00000008MIU-36bT;
	Fri, 17 May 2024 16:17:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s80GS-00000008MGK-08Zx
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 16:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DCE1CCE1B3A;
	Fri, 17 May 2024 16:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B40C2BD10;
	Fri, 17 May 2024 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715962610;
	bh=sYIW6xiRFDKpO0E7qs68ZN7uyOIsz2AfW+6kxgmPMW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aO3rRbTsGNqJTNoEOosC7U8ZPlbZsUJn4QsQ0FYLQ4lV+L6hIZ8E7tZGEmOgCp+3S
	 nx5sfSd6N3BjMVdy8MVnQPR0Xa1o1RwD8Msu53pdvMJOtYpiXn3JzCckwCricC3iy7
	 E0GSeOILvH+9HAhs/mkdsvTXPBNUv/4ZiO3XV818Pvtrtfu8jepDNVg/QNtYf7ufMy
	 3KZr6h6F9eozJmMX5qAJn0xS7maVdDSeAt7Uz1lSbEUS4Y5gcRfRDEGmqz/XiKKceL
	 MqKg/px5GKaE9M00BlqwYqo0RkDxgL0B7fobm1ncnMS1Wd/ztFdun0zeKujKjVgiyZ
	 pY8V39DEjDnMg==
Date: Fri, 17 May 2024 17:16:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: serial: snps-dw-apb-uart: Add one
 more reset signal for StarFive JH7110 SoC
Message-ID: <20240517-lion-supplier-f4d15b0edcff@spud>
References: <20240517061713.95803-1-hal.feng@starfivetech.com>
 <20240517061713.95803-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240517061713.95803-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_091700_476510_9FBAAADD 
X-CRM114-Status: GOOD (  17.06  )
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
Content-Type: multipart/mixed; boundary="===============0921018282108635205=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0921018282108635205==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ET0G0aOiXXDFM+f4"
Content-Disposition: inline


--ET0G0aOiXXDFM+f4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 02:17:11PM +0800, Hal Feng wrote:
> The UART of StarFive JH7110 has two reset signals.
> Both of them are necessary for JH7110 to initialize UART.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/serial/snps-dw-apb-uart.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.ya=
ml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 1001d2a6ace8..a6396c5cbfb1 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -13,6 +13,16 @@ allOf:
>    - $ref: serial.yaml#
>    - $ref: rs485.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-uart
> +    then:
> +      properties:
> +        resets:
> +          minItems: 2

else:
  properties:
    resets:
      maxItems: 1

Thanks,
Conor.

> +
>  properties:
>    compatible:
>      oneOf:
> @@ -48,6 +58,7 @@ properties:
>            - enum:
>                - starfive,jh7100-hsuart
>                - starfive,jh7100-uart
> +              - starfive,jh7110-uart
>            - const: snps,dw-apb-uart
>        - const: snps,dw-apb-uart
> =20
> @@ -82,7 +93,8 @@ properties:
>      type: boolean
> =20
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> =20
>    reg-shift: true
> =20
> --=20
> 2.43.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ET0G0aOiXXDFM+f4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkeC7QAKCRB4tDGHoIJi
0vZ0AP0SDG3gdkl/SROzsnRuQ3RQz0FByypwdFgIWR36PF1aywD/fUifiJN9EkJS
DWNaC36x9nDD0qUF9URCjGhdPH1TMws=
=KlsG
-----END PGP SIGNATURE-----

--ET0G0aOiXXDFM+f4--


--===============0921018282108635205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0921018282108635205==--

