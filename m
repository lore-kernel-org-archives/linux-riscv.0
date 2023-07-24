Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0537BC001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzbfAqCIED3geKxZCmLsq/aubCJnG0Gs4qO40uxWxoo=; b=ku/2nnskoGGjiMWF24jlqiQHpF
	9gONNbTdcTNyuyg38sjmdrn3InRbjvlx2PzYtbTBM4iEGLQHhMA2jx7i53q8Ze0KAVNKpSkJSd6pe
	f690x9V8DRxxMtQkHSepAR7Ojge5WGzTuA1uDY9Rt1eX48+hHXs1OVnl/EzjrHSpCXxIm10cchzQ2
	tHuKDFHqYKvcLxQqukzfW6lNMei/gnbaqgE5hn1BBLa4ikP0FxLSUDV3u9RVWyWP4FPpH5WRGdFv5
	W1RzxMX5q665jC/N/3Ti1++cASOG5/USYVpM69MDMXudfLJCuW5vb2gxk1iZuKdeVA2xA0HV2AUwr
	Rzyz2EIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNssT-003pRo-0u;
	Mon, 24 Jul 2023 10:33:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNssP-003pQU-24
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690194797; x=1721730797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2A2JU/fzgzYQsCwx+j1j5mbZhV4V8Gf7uWXcztu+eQs=;
  b=MI+/LhIX2eSEke9ZIhafqRKzt42y6zNKEu3jXJzDFLtdgkXt/5yOoNhb
   DnS/JHWhYjVS7UbepehuCtGFQHsNFwi+uqZFpOEcAspg++09Cv38DR6nj
   xaTqTpMfbFTJqxqD6d6OuQxx36elgEWXIHo7zcyIwkDw3Ks022neNVrTE
   VsY2BAm+gjXzHzYhgxuRy6iCWlfPgeBKLQrblDJX9aLYQ9CDEaDE9gfZv
   t6pWbdTDPikd9CXUA18quawg2S4J1Injch1Ef9i7WoZcp48JNkpQzK9Vv
   cjaNzAwhqIT/7/oeDKObcbLXlMjWqTfcH/YLrwoebmp3VQTLaV6Gca+W9
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="237300210"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 03:33:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 03:33:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 03:33:11 -0700
Date: Mon, 24 Jul 2023 11:32:38 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return
 iomem address
Message-ID: <20230724-zit-stunning-901bfd989a4a@wendy>
References: <20230724100346.1302937-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230724100346.1302937-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_033317_857587_B2A356A3 
X-CRM114-Status: GOOD (  19.40  )
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
Content-Type: multipart/mixed; boundary="===============5221893009449491280=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5221893009449491280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zkxf3SyDjVGAdJvc"
Content-Disposition: inline

--zkxf3SyDjVGAdJvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 03:33:46PM +0530, Sunil V L wrote:
> acpi_os_ioremap() currently is a wrapper to memremap() on
> RISC-V. But the callers of acpi_os_ioremap() expect it to
> return __iomem address and hence sparse tool reports a new
> warning. Fix this issue by type casting to  __iomem type.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@i=
ntel.com/
> Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Surprisingly, my automation already tested this patch. Usually there's a
several hour delay between posting & testing.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Changes since v2:
> 	1) Removed unnecessary __force.
> 	2) Removed unnecessary space after cast to fix checkpatch --strict warni=
ng.
>=20
> Changes since v1:
> 	1) Removed enhancements from the fix patch.
>=20
>  arch/riscv/include/asm/acpi.h | 2 +-
>  arch/riscv/kernel/acpi.c      | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index f71ce21ff684..d5604d2073bc 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -19,7 +19,7 @@ typedef u64 phys_cpuid_t;
>  #define PHYS_CPUID_INVALID INVALID_HARTID
> =20
>  /* ACPI table mapping after acpi_permanent_mmap is set */
> -void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
> +void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size=
);
>  #define acpi_os_ioremap acpi_os_ioremap
> =20
>  #define acpi_strict 1	/* No out-of-spec workarounds on RISC-V */
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 5ee03ebab80e..56cb2c986c48 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -215,9 +215,9 @@ void __init __acpi_unmap_table(void __iomem *map, uns=
igned long size)
>  	early_iounmap(map, size);
>  }
> =20
> -void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> +void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>  {
> -	return memremap(phys, size, MEMREMAP_WB);
> +	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
>  }
> =20
>  #ifdef CONFIG_PCI
> --=20
> 2.39.2
>=20

--zkxf3SyDjVGAdJvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL5TRQAKCRB4tDGHoIJi
0sSUAQDRKYATqlpRLkFQpUraMl2rdoynN0aAfJOpVdSZbqnsrwEAuylSpN7Gpx3x
eShz+1UlkmUkL7qLQ4c5WW/ZZyoJQQQ=
=5gPe
-----END PGP SIGNATURE-----

--zkxf3SyDjVGAdJvc--


--===============5221893009449491280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5221893009449491280==--

