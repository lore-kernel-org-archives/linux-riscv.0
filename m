Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194E0E71D2D
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LozHEiZ65wcVzHFVAPWFkeKUlZw0ehjDKx4+Bkb7ntE=; b=vxLbWqna0t7vUsACVWgGeU2Bl7
	3A6xaJLxeVB90Nwl1A42cpmiVL0j3ixzGPvbLdPd92gHvmoPVvhvc0aAOAnT3nOfS36pEqHoIYuZn
	BmIouMuuA91h76AKYzpjpCFQ7duwKDA2tcERqzt0C+WKHM3cfPE4HEEYI6YXKLY4aBsh9vGmuqPrp
	Zkq5oUD021cqRHXlhiDmtwm3oKHOUiBpFPE3uNYffE+Rj9zUjiMZJjXLEbSDE/YWMp679N6qNevcG
	Q7C85ZWfpTY4kYaUguW3esvYr3Fnaik6yoVWR9I3P5akq4x4FLtuoGMCwkPZvvIjZqj4DoBYhrruD
	N/x9cLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDGZ-007wBJ-2Y;
	Fri, 29 Sep 2023 13:10:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDGX-007wAZ-11
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 13:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D95A61EE1;
	Fri, 29 Sep 2023 13:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2F8C433C7;
	Fri, 29 Sep 2023 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695993043;
	bh=5Ol5wAReAsTCoXnxR80HvvP42Eru4mOmS+P6qbZsgiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6gSDAtnKEHECNEDsB6F3lZqPBFTgmdMExMCpOMwH34KXE5Zo8euVaVEa3LoxysTv
	 t8roJKvnCVdEYwUL0x/blP6u5li6gS2RusB0aYvWArLwq7t4yQtxdf/qWRd9Lcnh9S
	 qC5ffpyl4uFCbwBPfffvFa0+jidNj/axAQzPJmL9pRcWuEQ1A+awoQ1Q9uVtVyScGS
	 iy/xsHcU8yoH8/eOrKNzJSnEFe/RSfmF4jgj7yfe5VKAMwPQCSONoYLhLKd8FEgYIo
	 NKONdP7bPRj6UQUOJBtlBJR+iHxRy5F9yxvCHuptCVoi57k/Fx/AS+XOV1AqJ7p0Uv
	 79c3a+GYQv52g==
Date: Fri, 29 Sep 2023 14:10:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Add T-HEAD PWM controller
Message-ID: <20230929-equipment-july-949cffaddc22@spud>
References: <20230928170254.413-1-jszhang@kernel.org>
 <20230928170254.413-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230928170254.413-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_061045_442432_A88EC78C 
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
Content-Type: multipart/mixed; boundary="===============2691789836629799211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2691789836629799211==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G32AAMWduI7PPuPP"
Content-Disposition: inline


--G32AAMWduI7PPuPP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Sep 29, 2023 at 01:02:53AM +0800, Jisheng Zhang wrote:
> T-HEAD SoCs such as the TH1520 contain a PWM controller used
> among other things to control the LCD backlight, fan and so on.

"such as", are there others?

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/pwm/pwm-thead.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-thead.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-thead.yaml b/Docum=
entation/devicetree/bindings/pwm/pwm-thead.yaml
> new file mode 100644
> index 000000000000..8a7cf7129321
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-thead.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/pwm-thead.yaml#

The filename etc should match the compatible, especially when afaict
there's only one applicable SoC.

Otherwise, this looks good to me.

Thanks,
Conor.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD PWM
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - thead,th1520-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    pwm@ec01c000 {
> +        compatible =3D "thead,th1520-pwm";
> +        reg =3D <0xec01c000 0x1000>;
> +        clocks =3D <&clk 1>;
> +        #pwm-cells =3D <2>;
> +    };
> --=20
> 2.40.1
>=20

--G32AAMWduI7PPuPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRbMzgAKCRB4tDGHoIJi
0jBTAP9bC/3fxKIett/RV53md9zbCAYSbpmA2h/aaFI/scbk7gD/Xgq9XvhDe+db
C1sCsh1BJQxISaGvnocyMU6nso6HMQ0=
=BboF
-----END PGP SIGNATURE-----

--G32AAMWduI7PPuPP--


--===============2691789836629799211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2691789836629799211==--

