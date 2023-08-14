Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49C3C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFN7v+G/cy8fi4oWFDFa40HZFL6/Tmd4x5RBFDach2M=; b=gvQieG+F67MAAonrw0aaRXHkoh
	w6wbh+8+ou+6gxyhzn6mkSXOZjrc1853pv/5+/7RwfT9BfmErpSOO5xa3qPTzzX+GhGn3AEA42J8m
	KyhK9ywrhfmfSIU/sQGzBfVxDzRbunYNzyY/cGBkz7J/jVn2YlvDB9U3Rhx6DzfUvWHmGcfQJs+m1
	46f/QdKVUTooItYSixg5g+pmvYe4iPv1mdkSA475quhbRqTa9BQtovl+Tbz8DJa+FDUG+G0I8Dk3o
	7sQwYA/fY+2bOWWd9RKErntxaTKAjssF1xj2PrgKfk3Ds4V1VCCmjSSQDgpivqMvdnIbjaBXo3cdx
	WZm2ntYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXU0-00H8nS-2q;
	Mon, 14 Aug 2023 13:19:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXTy-00H8mi-0k
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692019182; x=1723555182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4yeKTYqAjpez7eQcNgoLipzdYDL2hK98LTipXnuNLpI=;
  b=KZPm3clqYpgOEUdUBjXQvCoz8sFWh5ggFy3jgPKXqXC/2/6olCqN2Yg6
   qZbLVJfKvhNxAUmpLqISLOe6uSixObP7ClA3+/yIFZTvofVjTqZo3qTHk
   26iEjDOUgMAHQ4m8/tsUdI4C4f4fDFlJu/nXpxHOEgOy+lRMruzdP9Qfb
   zSnWM+e6SH51ngFTWrHRVLC8GgqW+OfZoFtLTmE8Ba207r9AG1PSuWkoB
   D0diktxtBFSj5KHSmynfpapXPZ6zv9xuMCS7TaOAlf1yjnafLgPz7Ip4Q
   QPbxN040DdW6cZTD81jmzPdTPY3DNsZ99ddGloGIXA9NCCmpX62Z6COII
   g==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="241504570"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 06:19:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 06:19:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 06:19:33 -0700
Date: Mon, 14 Aug 2023 14:18:55 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v3 09/11] dt-bindings: PCI: Add StarFive JH7110 PCIe
 controller
Message-ID: <20230814-ladies-duckbill-953f13b03e71@wendy>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-10-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230814082016.104181-10-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_061942_274560_97BD38DC 
X-CRM114-Status: GOOD (  15.43  )
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
Content-Type: multipart/mixed; boundary="===============1400682595016201085=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1400682595016201085==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sqa5jIzCxeaGhRmV"
Content-Disposition: inline

--Sqa5jIzCxeaGhRmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 04:20:14PM +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller dt-bindings.
> JH7110 using PLDA XpressRICH PCIe host controller IP.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

This looks good to me now, thanks.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../bindings/pci/starfive,jh7110-pcie.yaml    | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/starfive,jh7110=
-pcie.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.y=
aml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> new file mode 100644
> index 000000000000..67151aaa3948
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/starfive,jh7110-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 PCIe host controller
> +
> +maintainers:
> +  - Kevin Xie <kevin.xie@starfivetech.com>
> +
> +allOf:
> +  - $ref: plda,xpressrich3-axi-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-pcie
> +
> +  clocks:
> +    items:
> +      - description: NOC bus clock
> +      - description: Transport layer clock
> +      - description: AXI MST0 clock
> +      - description: APB clock
> +
> +  clock-names:
> +    items:
> +      - const: noc
> +      - const: tl
> +      - const: axi_mst0
> +      - const: apb
> +
> +  resets:
> +    items:
> +      - description: AXI MST0 reset
> +      - description: AXI SLAVE0 reset
> +      - description: AXI SLAVE reset
> +      - description: PCIE BRIDGE reset
> +      - description: PCIE CORE reset
> +      - description: PCIE APB reset
> +
> +  reset-names:
> +    items:
> +      - const: mst0
> +      - const: slv0
> +      - const: slv
> +      - const: brg
> +      - const: core
> +      - const: apb
> +
> +  starfive,stg-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      The phandle to System Register Controller syscon node.
> +
> +  perst-gpios:
> +    description: GPIO controlled connection to PERST# signal
> +    maxItems: 1
> +
> +  phys:
> +    description:
> +      Specified PHY is attached to PCIe controller.
> +    maxItems: 1
> +
> +required:
> +  - clocks
> +  - resets
> +  - starfive,stg-syscon
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        pcie@940000000 {
> +            compatible =3D "starfive,jh7110-pcie";
> +            reg =3D <0x9 0x40000000 0x0 0x10000000>,
> +                  <0x0 0x2b000000 0x0 0x1000000>;
> +            reg-names =3D "cfg", "apb";
> +            #address-cells =3D <3>;
> +            #size-cells =3D <2>;
> +            #interrupt-cells =3D <1>;
> +            device_type =3D "pci";
> +            ranges =3D <0x82000000  0x0 0x30000000  0x0 0x30000000 0x0 0=
x08000000>,
> +                     <0xc3000000  0x9 0x00000000  0x9 0x00000000 0x0 0x4=
0000000>;
> +            starfive,stg-syscon =3D <&stg_syscon>;
> +            bus-range =3D <0x0 0xff>;
> +            interrupt-parent =3D <&plic>;
> +            interrupts =3D <56>;
> +            interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
> +            interrupt-map =3D <0x0 0x0 0x0 0x1 &pcie_intc0 0x1>,
> +                            <0x0 0x0 0x0 0x2 &pcie_intc0 0x2>,
> +                            <0x0 0x0 0x0 0x3 &pcie_intc0 0x3>,
> +                            <0x0 0x0 0x0 0x4 &pcie_intc0 0x4>;
> +            msi-controller;
> +            clocks =3D <&syscrg 86>,
> +                     <&stgcrg 10>,
> +                     <&stgcrg 8>,
> +                     <&stgcrg 9>;
> +            clock-names =3D "noc", "tl", "axi_mst0", "apb";
> +            resets =3D <&stgcrg 11>,
> +                     <&stgcrg 12>,
> +                     <&stgcrg 13>,
> +                     <&stgcrg 14>,
> +                     <&stgcrg 15>,
> +                     <&stgcrg 16>;
> +            perst-gpios =3D <&gpios 26 GPIO_ACTIVE_LOW>;
> +            phys =3D <&pciephy0>;
> +
> +            pcie_intc0: interrupt-controller {
> +                #address-cells =3D <0>;
> +                #interrupt-cells =3D <1>;
> +                interrupt-controller;
> +            };
> +        };
> +    };
> --=20
> 2.17.1
>=20

--Sqa5jIzCxeaGhRmV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNopvgAKCRB4tDGHoIJi
0iSHAQDMRNa7PWUFYKq79mqAOecblr9dEMDz58gNXKX6SU2A5AEA7dPaFdMe0sZv
m5zURgaysbaf4Ap+PX4LTjFyAegQoQI=
=/IdZ
-----END PGP SIGNATURE-----

--Sqa5jIzCxeaGhRmV--


--===============1400682595016201085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1400682595016201085==--

