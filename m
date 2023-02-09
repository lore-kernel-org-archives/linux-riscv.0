Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EA2C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 20:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxNhAIF2Z/QMXODHgMrlXRN086U/pPlFrsxGL36aD5U=; b=vG9MavHgZtxr4uRGwwI6/zP+I0
	dN608c6ii1RE3REPiINLd24+pDNVp0Dzk35i123zspF8oJg8Nvxcbx4Bl2UM+uy2INHuS0CFjHYiu
	ONeiopZIRdobgcfgOHAryZMWgYjXSR4tJupiFactlJwqJMFgIJwDDeVG0EtwLg9qf9xkXzsRLb3kG
	BIh7Gkfs4ybal3Og8vSe6f3BfW43+xtAvTwb1cNhplrItApXduUhmXP7qiZSJLLMFqlUGLXilxSQz
	DNYrr5V2HyHdaKhaQ3HUqfEvlVgjVZHYThH3R5d8eF58olSnNVmhr5bY2vpH+yjg4plZzoX7S2oxZ
	Vgpl6iKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDZB-003B8M-VK; Thu, 09 Feb 2023 20:30:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDZ9-003B7H-6Q
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 20:30:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A167561BC8;
	Thu,  9 Feb 2023 20:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF30C433D2;
	Thu,  9 Feb 2023 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675974646;
	bh=e3gDRdsYumU0V7wuKmL/JJmRTnqZh9NF45/6OEcupz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObEzotjVubNfM01B84NNBYG1qo26B9tmubw1/LmOU5J00M9SWdQZjQKOnYo4LXkX6
	 1e5rWhOCXzWlIENvVb62FROWmczclkS224xU3HNbekCqeejZqhyNk7rftyeoK9ZDV/
	 J8PqdAPIbFNJ6tlp6C7g0TlDHfSS0I3uRUbcjLXq9KzNV7oDq4ED5G5GMjXTNNJNzy
	 /YCN67s2SFa1TwMaLGyznWJk8jOzDnzqCdyW3BD7gSvHsIz6/fBBx+cIm4uMErB9Wr
	 Q6eAeExbv7650Km7en169zGchKAcka5q3ZkNuno1mqriOSAjPYiYsgBB5Art9RomXk
	 5bdXaOAl+9vpw==
Date: Thu, 9 Feb 2023 20:30:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 14/24] RISC-V: ACPI: smpboot: Add function to retrieve
 the hartid
Message-ID: <Y+VX8EclC1cE2fdI@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-15-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-15-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_123047_333649_37C88058 
X-CRM114-Status: GOOD (  26.10  )
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
Content-Type: multipart/mixed; boundary="===============8455341206587978769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8455341206587978769==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/IAbprJ0ojDzJd5b"
Content-Disposition: inline


--/IAbprJ0ojDzJd5b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil, Drew,

@drew, a question below that I'm sorta aiming at you...

On Mon, Jan 30, 2023 at 11:52:15PM +0530, Sunil V L wrote:
> hartid is in RINTC structuire in MADT table. Instead of parsing

Nit: missing articles before RINTC and MADT. Also typo "structure".

Perhaps you'd benefit from a spell checker in your git editor.

> the ACPI table every time we need for a cpu, cache it and provide
> a function to read it.
>=20
> This is similar to acpi_get_madt_gicc() in arm64.

-ENOTFOUND, do you mean acpi_cpu_get_madt_gicc()?

>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/acpi.h | 14 +++++++++++++-
>  arch/riscv/kernel/smpboot.c   | 21 +++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index d1f1e53ec657..69a880b7257a 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -65,6 +65,18 @@ int acpi_numa_get_nid(unsigned int cpu);
>  static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_N=
ODE; }
>  #endif /* CONFIG_ACPI_NUMA */
> =20
> -#endif
> +struct acpi_madt_rintc *acpi_get_madt_rintc(int cpu);
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> +static inline u32 get_acpi_id_for_cpu(int cpu)
> +{
> +	return	acpi_cpu_get_madt_rintc(cpu)->uid;
> +}
> +#else
> +static inline u32 get_acpi_id_for_cpu(int cpu)
> +{
> +	return -1;
> +}
> +
> +#endif /* CONFIG_ACPI */
> =20
>  #endif /*_ASM_ACPI_H*/
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index e48cf88d0bc1..3a8b7a9eb5ac 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -73,6 +73,25 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> =20
>  #ifdef CONFIG_ACPI
>  static unsigned int cpu_count =3D 1;
> +static unsigned int intc_count;
> +static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
> +
> +struct acpi_madt_rintc *acpi_get_madt_rintc(int cpu)
> +{
> +	return &cpu_madt_rintc[cpu];
> +}
> +
> +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> +{
> +	int i;

Since we are C11 now, you don't even need to declare this outside of the
loop, right?

> +
> +	for (i =3D 0; i < NR_CPUS; i++) {

@drew, perhaps you know since you were fiddling not too long ago with
cpumask stuff - at what point does for_each_possible_cpu() become
usable?
I had a bit of a poke & couldn't immediately tell if it'd be okay to use
it here.

> +		if (riscv_hartid_to_cpuid(cpu_madt_rintc[i].hart_id) =3D=3D cpu)
> +			return &cpu_madt_rintc[i];
> +	}
> +	return NULL;

Another nit: newline before return please :)

> +}
> +EXPORT_SYMBOL_GPL(acpi_cpu_get_madt_rintc);
> =20
>  static int __init
>  acpi_parse_rintc(union acpi_subtable_headers *header,
> @@ -92,6 +111,8 @@ acpi_parse_rintc(union acpi_subtable_headers *header,
>  	hart =3D processor->hart_id;
>  	if (hart < 0)
>  		return 0;
> +
> +	cpu_madt_rintc[intc_count++] =3D *processor;
>  	if (hart =3D=3D cpuid_to_hartid_map(0)) {
>  		BUG_ON(found_boot_cpu);
>  		found_boot_cpu =3D 1;
> --=20
> 2.38.0
>=20

--/IAbprJ0ojDzJd5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+VX8AAKCRB4tDGHoIJi
0r7FAP4mzn2lR8zMpvukT7FXR/JrLLAqcDH+l3BCT6afCecnVQEAxW5tBLxQ5BAv
MIr2O07UCa1aYCinVanhPH/8yj2ETgM=
=kGhZ
-----END PGP SIGNATURE-----

--/IAbprJ0ojDzJd5b--


--===============8455341206587978769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8455341206587978769==--

