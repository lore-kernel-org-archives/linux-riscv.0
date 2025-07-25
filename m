Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24848C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICRBFzpNwxx74ZRipwZHjrFjlIhsKioLRySjCEMEfeg=; b=lC/lay/uWS0y27
	15iee6rBqlB5LJicHVRnmjDTRW28W7rTo1IgT6nC76N2fqueutfkY9Q0rbLb7iB+aEiHrB8l6ulOz
	MS0rZbmHAB+6gVaq0toqNtKuJlhqn/RojNshsPxXJsYfVlUwH8lQ8BGhaPijcDxkVheEP8iJN3sF2
	A2Owtj+egtdhRrdzvUcgPUBZeKM5l4Gwxx6EJynE/tBF2vnJLvKrlMQSpdLZvmvgHTnerIB2HyoTv
	y1llVx0Z0gicBNVjRJThT9xteA4LDdsTDxeIs/lKFX+ztEgO97xmP64pmeKItj0kkeFdQ8Lqr49t6
	a4lQgRYH4uHzRXqns6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL7C-0000000ACJH-2R1t;
	Fri, 25 Jul 2025 16:17:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL3A-0000000ABYX-1Qmo
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:13:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-235e389599fso232095ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753460015; x=1754064815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbMA4/IPXQaEHQepmsbHPY7QV6shrVDJW0bf+hd1ByM=;
        b=NGpYh5A3xdIqIIfJlbjHP6Xpv33UIjOwPnatboVFTxzlRZFCrvSr/UgUShL79smF7V
         nDATjJSbBFAQ718Y9/Pkj74cjk3tHcYtS2QxgP/FNe3xn9azQthLIddMOXTEhdCd/Jqe
         Sc4R7I3qDwz5WmRVExPWNjHRggIu9qwS1Ps9ZIZTF063xktgG/JAcMz8grcKNct5MYkk
         pR5+xSDr74TgryX+6d+wztTM8RutHerAJaa+kMOUMG5DT9fMstbwt3OW/PjYzO99Z3Ag
         7tQRWT159RZc0fVqJlpXqT5CTPOmG/9oYCnvcKMhkHdb4uMs5j5SLFtVNG0Tr87TvW8P
         xoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460015; x=1754064815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbMA4/IPXQaEHQepmsbHPY7QV6shrVDJW0bf+hd1ByM=;
        b=dMj4O7RHLF2DAmGoG7r+mEm/iIC8R/7I2mcfJkI7ji2n0X/O3zd87WXnYyRDcniCa1
         7pZbZIWr75bUnb3FEw/HdRqnr4euUdmAvmaI6A8AMw3ARVi7IXXDtaUd4hpPW0TuyCrM
         P98jsy3HMGZcIn/iQxjrwG7DT4sFl/+SJ7sqOLNvSB7H5pjrQVSjgpM7ORhJ/d60Uslm
         E9ofCE15y/2dw515jTMEmvYG8JaCUfXUF+fdvtVumTbbr7FYZlneilkLFRH9pRzQE5Lh
         cEIMfqCpRm49qytE4h/lWJSrcO0370X0Ar/Ij7pv1M5BgghPTpWZYmYXkL1zCfAtq8s7
         PC0g==
X-Forwarded-Encrypted: i=1; AJvYcCWeWkte5wXJNVy0WIuVCP1SL+Vzvvd/6xZwc+sIORt5gr1A7Dubmq97osNYtfaRaFCRa+CmLAhLZvesfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIrxpolz51B5hx110GwWNa8GJGw+WtKkSxsDbku0Zl+5LKMAjy
	B0KDkQMada/XEkCbfoWs5+crKGc/J7z4sY2ahi1898ztwg1Ae6r2MK5Me17s1/pyew==
X-Gm-Gg: ASbGnctHFfLBWIUb+ZC362daqeaCwpwDvFXJE8vPOV0OSJa4MGEtAwI+K4zkuXbPjbi
	5qS+pEXXuxlIqq/7LgA+XoEIMqza0HWroX9ydJSc6J21mFPHqkvzi1Rtu+oD4yMo1c1qNrazYuB
	5YQoCbuvmfKo2ivz3r71M4xCsEmL+kuPPz7lVwmbkixMY3al3eipjdo86iAUmm2A++Mcz47XTkJ
	8koizpLqqd8PKc5l7+A9Ku4G8RwncPI5HtvdFX82CarSuKNw7rrQO9fJ7JQilqz8makGQt/9QwT
	cKkuvwN5EstiWyc39gib8ptgyVKNTyWUPDxmMoWhq4EGJGbLoDG4ZBVeQSk9Txp53GdqzLG2Jyw
	OUKIoGAOn+bNyD1UI2YIlP4zMidB/USQm9rhbrYVDRRccprrEG9MVzDasV0ZkPFP9Mg==
X-Google-Smtp-Source: AGHT+IGq4HV4wynITvP6Q3jQAvqNu8aZGXk3r1rzEnuZDeWdHk39Doexv2T5tkYjqpbpWqlrXy/lSA==
X-Received: by 2002:a17:902:e947:b0:234:b2bf:e67e with SMTP id d9443c01a7336-23fb0309a88mr3165975ad.13.1753460015047;
        Fri, 25 Jul 2025 09:13:35 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fc7a4sm619335ad.120.2025.07.25.09.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:13:34 -0700 (PDT)
Date: Fri, 25 Jul 2025 16:13:27 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>, Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <20250725161327.GC1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_091336_403082_C17B4956 
X-CRM114-Status: GOOD (  31.78  )
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

On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
> If shadow stack have memory protections from underlying cpu, use those
> protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
> stack pages. Hw assisted shadow stack pages grow downwards like regular
> stack. Clang based software shadow call stack grows low to high address.

Is this the case for all the current hardware shadow stack
implementations? If not, we might want a separate config for the
shadow stack direction instead.

> Thus this patch addresses some of those needs due to opposite direction
> of shadow stack. Furthermore, hw shadow stack can't be memset because memset
> uses normal stores. Lastly to store magic word at base of shadow stack, arch
> specific shadow stack store has to be performed.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  include/linux/scs.h | 26 +++++++++++++++++++++++++-
>  kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/scs.h b/include/linux/scs.h
> index 4ab5bdc898cf..6ceee07c2d1a 100644
> --- a/include/linux/scs.h
> +++ b/include/linux/scs.h
> @@ -12,6 +12,7 @@
>  #include <linux/poison.h>
>  #include <linux/sched.h>
>  #include <linux/sizes.h>
> +#include <asm/scs.h>
>  
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  
> @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>  	 * Reset the shadow stack to the base address in case the task
>  	 * is reused.
>  	 */
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
> +#else
>  	task_scs_sp(tsk) = task_scs(tsk);
> +#endif
>  }
>
>  static inline unsigned long *__scs_magic(void *s)
>  {
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	return (unsigned long *)(s);
> +#else
>  	return (unsigned long *)(s + SCS_SIZE) - 1;
> +#endif
>  }
>  
>  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>  {
>  	unsigned long *magic = __scs_magic(task_scs(tsk));
> -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
> +	unsigned long sz;
> +
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
> +#else
> +	sz = task_scs_sp(tsk) - task_scs(tsk);
> +#endif
>  
>  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>  }
>  
> +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
> +{
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	arch_scs_store(s, magic_val);
> +#else
> +	*__scs_magic(s) = magic_val;
> +#endif
> +}
> +

I'm not a huge fan of all the ifdefs. We could clean this up by
allowing architectures to simply override some these functions, or at
least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
this?

>  DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>  
>  static inline bool scs_is_dynamic(void)
> diff --git a/kernel/scs.c b/kernel/scs.c
> index d7809affe740..5910c0a8eabd 100644
> --- a/kernel/scs.c
> +++ b/kernel/scs.c
> @@ -11,6 +11,7 @@
>  #include <linux/scs.h>
>  #include <linux/vmalloc.h>
>  #include <linux/vmstat.h>
> +#include <asm-generic/set_memory.h>
>  
>  #ifdef CONFIG_DYNAMIC_SCS
>  DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
> @@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
>  {
>  	int i;
>  	void *s;
> +	pgprot_t prot = PAGE_KERNEL;
> +
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	prot = PAGE_KERNEL_SHADOWSTACK;
> +#endif

I would rather define the shadow stack protection flags in the header
file and allow them to be overridden in asm/scs.h.

>  	for (i = 0; i < NR_CACHED_SCS; i++) {
>  		s = this_cpu_xchg(scs_cache[i], NULL);
>  		if (s) {
>  			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
>  						   KASAN_VMALLOC_PROT_NORMAL);
> +/*
> + * If software shadow stack, its safe to memset. Else memset is not
> + * possible on hw protected shadow stack. memset constitutes stores and
> + * stores to shadow stack memory are disallowed and will fault.
> + */
> +#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>  			memset(s, 0, SCS_SIZE);
> +#endif

This could also be moved to a static inline function that
architectures can override if they have hardware shadow stacks that
cannot be cleared at this point.

>  			goto out;
>  		}
>  	}
>  
>  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
> -				    GFP_SCS, PAGE_KERNEL, 0, node,
> +				    GFP_SCS, prot, 0, node,
>  				    __builtin_return_address(0));
>  
>  out:
> @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>  	if (!s)
>  		return NULL;
>  
> -	*__scs_magic(s) = SCS_END_MAGIC;
> +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>  
>  	/*
>  	 * Poison the allocation to catch unintentional accesses to
> @@ -87,6 +100,16 @@ void scs_free(void *s)
>  			return;
>  
>  	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
> +	/*
> +	 * Hardware protected shadow stack is not writeable by regular stores
> +	 * Thus adding this back to free list will raise faults by vmalloc
> +	 * It needs to be writeable again. It's good sanity as well because
> +	 * then it can't be inadvertently accesses and if done, it will fault.
> +	 */
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
> +#endif

Another candidate for an arch-specific function to reduce the number
of ifdefs in the generic code.

Sami

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
