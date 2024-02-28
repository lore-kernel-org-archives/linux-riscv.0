Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114AFC54E41
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AL0JUhOaMZUKy2qOrQXpJl41/Pv9hjW50HWgXZzhCKM=; b=zyJCMXMLmTNKYiIIH95b7syTlU
	jYk3iP5UmOLs15Iz9uGXTV9+91l7azsX4ihNtXdYCXTywB+xohe98rtopQmWdTz0wJuhm1Txliw7E
	32ZFjj3eGH6BLUM1iapppMdNYrTwba+T3pmo31V0CJhxLBAnEVXn8R3MCVHGj/r/utesIZiCq+H2D
	m3uBVG3DtJKcWV77vcYHGV/Ydn7T3pgzlyf7bcts8VfrT3l+Ta+FCjananKig75lOMhA4Vlb0ULFT
	6Enb/C1Nngzw6qmSWkSKsnXtT56ZIdxmz7+UPR+8Rc2Fwqq/+e+gL8eT4RdAjnseLMfJauWEltaj6
	dBsPSFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfHPP-00000008rQq-0DQT;
	Wed, 28 Feb 2024 10:43:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfHPL-00000008rPR-3uva
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 10:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0486DCE20E7;
	Wed, 28 Feb 2024 10:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A759EC433C7;
	Wed, 28 Feb 2024 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709117005;
	bh=+PNQdYZp5tbsIrdA8nTu1RfAGQZkhr7Zkz00Q7/gAUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJAHOj4zdO9enJQy5VFMdXPDBguUh4tM/45N335HJWEfvQAZd4nTk7MQpqp/oNhkE
	 ouJd7dR7oo4uLOsusAg7Wqu/QxPRmL4vdSFA7bheMMK/yvgNwlcv66OEr2Fz42phdA
	 R9cD0+zmBSErmIdfMDw3GBPIB5I3rLcGX4BA8AHeQuAGFLnUhLi62TRsolSdEoTM8w
	 WmJDuX2VkdAiNvA56P7enErrMADYdQWQJLdyiudeT03pX342V5cRb+Z8VG+iNj+jgv
	 SjQ5TKjxvnNB6/4hh1/SxIwNaeaVbK3EwBftCI/YTijEvuDrK5yjIHqLuIJPNM/BxW
	 Hxt6XMkeBOE+w==
Date: Wed, 28 Feb 2024 10:43:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Set unaligned access speed at compile time
Message-ID: <20240228-denote-subscribe-9832cddbd307@spud>
References: <20240227-disable_misaligned_probe_config-v5-0-b6853846e27a@rivosinc.com>
 <20240227-disable_misaligned_probe_config-v5-2-b6853846e27a@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240227-disable_misaligned_probe_config-v5-2-b6853846e27a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_024328_353875_47EEFC7B 
X-CRM114-Status: GOOD (  27.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============3625807182611151125=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3625807182611151125==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Z+bsYN10/Aht3x5"
Content-Disposition: inline


--0Z+bsYN10/Aht3x5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 03:13:14PM -0800, Charlie Jenkins wrote:
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index a7c56b41efd2..69df8eaad9e7 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -147,8 +147,10 @@ static bool hwprobe_ext0_has(const struct cpumask *c=
pus, unsigned long ext)
>  	return (pair.value & ext);
>  }
> =20
> +#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
>  static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  {

> +	return RISCV_HWPROBE_MISALIGNED_FAST;

This looks like a left over testing hack.

>  	int cpu;
>  	u64 perf =3D -1ULL;
> =20
> @@ -169,6 +171,27 @@ static u64 hwprobe_misaligned(const struct cpumask *=
cpus)
> =20
>  	return perf;
>  }
> +#elif defined(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS)
> +static u64 hwprobe_misaligned(const struct cpumask *cpus)
> +{
> +	return RISCV_HWPROBE_MISALIGNED_EMULATED;
> +}
> +#elif defined(CONFIG_RISCV_SLOW_UNALIGNED_ACCESS)
> +static u64 hwprobe_misaligned(const struct cpumask *cpus)
> +{
> +	return RISCV_HWPROBE_MISALIGNED_SLOW;
> +}
> +#elif defined(CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS)
> +static u64 hwprobe_misaligned(const struct cpumask *cpus)
> +{
> +	return RISCV_HWPROBE_MISALIGNED_FAST;
> +}
> +#elif defined(CONFIG_RISCV_UNSUPPORTED_UNALIGNED_ACCESS)
> +static u64 hwprobe_misaligned(const struct cpumask *cpus)
> +{
> +	return RISCV_HWPROBE_MISALIGNED_UNSUPPORTED;
> +}
> +#endif

I'm curious why we need multiple definitions of this here. My first
question is why we cannot have
if (IS_ENABLED(foo))
	return bar;
inside the existing function for these cases.

My second question would be why fiddle with this in hwprobe at all?
I was specifically wondering why the kernel would not track this
information in the per-cpu variable misaligned_access_speed and the
syscall code could be left in the dark about how this is implemented.

> =20
>  static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  			     const struct cpumask *cpus)
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 8ded225e8c5b..ba6763dd9895 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -398,8 +398,6 @@ union reg_data {
>  	u64 data_u64;
>  };
> =20
> -static bool unaligned_ctl __read_mostly;
> -
>  /* sysctl hooks */
>  int unaligned_enabled __read_mostly =3D 1;	/* Enabled by default */
> =20
> @@ -413,7 +411,9 @@ int handle_misaligned_load(struct pt_regs *regs)
> =20
>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
> =20
> +#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS

if (IS_ENABLED()), no?
But perhaps more interestingly - why is this being set here at all?
My understanding of the emulated stuff was that if the in-kernel
emulation was enabled, it would be used unless the CPU itself supported
fast accesses. I would expect this to be advertised to userspace once
the system has booted, not set the first time that a cpu emulates an
access,
I feel like I need to take a look at how this has been implemented, I
never really looked too closely at it and how it is enabled does not
match my expectations.

Cheers,
Conor.

>  	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_EM=
ULATED;
> +#endif
> =20
>  	if (!unaligned_enabled)
>  		return -1;
> @@ -595,53 +595,3 @@ int handle_misaligned_store(struct pt_regs *regs)
> =20
>  	return 0;
>  }
> -
> -bool check_unaligned_access_emulated(int cpu)
> -{
> -	long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
> -	unsigned long tmp_var, tmp_val;
> -	bool misaligned_emu_detected;
> -
> -	*mas_ptr =3D RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> -
> -	__asm__ __volatile__ (
> -		"       "REG_L" %[tmp], 1(%[ptr])\n"
> -		: [tmp] "=3Dr" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
> -
> -	misaligned_emu_detected =3D (*mas_ptr =3D=3D RISCV_HWPROBE_MISALIGNED_E=
MULATED);
> -	/*
> -	 * If unaligned_ctl is already set, this means that we detected that all
> -	 * CPUS uses emulated misaligned access at boot time. If that changed
> -	 * when hotplugging the new cpu, this is something we don't handle.
> -	 */
> -	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
> -		pr_crit("CPU misaligned accesses non homogeneous (expected all emulate=
d)\n");
> -		while (true)
> -			cpu_relax();
> -	}
> -
> -	return misaligned_emu_detected;
> -}
> -
> -void unaligned_emulation_finish(void)
> -{
> -	int cpu;
> -
> -	/*
> -	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
> -	 * accesses emulated since tasks requesting such control can run on any
> -	 * CPU.
> -	 */
> -	for_each_present_cpu(cpu) {
> -		if (per_cpu(misaligned_access_speed, cpu) !=3D
> -					RISCV_HWPROBE_MISALIGNED_EMULATED) {
> -			return;
> -		}
> -	}
> -	unaligned_ctl =3D true;
> -}
> -
> -bool unaligned_ctl_available(void)
> -{
> -	return unaligned_ctl;
> -}
>=20
> --=20
> 2.43.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--0Z+bsYN10/Aht3x5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd8OSAAKCRB4tDGHoIJi
0ltiAQC8i6Hx0y+ThDW1JOhn9VP0EVcTCCjoHjdHFb3bJQv6dAEAqI6mYHq1XL/n
xcu3yEaeOzw+8xd7doxNLfYmIeuGLQg=
=Ba3T
-----END PGP SIGNATURE-----

--0Z+bsYN10/Aht3x5--


--===============3625807182611151125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3625807182611151125==--

