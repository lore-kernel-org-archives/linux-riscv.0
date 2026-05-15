Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFD4CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6fPtsTT5KFOJScfREfR6Z25aQH4N3guZKheW+E7dRY=; b=Um2Kmj0IMpWFdQkc2K5TfuYyoG
	Q4FWPqwYz0T4h/VUEXczSlcMqO5uxu+3jFzc4mELHT+1sRtIq6asClJjZuZMmtBjDirq6WJkXO9qv
	iQiPx7V7/K5Jg3F+vk4EigtXB/CQmvC/EhcnIuPtmbaqWzMLi1k0B6Sad9zEIIwUNmzVLMcPItW5O
	8su2pynxDfx/GMUe6htSYKl675fVhDDhuogJCMiCoriYv5oBL/VO4An0KT1kH3t8AWH5rnvHgcevV
	KtoCOhLmoludaXZ1PFR47cPgDXpiDnys23TrtwmF+fsJ+w1j7cB5qYNxPw0x8kbf0N4tnVpd0DfZS
	unGFtkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpTQ-00000007zpX-0FzI;
	Fri, 15 May 2026 10:08:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpTN-00000007zp2-2ds9
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778839729; x=1810375729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=68cBE+E7krc/yQQ7bawOf+XK6T02GAKG9lPaqwKTlQM=;
  b=F4IiFjtjphoI59rXCIB6PCg1d47qu5/QYOu55iDEr971GuBK/jSAk4PJ
   8TPMc2WH0z+5tvqn4IaWZIqoTtIIkAN7Ad2xND+RLJtdgOBllPmZotlyt
   +4nqrwr2NP+frSf6toecvTBKHauDKO1zJemy/YMXzOGAVWaiVwoysBhGy
   Xum/EsdNOSubgFB/wC1Vo9FOEVKGmOMGVOGbRKaF38F337o87YqgyfvUU
   6mzxleh8vZcdsHjZxyyYZeWnBJk/IOA3LC+/Sw6bBZS0avgtOPV5QGPFQ
   HCyT9gHsDLeaRLfmK9hVK8sjPgj3Bt4qC9/NuAl0gjGromFx/Y3er+9iO
   g==;
X-CSE-ConnectionGUID: MwkWFtK8Tc6INnEjCwjUfQ==
X-CSE-MsgGUID: fet69JvFQE2z7lxPetrrqg==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="66243734"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 03:08:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 03:08:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:08:44 -0700
Date: Fri, 15 May 2026 11:08:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Wang <wangjia@ultrarisc.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Conor Dooley
	<conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add UltraRISC DP1000 bindings
Message-ID: <20260515-cyclic-frequency-50d690821af1@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-3-bf559589ea8a@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-3-bf559589ea8a@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_030849_679539_783C2C3F 
X-CRM114-Status: GOOD (  16.81  )
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
Content-Type: multipart/mixed; boundary="===============1364868181377175849=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1364868181377175849==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aCKnMLL/2dELPqOT"
Content-Disposition: inline

--aCKnMLL/2dELPqOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 09:17:59AM +0800, Jia Wang wrote:
> Add DT binding documentation for the UltraRISC DP1000 SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../devicetree/bindings/riscv/ultrarisc.yaml       | 27 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  6 +++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Doc=
umentation/devicetree/bindings/riscv/ultrarisc.yaml
> new file mode 100644
> index 000000000000..d4421c2ef945
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC SoC-based boards
> +
> +maintainers:
> +  - Jia Wang <wangjia@ultrarisc.com>
> +
> +description:
> +  UltraRISC DP1000 SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rongda,m0
> +              - milkv,titan
> +          - const: ultrarisc,dp1000
> +
> +additionalProperties: true
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a386..5bf971ff48b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23082,6 +23082,12 @@ F:	include/dt-bindings/power/thead,th1520-power.h
>  F:	include/dt-bindings/reset/thead,th1520-reset.h
>  F:	include/linux/firmware/thead/thead,th1520-aon.h
> =20
> +RISC-V ULTRARISC SoC SUPPORT
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained

You work for ultrasoc, probably this should be "Supported".

> +F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml

There's no git tree here where patches for the platform will be applied
before sending them on to the SoC maintainers. Are you expecting me to
apply patches for this platform?

> +
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
>=20
> --=20
> 2.34.1
>=20

--aCKnMLL/2dELPqOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbwhgAKCRB4tDGHoIJi
0vFDAP9/U7yDOql0mWJq913tte1U4UXAD3DS6B2k8IWw8F+SCwD/dop+0s4Rw7tn
F9b4uZN0qNakBefohN5nlJh9V09ADAA=
=Nrlh
-----END PGP SIGNATURE-----

--aCKnMLL/2dELPqOT--


--===============1364868181377175849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1364868181377175849==--

