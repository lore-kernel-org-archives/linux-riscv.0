Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E642FC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5XJa7l5w1+c95uwh7zx0vjNkMo/G/F9s6lfojj0IS4=; b=cOr+C7G/g3OaF8+2FUDtahIOe/
	iYGXiceXGHDmDCFlOWfKyRFHoV7OsYDxL/UtHRimvQN6UdIk91turgqvhNql+VAVLpF5euBHl06PI
	iv9HKw9NeySnX/SiX0RTfgZGxn/5VGUR3vcuOgJ8bSPkLytK2DDBPeVkIsYAYOzhhSqcInIyWwPVw
	eRilLOqT8FZy0ZOT7o7qxF6gbMfim0yOTTNOOTLoqSEvqJCxGxhaznTvmh3lwg3ystM+9bhoyF8LV
	SGEvqwERucV8+vgySQOw2KRA2utsOqH1rg8rHOsfS8G7Ir68g5cEesUkELzZZPJHv5hm4+daDQLR+
	9UJVaUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewWM-00000005AdG-3SaJ;
	Tue, 27 Feb 2024 12:25:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewWJ-00000005AbP-3TMP
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 12:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709036715; x=1740572715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dQplQx4E0wVG3NVHNT8C6T1/LS/PKWtnC857Cl8NoKM=;
  b=O2Iv6+Tz7IohEnQbQDJAE3Bo7ESAOViUXhTXGHt0Ot8JHYoUArwvDM66
   CjVnx+r8ucBNvjK91oCLJIPPj1VjHOSuL+dXYnDW0kZVBkC8nZYhHdyC2
   LEPfg9NIIf3nhII5xDdJb5Q2DwnBzTFWkpu75lsSLTBUCHP3omHOtk5Lw
   1tc4Ro5kdsDOPuotd5ANYztJTA7XRAm9sU9kzlGmwB7M/cHPEPHuSYPQB
   l1fH+7d7H4G2CYOkhXN1wuXt9g1yQDJYgmJxZe6dnm0bcJ+8ErpbzuSfC
   Ml/QT0vsFXU4DGSoyxFBzL6f5+v3XwQ5ayhVLtbyR8b/0tF2qDhONRxgO
   w==;
X-CSE-ConnectionGUID: yNBil63MQySjl9Tr6UCyNQ==
X-CSE-MsgGUID: K1P+HCaqRuC24Pz8R5JQ1g==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="17415151"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 05:25:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 05:24:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 05:24:52 -0700
Date: Tue, 27 Feb 2024 12:24:09 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] riscv: Allow NOMMU kernels to run in S-mode
Message-ID: <20240227-seventh-overgrown-2fa453e8a775@wendy>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-5-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240227003630.3634533-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_042516_020336_58AB3909 
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
Content-Type: multipart/mixed; boundary="===============3766974448525874007=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3766974448525874007==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aaEsmCaWxcFXJwfC"
Content-Disposition: inline

--aaEsmCaWxcFXJwfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 04:34:49PM -0800, Samuel Holland wrote:
> For ease of testing, it is convenient to run NOMMU kernels in supervisor
> mode. The only required change is to offset the kernel load address,
> since the beginning of RAM is usually reserved for M-mode firmware.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
>  arch/riscv/Kconfig | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ef53c00470d6..0dc09b2ac2f6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -64,7 +64,7 @@ config RISCV
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
> -	select CLINT_TIMER if !MMU
> +	select CLINT_TIMER if RISCV_M_MODE
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
>  	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
> @@ -220,8 +220,12 @@ config ARCH_MMAP_RND_COMPAT_BITS_MAX
> =20
>  # set if we run in machine mode, cleared if we run in supervisor mode
>  config RISCV_M_MODE
> -	bool
> -	default !MMU
> +	bool "Build a kernel that runs in machine mode"
> +	depends on !MMU
> +	default y
> +	help
> +	  Select this option if you want to run the kernel in M-mode,
> +	  without the assistance of any other firmware.
> =20
>  # set if we are running in S-mode and can use SBI calls
>  config RISCV_SBI
> @@ -238,8 +242,9 @@ config MMU
> =20
>  config PAGE_OFFSET
>  	hex
> -	default 0xC0000000 if 32BIT && MMU
> -	default 0x80000000 if !MMU
> +	default 0x80000000 if !MMU && RISCV_M_MODE
> +	default 0x80200000 if !MMU
> +	default 0xc0000000 if 32BIT
>  	default 0xff60000000000000 if 64BIT

The first default seen with a passing condition is the default chosen,
right?

Cheers,
Conor.

--aaEsmCaWxcFXJwfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd3UaQAKCRB4tDGHoIJi
0rWUAQCYj2VzMZqjloyCYlH/8rJ600bZ72PC8LQeVI1wa+TlaQD/U6N2RrPtWIEt
9yhw7RZZXjwnLgcj/dY9G1ZI0rWF2QY=
=ZJON
-----END PGP SIGNATURE-----

--aaEsmCaWxcFXJwfC--


--===============3766974448525874007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3766974448525874007==--

