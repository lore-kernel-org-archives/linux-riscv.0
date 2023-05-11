Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C297C7EE22
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tDykYL8JnG6rfv/JulF2IfzPcPqzF+RHbKArzGXI8KM=; b=bX2zh6Hf36Rm2jYNSmrOUIWJbz
	FwUvCXjZOVmPua/nyvLfc4EvSZVp472JYYMC7SUCqCch9D+eMR+mO2Hjouy5E+suk+KVB60HaoEVn
	MIVVRtfqaGd1P+Autc2208e+RHn8+X9GdODAQXRtfIXfyumbTTYpyvd4kfb0DC3sVWbvR2GTaNs8j
	5SYIJMiuhIdG8vAmBdPaBQhk/mKmVxVSoxKWW4AiPV99g81mJPe9y6cwylmtrsUAAOcm8KO/b49ce
	Fph7FsWJYhpUEOYQjcCnfvlmKgaGBckCQVOOI3TmLknDwoGJ6LTSgSlmadWBAzXkMrv6dQXL65zfx
	6owYGOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxGDl-00AQYP-0O;
	Fri, 12 May 2023 00:01:17 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFDI-00AGek-0h
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:56:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-24de9c66559so6478624a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683845803; x=1686437803;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohtAJQb6F6cDbIKk8yio8KQrKCUz3Fn39/AMo90V9pM=;
        b=cJ/DbkFWlbEVmDWOjgOvl3TCwwi3YZ7PgmSnrC1UuGtgWKvmAdDDkfi9ssSv2ynlIe
         uHbfQ6vBZ3nkwdX/euHoHXAvKE2vdH8X2Axd+FXrRfhfzYJ1yZCOaAFz5iajRgsFkEVc
         C7J+sw227uYFYcPGPRwU1B1SYXZGot7yH6DdeT7zeZOsFBeQG6KIk2Q/QbGJcfu/65mT
         Q656quNdxa0RA7jQAUxN4jd5uF7/UrNCVVJisoE5UjnP8xT2E57FLGtVxsd1BzFBxfLk
         pDjLHmLLrnquAiZlFYf/QNy0PwM7OnnK95BcZggmVGTJ/KzCrgma6YIEWz9uFQi8vU7m
         2e5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683845803; x=1686437803;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohtAJQb6F6cDbIKk8yio8KQrKCUz3Fn39/AMo90V9pM=;
        b=i6WUEMEEKT8iOH5PTGaKf1WFlXtrzb1gOwLkLF7Rv2z3T9wpruNLTXXLFIk17MM1Yu
         UaEG/6jqAU9WZa2GNbi9p0XH3ObHma6niIqJ8DQEXY7bP6NxFr+ttVgc355rH5FU6gnC
         GuU3K2X+vvLmDwp0DgoHjFBzkOzEs/OXGKHQHc5gCwnPaaHPqTURhLhauXgwX4Y524O5
         bTHjFJ7u/5nkA5JuAZUhvPiyJXJqT/d8sGz6CqGNFpPJaBfv4a3GQDFwn9GhC867ZznY
         70RABhKYTQqQ92M5+n8zbTMdBD28iO9+zvzKAHE6ylCDs77p4tV6zmkhpPQJvgnz21T8
         l/JQ==
X-Gm-Message-State: AC+VfDyt6lHKN6VFXGV74/fAkg8crJXCRTYEiJ79r49sDSFHkD+OIpEo
	vi4YPPATH68MdGQS6Dnv4sUM+wWd0mLlMlfmw3ohKw==
X-Google-Smtp-Source: ACHHUZ7xlHHqpCZeSbzwJTpV9k1BII5bHnSWaVot6pExw6yywMVKikbhS3QjgV0hjoRV+prNz90bBA==
X-Received: by 2002:a17:90a:9d87:b0:24d:f77c:71e7 with SMTP id k7-20020a17090a9d8700b0024df77c71e7mr22260401pjp.41.1683845803004;
        Thu, 11 May 2023 15:56:43 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id fs9-20020a17090af28900b002470f179b92sm15748748pjb.43.2023.05.11.15.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:56:42 -0700 (PDT)
Date: Thu, 11 May 2023 15:56:42 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 15:53:24 PDT (-0700)
Subject: Re: [PATCH -next v19 08/24] riscv: Introduce riscv_v_vsize to record size of Vector context
In-Reply-To: <20230509103033.11285-9-andy.chiu@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-c386f0f5-8b4b-4a2c-b67e-a1803c2d177c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_155644_255706_D2A8B3BF 
X-CRM114-Status: GOOD (  29.12  )
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
Cc: guoren@linux.alibaba.com, kvm@vger.kernel.org, atishp@atishpatra.org, Atish Patra <atishp@rivosinc.com>, Bjorn Topel <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org, alexghiti@rivosinc.com, anup@brainfault.org, masahiroy@kernel.org, greentime.hu@sifive.com, lizhengyu3@huawei.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu, kvm-riscv@lists.infradead.org, leyfoon.tan@starfivetech.com, Vineet Gupta <vineetg@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, heiko.stuebner@vrull.eu, apatel@ventanamicro.com, vincent.chen@sifive.com, andy.chiu@sifive.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 May 2023 03:30:17 PDT (-0700), andy.chiu@sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. It assumes all
> harts has the same capabilities in a SMP system. If a core detects VLENB
> that is different from the boot core, then it warns and turns off V
> support for user space.
>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
> Changelog V19:
>  - Fix grammar in WARN() (Conor)
> Changelog V18:
>  - Detect inconsistent VLEN setup on an SMP system (Heiko).
>
>  arch/riscv/include/asm/vector.h |  8 ++++++++
>  arch/riscv/kernel/Makefile      |  1 +
>  arch/riscv/kernel/cpufeature.c  |  2 ++
>  arch/riscv/kernel/smpboot.c     |  7 +++++++
>  arch/riscv/kernel/vector.c      | 36 +++++++++++++++++++++++++++++++++
>  5 files changed, 54 insertions(+)
>  create mode 100644 arch/riscv/kernel/vector.c
>
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index dfe5a321b2b4..68c9fe831a41 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -7,12 +7,16 @@
>  #define __ASM_RISCV_VECTOR_H
>
>  #include <linux/types.h>
> +#include <uapi/asm-generic/errno.h>
>
>  #ifdef CONFIG_RISCV_ISA_V
>
>  #include <asm/hwcap.h>
>  #include <asm/csr.h>
>
> +extern unsigned long riscv_v_vsize;
> +int riscv_v_setup_vsize(void);
> +
>  static __always_inline bool has_vector(void)
>  {
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
> @@ -30,7 +34,11 @@ static __always_inline void riscv_v_disable(void)
>
>  #else /* ! CONFIG_RISCV_ISA_V  */
>
> +struct pt_regs;
> +
> +static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
>  static __always_inline bool has_vector(void) { return false; }
> +#define riscv_v_vsize (0)
>
>  #endif /* CONFIG_RISCV_ISA_V */
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fbdccc21418a..c51f34c2756a 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
>
>  obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
>  obj-$(CONFIG_FPU)		+= fpu.o
> +obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
>  obj-$(CONFIG_SMP)		+= smpboot.o
>  obj-$(CONFIG_SMP)		+= smp.o
>  obj-$(CONFIG_SMP)		+= cpu_ops.o
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 7aaf92fff64e..28032b083463 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -18,6 +18,7 @@
>  #include <asm/hwcap.h>
>  #include <asm/patch.h>
>  #include <asm/processor.h>
> +#include <asm/vector.h>
>
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>
> @@ -269,6 +270,7 @@ void __init riscv_fill_hwcap(void)
>  	}
>
>  	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> +		riscv_v_setup_vsize();
>  		/*
>  		 * ISA string in device tree might have 'v' flag, but
>  		 * CONFIG_RISCV_ISA_V is disabled in kernel.
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 445a4efee267..66011bf2b36e 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -31,6 +31,8 @@
>  #include <asm/tlbflush.h>
>  #include <asm/sections.h>
>  #include <asm/smp.h>
> +#include <uapi/asm/hwcap.h>
> +#include <asm/vector.h>
>
>  #include "head.h"
>
> @@ -169,6 +171,11 @@ asmlinkage __visible void smp_callin(void)
>  	set_cpu_online(curr_cpuid, 1);
>  	probe_vendor_features(curr_cpuid);
>
> +	if (has_vector()) {
> +		if (riscv_v_setup_vsize())
> +			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> +	}
> +
>  	/*
>  	 * Remote TLB flushes are ignored while the CPU is offline, so emit
>  	 * a local TLB flush right now just in case.
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> new file mode 100644
> index 000000000000..120f1ce9abf9
> --- /dev/null
> +++ b/arch/riscv/kernel/vector.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 SiFive
> + * Author: Andy Chiu <andy.chiu@sifive.com>
> + */
> +#include <linux/export.h>
> +
> +#include <asm/vector.h>
> +#include <asm/csr.h>
> +#include <asm/elf.h>
> +#include <asm/bug.h>
> +
> +unsigned long riscv_v_vsize __read_mostly;
> +EXPORT_SYMBOL_GPL(riscv_v_vsize);
> +
> +int riscv_v_setup_vsize(void)
> +{
> +	unsigned long this_vsize;
> +
> +	/* There are 32 vector registers with vlenb length. */
> +	riscv_v_enable();
> +	this_vsize = csr_read(CSR_VLENB) * 32;
> +	riscv_v_disable();
> +
> +	if (!riscv_v_vsize) {
> +		riscv_v_vsize = this_vsize;
> +		return 0;
> +	}
> +
> +	if (riscv_v_vsize != this_vsize) {
> +		WARN(1, "RISCV_ISA_V only supports one vlenb on SMP systems");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
