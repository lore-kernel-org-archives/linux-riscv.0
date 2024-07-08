Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D36AC3DA42
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KpaptSHtkI55VUpb1UZgmgjOy6C73toeHW3p6bB+qU=; b=TsTGDxXVFpWHB+7OcBri75ozGM
	VLdlViiD7rKk5ck1ZYVTt5ATy9r8Rd7N7WmFuob+0eDdpXxgmPdUlMM1SYqc8jCZpW4vw9WW1xuG5
	q8j6CzqRVcIzFuhGm5TAsF0hO/1BrgqKUsKVR42gDBti6tuGyDGVdPcNXqTOT1DhvW2afc9Tc89UA
	8HGnl1QFKAEA6DLCzbXdMLq4wTCqI4IEmyFeJ/hK00cMEFE0nh0/+VdmVhDz4y35t5ZplPUhOLSrx
	DBM/91VyUzdNK4z/y9djXSdHnttCfE95aRvvG5Ny7/HFWvyziIOxbokhs2j/DaxqBBXwMkjhcOKtz
	NQvGuhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkIg-00000003Dzo-3kba;
	Mon, 08 Jul 2024 09:04:46 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkIe-00000003DyG-2ZoL
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 09:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720429484; x=1751965484;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0aI49ZEwUflNdgkB5KmEXIC466KnmIbQc17d0H6wyiU=;
  b=JIXIA/ZcTK/3QRsbanPiN8Eq/SmIWl2kNK79hWujNYGdE/+SUmiWM155
   /kFygJ3iF/aHQuNf/NmAw9rp7yox1m8/NdcbZeW+9eIoxaqjIU4QJmAQo
   oDA6MySr3tdUJSgHJKwWuw1JPLDo2wQW+2DqP/gPIxmQc0TGGwhy/gRkJ
   84oNFcPKun7Xa81n4UhXHsURpaSp3PyUzxLRShNuMR0A5SjqMvHKK6ra9
   UUZ56seo/wBxkGd/LT02FoVBuVmFdHmCUzimZRjY7D70hoJQol0CRLzY8
   DK/gyFEKiWyUJw8PiR1t4bbI2G3AAFzZ546QJg0fZdF4eYElM0L2dts22
   w==;
X-CSE-ConnectionGUID: LWnYyQa5TX6j0ad61yUt2Q==
X-CSE-MsgGUID: CijfaiL9TEOC/EC4bECFPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17754113"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17754113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 02:04:38 -0700
X-CSE-ConnectionGUID: q9lJAyFqTYyN1F2sobzr4w==
X-CSE-MsgGUID: VMNX/6kuSp24CnC+3hRKRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47323026"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.115])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 02:04:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jul 2024 12:04:31 +0300 (EEST)
To: daire.mcnamara@microchip.com
cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
    conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com, 
    robh@kernel.org, bhelgaas@google.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v6 1/3] PCI: microchip: Fix outbound address translation
 tables
In-Reply-To: <20240628115923.4133286-2-daire.mcnamara@microchip.com>
Message-ID: <6c879527-4578-e3b5-2cc2-cf0638901f24@linux.intel.com>
References: <20240628115923.4133286-1-daire.mcnamara@microchip.com> <20240628115923.4133286-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-728995024-1720429471=:1343"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_020444_775595_DEFA56C0 
X-CRM114-Status: GOOD (  19.95  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-728995024-1720429471=:1343
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 28 Jun 2024, daire.mcnamara@microchip.com wrote:

> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
> three general-purpose Fabric Interface Controller (FIC) buses that
> encapsulate an AXI-M interface. That FIC is responsible for managing
> the translations of the upper 32-bits of the AXI-M address. On MPFS,
> the Root Port driver needs to take account of that outbound address
> translation done by the parent FIC bus before setting up its own
> outbound address translation tables.  In all cases on MPFS,
> the remaining outbound address translation tables are 32-bit only.
>=20
> Limit the outbound address translation tables to 32-bit only.
>=20
> This necessitates changing a size_t in mc_pcie_setup_window
> to a resource_size_t to avoid a compile error on 32-bit platforms.

Do you really mean "a compile error" here, that is, building 32-bit kernel=
=20
fails during compile stage? If not, it would be good to rephrase this line.

Other than that,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe contro=
ller driver")
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/c=
ontroller/pcie-microchip-host.c
> index 137fb8570ba2..47c397ae515a 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -23,6 +23,8 @@
>  /* Number of MSI IRQs */
>  #define MC_MAX_NUM_MSI_IRQS=09=09=0932
> =20
> +#define MC_OUTBOUND_TRANS_TBL_MASK=09=09GENMASK(31, 0)
> +
>  /* PCIe Bridge Phy and Controller Phy offsets */
>  #define MC_PCIE1_BRIDGE_ADDR=09=09=090x00008000u
>  #define MC_PCIE1_CTRL_ADDR=09=09=090x0000a000u
> @@ -933,7 +935,7 @@ static int mc_pcie_init_irq_domains(struct mc_pcie *p=
ort)
> =20
>  static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 ind=
ex,
>  =09=09=09=09 phys_addr_t axi_addr, phys_addr_t pci_addr,
> -=09=09=09=09 size_t size)
> +=09=09=09=09 resource_size_t size)
>  {
>  =09u32 atr_sz =3D ilog2(size) - 1;
>  =09u32 val;
> @@ -983,7 +985,8 @@ static int mc_pcie_setup_windows(struct platform_devi=
ce *pdev,
>  =09=09if (resource_type(entry->res) =3D=3D IORESOURCE_MEM) {
>  =09=09=09pci_addr =3D entry->res->start - entry->offset;
>  =09=09=09mc_pcie_setup_window(bridge_base_addr, index,
> -=09=09=09=09=09     entry->res->start, pci_addr,
> +=09=09=09=09=09     entry->res->start & MC_OUTBOUND_TRANS_TBL_MASK,
> +=09=09=09=09=09     pci_addr,
>  =09=09=09=09=09     resource_size(entry->res));
>  =09=09=09index++;
>  =09=09}
> @@ -1117,9 +1120,8 @@ static int mc_platform_init(struct pci_config_windo=
w *cfg)
>  =09int ret;
> =20
>  =09/* Configure address translation table 0 for PCIe config space */
> -=09mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
> -=09=09=09     cfg->res.start,
> -=09=09=09     resource_size(&cfg->res));
> +=09mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & MC_OUTBOUN=
D_TRANS_TBL_MASK,
> +=09=09=09     0, resource_size(&cfg->res));
> =20
>  =09/* Need some fixups in config space */
>  =09mc_pcie_enable_msi(port, cfg->win);


--8323328-728995024-1720429471=:1343
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-728995024-1720429471=:1343--

