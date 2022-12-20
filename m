Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28DBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyDTWpXvogdLv5s67A032c9qRDSycSESPFBx0UvdW6s=; b=1cTBFpPQ38Ryq38FGE44lFrryA
	sygMW45+6l+x4WL3tfc4gi9AXmdwKyKytJvlK3sIreo4ItL19PtzpMifgwN3tS/9HD8oJtecs8efV
	tAra3NhHmm1sA814UY9A1P5cT928Z+NpkbsvQJyCcP1neRAeSCYUR5BrP61QTAw9OcUXMP33VUhcD
	5rAEeuAzkHA5kaBymPLF5ckLUSyqqUx/1KLZNh3uMuMJ6MZLhnaVYbOyrxzIoTsutV8rqtBnPIX6/
	rdL1DOflZP0F00xOnZTrvDpNejMSTyCoiR1jXU2K//dSJJyt13JG72sJLtV60Gb0j/oRg+47diHx6
	jDuVpnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7c75-00FGt0-K6; Tue, 20 Dec 2022 12:52:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7c70-00FGjv-Ic
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 12:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671540770; x=1703076770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ibxBQhvl2GF+Tfn1Ut04XXlNZrD98ljScwtCBLdsodk=;
  b=t0cMf2zoItVbuEomkQ+SlSwt0iQC57bDHAVWaNDkVhta7GCIfXyFXeHj
   Ui8T5T9s2U7rA1dArsEnyRvFyEg72ztT161t7P1yVJJ6mILSAtbc2VTBo
   3eMyYJ1i2fX1R4/oJPKnBDGKIe9NvA4X9y2+MQz8AQlb9OwhvcGd/v0tL
   m9YsJMWV7Vy0h7Echr8KnwphmT62nSl8d9jSdG8hvOl3PhlJOU4PGrvtA
   FQSC0wIpYB+XdIPTexcdGjVuajyDRDHETaOOvG0ZWfBExsFCBkUB40J5H
   3mkWachFjoWZLUMBskrrwQFd1qGzyuwk71j3h6spA/e+JwKOMs+0f7tqx
   A==;
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="asc'?scan'208";a="192502051"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Dec 2022 05:52:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 20 Dec 2022 05:52:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 20 Dec 2022 05:52:38 -0700
Date: Tue, 20 Dec 2022 12:52:18 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Ruinland Tsai <ruinland.tsai@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <greentime.hu@sifive.com>,
	<kito.cheng@sifive.com>
Subject: Re: [RFC PATCH 1/1] arch/riscv : Add support for Zba/Zbb/Zbc/Zbs ext
 in ISA realization
Message-ID: <Y6GwAkCh9L22N70v@wendy>
References: <20221220120236.219804-1-ruinland.tsai@sifive.com>
 <20221220120236.219804-2-ruinland.tsai@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20221220120236.219804-2-ruinland.tsai@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_045250_798070_CDEF3EB7 
X-CRM114-Status: GOOD (  23.02  )
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
Content-Type: multipart/mixed; boundary="===============6237940729879997221=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6237940729879997221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fWBrYrQpkjpzaPl0"
Content-Disposition: inline

--fWBrYrQpkjpzaPl0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 12:02:36PM +0000, Ruinland Tsai wrote:
> arch/riscv : Add support for Zba/Zbb/Zbc/Zbs ext in ISA realization

s|arch/riscv :|riscv:

> This commit adds the ratified RISC-V Bitmanip 1.0.0 extensions

"add the ..."

> into the hadrware capability realization procedure.

hardware

>=20
> Thus, the print out of Zba/Zbb/Zbc/Zbs of /proc/cpuinfo could be
> matching the information provided in DT.

"Thus, the printout of ... from /proc/cpuinfo could match the
information..."

>=20
> Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> ---
>  arch/riscv/Kconfig             | 24 ++++++++++++++++++++++++
>  arch/riscv/Makefile            |  6 ++++++
>  arch/riscv/include/asm/hwcap.h |  4 ++++
>  arch/riscv/kernel/cpu.c        |  4 ++++
>  arch/riscv/kernel/cpufeature.c |  4 ++++
>  5 files changed, 42 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..4f64d02d5208 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -447,6 +447,30 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
>  	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zihintp=
ause)
>  	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23600
> =20
> +config TOOLCHAIN_HAS_ZBA
> +	bool "Zba extension support for B extension on Address generation"
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zba)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zba)

Surely all of these things need to check for linker support too, not
just cc? Consider a setup where CC is rather new, but the linker is
quite old. Does this not cause problems for Zb* as it did for
ZIHINTPAUSE?

> +config TOOLCHAIN_HAS_ZBB
> +	bool "Zbb extension support for B extension on Basic bit-manipulation"
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zbb)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zbb)
> +
> +config TOOLCHAIN_HAS_ZBC
> +	bool "Zbc extension support for B extension on Carry-less multiplicatio=
n"
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zbc)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zbc)
> +
> +config TOOLCHAIN_HAS_ZBS
> +	bool "Zbs extension support for B extension on single-bit instruction"
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zbs)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zbs)
> +
>  config FPU
>  	bool "FPU support"
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index faf2c2177094..635fc2642a5e 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -61,6 +61,12 @@ riscv-march-$(toolchain-need-zicsr-zifencei) :=3D $(ri=
scv-march-y)_zicsr_zifencei
>  # Check if the toolchain supports Zicbom extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) :=3D $(riscv-march-y)_zicbom
> =20
> +# Check if the toolchain supports ratified B extensions=20
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZBA) :=3D $(riscv-march-y)_zba
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZBB) :=3D $(riscv-march-y)_zbb
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZBC) :=3D $(riscv-march-y)_zbc
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZBS) :=3D $(riscv-march-y)_zbs
> +
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-y)_zi=
hintpause
> =20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 86328e3acb02..baa51a282a69 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -55,6 +55,10 @@ extern unsigned long elf_hwcap;
>  enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_SSCOFPMF =3D RISCV_ISA_EXT_BASE,
>  	RISCV_ISA_EXT_SVPBMT,
> +	RISCV_ISA_EXT_ZBA,
> +	RISCV_ISA_EXT_ZBB,
> +	RISCV_ISA_EXT_ZBC,
> +	RISCV_ISA_EXT_ZBS,
>  	RISCV_ISA_EXT_ZICBOM,
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 1b9a5a66e55a..70361105a612 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -166,6 +166,10 @@ static struct riscv_isa_ext_data isa_ext_arr[] =3D {
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> +	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),

Exactly how uABI-y this array is may be up for debate so I'd rather not
add a whole load of items in in what may be an "incorrect" order.
https://lore.kernel.org/all/20221205144525.2148448-1-conor.dooley@microchip=
=2Ecom/
I'll make sure to go ping that one once the merge window closes so that
we have a definitive order in which things must be added.

Thanks,
Conor.

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 93e45560af30..ee536e08d197 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -224,6 +224,10 @@ void __init riscv_fill_hwcap(void)
>  			} else {
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> +				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
> +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> +				SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZBC);
> +				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--fWBrYrQpkjpzaPl0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6GwAgAKCRB4tDGHoIJi
0q2FAP9WRs18Im4Ty9Z7xW1Gv44gU38n3x4zH4GmRVwstrENYAD/ZilDLrjwiICO
HVlnNDELIEa9iu6sigJ2GG739RqW4go=
=Tczl
-----END PGP SIGNATURE-----

--fWBrYrQpkjpzaPl0--


--===============6237940729879997221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6237940729879997221==--

