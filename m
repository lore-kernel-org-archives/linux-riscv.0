Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78BEC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vskALWgvxnhSCryaNNcjdKQOX1XXxFu9RC7wOAsiqn8=; b=VknZB0GaL1a7dE
	NaKF5wlGaccpAXZnpOdHLLs4Ajri4/jle9vnDzOrxNJmif2tDCtHjcXNaqlPQz8XmIrxINRQlhVJS
	ZuH/ZWlBbNYhmDggMUHcqj6hIqlyQLKSPVzhHPZW+mzacZTDLnCPYJVlm/OaDo1BpX5yHmLpCyA+j
	hYkXvePmCnL2YKyuTCmCKGbREeNH5ROHh3048R0uLjXShCOoqRSwS9gO9F48Ozx7E5ozObu4uDe1V
	7oYJmEuNmZJsYrXc+CFdCSVaqVmPlaUw33TFExVGxrM+VzwF/0kq6GG+3i+eTYUYX8/XVGAtnSB3y
	fWrhrx2D1I3TsPfXeuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgQo-004yt9-37;
	Mon, 11 Dec 2023 13:34:46 +0000
Received: from [2607:5300:203:b2ee::31e5] (helo=smtpout.efficios.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgQb-004yom-27
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 13:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1702301662;
	bh=oyewAeZtoI0Q+ZTNFeINxCOLYbhdI7aug4gSZoVrV+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ofrwcrl7+XgnzpXfJoIJalXwo2Vw+7IvrpcUrCRER7mIwdlr3TOlZTDzT9ZtJfQ8w
	 fonhICaS/cC+1YadJQy0MCCk4RLnHChHoAIFTSEYYa2CLNTDM/yHe1y21ydfioci8v
	 7w2rax07UkfKI92KkhuI9Ywt9xUaMVfufxHxQbRiARmWHaCQ3oEmEJNQt+4vfIxHqo
	 oFZKTRGr/wSEYgi00y9U+MUm9vwp7D/bz/IZ7VMdUys75lf4aFhFD4SoGB213wIcpV
	 jNpllhk3i46tBkQS9DoUHdI7oBI1ftIsRGo8UR/yqTesvetDYXhYtRTh1m3DfC6t5Q
	 GI0NWftwnlK1w==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4SpjQQ0Y7BzG7T;
	Mon, 11 Dec 2023 08:34:22 -0500 (EST)
Message-ID: <8132d732-b9e8-4a52-be5d-74db7a159136@efficios.com>
Date: Mon, 11 Dec 2023 08:34:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] membarrier: Introduce Kconfig ARCH_HAS_MEMBARRIER
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>, paulmck@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
 charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231211094414.8078-1-parri.andrea@gmail.com>
 <20231211094414.8078-5-parri.andrea@gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20231211094414.8078-5-parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_053433_846454_61461FA2 
X-CRM114-Status: GOOD (  27.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-12-11 04:44, Andrea Parri wrote:
> Architectures supporting the "private expedited" membarrier command must
> select the Kconfig to use the command.  Document status and requirements
> for each architecture in a single file under Documentation/features.

Sorry for being vague in my suggestion: I did not intend to make it
optional (not ARCH_HAS_MEMBARRIER), but rather just to have a central
place where this would be documented.

I'm not sure where in Documentation this should land though ?

Thanks,

Mathieu


> 
> Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> ---
> The TODOs in the arch-support table below should really be interpreted
> as "I'm not sure/haven't checked" (the respective arch maintainers will
> be able to verify and amend such information).
> 
> Based on the following inline comment in __schedule():
> 
> 	/*
> 	 * The membarrier system call requires each architecture
> 	 * to have a full memory barrier after updating
> 	 * rq->curr, before returning to user-space.
> 	 *
> 	 * Here are the schemes providing that barrier on the
> 	 * various architectures:
> 	 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
> 	 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
> 	 *   on PowerPC and on RISC-V.
> 	 * - finish_lock_switch() for weakly-ordered
> 	 *   architectures where spin_unlock is a full barrier,
> 	 * - switch_to() for arm64 (weakly-ordered, spin_unlock
> 	 *   is a RELEASE barrier),
> 	 */
> 
>   .../sched/membarrier/arch-support.txt         | 50 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   arch/alpha/Kconfig                            |  1 +
>   arch/arc/Kconfig                              |  1 +
>   arch/arm/Kconfig                              |  1 +
>   arch/arm64/Kconfig                            |  1 +
>   arch/hexagon/Kconfig                          |  1 +
>   arch/mips/Kconfig                             |  1 +
>   arch/powerpc/Kconfig                          |  1 +
>   arch/riscv/Kconfig                            |  1 +
>   arch/s390/Kconfig                             |  1 +
>   arch/sparc/Kconfig                            |  1 +
>   arch/x86/Kconfig                              |  1 +
>   init/Kconfig                                  |  3 ++
>   kernel/sched/core.c                           |  4 +-
>   kernel/sched/membarrier.c                     | 15 +++++-
>   16 files changed, 80 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/features/sched/membarrier/arch-support.txt
> 
> diff --git a/Documentation/features/sched/membarrier/arch-support.txt b/Documentation/features/sched/membarrier/arch-support.txt
> new file mode 100644
> index 0000000000000..95e65195e47c2
> --- /dev/null
> +++ b/Documentation/features/sched/membarrier/arch-support.txt
> @@ -0,0 +1,50 @@
> +#
> +# Feature name:          membarrier
> +#         Kconfig:       ARCH_HAS_MEMBARRIER
> +#         description:   arch supports MEMBARRIER_CMD_PRIVATE_EXPEDITED
> +#
> +# Architecture requirements
> +#
> +# The membarrier() system call requires each architecture to have a full memory
> +# barrier after updating rq->curr, before returning to user-space.
> +#
> +# Here are the schemes providing that barrier on the various architectures:
> +#
> +# * alpha/arc/arm/hexagon/mips
> +#
> +# We rely on the full barrier implied by spin_unlock() in finish_lock_switch().
> +#
> +# * arm64
> +#
> +# We rely on the full barrier implied by switch_to().
> +#
> +# * powerpc/riscv/s390/sparc/x86
> +#
> +# We rely on the full barrier implied by switch_mm(), if mm isn't NULL; we rely
> +# on the full barrier implied by mmdrop(), otherwise.
> +#
> +    -----------------------
> +    |         arch |status|
> +    -----------------------
> +    |       alpha: |  ok  |
> +    |         arc: |  ok  |
> +    |         arm: |  ok  |
> +    |       arm64: |  ok  |
> +    |        csky: | TODO |
> +    |     hexagon: |  ok  |
> +    |   loongarch: | TODO |
> +    |        m68k: | TODO |
> +    |  microblaze: | TODO |
> +    |        mips: |  ok  |
> +    |       nios2: | TODO |
> +    |    openrisc: | TODO |
> +    |      parisc: | TODO |
> +    |     powerpc: |  ok  |
> +    |       riscv: |  ok  |
> +    |        s390: |  ok  |
> +    |          sh: | TODO |
> +    |       sparc: |  ok  |
> +    |          um: | TODO |
> +    |         x86: |  ok  |
> +    |      xtensa: | TODO |
> +    -----------------------
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f6f1fdc76cf46..c5a053605cbc4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13807,6 +13807,7 @@ M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>   M:	"Paul E. McKenney" <paulmck@kernel.org>
>   L:	linux-kernel@vger.kernel.org
>   S:	Supported
> +F:	Documentation/features/sched/membarrier*/
>   F:	arch/*/include/asm/membarrier.h
>   F:	arch/*/include/asm/sync_core.h
>   F:	include/uapi/linux/membarrier.h
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index d6968d090d49a..f98d6cba0bd9a 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -24,6 +24,7 @@ config ALPHA
>   	select GENERIC_IRQ_SHOW
>   	select ARCH_WANT_IPC_PARSE_VERSION
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> +	select ARCH_HAS_MEMBARRIER
>   	select AUDIT_ARCH
>   	select GENERIC_CPU_VULNERABILITIES
>   	select GENERIC_SMP_IDLE_THREAD
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 3162db540ee96..1d8a6ba98ae33 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -9,6 +9,7 @@ config ARC
>   	select ARCH_HAS_CACHE_LINE_SIZE
>   	select ARCH_HAS_DEBUG_VM_PGTABLE
>   	select ARCH_HAS_DMA_PREP_COHERENT
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_SETUP_DMA_OPS
>   	select ARCH_HAS_SYNC_DMA_FOR_CPU
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f8567e95f98be..700d1d9ff2f8b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -14,6 +14,7 @@ config ARM
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_KEEPINITRD
>   	select ARCH_HAS_KCOV
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>   	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7b071a00425d2..d21788e6920f6 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -31,6 +31,7 @@ config ARM64
>   	select ARCH_HAS_GIGANTIC_PAGE
>   	select ARCH_HAS_KCOV
>   	select ARCH_HAS_KEEPINITRD
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>   	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
> index a880ee067d2ec..c2b2713c01bbd 100644
> --- a/arch/hexagon/Kconfig
> +++ b/arch/hexagon/Kconfig
> @@ -5,6 +5,7 @@ comment "Linux Kernel Configuration for Hexagon"
>   config HEXAGON
>   	def_bool y
>   	select ARCH_32BIT_OFF_T
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>   	select ARCH_NO_PREEMPT
>   	select DMA_GLOBAL_POOL
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 797ae590ebdba..4b65e73e34c16 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -16,6 +16,7 @@ config MIPS
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>   	select ARCH_HAS_GCOV_PROFILE_ALL
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_KEEP_MEMBLOCK
>   	select ARCH_USE_BUILTIN_BSWAP
>   	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6f105ee4f3cf5..c13980eac3585 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>   	select ARCH_HAS_GCOV_PROFILE_ALL
>   	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
>   	select ARCH_HAS_KCOV
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_HAS_MEMBARRIER_CALLBACKS
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_64S_HASH_MMU
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index db7b1acd943e4..fd4c6a74ebd61 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -27,6 +27,7 @@ config RISCV
>   	select ARCH_HAS_GCOV_PROFILE_ALL
>   	select ARCH_HAS_GIGANTIC_PAGE
>   	select ARCH_HAS_KCOV
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_HAS_MEMBARRIER_CALLBACKS
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_MMIOWB
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 3bec98d20283b..2e044d424fd4a 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -72,6 +72,7 @@ config S390
>   	select ARCH_HAS_GCOV_PROFILE_ALL
>   	select ARCH_HAS_GIGANTIC_PAGE
>   	select ARCH_HAS_KCOV
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_MEM_ENCRYPT
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index 49849790e66dc..40eb179c2416a 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -30,6 +30,7 @@ config SPARC
>   	select RTC_SYSTOHC
>   	select HAVE_ARCH_JUMP_LABEL if SPARC64
>   	select GENERIC_IRQ_SHOW
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_WANT_IPC_PARSE_VERSION
>   	select GENERIC_PCI_IOMAP
>   	select HAS_IOPORT
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 3762f41bb0929..83f63e00312ee 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -82,6 +82,7 @@ config X86
>   	select ARCH_HAS_GCOV_PROFILE_ALL
>   	select ARCH_HAS_KCOV			if X86_64
>   	select ARCH_HAS_MEM_ENCRYPT
> +	select ARCH_HAS_MEMBARRIER
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>   	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> diff --git a/init/Kconfig b/init/Kconfig
> index 87daf50838f02..8114404b52b91 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1742,6 +1742,9 @@ config KALLSYMS_BASE_RELATIVE
>   
>   # syscall, maps, verifier
>   
> +config ARCH_HAS_MEMBARRIER
> +	bool
> +
>   config ARCH_HAS_MEMBARRIER_CALLBACKS
>   	bool
>   
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 711dc753f7216..dff1c6df337f9 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6673,8 +6673,8 @@ static void __sched notrace __schedule(unsigned int sched_mode)
>   		 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
>   		 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
>   		 *   on PowerPC and on RISC-V.
> -		 * - finish_lock_switch() for weakly-ordered
> -		 *   architectures where spin_unlock is a full barrier,
> +		 * - finish_lock_switch() for alpha, arc, arm, hexagon, mips
> +		 *   where spin_unlock is a full barrier,
>   		 * - switch_to() for arm64 (weakly-ordered, spin_unlock
>   		 *   is a RELEASE barrier),
>   		 */
> diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
> index 58f801e013988..248a38c9b261c 100644
> --- a/kernel/sched/membarrier.c
> +++ b/kernel/sched/membarrier.c
> @@ -137,6 +137,14 @@
>    * Bitmask made from a "or" of all commands within enum membarrier_cmd,
>    * except MEMBARRIER_CMD_QUERY.
>    */
> +#ifdef CONFIG_ARCH_HAS_MEMBARRIER
> +#define MEMBARRIER_PRIVATE_EXPEDITED_BITMASK			\
> +	(MEMBARRIER_CMD_PRIVATE_EXPEDITED			\
> +	| MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED)
> +#else
> +#define MEMBARRIER_PRIVATE_EXPEDITED_BITMASK	0
> +#endif
> +
>   #ifdef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
>   #define MEMBARRIER_PRIVATE_EXPEDITED_SYNC_CORE_BITMASK			\
>   	(MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE			\
> @@ -156,8 +164,7 @@
>   #define MEMBARRIER_CMD_BITMASK						\
>   	(MEMBARRIER_CMD_GLOBAL | MEMBARRIER_CMD_GLOBAL_EXPEDITED	\
>   	| MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED			\
> -	| MEMBARRIER_CMD_PRIVATE_EXPEDITED				\
> -	| MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED			\
> +	| MEMBARRIER_PRIVATE_EXPEDITED_BITMASK				\
>   	| MEMBARRIER_PRIVATE_EXPEDITED_SYNC_CORE_BITMASK		\
>   	| MEMBARRIER_PRIVATE_EXPEDITED_RSEQ_BITMASK			\
>   	| MEMBARRIER_CMD_GET_REGISTRATIONS)
> @@ -329,6 +336,8 @@ static int membarrier_private_expedited(int flags, int cpu_id)
>   			return -EPERM;
>   		ipi_func = ipi_rseq;
>   	} else {
> +		if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER))
> +			return -EINVAL;
>   		WARN_ON_ONCE(flags);
>   		if (!(atomic_read(&mm->membarrier_state) &
>   		      MEMBARRIER_STATE_PRIVATE_EXPEDITED_READY))
> @@ -519,6 +528,8 @@ static int membarrier_register_private_expedited(int flags)
>   		ready_state =
>   			MEMBARRIER_STATE_PRIVATE_EXPEDITED_RSEQ_READY;
>   	} else {
> +		if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER))
> +			return -EINVAL;
>   		WARN_ON_ONCE(flags);
>   	}
>   

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
