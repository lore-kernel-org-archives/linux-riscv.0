Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCD5C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WI8VCI1MFw2ooRCpqh2F2mrY8vqlksv658oc1ea9N3M=; b=Zim9tsyPLCMyfTnlA+6Im9598X
	0nGn074jHh68LEkjdCVyLv6t3rOYdvWLZ2kMQMA2y1P/lQGvvZADl57sxrdd60ivDi9UCjMhQf+0X
	FCwlAQaTYvYtKZxBI1b7bBPULyUg6vXX52Op0J/Qsz3ulZdF1vUMu+B6Ec5geQAlTx65/WYtYF1Cn
	w+1fEuai7ENnsycJdpZhHug1fK4c3wJShidXN0gEiFHD+JsN2sUYxanBkR9pLePZBjYWBapXMf9qH
	l9Z6lwowmq1o7xnCtBOJOLZWYD5Nt61dqay/f0NGBh6PHDe6H9Ble0pPBsSGcHb/Kcsx52CmHgSRg
	qm2sWudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjn2v-002nBI-2u;
	Tue, 04 Apr 2023 20:14:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjn2s-002nAr-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 20:14:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88388637CA;
	Tue,  4 Apr 2023 20:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1261C433EF;
	Tue,  4 Apr 2023 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680639261;
	bh=EUQn7T8a3M9PzrwxAvGqhMkuxXe25iX603eeV8Q7Q8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Odi9/Z94JpvxWhQgGcLLMGd7MrCoug6vCduYrwBlQ7fdnM1VOUWhaKBlJEGtRkAZk
	 GEwxftJLSuEDi/mKm7st7BKfnoMS1bn/BcHUzRDDkUJm/k5pQOUo3NPEoGx1Q1y11x
	 M6R637VDm4yk4DSmHRtHnDgqhphTrXxGFy4E8sAsShoKZjiYOYWHFWcW8xPK2vB1o6
	 PZ6IlJzWvzY3Db3r79TYLoElIrjDBQ8H3cqHfNd7Aa4uDaZcb53DXQjdQXkcIXonoA
	 bCqsd2VEzLuzxd0VSx+w+rVjqpHVqHhBCZQPDLOJ5jBo+G5UodefGPKFahEWTSr8Ep
	 33L6rUqNhM3Pw==
Date: Tue, 4 Apr 2023 21:14:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Weili Qian <qianweili@huawei.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Len Brown <lenb@kernel.org>
Subject: Re: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <20230404-swimwear-rectified-0af4fdec8237@spud>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230404182037.863533-9-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_131422_301533_7326B675 
X-CRM114-Status: GOOD (  31.52  )
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
Content-Type: multipart/mixed; boundary="===============1229122024992410019=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1229122024992410019==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oEdV+y0PISeGfqrA"
Content-Disposition: inline


--oEdV+y0PISeGfqrA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 11:50:22PM +0530, Sunil V L wrote:
> RINTC structures in the MADT provide mapping between the hartid
> and the CPU. This is required many times even at run time like
> cpuinfo. So, instead of parsing the ACPI table every time, cache
> the RINTC structures and provide a function to get the correct
> RINTC structure for a given cpu.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/include/asm/acpi.h |  2 ++
>  arch/riscv/kernel/acpi.c      | 60 +++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 9be52b6ffae1..1606dce8992e 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -59,6 +59,8 @@ static inline bool acpi_has_cpu_in_madt(void)
> =20
>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> =20
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> +u32 get_acpi_id_for_cpu(int cpu);
>  #endif /* CONFIG_ACPI */
> =20
>  #endif /*_ASM_ACPI_H*/
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 81d448c41714..40ab55309c70 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -24,6 +24,66 @@ EXPORT_SYMBOL(acpi_disabled);
>  int acpi_pci_disabled =3D 1;	/* skip ACPI PCI scan and IRQ initializatio=
n */
>  EXPORT_SYMBOL(acpi_pci_disabled);
> =20
> +static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
> +
> +static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, co=
nst unsigned long end)
> +{
> +	struct acpi_madt_rintc *rintc =3D (struct acpi_madt_rintc *)header;
> +	int cpuid;
> +
> +	if (!(rintc->flags & ACPI_MADT_ENABLED))
> +		return 0;
> +
> +	cpuid =3D riscv_hartid_to_cpuid(rintc->hart_id);
> +	/*
> +	 * When CONFIG_SMP is disabled, mapping won't be created for
> +	 * all cpus.
> +	 * CPUs more than NR_CPUS, will be ignored.
> +	 */
> +	if (cpuid >=3D 0 && cpuid < NR_CPUS)
> +		cpu_madt_rintc[cpuid] =3D *rintc;
> +
> +	return 0;
> +}
> +
> +static int acpi_init_rintc_array(void)
> +{
> +	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, =
0) > 0)

Does this not return an actual ERRNO? Na=EFvely following the call chain,
it looks like it should do. If it does, why not return that instead of
always returning -ENODEV?

> +		return 0;
> +
> +	return -ENODEV;
> +}
> +
> +/*
> + * Instead of parsing (and freeing) the ACPI table, cache
> + * the RINTC structures since they are frequently used
> + * like in  cpuinfo.
> + */
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> +{
> +	static bool rintc_init_done;
> +
> +	if (!rintc_init_done) {
> +		if (acpi_init_rintc_array()) {
> +			pr_err("No valid RINTC entries exist\n");
> +			return NULL;
> +		}
> +
> +		rintc_init_done =3D true;
> +	}
> +
> +	return &cpu_madt_rintc[cpu];
> +}
> +
> +u32 get_acpi_id_for_cpu(int cpu)
> +{
> +	struct acpi_madt_rintc *rintc =3D acpi_cpu_get_madt_rintc(cpu);
> +
> +	BUG_ON(!rintc);
> +
> +	return rintc->uid;
> +}
> +
>  /*
>   * __acpi_map_table() will be called before paging_init(), so early_iore=
map()
>   * or early_memremap() should be called here to for ACPI table mapping.
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--oEdV+y0PISeGfqrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCyFFQAKCRB4tDGHoIJi
0gKBAQDcTO40blVgsUNV2iaJYnGn0YlRxh3ok4Q5d4+my2lbpwD+OaaIr6Ztj6Ln
xcNjOUhNfIh+baomZf6AzzNdQx5f6Qg=
=lmTU
-----END PGP SIGNATURE-----

--oEdV+y0PISeGfqrA--


--===============1229122024992410019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1229122024992410019==--

