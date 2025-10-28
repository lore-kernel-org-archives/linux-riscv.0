Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA35FCCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 10:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYLf8Bl543Puxeen30wq/E9D6fbzlz/RDbkOpIhh9QU=; b=aCSmgJPj/0+5cXdZXMrUL8DxBb
	j+NUJMNU/6+MNBj396ZuQgl2AfnfqyJTaWNcGvjbX5rApN7S8pvYzKDN+FbvqslZDSgry28fMo1LL
	RNTQXmRXjlgVpiWpWTAIv3qSCtKL/BeuS4PpuovyXWw/uE0jPoENw8gPk9pPXZhU9H3q47Y62ypA6
	yLkPCxLE0uYSA9zd0u9xAfG6tTK7a3vkwWESalUzaYaLDSqssyI9udLweJEL+Oxddq+S+nhvgmY6G
	rNsJar+jtThl5MeeZ+F5pGqDb8ibm9O6UFFhsq3Do/izwqdx+2PQXHV1zADEb5QdgtwxRww82ylzN
	3X2Xb2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDh9j-0000000FmOG-0I6s;
	Tue, 28 Oct 2025 10:42:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDh9g-0000000FmNZ-3pPo
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 10:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3B0248D04;
	Tue, 28 Oct 2025 10:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24094C4CEE7;
	Tue, 28 Oct 2025 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761648138;
	bh=bfFL8z7d5MpCKCiHMN5NkMlSsk8b7+8P2j/JIFdEEDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8jQ4rl/+LO2z92LpexjjXVhS++pW35U8H+pCNxZpVIstIuVjNHUA9L9jEwhjPkic
	 x3TaH+c1ELN7h4OHoHzGGTQHmv0Z4uJcDDI22jfNCvaNOWhmsRZQ07a36X7Rq9tXEO
	 ArzQC2loem1kj77EYwQlGVJ2YMljERAuJCHx8JGY76g0+15JH3NyYqnKnGA5lP2HSn
	 qJ1x9HZdsCNDEOMM2bbON0tIqbGnjwVqKYMrz6/5PBOIny34uA8xEOAua6U0wHqvKa
	 Yd4zI5g2cXyi1yt7FgBvEwS4xGA025XDUjauxM8ojqRdrHYfsk56tcW42IrRVfcmhp
	 db3ROjJnMc0LA==
Date: Tue, 28 Oct 2025 10:42:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, luxu.kernel@bytedance.com, atishp@rivosinc.com,
	cleger@rivosinc.com, ajones@ventanamicro.com,
	apatel@ventanamicro.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, songshuaishuai@tinylab.org,
	bjorn@rivosinc.com, charlie@rivosinc.com, masahiroy@kernel.org,
	valentina.fernandezalanis@microchip.com, jassisinghbrar@gmail.com,
	conor.dooley@microchip.com
Subject: Re: [PATCH 3/3] riscv: crash: use NMI to stop the CPU
Message-ID: <20251028-scallion-list-c8aa5f350286@spud>
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
 <20251027133431.15321-4-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20251027133431.15321-4-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_034221_000314_98B663A7 
X-CRM114-Status: GOOD (  33.20  )
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
Content-Type: multipart/mixed; boundary="===============1680518927997906305=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1680518927997906305==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6OwQxgChySe/71JK"
Content-Disposition: inline


--6OwQxgChySe/71JK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 09:34:31PM +0800, Yunhui Cui wrote:
> NMI is more robust than IPI for stopping CPUs during crashes,
> especially with interrupts disabled. Add SBI_SSE_EVENT_LOCAL_CRASH_NMI
> eventid to implement NMI for stopping CPUs.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/include/asm/crash.h   |  1 +
>  arch/riscv/include/asm/sbi.h     |  1 +
>  arch/riscv/kernel/crash.c        | 31 +++++++++++++-
>  drivers/firmware/riscv/sse_nmi.c | 71 +++++++++++++++++++++++++++++++-
>  include/linux/sse_nmi.h          |  8 ++++
>  5 files changed, 109 insertions(+), 3 deletions(-)
>  create mode 100644 include/linux/sse_nmi.h
>=20
> diff --git a/arch/riscv/include/asm/crash.h b/arch/riscv/include/asm/cras=
h.h
> index b64df919277d4..5076f297cbc15 100644
> --- a/arch/riscv/include/asm/crash.h
> +++ b/arch/riscv/include/asm/crash.h
> @@ -5,6 +5,7 @@
> =20
>  #ifdef CONFIG_KEXEC_CORE
>  void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
> +void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
>  #else
>  static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *=
regs)
>  {
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 52d3fdf2d4cc1..65cce85237879 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -487,6 +487,7 @@ enum sbi_sse_attr_id {
>  #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
>  #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
>  #define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
> +#define SBI_SSE_EVENT_LOCAL_CRASH_NMI		0xffff0002
>  #define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
> =20
>  #define SBI_SSE_EVENT_PLATFORM		BIT(14)
> diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
> index 12598bbc2df04..9f3f0becfdd95 100644
> --- a/arch/riscv/kernel/crash.c
> +++ b/arch/riscv/kernel/crash.c
> @@ -3,14 +3,16 @@
>  #include <linux/cpu.h>
>  #include <linux/delay.h>
>  #include <linux/kexec.h>
> +#include <linux/sse_nmi.h>
>  #include <linux/smp.h>
>  #include <linux/sched.h>
> =20
> +#include <asm/crash.h>
>  #include <asm/cpu_ops.h>
> =20
>  static atomic_t waiting_for_crash_ipi =3D ATOMIC_INIT(0);
> =20
> -inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
> +void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>  {
>  	crash_save_cpu(regs, cpu);
> =20
> @@ -27,6 +29,11 @@ inline void ipi_cpu_crash_stop(unsigned int cpu, struc=
t pt_regs *regs)
>  		wait_for_interrupt();
>  }
> =20
> +inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
> +{
> +	cpu_crash_stop(cpu, regs);
> +}
> +
>  /*
>   * The number of CPUs online, not counting this CPU (which may not be
>   * fully online and so not counted in num_online_cpus()).
> @@ -38,6 +45,24 @@ static inline unsigned int num_other_online_cpus(void)
>  	return num_online_cpus() - this_cpu_online;
>  }
> =20
> +#ifdef CONFIG_RISCV_SSE_NMI
> +static int send_nmi_stop_cpu(cpumask_t *mask)
> +{
> +	unsigned int cpu;
> +	int ret =3D 0;
> +
> +	for_each_cpu(cpu, mask)
> +		ret +=3D carsh_nmi_stop_cpu(cpu);

+=3D ? I don't really get why this sort of overcomplication is needed, why
not just return immediately here with a real error code, since you're
going to have to go to the ipi fallback anyway?

> +
> +	return ret;
> +}
> +#else
> +static inline int send_nmi_stop_cpu(cpumask_t *mask)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  void crash_smp_send_stop(void)
>  {
>  	static int cpus_stopped;
> @@ -66,7 +91,9 @@ void crash_smp_send_stop(void)
>  	atomic_set(&waiting_for_crash_ipi, num_other_online_cpus());
> =20
>  	pr_crit("SMP: stopping secondary CPUs\n");
> -	send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
> +
> +	if (send_nmi_stop_cpu(&mask))
> +		send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
> =20
>  	/* Wait up to one second for other CPUs to stop */
>  	timeout =3D USEC_PER_SEC;
> diff --git a/drivers/firmware/riscv/sse_nmi.c b/drivers/firmware/riscv/ss=
e_nmi.c
> index 2c1eaea2bbabc..152d787075345 100644
> --- a/drivers/firmware/riscv/sse_nmi.c
> +++ b/drivers/firmware/riscv/sse_nmi.c
> @@ -4,13 +4,16 @@
> =20
>  #include <linux/nmi.h>
>  #include <linux/riscv_sbi_sse.h>
> +#include <linux/sse_nmi.h>
>  #include <linux/sysctl.h>
> =20
> +#include <asm/crash.h>
>  #include <asm/irq_regs.h>
>  #include <asm/sbi.h>
> =20
>  int unknown_nmi_panic;
>  static struct sse_event *unknown_nmi_evt;
> +static struct sse_event *crash_nmi_evt;
>  static struct ctl_table_header *unknown_nmi_sysctl_header;
> =20
>  static int __init setup_unknown_nmi_panic(char *str)
> @@ -32,6 +35,12 @@ const struct ctl_table unknown_nmi_table[] =3D {
>  	},
>  };
> =20
> +static inline struct sbiret sbi_sse_ecall(int fid, unsigned long arg0,
> +					  unsigned long arg1)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, fid, arg0, arg1, 0, 0, 0, 0);
> +}
> +
>  static int unknown_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
>  {
>  	pr_emerg("NMI received for unknown on CPU %d.\n", smp_processor_id());
> @@ -73,9 +82,69 @@ static int unknown_nmi_init(void)
>  	return ret;
>  }
> =20
> +#ifdef CONFIG_KEXEC_CORE
> +int carsh_nmi_stop_cpu(unsigned int cpu)

typo: crash

> +{
> +	unsigned int hart_id =3D cpuid_to_hartid_map(cpu);
> +	u32 evt =3D SBI_SSE_EVENT_LOCAL_CRASH_NMI;
> +	struct sbiret ret;
> +
> +	ret =3D sbi_sse_ecall(SBI_SSE_EVENT_INJECT, evt, hart_id);
> +	if (ret.error) {
> +		pr_err("Failed to signal event %x, error %ld\n", evt, ret.error);

Isn't this going to emit pointless (and maybe confusing) error messages
on systems that enable the option but don't support SSE? And it's going
to be one for each secondary CPU too.

> +		return sbi_err_map_linux_errno(ret.error);
> +	}
> +
> +	return 0;
> +}
> +
> +static int crash_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
> +{
> +	cpu_crash_stop(smp_processor_id(), regs);
> +
> +	return 0;
> +}
> +
> +static int crash_nmi_init(void)
> +{
> +	int ret;
> +
> +	crash_nmi_evt =3D sse_event_register(SBI_SSE_EVENT_LOCAL_CRASH_NMI, 0,
> +				 crash_nmi_handler, NULL);
> +	if (IS_ERR(crash_nmi_evt))
> +		return PTR_ERR(crash_nmi_evt);
> +
> +	ret =3D sse_event_enable(crash_nmi_evt);
> +	if (ret) {
> +		sse_event_unregister(crash_nmi_evt);
> +		return ret;
> +	}
> +
> +	pr_info("Using SSE for crash NMI event delivery\n");
> +
> +	return 0;
> +}
> +#endif
> +
>  static int __init sse_nmi_init(void)
>  {
> -	return unknown_nmi_init();
> +	int ret;
> +
> +	ret =3D unknown_nmi_init();
> +	if (ret) {
> +		pr_err("Unknown_nmi_init failed with error %d\n", ret);
> +		return ret;
> +	}

This change looks like it shouldn't be in this patch, if you want it to
print an error, just do that from the start?

> +
> +#ifdef CONFIG_KEXEC_CORE

Can this be IS_ENABLED() or does crash_nmi_init() not have a stub?

> +	ret =3D crash_nmi_init();
> +	if (ret) {
> +		pr_err("Crash_nmi_init failed with error %d\n", ret);
> +		return ret;
> +	}
> +#endif
> +
> +	return 0;
>  }
> =20
>  late_initcall(sse_nmi_init);
> diff --git a/include/linux/sse_nmi.h b/include/linux/sse_nmi.h
> new file mode 100644
> index 0000000000000..548a348ac0a46
> --- /dev/null
> +++ b/include/linux/sse_nmi.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __LINUX_RISCV_SSE_NMI_H
> +#define __LINUX_RISCV_SSE_NMI_H
> +
> +int carsh_nmi_stop_cpu(unsigned int cpu);
> +
> +#endif
> --=20
> 2.39.5
>=20

--6OwQxgChySe/71JK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQCeBAAKCRB4tDGHoIJi
0lVKAPwKqZzmnUW0NDeMoSRsiPO/MDNJnL1de1ZpgmT0PNCFbgEA7FylyUgvG4HX
vGVOXl61Q6TUTd2p+0wZS6oKHu76RAY=
=hh+F
-----END PGP SIGNATURE-----

--6OwQxgChySe/71JK--


--===============1680518927997906305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1680518927997906305==--

