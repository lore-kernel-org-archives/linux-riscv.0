Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B78DC27C75
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Db0b54G/0UlHNbhifa36cfN+T6o+wUTCgjSdNYoYLQ4=; b=ENniDW3a8NvaTNscWg/Txy8xvn
	AfZZD5LXyTzRkpoRLZhzUg70wCZ7iJnX6/nNXbs9aIuJSld5XxlagvWf3ZYT3HpfC6sh9ckc8kmrz
	0j3mF/W7FW6GBbvK1Zos4pvunTGgYUVQmFOFNMue5E3b6TP8YwB2k8XHdRmDlWadYiKHS8eDwm+uX
	c+sy4KXdWpdxQkQ7d2t7AsFwkVmSwmKfVALeiPHuw2HgddcCZSau/PYOMeBhYb9+aVax0+pUho16k
	zLHOExT/RBcUU/U/rcQy0/6tn9sbjhz5n8sRd+Y93916VCQpZN/jAeOSZHhfUEjqL+4xh7jbQrmuN
	6PQjP36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI2Dp-00000001zvO-2GK2;
	Fri, 14 Jun 2024 08:23:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI2Dn-00000001zuM-3sha
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 08:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718353423; x=1749889423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I30+svJG/M7AzUfaUajhNLsiziVDSGelWON1BY08RRA=;
  b=MQEDYkacRdOegeapBMo7IayRGMaeTmqpibMaxQMIeLFHygbJM+gXDrno
   K5NSseaHT87LmHsW+FLFjkSDYf5U4zTmCU5ALC49GrvmqIzpzdrb276Iw
   kS8XgNuQtreVB6+wCu0SxA6Ej9i+KAAHKoyfZA2O5mMvPKYf43UxjkH97
   WPaOGYBVaNuP1bSSPjgAGMviNOFI9Fry+iWSKvZvp0hL8/W4yMawiLPzV
   e/NsyVS9qgPrGNrsgA4UU2hpT7VYDts+m1A6fIr/xiE6oos/sFhttHC+C
   pVClhYxNjw7gozJJd9mS2P9+/QtfbWmMqmZK0i6W+VUKNLZtjv1SWrju3
   A==;
X-CSE-ConnectionGUID: lGiPpL1eRHKZ9zuhk1c1dA==
X-CSE-MsgGUID: t41bSOBzQEqKWlfjgFpvSQ==
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="asc'?scan'208";a="28158885"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jun 2024 01:23:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Jun 2024 01:23:10 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 14 Jun 2024 01:23:05 -0700
Date: Fri, 14 Jun 2024 09:22:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jesse Taube <jesse@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Evan Green
	<evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins
	<charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu
	<andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>, Greentime Hu
	<greentime.hu@sifive.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin
	<costa.shul@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Baoquan
 He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>, Zong Li
	<zong.li@sifive.com>, Sami Tolvanen <samitolvanen@google.com>, Ben Dooks
	<ben.dooks@codethink.co.uk>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Erick Archer
	<erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/6] RISC-V: Check scalar unaligned access on all CPUs
Message-ID: <20240614-padded-mammal-d956735c1293@wendy>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-4-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240613191616.2101821-4-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_012344_069071_180A6F39 
X-CRM114-Status: GOOD (  24.93  )
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
Content-Type: multipart/mixed; boundary="===============2034109095273009745=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2034109095273009745==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5roV/dfZvNvEhY/C"
Content-Disposition: inline

--5roV/dfZvNvEhY/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 03:16:12PM -0400, Jesse Taube wrote:
> Originally, the check_unaligned_access_emulated_all_cpus function
> only checked the boot hart. This fixes the function to check all
> harts.

This seems like it should be split out and get a Fixes: tag & a cc:
stable.

> Check for Zicclsm before checking for unaligned access. This will
> greatly reduce the boot up time as finding the access speed is no longer
> necessary.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>  - New patch
> ---
>  arch/riscv/kernel/traps_misaligned.c       | 23 ++++++----------------
>  arch/riscv/kernel/unaligned_access_speed.c | 23 +++++++++++++---------
>  2 files changed, 20 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index b62d5a2f4541..8fadbe00dd62 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -526,31 +526,17 @@ int handle_misaligned_store(struct pt_regs *regs)
>  	return 0;
>  }
> =20
> -static bool check_unaligned_access_emulated(int cpu)
> +static void check_unaligned_access_emulated(struct work_struct *unused)
>  {
> +	int cpu =3D smp_processor_id();
>  	long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
>  	unsigned long tmp_var, tmp_val;
> -	bool misaligned_emu_detected;
> =20
>  	*mas_ptr =3D RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> =20
>  	__asm__ __volatile__ (
>  		"       "REG_L" %[tmp], 1(%[ptr])\n"
>  		: [tmp] "=3Dr" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
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
>  }
> =20
>  bool check_unaligned_access_emulated_all_cpus(void)
> @@ -562,8 +548,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> +	schedule_on_each_cpu(check_unaligned_access_emulated);
> +
>  	for_each_online_cpu(cpu)
> -		if (!check_unaligned_access_emulated(cpu))
> +		if (per_cpu(misaligned_access_speed, cpu)
> +		    !=3D RISCV_HWPROBE_MISALIGNED_EMULATED)
>  			return false;
> =20
>  	unaligned_ctl =3D true;
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kern=
el/unaligned_access_speed.c
> index a9a6bcb02acf..70c1588fc353 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -259,23 +259,28 @@ static int check_unaligned_access_speed_all_cpus(vo=
id)
>  	kfree(bufs);
>  	return 0;
>  }
> +#endif /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> =20
>  static int check_unaligned_access_all_cpus(void)
>  {
> -	bool all_cpus_emulated =3D check_unaligned_access_emulated_all_cpus();
> +	bool all_cpus_emulated;
> +	int cpu;
> =20
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
> +		for_each_online_cpu(cpu) {
> +			per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALIGNED_FA=
ST;
> +		}
> +		return 0;
> +	}
> +
> +	all_cpus_emulated =3D check_unaligned_access_emulated_all_cpus();
> +
> +#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS

Can we make this an IS_ENABLED() please?


Thanks,
Conor.

>  	if (!all_cpus_emulated)
>  		return check_unaligned_access_speed_all_cpus();
> +#endif
> =20
>  	return 0;
>  }
> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> -static int check_unaligned_access_all_cpus(void)
> -{
> -	check_unaligned_access_emulated_all_cpus();
> -
> -	return 0;
> -}
> -#endif
> =20
>  arch_initcall(check_unaligned_access_all_cpus);
> --=20
> 2.43.0
>=20

--5roV/dfZvNvEhY/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmv91wAKCRB4tDGHoIJi
0reHAQDJzCDTih2CT5+8AGBLj1gklSGmS/R+h5QMKj0uL8S0zQEAqTT7zZH5px5I
8XwHyIp3NfUTa9Qm5JgQqXy58YGrLgQ=
=jw9t
-----END PGP SIGNATURE-----

--5roV/dfZvNvEhY/C--


--===============2034109095273009745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2034109095273009745==--

