Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CF4C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vX6w2Rm6NUBg/PGR+eJMqSOHblg+IoZdvlLq5qQ46s=; b=iouywWIziL2P3MjljACb+Nh+Vs
	750Tfw4bq3VZ70uZWqUZxO1HJJE5UtYSm3qC9TMic01dTgi9nHw7+arfe87HSagvNRIIyYlVZvXv+
	xInx+MVWUULRt/xiNk9phJ+sD75Q0gopECEbq622JbrThiV00nTGfTzEcJo3iBctbxHzWwp69yijL
	LhS3f1lgkmdTnDs/9OykQocetSYgGBbOjrVYnw9geXiAtmO+KC2oro6Hbsk8gTHjD63gqpo9DUJGE
	CqWprh8H+0/Czb844FM3UgeOibPhpdKspTxWm5gGJudQ6TKXqjWYXmRS1ep0nbu3HUEVeNHHBtYFC
	1Euhgx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsE-0000000EM1F-2EVO;
	Thu, 12 Jun 2025 19:46:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkSt-0000000Du4z-1ZS3;
	Thu, 12 Jun 2025 16:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 315E25C671D;
	Thu, 12 Jun 2025 16:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC20C4CEEA;
	Thu, 12 Jun 2025 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749744462;
	bh=U2fEccG9fwLvIRudQJWjcfVnqPecNc7cIYAnmbd9khA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEh3gMA+uqltfgyJQaJ90yWpKwGTygJsPr0O9fMOzml4JNjs87T06CgqshJcmeK2a
	 cR4rjIe2FUgOnMr7zcc4JULd1LTSgJdCmkTLzK0X8MhEy54PZZcTcO/W77Snrv9TAF
	 9jjbS3IrliMLjb1gBPawNk57SFosgtvTcfV/pUX81mHnson4FtH3k/D3anOyqOQTdI
	 tPOt1qpl894jqeGcBNZWQzyR0Zf/3LOnh26KTMCIGHm1+ymHK31BrfWy97HNfprnb1
	 PvYzNT8C0/5IDjb8GOKphXcGP+c4OHWz65CuE33bnZpsPCqmXSH6JZX0H2PEqk92Pk
	 NT4uu25RTCEwg==
Date: Thu, 12 Jun 2025 17:07:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <20250612-siesta-verbalize-6a7768ebc648@spud>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250611081804.1196397-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_090743_488749_CF36B3E4 
X-CRM114-Status: GOOD (  18.78  )
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
Content-Type: multipart/mixed; boundary="===============5746389130814321388=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5746389130814321388==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TJu6QFbeFePgDQPv"
Content-Disposition: inline


--TJu6QFbeFePgDQPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> "VBUS_DET" to get the right operation mode. If this pin is not
> connected, it only supports setting the mode manually.
>=20
> Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

I'm having a bit of trouble finding the v3 etc, could you provide a
link?
I think what is here is sane, but I want to make sure that review
comments on previous versions have been addressed. "dfn:" searches for
both driver and binding filenames turned up nothing.

> ---
>  .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-=
usb2-phy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-ph=
y.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
> new file mode 100644
> index 000000000000..2ff8f85d0282
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV18XX/SG200X USB 2.0 PHY
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-usb2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: PHY app clock
> +      - description: PHY stb clock
> +      - description: PHY lpm clock
> +
> +  clock-names:
> +    items:
> +      - const: app
> +      - const: stb
> +      - const: lpm
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@48 {
> +      compatible =3D "sophgo,cv1800b-usb2-phy";
> +      reg =3D <0x48 0x4>;
> +      #phy-cells =3D <0>;
> +      clocks =3D <&clk 93>, <&clk 94>, <&clk 95>;
> +      clock-names =3D "app", "stb", "lpm";
> +      resets =3D <&rst 58>;
> +    };
> --=20
> 2.49.0
>=20

--TJu6QFbeFePgDQPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr7SQAKCRB4tDGHoIJi
0pktAP9VMMOkhXJg21RuCXXueBhHqnv5XmapThudPFOJGbmUdAEAvW5JBZ8R4b+W
fK8JZ5b3IEgK+NyZ4wGFRnCQlzB1Pg0=
=wnik
-----END PGP SIGNATURE-----

--TJu6QFbeFePgDQPv--


--===============5746389130814321388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5746389130814321388==--

