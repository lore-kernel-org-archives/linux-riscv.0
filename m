Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD72C83F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b2f9n9sn2owtwn6L1pqxoMRQFfI29ST0T6SbkIa0W0=; b=kbf9s87XPZA/Pw5W933qPCeVjn
	t5IVRnftoDfP7z2qe4lJgf5J4zxJLVwk0VrIKTCORU0xUdgOmPNzA8blxPlNkRglrJhNgdFmrlA4u
	peA+qpp5ZJb2XADXhD7O8yo2BydKjWXCmcXko8oA43HpmE/Zw0wi7WR3AQgsljlEfHqZKPgNz2z+A
	YOUUXVppVjQEt+zb/HJCEYGQS5RXN4XQ/7/goCKfoba+nUOrjoSY5/ZIvnHa4qHyOEdDZ11Lyhj4J
	LycSBLn+TTMLqvIWnWSjQLzG69OAnuZKZC9GgzN0f3VAdNd7V+fZCsSdeknorevublOs6OIDgiqO1
	sJ4dgo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkTT-00FZOW-1q;
	Thu, 31 Aug 2023 16:24:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkTQ-00FZO8-1G
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 16:24:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CC1C8B8226C;
	Thu, 31 Aug 2023 16:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D121FC433C7;
	Thu, 31 Aug 2023 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693499085;
	bh=zwJSN1sITiZcQp6+peVuyAhvP1gt7anVAM9arhkQU4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qp4PyJpxfqcqraBA111lFzTZA3rXFcxhPDWxCOAU1M8eYm7QDiGO1+6B2u1EvaMWT
	 OgsyTBVr9bMFpAd5wyLzUgYmj+jGo1Z/F7ELLwmbh0R//GwNl4/MPDn55NPZ43y+Ok
	 2MpwSH9Mu04TzzHHlPvS7yyI0h1ZgAPkiz3R9SsrY7QsIMwr36MzxiwH7edFYxovDB
	 0sMSaWlO4Iml53akVy01OISwhD9UOeHWDhk2EUwUI2rA+VCdsObB0amXLETiLZimqu
	 muvfnQ3cuLYHiQKLVcZ9unxakDh0xCDt9oHgD+XMvV7BHZtJGrFo04WfJlJd5wBEd+
	 RuTl3C72c9VRw==
Date: Thu, 31 Aug 2023 17:24:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v2 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230831-tacking-fiction-1f18a30714d7@spud>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
 <20230830164954.91987-10-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230830164954.91987-10-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_092448_727945_9C748152 
X-CRM114-Status: GOOD (  27.12  )
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
Content-Type: multipart/mixed; boundary="===============6921861919539836835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6921861919539836835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XP3oxhO8sBWU4duI"
Content-Disposition: inline


--XP3oxhO8sBWU4duI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 06:49:57PM +0200, Andrew Jones wrote:
> When Zicboz is present, enable its instruction (cbo.zero) in
> usermode by setting its respective senvcfg bit. We don't bother
> trying to set this bit per-task, which would also require an
> interface for tasks to request enabling and/or disabling. Instead,
> permanently set the bit for each hart which has the extension when
> bringing it online.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/cpufeature.h |  2 ++
>  arch/riscv/include/asm/csr.h        |  1 +
>  arch/riscv/include/asm/hwcap.h      | 16 ++++++++++++++++
>  arch/riscv/kernel/cpufeature.c      |  6 ++++++
>  arch/riscv/kernel/setup.c           |  4 ++++
>  arch/riscv/kernel/smpboot.c         |  4 ++++
>  6 files changed, 33 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 23fed53b8815..788fd575c21a 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -30,4 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
> =20
> +void riscv_user_isa_enable(void);
> +
>  #endif
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 7bac43a3176e..e187e76e3df4 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -273,6 +273,7 @@
>  #define CSR_SIE			0x104
>  #define CSR_STVEC		0x105
>  #define CSR_SCOUNTEREN		0x106
> +#define CSR_SENVCFG		0x10a
>  #define CSR_SSCRATCH		0x140
>  #define CSR_SEPC		0x141
>  #define CSR_SCAUSE		0x142
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index f041bfa7f6a0..66178dbd0045 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -66,6 +66,7 @@
>  #ifndef __ASSEMBLY__
> =20
>  #include <linux/jump_label.h>
> +#include <asm/cpufeature.h>
> =20
>  unsigned long riscv_get_elf_hwcap(void);
> =20
> @@ -130,6 +131,21 @@ riscv_has_extension_unlikely(const unsigned long ext)
>  	return true;
>  }
> =20
> +static __always_inline bool riscv_cpu_has_extension_likely(int cpu, cons=
t unsigned long ext)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(=
ext))
> +		return true;

It'd have been nice to put the explanation for this into the commit
message I think, but w/e. Do it if there's a v3 I guess.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +
> +	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> +}
> +
> +static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, co=
nst unsigned long ext)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikel=
y(ext))
> +		return true;
> +
> +	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> +}
>  #endif
> =20
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 31843e9cc80c..a33cf7c89d9e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -391,6 +391,12 @@ unsigned long riscv_get_elf_hwcap(void)
>  	return hwcap;
>  }
> =20
> +void riscv_user_isa_enable(void)
> +{
> +	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_=
ZICBOZ))
> +		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
> +}
> +
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  /*
>   * Alternative patch sites consider 48 bits when determining when to pat=
ch
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 971fe776e2f8..2f053f0763a1 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -25,6 +25,7 @@
>  #include <asm/acpi.h>
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
> +#include <asm/cpufeature.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/early_ioremap.h>
>  #include <asm/pgtable.h>
> @@ -308,9 +309,12 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_fill_hwcap();
>  	init_rt_signal_env();
>  	apply_boot_alternatives();
> +
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
>  	    riscv_isa_extension_available(NULL, ZICBOM))
>  		riscv_noncoherent_supported();
> +
> +	riscv_user_isa_enable();
>  }
> =20
>  static int __init topology_init(void)
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index f4d6acb38dd0..502b04abda0b 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -25,6 +25,8 @@
>  #include <linux/of.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sched/mm.h>
> +
> +#include <asm/cpufeature.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/irq.h>
>  #include <asm/mmu_context.h>
> @@ -252,6 +254,8 @@ asmlinkage __visible void smp_callin(void)
>  			elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
>  	}
> =20
> +	riscv_user_isa_enable();
> +
>  	/*
>  	 * Remote TLB flushes are ignored while the CPU is offline, so emit
>  	 * a local TLB flush right now just in case.
> --=20
> 2.41.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--XP3oxhO8sBWU4duI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPC+yQAKCRB4tDGHoIJi
0o+YAP9yqYMApLd3xyEt30XScuZRKziGJ47Hgc3qPCL01gmgYAEA7b0lLVaLHl/H
SoOm9KnWKBJW0vsPjiPkSM6g/+8XjQw=
=cehg
-----END PGP SIGNATURE-----

--XP3oxhO8sBWU4duI--


--===============6921861919539836835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6921861919539836835==--

