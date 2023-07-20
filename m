Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E69EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHEaRZZthoTPlojHT0sDSfiT7b/8g1jOc03L0SFKtZA=; b=Hj4lI87T9PRQ8EnDww0Fj5pHR8
	s64T4JKTZ47XyQHydLxQL7n/H403eSIoWsbl00iTiaX3UetevanTGS92UJxjVpAYP1bAZ2CW1AhTZ
	N1pdtmsuzYxaUzV0uaSVq0w3jKsixt6qRKgJ/yLfkbTGaxVeCkbPVx4ssPVYn6Pp2psxkaq16xHO6
	WOiSzBxhHRZDUWEBijJdpW7qoMuzFe9ZsJrS9vz6h/aAVIkEt64dZp8hpR+KR8xphG9F37aoQ83mW
	37v5LAjtytUiZG7ypUMt9NjcyWEO75eeZvrD1/fLHu2UPeU/eFrB5I1PL5MPksIRy8aFHy954aGwK
	Ce0aco6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMRVm-00AwEz-1i;
	Thu, 20 Jul 2023 11:07:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMRVi-00AwDy-2I
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 11:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689851274; x=1721387274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kRnPBYIg/Txid4eQMW5mWguX6Sa02z6B8L96xUlIcwA=;
  b=v4t22MgO4CzVQyZ676Q9u1hro30NwS5WDKrI8ciTPC0MRefc2sbQx7RJ
   zbVLS32KtxSYtay//OpgzhJ6mgY2Sbho5Ts4b7u2/3ELSkHYaupR4ZWIz
   jJS2xEEuPllxHYl9rNqlIriAKojUAlQ+qdNrBP7j1s6rWCdDhKGv8+GUj
   p4woh5L2nx+M1gUUy71djVqYYh/7QvWkOt0nqQE5nyOWJoEYidh/fxQJn
   lFywCu8TcKUwOO0e4RdEqrBTlY0ZZnq3apoup8ApKIxDcjACCOFKG28HB
   /k2TJ9z/QHUTBzVi3tv+SELeO1pP6+nfw3Su/Vg6t2uNv2kY8Ly1++RIf
   A==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="asc'?scan'208";a="236690299"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2023 04:07:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 20 Jul 2023 04:07:50 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 20 Jul 2023 04:07:47 -0700
Date: Thu, 20 Jul 2023 12:07:14 +0100
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
Subject: Re: [PATCH v1 4/9] PCI: microchip: Move PCIe driver to PLDA directory
Message-ID: <20230720-parched-laborer-a8416d86a85e@wendy>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-5-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230719102057.22329-5-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_040754_942347_8B055494 
X-CRM114-Status: GOOD (  17.14  )
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
Content-Type: multipart/mixed; boundary="===============6187919529009698321=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6187919529009698321==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R981OROlZpffAhaD"
Content-Disposition: inline

--R981OROlZpffAhaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Minda,

On Wed, Jul 19, 2023 at 06:20:52PM +0800, Minda Chen wrote:
> Move Microchip specific platform codes to PLDA directory.
> Including clock init, interrupt event handle and platform
> init codes.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  MAINTAINERS                                   |   4 +-
>  drivers/pci/controller/Kconfig                |   8 -
>  drivers/pci/controller/Makefile               |   1 -
>  drivers/pci/controller/plda/Kconfig           |  10 +-
>  drivers/pci/controller/plda/Makefile          |   1 +
>  .../{ =3D> plda}/pcie-microchip-host.c          | 594 ++----------------

I think that you should squash this with the previous patch, rather than
duplicate the code and then de-duplicate it, so that it is more obvious
what is being extracted.

>  6 files changed, 55 insertions(+), 563 deletions(-)
>  rename drivers/pci/controller/{ =3D> plda}/pcie-microchip-host.c (50%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b3c4d8808ae..f02618c2bdf5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16503,7 +16503,7 @@ M:	Daire McNamara <daire.mcnamara@microchip.com>
>  L:	linux-pci@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/pci/microchip*
> -F:	drivers/pci/controller/*microchip*
> +F:	drivers/pci/controller/plda/*microchip*
> =20
>  PCIE DRIVER FOR QUALCOMM MSM
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> @@ -18287,7 +18287,7 @@ F:	drivers/char/hw_random/mpfs-rng.c
>  F:	drivers/clk/microchip/clk-mpfs*.c
>  F:	drivers/i2c/busses/i2c-microchip-corei2c.c
>  F:	drivers/mailbox/mailbox-mpfs.c
> -F:	drivers/pci/controller/pcie-microchip-host.c
> +F:	drivers/pci/controller/plda/pcie-microchip-host.c
>  F:	drivers/pwm/pwm-microchip-core.c
>  F:	drivers/reset/reset-mpfs.c
>  F:	drivers/rtc/rtc-mpfs.c
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kcon=
fig
> index a106dabcb8dc..107cdb69e15c 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -216,14 +216,6 @@ config PCIE_MT7621
>  	help
>  	  This selects a driver for the MediaTek MT7621 PCIe Controller.
> =20
> -config PCIE_MICROCHIP_HOST
> -	bool "Microchip AXI PCIe controller"
> -	depends on PCI_MSI && OF
> -	select PCI_HOST_COMMON
> -	help
> -	  Say Y here if you want kernel to support the Microchip AXI PCIe
> -	  Host Bridge driver.
> -
>  config PCI_HYPERV_INTERFACE
>  	tristate "Microsoft Hyper-V PCI Interface"
>  	depends on ((X86 && X86_64) || ARM64) && HYPERV && PCI_MSI
> diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Mak=
efile
> index aa0a691ebcbc..93236dc97b21 100644
> --- a/drivers/pci/controller/Makefile
> +++ b/drivers/pci/controller/Makefile
> @@ -32,7 +32,6 @@ obj-$(CONFIG_PCIE_ROCKCHIP_EP) +=3D pcie-rockchip-ep.o
>  obj-$(CONFIG_PCIE_ROCKCHIP_HOST) +=3D pcie-rockchip-host.o
>  obj-$(CONFIG_PCIE_MEDIATEK) +=3D pcie-mediatek.o
>  obj-$(CONFIG_PCIE_MEDIATEK_GEN3) +=3D pcie-mediatek-gen3.o
> -obj-$(CONFIG_PCIE_MICROCHIP_HOST) +=3D pcie-microchip-host.o
>  obj-$(CONFIG_VMD) +=3D vmd.o
>  obj-$(CONFIG_PCIE_BRCMSTB) +=3D pcie-brcmstb.o
>  obj-$(CONFIG_PCI_LOONGSON) +=3D pci-loongson.o
> diff --git a/drivers/pci/controller/plda/Kconfig b/drivers/pci/controller=
/plda/Kconfig
> index 37e17326671b..fb274976b84b 100644
> --- a/drivers/pci/controller/plda/Kconfig
> +++ b/drivers/pci/controller/plda/Kconfig
> @@ -4,8 +4,16 @@ menu "PLDA PCIe controllers support"
>  	depends on PCI
> =20
>  config PCIE_PLDA_HOST
> -	bool "PLDA PCIe host controller"
> +	bool
>  	depends on OF && PCI_MSI

Is this okay w.r.t. unmet dependencies? IOW, if PCI_MSI is disabled,
PCIE_MICROCHIP_HOST can still select PCIE_PLDA_HOST, no?

>  	select IRQ_DOMAIN
> =20
> +config PCIE_MICROCHIP_HOST
> +	bool "Microchip AXI PCIe controller"
> +	select PCI_HOST_COMMON
> +	select PCIE_PLDA_HOST
> +	help
> +	  Say Y here if you want kernel to support the Microchip AXI PCIe
> +	  Host Bridge driver.
> +
>  endmenu
> diff --git a/drivers/pci/controller/plda/Makefile b/drivers/pci/controlle=
r/plda/Makefile
> index 79dbae655c2b..4340ab007f44 100644
> --- a/drivers/pci/controller/plda/Makefile
> +++ b/drivers/pci/controller/plda/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_PCIE_PLDA_HOST) +=3D pcie-plda-host.o
> +obj-$(CONFIG_PCIE_MICROCHIP_HOST) +=3D pcie-microchip-host.o

--R981OROlZpffAhaD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLkVYgAKCRB4tDGHoIJi
0k0bAQCls5FIJwFB57TYTloKZdZpGhbCdYfiHdflmFpajndJsQD6ApkFiSrTI7Lc
iflf2JhxaeFtKVbea64gWAB2NFZTTQ8=
=QWY5
-----END PGP SIGNATURE-----

--R981OROlZpffAhaD--


--===============6187919529009698321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6187919529009698321==--

