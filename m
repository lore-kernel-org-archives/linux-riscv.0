Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8157EEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6mZduaEIvsBqm/FmSqowU/vVCKbNL00In7RJI6AYug=; b=iwzjeF70sYzARxbaGGCxddh+z+
	ZREaCce/5/VRcToTzVFf42bZVyagXo1ZbbO73BR5zxyrTb4AGNmoQUpZu16nW0iqwnYuaKV7BlUrV
	6domPd4kv8W8JvOlH9OP0pV8/0kgJJp13G14k5kSCUjt+0AJHnYltTYdCj9B7yvzeJ+ANIiAAvC0o
	PchplGp6hDyqITCuIc5fnQ4OtVkJC6LYFyzVcLwROCvseSy8P0u1v7Fu3hHfrotZNNK2YxPUhWXmG
	C2oHBergD+JS+YILg5QbuQzCuaH9WKJaLo6GD6pQ21RoIegYiPljinaqPBcPgK/Lv6XIcO67MzZbt
	F67t7bag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMRct-00Awyz-1k;
	Thu, 20 Jul 2023 11:15:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMRcr-00AwyB-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 11:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689851717; x=1721387717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YNjRIglSn+Mq54+ClkMlyrrKM6JqxpWLeZXEHD/ENyE=;
  b=zVEGJQ2xYdEVhyPj3Vo1gCLv0FaUupOlq9rJn2WUDwx9VNN1CMLw8DGz
   oTRTIipcX4UWM6P+lpNodvfh3DrOe40CTFwnpyfyws3OrdRl+V38tAogZ
   cuZG4pPtbcth4CzsVWsKWD2o7u5akh/V7BNC9+mr58+g93ufahth5yXpM
   xKLi5vUGcgiMSvUCfBS5KHVyqyW27FnQGBOj637aIZnOu76iqesDmwZ59
   cjnq6l1gZN5HZJwWBzF6f3oUdsd5BaY1vsNVwc8f+PHYNITQwqQowBhfp
   IT2snnSDKGc/iQbLGXdPgGwY/5UrH3kQHwWoYq7KWmI7Tgjs1B75Jtiby
   A==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="asc'?scan'208";a="224157917"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2023 04:15:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 20 Jul 2023 04:15:12 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 20 Jul 2023 04:15:09 -0700
Date: Thu, 20 Jul 2023 12:14:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Message-ID: <20230720-vanquish-upcoming-1145e052c849@wendy>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-9-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230719102057.22329-9-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_041517_534789_EED3425A 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: multipart/mixed; boundary="===============3477624370839337921=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3477624370839337921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J786f78MG4rGWZCB"
Content-Disposition: inline

--J786f78MG4rGWZCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 06:20:56PM +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller platform
> driver codes.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  MAINTAINERS                                 |   7 +
>  drivers/pci/controller/plda/Kconfig         |   8 +
>  drivers/pci/controller/plda/Makefile        |   1 +
>  drivers/pci/controller/plda/pcie-plda.h     |  58 ++-
>  drivers/pci/controller/plda/pcie-starfive.c | 415 ++++++++++++++++++++
>  5 files changed, 487 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/pci/controller/plda/pcie-starfive.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f02618c2bdf5..b88a54a24ae5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20356,6 +20356,13 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/watchdog/starfive*
>  F:	drivers/watchdog/starfive-wdt.c
> =20
> +STARFIVE JH71x0 PCIE DRIVER
> +M:	Minda Chen <minda.chen@starfivetech.com>
> +L:	linux-pci@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/pci/starfive*
> +F:	drivers/pci/controller/plda/pcie-starfive.c
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/pci/controller/plda/Kconfig b/drivers/pci/controller=
/plda/Kconfig
> index a3c790545843..eaf72954da9f 100644
> --- a/drivers/pci/controller/plda/Kconfig
> +++ b/drivers/pci/controller/plda/Kconfig
> @@ -24,4 +24,12 @@ config PCIE_MICROCHIP_HOST
>  	  Say Y here if you want kernel to support the Microchip AXI PCIe
>  	  Host Bridge driver.
> =20
> +config PCIE_STARFIVE_HOST
> +	tristate "StarFive PCIe host controller"
> +	select PCIE_PLDA_HOST

Ditto here, I think this suffers from the same issue, although its
probably only really randconfigs that'll trigger it.

> +	help
> +	  Say Y here if you want to support the StarFive PCIe controller
> +	  in host mode. StarFive PCIe controller uses PLDA PCIe
> +	  core.
> +
>  endmenu

--J786f78MG4rGWZCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLkXHAAKCRB4tDGHoIJi
0m9pAP9EyJHAUvHXemhchcieYU5ZwFz9SUQoN1qLf6k7DVl5aQEA5wHTHNqMKBQ7
SycW/eeQcp3dKd4ozKRqEI0wwtYsmQw=
=9Nkb
-----END PGP SIGNATURE-----

--J786f78MG4rGWZCB--


--===============3477624370839337921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3477624370839337921==--

