Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7983EC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T48/cgl7HHYtmhfFDr/0as3jc9dpkt7uS9sK984s3kI=; b=PFah/V2fOEGe4s
	JkJGE7EnyeobWWwEbMnP71ijMS2BK6DxE8g4a/P024oM5hbNUXBmNc9aLjtfxVYkxENVj6EOv4ms/
	HW6cfK3n7JsQDvepA5EoQwS7b+FgvA+ssa6SvY2KRnV86rSRgCOpfsJk3E5XML0pVTbm1rKNetOyg
	smAWNEqAqxrf2otjxaNZboglTrF2nPBfConN64H0jstMv98E/bTZbAs5atoMV8FkucSbo8ObuO+/6
	xqs7FWRg/zv1zn8f0MigWzWQaOgVBEF9qCiwZkjnmBnGKC09ZPxszKRzG/eTAhEk2j5JubbDdRu7X
	xHd0aLr90gkxSGfNDDQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOIj8-00000003tU2-3ZVu;
	Mon, 01 Jul 2024 15:13:58 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOIj5-00000003tSo-08WK
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 15:13:57 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-378d954e505so11846175ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719846834; x=1720451634; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdlYna21mfTMWUTr17RbNLs/+Rxw0E+v4uLW3lEJDTY=;
        b=N3P976pk2OkFVmfzzF/4OdC6ag/xCyS00RJ1dzU7U1vP6CRUnM0nroX46k/pOc78VV
         9zbSE0BSOfXwCJMwvyydxx8ncHFMnLqDYbOX6myzzrcYibLacPo5BTmCmNOUo//G9aCu
         6wlVI1Kr0fw/iH9kVPR9fIbe2YvyMBNHbw5j+CumSlWntO0ZQvBVaKvgbgdUSeKzLEW4
         0UxEsz4UkoZoU5Ydxu93Z1HxfRT7JIVVGAEw8C7muIHEEM0pXBRt+tEOIlXWa3K93m4T
         ChxMxBeimOSHhrAKD581hiX8S7g8qWZ/QRhnr43u//w37wxZiDfCS/7Pc0U6NVFdCTiU
         yZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719846834; x=1720451634;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdlYna21mfTMWUTr17RbNLs/+Rxw0E+v4uLW3lEJDTY=;
        b=L4TvJXAm9AwCnOSyyvrEhSV84ai/yiWNk9jFBzgbTiFlXRVkd5B3STgXh91pCiCfkI
         NNNtsJ3lZWqmQTRjkEml69igKh3/eF371NTS8fNKyCZLAAJNe83XtEmo1Ty9XwhX5QW1
         BHIFFyZQBhvlnbC8AScGH/tqOV7eI/GviWEo2pfc9RCgiMAEepnNDNhXwftkZ1WaSczL
         fUIDiOhHXQpUk/ery9/zNO3JNe5SWor0nG2tnQFN1Wdi/YsQFBKTzQBZzD8d0YKbgdLB
         L7bZQVQVjcHCd+yTkwiL5lZww5qtJrdTD1hYavumo3yGCOBwZKJcMjOjxhRu8+LJHC79
         tZVg==
X-Forwarded-Encrypted: i=1; AJvYcCV7knqyDLBRAz88cqCqyrRdhy8Xw5dILW6Q6HpElMxN06dgw3Q6zxvbatPtxwVJdNmqPIqB1zQs2m0QMJjQpiB+FCSVCBzLFEuJPg5E8YxQ
X-Gm-Message-State: AOJu0YzHYzjO0e/gv1iw6YsJ5V12WAfEImn4sI201ZpPChTe3kx6k7oD
	Kr12/KVwD2HgufxHiOn8CkQRKE1m1b73AU3hfep5MLgaANi5N2ZYuEEog0Flss8=
X-Google-Smtp-Source: AGHT+IG2LEJBd8JPWcoRaUn0j0oZYGN9rVJ4rCzlNxSPtRcLCAiwIU7nt3Q1UdnZDR0nCbvGg3/B4A==
X-Received: by 2002:a05:6e02:1a26:b0:375:873a:aa99 with SMTP id e9e14a558f8ab-37cd31b6d36mr81916185ab.25.1719846833763;
        Mon, 01 Jul 2024 08:13:53 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-37ad4370c90sm19136545ab.69.2024.07.01.08.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 08:13:53 -0700 (PDT)
Message-ID: <ccb669ad-be56-4dbd-ad9c-851a94b933eb@sifive.com>
Date: Mon, 1 Jul 2024 10:13:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] RISC-V: Detect unaligned vector accesses supported
To: Jesse Taube <jesse@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>,
 Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-7-jesse@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240625005001.37901-7-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_081355_117946_3D1B72B6 
X-CRM114-Status: GOOD (  27.90  )
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

Hi Jesse,

On 2024-06-24 7:49 PM, Jesse Taube wrote:
> Run a unaligned vector access to test if the system supports
> vector unaligned access. Add the result to a new key in hwprobe.
> This is useful for usermode to know if vector misaligned accesses are
> supported and if they are faster or slower than equivalent byte accesses.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> V1 -> V2:

You are missing the "---" here, so the changelog is leaking into the commit message.

>  - Add Kconfig options
>  - Add insn_is_vector
>  - Add handle_vector_misaligned_load
>  - Fix build
>  - Seperate vector from scalar misaligned access
>  - This patch was almost completely rewritten
> V2 -> V3:
>  - Fixed CONFIG_ in Kconfig
>  - Fixed check_vector_unaligned_access_emulated leaving
>      vector_misaligned_access as unknown.
>  - Remove local_irq_enable
>  - Remove RISCV_DETECT_VECTOR_UNALIGNED_ACCESS
>  - Remove RISCV_VEC_UNALIGNED_ACCESS_UNSUPPORTED
> ---
>  arch/riscv/Kconfig                         |  35 ++++++
>  arch/riscv/include/asm/cpufeature.h        |   5 +
>  arch/riscv/include/asm/entry-common.h      |  11 --
>  arch/riscv/include/asm/hwprobe.h           |   2 +-
>  arch/riscv/include/asm/vector.h            |   1 +
>  arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
>  arch/riscv/kernel/Makefile                 |   4 +-
>  arch/riscv/kernel/sys_hwprobe.c            |  35 ++++++
>  arch/riscv/kernel/traps_misaligned.c       | 120 ++++++++++++++++++++-
>  arch/riscv/kernel/unaligned_access_speed.c |   9 +-
>  arch/riscv/kernel/vector.c                 |   2 +-
>  11 files changed, 209 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 34d24242e37a..ffbe0fdd7fb3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -717,12 +717,26 @@ config THREAD_SIZE_ORDER
>  	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
>  	  affects irq stack size, which is equal to thread stack size.
>  
> +config RISCV_MISALIGNED
> +	bool
> +	help
> +	  Embed support for detecting and emulating misaligned
> +	  scalar or vector loads and stores.
> +
>  config RISCV_SCALAR_MISALIGNED
>  	bool
> +	select RISCV_MISALIGNED
>  	select SYSCTL_ARCH_UNALIGN_ALLOW
>  	help
>  	  Embed support for emulating misaligned loads and stores.
>  
> +config RISCV_VECTOR_MISALIGNED
> +	bool
> +	select RISCV_MISALIGNED
> +	depends on RISCV_ISA_V
> +	help
> +	  Enable detecting support for vector misaligned loads and stores.
> +
>  choice
>  	prompt "Unaligned Accesses Support"
>  	default RISCV_PROBE_UNALIGNED_ACCESS
> @@ -774,6 +788,27 @@ config RISCV_EFFICIENT_UNALIGNED_ACCESS
>  
>  endchoice
>  
> +choice
> +	prompt "Vector unaligned Accesses Support"
> +	depends on RISCV_ISA_V
> +	default RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> +	help
> +	  This determines the level of support for vector unaligned accesses. This
> +	  information is used by the kernel to perform optimizations. It is also
> +	  exposed to user space via the hwprobe syscall. The hardware will be
> +	  probed at boot by default.
> +
> +config RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> +	bool "Probe speed of vector unaligned accesses"
> +	select RISCV_VECTOR_MISALIGNED
> +	help
> +	  During boot, the kernel will run a series of tests to determine the
> +	  speed of vector unaligned accesses if they are supported. This probing
> +	  will dynamically determine the speed of vector unaligned accesses on
> +	  the underlying system if they are supported.
> +
> +endchoice
> +
>  endmenu # "Platform type"
>  
>  menu "Kernel features"
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 0ed7d99c14dd..f25f56f9bfaa 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -45,6 +45,11 @@ static inline bool unaligned_ctl_available(void)
>  }
>  #endif
>  
> +bool check_vector_unaligned_access_emulated_all_cpus(void);
> +#if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
> +DECLARE_PER_CPU(long, vector_misaligned_access);
> +#endif
> +
>  #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
>  DECLARE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
>  
> diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
> index 0a4e3544c877..7b32d2b08bb6 100644
> --- a/arch/riscv/include/asm/entry-common.h
> +++ b/arch/riscv/include/asm/entry-common.h
> @@ -25,18 +25,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>  void handle_page_fault(struct pt_regs *regs);
>  void handle_break(struct pt_regs *regs);
>  
> -#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  int handle_misaligned_load(struct pt_regs *regs);
>  int handle_misaligned_store(struct pt_regs *regs);
> -#else
> -static inline int handle_misaligned_load(struct pt_regs *regs)
> -{
> -	return -1;
> -}
> -static inline int handle_misaligned_store(struct pt_regs *regs)
> -{
> -	return -1;
> -}
> -#endif
>  
>  #endif /* _ASM_RISCV_ENTRY_COMMON_H */
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 150a9877b0af..ef01c182af2b 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 7
> +#define RISCV_HWPROBE_MAX_KEY 8
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index be7d309cca8a..99b0f91db9ee 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -21,6 +21,7 @@
>  
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
> +bool insn_is_vector(u32 insn_buf);
>  bool riscv_v_first_use_handler(struct pt_regs *regs);
>  void kernel_vector_begin(void);
>  void kernel_vector_end(void);
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 023b7771d1b7..2fee870e41bb 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -75,6 +75,11 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  #define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
> +#define RISCV_HWPROBE_KEY_VEC_MISALIGNED_PERF	8
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN		0
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_SLOW		2
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_FAST		3
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED	4

We are spelling out "SCALAR" in the fixes series here[1], so for consistency we
should spell out "VECTOR" as well.

Regards,
Samuel

[1]: https://lore.kernel.org/linux-riscv/20240627172238.2460840-2-evan@rivosinc.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
