Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64385C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xiP9bn98Lxl+3JHNj3vDF1G5Xy8x4SSUEgyajQOW3I=; b=Ivy5XUFlalz74afvCfD8j2jJM9
	Qq24cUSR7Yla8guU/6AUSiqp1yUu3eLUTJqRca1gA5Ll19tySAtKxFUeom7SQEjURTM5mFwGwW8IU
	cY0Oomu0om1fzZaSHU4heJTlZWSl+QqNawu8BCds9fqYuYD61RC6YC7NGvBlyrjvj3u3Ks/F4JvBC
	PJe6b6M/6QMCBAm30n4wG45C0VbOTDOUNSo0Fcbdls+AeA3SwnCSDxiDAVWzzApmsA3+6ELzcc2wt
	RyWMl4T6bprGbZ3FJ4WHbgDXoSE5Sl6JBMiq6I0rbrFgNBfWCQgYaVkUkGGpkD04WpNjUjJxbfugE
	XAa0X4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewQV-000000058zD-3ha8;
	Tue, 27 Feb 2024 12:19:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewQT-000000058xh-3qEY
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 12:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709036353; x=1740572353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NoB2fJENJEF1lOceRXQJkFncagd38TF5dH+WfCPzLgc=;
  b=EKstzD34UG1TzfB1itbONbaGaTJDm7XfK8mMZ3UuhQG3nkGacEIUKcyF
   m6i5U9DtnA+LxfMAoUOlrK0kJ8nTNX9fLJavak17bcbxD1P7eYpttQbdp
   M4Vm37BHQCM+VCg6DWAbJ2wP3+8bg4pZO+sdhFocu2UY9Q8/eyaLZHECI
   +yr7PiKDZjkV8P6TBwqdZO7dUGXXxH+F857n7kRyWefn+TbK6cXiA1Wmd
   zmDdURU69UDpJcFNNRaFGYfXeQit5VsF6BL6mKId6Hq5GFXY+XPmVC2wA
   GaH3MugIBGjnstRMI//bIQU6FOyGoeu0uiJimnAffKyhCA3ytnAmI48P/
   w==;
X-CSE-ConnectionGUID: gwxo7JWySZyq7n71kTiPrQ==
X-CSE-MsgGUID: aUX90sfwTdW/vMLuEfjRDg==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="17414830"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 05:19:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 05:19:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 05:19:02 -0700
Date: Tue, 27 Feb 2024 12:18:19 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] riscv: Fix loading 64-bit NOMMU kernels past the
 start of RAM
Message-ID: <20240227-unfitting-rectangle-cd0f23a4f3f1@wendy>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-3-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240227003630.3634533-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_041914_110936_96A35D73 
X-CRM114-Status: GOOD (  21.29  )
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
Content-Type: multipart/mixed; boundary="===============5442638969147635588=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5442638969147635588==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tfS8TWg82l+tp82L"
Content-Disposition: inline

--tfS8TWg82l+tp82L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 04:34:47PM -0800, Samuel Holland wrote:
> commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear
> mapping") added logic to allow using RAM below the kernel load address.
> However, this does not work for NOMMU, where PAGE_OFFSET is fixed to the
> kernel load address. Since that range of memory corresponds to PFNs
> below ARCH_PFN_OFFSET, mm initialization runs off the beginning of
> mem_map and corrupts adjacent kernel memory. Fix this by restoring the
> previous behavior for NOMMU kernels.
>=20
> Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping=
")

This commit was a year ago, why has nobody reported this as being an
issue before?

> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
>  arch/riscv/include/asm/page.h | 2 +-
>  arch/riscv/mm/init.c          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 57e887bfa34c..94b3d6930fc3 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -89,7 +89,7 @@ typedef struct page *pgtable_t;
>  #define PTE_FMT "%08lx"
>  #endif
> =20
> -#ifdef CONFIG_64BIT
> +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
>  /*
>   * We override this value as its generic definition uses __pa too early =
in
>   * the boot process (before kernel_map.va_pa_offset is set).
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fa34cf55037b..0c00efc75643 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -232,7 +232,7 @@ static void __init setup_bootmem(void)
>  	 * In 64-bit, any use of __va/__pa before this point is wrong as we
>  	 * did not know the start of DRAM before.
>  	 */
> -	if (IS_ENABLED(CONFIG_64BIT))
> +	if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_MMU))
>  		kernel_map.va_pa_offset =3D PAGE_OFFSET - phys_ram_base;
> =20
>  	/*
> --=20
> 2.43.0
>=20

--tfS8TWg82l+tp82L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd3TCwAKCRB4tDGHoIJi
0s/zAQCS852scSonjy1Gj7apcbh2fxvVfWDrwwOmuGUBrmho0QEA44dOATliF775
3hhKWqWXuZEZSrQinzVHcHmNhWBkywA=
=Sol7
-----END PGP SIGNATURE-----

--tfS8TWg82l+tp82L--


--===============5442638969147635588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5442638969147635588==--

