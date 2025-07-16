Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96FEC83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Bk7gmB2UJ4XPyymLV/Q0HE1TDWBTPVYJ+iKiK4gqEQU=; b=RdPAilhbGUPFsPQ3Q2k2CB/Mwh
	qDFiToDEIjYGLYgO9TsF/nxjtEgNTzys74KS17wVvyYCLzThgWvgT9WbQUM/57oKM1ubPjllKWK5y
	vHdNIPDe3BTMbO2BVlCue8C5T8B15o8LiQ4pB7S0Swkyknl/135PyokHu6LEysZM40WAlMXiRDW8n
	LHhZ9oVxUO1pRlD8NvJU4YjRaHF1hLENGP0F4yhpW13PxWZSJHzBEeX4LQ3YT2+8tPHCAOlcWry8G
	HsVOGbxen5Gxky9iz6pryVNkz1toCg1SJ5I9yZQPcV03OHaCho35yMuoMNfhU93ODKxES9j1PF28f
	/sz4J0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7An-00000008QUI-02O9;
	Wed, 16 Jul 2025 18:48:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7Aj-00000008QTx-3Vwj
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 18:48:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-74b54cead6cso196640b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 11:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752691684; x=1753296484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL8wCnWle041tDe+nymHcVsSlw4BMV+tT91rzsEz124=;
        b=LbRAR7ZaNJdppRxdZRnqbETEGU8PtOL1TD/u+0aSMUOVihnUPyxI+ugf6cLFGWYDab
         ZKRovqbsFKCfxiq7oI7dPxdyp+dUQ0Xe7kSijvfGM37PC64j/nzmCdO89FGRBch66ybK
         95UaE6hfBVIa4HbFknfoy/zvfd2mBQ6R1gziCwTPCXdembR05f7w2jnMyc4o5Y8M5bpQ
         Zo5/m00tXARN1Ch0hMu9raB68okcyMopNCoxjxuO7R7Sur3PcNG1MONZMUfQKb+5mUxK
         L88pgZ8zfRDeZ3OzNPNuajtlccVHCsq9whnt0QfmVo3j54V/z5CmGnBQ0slkxgF4HU15
         moWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752691684; x=1753296484;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL8wCnWle041tDe+nymHcVsSlw4BMV+tT91rzsEz124=;
        b=q4K0VihMriz+aUaRdxxP/Kq+LDwdJDzdO9lAz6UAIbnkvp8jntOPSr/kcDzKmnQ8un
         rNB6adSbdQY8KSNdFANdEpU0eQDYQB8XpUd3bSaRbIQU31Z8QQquuNZrItH+UDnSS9fi
         jV50MdssffTas0fLHZstfaRTqAJ9zkWwuME2IbJkPIB9LLt/hWAhpRKvkPCrUVloUZAB
         Y9oZD8IpRH7CYZrTgJ3Hc3Nhae+wn/GU/9+a3nSINgF83DJZLbvNjLxf2daV7pxMUTk+
         md22v4mGHXprzUXv3AhnvPIaV3l6cfWjKE7Z0N5+LxzDGhrRFBq2BA4b9yFOPANn9MKf
         LYhw==
X-Gm-Message-State: AOJu0YwnO1cE3+Rsg1EXbP8FE87Lk0WIo/oof0zVVR3F5gC8Qnq5d8LS
	H0llMTiYz7WxJSU3KZHDuMKlFU2c+FwN5JyBpQDfXhSm5KsSLRrUF3qlXE+EKX4HwzO7qHaczYr
	azdhbvbs=
X-Gm-Gg: ASbGncsT0vTCTPCmXBroQ5SjT5Jcuk0d5ZTPscn/3ehQxa5sZsdhe0LyDSmYwmRrY+u
	/M3dfd6kIqH6bdxByuM5rNybS52lAwWnEL3Eq1UsicsNSLJ7SgE1ZV8qtaqfKde/UM5jgQePAc5
	dH9S+y8ofPlT411/i5ASyovM7edq0T05uflIHfdTcfdW/hkh1QDePIdl3oFiZahwm+1H+ukfvHu
	baf9I+sscaAcvKSbABJCWrkT5dKLXTL8XkOhHqVFaC6BP2wKlVAXFe2Cn+vY0e7B7ki4Oor3eap
	VKGAvaJvtnFCFCvh+NnWrOLx6Xn07frZcSsGlqVvFzKuvfVddOMM8aIgOYhyTa683nXTkkb8q57
	JdIO9PMZ1iuX+Cm/EFzOK
X-Google-Smtp-Source: AGHT+IEemuLDfwAHPUghQhJ+Lyj5EmS9ODQzRvzhpE0+zPMFNsLF/cKxpm+aymkvDZUkWWJj7doSqA==
X-Received: by 2002:a05:6a21:689:b0:230:3710:9aa9 with SMTP id adf61e73a8af0-23810666f3amr6252387637.4.1752691684234;
        Wed, 16 Jul 2025 11:48:04 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:b02a])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b3bbe71a40csm14258071a12.64.2025.07.16.11.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:48:03 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:48:03 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Jul 2025 11:47:58 PDT (-0700)
Subject: Re: [PATCH v5] riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot
In-Reply-To: <20250705150952.29461-1-wangjingwei@iscas.ac.cn>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, ajones@ventanamicro.com,
  Conor Dooley <conor.dooley@microchip.com>, cleger@rivosinc.com, Charlie Jenkins <charlie@rivosinc.com>,
  jesse@rivosinc.com, Olof Johansson <olof@lixom.net>, dlan@gentoo.org, si.yanteng@linux.dev,
  research_trasio@irq.a4lg.com, stable@vger.kernel.org, wangjingwei@iscas.ac.cn, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangjingwei@iscas.ac.cn
Message-ID: <mhng-2F811C61-A512-4742-A00D-7D01203DAB14@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_114805_883743_FA770CAB 
X-CRM114-Status: GOOD (  48.62  )
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

On Sat, 05 Jul 2025 08:08:28 PDT (-0700), wangjingwei@iscas.ac.cn wrote:
> The hwprobe vDSO data for some keys, like MISALIGNED_VECTOR_PERF,
> is determined by an asynchronous kthread. This can create a race
> condition where the kthread finishes after the vDSO data has
> already been populated, causing userspace to read stale values.
>
> To fix this, a completion-based framework is introduced to robustly
> synchronize the async probes with the vDSO data population. The
> waiting function, init_hwprobe_vdso_data(), now blocks on
> wait_for_completion() until all probes signal they are done.
>
> Furthermore, to prevent this potential blocking from impacting boot
> performance, the initialization is deferred to late_initcall. This
> is safe as the data is only required by userspace (which starts
> much later) and moves the synchronization delay off the critical
> boot path.
>
> Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
> ---
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
>     	and Alexandre.
> 	- Instead of a post-hoc refresh, this version introduces a robust
> 	completion-based framework using an atomic counter to ensure async
> 	probes are finished before populating the vDSO.
> 	- Moved the vdso data initialization to a late_initcall to avoid
> 	impacting boot time.
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
>  arch/riscv/include/asm/hwprobe.h           |  8 +++++++-
>  arch/riscv/kernel/sys_hwprobe.c            | 20 +++++++++++++++++++-
>  arch/riscv/kernel/unaligned_access_speed.c |  9 +++++++--
>  3 files changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 7fe0a379474ae2c6..3b2888126e659ea1 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -40,5 +40,11 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
>
>  	return pair->value == other_pair->value;
>  }
> -
> +#ifdef CONFIG_MMU
> +void riscv_hwprobe_register_async_probe(void);
> +void riscv_hwprobe_complete_async_probe(void);
> +#else
> +static inline void riscv_hwprobe_register_async_probe(void) {}
> +static inline void riscv_hwprobe_complete_async_probe(void) {}
> +#endif
>  #endif
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 0b170e18a2beba57..ee02aeb03e7bd3d8 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -5,6 +5,8 @@
>   * more details.
>   */
>  #include <linux/syscalls.h>
> +#include <linux/completion.h>
> +#include <linux/atomic.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
> @@ -467,6 +469,20 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
>
>  #ifdef CONFIG_MMU
>
> +static DECLARE_COMPLETION(boot_probes_done);
> +static atomic_t pending_boot_probes = ATOMIC_INIT(1);
> +
> +void riscv_hwprobe_register_async_probe(void)
> +{
> +	atomic_inc(&pending_boot_probes);
> +}
> +
> +void riscv_hwprobe_complete_async_probe(void)
> +{
> +	if (atomic_dec_and_test(&pending_boot_probes))
> +		complete(&boot_probes_done);
> +}
> +
>  static int __init init_hwprobe_vdso_data(void)
>  {
>  	struct vdso_arch_data *avd = vdso_k_arch_data;
> @@ -474,6 +490,8 @@ static int __init init_hwprobe_vdso_data(void)
>  	struct riscv_hwprobe pair;
>  	int key;
>
> +	if (unlikely(!atomic_dec_and_test(&pending_boot_probes)))
> +		wait_for_completion(&boot_probes_done);

I'm not actually sure this is safe, 

That said, it will end up bringing us back to the situation where we're 
waiting for CPUs to probe before we boot.  So even if it's safe, it's 
not great as we're going to introduce the boot time regression again.

We'd be better off if we could defer waiting on the completion until we 
actually need the values.  I think we could do that with something like

    diff --git a/arch/riscv/include/asm/vdso/arch_data.h b/arch/riscv/include/asm/vdso/arch_data.h
    index da57a3786f7a..88b37af55175 100644
    --- a/arch/riscv/include/asm/vdso/arch_data.h
    +++ b/arch/riscv/include/asm/vdso/arch_data.h
    @@ -12,6 +12,12 @@ struct vdso_arch_data {
    
     	/* Boolean indicating all CPUs have the same static hwprobe values. */
     	__u8 homogeneous_cpus;
    +
    +	/*
    +	 * A gate to check and see if the hwprobe data is actually ready, as
    +	 * probing is deferred to avoid boot slowdowns.
    +	 */
    +	__u8 ready;
     };
    
     #endif /* __RISCV_ASM_VDSO_ARCH_DATA_H */
    diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
    index ee02aeb03e7b..9c809c24a1d9 100644
    --- a/arch/riscv/kernel/sys_hwprobe.c
    +++ b/arch/riscv/kernel/sys_hwprobe.c
    @@ -454,19 +454,6 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
     	return 0;
     }
    
    -static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
    -			    size_t pair_count, size_t cpusetsize,
    -			    unsigned long __user *cpus_user,
    -			    unsigned int flags)
    -{
    -	if (flags & RISCV_HWPROBE_WHICH_CPUS)
    -		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
    -					cpus_user, flags);
    -
    -	return hwprobe_get_values(pairs, pair_count, cpusetsize,
    -				  cpus_user, flags);
    -}
    -
     #ifdef CONFIG_MMU
    
     static DECLARE_COMPLETION(boot_probes_done);
    @@ -483,15 +470,20 @@ void riscv_hwprobe_complete_async_probe(void)
     		complete(&boot_probes_done);
     }
    
    -static int __init init_hwprobe_vdso_data(void)
    +static int complete_hwprobe_vdso_data(void)
     {
     	struct vdso_arch_data *avd = vdso_k_arch_data;
     	u64 id_bitsmash = 0;
     	struct riscv_hwprobe pair;
     	int key;
    
    +	/* We've probably already produced these values. */
    +	if (likely(avd->ready))
    +		return 0;
    +
     	if (unlikely(!atomic_dec_and_test(&pending_boot_probes)))
     		wait_for_completion(&boot_probes_done);
    +
     	/*
     	 * Initialize vDSO data with the answers for the "all CPUs" case, to
     	 * save a syscall in the common case.
    @@ -519,13 +511,50 @@ static int __init init_hwprobe_vdso_data(void)
     	 * vDSO should defer to the kernel for exotic cpu masks.
     	 */
     	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
    +
    +	/*
    +	 * Make sure all the VDSO values are visible before we look at them.
    +	 * This pairs with the implicit "no speculativly visible accesses"
    +	 * barrier in the VDSO hwprobe code.
    +	 */
    +	smp_wmb();
    +	avd->ready = true;
     	return 0;
     }
    
    +static int __init init_hwprobe_vdso_data(void)
    +{
    +	struct vdso_arch_data *avd = vdso_k_arch_data;
    +
    +	/*
    +	 * Prevent the vDSO cached values from being used, as they're not ready
    +	 * yet.
    +	 */
    +	avd->ready = false;
    +}
    +
     late_initcall(init_hwprobe_vdso_data);
    +#else
    +static int complete_hwprobe_vdso_data(void) { return 0; }
    
     #endif /* CONFIG_MMU */
    
    +static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
    +			    size_t pair_count, size_t cpusetsize,
    +			    unsigned long __user *cpus_user,
    +			    unsigned int flags)
    +{
    +	complete_hwprobe_vdso_data();
    +
    +	if (flags & RISCV_HWPROBE_WHICH_CPUS)
    +		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
    +					cpus_user, flags);
    +
    +	return hwprobe_get_values(pairs, pair_count, cpusetsize,
    +				  cpus_user, flags);
    +}
    +
    +
     SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
     		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
     		cpus, unsigned int, flags)
    diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
    index 2ddeba6c68dd..bf77b4c1d2d8 100644
    --- a/arch/riscv/kernel/vdso/hwprobe.c
    +++ b/arch/riscv/kernel/vdso/hwprobe.c
    @@ -27,7 +27,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
     	 * homogeneous, then this function can handle requests for arbitrary
     	 * masks.
     	 */
    -	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
    +	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
     		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
    
     	/* This is something we can handle, fill out the pairs. */

(which I haven't even built yet, as I don't have a complier set up in 
this Mac yet...).

There's probably a better way to do this that would require a bit more 
work, as there's sort of a double-completion here (each probe's 
workqueue and then the top-level completion)).  In the long run we 
should probably fold that all together so we can just block on probing 
the values we need, but this was quick...

>  	/*
>  	 * Initialize vDSO data with the answers for the "all CPUs" case, to
>  	 * save a syscall in the common case.
> @@ -504,7 +522,7 @@ static int __init init_hwprobe_vdso_data(void)
>  	return 0;
>  }
>
> -arch_initcall_sync(init_hwprobe_vdso_data);
> +late_initcall(init_hwprobe_vdso_data);
>
>  #endif /* CONFIG_MMU */
>
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index ae2068425fbcd207..4b8ad2673b0f7470 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -379,6 +379,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>  static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
>  {
>  	schedule_on_each_cpu(check_vector_unaligned_access);

Do we need something like

    diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
    index 4b8ad2673b0f..0f4eb95072ea 100644
    --- a/arch/riscv/kernel/unaligned_access_speed.c
    +++ b/arch/riscv/kernel/unaligned_access_speed.c
    @@ -370,6 +370,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
     		(speed ==  RISCV_HWPROBE_MISALIGNED_VECTOR_FAST) ? "fast" : "slow");
    
     	per_cpu(vector_misaligned_access, cpu) = speed;
    +	/*
    +	 * Ensure the store that sets up the misaligned access value is
    +	 * visible before it is used by the other CPUs.  This orders with the
    +	 * atomic_dec_and_test() in riscv_hwprobe_complete_async_probe().
    +	 */
    +	smp_wmb();
    
     free:
     	__free_pages(page, MISALIGNED_BUFFER_ORDER);

to make sure we're ordered here?  I think we're probably safe in 
practice because the scheduler code has orderings.  Either way it's an 
existing bug, so I'll just send it along as another patch.

> +	riscv_hwprobe_complete_async_probe();
>
>  	return 0;
>  }
> @@ -473,8 +474,12 @@ static int __init check_unaligned_access_all_cpus(void)
>  			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
>  	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
>  		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> -		kthread_run(vec_check_unaligned_access_speed_all_cpus,
> -			    NULL, "vec_check_unaligned_access_speed_all_cpus");
> +		riscv_hwprobe_register_async_probe();
> +		if (IS_ERR(kthread_run(vec_check_unaligned_access_speed_all_cpus,
> +				NULL, "vec_check_unaligned_access_speed_all_cpus"))) {
> +			pr_warn("Failed to create vec_unalign_check kthread\n");
> +			riscv_hwprobe_complete_async_probe();
> +		}
>  	}
>
>  	/*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
