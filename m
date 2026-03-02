Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A50BEB3624
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qm4oAMwHonDSQeu7REolsm1ZcP7uv2Bo7Pcb8fw/MnY=; b=VgfBCb9vRJHqrMDdh4rUWOI2zZ
	UslQOpboex/HJQi2Ad1kRMsSGK8sHoyOKzmymNxWSNCIRguxkQPJ0jINJyThWBLZ2ZXX4ebSAlnoc
	Eflt6iOKPHv8Wgcvpy/vVz66DNJXMs07R7jByvrLOdoOVIpQRFvozA0pwCjAMvxBZ0NwKWsJ83fI1
	30I6H7dxiujKUucwHyHS4peRb8zsiH3L/1pEGRe01Mhw/D9rgdSWAOb70Mt6n+0mILBUH8N0lAadO
	DfEzV1VbNNy0D5WF2suMmKpS51GVg9J+gBLp2USeTYQoq92HGQHwlMQmbSun9ZM+xiXB+HPf6m3fK
	pfWkGA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7xB-0000000DgLL-0THc;
	Mon, 02 Mar 2026 18:25:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7x8-0000000DgKr-1Ubb
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 18:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83C1D41A74;
	Mon,  2 Mar 2026 18:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB3BC19423;
	Mon,  2 Mar 2026 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772475909;
	bh=hqlQdJr+TwetXdWKctFYGt6ONv9TGR3xJA5uUdRsGnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGt9U3xDvCQN6CIVGOex4BE7QHpNb61w5XBxlJUVPFtv9DuRJh78Oc7k+gpUqLZjU
	 qjPwqRwzpsxc4wTLJUm7ClOBT5QwEd5bGBPURqbw1gjzecInQzic0mUtVfokZ0DnN4
	 5zgZSVRTn8d5KxjczSElpn8u8JVgqpCzLNAG21KEiPklO0HjEYpzv21i6h3ra2sZFj
	 ldRKL0+SqlgUsDfjbOufYVgz7815DGm8Y/6HDWuPgOxris8tcTulN72Sqguji0/RnR
	 +081cCM5HLlESx40P8S+1XzHGWUJyywyo+HwtkzJs2bX7htwpOnMcYApBxckdU/Swx
	 GpfgsmaY3W+rw==
Date: Mon, 2 Mar 2026 18:25:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: mmc: spacemit,sdhci: add AIB voltage
 switching registers
Message-ID: <20260302-crewman-faster-9fd00b62e30c@spud>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_102510_459753_6A082C18 
X-CRM114-Status: GOOD (  15.91  )
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
Content-Type: multipart/mixed; boundary="===============6472579222691792796=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6472579222691792796==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iVG0vKrqfY2+UZi0"
Content-Disposition: inline


--iVG0vKrqfY2+UZi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2026 at 04:13:22PM +0100, Iker Pedrosa wrote:
> Add SpacemiT K1 AIB register properties for UHS voltage switching
> support:
>=20
> - spacemit,aib-mmc1-io-reg: AIB MMC1 IO register address for voltage
>   switching
> - spacemit,apbc-asfar-reg: APBC ASFAR register address for AIB access
> - spacemit,apbc-assar-reg: APBC ASSAR register address for AIB access
>=20
> These properties enable the driver to perform voltage switching between
> 3.3V and 1.8V required for UHS SD card modes.
>=20
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++=
++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/=
Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> index 13d9382058fbc1c12be1024d1c550f04a825673c..4d6590aa8262009b6e5697a04=
b45cf3736c0fa42 100644
> --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> @@ -32,6 +32,18 @@ properties:
>        - const: core
>        - const: io
> =20
> +  spacemit,aib-mmc1-io-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: AIB MMC1 IO register address for voltage switching
> +
> +  spacemit,apbc-asfar-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: APBC ASFAR register address for AIB access
> +
> +  spacemit,apbc-assar-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: APBC ASSAR register address for AIB access
> +
>  required:
>    - compatible
>    - reg
> @@ -50,4 +62,7 @@ examples:
>        interrupt-parent =3D <&plic>;
>        clocks =3D <&clk_apmu 10>, <&clk_apmu 13>;
>        clock-names =3D "core", "io";
> +      spacemit,aib-mmc1-io-reg =3D <0xd401e81c>;

This looks very very wrong to me. This is part of the pinctrl
reservation:
		pinctrl: pinctrl@d401e000 {
			compatible =3D "spacemit,k1-pinctrl";
			reg =3D <0x0 0xd401e000 0x0 0x1000>;
			clocks =3D <&syscon_apbc CLK_AIB>,
				 <&syscon_apbc CLK_AIB_BUS>;
			clock-names =3D "func", "bus";
			spacemit,apbc =3D <&syscon_apbc>;
		};
so if you need to change something here, you need to do it via pinctrl.

> +      spacemit,apbc-asfar-reg =3D <0xd4015050>;
> +      spacemit,apbc-assar-reg =3D <0xd4015054>;

These two are the apbc syscon:
		syscon_apbc: system-controller@d4015000 {
			compatible =3D "spacemit,k1-syscon-apbc";
			reg =3D <0x0 0xd4015000 0x0 0x1000>;
			clocks =3D <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
				 <&vctcxo_24m>;
			clock-names =3D "osc", "vctcxo_1m", "vctcxo_3m",
				      "vctcxo_24m";
			#clock-cells =3D <1>;
			#reset-cells =3D <1>;
		};
so add a phandle to the syscon (like the pinctrl currently has) and
access these via its regmap. What you've got here is a non-runner,
sorry.
pw-bot: changes-requested

Thanks,
Conor.

--iVG0vKrqfY2+UZi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaXV/wAKCRB4tDGHoIJi
0mz2AP9Q9b/xkWkD/y0/gd0Q80+ijFziY/LsJwgySgJsYSig7gD/YRFFEbPlNDFf
Bl1OTEmAhqj29hPvOZ0o5CC11uqBGgs=
=A6Ze
-----END PGP SIGNATURE-----

--iVG0vKrqfY2+UZi0--


--===============6472579222691792796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6472579222691792796==--

