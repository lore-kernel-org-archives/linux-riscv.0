Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C484DC52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiYOfHa26hDhdWxvgXxy5dbHDWNCJo+pcwDBACB7uMo=; b=X7F1HgnSAXXDZx
	D1ZzDyDTBm3jn9R5JfjZWtWDhC4tkwSPIMHAiZ/lmhcpIWkGIsuAg855s/mZzEewY8sMAP8LUNd0j
	Mle6kO779f5Yvx+hLZl0i7uE7V0zJsNky5+yQ0VmgVtRtbGKFoZE9W1ZJwHHMPOTQH4zGaw4Zeyzz
	M8ng5WcMtttCTrjAeoUBnVxkC4ucTEIbOHYBIj5Y8kSLfwwD3+1cqbBf+3rZVvyfw0hulpcgqkOxF
	Miw/erSMQdVvou2lbhaROgWXJQ8Bex1BcIIm/bzCwYA/AOn2ISLALT/NHm0cCPQpNso+zdIhWDkwM
	hlW9TjVRAtWfBRF6l/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmgj-00000009Nl2-2tTL;
	Wed, 21 Aug 2024 14:51:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmgg-00000009Nk2-0viG
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:51:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5bed83489c3so5662849a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724251908; x=1724856708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/9z45COXiOa8Ur7PNvfAex0dKJEUmq0VNfjSEwtXU3g=;
        b=Dtg0NXetU3hyyFxcSbJOv/x+/1kNQ2cgvafog8sH/JgHkC5ptzN/P3DrWewU3jU33n
         pBpCVfXFwFSIsqTV2LDK2nRxJVfZkFVBqfuG3RYSPGNLTaxcKxh6BCTUh45MaMiZFwKF
         Hv/IS4M0DTE0U8KAA30/w2kADnf5phU3MAoXLY8SRA0tyJmDqWB+9jkTYWjSVBSSe75s
         IeAWF6agdPLKTTbUhTm2YU0lbfnNUvYmn62RlJ7B3h8D70+N2sD0CAs6+fJnML2qiJmQ
         jeqW8e94++BvN5wakwfwtStYNEDqq3MOFZxEjvIhqIW2T/oQ4HRmcyf0ufkkDx/G6Rbh
         GVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724251908; x=1724856708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9z45COXiOa8Ur7PNvfAex0dKJEUmq0VNfjSEwtXU3g=;
        b=llraQyeKmUkLT4AdErOLZA6eZitL5c3s1e06B7JZnfwR5KHOZAM/yWf3zeNHBHQh0F
         H+px1ONu0pkc/mneMZkyLlvGJLs0F55GGRxJiTHwCbQWweor2E/+t0jtPtFPXT2ElKPh
         egh6u+AfqM+xhJWCwusLZ/hL3pCKXTWvUDuaf11NVQL2aD1zBfmNzBEUfTeh/3iV+18y
         wJE1WHosIHOmbrPFyQSQugXWXPulptVbefFKaQtyHX8KKqRWOZBBm4uohsGGUISZ4TCC
         KdvotwSI5A2cNnGVkVGUA9YLLOa8mZu3NbkKGbHlaYGtJP8qcv+9Rpu4cdUB2mL4Juk3
         kPVw==
X-Forwarded-Encrypted: i=1; AJvYcCWd5/sn237iIicVU5nYTjs9a4yH4F2ChV1flF2xo8U1rpUfwCiTGsv9e8FVn9V04HkR6AVUBd3yWN8u1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAY4xFVgN0LU/wfsK9D1XVStDcBXQ2jdfdhM6ilMRcuVZMhsH7
	tZcpVxjRVbOnge9N6M0/HXgDKvWtL/PdmmKf4yTQ76LzdGQyS3KeOZFp7pxrVJs=
X-Google-Smtp-Source: AGHT+IFaIncl/DtJadX96lKhBGv1TThBKGu6LlRSGCmIs0kZEeAJeyIHSe6bPyWgF2jtKC9PjY8pKQ==
X-Received: by 2002:a17:906:c149:b0:a77:dd1c:6273 with SMTP id a640c23a62f3a-a866f136a88mr179111066b.12.1724251907406;
        Wed, 21 Aug 2024 07:51:47 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6ac5sm918850266b.18.2024.08.21.07.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:51:47 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:51:45 +0200
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
Subject: Re: [PATCH v5 13/13] riscv: Add qspinlock support
Message-ID: <20240821-ec1ec92842570050429621d1@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-14-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-14-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_075150_295061_179D2999 
X-CRM114-Status: GOOD (  41.13  )
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

On Sun, Aug 18, 2024 at 08:35:38AM GMT, Alexandre Ghiti wrote:
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
>  arch/riscv/Kconfig                            | 34 ++++++++++++++
>  arch/riscv/include/asm/Kbuild                 |  4 +-
>  arch/riscv/include/asm/spinlock.h             | 47 +++++++++++++++++++
>  arch/riscv/kernel/setup.c                     | 37 +++++++++++++++
>  include/asm-generic/qspinlock.h               |  2 +
>  include/asm-generic/ticket_spinlock.h         |  2 +
>  7 files changed, 126 insertions(+), 2 deletions(-)
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
> index ef55ab94027e..201d0669db7f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -79,6 +79,7 @@ config RISCV
>  	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>  	select ARCH_WANTS_NO_INSTR
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
> +	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS

Hi Alex,

Did you get a chance to experiment this as suggested by Andrea?

>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
>  	select CLINT_TIMER if RISCV_M_MODE
> @@ -488,6 +489,39 @@ config NODES_SHIFT
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
> +	  platform, RISCV_QUEUED_SPINLOCKS must not be selected for platforms
> +	  without one of those extensions.
> +
> +	  If unsure, select RISCV_COMBO_SPINLOCKS, which will use qspinlocks
> +	  when supported and otherwise ticket spinlocks.
> +
> +config RISCV_COMBO_SPINLOCKS
> +	bool "Using combo spinlock"
> +	depends on SMP && MMU
> +	select ARCH_USE_QUEUED_SPINLOCKS
> +	help
> +	  Embed both queued spinlock and ticket lock so that the spinlock
> +	  implementation can be chosen at runtime.
> +
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
> index 000000000000..e5121b89acea
> --- /dev/null
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -0,0 +1,47 @@
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
> +#include <asm/jump_label.h>
> +
> +/*
> + * TODO: Use an alternative instead of a static key when we are able to parse
> + * the extensions string earlier in the boot process.
> + */
> +DECLARE_STATIC_KEY_TRUE(qspinlock_key);
> +
> +#define SPINLOCK_BASE_DECLARE(op, type, type_lock)			\
> +static __always_inline type arch_spin_##op(type_lock lock)		\
> +{									\
> +	if (static_branch_unlikely(&qspinlock_key))			\
> +		return queued_spin_##op(lock);				\
> +	return ticket_spin_##op(lock);					\
> +}

I guess there were still a couple questions on the kernel size impact of
this.

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
> index a2cde65b69e9..438e4f6ad2ad 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -244,6 +244,42 @@ static void __init parse_dtb(void)
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
> +		static_branch_disable(&qspinlock_key);
> +		pr_info("Ticket spinlock: enabled\n");
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
> @@ -297,6 +333,7 @@ void __init setup_arch(char **cmdline_p)
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
 
The patch looks good to me, so

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

It'd still be good to hear more about ARCH_WEAK_RELEASE_ACQUIRE and the
kernel size though.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
