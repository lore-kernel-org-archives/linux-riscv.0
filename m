Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6529BC3ABB2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rioNPMr5AZvGtdvb7wc0T7v7QTBr6mK4e9Zrc0Hk9IE=; b=hTwUNQMcXrN4GbZRb6Yk7qw5Ws
	9ME6aILFg8NuTMuwLN4YfRZP4SRV1rdICWrBf6f+XGFHTfX1hKl3bmtQ0R0LsFAc2nDseqCV3j78r
	UN9FSzxAH1bsdXem+tAh3XO9bYFJ2heGLrG83Z/VMXxLdKK7vw5ovi+7J/1R9P2JOqhFNsKpr6UMP
	7W/4aklzKvjzCMRs+sMN9cb94IdDcUdUMFOb90LI/H0iplKyxcgaYrUtrTg4qVRzYcV1sNHKI+xHb
	c2cEXOHO/AIzUvx29qdFuUuGvoB5pPr0Zy6EOhEO+DNU89U1GXLKKGkzP/CBD4IIdM/CzB394ML0P
	8UDAy6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFGt-00000004Ymw-0n6p;
	Mon, 16 Sep 2024 17:12:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFGm-00000004Yl5-2jyZ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 17:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F61C5C03A3;
	Mon, 16 Sep 2024 17:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F43DC4CEC4;
	Mon, 16 Sep 2024 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726506731;
	bh=ESyQ19D7oY453VbqYsz3XtbEyH1pkWUw3SfThNLvBeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3RBDNKqnKDFIMG0mPW/j5cOna+tieuvNQzY5kyyq91/e9nzLStnQVM7rhf9MXQVr
	 wj2z96u9fAtlMT2N+5Bb5rvUczabmv479ylyy957Xa8rhmLkSZr8a960AJalIKwb/Y
	 uuEqmDiNjIYDix+MB1Vu12/cIDRNvT5TTZoc5H9glGHAMiijHo/ij20SmXxhQwnaY7
	 x7P9QMJrD0ea2CuxOaVAXnKGYl28713NWryQED2HaluTPLvgQTzkUMX8iTWIp/lJ82
	 yPpRjGwDNP4iUfak9BqkzQBpZ3TXtGmzWvbVQqB8NTHZd8+RY/QvQ+ca1mGw4rOYwh
	 e5gREl43NaYxQ==
Date: Mon, 16 Sep 2024 18:12:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 14/14] riscv: Add ghostwrite vulnerability
Message-ID: <20240916-pretext-freehand-20dca1376cd4@spud>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <20240911-xtheadvector-v10-14-8d3930091246@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240911-xtheadvector-v10-14-8d3930091246@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_101212_861712_351F3F6C 
X-CRM114-Status: GOOD (  40.52  )
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
Content-Type: multipart/mixed; boundary="===============5387412865832581413=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5387412865832581413==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BDWQktOaFXWzZKLA"
Content-Disposition: inline


--BDWQktOaFXWzZKLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 10:55:22PM -0700, Charlie Jenkins wrote:
> Follow the patterns of the other architectures that use
> GENERIC_CPU_VULNERABILITIES for riscv to introduce the ghostwrite
> vulnerability and mitigation. The mitigation is to disable all vector
> which is accomplished by clearing the bit from the cpufeature field.
>=20
> Ghostwrite only affects thead c9xx CPUs that impelment xtheadvector, so
> the vulerability will only be mitigated on these CPUs.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig.errata            | 11 ++++++++
>  arch/riscv/errata/thead/errata.c     | 28 ++++++++++++++++++
>  arch/riscv/include/asm/bugs.h        | 22 +++++++++++++++
>  arch/riscv/include/asm/errata_list.h |  3 +-
>  arch/riscv/kernel/Makefile           |  2 ++
>  arch/riscv/kernel/bugs.c             | 55 ++++++++++++++++++++++++++++++=
++++++
>  arch/riscv/kernel/cpufeature.c       |  9 +++++-
>  drivers/base/cpu.c                   |  3 ++
>  include/linux/cpu.h                  |  1 +
>  9 files changed, 132 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 2acc7d876e1f..e318119d570d 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -119,4 +119,15 @@ config ERRATA_THEAD_PMU
> =20
>  	  If you don't know what to do here, say "Y".
> =20
> +config ERRATA_THEAD_GHOSTWRITE
> +	bool "Apply T-Head Ghostwrite errata"
> +	depends on ERRATA_THEAD && RISCV_ISA_XTHEADVECTOR
> +	default y
> +	help
> +	  The T-Head C9xx cores have a vulnerability in the xtheadvector
> +	  instruction set. When this errata is enabled, the CPUs will be probed
> +	  to determine if they are vulnerable and disable xtheadvector.
> +
> +	  If you don't know what to do here, say "Y".
> +
>  endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index f5120e07c318..5cc008ab41a8 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -10,6 +10,7 @@
>  #include <linux/string.h>
>  #include <linux/uaccess.h>
>  #include <asm/alternative.h>
> +#include <asm/bugs.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/dma-noncoherent.h>
> @@ -142,6 +143,31 @@ static bool errata_probe_pmu(unsigned int stage,
>  	return true;
>  }
> =20
> +static bool errata_probe_ghostwrite(unsigned int stage,
> +				    unsigned long arch_id, unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_GHOSTWRITE))
> +		return false;
> +
> +	/*
> +	 * target-c9xx cores report arch_id and impid as 0
> +	 *
> +	 * While ghostwrite may not affect all c9xx cores that implement
> +	 * xtheadvector, there is no futher granularity than c9xx. Assume
> +	 * vulnerable for this entire class of processors when xtheadvector is
> +	 * enabled.
> +	 */

Is it not possible to use the cpu compatible string for this? Given that
we only know if xtheadvector is enabled once we are already parsing the
cpu node devicetree, it seems, to me, as if it should be possible to be
more granular. AFAIU, some T-Head c900 series devices are not venerable.

Cheers,
Conor.

> +	if (arch_id !=3D 0 || impid !=3D 0)
> +		return false;
> +
> +	if (stage !=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return false;
> +
> +	ghostwrite_set_vulnerable();
> +
> +	return true;
> +}
> +
>  static u32 thead_errata_probe(unsigned int stage,
>  			      unsigned long archid, unsigned long impid)
>  {
> @@ -155,6 +181,8 @@ static u32 thead_errata_probe(unsigned int stage,
>  	if (errata_probe_pmu(stage, archid, impid))
>  		cpu_req_errata |=3D BIT(ERRATA_THEAD_PMU);
> =20
> +	errata_probe_ghostwrite(stage, archid, impid);
> +
>  	return cpu_req_errata;
>  }
> =20
> diff --git a/arch/riscv/include/asm/bugs.h b/arch/riscv/include/asm/bugs.h
> new file mode 100644
> index 000000000000..e294b15bf78e
> --- /dev/null
> +++ b/arch/riscv/include/asm/bugs.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Interface for managing mitigations for riscv vulnerabilities.
> + *
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#ifndef __ASM_BUGS_H
> +#define __ASM_BUGS_H
> +
> +/* Watch out, ordering is important here. */
> +enum mitigation_state {
> +	UNAFFECTED,
> +	MITIGATED,
> +	VULNERABLE,
> +};
> +
> +void ghostwrite_set_vulnerable(void);
> +void ghostwrite_enable_mitigation(void);
> +enum mitigation_state ghostwrite_get_state(void);
> +
> +#endif /* __ASM_BUGS_H */
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index 7c8a71a526a3..6e426ed7919a 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -25,7 +25,8 @@
>  #ifdef CONFIG_ERRATA_THEAD
>  #define	ERRATA_THEAD_MAE 0
>  #define	ERRATA_THEAD_PMU 1
> -#define	ERRATA_THEAD_NUMBER 2
> +#define	ERRATA_THEAD_GHOSTWRITE 2
> +#define	ERRATA_THEAD_NUMBER 3
>  #endif
> =20
>  #ifdef __ASSEMBLY__
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 06d407f1b30b..d7a54e34178e 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -113,3 +113,5 @@ obj-$(CONFIG_COMPAT)		+=3D compat_vdso/
>  obj-$(CONFIG_64BIT)		+=3D pi/
>  obj-$(CONFIG_ACPI)		+=3D acpi.o
>  obj-$(CONFIG_ACPI_NUMA)	+=3D acpi_numa.o
> +
> +obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) +=3D bugs.o
> diff --git a/arch/riscv/kernel/bugs.c b/arch/riscv/kernel/bugs.c
> new file mode 100644
> index 000000000000..0c19691b4cd5
> --- /dev/null
> +++ b/arch/riscv/kernel/bugs.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/device.h>
> +#include <linux/sprintf.h>
> +
> +#include <asm/bugs.h>
> +#include <asm/vendor_extensions/thead.h>
> +
> +static enum mitigation_state ghostwrite_state;
> +
> +void ghostwrite_set_vulnerable(void)
> +{
> +	ghostwrite_state =3D VULNERABLE;
> +}
> +
> +/*
> + * Vendor extension alternatives will use the value set at the time of b=
oot
> + * alternative patching, thus this must be called before boot alternativ=
es are
> + * patched (and after extension probing) to be effective.
> + */
> +void ghostwrite_enable_mitigation(void)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR) &&
> +	    ghostwrite_state =3D=3D VULNERABLE && !cpu_mitigations_off()) {
> +		disable_xtheadvector();
> +		ghostwrite_state =3D MITIGATED;
> +	}
> +}
> +
> +enum mitigation_state ghostwrite_get_state(void)
> +{
> +	return ghostwrite_state;
> +}
> +
> +ssize_t cpu_show_ghostwrite(struct device *dev, struct device_attribute =
*attr, char *buf)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR)) {
> +		switch (ghostwrite_state) {
> +		case UNAFFECTED:
> +			return sprintf(buf, "Not affected\n");
> +		case MITIGATED:
> +			return sprintf(buf, "Mitigation: xtheadvector disabled\n");
> +		case VULNERABLE:
> +			fallthrough;
> +		default:
> +			return sprintf(buf, "Vulnerable\n");
> +		}
> +	} else {
> +		return sprintf(buf, "Not affected\n");
> +	}
> +}
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 56b5054b8f86..1f4329bb8a9d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -17,6 +17,7 @@
>  #include <linux/of.h>
>  #include <asm/acpi.h>
>  #include <asm/alternative.h>
> +#include <asm/bugs.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/hwcap.h>
> @@ -867,7 +868,13 @@ static int __init riscv_fill_hwcap_from_ext_list(uns=
igned long *isa2hwcap)
>  		riscv_fill_vendor_ext_list(cpu);
>  	}
> =20
> -	if (has_xtheadvector_no_alternatives() && has_thead_homogeneous_vlenb()=
 < 0) {
> +	/*
> +	 * Execute ghostwrite mitigation immediately after detecting extensions
> +	 * to disable xtheadvector if necessary.
> +	 */
> +	if (ghostwrite_get_state() =3D=3D VULNERABLE) {
> +		ghostwrite_enable_mitigation();
> +	} else if (has_xtheadvector_no_alternatives() && has_thead_homogeneous_=
vlenb() < 0) {
>  		pr_warn("Unsupported heterogeneous vlenb detected, vector extension di=
sabled.\n");
>  		disable_xtheadvector();
>  	}
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index fdaa24bb641a..a7e511849875 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -599,6 +599,7 @@ CPU_SHOW_VULN_FALLBACK(retbleed);
>  CPU_SHOW_VULN_FALLBACK(spec_rstack_overflow);
>  CPU_SHOW_VULN_FALLBACK(gds);
>  CPU_SHOW_VULN_FALLBACK(reg_file_data_sampling);
> +CPU_SHOW_VULN_FALLBACK(ghostwrite);
> =20
>  static DEVICE_ATTR(meltdown, 0444, cpu_show_meltdown, NULL);
>  static DEVICE_ATTR(spectre_v1, 0444, cpu_show_spectre_v1, NULL);
> @@ -614,6 +615,7 @@ static DEVICE_ATTR(retbleed, 0444, cpu_show_retbleed,=
 NULL);
>  static DEVICE_ATTR(spec_rstack_overflow, 0444, cpu_show_spec_rstack_over=
flow, NULL);
>  static DEVICE_ATTR(gather_data_sampling, 0444, cpu_show_gds, NULL);
>  static DEVICE_ATTR(reg_file_data_sampling, 0444, cpu_show_reg_file_data_=
sampling, NULL);
> +static DEVICE_ATTR(ghostwrite, 0444, cpu_show_ghostwrite, NULL);
> =20
>  static struct attribute *cpu_root_vulnerabilities_attrs[] =3D {
>  	&dev_attr_meltdown.attr,
> @@ -630,6 +632,7 @@ static struct attribute *cpu_root_vulnerabilities_att=
rs[] =3D {
>  	&dev_attr_spec_rstack_overflow.attr,
>  	&dev_attr_gather_data_sampling.attr,
>  	&dev_attr_reg_file_data_sampling.attr,
> +	&dev_attr_ghostwrite.attr,
>  	NULL
>  };
> =20
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index bdcec1732445..6a0a8f1c7c90 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -77,6 +77,7 @@ extern ssize_t cpu_show_gds(struct device *dev,
>  			    struct device_attribute *attr, char *buf);
>  extern ssize_t cpu_show_reg_file_data_sampling(struct device *dev,
>  					       struct device_attribute *attr, char *buf);
> +extern ssize_t cpu_show_ghostwrite(struct device *dev, struct device_att=
ribute *attr, char *buf);
> =20
>  extern __printf(4, 5)
>  struct device *cpu_device_create(struct device *parent, void *drvdata,
>=20
> --=20
> 2.45.0
>=20

--BDWQktOaFXWzZKLA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuhm5AAKCRB4tDGHoIJi
0o/8AP46nRHLzYJMf/Kn0ccLu8HgFMl06xA2uZNL2DRsNcsvYwEA6UAJp/+RMDFw
Rn7EJEd5f5gEMcMAQ8ZT4ak2Y/t3kws=
=fR+0
-----END PGP SIGNATURE-----

--BDWQktOaFXWzZKLA--


--===============5387412865832581413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5387412865832581413==--

