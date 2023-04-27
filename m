Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB225C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YY908vCfsTIHjTVZ2xOzPqj7V7vRgyggb0U6KEilnU8=; b=l/IeIeYNqXPH+KSvMawGXEA5Ub
	tkrEeoHiYrHfxqzFAmAyEgkLoFKigZAJAaDTln3w74rHqcYn9V3Ci5sIRlwIBlUTXJI73rJGmuR6J
	yNniZJ2a1aWyff9PRHNfJ8ZhHaorOL400UxLMfmU9iV0oA16Nwzbxfmts0FwFRqO+RSlm62f1eZGi
	FOe2eC8hHA9Za+/EQb8bvqaRQ1yIJE8lqy5Wr7Spg0LmOLMugdO2sUsO2VGhDplw3tkrXQqqoToBR
	b04VQbwNOjkepanVq5C9bHlpMnCZiFKMB7Pwtopw9I3MEfe/xPLiVRCP84Qee4W4pmrMTW6JgOBbE
	+MILLXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prz87-006L6a-33;
	Thu, 27 Apr 2023 10:45:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pry98-0062U4-2l;
	Thu, 27 Apr 2023 09:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682588558; x=1714124558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E2hIVyCBUEtSk5gih4iFA5MhLw3/fhNppdRQgn90I1g=;
  b=WFOZgSSYeEYYKyFgl3J7Um+a7TU6t7r6k5+VgjG2eXIU3hrQM0igJyDm
   B0cvQoZqM1vvnJ3TPzfNBSdMhVMF2FOpJDHRrABO5X2KzV5XfYIV0hh8i
   XQJIMRjWEMx9UYtEZEa1q/AFlMFGA8hnzc9V0N1AdLHjSzpZsmZWK5CGG
   4czhpOtPMFyk3gvz/p76Dae04JEyntPdjkseAZD1HS92kHgAQlIY+O7SR
   TiQnkWBFOSAOSvjo3Kjxh8RlYtWBrqKWTLI6PZXo0lKZhJXtCMwFXwrYf
   RUPY/rapbnU6kK3H75Baz+eXLH8FSjUYgxTTA+OCgRo8LnvBRL8pW7KzH
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677567600"; 
   d="asc'?scan'208";a="212555959"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Apr 2023 02:42:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 27 Apr 2023 02:42:31 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 27 Apr 2023 02:42:28 -0700
Date: Thu, 27 Apr 2023 10:42:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<kvm-riscv@lists.infradead.org>, "'Rafael J . Wysocki '" <rafael@kernel.org>,
	'Will Deacon ' <will@kernel.org>, 'Daniel Lezcano '
	<daniel.lezcano@linaro.org>, 'Mark Rutland ' <mark.rutland@arm.com>, 'Atish
 Patra ' <atishp@atishpatra.org>, 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>, 'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>
Subject: Re: [PATCH] RISC-V: Align SBI probe implementation with spec
Message-ID: <20230427-property-barracuda-631a14371df0@wendy>
References: <20230426172254.70342-1-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230426172254.70342-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_024239_085238_03D4B9D7 
X-CRM114-Status: GOOD (  26.62  )
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
Content-Type: multipart/mixed; boundary="===============3767942630378134865=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3767942630378134865==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L6BUTM0l87ia1896"
Content-Disposition: inline

--L6BUTM0l87ia1896
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 07:22:54PM +0200, Andrew Jones wrote:
> sbi_probe_extension() is specified with "Returns 0 if the given SBI
> extension ID (EID) is not available, or 1 if it is available unless
> defined as any other non-zero value by the implementation."
> Additionally, sbiret.value is a long. Fix the implementation to
> ensure any nonzero long value is considered a success, rather
> than only positive int values.

Does this need a fixes tag (or tags) then, since we could easily return
a negative value as things stand if the SBI implementation decides to
return 0b1...1 for success?

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h        |  2 +-
>  arch/riscv/kernel/cpu_ops.c         |  2 +-
>  arch/riscv/kernel/sbi.c             | 17 ++++++++---------
>  arch/riscv/kvm/main.c               |  2 +-
>  drivers/cpuidle/cpuidle-riscv-sbi.c |  2 +-
>  drivers/perf/riscv_pmu_sbi.c        |  2 +-
>  6 files changed, 13 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 945b7be249c1..119355485703 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -296,7 +296,7 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask =
*cpu_mask,
>  				unsigned long start,
>  				unsigned long size,
>  				unsigned long asid);
> -int sbi_probe_extension(int ext);
> +long sbi_probe_extension(int ext);
> =20
>  /* Check if current SBI specification version is 0.1 or not */
>  static inline int sbi_spec_is_0_1(void)
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index 8275f237a59d..eb479a88a954 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -27,7 +27,7 @@ const struct cpu_operations cpu_ops_spinwait =3D {
>  void __init cpu_set_ops(int cpuid)
>  {
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> -	if (sbi_probe_extension(SBI_EXT_HSM) > 0) {
> +	if (sbi_probe_extension(SBI_EXT_HSM)) {
>  		if (!cpuid)
>  			pr_info("SBI HSM extension detected\n");
>  		cpu_ops[cpuid] =3D &cpu_ops_sbi;
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 5c87db8fdff2..015ce8eef2de 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -581,19 +581,18 @@ static void sbi_srst_power_off(void)
>   * sbi_probe_extension() - Check if an SBI extension ID is supported or =
not.
>   * @extid: The extension ID to be probed.
>   *
> - * Return: Extension specific nonzero value f yes, -ENOTSUPP otherwise.
> + * Return: 1 or an extension specific nonzero value if yes, 0 otherwise.
>   */
> -int sbi_probe_extension(int extid)
> +long sbi_probe_extension(int extid)
>  {
>  	struct sbiret ret;
> =20
>  	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
>  			0, 0, 0, 0, 0);
>  	if (!ret.error)
> -		if (ret.value)
> -			return ret.value;
> +		return ret.value;
> =20
> -	return -ENOTSUPP;
> +	return 0;

Why not make it return -ENOTSUPP for failures and 0 for success instead,
as it does not appear that any users actually care what the return value
is, once it is not an error?
Concerned that it'll look weird to have
	if(!sbi_probe_extension(foo))
		print(foo is available!)
since it looks a bit weird that the !case is success?

If so, perhaps it could just return a bool instead, unless of course I
am missing some pending user that make some decision on the actual value
returned here is.

Cheers,
Conor.

>  }
>  EXPORT_SYMBOL(sbi_probe_extension);
> =20
> @@ -665,26 +664,26 @@ void __init sbi_init(void)
>  	if (!sbi_spec_is_0_1()) {
>  		pr_info("SBI implementation ID=3D0x%lx Version=3D0x%lx\n",
>  			sbi_get_firmware_id(), sbi_get_firmware_version());
> -		if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
> +		if (sbi_probe_extension(SBI_EXT_TIME)) {
>  			__sbi_set_timer =3D __sbi_set_timer_v02;
>  			pr_info("SBI TIME extension detected\n");
>  		} else {
>  			__sbi_set_timer =3D __sbi_set_timer_v01;
>  		}
> -		if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
> +		if (sbi_probe_extension(SBI_EXT_IPI)) {
>  			__sbi_send_ipi	=3D __sbi_send_ipi_v02;
>  			pr_info("SBI IPI extension detected\n");
>  		} else {
>  			__sbi_send_ipi	=3D __sbi_send_ipi_v01;
>  		}
> -		if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
> +		if (sbi_probe_extension(SBI_EXT_RFENCE)) {
>  			__sbi_rfence	=3D __sbi_rfence_v02;
>  			pr_info("SBI RFENCE extension detected\n");
>  		} else {
>  			__sbi_rfence	=3D __sbi_rfence_v01;
>  		}
>  		if ((sbi_spec_version >=3D sbi_mk_version(0, 3)) &&
> -		    (sbi_probe_extension(SBI_EXT_SRST) > 0)) {
> +		    sbi_probe_extension(SBI_EXT_SRST)) {
>  			pr_info("SBI SRST extension detected\n");
>  			pm_power_off =3D sbi_srst_power_off;
>  			sbi_srst_reboot_nb.notifier_call =3D sbi_srst_reboot;
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 41ad7639a17b..c923c113a129 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -75,7 +75,7 @@ static int __init riscv_kvm_init(void)
>  		return -ENODEV;
>  	}
> =20
> -	if (sbi_probe_extension(SBI_EXT_RFENCE) <=3D 0) {
> +	if (!sbi_probe_extension(SBI_EXT_RFENCE)) {
>  		kvm_info("require SBI RFENCE extension\n");
>  		return -ENODEV;
>  	}
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidl=
e-riscv-sbi.c
> index be383f4b6855..c6b599167036 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -613,7 +613,7 @@ static int __init sbi_cpuidle_init(void)
>  	 * 2) SBI HSM extension is available
>  	 */
>  	if ((sbi_spec_version < sbi_mk_version(0, 3)) ||
> -	    sbi_probe_extension(SBI_EXT_HSM) <=3D 0) {
> +	    !sbi_probe_extension(SBI_EXT_HSM)) {
>  		pr_info("HSM suspend not available\n");
>  		return 0;
>  	}
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 70cb50fd41c2..4f3ac296b3e2 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -924,7 +924,7 @@ static int __init pmu_sbi_devinit(void)
>  	struct platform_device *pdev;
> =20
>  	if (sbi_spec_version < sbi_mk_version(0, 3) ||
> -	    sbi_probe_extension(SBI_EXT_PMU) <=3D 0) {
> +	    !sbi_probe_extension(SBI_EXT_PMU)) {
>  		return 0;
>  	}
> =20
> --=20
> 2.39.2
>=20

--L6BUTM0l87ia1896
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEpDcwAKCRB4tDGHoIJi
0lEnAQDH3q3yJRcR+C8lJtpaCBf+MmgJqSN8MUY36KEr7iRlCgD8DHVUJiGqd0AI
yBSKx4XSV9m3HgLpL4XKEXdwDfrXyAY=
=/8C2
-----END PGP SIGNATURE-----

--L6BUTM0l87ia1896--


--===============3767942630378134865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3767942630378134865==--

