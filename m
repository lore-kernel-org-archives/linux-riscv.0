Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178F6CCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ERoCHXfYCTQEbSKONOnOx9Pt7QHL+tUlppdx6KiKMU=; b=lY0s2qIkqHwYw2RE/cWIP7EEUm
	gj0wbL6woCKgcTUWXL3NgzDCIqsiCFNZmbav5NEmk4nWYa8bkTA+aLXDDddkURVbjbaR4NrMeAH9m
	CKtu6WvTH7ZKv+c85S2/0i72snojmn8Gma/XL7K09oHSuIp1sCJ+mfKtQfECDWNrlQx7F8vAMskhX
	NMS0cXV9VoV5j2r8ig3jZ6GqANfLGfN7p6ybMyPdpvNW7s4BzKc+sxAN/jk5L8KJaW3YsEml7yi28
	JtZsCRfMrmois/I3mcJzB9iZ5XgZbtlNNrxNy0lspQ+1NMFr5Hx5ktBc1tRmkk7suRFm9iSyM3CY2
	FCD6wm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKxG-0000000A1vH-4AGR;
	Fri, 24 Oct 2025 16:47:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKxG-0000000A1un-257P
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 16:47:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E232D6042D;
	Fri, 24 Oct 2025 16:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6063AC4CEF1;
	Fri, 24 Oct 2025 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761324473;
	bh=2J2a852hu4Ko8dTkG+XS6Wfc56X851XsTvUBBXYgN7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWycwC4EqIWFTE4zd9Wg/dQr53+HnDPp91iV+iCNqD+M+ZSe4hj/Vjx2Sy7Qnqjm6
	 0xZyD0YZ/bpvqaHZlKRmvMdXIzvt2gnGWfuZmxojGeFeUZ0nsbcjLOLXinzDwaVlV5
	 LpGJ5Eb/J1Bd5l9O6ltZgabZllZqjEogcnf4CiPR34XxDiB8dPaOjOGphouhZDKPoX
	 9QF+h80JrtBfL12HAuOMS2RNds5PmKlOzSGqLbwThVOI0HeddO4mEmqlV4zNgVJlp5
	 e/XrdRg06U9A4YQbTVxTVWE2itMKVIDc6LUbN/I6UEKCh9veLNEmwpjS8hvUxQvkQ4
	 X74gsbROMZR0A==
Date: Fri, 24 Oct 2025 17:47:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20251024-universe-undertake-8ff51d27d2cb@spud>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
MIME-Version: 1.0
In-Reply-To: <20251024-hangout-designing-33e96c0d35fc@spud>
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
Content-Type: multipart/mixed; boundary="===============4834428418876332551=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4834428418876332551==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jmi8IxbuvN49Htrp"
Content-Disposition: inline


--Jmi8IxbuvN49Htrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:
> On Fri, Oct 24, 2025 at 11:05:14AM +0800, Longbin Li wrote:
> > The Sophgo CV1800/SG2000 SoC top misc system controller provides regist=
er
>=20
> Please remind me how it works, sg2000 is just a rebadge and really this
> just refers to one device?
>=20
> > access to configure related modules. It includes a usb2 phy and a dma
> > multiplexer.
> >=20
> > Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo=
,cv1800b-top-syscon.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800=
b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1=
800b-top-syscon.yaml
> > new file mode 100644
> > index 000000000000..d044ca661fa2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-s=
yscon.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-sysco=
n.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV18XX/SG200X SoC top system controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +description:
> > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > +  register access to configure related modules.
>=20
> Here and in the title you have Xs, are those placeholder or is this
> going into cv180x.dtsi and going to be used on multiple devices?

nvm, I read the next patch. It's going into cv180x.dtsi.

> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,cv1800b-top-syscon
> > +          - const: syscon
> > +          - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
>=20
> Do you actually use ranges?
>=20
> > +patternProperties:
> > +  "dma-router@[0-9a-f]+$":
>=20
> Do these actually appear at variable addresses, or is it always 48 for
> the phy and 53 for the dma router?
>=20
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  "phy@[0-9a-f]+$":
> > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > +
> > +    syscon@3000000 {
> > +      compatible =3D "sophgo,cv1800b-top-syscon", "syscon", "simple-mf=
d";
> > +      reg =3D <0x03000000 0x1000>;
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <1>;
> > +
> > +      usbphy: phy@48 {
>=20
> Drop the labels off of these two, since they're unused in the example.
>=20
> > +        compatible =3D "sophgo,cv1800b-usb2-phy";
> > +        reg =3D <0x48 0x4>;
> > +        #phy-cells =3D <0>;
> > +        clocks =3D <&clk CLK_USB_125M>,
> > +                 <&clk CLK_USB_33K>,
> > +                 <&clk CLK_USB_12M>;
> > +        clock-names =3D "app", "stb", "lpm";
> > +        resets =3D <&rst 58>;
> > +      };
> > +
> > +      dmamux: dma-router@154 {
> > +        compatible =3D "sophgo,cv1800b-dmamux";
> > +        reg =3D <0x154 0x8>, <0x298 0x4>;
> > +        #dma-cells =3D <2>;
> > +        dma-masters =3D <&dmac>;
> > +      };
> > +    };
> > +
> > +...
> > --
> > 2.51.0



--Jmi8IxbuvN49Htrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPutswAKCRB4tDGHoIJi
0lGwAP47xVvM618ptskQQ8AFSpS1Gnoy0H4wGzkhpMsfmwbe9AEA9WivaOXdnATU
TX4YAn8naPW6b0nriANROCXT+i0kcQA=
=ffVH
-----END PGP SIGNATURE-----

--Jmi8IxbuvN49Htrp--


--===============4834428418876332551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4834428418876332551==--

