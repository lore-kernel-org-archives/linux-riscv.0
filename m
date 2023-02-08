Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC8AC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4Jms+Ix+ABx1YzMP7Nw+ITk5XhKHY1PtWKMWW8B1EA=; b=FORjySsN+BG9l0/3QOLM/lMARe
	X/GBRbIn930jsvo2Dr2Wq9TRmOxzfR46UmU0FnZgD2UtfLjZq2DAYEFZFTLlAdDCxuBupUayNuSGc
	EGLRQ0xupsv+Pd0rJTStKpLEgxBu26DIYnJ3ypcbwVPMt2+KzwiTRe9gUAWMM56/gSIPj+NiJstS1
	Flaw+z1R/TDB4bf4ocltz7jd+R9duCrq+zFW6ja2XeHArBP+h2KxDtLBCzXApjrr8/ygYwo+W0LoZ
	oV08hJNWFjQP7863T/6j8vbM4h1j94DlG0a7kmuHjcB2YpsUo3u5txgrEhjKaB4RKbl6h32XHQrQv
	1niFaUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPse2-00H3D4-Ea; Wed, 08 Feb 2023 22:10:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsdz-00H3Bm-99
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 22:10:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7D58EB81FBC;
	Wed,  8 Feb 2023 22:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1521AC433D2;
	Wed,  8 Feb 2023 22:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675894220;
	bh=XVxjVUrRTJMXekRe8IZaijGwGSF2ZmqoQLEohJud26E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFLRdU1oPEPaTBobg0kMQ3XiQfJjz+jfF8+6uIqJro3fQbM2JuiAoNJsVE1OzzODQ
	 kb72fmJRHtI4mE2/wv+kQZ6ALpuIXyKYOXdubDZ75by/lvy0H7r9JBlvLRPrdSDAIY
	 jb5FWhTayc6ogQ9reLsU6PrMosSevsh/9PWxObeEm068DdohrmZ3AfMGQ9EWEF9fQV
	 teiR6pXveERO0S6U5iQmI9RPuyNOhTBiWdpdx3rS9xjtZGXqexOQqwsRyjU4ScYetd
	 dbpBxl6ZUC0yZYQ0boy0YYZ76t1Eua9XLM2SDqZ9tlkunPIqD9v81BQOa7Ym0q06Zw
	 uytPz1fsX9AOw==
Date: Wed, 8 Feb 2023 22:10:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 13/24] RISC-V: ACPI: smpboot: Add ACPI support in
 smp_setup()
Message-ID: <Y+Qdxg8LBs5mbl4+@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-14-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-14-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_141023_673795_5D784958 
X-CRM114-Status: GOOD (  36.22  )
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
Content-Type: multipart/mixed; boundary="===============7403165348863012649=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7403165348863012649==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mo18E0oC3+AOVGLw"
Content-Disposition: inline


--mo18E0oC3+AOVGLw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:14PM +0530, Sunil V L wrote:
> Add function to parse the RINTC structure in
> the MADT table and create the required initializations to
> enable SMP boot on ACPI based platforms.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/acpi.h |  7 ++++
>  arch/riscv/kernel/smpboot.c   | 73 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 79 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index c5cb9f96d404..d1f1e53ec657 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -58,6 +58,13 @@ static inline bool acpi_has_cpu_in_madt(void)
>  }
> =20
>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> +
> +#ifdef CONFIG_ACPI_NUMA
> +int acpi_numa_get_nid(unsigned int cpu);
> +#else
> +static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_N=
ODE; }
> +#endif /* CONFIG_ACPI_NUMA */
> +
>  #endif
> =20
>  #endif /*_ASM_ACPI_H*/
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 26214ddefaa4..e48cf88d0bc1 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2017 SiFive
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/arch_topology.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -70,6 +71,73 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  }
> =20
> +#ifdef CONFIG_ACPI
> +static unsigned int cpu_count =3D 1;
> +
> +static int __init
> +acpi_parse_rintc(union acpi_subtable_headers *header,
> +			     const unsigned long end)

This all fits on one line. And also avoids the checkpatch complaint from
what you have currently done...

> +{
> +	unsigned long hart;
> +	bool found_boot_cpu =3D false;
> +
> +	struct acpi_madt_rintc *processor;
> +
> +	processor =3D (struct acpi_madt_rintc *)header;

Why not combine the above two lines?

> +	/* RINTC entry which has !ACPI_MADT_ENABLED is not enabled so skip */

This comment is a bit -ENOPARSE. Please reword it in a way that is
understandable to mere mortals like myself.

> +	if (!(processor->flags & ACPI_MADT_ENABLED))
> +		return 0;
> +
> +	hart =3D processor->hart_id;
> +	if (hart < 0)
> +		return 0;

Newline here please

> +	if (hart =3D=3D cpuid_to_hartid_map(0)) {
> +		BUG_ON(found_boot_cpu);
> +		found_boot_cpu =3D 1;

This is a bool, why not assign a bool value to it so it looks more
intentional? I know this is copied from the dt code, but that should
really be on too IMO.

> +		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
> +		return 0;
> +	}

And a newline here too...

> +	if (cpu_count >=3D NR_CPUS) {
> +		pr_warn("Invalid cpuid [%d] for hartid [%lu]\n",
> +			cpu_count, hart);
> +		return 0;
> +	}
> +
> +	cpuid_to_hartid_map(cpu_count) =3D hart;
> +	early_map_cpu_to_node(cpu_count, acpi_numa_get_nid(cpu_count));
> +	cpu_count++;

=2E..and also here please!

> +	return 0;
> +}
> +
> +static void __init acpi_parse_and_init_cpus(void)
> +{
> +	int cpuid;
> +
> +	cpu_set_ops(0);

While I'm at it suggesting newline additions, adding them before
comments would be great too.

> +	/*
> +	 * do a walk of MADT to determine how many CPUs
> +	 * we have including disabled CPUs, and get information
> +	 * we need for SMP init.
> +	 */
> +	acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC,
> +				      acpi_parse_rintc, 0);
> +
> +	/*
> +	 * NUMA - TODO
> +	 */

TODO before merging, or TODO at some indeterminate point in the future?

Anyways, this is all nits & this largely seem to resemble the dt code,
so with the nits fixed (and an s/ACPI: // in $subject):
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +	for (cpuid =3D 1; cpuid < nr_cpu_ids; cpuid++) {
> +		if (cpuid_to_hartid_map(cpuid) !=3D INVALID_HARTID) {
> +			cpu_set_ops(cpuid);
> +			set_cpu_possible(cpuid, true);
> +		}
> +	}
> +}
> +#else
> +#define acpi_parse_and_init_cpus(...)	do { } while (0)
> +#endif
> +
>  static void __init of_parse_and_init_cpus(void)
>  {
>  	struct device_node *dn;
> @@ -118,7 +186,10 @@ static void __init of_parse_and_init_cpus(void)
> =20
>  void __init setup_smp(void)
>  {
> -	of_parse_and_init_cpus();
> +	if (acpi_disabled)
> +		of_parse_and_init_cpus();
> +	else
> +		acpi_parse_and_init_cpus();
>  }
> =20
>  static int start_secondary_cpu(int cpu, struct task_struct *tidle)
> --=20
> 2.38.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--mo18E0oC3+AOVGLw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+QdxgAKCRB4tDGHoIJi
0mYzAQCje2xPmfoUKUo3YwQThJBacTIIFH5J2oMBl6ngBZ+FdwD/SLgyM6yOKUw6
o1k5955yH/LsIcrq+z5XQy71gq8yRQ8=
=K1kC
-----END PGP SIGNATURE-----

--mo18E0oC3+AOVGLw--


--===============7403165348863012649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7403165348863012649==--

