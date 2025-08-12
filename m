Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CA0CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIsKKO6CBoWqrIgZoGvH7tllMTD/dEaaqDJGFpZEM9Q=; b=16NDgJtAcLWr45
	h3T+o967eQKP2aQy7J61GdzfoerC/hhKAZIePD4d2N+qGbFrmcktUjsVqED/ly3OfACDR9R6i3jJW
	+ll7D1ZEv1XBGurwSe0lB8z/PwOpoUHBwEFG3bvVZJRBfOsv+5jkcaKZ/MjlZAHnqtlj87OJX3Q+m
	qIdscUpZzMEKud0YBN4VU9bfqFmEBD/rBI6mt0GaaB8D2HPdxgeZHZFsdr7zWSSh128ihGjh5nTFS
	22ICroAQhRyu3h0LzglDeyZUgji674oErdaZD51/6WCtaHmFAK4oeTfhWUiOqHb32OPS9S1DwTu44
	0a4g+EJkNAnublqbQhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHW-0000000AlSv-2Keu;
	Tue, 12 Aug 2025 12:39:10 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkhK-0000000AIHQ-3fac
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 08:49:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12CB34317E;
	Tue, 12 Aug 2025 08:49:25 +0000 (UTC)
Message-ID: <c9ee6bd3-ef2c-417f-ad46-d5943738814a@ghiti.fr>
Date: Tue, 12 Aug 2025 10:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] riscv: hwprobe: Fix stale vDSO data for
 late-initialized keys at boot
To: Jingwei Wang <wangjingwei@iscas.ac.cn>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>,
 Olof Johansson <olof@lixom.net>, Yixun Lan <dlan@gentoo.org>,
 Yanteng Si <si.yanteng@linux.dev>, Tsukasa OI
 <research_trasio@irq.a4lg.com>, stable@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250811142035.105820-1-wangjingwei@iscas.ac.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250811142035.105820-1-wangjingwei@iscas.ac.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeegkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemjedtudgumeekugguugemsgekrgdtmedvjehfsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemjedtudgumeekugguugemsgekrgdtmedvjehfsgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemjedtudgumeekugguugemsgekrgdtmedvjehfsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepfigrnhhgjhhinhhgfigvihesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggur
 dhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_014935_219930_92E3AFD5 
X-CRM114-Status: GOOD (  40.52  )
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

Hi Jingwei,

On 8/11/25 16:20, Jingwei Wang wrote:
> The hwprobe vDSO data for some keys, like MISALIGNED_VECTOR_PERF,
> is determined by an asynchronous kthread. This can create a race
> condition where the kthread finishes after the vDSO data has
> already been populated, causing userspace to read stale values.
>
> To fix this race, a new 'ready' flag is added to the vDSO data,
> initialized to 'false' during arch_initcall_sync. This flag is
> checked by both the vDSO's user-space code and the riscv_hwprobe
> syscall. The syscall serves as a one-time gate, using a completion
> to wait for any pending probes before populating the data and
> setting the flag to 'true', thus ensuring userspace reads fresh
> values on its first request.
>
> Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: stable@vger.kernel.org
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Co-developed-by: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
> ---
> Changes in v8:
> 	- Based on feedback from Alexandre, reverted the initcall back to
> 	  arch_initcall_sync since the DO_ONCE logic makes a late init redundant.
> 	- Added the required Reviewed-by and Signed-off-by tags and fixed minor
> 	  formatting nits.
>
> Changes in v7:
> 	- Refined the on-demand synchronization by using the DO_ONCE_SLEEPABLE
> 	  macro.
> 	- Fixed a build error for nommu configs and addressed several coding
> 	  style issues reported by the CI.
>
> Changes in v6:
> 	- Based on Palmer's feedback, reworked the synchronization to be on-demand,
> 	  deferring the wait until the first hwprobe syscall via a 'ready' flag.
> 	  This avoids the boot-time regression from v5's approach.
>
> Changes in v5:
> 	- Reworked the synchronization logic to a robust "sentinel-count"
> 	  pattern based on feedback from Alexandre.
> 	- Fixed a "multiple definition" linker error for nommu builds by changing
> 	  the header-file stub functions to `static inline`, as pointed out by Olof.
> 	- Updated the commit message to better explain the rationale for moving
> 	  the vDSO initialization to `late_initcall`.
>
> Changes in v4:
> 	- Reworked the synchronization mechanism based on feedback from Palmer
> 	  and Alexandre.
> 	- Instead of a post-hoc refresh, this version introduces a robust
> 	  completion-based framework using an atomic counter to ensure async
> 	  probes are finished before populating the vDSO.
> 	- Moved the vdso data initialization to a late_initcall to avoid
> 	  impacting boot time.
>
> Changes in v3:
> 	- Retained existing blank line.
>
> Changes in v2:
> 	- Addressed feedback from Yixun's regarding #ifdef CONFIG_MMU usage.
> 	- Updated commit message to provide a high-level summary.
> 	- Added Fixes tag for commit e7c9d66e313b.
>
> v1: https://lore.kernel.org/linux-riscv/20250521052754.185231-1-wangjingwei@iscas.ac.cn/T/#u
>
>   arch/riscv/include/asm/hwprobe.h           |  7 +++
>   arch/riscv/include/asm/vdso/arch_data.h    |  6 ++
>   arch/riscv/kernel/sys_hwprobe.c            | 70 ++++++++++++++++++----
>   arch/riscv/kernel/unaligned_access_speed.c |  9 ++-
>   arch/riscv/kernel/vdso/hwprobe.c           |  2 +-
>   5 files changed, 79 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 7fe0a379474ae2c6..5fe10724d307dc99 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -41,4 +41,11 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
>   	return pair->value == other_pair->value;
>   }
>   
> +#ifdef CONFIG_MMU
> +void riscv_hwprobe_register_async_probe(void);
> +void riscv_hwprobe_complete_async_probe(void);
> +#else
> +static inline void riscv_hwprobe_register_async_probe(void) {}
> +static inline void riscv_hwprobe_complete_async_probe(void) {}
> +#endif
>   #endif
> diff --git a/arch/riscv/include/asm/vdso/arch_data.h b/arch/riscv/include/asm/vdso/arch_data.h
> index da57a3786f7a53c8..88b37af55175129b 100644
> --- a/arch/riscv/include/asm/vdso/arch_data.h
> +++ b/arch/riscv/include/asm/vdso/arch_data.h
> @@ -12,6 +12,12 @@ struct vdso_arch_data {
>   
>   	/* Boolean indicating all CPUs have the same static hwprobe values. */
>   	__u8 homogeneous_cpus;
> +
> +	/*
> +	 * A gate to check and see if the hwprobe data is actually ready, as
> +	 * probing is deferred to avoid boot slowdowns.
> +	 */
> +	__u8 ready;
>   };
>   
>   #endif /* __RISCV_ASM_VDSO_ARCH_DATA_H */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 0b170e18a2beba57..44201160b9c43177 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -5,6 +5,9 @@
>    * more details.
>    */
>   #include <linux/syscalls.h>
> +#include <linux/completion.h>
> +#include <linux/atomic.h>
> +#include <linux/once.h>
>   #include <asm/cacheflush.h>
>   #include <asm/cpufeature.h>
>   #include <asm/hwprobe.h>
> @@ -452,28 +455,32 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
>   	return 0;
>   }
>   
> -static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> -			    size_t pair_count, size_t cpusetsize,
> -			    unsigned long __user *cpus_user,
> -			    unsigned int flags)
> -{
> -	if (flags & RISCV_HWPROBE_WHICH_CPUS)
> -		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
> -					cpus_user, flags);
> +#ifdef CONFIG_MMU
>   
> -	return hwprobe_get_values(pairs, pair_count, cpusetsize,
> -				  cpus_user, flags);
> +static DECLARE_COMPLETION(boot_probes_done);
> +static atomic_t pending_boot_probes = ATOMIC_INIT(1);
> +
> +void riscv_hwprobe_register_async_probe(void)
> +{
> +	atomic_inc(&pending_boot_probes);
>   }
>   
> -#ifdef CONFIG_MMU
> +void riscv_hwprobe_complete_async_probe(void)
> +{
> +	if (atomic_dec_and_test(&pending_boot_probes))
> +		complete(&boot_probes_done);
> +}
>   
> -static int __init init_hwprobe_vdso_data(void)
> +static int complete_hwprobe_vdso_data(void)
>   {
>   	struct vdso_arch_data *avd = vdso_k_arch_data;
>   	u64 id_bitsmash = 0;
>   	struct riscv_hwprobe pair;
>   	int key;
>   
> +	if (unlikely(!atomic_dec_and_test(&pending_boot_probes)))
> +		wait_for_completion(&boot_probes_done);
> +
>   	/*
>   	 * Initialize vDSO data with the answers for the "all CPUs" case, to
>   	 * save a syscall in the common case.
> @@ -501,13 +508,52 @@ static int __init init_hwprobe_vdso_data(void)
>   	 * vDSO should defer to the kernel for exotic cpu masks.
>   	 */
>   	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
> +
> +	/*
> +	 * Make sure all the VDSO values are visible before we look at them.
> +	 * This pairs with the implicit "no speculativly visible accesses"
> +	 * barrier in the VDSO hwprobe code.
> +	 */
> +	smp_wmb();
> +	avd->ready = true;
> +	return 0;
> +}
> +
> +static int __init init_hwprobe_vdso_data(void)
> +{
> +	struct vdso_arch_data *avd = vdso_k_arch_data;
> +
> +	/*
> +	 * Prevent the vDSO cached values from being used, as they're not ready
> +	 * yet.
> +	 */
> +	avd->ready = false;
>   	return 0;
>   }
>   
>   arch_initcall_sync(init_hwprobe_vdso_data);
>   
> +#else
> +
> +static int complete_hwprobe_vdso_data(void) { return 0; }
> +
>   #endif /* CONFIG_MMU */
>   
> +static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> +			    size_t pair_count, size_t cpusetsize,
> +			    unsigned long __user *cpus_user,
> +			    unsigned int flags)
> +{
> +	DO_ONCE_SLEEPABLE(complete_hwprobe_vdso_data);
> +
> +	if (flags & RISCV_HWPROBE_WHICH_CPUS)
> +		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
> +					cpus_user, flags);
> +
> +	return hwprobe_get_values(pairs, pair_count, cpusetsize,
> +				cpus_user, flags);
> +}
> +
>   SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
>   		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
>   		cpus, unsigned int, flags)
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index ae2068425fbcd207..aa912c62fb70ba0e 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -379,6 +379,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>   static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
>   {
>   	schedule_on_each_cpu(check_vector_unaligned_access);
> +	riscv_hwprobe_complete_async_probe();
>   
>   	return 0;
>   }
> @@ -473,8 +474,12 @@ static int __init check_unaligned_access_all_cpus(void)
>   			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
>   	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
>   		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> -		kthread_run(vec_check_unaligned_access_speed_all_cpus,
> -			    NULL, "vec_check_unaligned_access_speed_all_cpus");
> +		riscv_hwprobe_register_async_probe();
> +		if (IS_ERR(kthread_run(vec_check_unaligned_access_speed_all_cpus,
> +			   NULL, "vec_check_unaligned_access_speed_all_cpus"))) {
> +			pr_warn("Failed to create vec_unalign_check kthread\n");
> +			riscv_hwprobe_complete_async_probe();
> +		}
>   	}
>   
>   	/*
> diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
> index 2ddeba6c68dda09b..bf77b4c1d2d8e803 100644
> --- a/arch/riscv/kernel/vdso/hwprobe.c
> +++ b/arch/riscv/kernel/vdso/hwprobe.c
> @@ -27,7 +27,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
>   	 * homogeneous, then this function can handle requests for arbitrary
>   	 * masks.
>   	 */
> -	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
> +	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
>   		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
>   
>   	/* This is something we can handle, fill out the pairs. */


Thanks for the multiple revisions, I merged it in my fixes branch.

Thanks again,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
