Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC898C7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4c+uhhqkqIROFcz7q+apn1T2noBRRe2TDn7600wzw8=; b=MK9lrya78KwCTdXQXHxGcyAJ8k
	2/2HWZYKuB6bVMPKM9mdqy0kjU1pG7KOVz1pz1wV1Be147j+SwvY6QW3YDKh3ba0iI0x90KXjaXNr
	1bfdnGIAnOieSPiVT8UNWxPhilznObAxHhhfZxYMCnn/qL8+n/sJTHXR20YAmXVPb45rykZlScvdw
	vymsN8S/hIgEjCAL0nZ8R1KlAB+NfGkjfwJOKZyvHS0zKFA7Bhm5Q79M2gvJrDkP+3GBBUIaOwOmM
	5a76lcnTbG1FkEcwmF0ciO0e/pWn8bl0jEJ8Rehn3h9YAdAjsuL61VjghOSc27KmWjj9mNJ1BXIeA
	ZMdK6EAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dW3-00AiRX-0c;
	Mon, 29 May 2023 14:06:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dVz-00AiQd-2l;
	Mon, 29 May 2023 14:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685369187; x=1716905187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oj08xjCjJcK4RZu6GGaNFs8lH2uffU413/e6mzg154Q=;
  b=gDKoxaxQkMm5Q5neffyLvNN6jUoMj6xgccrg+9yZhhc5QbtZGZAI/PXo
   9IbffV2HPdwK/eTXK/SceFuQ7kF2aYH/TXD+W5N+sUW4owRPSr5uqhmlA
   3D5pKJ0KLtgaMadXX/JppWzXE+QswOto4ts7AMadRK8SSwhyKe0ZiO+I/
   kpZvfXsqXI+Ky/jzp2r9haD/nIYfewDsZeiT7N3IsNma3I0T5CWiG9Xza
   7DJGhS+TaV+hEeTkX3O6AdGbSMF38968Ql5TWKfizfCC8zqeU3GrYMwKW
   YZJeezA9OK/XJYZ3G8pdIozFqaDl3bJgNndCwjy3FrE4Eq+MZgYTlFyVL
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="asc'?scan'208";a="215321454"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2023 07:06:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 29 May 2023 07:06:21 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 29 May 2023 07:06:19 -0700
Date: Mon, 29 May 2023 15:05:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Message-ID: <20230529-envy-itinerary-e4007cb0da9a@wendy>
References: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
 <20230529121503.3544-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230529121503.3544-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_070628_104907_B86F6FC6 
X-CRM114-Status: GOOD (  20.52  )
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
Content-Type: multipart/mixed; boundary="===============1278739575935263862=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1278739575935263862==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0IZZL4P6Vx7CUGNI"
Content-Disposition: inline

--0IZZL4P6Vx7CUGNI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Changhuang,

Couple of minor bits from me here, you don't need to fix them unless
the binding has to change for other reasons.


On Mon, May 29, 2023 at 05:15:01AM -0700, Changhuang Liang wrote:
> StarFive SoCs like the jh7110 use a MIPI D-PHY RX controller based on
> a M31 IP. Add a binding for it.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110=
-dphy-rx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-r=
x.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> new file mode 100644
> index 000000000000..46fd370188e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-dphy-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive SoC MIPI D-PHY Rx Controller

nit: either s/SoC/JH7110/ or s/SoC//.

> +
> +maintainers:
> +  - Jack Zhu <jack.zhu@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The StarFive SoC uses the MIPI CSI D-PHY based on M31 IP to transfer
> +  CSI camera data.

nit: "Starfive SoCs contain a MIPI CSI D-PHY based on an M31 IP, used to
transfer CSI camera data."

> +properties:
> +  compatible:
> +    const: starfive,jh7110-dphy-rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: config clock
> +      - description: reference clock
> +      - description: escape mode transmit clock
> +
> +  clock-names:
> +    items:
> +      - const: cfg
> +      - const: ref
> +      - const: tx
> +
> +  resets:
> +    items:
> +      - description: DPHY_HW reset
> +      - description: DPHY_B09_ALWAYS_ON reset

I'd prefer not to have what looks like copy-paste from a datasheet
and instead a description of what they do.

Otherwise, this looks grand to me, but I don't understand the hardware
so there is no point in me leaving an R-b on this.
Hopefully Krzysztof can take a look at it in the coming days.

Thanks,
Conor.

--0IZZL4P6Vx7CUGNI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHSxRAAKCRB4tDGHoIJi
0uvtAPwIaGWkhOsEc9q9vrZcLdTF8G+Fzyihpz5TV/XOaitIyQEAnYHnM944Anto
j60IZxaQ43rxeYAEwWC5DqSoBTwsLAc=
=cggf
-----END PGP SIGNATURE-----

--0IZZL4P6Vx7CUGNI--


--===============1278739575935263862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1278739575935263862==--

