Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A62C77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 19:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuhdN7sjE9cSYmpWAoFcet4xYElp2rhqUmIGB60bkk0=; b=Hf/ZgN1iEBfapEgD0AGjR8GWxT
	e9dUNgfJNbu1fqMkXCMQE1pW2LG79RIYZKEMfYz8mgQLFr2Z7IdNFtRmUweLS2FkceMhjEDgSevBL
	fg3uqHZN4q3gWOBSE7TrL13oIA4wt8cM5kMg9z1HSSg/58WU6nfVgs90P1JiaK7hLMVU368Ezq6GI
	m/bCkPDAiO0jqFusaZ4LR6A4T98fpX1UlpiAIn9ZuiLHg7kO7J5Rl6GBrTQn9/CnbLlMu5a0mXh4B
	B4l0IkSwcKc6P7zcyihTjmz2g7ieqfJsOsxA6ZCXWNj+0fc3ROdxjuyiWXop+VMEc7gXcgWJfNcxD
	pR3QFrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poUFB-00HOUM-2o;
	Mon, 17 Apr 2023 19:10:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poUF8-00HOTl-2w
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 19:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 664DB6208F;
	Mon, 17 Apr 2023 19:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F632C4339B;
	Mon, 17 Apr 2023 19:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681758625;
	bh=yCXjwKoRnqaD54nqpiHI7E6bMmJjLV9DRWQe3iPXcU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1jYU5nwi8VcN7iCsX4LB+6L2iZDQarFJEQPAFbOJkpD63dvSLOJS6E81JEFEGr+U
	 hpEQyltNaE+ntyGtulDZati5Z7mjnW6HUYLloRWb30M8fBXkCWcm8GCJR5XfvaS1iS
	 CPVLGhYmHOr/gcbfIuDGgKCDjhqOLn/fUWGx1yYKlro3/kSQYeBI2eIyON9vEikFAS
	 AMPkq13IaRFmQokfF+erhO30b2kPhyjwxZ+dnS8FqpJ5d3XMW//0ekNv9k89cBwnX4
	 V4VpNIaeBKaEInXdXuDYDWNY0L5NF7GfKVAoWKoMXswmZp6KjWjeehV1+PrPBbsxRn
	 ep1i4V2diKGsQ==
Date: Mon, 17 Apr 2023 20:10:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>
Subject: Re: [RFC PATCH 2/2] RISC-V: Add support for sqoscfg CSR
Message-ID: <20230417-culinary-capillary-4f1efd496691@spud>
References: <20230410043646.3138446-1-dfustini@baylibre.com>
 <20230410043646.3138446-3-dfustini@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20230410043646.3138446-3-dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_121027_031579_2E645204 
X-CRM114-Status: GOOD (  41.76  )
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
Content-Type: multipart/mixed; boundary="===============5356758871368437540=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5356758871368437540==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tw0z1flI5Ff7cn7l"
Content-Disposition: inline


--Tw0z1flI5Ff7cn7l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Drew,

(Don't get your hopes up, I don't have anything really meaningful to
contribute, sorry.)

On Sun, Apr 09, 2023 at 09:36:46PM -0700, Drew Fustini wrote:
> Add support for the sqoscfg CSR defined in the Ssqosid ISA extension
> (Supervisor-mode Quality of Service ID). The CSR contains two fields:
>=20
>   - Resource Control ID (RCID) used determine resource allocation
>   - Monitoring Counter ID (MCID) used to track resource usage
>=20
> Requests from a hart to shared resources like cache will be tagged with
> these IDs. This allows the usage of shared resources to be associated
> with the task currently running on the hart.
>=20
> A sqoscfg field is added to thread_struct and has the same format as the
> sqoscfg CSR. This allows the scheduler to set the hart's sqoscfg CSR to
> contain the RCID and MCID for the task that is being scheduled in. The
> sqoscfg CSR is only written to if the thread_struct.sqoscfg is different
> from the current value of the CSR.
>=20
> A per-cpu variable cpu_sqoscfg is used to mirror that state of the CSR.
> This is because access to L1D hot memory should be several times faster
> than a CSR read. Also, in the case of virtualization, accesses to this
> CSR are trapped in the hypervisor.
>=20
> Link: https://github.com/riscv-non-isa/riscv-cmqri/blob/main/riscv-cbqri.=
pdf
> Co-developed-by: Kornel Dul=C4=99ba <mindal@semihalf.com>
> Signed-off-by: Kornel Dul=C4=99ba <mindal@semihalf.com>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
> Note: the Ssqosid extension and CBQRI spec are still in a draft state.
> The CSR address of sqoscfg is not final.
>=20
> Changes from the original patch [1]:
> - Rebase from 6.0 to 6.3
> - Simplify per-cpu variable from struct to u32 with just sqoscfg
> - Move qoscfg to thread_struct in arch/riscv/include/asm/processor.h
>   This avoids changing task_struct in /include/linux/sched.h
> - Reword commit description
> - Reword Kconfig description
>=20
> [1] https://github.com/rivosinc/linux/commit/8454b793a62be21d39e5826ef524=
1dfa06198ba9
>=20
>  arch/riscv/Kconfig                 | 19 ++++++++++++++
>  arch/riscv/include/asm/csr.h       |  8 ++++++
>  arch/riscv/include/asm/processor.h |  3 +++
>  arch/riscv/include/asm/qos.h       | 40 ++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/switch_to.h |  2 ++
>  5 files changed, 72 insertions(+)
>  create mode 100644 arch/riscv/include/asm/qos.h
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index cc02eb9eee1f..03f22b7fe34b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -418,6 +418,25 @@ config RISCV_ISA_SVNAPOT
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_SSQOSID
> +	bool "Ssqosid extension support"
> +	default y
> +	help
> +	  Adds support for the Ssqosid ISA extension (Supervisor-mode
> +	  Quality of Service ID).

Could you add "long form" text in brackets here to the bool line, a la:
https://patchwork.kernel.org/project/linux-riscv/patch/20230405-pucker-cogw=
heel-3a999a94a2f2@wendy/

> +
> +	  Ssqosid defines the sqoscfg CSR which allows the system to tag
> +	  the running process with RCID (Resource Control ID) and MCID
> +	  (Monitoring Counter ID). The RCID is used determine resource
> +	  allocation. The MCID is used to track resource usage in event
> +	  counters.
> +
> +	  For example, a cache controller may use the RCID to apply a
> +	  cache partitioning scheme and use the MCID to track how much
> +	  cache a process, or a group of processes, is using.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config RISCV_ISA_SVPBMT
>  	bool "SVPBMT extension support"
>  	depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 7c2b8cdb7b77..17d04a0cacd6 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -59,6 +59,13 @@
>  #define SATP_ASID_MASK	_AC(0xFFFF, UL)
>  #endif
> =20
> +/* SQOSCFG fields */
> +#define SQOSCFG_RCID_MASK	_AC(0x00000FFF, UL)
> +#define SQOSCFG_MCID_MASK	SQOSCFG_RCID_MASK
> +#define SQOSCFG_MCID_SHIFT	16
> +#define SQOSCFG_MASK		((SQOSCFG_MCID_MASK << SQOSCFG_MCID_SHIFT) | \
> +				  SQOSCFG_RCID_MASK)
> +
>  /* Exception cause high bit - is an interrupt if set */
>  #define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
> =20
> @@ -245,6 +252,7 @@
>  #define CSR_STVAL		0x143
>  #define CSR_SIP			0x144
>  #define CSR_SATP		0x180
> +#define CSR_SQOSCFG		0x181
> =20
>  #define CSR_STIMECMP		0x14D
>  #define CSR_STIMECMPH		0x15D
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index 94a0590c6971..724b2aa2732d 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -39,6 +39,9 @@ struct thread_struct {
>  	unsigned long s[12];	/* s[0]: frame pointer */
>  	struct __riscv_d_ext_state fstate;
>  	unsigned long bad_cause;
> +#ifdef CONFIG_RISCV_ISA_SSQOSID
> +	u32 sqoscfg;
> +#endif
>  };
> =20
>  /* Whitelist the fstate from the task_struct for hardened usercopy */
> diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
> new file mode 100644
> index 000000000000..297e7fb64d80
> --- /dev/null
> +++ b/arch/riscv/include/asm/qos.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_QOS_H
> +#define _ASM_RISCV_QOS_H
> +
> +#ifdef CONFIG_RISCV_ISA_SSQOSID
> +
> +#include <linux/sched.h>
> +#include <linux/jump_label.h>
> +
> +#include <asm/barrier.h>
> +#include <asm/csr.h>
> +#include <asm/hwcap.h>
> +
> +/* cached value of sqoscfg csr for each cpu */
> +static DEFINE_PER_CPU(u32, cpu_sqoscfg);
> +
> +static void __qos_sched_in(struct task_struct *task)
> +{
> +	u32 *cpu_sqoscfg_ptr =3D this_cpu_ptr(&cpu_sqoscfg);
> +	u32 thread_sqoscfg;
> +
> +	thread_sqoscfg =3D READ_ONCE(task->thread.sqoscfg);
> +
> +	if (thread_sqoscfg !=3D *cpu_sqoscfg_ptr) {
> +		*cpu_sqoscfg_ptr =3D thread_sqoscfg;
> +		csr_write(CSR_SQOSCFG, thread_sqoscfg);
> +	}
> +}
> +
> +static inline void qos_sched_in(struct task_struct *task)

"qos" is a pretty generic prefix, no? Do you think we'd be better off
prefixing this (and every other extension related thing) with `riscv_`?

> +{
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSQOSID))
> +		__qos_sched_in(task);
> +}
> +#else
> +
> +static inline void qos_sched_in(struct task_struct *task) {}
> +
> +#endif /* CONFIG_RISCV_ISA_SSQOSID */
> +#endif /* _ASM_RISCV_QOS_H */
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 60f8ca01d36e..75d9bfd766af 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -12,6 +12,7 @@
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/csr.h>
> +#include <asm/qos.h>
> =20
>  #ifdef CONFIG_FPU
>  extern void __fstate_save(struct task_struct *save_to);
> @@ -79,6 +80,7 @@ do {							\
>  	if (has_fpu())					\
>  		__switch_to_aux(__prev, __next);	\
>  	((last) =3D __switch_to(__prev, __next));		\
> +	qos_sched_in(__next);				\

Both FPU and vector do:
|	if (has_fpu())					\
|		__switch_to_fpu(__prev, __next);	\
|	if (has_vector())				\
|		__switch_to_vector(__prev, __next);	\

Is it just my OCD that wants ssqosid to be the same?
It'd also do away with that seems a bit weird to me: having
qos_sched_in() and __qos_sched_in().
Even if you don't make them similar, what's the rationale behind not
inverting the extension check & returning early from a single function.

This is kinda above my pay grade, so let me know what I've inevitably
missed,
Conor.

> =20
>  #endif /* _ASM_RISCV_SWITCH_TO_H */
> --=20
> 2.34.1
>=20

--Tw0z1flI5Ff7cn7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD2ZnAAKCRB4tDGHoIJi
0vLTAQDGkLnWsmQt646uefVhaTXvfTn0++As1HwREmulLGS+rgEA7r/IXR2OECZO
KbR7orDq25nByBfalRIlUutraceTjgk=
=IClB
-----END PGP SIGNATURE-----

--Tw0z1flI5Ff7cn7l--


--===============5356758871368437540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5356758871368437540==--

