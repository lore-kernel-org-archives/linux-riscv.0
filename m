Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14551CE834A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqhYFl7Uq7s9bEpxFBv0nRHh+IxcZZXXAigZ1e+ua5w=; b=xTYFf2IUBMrcj5Nc2GYzqFg+Qm
	u0i8LhacFKJMy7nlgkva2dGrWak0GU2TvFtkaXu1sLvKvNE8C02AFzObR5MHgs5WxmRpigO/6FGqm
	5DG35qkf7n0NAN1AKbADp4gbUutR7bhUwmq/kC7DsyjrPXlN97n9FmPW08mpGpDSRB7jPg7mnPZ81
	RaMGsIKr1fNfU9tSyznqa80woHl/MOBeR9NvTHLExwbJbwnsxAQudWng0GGJIjk9j2TuQvhL8CAA8
	aHZqEkUKhSTMgA42JT1iUWUZRXc18epWSbqDJd8rs5e/cL+bEb+tY/lm3w3IH+q31YYSOFdo6fqUj
	69EontSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAC-0000000HSuu-2wHR;
	Mon, 30 Sep 2024 14:14:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGjE-0000000HMic-0jPi
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9843D5C4B50;
	Mon, 30 Sep 2024 13:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC98AC4CEC7;
	Mon, 30 Sep 2024 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727703979;
	bh=aMJaYzXY1jg3S4x/G45yWq/QZRII8Ge4YR9ZlqyRsB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3ZYtKfyUFS48qvHgbCX7RTJf1ZyWm6pNL1pfytw04oTlnFB/AOTlFL93z46iPwP8
	 UduAsF/71nTs4Phg+5oPhQMfaBYeEWabmqUEDzx+AoMiCSwyL2MNXeld7T0X6Mvx0F
	 EPAMvxPL/97ZXqiYd6BkpfcosuV+paPkiQsL8CtQn+lPIxOlDfjItho6vmuxXTUurY
	 wo+Tll2augLHeF0U65Qz6qFCitBe0NbSycwFT4vS4upHhzbELvouP4aMYAFH2kjyQk
	 qgMdz6tUsc3nx1dvUMHbrRBqTihE6Utgf+EBEK0jiFrrRMKB+0Tx3XJ2y9giKB65gN
	 3jK0vFOIV76PQ==
Date: Mon, 30 Sep 2024 14:46:14 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 05/20] dt-bindings: gpio: mpfs-gpio: Add
 PIC64GX GPIO compatibility
Message-ID: <20240930-mourner-sharpness-1b049c7e5c85@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-6-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-6-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064620_323102_A6D1DE1D 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Type: multipart/mixed; boundary="===============5601173897426580740=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5601173897426580740==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xs4yn0wAy3h5xCya"
Content-Disposition: inline


--xs4yn0wAy3h5xCya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:34AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX GPIO is compatible with mpfs-gpio controller, just add fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml        | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.y=
aml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> index d61569b3f15b..febe8c2cd70d 100644
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

This items shouldn't be required, the enum should suffice alone.

> +          - enum:
> +              - microchip,mpfs-gpio
> +              - microchip,coregpio-rtl-v3
> =20
>    reg:
>      maxItems: 1

> @@ -69,7 +73,8 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: microchip,mpfs-gpio
> +            enum:
> +              - microchip,mpfs-gpio

This doesn't need to be changed, it is fine as is, no?

>      then:
>        required:
>          - interrupts
> --=20
> 2.30.2
>=20
>=20

--xs4yn0wAy3h5xCya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqrpgAKCRB4tDGHoIJi
0rDzAP9pyLnXr2ho/eWNw9/JV5Swb++EFvIPKm55QehjzAbh1QEA+DpSQJaEpK8z
I83zNR0nHiajzvuhxVkKZjofswIbuQ4=
=Z0/3
-----END PGP SIGNATURE-----

--xs4yn0wAy3h5xCya--


--===============5601173897426580740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5601173897426580740==--

