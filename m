Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DC4EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 13:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DESmDBffZrENGrnyP7981Q6f9ri8ONV7ES9UF2bg3wU=; b=iDo4ztN/ePsXFqSltp9sgkhN/u
	DA74ajIYoNt8LvlObaupq9b+OvYFQtGFw/bbPCztRR7stkvYTtNr8NZi6dhDOmd3aFEyYiTGE3AD/
	9Z2JwABNCKn6LGUbtUixKjpU/KGMyC5i8HmbQ8dgE767retR/8QCIIG4RQsDmIIlkR48YRKHLzWxe
	T12irt93hdzs7px4C0dWZpStsQnP5kXyGmD0XoMehC89FKhKqF71RhuFaEPXobf+aTvYptgbLHqnw
	2+CWHBwAHHQ49Uq0QVypw8Pgo6ntbPUzOA5ElVDVROxIDQ46ZDcQOHTClEH27xdff8k6s5NvxzPhm
	H1qfz3wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDlwk-00AH6u-0a;
	Mon, 26 Jun 2023 13:07:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDlwh-00AH5T-05
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 13:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687784875; x=1719320875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=72rXoisws5aoVjq6A8u6xAy4hwxZtdurVUlSFvLS0h0=;
  b=YPYCPsTVvWTO9vhEZbPv/G4LpyKM1nblCR9zbfpkkSN+2o9WTIc19HwZ
   tUD57AwjXK4XfOtKZFePFG+rCy0OSopPEsOcCjB7Gadmsy6yOJR8ZkNax
   +SWmtqUuW+CJZhxAhn+qIopfwG3bT6rLRi64QPEBRCfdYyK0iGukNnXf3
   JsY9vFGEuzavIViwqc99yX5uQMld79ZY4lGnIWrBdxp4G2g3XC58u9Eci
   qoRsYZKUFLlz99ybhPHSodVTMBcxqWM4iH5PK1rb+Uf42WRqMSvq4kX03
   1JDKS2natHQhm98WGeaYzDd9UAr9vM8EqtilxZr7tA8k50YEz4MHqPk/d
   w==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="asc'?scan'208";a="232202157"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 06:07:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 06:07:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 06:07:41 -0700
Date: Mon, 26 Jun 2023 14:07:13 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 2/2] RISC-V: alternative: Remove feature_probe_func
Message-ID: <20230626-hardcopy-upchuck-7c37f1a6ef7b@wendy>
References: <20230623222016.3742145-1-evan@rivosinc.com>
 <20230623222016.3742145-3-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230623222016.3742145-3-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_060755_130510_CD7323C8 
X-CRM114-Status: GOOD (  24.54  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Samuel Holland <samuel@sholland.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============5769571512661136645=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5769571512661136645==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dm2SjiLkQREWuB17"
Content-Disposition: inline

--dm2SjiLkQREWuB17
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Evan,

On Fri, Jun 23, 2023 at 03:20:16PM -0700, Evan Green wrote:
> Now that we're testing unaligned memory copy and making that
> determination generically, there are no more users of the vendor
> feature_probe_func(). While I think it's probably going to need to come
> back, there are no users right now, so let's remove it until it's
> needed.

How come this is done as a separate patch, rather than delete the dead
code as part of the probe addition? Ease of review?

Change itself seems fine to me though, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
>=20
> ---
>=20
>  arch/riscv/errata/thead/errata.c     |  8 --------
>  arch/riscv/include/asm/alternative.h |  5 -----
>  arch/riscv/kernel/alternative.c      | 19 -------------------
>  arch/riscv/kernel/smpboot.c          |  1 -
>  4 files changed, 33 deletions(-)
>=20
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index c259dc925ec1..bf42857c977f 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -117,11 +117,3 @@ void thead_errata_patch_func(struct alt_entry *begin=
, struct alt_entry *end,
>  	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
>  		local_flush_icache_all();
>  }
> -
> -void thead_feature_probe_func(unsigned int cpu,
> -			      unsigned long archid,
> -			      unsigned long impid)
> -{
> -	if ((archid =3D=3D 0) && (impid =3D=3D 0))
> -		per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALIGNED_FAS=
T;
> -}
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/as=
m/alternative.h
> index 6a41537826a7..58ccd2f8cab7 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -30,7 +30,6 @@
>  #define ALT_OLD_PTR(a)			__ALT_PTR(a, old_offset)
>  #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
> =20
> -void probe_vendor_features(unsigned int cpu);
>  void __init apply_boot_alternatives(void);
>  void __init apply_early_boot_alternatives(void);
>  void apply_module_alternatives(void *start, size_t length);
> @@ -53,15 +52,11 @@ void thead_errata_patch_func(struct alt_entry *begin,=
 struct alt_entry *end,
>  			     unsigned long archid, unsigned long impid,
>  			     unsigned int stage);
> =20
> -void thead_feature_probe_func(unsigned int cpu, unsigned long archid,
> -			      unsigned long impid);
> -
>  void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_ent=
ry *end,
>  				 unsigned int stage);
> =20
>  #else /* CONFIG_RISCV_ALTERNATIVE */
> =20
> -static inline void probe_vendor_features(unsigned int cpu) { }
>  static inline void apply_boot_alternatives(void) { }
>  static inline void apply_early_boot_alternatives(void) { }
>  static inline void apply_module_alternatives(void *start, size_t length)=
 { }
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternat=
ive.c
> index 6b75788c18e6..85056153fa23 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -27,8 +27,6 @@ struct cpu_manufacturer_info_t {
>  	void (*patch_func)(struct alt_entry *begin, struct alt_entry *end,
>  				  unsigned long archid, unsigned long impid,
>  				  unsigned int stage);
> -	void (*feature_probe_func)(unsigned int cpu, unsigned long archid,
> -				   unsigned long impid);
>  };
> =20
>  static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_=
mfr_info)
> @@ -43,7 +41,6 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufact=
urer_info_t *cpu_mfr_info
>  	cpu_mfr_info->imp_id =3D sbi_get_mimpid();
>  #endif
> =20
> -	cpu_mfr_info->feature_probe_func =3D NULL;
>  	switch (cpu_mfr_info->vendor_id) {
>  #ifdef CONFIG_ERRATA_SIFIVE
>  	case SIFIVE_VENDOR_ID:
> @@ -53,7 +50,6 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufact=
urer_info_t *cpu_mfr_info
>  #ifdef CONFIG_ERRATA_THEAD
>  	case THEAD_VENDOR_ID:
>  		cpu_mfr_info->patch_func =3D thead_errata_patch_func;
> -		cpu_mfr_info->feature_probe_func =3D thead_feature_probe_func;
>  		break;
>  #endif
>  	default:
> @@ -143,20 +139,6 @@ void riscv_alternative_fix_offsets(void *alt_ptr, un=
signed int len,
>  	}
>  }
> =20
> -/* Called on each CPU as it starts */
> -void probe_vendor_features(unsigned int cpu)
> -{
> -	struct cpu_manufacturer_info_t cpu_mfr_info;
> -
> -	riscv_fill_cpu_mfr_info(&cpu_mfr_info);
> -	if (!cpu_mfr_info.feature_probe_func)
> -		return;
> -
> -	cpu_mfr_info.feature_probe_func(cpu,
> -					cpu_mfr_info.arch_id,
> -					cpu_mfr_info.imp_id);
> -}
> -
>  /*
>   * This is called very early in the boot process (directly after we run
>   * a feature detect on the boot CPU). No need to worry about other CPUs
> @@ -211,7 +193,6 @@ void __init apply_boot_alternatives(void)
>  	/* If called on non-boot cpu things could go wrong */
>  	WARN_ON(smp_processor_id() !=3D 0);
> =20
> -	probe_vendor_features(0);
>  	_apply_alternatives((struct alt_entry *)__alt_start,
>  			    (struct alt_entry *)__alt_end,
>  			    RISCV_ALTERNATIVES_BOOT);
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index e34a71b4786b..054f2d4474d0 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -246,7 +246,6 @@ asmlinkage __visible void smp_callin(void)
>  	numa_add_cpu(curr_cpuid);
>  	set_cpu_online(curr_cpuid, 1);
>  	check_misaligned_access(curr_cpuid);
> -	probe_vendor_features(curr_cpuid);
> =20
>  	if (has_vector()) {
>  		if (riscv_v_setup_vsize())
> --=20
> 2.34.1
>=20

--dm2SjiLkQREWuB17
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJmNgQAKCRB4tDGHoIJi
0uZ1AQCaXD/7qRSevo8gVSDWW1BMzamB/j0Byc20k2xUgtD4WQD+J9sfr3d7bckd
U0eAHnNUuxiYihEdPeHVoeLUk0n8qQ4=
=4xip
-----END PGP SIGNATURE-----

--dm2SjiLkQREWuB17--


--===============5769571512661136645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5769571512661136645==--

