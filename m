Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A39C4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7KG97wn1vp5swqEU2xxLM7Fxghnfn0PWSmm9jkKVA4g=; b=teIpAXuU70rYDc8vd2aY0C4DU0
	ptwNMZiSkUKuJb+CCmYS3YVyM3QXUZVt29hoSh23qZauLYjpNOLIpSEuuRdgD/h9U5t9rKoH/CEId
	CA4zxfjzAv0GSrSjTEuAmeYhtGstHb42Is37KzcQL+R5ywS4VYGjx+aOAnUREw6/pX+Hpd4dTcFlF
	xPErrpwVlhuPWd6iGPj45P0I7aAqpw1Rm5aC/V0zTeeLjlxqUtIEIwVQs8cxfGK+KD4cITdhJCbfc
	inSHIc8FX8vYdLjcuy21UmDLaOxN17x7if6gqD3hz5+WVJ6oZnQ1asnEjlPp626+G2u0QOKwS+pfu
	jcxpCTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZvl-00CPhU-2I;
	Wed, 10 Jan 2024 14:51:45 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZvi-00CPer-0D
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 14:51:43 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7beda6a274bso57671839f.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 06:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1704898299; x=1705503099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlRr87AfARWxTIrPYo3v1voc73TzaNkp96EPHRmj2xU=;
        b=0k7cjErvTpsMfq1tUks8luIED3aQ+1lq2xrcRfOaX59gtGtoldj1g5sD3fYqrhkFH7
         xJ2aBUVVm5ppJfkO8x7elHkqr55CbsDU1NozVIudp2yAEK8n9IhZkb7+yipVmCzrQX0d
         YfA9dQj01x7M036ILjHJo7xAvxoLpvNt9AbGcKB0hmQoTB3q7yU3Nq+ZZvownpXjMoXN
         KTEgLmKkwj3oJ9T3mvfPoFRFfbxkvLQH8FFkoIJfJ7SjZPvVQjtDUwn1AULHMHsukeTv
         XGY1VWgpy5kJW5EhA+D5IX+1+RBzfjQEdWzhBSd4o7VTP/OeX3nkqblzwRivutXNF44K
         Zq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898299; x=1705503099;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlRr87AfARWxTIrPYo3v1voc73TzaNkp96EPHRmj2xU=;
        b=C0V2hUhkn1PYiX/eqfbsnaKVw0VTuXnIs0cIvlY4pTnPTNIXqYv0McqZAuFRW4P1e/
         +8SWVeBnyH/gg/8edGmUlxfa3NxM/laEDFIdU7Vu2kiSytho+z2JXbghvuo+9oROQfei
         HYyJteZvslNxJfhxTwG7y11/bPHPlIfoUpSXRFZiInFIzLSr0iyK1dvtbssuRUmhwqGY
         JFflg/vjob4LhkZfpA6kmmi4XgdOXlE6SBxjc/0Z2WpmfB1LdCyvcUfrOHfvgrEgtFLn
         MVkF4IgrpytIo5rh3hWrML3T3MnI9n8gqCyhofFSSaCYW991AfL4D9aO0tTqOZ2DMlB5
         ZY/g==
X-Gm-Message-State: AOJu0YxRrFnJHWrcLaVsyt4FblRithZG2/shCvjwGnJIyPiDMuWvs4lY
	NVeHO4ZKj2VlfE0jwZhDM/DopKavdhwRX+pqUYPY8R65gdU=
X-Google-Smtp-Source: AGHT+IESMcbobMlRjbgJYfocjXsZ0yo/qo6i1dK8eo1VFgWRNLIDb9r8HTjU5OKJKjNYljfVT1tLPg==
X-Received: by 2002:a05:6602:131d:b0:7bc:838:6665 with SMTP id h29-20020a056602131d00b007bc08386665mr986219iov.28.1704898299159;
        Wed, 10 Jan 2024 06:51:39 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id k12-20020a02c64c000000b0046e304dc641sm1319869jan.95.2024.01.10.06.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:51:38 -0800 (PST)
Date: Wed, 10 Jan 2024 06:51:38 -0800 (PST)
X-Google-Original-Date: Wed, 10 Jan 2024 06:51:33 PST (-0800)
Subject: Re: [PATCH v2 10/14] riscv: Add support for kernel-mode FPU
In-Reply-To: <20231228014220.3562640-11-samuel.holland@sifive.com>
CC: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
  x86@kernel.org, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
  loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
  linux-arch@vger.kernel.org, samuel.holland@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-3e4b97f6-8310-487e-9f9a-1d19d6e42a1e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_065142_324587_58C90430 
X-CRM114-Status: GOOD (  24.90  )
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

On Wed, 27 Dec 2023 17:42:00 PST (-0800), samuel.holland@sifive.com wrote:
> This is motivated by the amdgpu DRM driver, which needs floating-point
> code to support recent hardware. That code is not performance-critical,
> so only provide a minimal non-preemptible implementation for now.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>  - Remove RISC-V architecture-specific preprocessor check
>
>  arch/riscv/Kconfig                  |  1 +
>  arch/riscv/Makefile                 |  3 +++
>  arch/riscv/include/asm/fpu.h        | 16 ++++++++++++++++
>  arch/riscv/kernel/Makefile          |  1 +
>  arch/riscv/kernel/kernel_mode_fpu.c | 28 ++++++++++++++++++++++++++++
>  5 files changed, 49 insertions(+)
>  create mode 100644 arch/riscv/include/asm/fpu.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 24c1799e2ec4..4d4d1d64ce34 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -27,6 +27,7 @@ config RISCV
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
> +	select ARCH_HAS_KERNEL_FPU_SUPPORT if FPU
>  	select ARCH_HAS_MMIOWB
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_PMEM_API
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index a74be78678eb..2e719c369210 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -81,6 +81,9 @@ KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
>
>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>
> +# For C code built with floating-point support, exclude V but keep F and D.
> +CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
> +
>  KBUILD_CFLAGS += -mno-save-restore
>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>
> diff --git a/arch/riscv/include/asm/fpu.h b/arch/riscv/include/asm/fpu.h
> new file mode 100644
> index 000000000000..91c04c244e12
> --- /dev/null
> +++ b/arch/riscv/include/asm/fpu.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 SiFive
> + */
> +
> +#ifndef _ASM_RISCV_FPU_H
> +#define _ASM_RISCV_FPU_H
> +
> +#include <asm/switch_to.h>
> +
> +#define kernel_fpu_available()	has_fpu()
> +
> +void kernel_fpu_begin(void);
> +void kernel_fpu_end(void);
> +
> +#endif /* ! _ASM_RISCV_FPU_H */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fee22a3d1b53..662c483e338d 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
>
>  obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
>  obj-$(CONFIG_FPU)		+= fpu.o
> +obj-$(CONFIG_FPU)		+= kernel_mode_fpu.o
>  obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
>  obj-$(CONFIG_SMP)		+= smpboot.o
>  obj-$(CONFIG_SMP)		+= smp.o
> diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
> new file mode 100644
> index 000000000000..0ac8348876c4
> --- /dev/null
> +++ b/arch/riscv/kernel/kernel_mode_fpu.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 SiFive
> + */
> +
> +#include <linux/export.h>
> +#include <linux/preempt.h>
> +
> +#include <asm/csr.h>
> +#include <asm/fpu.h>
> +#include <asm/processor.h>
> +#include <asm/switch_to.h>
> +
> +void kernel_fpu_begin(void)
> +{
> +	preempt_disable();
> +	fstate_save(current, task_pt_regs(current));
> +	csr_set(CSR_SSTATUS, SR_FS);
> +}
> +EXPORT_SYMBOL_GPL(kernel_fpu_begin);
> +
> +void kernel_fpu_end(void)
> +{
> +	csr_clear(CSR_SSTATUS, SR_FS);
> +	fstate_restore(current, task_pt_regs(current));
> +	preempt_enable();
> +}
> +EXPORT_SYMBOL_GPL(kernel_fpu_end);

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

assuming you want to keep these together -- it touches a lot of stuff, 
so LMK if you want me to pick something up.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
