Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3779C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHWJDpu1me7uZuwIoKPhLozCm1vT2qaU45CjlImgiAY=; b=lAagnG78+LHMUA
	UnkjfvFHUqskzW8bbLAxkasjX2V3Daij90pRIJOHOBgDBDkf1AXjxhxamfxmUOazcFL0qbo8j9QhE
	eiTMec3YKDEn2apJzvwsnCMyAjMWJJe3IVIpZ+T7pa/2nexR+SnD+TQe1hiHtwHhEmYBRIkgxCIOI
	EsBH0U1mhEDlOF2IlwBQYUKqfdalAtZgvQshJVNm9Pa7LeBzjqz+v3Y+sS1VCpjoplBSuXa1rBMiR
	/oPeHC/FEblEkmCbwFGYx15K1nH0+wcXfUuUxsvfkNBXmY10uIsPWVk2ZQiFQipIwVXYAc6d9Yp/r
	x/KiQsTfaCzP0ImjYBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBGm-00000001isJ-3x1E;
	Wed, 31 Jul 2024 15:29:40 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBGR-00000001ikD-1tTg
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 15:29:22 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so6369269a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722439757; x=1723044557; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g9uuBBLaILTnkAH0Kq+8GX0EvclZmCoOgmvXbP97jF4=;
        b=boCxb4F91U5Iivz99x1ia6G0PSEsD7eD0jI1rtv+BdpXNfopadP/nUqx7Xlm2GFFpZ
         FEq9clUJ80kfaH9E0YnhLY0gRAKaZyUEyznOiiF368sW9WVu0h/XmbgGRxnsEOkZ4CVY
         WCLGNjqpvTGUzxMdPzxKjc+QWgEgVMQ7vY7ac51M4aCPm9agqsaWzOJdq+1d4ihIijwD
         4x07b5BaYOs8f3yzDNjND+jNz58QaxfzD0EeW2PooZYxb3CLtHLALejWqwK6SEusLpyR
         W33O7XIlS2ZiP9pwPOI5yWQOSlp96YA8BQA5kL0k4kWuriBqdpaOyUqkdqV33bHEjhE1
         6Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439757; x=1723044557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9uuBBLaILTnkAH0Kq+8GX0EvclZmCoOgmvXbP97jF4=;
        b=YjAVsXOuSuNUD6TKYaDLWrnZU93LWsPtaSfB34De83BN24VE7c+q9Q1NAO2Cqb6/0K
         v47vieyi8PVVwF2dCVlmWlYsFFRTWkh79BOOEzHRpOS8KSIXqyYUXe73Cdj8OiIkz2nN
         NBDzVydaqANMWvCtCZSdkOgoBLbmsmC44zW6UXFa6fWZTFNdfBTMt/kLWdrv3jdtJbpZ
         74lbr0aXgkITDufutfTy4igHj73iDoC6nKkphpNw7u0ox5p1Na1wQx3MM/MpojfOlWBe
         w5PKu9j6JBujOEclZ89McSbpOEgxW+NGllekw6nPeq9XqVMzDAzaoJcINR4tSaFvnFxU
         DBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNm4/yENc9KZCIK/AUbhOhmieqi/roF5mxzRrvU1EHy55fjgJ/ELqRu3kb2RxNPOz6ocNtMzNo36MvczYxThoUiNSJb486LdEPVH79KxbN
X-Gm-Message-State: AOJu0YyDD/Q9K/I5U/PBadUYNS4vhMlOQd5ZlKPLX+wPPS2EZDTVjY2u
	caYBOxO1NZAvDwAC2QN4k0zkIje6Wm3v5mFQpIOggL5ZRe5gpji/UoWSWEA20/4=
X-Google-Smtp-Source: AGHT+IEte2n+yGIHkogjCwY/1gfqjb8AtqYTboqZ9OnBELWSU7Az1fArUpddqPDVmh8s8bzDcHDi9A==
X-Received: by 2002:a05:6402:5205:b0:5a2:37e0:1e88 with SMTP id 4fb4d7f45d1cf-5b0208c2044mr10368950a12.9.1722439756386;
        Wed, 31 Jul 2024 08:29:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac631b0395sm8902682a12.20.2024.07.31.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:29:15 -0700 (PDT)
Date: Wed, 31 Jul 2024 17:29:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
Message-ID: <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-14-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-14-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_082919_637882_D189D7D2 
X-CRM114-Status: GOOD (  42.90  )
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

On Wed, Jul 31, 2024 at 09:24:05AM GMT, Alexandre Ghiti wrote:
> In order to produce a generic kernel, a user can select
> CONFIG_COMBO_SPINLOCKS which will fallback at runtime to the ticket
> spinlock implementation if Zabha or Ziccrse are not present.
> 
> Note that we can't use alternatives here because the discovery of
> extensions is done too late and we need to start with the qspinlock
> implementation because the ticket spinlock implementation would pollute
> the spinlock value, so let's use static keys.
> 
> This is largely based on Guo's work and Leonardo reviews at [1].
> 
> Link: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren@kernel.org/ [1]
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  .../locking/queued-spinlocks/arch-support.txt |  2 +-
>  arch/riscv/Kconfig                            | 29 +++++++++++++
>  arch/riscv/include/asm/Kbuild                 |  4 +-
>  arch/riscv/include/asm/spinlock.h             | 43 +++++++++++++++++++
>  arch/riscv/kernel/setup.c                     | 38 ++++++++++++++++
>  include/asm-generic/qspinlock.h               |  2 +
>  include/asm-generic/ticket_spinlock.h         |  2 +
>  7 files changed, 118 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/include/asm/spinlock.h
> 
> diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
> index 22f2990392ff..cf26042480e2 100644
> --- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
> +++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
> @@ -20,7 +20,7 @@
>      |    openrisc: |  ok  |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: | TODO |
>      |          sh: | TODO |
>      |       sparc: |  ok  |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ef55ab94027e..c9ff8081efc1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -79,6 +79,7 @@ config RISCV
>  	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>  	select ARCH_WANTS_NO_INSTR
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
> +	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS

Why do we need this? Also, we presumably would prefer not to have it
when we end up using ticket spinlocks when combo spinlocks is selected.
Is there no way to avoid it?

>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
>  	select CLINT_TIMER if RISCV_M_MODE
> @@ -488,6 +489,34 @@ config NODES_SHIFT
>  	  Specify the maximum number of NUMA Nodes available on the target
>  	  system.  Increases memory reserved to accommodate various tables.
>  
> +choice
> +	prompt "RISC-V spinlock type"
> +	default RISCV_COMBO_SPINLOCKS
> +
> +config RISCV_TICKET_SPINLOCKS
> +	bool "Using ticket spinlock"
> +
> +config RISCV_QUEUED_SPINLOCKS
> +	bool "Using queued spinlock"
> +	depends on SMP && MMU && NONPORTABLE
> +	select ARCH_USE_QUEUED_SPINLOCKS
> +	help
> +	  The queued spinlock implementation requires the forward progress
> +	  guarantee of cmpxchg()/xchg() atomic operations: CAS with Zabha or
> +	  LR/SC with Ziccrse provide such guarantee.
> +
> +	  Select this if and only if Zabha or Ziccrse is available on your
> +	  platform.

Maybe some text recommending combo spinlocks here? As it stands it sounds
like enabling queued spinlocks is a bad idea for anybody that doesn't know
what platforms will run the kernel they're building, which is all distros.

> +
> +config RISCV_COMBO_SPINLOCKS
> +	bool "Using combo spinlock"
> +	depends on SMP && MMU
> +	select ARCH_USE_QUEUED_SPINLOCKS
> +	help
> +	  Embed both queued spinlock and ticket lock so that the spinlock
> +	  implementation can be chosen at runtime.

nit: Add a blank line here

> +endchoice
> +
>  config RISCV_ALTERNATIVE
>  	bool
>  	depends on !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 5c589770f2a8..1c2618c964f0 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -5,10 +5,12 @@ syscall-y += syscall_table_64.h
>  generic-y += early_ioremap.h
>  generic-y += flat.h
>  generic-y += kvm_para.h
> +generic-y += mcs_spinlock.h
>  generic-y += parport.h
> -generic-y += spinlock.h
>  generic-y += spinlock_types.h
> +generic-y += ticket_spinlock.h
>  generic-y += qrwlock.h
>  generic-y += qrwlock_types.h
> +generic-y += qspinlock.h
>  generic-y += user.h
>  generic-y += vmlinux.lds.h
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> new file mode 100644
> index 000000000000..503aef31db83
> --- /dev/null
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ASM_RISCV_SPINLOCK_H
> +#define __ASM_RISCV_SPINLOCK_H
> +
> +#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
> +#define _Q_PENDING_LOOPS	(1 << 9)
> +
> +#define __no_arch_spinlock_redefine
> +#include <asm/ticket_spinlock.h>
> +#include <asm/qspinlock.h>
> +#include <asm/alternative.h>

We need asm/jump_label.h instead of asm/alternative.h, but...

> +
> +DECLARE_STATIC_KEY_TRUE(qspinlock_key);
> +
> +#define SPINLOCK_BASE_DECLARE(op, type, type_lock)			\
> +static __always_inline type arch_spin_##op(type_lock lock)		\
> +{									\
> +	if (static_branch_unlikely(&qspinlock_key))			\
> +		return queued_spin_##op(lock);				\
> +	return ticket_spin_##op(lock);					\
> +}

...do you know what impact this inlined static key check has on the
kernel size?

Actually, why not use ALTERNATIVE with any nonzero cpufeature value.
Then add code to riscv_cpufeature_patch_check() to return true when
qspinlocks should be enabled (based on the value of some global set
during riscv_spinlock_init)?

> +
> +SPINLOCK_BASE_DECLARE(lock, void, arch_spinlock_t *)
> +SPINLOCK_BASE_DECLARE(unlock, void, arch_spinlock_t *)
> +SPINLOCK_BASE_DECLARE(is_locked, int, arch_spinlock_t *)
> +SPINLOCK_BASE_DECLARE(is_contended, int, arch_spinlock_t *)
> +SPINLOCK_BASE_DECLARE(trylock, bool, arch_spinlock_t *)
> +SPINLOCK_BASE_DECLARE(value_unlocked, int, arch_spinlock_t)
> +
> +#elif defined(CONFIG_RISCV_QUEUED_SPINLOCKS)
> +
> +#include <asm/qspinlock.h>
> +
> +#else
> +
> +#include <asm/ticket_spinlock.h>
> +
> +#endif
> +
> +#include <asm/qrwlock.h>
> +
> +#endif /* __ASM_RISCV_SPINLOCK_H */
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index a2cde65b69e9..b811fa331982 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -244,6 +244,43 @@ static void __init parse_dtb(void)
>  #endif
>  }
>  
> +#if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
> +DEFINE_STATIC_KEY_TRUE(qspinlock_key);
> +EXPORT_SYMBOL(qspinlock_key);
> +#endif
> +
> +static void __init riscv_spinlock_init(void)
> +{
> +	char *using_ext = NULL;
> +
> +	if (IS_ENABLED(CONFIG_RISCV_TICKET_SPINLOCKS)) {
> +		pr_info("Ticket spinlock: enabled\n");
> +		return;
> +	}
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
> +	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&
> +	    riscv_isa_extension_available(NULL, ZABHA) &&
> +	    riscv_isa_extension_available(NULL, ZACAS)) {
> +		using_ext = "using Zabha";
> +	} else if (riscv_isa_extension_available(NULL, ZICCRSE)) {
> +		using_ext = "using Ziccrse";
> +	}
> +#if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
> +	else {

else if (IS_ENABLED(CONFIG_RISCV_COMBO_SPINLOCKS))

> +		static_branch_disable(&qspinlock_key);
> +		pr_info("Ticket spinlock: enabled\n");
> +

nit: remove this blank line

> +		return;
> +	}
> +#endif
> +
> +	if (!using_ext)
> +		pr_err("Queued spinlock without Zabha or Ziccrse");
> +	else
> +		pr_info("Queued spinlock %s: enabled\n", using_ext);
> +}
> +
>  extern void __init init_rt_signal_env(void);
>  
>  void __init setup_arch(char **cmdline_p)
> @@ -297,6 +334,7 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_set_dma_cache_alignment();
>  
>  	riscv_user_isa_enable();
> +	riscv_spinlock_init();
>  }
>  
>  bool arch_cpu_is_hotpluggable(int cpu)
> diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
> index 0655aa5b57b2..bf47cca2c375 100644
> --- a/include/asm-generic/qspinlock.h
> +++ b/include/asm-generic/qspinlock.h
> @@ -136,6 +136,7 @@ static __always_inline bool virt_spin_lock(struct qspinlock *lock)
>  }
>  #endif
>  
> +#ifndef __no_arch_spinlock_redefine

I'm not sure what's better/worse, but instead of inventing this
__no_arch_spinlock_redefine thing we could just name all the functions
something like __arch_spin* and then add defines for both to asm/spinlock.h,
i.e.

#define queued_spin_lock(l) __arch_spin_lock(l)
...

#define ticket_spin_lock(l) __arch_spin_lock(l)
...

Besides not having to touch asm-generic/qspinlock.h and
asm-generic/ticket_spinlock.h it allows one to find the implementations
a bit easier as following a tag to arch_spin_lock() will take them to
queued_spin_lock() which will then take them to
arch/riscv/include/asm/spinlock.h and there they'll figure out how
__arch_spin_lock() was defined.

>  /*
>   * Remapping spinlock architecture specific functions to the corresponding
>   * queued spinlock functions.
> @@ -146,5 +147,6 @@ static __always_inline bool virt_spin_lock(struct qspinlock *lock)
>  #define arch_spin_lock(l)		queued_spin_lock(l)
>  #define arch_spin_trylock(l)		queued_spin_trylock(l)
>  #define arch_spin_unlock(l)		queued_spin_unlock(l)
> +#endif
>  
>  #endif /* __ASM_GENERIC_QSPINLOCK_H */
> diff --git a/include/asm-generic/ticket_spinlock.h b/include/asm-generic/ticket_spinlock.h
> index cfcff22b37b3..325779970d8a 100644
> --- a/include/asm-generic/ticket_spinlock.h
> +++ b/include/asm-generic/ticket_spinlock.h
> @@ -89,6 +89,7 @@ static __always_inline int ticket_spin_is_contended(arch_spinlock_t *lock)
>  	return (s16)((val >> 16) - (val & 0xffff)) > 1;
>  }
>  
> +#ifndef __no_arch_spinlock_redefine
>  /*
>   * Remapping spinlock architecture specific functions to the corresponding
>   * ticket spinlock functions.
> @@ -99,5 +100,6 @@ static __always_inline int ticket_spin_is_contended(arch_spinlock_t *lock)
>  #define arch_spin_lock(l)		ticket_spin_lock(l)
>  #define arch_spin_trylock(l)		ticket_spin_trylock(l)
>  #define arch_spin_unlock(l)		ticket_spin_unlock(l)
> +#endif
>  
>  #endif /* __ASM_GENERIC_TICKET_SPINLOCK_H */
> -- 
> 2.39.2
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
