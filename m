Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3D1C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ9FbVKHBrsT+xi6/5wQmBl+drGDsKpVM2iTCV/hntI=; b=dlzB1bBFj1c3/xpLYXeOon4lqc
	n5TFAJXOguhz6/SHctxHCufXv0cKy6ihAy/qp2afV/migkryJz/m/R9u1rOQrkguimYn9HMsapVb+
	IrYipky9T7gIS+f2LXxpDQkN2ql039PTO6+q9HffLuoD1VBPJUViyjUXmPWiHWfh6Zv0qdkjfbTYV
	ryN63XiklF1Jn7gFmAIjUR2cFY3x9KJe21Q9emlIzZqNEcW7ZiDvDtUoxbs7yVpPqqKCSnMK5OCY+
	lW6fx00fhl0sLMyqkCyhfVy9xGvcDaXqySrSQepqtbHONw4qiuEMp2ZtrMR7Cn5VK99IkilB+Yf5I
	bvBNubIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Ny-000000001Zk-0c1y;
	Fri, 29 Mar 2024 10:22:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Nu-000000001Yb-261I;
	Fri, 29 Mar 2024 10:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711707775; x=1743243775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1r6x7Gswn3GUpeRZpRuR1fp00nqTBQ5kSjmps/2V46Q=;
  b=EkJ3W+McPYVS5gdj/ZpxT2yTQS64CZNf/v2PVj1i1c6U75SEYio2laT3
   rAmm4npXXq/BeozU3MsN6iVmDM6DjcdrOmLaD9+I7Vy/vsGndJv3tCerw
   FULedgtN6DFR1+jf79kNP2pdTysqf8vt3AOpY9bpk9736aLOTmG+/HNQI
   oG2qDK4MeCqtT89xIAiDrppRKpISeV78bE8Z9+hTsNuj7Yhb7AOH2ssKX
   PL+UHrWgs+PXre4hAyfHJ/oTQJzOgj/P9F8SAajvr3zFHoJx3fzXwzfC1
   NsCOl/Nijanwbc2HQ6VVMwDWhX7dgn8hpSprcX+B1V/ZXCMBIa/CcNkvA
   A==;
X-CSE-ConnectionGUID: QbvD0OvjTziR5bNjZW4tvQ==
X-CSE-MsgGUID: rph7hLVDQvOEe5l5cj2xvA==
X-IronPort-AV: E=Sophos;i="6.07,164,1708412400"; 
   d="asc'?scan'208";a="18638556"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 03:22:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 03:22:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 03:22:27 -0700
Date: Fri, 29 Mar 2024 10:21:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Max Hsu <max.hsu@sifive.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel
 Machek <pavel@ucw.cz>, Anup Patel <anup@brainfault.org>, Atish Patra
	<atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan
	<shuah@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH RFC 05/11] riscv: cpufeature: Add Sdtrig optional CSRs
 checks
Message-ID: <20240329-avid-footgear-ed5e7f8788ba@wendy>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-5-1534f93b94a7@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-5-1534f93b94a7@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_032254_744611_49743F76 
X-CRM114-Status: GOOD (  39.23  )
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
Content-Type: multipart/mixed; boundary="===============8493352325097778698=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8493352325097778698==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8okYWFxSwcNviT76"
Content-Disposition: inline

--8okYWFxSwcNviT76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 05:26:21PM +0800, Max Hsu wrote:
> Sdtrig extension introduce two optional CSRs [hcontext/scontext],
> that will be storing PID/Guest OS ID for the debug feature.
>=20
> The availability of these two CSRs will be determined by
> DTS and Smstateen extension [h/s]stateen0 CSR bit 57.
>=20
> If all CPUs hcontext/scontext checks are satisfied, it will enable the
> use_hcontext/use_scontext static branch.
>=20
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  arch/riscv/include/asm/switch_to.h |   6 ++
>  arch/riscv/kernel/cpufeature.c     | 161 +++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 167 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 7efdb0584d47..07432550ed54 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -69,6 +69,12 @@ static __always_inline bool has_fpu(void) { return fal=
se; }
>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
> =20
> +DECLARE_STATIC_KEY_FALSE(use_scontext);
> +static __always_inline bool has_scontext(void)
> +{
> +	return static_branch_likely(&use_scontext);
> +}
> +
>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 080c06b76f53..44ff84b920af 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,19 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __=
read_mostly;
>  /* Per-cpu ISA extensions. */
>  struct riscv_isainfo hart_isa[NR_CPUS];
> =20
> +atomic_t hcontext_disable;
> +atomic_t scontext_disable;
> +
> +DEFINE_STATIC_KEY_FALSE_RO(use_hcontext);
> +EXPORT_SYMBOL(use_hcontext);
> +
> +DEFINE_STATIC_KEY_FALSE_RO(use_scontext);
> +EXPORT_SYMBOL(use_scontext);
> +
> +/* Record the maximum number that the hcontext CSR allowed to hold */
> +atomic_long_t hcontext_id_share;
> +EXPORT_SYMBOL(hcontext_id_share);
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -719,6 +732,154 @@ unsigned long riscv_get_elf_hwcap(void)
>  	return hwcap;
>  }
> =20
> +static void __init sdtrig_percpu_csrs_check(void *data)
> +{
> +	struct device_node *node;
> +	struct device_node *debug_node;
> +	struct device_node *trigger_module;
> +
> +	unsigned int cpu =3D smp_processor_id();
> +
> +	/*
> +	 * Expect every cpu node has the [h/s]context-present property
> +	 * otherwise, jump to sdtrig_csrs_disable_all to disable all access to
> +	 * [h/s]context CSRs

I think the wording of this comment is kinda strange. What you're trying
to say is that homogeneous support for sdtrig (and the contexts) is
required.

> +	 */
> +	node =3D of_cpu_device_node_get(cpu);

If there's no ACPI support, shouldn't the first thing here by a fast
path out before you start assuming DT?

> +	if (!node)
> +		goto sdtrig_csrs_disable_all;
> +
> +	debug_node =3D of_get_compatible_child(node, "riscv,debug-v1.0.0");
> +	of_node_put(node);
> +
> +	if (!debug_node)
> +		goto sdtrig_csrs_disable_all;
> +
> +	trigger_module =3D of_get_child_by_name(debug_node, "trigger-module");
> +	of_node_put(debug_node);
> +
> +	if (!trigger_module)
> +		goto sdtrig_csrs_disable_all;
> +
> +	if (!(IS_ENABLED(CONFIG_KVM) &&
> +	      of_property_read_bool(trigger_module, "hcontext-present")))
> +		atomic_inc(&hcontext_disable);
> +
> +	if (!of_property_read_bool(trigger_module, "scontext-present"))
> +		atomic_inc(&scontext_disable);

I think we should define pseudo extensions for {h,s}context-present and
parse this out of riscv,isa-extensions. That'd also give you the per-cpu
checks for homogeneous support for "free".
My immediate thought is that sdtrig doesn't seem valuable in isolation,
if you're gonna need additional properties that communicate support for
additional modes.

> +	of_node_put(trigger_module);
> +
> +	/*
> +	 * Before access to hcontext/scontext CSRs, if the smstateen
> +	 * extension is present, the accessibility will be controlled
> +	 * by the hstateen0[H]/sstateen0 CSRs.
> +	 */
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SMSTATEEN)) {

Why can't you use the non-underscore prefixed version of this function
here?

> +		u64 hstateen_bit, sstateen_bit;
> +
> +		if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_h)) {
> +#if __riscv_xlen > 32
> +			csr_set(CSR_HSTATEEN0, SMSTATEEN0_HSCONTEXT);

For zkr we require the CSR to be usable at the privilege level to which
the DT is passed:
        - const: zkr
          description:
            The standard Zkr entropy source extension as ratified in version
            1.0 of RISC-V Cryptography Extensions Volume I specification.
            This string being present means that the CSR associated to this
            extension is accessible at the privilege level to which that
            device-tree has been provided.

I wonder if we should do something similar here and make this a
requirement for anything with bits in stateen registers. I'd love to
avoid having to read CSRs on all harts before being able to make
judgements about whether or not an extension is enabled. I dunno if that
is possible here though, given you want to also make some checks on the
exact nature of the support below.

Cheers,
Conor.

> +			hstateen_bit =3D csr_read(CSR_HSTATEEN0);
> +#else
> +			csr_set(CSR_HSTATEEN0H, SMSTATEEN0_HSCONTEXT >> 32);
> +			hstateen_bit =3D csr_read(CSR_HSTATEEN0H) << 32;
> +#endif
> +			if (!(hstateen_bit & SMSTATEEN0_HSCONTEXT))
> +				goto sdtrig_csrs_disable_all;
> +
> +		} else {
> +			if (IS_ENABLED(CONFIG_KVM))
> +				atomic_inc(&hcontext_disable);
> +
> +			/*
> +			 * In RV32, the smstateen extension doesn't provide
> +			 * high 32 bits of sstateen0 CSR which represent
> +			 * accessibility for scontext CSR;
> +			 * The decision is left on whether the dts has the
> +			 * property to access the scontext CSR.
> +			 */
> +#if __riscv_xlen > 32
> +			csr_set(CSR_SSTATEEN0, SMSTATEEN0_HSCONTEXT);
> +			sstateen_bit =3D csr_read(CSR_SSTATEEN0);
> +
> +			if (!(sstateen_bit & SMSTATEEN0_HSCONTEXT))
> +				atomic_inc(&scontext_disable);
> +#endif
> +		}
> +	}
> +
> +	/*
> +	 * The code can only access hcontext/scontext CSRs if:
> +	 * The cpu dts node have [h/s]context-present;
> +	 * If Smstateen extension is presented, then the accessibility bit
> +	 * toward hcontext/scontext CSRs is enabled; Or the Smstateen extension
> +	 * isn't available, thus the access won't be blocked by it.
> +	 *
> +	 * With writing 1 to the every bit of these CSRs, we retrieve the
> +	 * maximum bits that is available on the CSRs. and decide
> +	 * whether it's suit for its context recording operation.
> +	 */
> +	if (IS_ENABLED(CONFIG_KVM) &&
> +	    !atomic_read(&hcontext_disable)) {
> +		unsigned long hcontext_available_bits =3D 0;
> +
> +		csr_write(CSR_HCONTEXT, -1UL);
> +		hcontext_available_bits =3D csr_swap(CSR_HCONTEXT, hcontext_available_=
bits);
> +
> +		/* hcontext CSR is required by at least 1 bit */
> +		if (hcontext_available_bits)
> +			atomic_long_and(hcontext_available_bits, &hcontext_id_share);
> +		else
> +			atomic_inc(&hcontext_disable);
> +	}
> +
> +	if (!atomic_read(&scontext_disable)) {
> +		unsigned long scontext_available_bits =3D 0;
> +
> +		csr_write(CSR_SCONTEXT, -1UL);
> +		scontext_available_bits =3D csr_swap(CSR_SCONTEXT, scontext_available_=
bits);
> +
> +		/* scontext CSR is required by at least the sizeof pid_t */
> +		if (scontext_available_bits < ((1UL << (sizeof(pid_t) << 3)) - 1))
> +			atomic_inc(&scontext_disable);
> +	}
> +
> +	return;
> +
> +sdtrig_csrs_disable_all:
> +	if (IS_ENABLED(CONFIG_KVM))
> +		atomic_inc(&hcontext_disable);
> +
> +	atomic_inc(&scontext_disable);
> +}
> +
> +static int __init sdtrig_enable_csrs_fill(void)
> +{
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SDTRIG)) {
> +		atomic_long_set(&hcontext_id_share, -1UL);
> +
> +		/* check every CPUs sdtrig extension optional CSRs */
> +		sdtrig_percpu_csrs_check(NULL);
> +		smp_call_function(sdtrig_percpu_csrs_check, NULL, 1);
> +
> +		if (IS_ENABLED(CONFIG_KVM) &&
> +		    !atomic_read(&hcontext_disable)) {
> +			pr_info("riscv-sdtrig: Writing 'GuestOS ID' to hcontext CSR is enable=
d\n");
> +			static_branch_enable(&use_hcontext);
> +		}
> +
> +		if (!atomic_read(&scontext_disable)) {
> +			pr_info("riscv-sdtrig: Writing 'PID' to scontext CSR is enabled\n");
> +			static_branch_enable(&use_scontext);
> +		}
> +	}
> +	return 0;
> +}
> +
> +arch_initcall(sdtrig_enable_csrs_fill);
> +
>  void riscv_user_isa_enable(void)
>  {
>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_=
ZICBOZ))
>=20
> --=20
> 2.43.2
>=20

--8okYWFxSwcNviT76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgaWMwAKCRB4tDGHoIJi
0h1GAP4+5oXB5cobRxRtWLslJG09DwwJGYWbihRkLfHJDm/UFgD/S1TTku0iG2+W
X79DFf9P7rs4DeI4yWy2X6xC2rQfGgY=
=hWrB
-----END PGP SIGNATURE-----

--8okYWFxSwcNviT76--


--===============8493352325097778698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8493352325097778698==--

