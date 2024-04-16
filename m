Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670B5C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atm+/EKgNCfgUo7doOeAC6FhRxtuUlJMI9E5aW8ptfs=; b=ijAaecaFxZ4Z2RRV3Ze1tpyAbL
	ztbmQfJCCodpCeTKaa3gIVHx+GJB4WG1SK5xofh9tEbd65ESdE62WMxZA8ZS1iP4bU0T9UPupidU1
	r6KAfGg4r6ipc3ztE8tnEgL/q9YmfBM6NaeDlK2JG8yf53PGeRdWZvKpyfrAmLMFeFcF5j0unDM0E
	akEtvBx+E60B2WMhixmSC8J3klwo9e8pPstZUML4FaF8Zvwspw1RpadTm71U//NMBmlQtFSBu9IVQ
	8GXS+w6E1R1ERm6wJULwVJX0Cmz3JaDtcopQ7T/s75rwp77KrwLK3aSQ37C9uGQ1yNPuuIh/oOs7k
	QW29S6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkLQ-0000000CfM6-1e3r;
	Tue, 16 Apr 2024 15:03:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkLI-0000000CfJl-1yEw;
	Tue, 16 Apr 2024 15:03:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE27C61226;
	Tue, 16 Apr 2024 15:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA14C113CE;
	Tue, 16 Apr 2024 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713279807;
	bh=0dFehR7bAofXvwdhbQHUWpVwxNS4jlbytNrjxajS/Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1EqWvM4R01QG++RsWmY7K55v0olQvvgXIenexsbrc4JKA4nwVfDNHbXnpJ2hODiu
	 uKXP42Z5t3X8ceOGrFIX++T91LRgNZrljeuacqKst+uLTaMHaV99gERfLC1bHjBbod
	 uCrU9jKaCvpAs4YTPg8bY4yfClF1wx8tsQqjMthQc5BA0EToSY6K1fPSqef/N+PSro
	 ozaY5pPAqJBmIuxx6sHAeyRk60Mr9DyVOlmvpu+y3z4jVI9aHvcO3wiChQu9vPek6+
	 ANtnjbfUJ/4nZQqhFLpPwXnHN61iI1y9UYuY2KOIzVPTHSIbTmXWfY9vUYJGk1R2cL
	 GwKYqAUJQnPDg==
Date: Tue, 16 Apr 2024 16:03:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 01/17] riscv: cpufeature: Fix thead vector hwcap
 removal
Message-ID: <20240416-swipe-flattered-7cdccc01f0fe@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-1-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-1-c7d68c603268@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_080328_627576_FEA1C740 
X-CRM114-Status: GOOD (  27.24  )
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
Content-Type: multipart/mixed; boundary="===============1153050924606095428=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1153050924606095428==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RbQjJEERG41bUbGr"
Content-Disposition: inline


--RbQjJEERG41bUbGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 09:11:58PM -0700, Charlie Jenkins wrote:
> The riscv_cpuinfo struct that contains mvendorid and marchid is not
> populated until all harts are booted which happens after the DT parsing.
> Use the vendorid/archid values from the DT if available or assume all
> harts have the same values as the boot hart as a fallback.
>=20
> Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on =
older T-Head CPUs")
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h   |  2 ++
>  arch/riscv/kernel/cpu.c        | 36 ++++++++++++++++++++++++++++++++----
>  arch/riscv/kernel/cpufeature.c | 12 ++++++++++--
>  3 files changed, 44 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 6e68f8dff76b..0fab508a65b3 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -370,6 +370,8 @@ static inline int sbi_remote_fence_i(const struct cpu=
mask *cpu_mask) { return -1
>  static inline void sbi_init(void) {}
>  #endif /* CONFIG_RISCV_SBI */
> =20
> +unsigned long riscv_get_mvendorid(void);
> +unsigned long riscv_get_marchid(void);
>  unsigned long riscv_cached_mvendorid(unsigned int cpu_id);
>  unsigned long riscv_cached_marchid(unsigned int cpu_id);
>  unsigned long riscv_cached_mimpid(unsigned int cpu_id);
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index d11d6320fb0d..8c8250b98752 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -139,6 +139,34 @@ int riscv_of_parent_hartid(struct device_node *node,=
 unsigned long *hartid)
>  	return -1;
>  }
> =20
> +unsigned long __init riscv_get_marchid(void)
> +{
> +	struct riscv_cpuinfo *ci =3D this_cpu_ptr(&riscv_cpuinfo);
> +
> +#if IS_ENABLED(CONFIG_RISCV_SBI)
> +	ci->marchid =3D sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> +	ci->marchid =3D csr_read(CSR_MARCHID);
> +#else
> +	ci->marchid =3D 0;
> +#endif
> +	return ci->marchid;
> +}
> +
> +unsigned long __init riscv_get_mvendorid(void)
> +{
> +	struct riscv_cpuinfo *ci =3D this_cpu_ptr(&riscv_cpuinfo);
> +
> +#if IS_ENABLED(CONFIG_RISCV_SBI)
> +	ci->mvendorid =3D sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> +	ci->mvendorid =3D csr_read(CSR_MVENDORID);
> +#else
> +	ci->mvendorid =3D 0;
> +#endif
> +	return ci->mvendorid;
> +}
> +
>  DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> =20
>  unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
> @@ -170,12 +198,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
>  	struct riscv_cpuinfo *ci =3D this_cpu_ptr(&riscv_cpuinfo);
> =20
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> -	ci->mvendorid =3D sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> -	ci->marchid =3D sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +	ci->mvendorid =3D ci->mvendorid ? ci->mvendorid : sbi_spec_is_0_1() ? 0=
 : sbi_get_mvendorid();
> +	ci->marchid =3D ci->marchid ? ci->marchid : sbi_spec_is_0_1() ? 0 : sbi=
_get_marchid();

Can we please not have double ternary stuff? This is awful to grok :(
Can you do
if (!ci->m*id)
	sbi_spec_is_0_1() ? 0 : sbi_get_m*id();
instead? I think that is much easier to understand.
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>  	ci->mimpid =3D sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
>  #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> -	ci->mvendorid =3D csr_read(CSR_MVENDORID);
> -	ci->marchid =3D csr_read(CSR_MARCHID);
> +	ci->mvendorid =3D ci->mvendorid ? ci->mvendorid : csr_read(CSR_MVENDORI=
D);
> +	ci->marchid =3D ci->marchid ? ci->marchid : csr_read(CSR_MARCHID);
>  	ci->mimpid =3D csr_read(CSR_MIMPID);
>  #else
>  	ci->mvendorid =3D 0;
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3ed2359eae35..c6e27b45e192 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -490,6 +490,8 @@ static void __init riscv_fill_hwcap_from_isa_string(u=
nsigned long *isa2hwcap)
>  	struct acpi_table_header *rhct;
>  	acpi_status status;
>  	unsigned int cpu;
> +	u64 boot_vendorid;
> +	u64 boot_archid;
> =20
>  	if (!acpi_disabled) {
>  		status =3D acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> @@ -497,6 +499,13 @@ static void __init riscv_fill_hwcap_from_isa_string(=
unsigned long *isa2hwcap)
>  			return;
>  	}
> =20
> +	/*
> +	 * Naively assume that all harts have the same mvendorid/marchid as the
> +	 * boot hart.
> +	 */
> +	boot_vendorid =3D riscv_get_mvendorid();
> +	boot_archid =3D riscv_get_marchid();
> +
>  	for_each_possible_cpu(cpu) {
>  		struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
>  		unsigned long this_hwcap =3D 0;
> @@ -544,8 +553,7 @@ static void __init riscv_fill_hwcap_from_isa_string(u=
nsigned long *isa2hwcap)
>  		 * CPU cores with the ratified spec will contain non-zero
>  		 * marchid.
>  		 */
> -		if (acpi_disabled && riscv_cached_mvendorid(cpu) =3D=3D THEAD_VENDOR_I=
D &&
> -		    riscv_cached_marchid(cpu) =3D=3D 0x0) {
> +		if (acpi_disabled && boot_vendorid =3D=3D THEAD_VENDOR_ID && boot_arch=
id =3D=3D 0x0) {
>  			this_hwcap &=3D ~isa2hwcap[RISCV_ISA_EXT_v];
>  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
>  		}
>=20
> --=20
> 2.44.0
>=20

--RbQjJEERG41bUbGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh6TOAAKCRB4tDGHoIJi
0ugHAP9wq53A/rRMZA7YNcwk3t+YkspiOROzoX/lB6mQceQcywEA6kOQ31DLs19U
K7NuAGuzzBkZ9AZreTReZw47pw/tXwo=
=YaUr
-----END PGP SIGNATURE-----

--RbQjJEERG41bUbGr--


--===============1153050924606095428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1153050924606095428==--

