Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAD2C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8kJGwC/WS2KiOdVYhv7tUwh5ZR6OiV6JhbIIX3sGRI=; b=tmwRfcdGolGS2s7Ck1cB80KBHj
	9/fk8SUvEjNU9A27MKEtDflTYB+DzFpHxY7XAHRcxw8WXnRQWDaMuGeuM/VMHNkhpGvy1ASFIdLpG
	tM77MKRCcrbEMMg3hh7zXDHlUCfkpczfh098zbAxJoQf0t8GLpefOPP+V4CMLMcjAoE6AphYmHgZP
	mN7eOyY1hxpZ737kIpxfPTC9I/2NwqaDvu1YY0fFfmKN7T/7bqQBuenRnRdmrBrGi0FYn9QQYP0cY
	rnlYJ1rDDjb1fgQBiXqxJBlC5OYO60MxHM8ULCaRfcJ3HcMaem10IevvR0KLaQHEmmU9ikzalcjer
	cANM138A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revp7-00000004yZa-3u3D;
	Tue, 27 Feb 2024 11:40:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revp5-00000004yYs-0pUm
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 11:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709034034; x=1740570034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nAcqQcoVlavgogzMMv0AJtTW2BknoALl9ZTHNc2lkI8=;
  b=kSeDrIgFF1JRGGkh9yWECoNrD2xbBYcBvm4wcsmqVzUNigNIjZsMM6LW
   7034H1IKhG0wdIda5lhGCPPZwvzn046qjd94UBRygpVzsmw+n1Wp3xFpE
   NjeV1kmR9xMTlDjosqlFR95gdcUzjCsofSbBYdB3d4lTLiSdwCtVMmOQo
   o4ig0s4Uhs37CF28Y6GF4JsW/BGwEvxQVsC8tcV1f9hhCzPRRKkInMd88
   qnRpNQN/332kr09bEPS2AXEgbPCKwm/ZU/O3HlbveRxgHRzQQBkqPaHgu
   YpWFjrGIaNC2ftmG1LiDRkH6eptYVk2Onz02rxIKMqNJJjcym5wjBhaY0
   w==;
X-CSE-ConnectionGUID: bVyENMktQsa0J3zoirwwlw==
X-CSE-MsgGUID: KyHdUvHKQ+mwrCRxqQUDzg==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="18453223"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 04:40:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 04:40:10 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 04:40:08 -0700
Date: Tue, 27 Feb 2024 11:39:25 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 2/2] riscv: Set unalignment speed at compile time
Message-ID: <20240227-condone-impeach-9469dffc6b47@wendy>
References: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
 <20240216-disable_misaligned_probe_config-v4-2-dc01e581c0ac@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240216-disable_misaligned_probe_config-v4-2-dc01e581c0ac@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_034035_406751_D41FF7AD 
X-CRM114-Status: GOOD (  40.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============7871317492122383161=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7871317492122383161==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qwP6EXChpel/sZvo"
Content-Disposition: inline

--qwP6EXChpel/sZvo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 12:33:19PM -0800, Charlie Jenkins wrote:
> Introduce Kconfig options to set the kernel unaligned access support.
> These options provide a non-portable alternative to the runtime
> unaligned access probe.
>=20
> To support this, the unaligned access probing code is moved into it's
> own file and gated behind a new RISCV_PROBE_UNALIGNED_ACCESS_SUPPORT
> option.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig                          |  58 +++++-
>  arch/riscv/include/asm/cpufeature.h         |  30 +++-
>  arch/riscv/kernel/Makefile                  |   6 +-
>  arch/riscv/kernel/cpufeature.c              | 255 ----------------------=
----
>  arch/riscv/kernel/misaligned_access_speed.c | 265 ++++++++++++++++++++++=
++++++
>  arch/riscv/kernel/probe_emulated_access.c   |  64 +++++++
>  arch/riscv/kernel/sys_hwprobe.c             |  25 +++
>  arch/riscv/kernel/traps_misaligned.c        |  54 +-----
>  8 files changed, 442 insertions(+), 315 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bffbd869a068..3cf700adc43b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -690,25 +690,71 @@ config THREAD_SIZE_ORDER
>  config RISCV_MISALIGNED


Why can we not make up our minds on what to call this? The majority of
users are "unaligned" but the file you add and this config option are
"misaligned."

>  	bool "Support misaligned load/store traps for kernel and userspace"
>  	select SYSCTL_ARCH_UNALIGN_ALLOW
> +	depends on RISCV_PROBE_UNALIGNED_ACCESS || RISCV_EMULATED_UNALIGNED_ACC=
ESS
>  	default y
>  	help
>  	  Say Y here if you want the kernel to embed support for misaligned
>  	  load/store for both kernel and userspace. When disable, misaligned
>  	  accesses will generate SIGBUS in userspace and panic in kernel.
> =20
> +choice
> +	prompt "Unaligned Accesses Support"
> +	default RISCV_PROBE_UNALIGNED_ACCESS
> +	help
> +	  This selects the hardware support for unaligned accesses. This
> +	  information is used by the kernel to perform optimizations. It is also
> +	  exposed to user space via the hwprobe syscall. The hardware will be
> +	  probed at boot by default.
> +
> +config RISCV_PROBE_UNALIGNED_ACCESS
> +	bool "Probe for hardware unaligned access support"
> +	help
> +	  During boot, the kernel will run a series of tests to determine the
> +	  speed of unaligned accesses. This is the only portable option. This
> +	  probing will dynamically determine the speed of unaligned accesses on
> +	  the boot hardware.
> +
> +config RISCV_EMULATED_UNALIGNED_ACCESS
> +	bool "Assume the CPU expects emulated unaligned memory accesses"
> +	depends on NONPORTABLE

This is portable too, right?

> +	select RISCV_MISALIGNED
> +	help
> +	  Assume that the CPU expects emulated unaligned memory accesses.
> +	  When enabled, this option notifies the kernel and userspace that
> +	  unaligned memory accesses will be emulated by the kernel.

> To enforce
> +	  this expectation, RISCV_MISALIGNED is selected by this option.

Drop this IMO, let Kconfig handle displaying the dependencies.

> +
> +config RISCV_SLOW_UNALIGNED_ACCESS
> +	bool "Assume the CPU supports slow unaligned memory accesses"
> +	depends on NONPORTABLE
> +	help
> +	  Assume that the CPU supports slow unaligned memory accesses. When
> +	  enabled, this option improves the performance of the kernel on such
> +	  CPUs.

Does it? Are you sure that generating unaligned accesses on systems
where they are slow is a performance increase?
That said, I don't really see this option actually doing anything other
than setting the value for hwprobe, so I don't actually know what the
effect of this option actually is on the kernel's performance.

Generally I would like to suggest a change from "CPU" to "system" here,
since the slow cases that exist are mostly because the unaligned access
is actually emulated in firmware.

> However, the kernel will run much more slowly, or will not be
> +	  able to run at all, on CPUs that do not support unaligned memory
> +	  accesses.
> +
>  config RISCV_EFFICIENT_UNALIGNED_ACCESS
>  	bool "Assume the CPU supports fast unaligned memory accesses"
>  	depends on NONPORTABLE
>  	select DCACHE_WORD_ACCESS if MMU
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	help
> -	  Say Y here if you want the kernel to assume that the CPU supports
> -	  efficient unaligned memory accesses.  When enabled, this option
> -	  improves the performance of the kernel on such CPUs.  However, the
> -	  kernel will run much more slowly, or will not be able to run at all,
> -	  on CPUs that do not support efficient unaligned memory accesses.
> +	  Assume that the CPU supports fast unaligned memory accesses. When
> +	  enabled, this option improves the performance of the kernel on such
> +	  CPUs.  However, the kernel will run much more slowly, or will not be
> +	  able to run at all, on CPUs that do not support efficient unaligned
> +	  memory accesses.
> +
> +config RISCV_UNSUPPORTED_UNALIGNED_ACCESS

This option needs to be removed. The uabi states that unaligned access
is supported in userspace, if the cpu or firmware does not implement
unaligned access then the kernel must emulate it.

> +	bool "Assume the CPU doesn't support unaligned memory accesses"
> +	depends on NONPORTABLE
> +	help
> +	  Assume that the CPU doesn't support unaligned memory accesses. Only
> +	  select this option if there is no registered trap handler to emulate
> +	  unaligned accesses.
> =20
> -	  If unsure what to do here, say N.
> +endchoice
> =20
>  endmenu # "Platform type"

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index eb3ac304fc42..928ad3384406 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -33,10 +33,26 @@ extern struct riscv_isainfo hart_isa[NR_CPUS];
> =20
>  void riscv_user_isa_enable(void);
> =20
> -#ifdef CONFIG_RISCV_MISALIGNED
> +#if defined(CONFIG_RISCV_MISALIGNED)
> +#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
>  bool unaligned_ctl_available(void);
>  bool check_unaligned_access_emulated(int cpu);
>  void unaligned_emulation_finish(void);
> +#elif defined(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS)
> +static inline bool unaligned_ctl_available(void)
> +{
> +	return true;
> +}
> +
> +static inline bool check_unaligned_access_emulated(int cpu)
> +{
> +	return true;
> +}
> +
> +static inline void unaligned_emulation_finish(void) {}
> +#else
> +#error "CONFIG_RISCV_MISALIGNED is only supported if CONFIG_RISCV_PROBE_=
UNALIGNED_ACCESS or CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS is selected."

Why is this an error? Enforce this in Kconfig (you already have) and drop
the clause.

Cheers,
Conor.

--qwP6EXChpel/sZvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd3J7QAKCRB4tDGHoIJi
0ia+AQCU5YCXF9J0kaM+Tt9OAbetH7+JzZR2O/sLLeCFxZg9GQD+KADsdA0Xelx3
k1fmt+5ayKCVcruP4O6xdFtjtpGOUgo=
=fwKH
-----END PGP SIGNATURE-----

--qwP6EXChpel/sZvo--


--===============7871317492122383161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7871317492122383161==--

