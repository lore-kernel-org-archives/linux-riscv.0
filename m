Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF137C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suy6bTmMwQx7ImEeOzfPYoWCP7EeGCkveQYs+rPhd9g=; b=WcobCawC1vmEMC
	R9uty2Xwx9LzIHxKsdN89UKfznRx3twdjz75oxn3uOGCA3dgeLSmDNt5DGl9A+e4dQ7Mvkjxj2/tf
	FmY6CUuY9P3LBXFN5IK6TuXz2NJ+SI3YgvtTCUajjf53Eqy2K9vJ39QHD+snj7njirVI34kj1+//W
	HRfEWiWbCPh5IFouK61wEOzc9leS1khgZ8Em43PVYXi9S3bQMDZu9FR70o2fUy7porIppFwoQ7LvY
	DxwlpD+KwPo6p46T1KP4bABI+NYlwSP9d27mQfs/RWov7fPnA44ir0hWZDxsfxCMQYjy5KWHbxQJV
	KOF5nOus92K3i71WNfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFfY-00000007RNL-1uVv;
	Wed, 14 Aug 2024 15:12:12 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFdZ-00000007R11-2az2
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 15:10:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 069D6E000B;
	Wed, 14 Aug 2024 15:10:02 +0000 (UTC)
Message-ID: <35e8386f-854a-48d5-8c03-7a53f8ca3292@ghiti.fr>
Date: Wed, 14 Aug 2024 17:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] riscv: Add support for the tagged address ABI
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
 Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
 <20240814081437.956855-6-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240814081437.956855-6-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_081010_006368_FF63DE27 
X-CRM114-Status: GOOD (  38.86  )
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

On 14/08/2024 10:13, Samuel Holland wrote:
> When pointer masking is enabled for userspace, the kernel can accept
> tagged pointers as arguments to some system calls. Allow this by
> untagging the pointers in access_ok() and the uaccess routines. The
> uaccess routines must peform untagging in software because U-mode and
> S-mode have entirely separate pointer masking configurations. In fact,
> hardware may not even implement pointer masking for S-mode.
>
> Since the number of tag bits is variable, untagged_addr_remote() needs
> to know what PMLEN to use for the remote mm. Therefore, the pointer
> masking mode must be the same for all threads sharing an mm. Enforce
> this with a lock flag in the mm context, as x86 does for LAM. The flag
> gets reset in init_new_context() during fork(), as the new mm is no
> longer multithreaded.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v3:
>   - Use IS_ENABLED instead of #ifdef when possible
>   - Implement mm_untag_mask()
>   - Remove pmlen from struct thread_info (now only in mm_context_t)
>
> Changes in v2:
>   - Implement untagged_addr_remote()
>   - Restrict PMLEN changes once a process is multithreaded
>
>   arch/riscv/include/asm/mmu.h         |  7 +++
>   arch/riscv/include/asm/mmu_context.h | 13 +++++
>   arch/riscv/include/asm/uaccess.h     | 58 ++++++++++++++++++++--
>   arch/riscv/kernel/process.c          | 73 ++++++++++++++++++++++++++--
>   4 files changed, 141 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index c9e03e9da3dc..1cc90465d75b 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -25,9 +25,16 @@ typedef struct {
>   #ifdef CONFIG_BINFMT_ELF_FDPIC
>   	unsigned long exec_fdpic_loadmap;
>   	unsigned long interp_fdpic_loadmap;
> +#endif
> +	unsigned long flags;
> +#ifdef CONFIG_RISCV_ISA_SUPM
> +	u8 pmlen;
>   #endif
>   } mm_context_t;
>   
> +/* Lock the pointer masking mode because this mm is multithreaded */
> +#define MM_CONTEXT_LOCK_PMLEN	0
> +
>   #define cntx2asid(cntx)		((cntx) & SATP_ASID_MASK)
>   #define cntx2version(cntx)	((cntx) & ~SATP_ASID_MASK)
>   
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index 7030837adc1a..8c4bc49a3a0f 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -20,6 +20,9 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>   static inline void activate_mm(struct mm_struct *prev,
>   			       struct mm_struct *next)
>   {
> +#ifdef CONFIG_RISCV_ISA_SUPM
> +	next->context.pmlen = 0;
> +#endif
>   	switch_mm(prev, next, NULL);
>   }
>   
> @@ -30,11 +33,21 @@ static inline int init_new_context(struct task_struct *tsk,
>   #ifdef CONFIG_MMU
>   	atomic_long_set(&mm->context.id, 0);
>   #endif
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
> +		clear_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags);
>   	return 0;
>   }
>   
>   DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
>   
> +#ifdef CONFIG_RISCV_ISA_SUPM
> +#define mm_untag_mask mm_untag_mask
> +static inline unsigned long mm_untag_mask(struct mm_struct *mm)
> +{
> +	return -1UL >> mm->context.pmlen;
> +}
> +#endif
> +
>   #include <asm-generic/mmu_context.h>
>   
>   #endif /* _ASM_RISCV_MMU_CONTEXT_H */
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 72ec1d9bd3f3..6416559232a2 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -9,8 +9,56 @@
>   #define _ASM_RISCV_UACCESS_H
>   
>   #include <asm/asm-extable.h>
> +#include <asm/cpufeature.h>
>   #include <asm/pgtable.h>		/* for TASK_SIZE */
>   
> +#ifdef CONFIG_RISCV_ISA_SUPM
> +static inline unsigned long __untagged_addr(unsigned long addr)
> +{
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM)) {
> +		u8 pmlen = current->mm->context.pmlen;
> +
> +		/* Virtual addresses are sign-extended; physical addresses are zero-extended. */
> +		if (IS_ENABLED(CONFIG_MMU))
> +			return (long)(addr << pmlen) >> pmlen;
> +		else
> +			return (addr << pmlen) >> pmlen;
> +	}
> +
> +	return addr;
> +}
> +
> +#define untagged_addr(addr) ({						\
> +	unsigned long __addr = (__force unsigned long)(addr);		\
> +	(__force __typeof__(addr))__untagged_addr(__addr);		\
> +})
> +
> +static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigned long addr)
> +{
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM)) {
> +		u8 pmlen = mm->context.pmlen;
> +
> +		/* Virtual addresses are sign-extended; physical addresses are zero-extended. */
> +		if (IS_ENABLED(CONFIG_MMU))
> +			return (long)(addr << pmlen) >> pmlen;
> +		else
> +			return (addr << pmlen) >> pmlen;
> +	}
> +
> +	return addr;
> +}


I should have mentioned that in v2: now that you removed the thread_info 
pmlen field, __untagged_addr_remote() and __untagged_addr() are almost 
the same, can you merge them?

Thanks!

Alex


> +
> +#define untagged_addr_remote(mm, addr) ({				\
> +	unsigned long __addr = (__force unsigned long)(addr);		\
> +	mmap_assert_locked(mm);						\
> +	(__force __typeof__(addr))__untagged_addr_remote(mm, __addr);	\
> +})
> +
> +#define access_ok(addr, size) likely(__access_ok(untagged_addr(addr), size))
> +#else
> +#define untagged_addr(addr) (addr)
> +#endif
> +
>   /*
>    * User space memory access functions
>    */
> @@ -130,7 +178,7 @@ do {								\
>    */
>   #define __get_user(x, ptr)					\
>   ({								\
> -	const __typeof__(*(ptr)) __user *__gu_ptr = (ptr);	\
> +	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
>   	long __gu_err = 0;					\
>   								\
>   	__chk_user_ptr(__gu_ptr);				\
> @@ -246,7 +294,7 @@ do {								\
>    */
>   #define __put_user(x, ptr)					\
>   ({								\
> -	__typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
> +	__typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
>   	__typeof__(*__gu_ptr) __val = (x);			\
>   	long __pu_err = 0;					\
>   								\
> @@ -293,13 +341,13 @@ unsigned long __must_check __asm_copy_from_user(void *to,
>   static inline unsigned long
>   raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>   {
> -	return __asm_copy_from_user(to, from, n);
> +	return __asm_copy_from_user(to, untagged_addr(from), n);
>   }
>   
>   static inline unsigned long
>   raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>   {
> -	return __asm_copy_to_user(to, from, n);
> +	return __asm_copy_to_user(untagged_addr(to), from, n);
>   }
>   
>   extern long strncpy_from_user(char *dest, const char __user *src, long count);
> @@ -314,7 +362,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>   {
>   	might_fault();
>   	return access_ok(to, n) ?
> -		__clear_user(to, n) : n;
> +		__clear_user(untagged_addr(to), n) : n;
>   }
>   
>   #define __get_kernel_nofault(dst, src, type, err_label)			\
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 1280a7c4a412..f4d8e5c3bb84 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -203,6 +203,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>   	unsigned long tls = args->tls;
>   	struct pt_regs *childregs = task_pt_regs(p);
>   
> +	/* Ensure all threads in this mm have the same pointer masking mode. */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM) && p->mm && (clone_flags & CLONE_VM))
> +		set_bit(MM_CONTEXT_LOCK_PMLEN, &p->mm->context.flags);
> +
>   	memset(&p->thread.s, 0, sizeof(p->thread.s));
>   
>   	/* p->thread holds context to be restored by __switch_to() */
> @@ -248,10 +252,16 @@ enum {
>   static bool have_user_pmlen_7;
>   static bool have_user_pmlen_16;
>   
> +/*
> + * Control the relaxed ABI allowing tagged user addresses into the kernel.
> + */
> +static unsigned int tagged_addr_disabled;
> +
>   long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
>   {
> -	unsigned long valid_mask = PR_PMLEN_MASK;
> +	unsigned long valid_mask = PR_PMLEN_MASK | PR_TAGGED_ADDR_ENABLE;
>   	struct thread_info *ti = task_thread_info(task);
> +	struct mm_struct *mm = task->mm;
>   	unsigned long pmm;
>   	u8 pmlen;
>   
> @@ -266,16 +276,41 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
>   	 * in case choosing a larger PMLEN has a performance impact.
>   	 */
>   	pmlen = FIELD_GET(PR_PMLEN_MASK, arg);
> -	if (pmlen == PMLEN_0)
> +	if (pmlen == PMLEN_0) {
>   		pmm = ENVCFG_PMM_PMLEN_0;
> -	else if (pmlen <= PMLEN_7 && have_user_pmlen_7)
> +	} else if (pmlen <= PMLEN_7 && have_user_pmlen_7) {
> +		pmlen = PMLEN_7;
>   		pmm = ENVCFG_PMM_PMLEN_7;
> -	else if (pmlen <= PMLEN_16 && have_user_pmlen_16)
> +	} else if (pmlen <= PMLEN_16 && have_user_pmlen_16) {
> +		pmlen = PMLEN_16;
>   		pmm = ENVCFG_PMM_PMLEN_16;
> -	else
> +	} else {
>   		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Do not allow the enabling of the tagged address ABI if globally
> +	 * disabled via sysctl abi.tagged_addr_disabled, if pointer masking
> +	 * is disabled for userspace.
> +	 */
> +	if (arg & PR_TAGGED_ADDR_ENABLE && (tagged_addr_disabled || !pmlen))
> +		return -EINVAL;
> +
> +	if (!(arg & PR_TAGGED_ADDR_ENABLE))
> +		pmlen = PMLEN_0;
> +
> +	if (mmap_write_lock_killable(mm))
> +		return -EINTR;
> +
> +	if (test_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags) && mm->context.pmlen != pmlen) {
> +		mmap_write_unlock(mm);
> +		return -EBUSY;
> +	}
>   
>   	envcfg_update_bits(task, ENVCFG_PMM, pmm);
> +	mm->context.pmlen = pmlen;
> +
> +	mmap_write_unlock(mm);
>   
>   	return 0;
>   }
> @@ -288,6 +323,10 @@ long get_tagged_addr_ctrl(struct task_struct *task)
>   	if (is_compat_thread(ti))
>   		return -EINVAL;
>   
> +	/*
> +	 * The mm context's pmlen is set only when the tagged address ABI is
> +	 * enabled, so the effective PMLEN must be extracted from envcfg.PMM.
> +	 */
>   	switch (task->thread.envcfg & ENVCFG_PMM) {
>   	case ENVCFG_PMM_PMLEN_7:
>   		ret = FIELD_PREP(PR_PMLEN_MASK, PMLEN_7);
> @@ -297,6 +336,9 @@ long get_tagged_addr_ctrl(struct task_struct *task)
>   		break;
>   	}
>   
> +	if (task->mm->context.pmlen)
> +		ret |= PR_TAGGED_ADDR_ENABLE;
> +
>   	return ret;
>   }
>   
> @@ -306,6 +348,24 @@ static bool try_to_set_pmm(unsigned long value)
>   	return (csr_read_clear(CSR_ENVCFG, ENVCFG_PMM) & ENVCFG_PMM) == value;
>   }
>   
> +/*
> + * Global sysctl to disable the tagged user addresses support. This control
> + * only prevents the tagged address ABI enabling via prctl() and does not
> + * disable it for tasks that already opted in to the relaxed ABI.
> + */
> +
> +static struct ctl_table tagged_addr_sysctl_table[] = {
> +	{
> +		.procname	= "tagged_addr_disabled",
> +		.mode		= 0644,
> +		.data		= &tagged_addr_disabled,
> +		.maxlen		= sizeof(int),
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ZERO,
> +		.extra2		= SYSCTL_ONE,
> +	},
> +};
> +
>   static int __init tagged_addr_init(void)
>   {
>   	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
> @@ -319,6 +379,9 @@ static int __init tagged_addr_init(void)
>   	have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
>   	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
>   
> +	if (!register_sysctl("abi", tagged_addr_sysctl_table))
> +		return -EINVAL;
> +
>   	return 0;
>   }
>   core_initcall(tagged_addr_init);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
