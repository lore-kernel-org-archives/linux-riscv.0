Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F028EC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hxv0+1J8Y3TZS9cGDpiabNXKlt5BP8qkSsQemP7nlY8=; b=OSNj1k1sRDCKvDR186Qo+banJf
	Ydt6EAQhqOvNel3kVj+6qwZx+YLZ2rUNX6j9prhuAGjj9mzVeME9Zs5jBcsstqJ6OV6C6VtyFRvQA
	L4Ed4YTNABojTLOF6iyoB5xh31bCGBMqlnbdEpXzZPfVToS8Jr0aIJTwA02HmQAHLMfDOq/53gi+5
	TcrDgUG5xY6R+IFmBuxv9knI7L/ouZ4vTTMFvzsgk0MZkB6bhkhLVe+3aIoe0HY7m4ER9YELTVnuP
	aPBa4UaW+h+ylcFb8z6ZLrFwkUb1j2t4rI4x1Mu4o5wFSkhBokvP6o+tBIWzg7n/ixqQzKx0DUFII
	pYhglkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Mog-0000000Bkwx-00Hd;
	Tue, 07 May 2024 15:33:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Moc-0000000BkwT-2wDH
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 15:33:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B927C617FE;
	Tue,  7 May 2024 15:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFABAC2BBFC;
	Tue,  7 May 2024 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715095993;
	bh=Uuw8yqLX+zNb2V3s6736daoABfNqSC9H9+VYeozPtso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKhScJgrTiIWYZvifQK32YrfBrp/LH9y+F0KXy68fmKvrfE3fbmo4t7V3LrPAmUiQ
	 2Duvw/JI7QJX9gONxzmkbiDr0MezUwA6sIlnRl6T+GuKskZu17FPf1vTxvoz0lTSiS
	 CWPEOwSQ3axTXCMmf0qqvRRJ3a858uEa6yxE5rIzOX8/kDcxVk6/UFCg1O2ZHPDBtU
	 zK6I7yzqBaUTC5jCA0F4Am7yEy+qbv6qdPGaHM7utiWu3+2m7GyxfDD7eCefVMv34y
	 wA/9vCbiWVLxLoFuwU4YIF+Md/1x3n6cuqDdhvwUTRuSIDQYOKA5PgWX8X2ilti0v+
	 evXHnC6DdCq/A==
Date: Tue, 7 May 2024 16:33:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
Message-ID: <20240507-mantis-rotten-f4be1961b3f2@spud>
References: <PH7PR20MB4962C6D8FD6989BC79F9483FBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <IA1PR20MB4953F852CB7A9C5FE45E18EBBB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953F852CB7A9C5FE45E18EBBB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_083314_853770_3884BA84 
X-CRM114-Status: GOOD (  15.72  )
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
Content-Type: multipart/mixed; boundary="===============2715326964265371308=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2715326964265371308==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g3PGoBcSoUn7NI8A"
Content-Disposition: inline


--g3PGoBcSoUn7NI8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 05, 2024 at 09:18:52AM +0800, Inochi Amaoto wrote:
> Due to the design, Sophgo SG2042 use an external MCU to provide
> hardware information, thermal information and reset control.
>=20
> Add bindings for this monitor device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042=
-hwmon-mcu.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-=
mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.=
yaml
> new file mode 100644
> index 000000000000..f0667ac41d75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/sophgo,sg2042-hwmon-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 onboard MCU support
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-hwmon-mcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#thermal-sensor-cells"
> +
> +allOf:
> +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hwmon@17 {
> +            compatible =3D "sophgo,sg2042-hwmon-mcu";
> +            reg =3D <0x17>;
> +            #thermal-sensor-cells =3D <1>;
> +        };
> +    };
> --
> 2.45.0
>=20

--g3PGoBcSoUn7NI8A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpJtAAKCRB4tDGHoIJi
0ojlAP4qRojNEmxLVCu8LiEozoXxSgRaOnYNdn9jUxygr7Q6ugD+LYcUcNRZ2116
IeAQnV4lJkh7RnQwP1vgqhqwkgq5SwA=
=mbl/
-----END PGP SIGNATURE-----

--g3PGoBcSoUn7NI8A--


--===============2715326964265371308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2715326964265371308==--

