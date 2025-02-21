Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F22C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmYPD1cy5kET990pMVg4rI2LQVJo+5qYqBcoOJ59L7U=; b=yirH4qoWb32FoX5Z7llP28IIEh
	hCvhv+QKC9ItAu71lUo+0z7O+rRnlo4V+v4lbfmnNrUZ3Yr8auJDv6waBlhlyNQqC6Ju+CWSBGrT6
	LdbxOaaOnA4qc2iu/wgYgJfC93ttGRtAnUM90tZ40qlXh8JsvmvudZFG1f3O9NlsPmtXeq6Tr+E/X
	giORz/lcbQ8JQFEiRJpXf2jMaGZ3tkNVkrvKWCa8PmCY4Vg6YyKbK/J3AQB5xzAtWQ+NRg7zzSCEP
	JTvFb4n1qkqX+qHAuf8Cy2OiLjHgvfgxK2MVtScqTdEw0tbmi7JVdLbvraFYd95k5+7l4HNIQHiTA
	qvcr5mYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWWZ-00000006JoX-0prX;
	Fri, 21 Feb 2025 17:09:15 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWPM-00000006I6X-2vcf
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 17:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4A3361535;
	Fri, 21 Feb 2025 17:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0ECC4CED6;
	Fri, 21 Feb 2025 17:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740157307;
	bh=Nm2OwrU5Opm62TA7+IMK61wEIcI9SxvvGpqljE9y1TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7y4Lsqx4BYbpTnKHQfGDsoec/J3KB9jvHrvPrk2znKHh4QoRv/ohDcuGZKcgHyYq
	 kk/nzq1fSotL4bLoISg5r5+1AVKCAaMhVgzj7iQg1OmH0dDK5QQdv2vpE+S1kkujuL
	 oQWthL3n2/N8rUDLQBmh+6ytxEPUtvdanuzY+NJeZIVsbyhfnYOaowGQNM8sC4FFnR
	 apgRSuoq81/o2/uO2m1txPtgolTFtgoTPTBKNMFV13LhfbstNFqtU5rROENANe0kwj
	 khg5ncLk29/73De+NbI49b4PQUMnHqWHgZTKoda+BjzsXM2h+MLKjyKn/FzdInCbPW
	 +yMZJ6Ql+GhYQ==
Date: Fri, 21 Feb 2025 17:01:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Message-ID: <20250221-cavalier-cramp-6235d4348013@spud>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250221013758.370936-2-inochiama@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7756086483816889188=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7756086483816889188==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MwJINKVsaBRPsMGS"
Content-Disposition: inline


--MwJINKVsaBRPsMGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> The pcie controller on the SG2044 is designware based with
> custom app registers.
>=20
> Add binding document for SG2044 PCIe host controller.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-p=
cie.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yam=
l b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> new file mode 100644
> index 000000000000..040dabe905e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +description: |+
> +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys Desig=
nWare
> +  PCIe IP and thus inherits all the common properties defined in
> +  snps,dw-pcie.yaml.
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2044-pcie
> +
> +  reg:
> +    items:
> +      - description: Data Bus Interface (DBI) registers
> +      - description: iATU registers
> +      - description: Config registers
> +      - description: Sophgo designed configuration registers
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: atu
> +      - const: config
> +      - const: app
> +
> +  clocks:
> +    items:
> +      - description: core clk
> +
> +  clock-names:
> +    items:
> +      - const: core
> +
> +  dma-coherent: true

Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
used to indicate systems/devices that are not.

Cheers,
Conor.

> +
> +  interrupt-controller:
> +    description: Interrupt controller node for handling legacy PCI inter=
rupts.
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        const: 0
> +
> +      "#interrupt-cells":
> +        const: 1
> +
> +      interrupt-controller: true
> +
> +      interrupts:
> +        items:
> +          - description: combined legacy interrupt
> +
> +    required:
> +      - "#address-cells"
> +      - "#interrupt-cells"
> +      - interrupt-controller
> +      - interrupts
> +
> +    additionalProperties: false
> +
> +  msi-parent: true
> +
> +  ranges:
> +    maxItems: 5
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      pcie@6c00400000 {
> +        compatible =3D "sophgo,sg2044-pcie";
> +        reg =3D <0x6c 0x00400000 0x0 0x00001000>,
> +              <0x6c 0x00700000 0x0 0x00004000>,
> +              <0x40 0x00000000 0x0 0x00001000>,
> +              <0x6c 0x00780c00 0x0 0x00000400>;
> +        reg-names =3D "dbi", "atu", "config", "app";
> +        #address-cells =3D <3>;
> +        #size-cells =3D <2>;
> +        bus-range =3D <0x00 0xff>;
> +        clocks =3D <&clk 0>;
> +        clock-names =3D "core";
> +        device_type =3D "pci";
> +        dma-coherent;
> +        linux,pci-domain =3D <0>;
> +        msi-parent =3D <&msi>;
> +        ranges =3D <0x01000000 0x0  0x00000000  0x40 0x10000000  0x0 0x0=
0200000>,
> +                 <0x42000000 0x0  0x00000000  0x0  0x00000000  0x0 0x040=
00000>,
> +                 <0x02000000 0x0  0x04000000  0x0  0x04000000  0x0 0x040=
00000>,
> +                 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x000=
00000>,
> +                 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x000=
00000>;
> +
> +        interrupt-controller {
> +          #address-cells =3D <0>;
> +          #interrupt-cells =3D <1>;
> +          interrupt-controller;
> +          interrupt-parent =3D <&intc>;
> +          interrupts =3D <64 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +      };
> +    };
> +...
> --=20
> 2.48.1
>=20

--MwJINKVsaBRPsMGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7ixdQAKCRB4tDGHoIJi
0r5bAQD2/xgf2z2mj+PfULdLhil9ssspRZH13YmMyPGC5sanWQD9F/3QXeB0ciDz
5QbRlfDz98HUAUow/IaPa38AV/IlggU=
=WAPh
-----END PGP SIGNATURE-----

--MwJINKVsaBRPsMGS--


--===============7756086483816889188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7756086483816889188==--

