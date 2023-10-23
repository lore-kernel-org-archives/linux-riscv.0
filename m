Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F01CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPkNoBNC7WNrydKcGmak6Uxy1rI0NUcrNZb6QjpTl6A=; b=MoczlVs8cEhC96ePSItZR5gdKC
	bu4I4Q2J0C9/hNorKAGZ1yXJbQJwzR/TZvo4kizX7WI3WVFQJIMybHmzuq3L06NEle2K69WkKDf3o
	pryw/xc7YJNjC8p0xEpVy9WiozJyExNS4QZGdVTVBS+TotUr65hjUsIAbwbaesywisDLG3tQ+D07k
	dzHDEXVcedQe1KV169RJQMPHZ4xQSdlLAHAvfycA8193znlSwIlsxkmNGiWb365OFYcM6uUmW/wE8
	3Y7YHsYzpLhlUxVkGrSprJ4o6CiqUcSieIj/JwMf4IMPwvbO/2OBM1qCdkGPM334y2K2nj010s+hk
	07azrQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qutY6-007IVV-0Q;
	Mon, 23 Oct 2023 11:56:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qutY1-007ITc-22;
	Mon, 23 Oct 2023 11:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D37E9B8124B;
	Mon, 23 Oct 2023 11:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EA0C433C8;
	Mon, 23 Oct 2023 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698062199;
	bh=ye0Dbd8QYVtEN8vg7b7frsXs9Dqrk9uXB/oe2lWo/oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CvbdBVeaxqqYJ3oP/sI6EYSHPI7ct4J1bHnZpQDi4wc3tPSFA99qY+nyyFYOCIHJP
	 exnZC9FL8kgYxF6wjhENzNjRsgIQFJ2t14BjQ9QlaFNgW9tdl3+JRdGg/Hr+PCnUx0
	 PcQIqu3MZ3pVDWEaWSdknKZOwCsD0WXrqgPiAyukRVjjEvRqB1bZgO7HrqPsApRg2v
	 ruyo4J3L3/KsbzqUmOk+bvEWKgR1kdaU0jtwaBpeFjy3N83SZ0w/y1VcewUfu3j2wA
	 j8f6yb+F1f+BbO3kfV0oLlt4cAqkNw3u4N7m0IgBBq/Up2k8H/k4cmRHJH6QALVw18
	 xsqr7vsJFaGqA==
Date: Mon, 23 Oct 2023 12:56:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [RFC PATCH v3 RESEND 07/13] RISC-V: Move T-Head PMU to CPU
 feature alternative framework
Message-ID: <20231023-derived-rind-cfec145c9ce6@spud>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-8-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231023004100.2663486-8-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_045641_943517_220DC532 
X-CRM114-Status: GOOD (  33.42  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============5573282608388023410=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5573282608388023410==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3CrJUMx+JJd/NlXH"
Content-Disposition: inline


--3CrJUMx+JJd/NlXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 08:40:54AM +0800, Yu Chien Peter Lin wrote:
> The custom PMU extension aims to support perf event sampling prior
> to the ratification of Sscofpmf. Instead of utilizing the bits and
> CSRs reserved for future standard, a set of custom CSRs is added.
> Hence, we may consider it as a CPU feature rather than an erratum.
>=20
> T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
> for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
> for proper functioning as of this commit.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Hi All,
>=20
> This is in preparation for introducing other PMU alternative.
> We follow Conor's suggestion [1] to use cpu feature alternative
> framework rather than errata, if you want to stick with errata
> alternative or have other issues, please let me know. Thanks.

I replied to the discussion on v2 earlier this morning (please try to
wait for previous conversations to resolve before sending new versions)
commenting on this patch:
https://lore.kernel.org/linux-riscv/20231023-impulse-quickness-4c7076e6eb58=
@spud/T/#m77982ce990577b974edd24bb3ac175737b2a621c

Sticking with the existing method for the t-head stuff isn't a matter
of how the code is structured, but a question of regressing existing
platforms.

Cheers,
Conor.

>=20
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20230907021635=
=2E1002738-4-peterlin@andestech.com/#25503860
>=20
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Removed m{vendor/arch/imp}id checks in pmu_sbi_setup_irqs()
> ---
>  arch/riscv/Kconfig.errata            | 13 -------------
>  arch/riscv/errata/thead/errata.c     | 19 -------------------
>  arch/riscv/include/asm/errata_list.h | 15 +--------------
>  arch/riscv/include/asm/hwcap.h       |  1 +
>  arch/riscv/kernel/cpufeature.c       |  1 +
>  drivers/perf/Kconfig                 | 13 +++++++++++++
>  drivers/perf/riscv_pmu_sbi.c         | 19 ++++++++++++++-----
>  7 files changed, 30 insertions(+), 51 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 566bcefeab50..35dfb19d6a29 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -85,17 +85,4 @@ config ERRATA_THEAD_CMO
> =20
>  	  If you don't know what to do here, say "Y".
> =20
> -config ERRATA_THEAD_PMU
> -	bool "Apply T-Head PMU errata"
> -	depends on ERRATA_THEAD && RISCV_PMU_SBI
> -	default y
> -	help
> -	  The T-Head C9xx cores implement a PMU overflow extension very
> -	  similar to the core SSCOFPMF extension.
> -
> -	  This will apply the overflow errata to handle the non-standard
> -	  behaviour via the regular SBI PMU driver and interface.
> -
> -	  If you don't know what to do here, say "Y".
> -
>  endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index 0554ed4bf087..5de5f7209132 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -53,22 +53,6 @@ static bool errata_probe_cmo(unsigned int stage,
>  	return true;
>  }
> =20
> -static bool errata_probe_pmu(unsigned int stage,
> -			     unsigned long arch_id, unsigned long impid)
> -{
> -	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
> -		return false;
> -
> -	/* target-c9xx cores report arch_id and impid as 0 */
> -	if (arch_id !=3D 0 || impid !=3D 0)
> -		return false;
> -
> -	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> -		return false;
> -
> -	return true;
> -}
> -
>  static u32 thead_errata_probe(unsigned int stage,
>  			      unsigned long archid, unsigned long impid)
>  {
> @@ -80,9 +64,6 @@ static u32 thead_errata_probe(unsigned int stage,
>  	if (errata_probe_cmo(stage, archid, impid))
>  		cpu_req_errata |=3D BIT(ERRATA_THEAD_CMO);
> =20
> -	if (errata_probe_pmu(stage, archid, impid))
> -		cpu_req_errata |=3D BIT(ERRATA_THEAD_PMU);
> -
>  	return cpu_req_errata;
>  }
> =20
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index c190393aa9db..1b5354a50d55 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -25,8 +25,7 @@
>  #ifdef CONFIG_ERRATA_THEAD
>  #define	ERRATA_THEAD_PBMT 0
>  #define	ERRATA_THEAD_CMO 1
> -#define	ERRATA_THEAD_PMU 2
> -#define	ERRATA_THEAD_NUMBER 3
> +#define	ERRATA_THEAD_NUMBER 2
>  #endif
> =20
>  #ifdef __ASSEMBLY__
> @@ -147,18 +146,6 @@ asm volatile(ALTERNATIVE_2(						\
>  	    "r"((unsigned long)(_start) + (_size))			\
>  	: "a0")
> =20
> -#define THEAD_C9XX_RV_IRQ_PMU			17
> -#define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
> -
> -#define ALT_SBI_PMU_OVERFLOW(__ovl)					\
> -asm volatile(ALTERNATIVE(						\
> -	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
> -	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
> -		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
> -		CONFIG_ERRATA_THEAD_PMU)				\
> -	: "=3Dr" (__ovl) :						\
> -	: "memory")
> -
>  #endif /* __ASSEMBLY__ */
> =20
>  #endif
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b7b58258f6c7..d3082391c901 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -58,6 +58,7 @@
>  #define RISCV_ISA_EXT_ZICSR		40
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
> +#define RISCV_ISA_EXT_XTHEADPMU		43
> =20
>  #define RISCV_ISA_EXT_MAX		64
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 1cfbba65d11a..4a3fb017026c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -181,6 +181,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA(xtheadpmu, RISCV_ISA_EXT_XTHEADPMU),
>  };
> =20
>  const size_t riscv_isa_ext_count =3D ARRAY_SIZE(riscv_isa_ext);
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 273d67ecf6d2..c71b6f16bdfa 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -86,6 +86,19 @@ config RISCV_PMU_SBI
>  	  full perf feature support i.e. counter overflow, privilege mode
>  	  filtering, counter configuration.
> =20
> +config THEAD_CUSTOM_PMU
> +	bool "T-Head custom PMU support"
> +	depends on RISCV_ALTERNATIVE && RISCV_PMU_SBI
> +	default y
> +	help
> +	  The T-Head C9xx cores implement a PMU overflow extension very
> +	  similar to the core SSCOFPMF extension.
> +
> +	  This will patch the overflow CSR and handle the non-standard
> +	  behaviour via the regular SBI PMU driver and interface.
> +
> +	  If you don't know what to do here, say "Y".
> +
>  config ARM_PMU_ACPI
>  	depends on ARM_PMU && ACPI
>  	def_bool y
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index f340db9ce1e2..a3d5ededfd45 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -20,10 +20,21 @@
>  #include <linux/cpu_pm.h>
>  #include <linux/sched/clock.h>
> =20
> -#include <asm/errata_list.h>
>  #include <asm/sbi.h>
>  #include <asm/hwcap.h>
> =20
> +#define THEAD_C9XX_RV_IRQ_PMU		17
> +#define THEAD_C9XX_CSR_SCOUNTEROF	0x5c5
> +
> +#define ALT_SBI_PMU_OVERFLOW(__ovl)					\
> +asm volatile(ALTERNATIVE(						\
> +	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
> +	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
> +		0, RISCV_ISA_EXT_XTHEADPMU,				\
> +		CONFIG_THEAD_CUSTOM_PMU)				\
> +	: "=3Dr" (__ovl) :						\
> +	: "memory")
> +
>  #define SYSCTL_NO_USER_ACCESS	0
>  #define SYSCTL_USER_ACCESS	1
>  #define SYSCTL_LEGACY		2
> @@ -805,10 +816,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu,=
 struct platform_device *pde
>  	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
>  		riscv_pmu_irq_num =3D RV_IRQ_PMU;
>  		riscv_pmu_use_irq =3D true;
> -	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
> -		   riscv_cached_mvendorid(0) =3D=3D THEAD_VENDOR_ID &&
> -		   riscv_cached_marchid(0) =3D=3D 0 &&
> -		   riscv_cached_mimpid(0) =3D=3D 0) {
> +	} else if (riscv_isa_extension_available(NULL, XTHEADPMU) &&
> +		   IS_ENABLED(CONFIG_THEAD_CUSTOM_PMU)) {
>  		riscv_pmu_irq_num =3D THEAD_C9XX_RV_IRQ_PMU;
>  		riscv_pmu_use_irq =3D true;
>  	}
> --=20
> 2.34.1
>=20

--3CrJUMx+JJd/NlXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTZfbAAKCRB4tDGHoIJi
0hb7AQChme18l0KgHqpprLTN0kROM107t9194FKQxmlCBOo+9gD+N9abwsMMJfKh
0A9X4v4ePpcB8tvAnnz58cMfLZt0OAs=
=CUTY
-----END PGP SIGNATURE-----

--3CrJUMx+JJd/NlXH--


--===============5573282608388023410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5573282608388023410==--

