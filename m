Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484B3C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C42BD64FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C42BD64FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=qMvlIUL68gauHavqNDgm4FfkPQCO/6F+8Fg0VQp4h8I=; b=kWh3486hIWIgIlIg0Mooxd8Lw
	h+GTqilvUpFi9zkT2Tk7+I23+Y76CKCRgoGCE0nF4lX+u4l3b5plg7tm8fkpBFa66XY0lmspUbBai
	P/XgE9QGYIyR/T9nkXnoRMgswjFpFddpsqKxX93AGiNIUkgwcLQJbj31Vl3ytdxXE08AaeBcO1Rj2
	rPTK69Ck7OKtmjwVqYFpS2hWbndJ/hFbSv0/B1vuClOFaF5OVPqDvePr5te+A5i38t46Tq86UJGh4
	YB8A/epjK2sENhpXQFDwpTtJXFNZrb9B9JnYDiYl7kY7yGhYPu1FYFouQEALwcXCYjaxS58IYSxGi
	/laU5wn8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJqdO-0060e4-NM; Wed, 10 Mar 2021 04:39:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJqcv-0060a1-Pr
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 04:39:24 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so6784564pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 20:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LPW315w9s3fNtPETXXRDzvih2mQsmNwYah1PvcH36JY=;
 b=iUj/LOeIretP/ZOeVqqJbLRRBAC6fS1RSKaZ943wtZsuR2AZeE9lAkJZ5J3U6AmyEb
 wy3F4qIQ9+X4pkbRr4yIjKXcPYc56YUkvO9fyvcYqqdQAi8WhQNqo7gKAIWFE54zYWQI
 5ss7eK48NYrWYA6ZdzbEOaBBXON8vF7sB4IEz9bWBlCKGXR+4V6f+UXPa/hE1I5ceK+g
 SZeyXrRxBaaZPOTddUWaCC1e6dKrMX6EZoX04vRaQUE7xmbqBr70E8Bbh5WOz5IQ8Irb
 AT6MFhksL+IJa9qYA/fMtbC/0cHbQegwXFLuQ+DCriKMXnzK5AqWokqz8U4I1UDNx3JS
 A7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LPW315w9s3fNtPETXXRDzvih2mQsmNwYah1PvcH36JY=;
 b=NTy0Hv/ys5VfTWzbHYLdZ/G2Dco/6HCje2qTG919nUd4C+buDE8rxEglY/xq904Xoe
 csHnRUhzOS0Oby7n2QoFZ3aX1J7Qqqo/QafdBJLkxw+9SphNr+wgENyyjqZAwYHqjnxd
 0xEEUlA2Vivz32NViA6h8pxweINGIC+2+6NdqHCZUWWzNCmdV0omttlpDRbrCfBN3TTO
 quRFZmnaQmG6/UUKMkRfBKMR4ZtGh3ZlM0s9YaC3jUCSblH4GdFQtYMUXbegiWSkLMVY
 IQ8u7F7IRIfYtJQ8gv41WojnQ9uRqyBSKoB8uvKC9KPKlSJlkIiK+NL6SpopnA79HGQh
 iH1g==
X-Gm-Message-State: AOAM532JhNZbXRZoNcVsvKmy72iXsDShm3LjzIKA0aDhCMzmlZAyn8q+
 0XnJOlTYJVvaH0XkAucYfA0GPZUINsGgsg==
X-Google-Smtp-Source: ABdhPJwaavYxFcWNuTpO1X2x2PR9TR7Uf8QIwaCCKlDw27Gf1bo9FkX/f6ydLXxea80oQnomVYaYEg==
X-Received: by 2002:a17:90a:e646:: with SMTP id
 ep6mr1574977pjb.101.1615351155950; 
 Tue, 09 Mar 2021 20:39:15 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r4sm4481317pjl.15.2021.03.09.20.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 20:39:15 -0800 (PST)
Date: Tue, 09 Mar 2021 20:39:15 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 20:09:24 PST (-0800)
Subject: Re: [RFC patch 3/4] riscv: Introduce alternative mechanism to apply
 errata solution
In-Reply-To: <1615175897-23509-4-git-send-email-vincent.chen@sifive.com>
CC: linux-riscv@lists.infradead.org, Frank.Zhao@starfivetech.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 guoren@kernel.org, alankao@andestech.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-2a688b1c-311a-4845-b48a-88b05bf8f022@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_043921_928850_4E634B74 
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

On Sun, 07 Mar 2021 19:58:16 PST (-0800), vincent.chen@sifive.com wrote:
> Introduce the "alternative" mechanism from ARM64 and x86 to apply the CPU
> vendors' errata solution at runtime. The main purpose of this patch is
> to provide a framework. Therefore, the implementation is quite basic for
> now so that some scenarios could not use this schemei, such as patching
> code to a module, relocating the patching code and heterogeneous CPU
> topology.
>
> Users could use the macro ALTERNATIVE to apply an errata to the existing
> code flow. In the macro ALTERNATIVE, users need to specify the manufacturer
> information(vendorid, archid, and impid) for this errata. Therefore, kernel
> will know this errata is suitable for which CPU core. During the booting
> procedure, kernel will select the errata required by the CPU core and then
> patch it. It means that the kernel only applies the errata to the specified
> CPU core. In this case the vendor's errata does not affect each other at
> runtime. The above patching procedure only occurs during the booting phase,
> so we only take the overhead of the "alternative" mechanism once.
>
> This "alternative" mechanism is enabled by default to ensure that all
> required errata will be applied. However, users can disable this feature by
> the Kconfig "CONFIG_RISCV_ERRATA_ALTERNATIVE".
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/Kconfig                          |   1 +
>  arch/riscv/Kconfig.erratas                  |  12 +++
>  arch/riscv/Makefile                         |   1 +
>  arch/riscv/errata/Makefile                  |   1 +
>  arch/riscv/errata/alternative.c             |  69 +++++++++++++++++
>  arch/riscv/include/asm/alternative-macros.h | 110 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/alternative.h        |  44 +++++++++++
>  arch/riscv/include/asm/asm.h                |   1 +
>  arch/riscv/include/asm/errata_list.h        |   8 ++
>  arch/riscv/include/asm/sections.h           |   2 +
>  arch/riscv/include/asm/vendorid_list.h      |   6 ++
>  arch/riscv/kernel/smpboot.c                 |   4 +
>  arch/riscv/kernel/vmlinux.lds.S             |  14 ++++
>  13 files changed, 273 insertions(+)
>  create mode 100644 arch/riscv/Kconfig.erratas
>  create mode 100644 arch/riscv/errata/Makefile
>  create mode 100644 arch/riscv/errata/alternative.c
>  create mode 100644 arch/riscv/include/asm/alternative-macros.h
>  create mode 100644 arch/riscv/include/asm/alternative.h
>  create mode 100644 arch/riscv/include/asm/errata_list.h
>  create mode 100644 arch/riscv/include/asm/vendorid_list.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a998babc1237..2e26251fe1f2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -204,6 +204,7 @@ config LOCKDEP_SUPPORT
>  	def_bool y
>
>  source "arch/riscv/Kconfig.socs"
> +source "arch/riscv/Kconfig.erratas"
>
>  menu "Platform type"
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> new file mode 100644
> index 000000000000..4d0bafc536df
> --- /dev/null
> +++ b/arch/riscv/Kconfig.erratas
> @@ -0,0 +1,12 @@
> +menu "CPU errata selection"
> +
> +config RISCV_ERRATA_ALTERNATIVE
> +	bool "RISC-V alternative scheme"
> +	default y
> +	help
> +	  This Kconfig allows the kernel to automatically patch the
> +	  errata required by the execution platform at run time. The
> +	  code patching is performed once in the boot stages. It means
> +	  that the overhead from this mechanism is just taken once.
> +
> +endmenu
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 1368d943f1f3..1f5c03082976 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -87,6 +87,7 @@ KBUILD_IMAGE	:= $(boot)/Image.gz
>  head-y := arch/riscv/kernel/head.o
>
>  core-y += arch/riscv/
> +core-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += arch/riscv/errata/
>
>  libs-y += arch/riscv/lib/
>  libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> new file mode 100644
> index 000000000000..43e6d5424367
> --- /dev/null
> +++ b/arch/riscv/errata/Makefile
> @@ -0,0 +1 @@
> +obj-y	+= alternative.o
> diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
> new file mode 100644
> index 000000000000..052affdce6eb
> --- /dev/null
> +++ b/arch/riscv/errata/alternative.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * alternative runtime patching
> + * inspired by the ARM64 and x86 version
> + *
> + * Copyright (C) 2021 Sifive.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/cpu.h>
> +#include <linux/uaccess.h>
> +#include <asm/patch.h>
> +#include <asm/alternative.h>
> +#include <asm/sections.h>
> +
> +struct alt_region {
> +	struct alt_entry *begin;
> +	struct alt_entry *end;
> +};
> +
> +static bool (*errata_checkfunc)(struct alt_entry *alt);
> +typedef int (*patch_func_t)(void *addr, const void *insn, size_t size);
> +
> +static void __apply_alternatives(void *alt_region, void *alt_patch_func)
> +{
> +	struct alt_entry *alt;
> +	struct alt_region *region = alt_region;
> +
> +	for (alt = region->begin; alt < region->end; alt++) {
> +		if (!errata_checkfunc(alt))
> +			continue;
> +		((patch_func_t)alt_patch_func)(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +	}
> +}
> +
> +static void __init init_alternative(void)
> +{
> +	struct errata_checkfunc_id *ptr;
> +
> +	for (ptr = (struct errata_checkfunc_id *)__alt_checkfunc_table;
> +	     ptr < (struct errata_checkfunc_id *)__alt_checkfunc_table_end;
> +	     ptr++) {
> +		if (cpu_mfr_info.vendor_id == ptr->vendor_id)

Of those three new SBI calls this is the only one I see used.  You could get 
rid of the whole global caching thing and just call it once here, which would 
be a bit simpler.

I'm also not convinced that it's worth all this table stuff here.  It's not 
like we have new vendors every day, we could just have a switch statement on 
sbi_get_mvendorid() and stick every vendor's errata probe in there.

At that point this would be simple enough that I'd be inclined to 
unconditionally (at least on S-mode kernels, the M-mode kernels aren't portable 
so who cares) include the errata checking.  I can understand not wanting to 
take all the errata fixing, as some of those could get complex, but if we have 
the check in there we can provide a warning to users who don't have the errata 
fix.

If that gets out of hand or we have non-portable kernels we can always hoist 
the ifdefs to avoid the check functions as well, but I'd prefer that portable 
kernels are at least capable of detecting they've been built in a fashion that 
will subtly break things.

> +			errata_checkfunc = ptr->func;
> +	}
> +}
> +
> +/*
> + * This is called very early in the boot process (directly after we run
> + * a feature detect on the boot CPU). No need to worry about other CPUs
> + * here.
> + */
> +void __init apply_boot_alternatives(void)
> +{
> +	struct alt_region region;
> +
> +	/* If called on non-boot cpu things could go wrong */
> +	WARN_ON(smp_processor_id() != 0);
> +
> +	init_alternative();
> +
> +	if (!errata_checkfunc)
> +		return;
> +
> +	region.begin = (struct alt_entry *)__alt_start;
> +	region.end = (struct alt_entry *)__alt_end;
> +	__apply_alternatives(&region, patch_text_nosync);
> +}
> +
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> new file mode 100644
> index 000000000000..7b6f0c94b1fb
> --- /dev/null
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -0,0 +1,110 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_ALTERNATIVE_MACROS_H
> +#define __ASM_ALTERNATIVE_MACROS_H
> +
> +#ifdef CONFIG_RISCV_ERRATA_ALTERNATIVE
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <asm/asm.h>
> +#include <linux/stringify.h>
> +
> +#define ALT_ENTRY(oldptr, altptr, vendor_id, errata_id, altlen) \
> +	RISCV_PTR " " oldptr "\n" \
> +	RISCV_PTR " " altptr "\n" \
> +	REG_ASM " " vendor_id "\n" \
> +	REG_ASM " " altlen "\n" \
> +	".word " errata_id "\n"
> +
> +#define __ALTERNATIVE_CFG(oldinsn, altinsn, vendor_id, errata_id, enable) \
> +	"886 :\n"							\
> +	oldinsn "\n"							\
> +	".if " __stringify(enable) " == 1\n"				\
> +	"887 :\n"							\
> +	".pushsection .alternative, \"a\"\n"				\
> +	ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
> +	".popsection\n"							\
> +	".subsection 1\n"						\
> +	"888 :\n"							\
> +	altinsn "\n"							\
> +	"889 :\n"							\
> +	".previous\n"							\
> +	".org	. - (887b - 886b) + (889b - 888b)\n"			\
> +	".org	. - (889b - 888b) + (887b - 886b)\n"			\
> +	".endif\n"
> +
> +#define _ALTERNATIVE_CFG(oldinsn, altinsn, vendor_id, errata_id, CONFIG_k)	\
> +	__ALTERNATIVE_CFG(oldinsn, altinsn, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
> +
> +#else /* __ASSEMBLY__ */
> +
> +.macro ALT_ENTRY oldptr altptr vendor_id errata_id alt_len
> +	RISCV_PTR \oldptr
> +	RISCV_PTR \altptr
> +	REG_ASM \vendor_id
> +	REG_ASM \alt_len
> +	.word	\errata_id
> +.endm
> +
> +.macro __ALTERNATIVE_CFG insn1 insn2 vendor_id errata_id enable = 1
> +886 :
> +	\insn1
> +	.if \enable
> +887 :
> +	.pushsection .alternative, "a"
> +	ALT_ENTRY 886b, 888f, \vendor_id, \errata_id, 889f - 888f
> +	.popsection
> +	.subsection 1
> +888 :
> +	\insn2
> +889 :
> +	.previous
> +	.org    . - (889b - 888b) + (887b - 886b)
> +	.org    . - (887b - 886b) + (889b - 888b)
> +	.endif
> +.endm
> +
> +#define _ALTERNATIVE_CFG(oldinsn, altinsn, vendor_id, errata_id, CONFIG_k) \
> +	__ALTERNATIVE_CFG oldinsn, altinsn, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
> +
> +#endif /* !__ASSEMBLY__ */
> +
> +#else /* !CONFIG_RISCV_ERRATA_ALTERNATIVE*/
> +#ifndef __ASSEMBLY__
> +
> +#define __ALTERNATIVE_CFG(oldinsn)  \
> +	oldinsn "\n"
> +
> +#define _ALTERNATIVE_CFG(oldinsn, altinsn, vendor_id, errata_id, CONFIG_k) \
> +	__ALTERNATIVE_CFG(oldinsn)
> +
> +#else /* __ASSEMBLY__ */
> +
> +.macro __ALTERNATIVE_CFG insn1
> +	\insn1
> +.endm
> +
> +#define _ALTERNATIVE_CFG(oldinsn, altinsn, vendor_id, errata_id, CONFIG_k) \
> +	__ALTERNATIVE_CFG oldinsn
> +
> +#endif /* !__ASSEMBLY__ */
> +#endif /* CONFIG_RISCV_ERRATA_ALTERNATIVE */
> +
> +/*
> + * Usage:
> + *	ALTERNATIVE(oldinsn, altinsn, vendor_id, errata_id, CONFIG_k)
> + *  in the assembly code. Otherwise,
> + *	asm(ALTERNATIVE(oldinsn, altinsn, vendor_id, errata_id, CONFIG_k));
> + *
> + * oldinsn: The old instruction which will be replaced.
> + * altinsn: The replacement instruction.
> + * vendor_id: The CPU vendor ID.
> + * errata_id: The errata ID.
> + * CONFIG_k: The Kconfig of this errata. The instructions replacement can
> + *           be disabled by this Kconfig. When Kconfig is disabled, the
> + *           oldinsn will always be executed.
> + */
> +#define ALTERNATIVE(oldinsn, altinsn, vendor_id, errata_id, CONFIG_k)   \
> +	_ALTERNATIVE_CFG(oldinsn, altinsn, vendor_id, errata_id, CONFIG_k)
> +
> +#endif
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> new file mode 100644
> index 000000000000..98a0ea331a27
> --- /dev/null
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 Sifive.
> + */
> +
> +#ifndef __ASM_ALTERNATIVE_H
> +#define __ASM_ALTERNATIVE_H
> +
> +#define ERRATA_STRING_LENGTH_MAX 32
> +
> +#include <asm/alternative-macros.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/stddef.h>
> +#include <asm/hwcap.h>
> +
> +void __init apply_boot_alternatives(void);
> +
> +struct alt_entry {
> +	void *old_ptr;		 /* address of original instruciton or data  */
> +	void *alt_ptr;		 /* address of replacement instruction or data */
> +	unsigned long vendor_id; /* cpu vendor id */
> +	unsigned long alt_len;   /* The replacement size */
> +	unsigned int errata_id;  /* The errata id */
> +} __packed;
> +
> +struct errata_checkfunc_id {
> +	unsigned long vendor_id;
> +	bool (*func)(struct alt_entry *alt);
> +};
> +
> +extern struct cpu_manufacturer_info_t cpu_mfr_info;
> +
> +#define REGISTER_ERRATA_CHECKFUNC(checkfunc, vendorid)			  \
> +	static const struct errata_checkfunc_id _errata_check_##vendorid  \
> +	__used __section(".alt_checkfunc_table")			  \
> +	__aligned(__alignof__(struct errata_checkfunc_id)) =		  \
> +	{ .vendor_id = vendorid,					  \
> +	  .func = checkfunc }
> +#endif
> +#endif
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 9c992a88d858..e20646aa97e5 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -23,6 +23,7 @@
>  #define REG_L		__REG_SEL(ld, lw)
>  #define REG_S		__REG_SEL(sd, sw)
>  #define REG_SC		__REG_SEL(sc.d, sc.w)
> +#define REG_ASM 	__REG_SEL(.dword, .word)
>  #define SZREG		__REG_SEL(8, 4)
>  #define LGREG		__REG_SEL(3, 2)
>
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> new file mode 100644
> index 000000000000..5e5a1fcd90ba
> --- /dev/null
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 Sifive.
> + */
> +
> +#ifdef CONFIG_SOC_SIFIVE
> +#define	ERRATA_NUMBER 0
> +#endif
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> index 1595c5b60cfd..d13160f46d4e 100644
> --- a/arch/riscv/include/asm/sections.h
> +++ b/arch/riscv/include/asm/sections.h
> @@ -11,5 +11,7 @@ extern char _start[];
>  extern char _start_kernel[];
>  extern char __init_data_begin[], __init_data_end[];
>  extern char __init_text_begin[], __init_text_end[];
> +extern char __alt_checkfunc_table[], __alt_checkfunc_table_end[];
> +extern char __alt_start[], __alt_end[];
>
>  #endif /* __ASM_SECTIONS_H */
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> new file mode 100644
> index 000000000000..1f3be47decb6
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 SiFive
> + */
> +
> +#define SIFIVE_VENDOR_ID	0x489
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 5e276c25646f..9a408e2942ac 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -32,6 +32,7 @@
>  #include <asm/sections.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> +#include <asm/alternative.h>
>
>  #include "head.h"
>
> @@ -40,6 +41,9 @@ static DECLARE_COMPLETION(cpu_running);
>  void __init smp_prepare_boot_cpu(void)
>  {
>  	init_cpu_topology();
> +#ifdef CONFIG_RISCV_ERRATA_ALTERNATIVE
> +	apply_boot_alternatives();
> +#endif
>  }
>
>  void __init smp_prepare_cpus(unsigned int max_cpus)
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index de03cb22d0e9..6503dfca65b0 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -90,6 +90,20 @@ SECTIONS
>  	}
>
>  	__init_data_end = .;
> +
> +	. = ALIGN(8);
> +	.alt_checkfunc_table : {
> +		__alt_checkfunc_table = .;
> +		*(.alt_checkfunc_table)
> +		__alt_checkfunc_table_end = .;
> +	}
> +
> +	. = ALIGN(8);
> +	.alternative : {
> +		__alt_start = .;
> +		*(.alternative)
> +		__alt_end = .;
> +	}
>  	__init_end = .;
>
>  	/* Start of data section */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
