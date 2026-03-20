Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4BD1099B2C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJTaTMvLdLmqew5jFHGZnE+aggCUyB4Kdv5ZV6SceWY=; b=iNXKcsCGH065Uwl/U/frZA6tDU
	N+tZM/wmtzOEoJXxJrdr/Fb39yngXfgis2YAQTYiJRewzGkOStJjXjnus7IosWiXGzDZluTPgwTgZ
	hDHZk4QoBsD4HD2jFOnPqzs0JtjKmRFATFg8YhHl9kkF94/otzIgm9tW4BeWH902/UdJqKLytn8PF
	0fXiicyjwuk+9bs0VQBOhXFGPJEzJ4v9ua9PIxaP55bzZ2MI7BBJOIV9T64Yd5+zS2aTMvOfayK48
	bcS2DqGj5IRlNl/SFV6S4t3i7u/ignvr66xDmRgDuBlSMcitGvdcOXnk5jVBIVIR607/v/LVGN+Uh
	zsJLMoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dgN-0000000DGDp-2cCt;
	Fri, 20 Mar 2026 17:30:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dgK-0000000DGCH-1CVO
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 17:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEE8640B5A;
	Fri, 20 Mar 2026 17:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98F8C4CEF7;
	Fri, 20 Mar 2026 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027843;
	bh=W4IB0KIghH5BlR6smfsAiYWJPXaF2WzggB/xByUYJXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLV9ebbEeJiBIRsIU6LNMkM0fPKZZgFkx0VF9RBD1vN2HCShG8ZoRTRmha8W9iFwD
	 NEmCARqbZ7qDuS306SS5i1psrb/8RlYsKUsB24PH9KQNgZ82MT0Gez1//M8B3l53QX
	 Q5u35gAUQGowt9ZzSy+yY9NOXHW5yXl+RUqzHH+tsBpdfm4DxF4KKYrwXyLGaHxTQR
	 0Er3a32Kbv7HFD+ZRbvpf222WssTkCTucO+b013KA13Guzp/MuH7iGrjxd7jspXq0t
	 Zxb3MiBB2YH9Jl5Fz2rpdwxwtJSj6peRyHhJLfVkOtL1pxQq7MYIs+J1RGYl8a/QrE
	 Zdt4pVQmnM71g==
Date: Fri, 20 Mar 2026 17:30:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: dwc3: spacemit: add support for
 K3 SoC
Message-ID: <20260320-rival-distill-c9021491769a@spud>
References: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
 <20260320-02-k3-usb20-support-v2-1-308ea0e44038@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260320-02-k3-usb20-support-v2-1-308ea0e44038@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_103045_538616_072E3FE1 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3936243148277812989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3936243148277812989==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iISLEgBV6Hhio30Z"
Content-Disposition: inline


--iISLEgBV6Hhio30Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 07:15:37AM +0000, Yixun Lan wrote:
> Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
>=20
> The USB2.0 host controller in K3 SoC actually use DWC3 IP but only support
> USB2.0 functionality, thus in the hardware layer, it has only one USB2 PH=
Y.
> While in K1 SoC, the USB controller has both USB2 and USB3 Combo PHY
> connected, but able to work in a reduced USB2.0 mode which requres only
> one USB2 PHY, leaves the USB3 Combo PHY to PCIe controller. So both K1
> and K3 SoC are able to work in the USB2.0 mode which requires one PHY.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iISLEgBV6Hhio30Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2EPgAKCRB4tDGHoIJi
0joxAQC5+AAtgwRmBNAtvgPpwSU6oenwPm4CK2S4y2xpyBIyCwEAlWW9LD7E7Nu0
eRC9bXUrVLtn+AyWk+Qy/EtcHcqKxQs=
=Exu8
-----END PGP SIGNATURE-----

--iISLEgBV6Hhio30Z--


--===============3936243148277812989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3936243148277812989==--

