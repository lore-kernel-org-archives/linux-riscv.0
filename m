Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F388C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qHx+ENTmPkx+JPrLJNP3J7w74/BohShLFZx8RPmoyY=; b=TNARWcqmB183naP0yxiU03O0Po
	GOFEvpDOHVRr32DlG2mBuN7RUMxpqIm7xmMpxlV8fQguK+rpmxGUDkHeHElPx/36G8SkMnXHSUMQC
	JRMGcQujOLY2AfbTzWY5BIHygQ+md/G4S0MdbFW+QxwRT1JLWxc24WtAnjN3hRcDC7+MDYQBk7uOF
	NiRg+bCPoSZl8IWXIH7ScWlJUZL6A5z9frD41be+AKQ7uHfl/UyprOzS6zTfVuWA80VI3nZY/9y9+
	vCOvUNfaTG01lIRwkXFmGdKg0No3YYqnu4U2Wg7ENSblXP1HAqp7B6E+YHufOLTKgSo7+aWCtOqRl
	N06YGj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXOd-00000000oMK-1pqV;
	Mon, 12 Aug 2024 15:55:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXOZ-00000000oLm-3Jki;
	Mon, 12 Aug 2024 15:55:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1544960FC7;
	Mon, 12 Aug 2024 15:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6098DC32782;
	Mon, 12 Aug 2024 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723478142;
	bh=fIxgfU9U7UdKHCzgTt5JxPxYSDRiI+jpNpkMi6cCmNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3mgSpRiCH/hfVz2HIjVM3C3Yq1lKI/jniZJcW7Ur61Ag1fqi65ipjx2ct84DMI7M
	 ysFCCNySYeQc9/SjndDB+u/vUZB6yel/3PTpuALkdKCzgb4fEN+R4JpiF47QioSeDx
	 q6hQE6XJuufABIB5Cyn/PVzhgYEyCxcpi8w73daUvRcKkqS+mhH0QCfPlsLZ70vXxU
	 1maqNbGWxk3KsNl93e3FEmNsxc/oM6locRh/VSratxEfDtPff5xHOOblWkXV1nLL82
	 JFWjibQXr6QkjDKkLp5iLrFxtvilJGf/NEtL1Zakmnt3L2hh5WyJ0Sx07x7rOmUZfs
	 QkQN7t4vp1Idw==
Date: Mon, 12 Aug 2024 16:55:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Minda Chen <minda.chen@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: jh7110-usb-phy: Add sys-syscon
 property
Message-ID: <20240812-overstuff-skirt-7a8aabbcdc6f@spud>
References: <cover.1723472153.git.jan.kiszka@siemens.com>
 <30f3ca9f6bd788e16767b36aa22c0e9dc4d1c6a4.1723472153.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
In-Reply-To: <30f3ca9f6bd788e16767b36aa22c0e9dc4d1c6a4.1723472153.git.jan.kiszka@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_085543_956461_1DFF2F6D 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Type: multipart/mixed; boundary="===============7283861833077739337=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7283861833077739337==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LtVVHt/+tPGAV+JK"
Content-Disposition: inline


--LtVVHt/+tPGAV+JK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 04:15:51PM +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>=20
> Analogously to the PCI PHY, access to sys_syscon is needed to connect
> the USB PHY to its controller.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> ---
>  .../bindings/phy/starfive,jh7110-usb-phy.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-ph=
y.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> index 269e9f9f12b6..eaf0050c6f17 100644
> --- a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> @@ -19,6 +19,16 @@ properties:
>    "#phy-cells":
>      const: 0
> =20
> +  starfive,sys-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to System Register Controller sys_sysco=
n node.
> +          - description: PHY connect offset of SYS_SYSCONSAIF__SYSCFG re=
gister for USB PHY.

Why is having a new property for this required? The devicetree only has
a single usb phy, so isn't it sufficient to look up the syscon by
compatible, rather than via phandle + offset?

> +    description:
> +      The phandle to System Register Controller syscon node and the PHY =
connect offset
> +      of SYS_SYSCONSAIF__SYSCFG register. Connect PHY to USB controller.
> +
>    clocks:
>      items:
>        - description: PHY 125m
> @@ -47,4 +57,5 @@ examples:
>                   <&stgcrg 6>;
>          clock-names =3D "125m", "app_125m";
>          #phy-cells =3D <0>;
> +        starfive,sys-syscon =3D <&sys_syscon 0x18>;
>      };
> --=20
> 2.43.0
>=20

--LtVVHt/+tPGAV+JK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrowegAKCRB4tDGHoIJi
0gXFAP9irfiKqj3CaOoVEdmxFBQbHAu8wbJBdmXuGodai0OMaQEAp0i//vC20L1l
o+8FpvJ1Mt/ZC28yMFhDKZtipTS5rgc=
=rBq+
-----END PGP SIGNATURE-----

--LtVVHt/+tPGAV+JK--


--===============7283861833077739337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7283861833077739337==--

