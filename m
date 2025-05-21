Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2791DC54E65
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXz3PwnN3XaV6elTVIL7NxgxikSOy2bFSGKZsnFueDA=; b=rQi0RCatUL6fU+
	WyDyKcXl6OOcYk/M7eu7C5AAZcPBpMrJXrOFOTcJwpTuArHOia0xMeVk4F7iklHTJMVwtu3stD7xX
	Lsd8VvyYYPB3o+jc9Zc+lzZvgB81YrKnK6AoYQerJPWghnHYQNPK5eWOtgBCxb4IyV88fj8bvpsMx
	QSjzYO+/pmlMrruuceWb4+zu6au0L6wkxSsOPUC2Yehi9RCxzq5JVCsxzF3E7NIxHa1lFOYGX1uy+
	LhBeroRuV6mEWsGLPI5Xc1jsGXWSvif+f6PfBiLTb0XOGpOYVfkKgBg1j35HwxcHd1lLKE8moHNyz
	j4viKuX/3iHOn9DYRciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHeFs-0000000F6gg-2wxa;
	Wed, 21 May 2025 07:52:48 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHeFr-0000000F6fY-0UGt
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 07:52:48 +0000
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC0563430E9;
	Wed, 21 May 2025 07:52:44 +0000 (UTC)
Date: Wed, 21 May 2025 07:52:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: wangjingwei@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH] riscv: hwprobe: Fix stale vDSO data for late-initialized
 keys at boot
Message-ID: <20250521075235-GYA30582@gentoo>
References: <20250521052754.185231-1-wangjingwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250521052754.185231-1-wangjingwei@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_005247_186606_60576D5C 
X-CRM114-Status: GOOD (  29.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jingwei,

On 13:27 Wed 21 May     , wangjingwei@iscas.ac.cn wrote:
> From: Jingwei Wang <wangjingwei@iscas.ac.cn>
> 
> The riscv_hwprobe vDSO data is populated by init_hwprobe_vdso_data(),
> an arch_initcall_sync. However, underlying data for some keys, like
> RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF, is determined asynchronously.
> 
> Specifically, the per_cpu(vector_misaligned_access, cpu) values are set
> by the vec_check_unaligned_access_speed_all_cpus kthread. This kthread
> is spawned by an earlier arch_initcall (check_unaligned_access_all_cpus)
> and may complete its benchmark *after* init_hwprobe_vdso_data() has
> already populated the vDSO with default/stale values.
> 
> This patch introduces riscv_hwprobe_vdso_sync(sync_key). This function
> is now called by the vec_check_unaligned_access_speed_all_cpus kthread
> upon its completion. It re-evaluates the specified key using current kernel
> state (including the finalized per-CPU data) via hwprobe_one_pair()
> and updates the corresponding entry in vdso_k_arch_data.
> 
Personally, it's unnecessary to explain the patch line by line, 
giving a high level summary would be great

> This ensures the vDSO accurately reflects the final boot-time values
> for keys determined by such asynchronous boot tasks, resolving observed
> inconsistencies when userspace starts.
> 
> Test by comparing vDSO and syscall results for affected keys
> (e.g., MISALIGNED_VECTOR_PERF), which now match their final
> boot-time values.
> 
> Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
As you give a Closes tag here, so I'd ask

Can you check which commit introduced this problem? it might warrant
a Fixes tag, please also CC stable if needed

(Check the kernel commit log for what's format of Fixes tag,
 12 charactors for hash + full commit title)

> Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/hwprobe.h           |  4 ++++
>  arch/riscv/kernel/sys_hwprobe.c            | 16 ++++++++++++++++
>  arch/riscv/kernel/unaligned_access_speed.c |  4 +++-
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 1f690fea0e03de6a..02c34f03d8b9bc83 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -40,4 +40,8 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
>  	return pair->value == other_pair->value;
>  }
>  
> +#ifdef CONFIG_MMU
> +void riscv_hwprobe_vdso_sync(s64 sync_key);
> +#endif /* CONFIG_MMU */
> +
we usually try to avoid repeat "#ifdef CONFIG_MMU" in header & c file (unaligned_access_speed.c)
so, you can do

#ifdef CONFIG_MMU
void riscv_hwprobe_vdso_sync(s64 sync_key);
#else
static inline void riscv_hwprobe_vdso_sync(s64 sync_key) { };
#endif /* CONFIG_MMU */


>  #endif
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 249aec8594a92a80..c2593bd766055d35 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -17,6 +17,7 @@
>  #include <asm/vector.h>
>  #include <asm/vendor_extensions/thead_hwprobe.h>
>  #include <vdso/vsyscall.h>
> +#include <vdso/datapage.h>
>  
>  
>  static void hwprobe_arch_id(struct riscv_hwprobe *pair,
> @@ -500,6 +501,21 @@ static int __init init_hwprobe_vdso_data(void)
>  
>  arch_initcall_sync(init_hwprobe_vdso_data);
>  
> +void riscv_hwprobe_vdso_sync(s64 sync_key)
> +{
> +	struct vdso_arch_data *avd = vdso_k_arch_data;
> +	struct riscv_hwprobe pair;
> +
> +	pair.key = sync_key;
> +	hwprobe_one_pair(&pair, cpu_online_mask);
> +	/*
> +	 * Update vDSO data for the given key.
> +	 * Currently for non-ID key updates (e.g. MISALIGNED_VECTOR_PERF),
> +	 * so 'homogeneous_cpus' is not re-evaluated here.
> +	 */
> +	avd->all_cpu_hwprobe_values[sync_key] = pair.value;
> +}
> +
>  #endif /* CONFIG_MMU */
>  
>  SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 585d2dcf2dab1ccb..7194aee3bf3234e5 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -375,7 +375,9 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>  static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
>  {
>  	schedule_on_each_cpu(check_vector_unaligned_access);
> -
> +#ifdef CONFIG_MMU
> +	riscv_hwprobe_vdso_sync(RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF);
> +#endif
>  	return 0;
>  }
>  #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> -- 
> 2.49.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
