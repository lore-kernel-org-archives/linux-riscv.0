Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770D0C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGtk35zzs0ayab/S4rB3oghXelUh9wcPkRL5dIO4n6k=; b=H+3qWyRb5zBPgboaEXIpms1T7Z
	NU5D2qu6DGIArodFumV/SzIsn2hwyBwnaPG6S1NFs8BBHxY5qNalSQxULGx9r8RICfbN3i/Mdv4o1
	IJPFZ3NWBRHoy/ruEjctUHGm/As+dhB74wHI6WaeHikwxRW4TUAkzt80BVEbXtIkHXxcM2dVmmjVy
	Pxkg7wbQiNUFrI5qUgpLGsFjSya7IqVDDowAC4Ws1xDrUetiadkn35oO0pnWtmJvSTs2wRimpck4x
	MZhi7V9fQMwduFlrhknnal4XMkSknYpeac4v9BCGSuV75GN8p2QU+7vAEOZvDzdrFs7+alaGcYbKg
	+R6fyn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmX4-00000002pKw-1Hyg;
	Tue, 13 Aug 2024 08:05:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmX1-00000002pJi-0FUM;
	Tue, 13 Aug 2024 08:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1723536327; x=1755072327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FIdrhg5f7gPL8C52+sglRjEBy/cZyurxJLuVYrykLcs=;
  b=RB3d2yLbThduvkdDJ5sbV4QRVz9fMvHpAG97JkS+plDK1+RxinMgSGLd
   GpQ7GuBDlKSN3ZzWZ23FZRpm1GZYtmRHXYVwogV1wkT3iCeMBwrAVA/Mp
   fHk7mCVKsZ4Txd5iAcGFCl7Ly7hGXQu4MkF6qAz7BEX+FVAEF2VJz78X7
   nIm7hgHZHs4fog8z3s4V06rITNMefxwMzDmildW9CN60tLo+LCa/QJreM
   m6cZX4HSAJ9CyDL4xUV4ndJqg3DTDf4ch47nFcQAYSWx++G/OUC3CZBMq
   W/KqcuGvWeBedYWFGW7RjRfq1JCC0lUJ8pJ3N02d0ULidxfIZJy+lGGyE
   A==;
X-CSE-ConnectionGUID: oFI4QnJZT5WrEkZVyaQ1bA==
X-CSE-MsgGUID: HZzKbVx5Sh+M+65LtEXbHA==
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="asc'?scan'208";a="197845690"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 01:05:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Aug 2024 01:04:57 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 13 Aug 2024 01:04:55 -0700
Date: Tue, 13 Aug 2024 09:04:17 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: Conor Dooley <conor@kernel.org>, Minda Chen <minda.chen@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: jh7110-usb-phy: Add sys-syscon
 property
Message-ID: <20240813-haiku-pusher-f2fb037a2f49@wendy>
References: <cover.1723472153.git.jan.kiszka@siemens.com>
 <30f3ca9f6bd788e16767b36aa22c0e9dc4d1c6a4.1723472153.git.jan.kiszka@siemens.com>
 <20240812-overstuff-skirt-7a8aabbcdc6f@spud>
 <8cdba8b0-7364-4c09-b18a-f3f59da1eae2@siemens.com>
MIME-Version: 1.0
In-Reply-To: <8cdba8b0-7364-4c09-b18a-f3f59da1eae2@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_010527_205005_E6BA7E96 
X-CRM114-Status: GOOD (  25.79  )
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
Content-Type: multipart/mixed; boundary="===============2711612725315175545=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2711612725315175545==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4yclWa1Vx5GaX1/H"
Content-Disposition: inline

--4yclWa1Vx5GaX1/H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 07:31:50AM +0200, Jan Kiszka wrote:
> On 12.08.24 17:55, Conor Dooley wrote:
> > On Mon, Aug 12, 2024 at 04:15:51PM +0200, Jan Kiszka wrote:
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> Analogously to the PCI PHY, access to sys_syscon is needed to connect
> >> the USB PHY to its controller.
> >>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >> ---
> >> CC: Rob Herring <robh@kernel.org>
> >> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >> CC: Conor Dooley <conor+dt@kernel.org>
> >> ---
> >>  .../bindings/phy/starfive,jh7110-usb-phy.yaml         | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb=
-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.y=
aml
> >> index 269e9f9f12b6..eaf0050c6f17 100644
> >> --- a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.ya=
ml
> >> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.ya=
ml
> >> @@ -19,6 +19,16 @@ properties:
> >>    "#phy-cells":
> >>      const: 0
> >> =20
> >> +  starfive,sys-syscon:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    items:
> >> +      - items:
> >> +          - description: phandle to System Register Controller sys_sy=
scon node.
> >> +          - description: PHY connect offset of SYS_SYSCONSAIF__SYSCFG=
 register for USB PHY.
> >=20
> > Why is having a new property for this required? The devicetree only has
> > a single usb phy, so isn't it sufficient to look up the syscon by
> > compatible, rather than via phandle + offset?
> >=20
>=20
> I didn't design this, I just copied it from
> starfive,jh7110-pcie-phy.yaml. As that already exists, I'm neither sure
> we want to change that anymore nor deviate in the pattern here.

To be honest, I think some of the other users of phandle + offset on
this soc were just copy-pasted without thinking about whether or not they
were required too. This one seems like it should just be a lookup by
compatible in the driver instead of by phandle. As a bonus, it will work
with existing devicetrees - whereas your current implementation will
fail to probe on systems that have the old devicetree, a regression for
systems running with that devicetree and downstream firmware.

Cheers,
Conor.

> Jan
>=20
> >> +    description:
> >> +      The phandle to System Register Controller syscon node and the P=
HY connect offset
> >> +      of SYS_SYSCONSAIF__SYSCFG register. Connect PHY to USB controll=
er.
> >> +
> >>    clocks:
> >>      items:
> >>        - description: PHY 125m
> >> @@ -47,4 +57,5 @@ examples:
> >>                   <&stgcrg 6>;
> >>          clock-names =3D "125m", "app_125m";
> >>          #phy-cells =3D <0>;
> >> +        starfive,sys-syscon =3D <&sys_syscon 0x18>;
> >>      };
> >> --=20
> >> 2.43.0
> >>
>=20
> --=20
> Siemens AG, Technology
> Linux Expert Center
>=20

--4yclWa1Vx5GaX1/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrsTdQAKCRB4tDGHoIJi
0qFLAP9V1J8PxI9x0hWQY9Q7/h1oGpyntcEVazVyrJCTuLV1iwEAgBTmAnTv+AkD
7ty2V6D+iyeVdmYHbEWBlDVrNlDeKA0=
=cWfz
-----END PGP SIGNATURE-----

--4yclWa1Vx5GaX1/H--


--===============2711612725315175545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2711612725315175545==--

