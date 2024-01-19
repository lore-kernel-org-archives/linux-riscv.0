Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7DBC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6ZQaAme8KeM4S505zKblQwjDao9jxKpyFu5zLzk+nE=; b=r10OVpPcZplFvvxfUvkexVnrqJ
	rgVzU8YBJxkyTdb44sJvVMyhCaDOtjeGVyPOX7cq9CuPqNhOfkFMLWI7Rut4wOG4OneNIcxi2Qju5
	dKR3Vq1e3nFPPkmj21aLQEBJmqyWvp371zmjFv1YXBvhcpwU/dd8s0VLZxBpu+xlm6qRX4BcBa5WZ
	echsiY2PoE4C3a5ZiAJGChbQiBI9iispce568BMVHV9oaxeko0h/1eDhY2y24+xb38eEZgRBZPvso
	ivTPB1PiWf+VQV6xkVV+6kwVZAOnmhYBYH4w36aoWTJAlSpjXdr2t5mr6qjfIdk5y40BrzrSyl0s9
	NWNmEkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlwH-0054RR-10;
	Fri, 19 Jan 2024 10:17:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlwE-0054Qu-3D
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 10:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705659447; x=1737195447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+LtMZPOF1yo585gqDoaAA6wOBqB5Aivtv5s5vcPOK50=;
  b=RXzIH/gx6Ol2poJj8HeNqD+IqjQizHTCpLj4WV4ha16wlBPed5F6vIQM
   V/HnmAOZ0mLXVaQ3FGfEeSgn19Qe8QrY4CZ9e2H2h6lBLdCQi+Sn0CuJ3
   9ieao9noxxwsCHgaHAwkxsVoP9g+mKQeep/WcmDr+RR92vTN5QokcDYf7
   FnApCnBHTXpGNzStF2XRW9umcGm17FRHzjeTJfIyjRQSix4DlvRR7rhpo
   E58zGb8Hb9lcXZadpc0TzvCJ7omcZOO/YFAnDNCKvaNjI8qRaypbdsMTA
   ntKrUv0zZ1QC5mzcoyMI7wu2quv9FirO56CWe5lTx83UCOIiJicPEEXQq
   A==;
X-CSE-ConnectionGUID: K82mF02xSm2dPv+Ypq+eGQ==
X-CSE-MsgGUID: vERtogOnTAm69wiMAgHXnw==
X-IronPort-AV: E=Sophos;i="6.05,204,1701154800"; 
   d="asc'?scan'208";a="245712682"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2024 03:17:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 03:17:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 19 Jan 2024 03:17:23 -0700
Date: Fri, 19 Jan 2024 10:16:46 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jack
 Zhu <jack.zhu@starfivetech.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: media: starfive: Match driver and
 yaml property names
Message-ID: <20240119-despair-festival-59ab2d4d896b@wendy>
References: <20240119100639.84029-1-changhuang.liang@starfivetech.com>
 <20240119100639.84029-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240119100639.84029-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_021727_083010_655562F7 
X-CRM114-Status: GOOD (  17.54  )
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
Content-Type: multipart/mixed; boundary="===============3889778158679416803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3889778158679416803==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BFH1MedVdG7X979+"
Content-Disposition: inline

--BFH1MedVdG7X979+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 02:06:38AM -0800, Changhuang Liang wrote:
> Drop some unused properties for clocks, resets and interrupts for
> StarFive JH7110 camera subsystem.

What do you mean "unused"?

Do these clocks etc exist but are not used by the driver?

Or do they not exist at all?

The two are very different!

Thanks,
Conor.

>=20
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reviewed-by: Jack Zhu <jack.zhu@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/media/starfive,jh7110-camss.yaml | 31 +++++--------------
>  1 file changed, 8 insertions(+), 23 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/starfive,jh7110-cams=
s.yaml b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> index c66586d90fa2..2504381058b3 100644
> --- a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/media/starfive,jh7110-camss.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Starfive SoC CAMSS ISP
> +title: StarFive SoC CAMSS ISP
> =20
>  maintainers:
>    - Jack Zhu <jack.zhu@starfivetech.com>
>    - Changhuang Liang <changhuang.liang@starfivetech.com>
> =20
>  description:
> -  The Starfive CAMSS ISP is a Camera interface for Starfive JH7110 SoC. =
It
> +  The StarFive CAMSS ISP is a Camera interface for StarFive JH7110 SoC. =
It
>    consists of a VIN controller (Video In Controller, a top-level control=
 unit)
>    and an ISP.
> =20
> @@ -28,26 +28,21 @@ properties:
>        - const: isp
> =20
>    clocks:
> -    maxItems: 7
> +    maxItems: 3
> =20
>    clock-names:
>      items:
> -      - const: apb_func
>        - const: wrapper_clk_c
> -      - const: dvp_inv
> -      - const: axiwr
> -      - const: mipi_rx0_pxl
>        - const: ispcore_2x
>        - const: isp_axi
> =20
>    resets:
> -    maxItems: 6
> +    maxItems: 5
> =20
>    reset-names:
>      items:
>        - const: wrapper_p
>        - const: wrapper_c
> -      - const: axird
>        - const: axiwr
>        - const: isp_top_n
>        - const: isp_top_axi
> @@ -57,7 +52,7 @@ properties:
>        - description: JH7110 ISP Power Domain Switch Controller.
> =20
>    interrupts:
> -    maxItems: 4
> +    maxItems: 3
> =20
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -125,34 +120,24 @@ examples:
>          reg =3D <0x19840000 0x10000>,
>                <0x19870000 0x30000>;
>          reg-names =3D "syscon", "isp";
> -        clocks =3D <&ispcrg 0>,
> -                 <&ispcrg 13>,
> -                 <&ispcrg 2>,
> -                 <&ispcrg 12>,
> -                 <&ispcrg 1>,
> +        clocks =3D <&ispcrg 13>,
>                   <&syscrg 51>,
>                   <&syscrg 52>;
> -        clock-names =3D "apb_func",
> -                      "wrapper_clk_c",
> -                      "dvp_inv",
> -                      "axiwr",
> -                      "mipi_rx0_pxl",
> +        clock-names =3D "wrapper_clk_c",
>                        "ispcore_2x",
>                        "isp_axi";
>          resets =3D <&ispcrg 0>,
>                   <&ispcrg 1>,
> -                 <&ispcrg 10>,
>                   <&ispcrg 11>,
>                   <&syscrg 41>,
>                   <&syscrg 42>;
>          reset-names =3D "wrapper_p",
>                        "wrapper_c",
> -                      "axird",
>                        "axiwr",
>                        "isp_top_n",
>                        "isp_top_axi";
>          power-domains =3D <&pwrc 5>;
> -        interrupts =3D <92>, <87>, <88>, <90>;
> +        interrupts =3D <92>, <87>, <90>;
> =20
>          ports {
>              #address-cells =3D <1>;
> --=20
> 2.25.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--BFH1MedVdG7X979+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZapMDgAKCRB4tDGHoIJi
0lzdAP0XhGNQY1wQcLpLFfEc/Sj9meIVrA/jD1GxiMXgdQqWnQD/QUG80+qLfwIm
6Glfk4ikQIoSAIG9e230u0TETuQEkQg=
=ngD+
-----END PGP SIGNATURE-----

--BFH1MedVdG7X979+--


--===============3889778158679416803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3889778158679416803==--

