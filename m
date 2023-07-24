Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5F4C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ys8bFlFMDbJB4WFxNC/jK7JvA0C4QskZonsl8YvzKgk=; b=wPH5tSMVBkTCw4LWJzrBhzRc7P
	9TenfvLt7qHXCLrhnV8r+GLIqO/CuEj1I900ab4q4yToPIk2Nkf1ekYrYz2HcmI2tKW/4oTlgHcjX
	nt7S+g21nCIXK73GE3oNzl0zcbnsI2hKVmbhwBT5Z8F2LS4np+mHh2sLx7QG4WMIUNJ+RIDNwWpgR
	QvAIgehxnnACL3i7G/7Nmfnzy8PTKk5trQ9rml8CgYnT+LNbF/B3eltOrT/lxAGRznH5oxAvXkrDe
	1NW8WDYdk68hpZTbReZ5CMOdf3WO6HRAxBi0lIpJE+a8D1eFlLOqdTZug5csHDB+a8YZHUP/iODJN
	b4TaZwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqcK-003Bge-1l;
	Mon, 24 Jul 2023 08:08:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqcH-003Bg8-2C
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 08:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690186110; x=1721722110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FMRmaRUw8VrEz5cIUd4uabLoqD8FojfSTBD+JH7d/78=;
  b=nCoC26aUDb1FK57JUFPQp9SUN6ZtnO7ARBELfEbVdoLU2kNkUrQ0g0/f
   y4FML2Oc0tgfRsvZESoLaWAQDG6y8iPkHYJvs8D/swsxkaob7M668pYrt
   74vQPW9XPk9ZaB4l9Hs8v2jmyBXldrfQ5/H0U0SSYXfsGQxr62uQNm8Fd
   Qjaq4nK6ginYUHKHTypNCukprGvSVUIn5lmbeVt+wWoZg9YMKG7ulNJ0f
   IvsZ0v9QvgGV+9pNKHPsZoEZ4Rw+lRNAgREPlqfadiYZNpWpAqepj04Yu
   t2FVw1EtQy1iqhyJLlYofZyTQXkygzd2cd2gINVNS3zUhVIU8gODpJqVq
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="221826073"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 01:08:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 01:08:21 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 01:08:20 -0700
Date: Mon, 24 Jul 2023 09:07:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return
 iomem address
Message-ID: <20230724-phonics-earthling-d104ef807286@wendy>
References: <20230723191758.1262960-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230723191758.1262960-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_010829_782147_98ABCDBB 
X-CRM114-Status: GOOD (  18.97  )
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
Content-Type: multipart/mixed; boundary="===============3656965106712155319=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3656965106712155319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtD17YszkGN6XtYe"
Content-Disposition: inline

--vtD17YszkGN6XtYe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 12:47:58AM +0530, Sunil V L wrote:
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
> index 5ee03ebab80e..e6fdb9edcdd9 100644
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
> +	return (__force void __iomem *) memremap(phys, size, MEMREMAP_WB);

Why's the __force needed? Does sparse complain about the cast too?

--vtD17YszkGN6XtYe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL4xUgAKCRB4tDGHoIJi
0g6UAQCpdPC3pWYrjW9HbFWmEsgechOUzkb7sDDVFEdus8ebUwD8DxsbPpagXY7Q
XnpxLi85wHlgX8DuIZMxzId9C27Jcw0=
=9frk
-----END PGP SIGNATURE-----

--vtD17YszkGN6XtYe--


--===============3656965106712155319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3656965106712155319==--

