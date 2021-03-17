Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66F1C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 11:39:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F107664F69
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 11:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F107664F69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5JIwlPjqDYLJN85n2jDPpUyuW8Dy2/0c/cbwKXWBDEg=; b=Kr9Ib4UCHVqxIaibvoObGEQas
	gr4JBbicwN8oJ3jKY+0C8K0Ps4ZIHK8PdGx64PD7iX0mXCUJZ9DuagD+fx59hkskAq1nyyzwwkiPz
	oMGRPZ/Tc0IlQ5c+6JqbWJXT9QE+Rvhx26BiZlSfyab/6ekVApa0TN1+wMtMZtT+/0WQC60Br78Dh
	+XJOQTF0Z4E3Aa5oF/1X8Zz6lNspH2tKiEw/Ug8PvWD592IsVQ4Z1iZSaz9D619lvO7cuTKYyAlmm
	armVASnDTF8ZvsSa0W4zBYvufRZCuAW900LDMbnu4gbpAMvVbaN7yzfsEylFaW3hkQHcnL06cBR4H
	mkR08ia4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMUWG-0032Pp-Nt; Wed, 17 Mar 2021 11:39:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMUWA-0032PP-Ui
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 11:39:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id v11so1466730wro.7
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 04:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cvrh7VXChCqOXGOAhUfj5CUVy5oVf/wc2H8WVKRP1wU=;
 b=UIqbBTKEAodRcEN58ke6/em+R5cKngYjzsoqAJJTUfj8sjiou/NH2DjAVemA3Pgyos
 2Y5IyNZ4qSWrr4QLCg8mwk//dHXM6UExhTS5yrvZAy86GCV0skXUmEjT+H1uwYSwhsMR
 Z5y9DOAdrSGvJ4mPM3KPIS4xu0kOfgSoIYbTw4bjJnUJ4plpvgQOlVycELByvnUiI835
 m3NieqJ+iavBYcXG/RBA2hOQ4arOVMmxSjuiFDnhfW9Sb7av8dKgR9aaBDJcAnB0ebeR
 +fcieWu9xd2HAYnOqSy78ujc6dgmOuovBim/xCIbvlLFQ1JGYuU6DumvCv/wvlUsPIWj
 xZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cvrh7VXChCqOXGOAhUfj5CUVy5oVf/wc2H8WVKRP1wU=;
 b=sNW+HTF6TNcg03YqIRWdKxQ5o5ggptVFsa9ueuoHhCmiTohC+ZDntMrR2mQfVAycyc
 r1Bvo5nnjbgbOsCy4ov3sgABCY5vb9r/WQhjD06RPnOfE5ODYIAjaYPUw8iNTvrTmuTy
 91j4fbFG8vyuBDuFGrGtsrINLxNs7ORNbKUpzxoosEusIUPsVB3Qia9rWYX+JiMN4K25
 CjGUXoCskWIgAkyB1T5Pa/gpnw94fYEhMv71z344ODHrKauVhuuNbWS9qNdiTBUinbNK
 ulopJ8uqB7wAePkDyRdt3mWjDjT7Zv7fROq2hk+U+QZusE17uDR/urUn2QrxdaAtOi7a
 LBXg==
X-Gm-Message-State: AOAM531SHHGhTFkuuvP4TvDFmzyYOus57xa+a6ntQMmbv+3sqqevV+92
 XqOvjYnZ8UWCCtqQ66WUdn/2T9D5SYL7vQ6ISiadFg==
X-Google-Smtp-Source: ABdhPJxBMALSHcjulTs5Mj4DNW5KXpZtduDL8uVxcUJq4KT0Q7NlABYPzFUifM0y5F3rTVeFtW3xKNbyTcNwHUW2OuE=
X-Received: by 2002:a5d:5744:: with SMTP id q4mr4091083wrw.390.1615981154052; 
 Wed, 17 Mar 2021 04:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
 <1615973613-22364-3-git-send-email-vincent.chen@sifive.com>
In-Reply-To: <1615973613-22364-3-git-send-email-vincent.chen@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Mar 2021 17:09:01 +0530
Message-ID: <CAAhSdy33vqwkOL2F-Wb0vhRXXZ6OmGDSaAqD+3XF0-tOfvc0HA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] riscv: Introduce alternative mechanism to apply
 errata solution
To: Vincent Chen <vincent.chen@sifive.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Frank.Zhao@starfivetech.com, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@kernel.org>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 ruinland@andestech.com, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_113915_782090_340C5AA0 
X-CRM114-Status: GOOD (  40.14  )
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

On Wed, Mar 17, 2021 at 3:04 PM Vincent Chen <vincent.chen@sifive.com> wrote:
>
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
> CPU core. In this case, the vendor's errata does not affect each other at
> runtime. The above patching procedure only occurs during the booting phase,
> so we only take the overhead of the "alternative" mechanism once.
>
> This "alternative" mechanism is enabled by default to ensure that all
> required errata will be applied. However, users can disable this feature by
> the Kconfig "CONFIG_RISCV_ERRATA_ALTERNATIVE".
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/Kconfig                          |   1 +
>  arch/riscv/Kconfig.erratas                  |  12 +++
>  arch/riscv/Makefile                         |   1 +
>  arch/riscv/errata/Makefile                  |   1 +
>  arch/riscv/errata/alternative.c             |  69 ++++++++++++++
>  arch/riscv/include/asm/alternative-macros.h | 142 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/alternative.h        |  36 +++++++
>  arch/riscv/include/asm/asm.h                |   1 +
>  arch/riscv/include/asm/csr.h                |   3 +
>  arch/riscv/include/asm/errata_list.h        |  12 +++
>  arch/riscv/include/asm/sections.h           |   1 +
>  arch/riscv/include/asm/vendorid_list.h      |  10 ++
>  arch/riscv/kernel/smpboot.c                 |   4 +
>  arch/riscv/kernel/vmlinux.lds.S             |   7 ++
>  14 files changed, 300 insertions(+)
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
>         def_bool y
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
> +       bool "RISC-V alternative scheme"
> +       default y
> +       help
> +         This Kconfig allows the kernel to automatically patch the
> +         errata required by the execution platform at run time. The
> +         code patching is performed once in the boot stages. It means
> +         that the overhead from this mechanism is just taken once.
> +
> +endmenu
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 1368d943f1f3..1f5c03082976 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -87,6 +87,7 @@ KBUILD_IMAGE  := $(boot)/Image.gz
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
> +obj-y  += alternative.o
> diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
> new file mode 100644
> index 000000000000..8efa60ad69b7
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
> +#include <asm/alternative.h>
> +#include <asm/sections.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/sbi.h>
> +#include <asm/csr.h>
> +
> +static struct cpu_manufacturer_info_t {
> +       unsigned long vendor_id;
> +       unsigned long arch_id;
> +       unsigned long imp_id;
> +} cpu_mfr_info;
> +
> +static void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
> +                                unsigned long archid, unsigned long impid);
> +
> +static inline void __init riscv_fill_cpu_mfr_info(void)
> +{
> +#ifdef CONFIG_RISCV_M_MODE
> +       cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
> +       cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
> +       cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
> +#else
> +       cpu_mfr_info.vendor_id = sbi_get_mvendorid();
> +       cpu_mfr_info.arch_id = sbi_get_marchid();
> +       cpu_mfr_info.imp_id = sbi_get_mimpid();
> +#endif
> +}
> +
> +static void __init init_alternative(void)
> +{
> +       riscv_fill_cpu_mfr_info();
> +
> +       switch (cpu_mfr_info.vendor_id) {
> +       default:
> +               vendor_patch_func = NULL;
> +       }
> +}
> +
> +/*
> + * This is called very early in the boot process (directly after we run
> + * a feature detect on the boot CPU). No need to worry about other CPUs
> + * here.
> + */
> +void __init apply_boot_alternatives(void)
> +{
> +       /* If called on non-boot cpu things could go wrong */
> +       WARN_ON(smp_processor_id() != 0);
> +
> +       init_alternative();
> +
> +       if (!vendor_patch_func)
> +               return;
> +
> +       vendor_patch_func((struct alt_entry *)__alt_start,
> +                         (struct alt_entry *)__alt_end,
> +                         cpu_mfr_info.arch_id, cpu_mfr_info.imp_id);
> +}
> +
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> new file mode 100644
> index 000000000000..88c08705f64a
> --- /dev/null
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_ALTERNATIVE_MACROS_H
> +#define __ASM_ALTERNATIVE_MACROS_H
> +
> +#ifdef CONFIG_RISCV_ERRATA_ALTERNATIVE
> +
> +#ifdef __ASSEMBLY__
> +
> +.macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
> +       RISCV_PTR \oldptr
> +       RISCV_PTR \newptr
> +       REG_ASM \vendor_id
> +       REG_ASM \new_len
> +       .word   \errata_id
> +.endm
> +
> +.macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
> +       .if \enable
> +       .pushsection .alternative, "a"
> +       ALT_ENTRY 886b, 888f, \vendor_id, \errata_id, 889f - 888f
> +       .popsection
> +       .subsection 1
> +888 :
> +       \new_c
> +889 :
> +       .previous
> +       .org    . - (889b - 888b) + (887b - 886b)
> +       .org    . - (887b - 886b) + (889b - 888b)
> +       .endif
> +.endm
> +
> +.macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
> +886 :
> +       \old_c
> +887 :
> +       ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
> +.endm
> +
> +#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> +       __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
> +
> +#else /* !__ASSEMBLY__ */
> +
> +#include <asm/asm.h>
> +#include <linux/stringify.h>
> +
> +#define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen) \
> +       RISCV_PTR " " oldptr "\n" \
> +       RISCV_PTR " " newptr "\n" \
> +       REG_ASM " " vendor_id "\n" \
> +       REG_ASM " " newlen "\n" \
> +       ".word " errata_id "\n"
> +
> +#define ALT_NEW_CONSTENT(vendor_id, errata_id, enable, new_c) \
> +       ".if " __stringify(enable) " == 1\n"                            \
> +       ".pushsection .alternative, \"a\"\n"                            \
> +       ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
> +       ".popsection\n"                                                 \
> +       ".subsection 1\n"                                               \
> +       "888 :\n"                                                       \
> +       new_c "\n"                                                      \
> +       "889 :\n"                                                       \
> +       ".previous\n"                                                   \
> +       ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
> +       ".org   . - (889b - 888b) + (887b - 886b)\n"                    \
> +       ".endif\n"
> +
> +#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable) \
> +       "886 :\n"       \
> +       old_c "\n"      \
> +       "887 :\n"       \
> +       ALT_NEW_CONSTENT(vendor_id, errata_id, enable, new_c)
> +
> +#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> +       __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#else /* !CONFIG_RISCV_ERRATA_ALTERNATIVE*/
> +#ifdef __ASSEMBLY__
> +
> +.macro __ALTERNATIVE_CFG old_c
> +       \old_c
> +.endm
> +
> +#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> +       __ALTERNATIVE_CFG old_c
> +
> +#else /* !__ASSEMBLY__ */
> +
> +#define __ALTERNATIVE_CFG(old_c)  \
> +       old_c "\n"
> +
> +#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> +       __ALTERNATIVE_CFG(old_c)
> +
> +#endif /* __ASSEMBLY__ */
> +#endif /* CONFIG_RISCV_ERRATA_ALTERNATIVE */
> +/*
> + * Usage:
> + *   ALTERNATIVE(old_content, new_content, vendor_id, errata_id, CONFIG_k)
> + * in the assembly code. Otherwise,
> + *   asm(ALTERNATIVE(old_content, new_content, vendor_id, errata_id, CONFIG_k));
> + *
> + * old_content: The old content which is probably replaced with new content.
> + * new_content: The new content.
> + * vendor_id: The CPU vendor ID.
> + * errata_id: The errata ID.
> + * CONFIG_k: The Kconfig of this errata. When Kconfig is disabled, the old
> + *          content will alwyas be executed.
> + */
> +#define ALTERNATIVE(old_content, new_content, vendor_id, errata_id, CONFIG_k) \
> +       _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
> +
> +/*
> + * A vendor wants to replace an old_content, but another vendor has used
> + * ALTERNATIVE() to patch its customized content at the same location. In
> + * this case, this vendor can create a new macro ALTERNATIVE_2() based
> + * on the following sample code and then replace ALTERNATIVE() with
> + * ALTERNATIVE_2() to append its customized content.
> + *
> + * .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> + *                                   new_c_2, vendor_id_2, errata_id_2, enable_2
> + * 886 :
> + *      \old_c
> + * 887 :
> + *      ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
> + *      ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> + * .endm
> + *
> + * #define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
> + *                                   new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2) \
> + *        __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1), \
> + *                                   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2) \
> + *
> + * #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
> + *                                    new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2) \
> + *         _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
> + *                                         new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
> + *
> + */
> +#endif
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> new file mode 100644
> index 000000000000..430bc4fea133
> --- /dev/null
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -0,0 +1,36 @@
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
> +       void *old_ptr;           /* address of original instruciton or data  */
> +       void *alt_ptr;           /* address of replacement instruction or data */
> +       unsigned long vendor_id; /* cpu vendor id */
> +       unsigned long alt_len;   /* The replacement size */
> +       unsigned int errata_id;  /* The errata id */
> +} __packed;
> +
> +struct errata_checkfunc_id {
> +       unsigned long vendor_id;
> +       bool (*func)(struct alt_entry *alt);
> +};
> +
> +#endif
> +#endif
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 9c992a88d858..618d7c5af1a2 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -23,6 +23,7 @@
>  #define REG_L          __REG_SEL(ld, lw)
>  #define REG_S          __REG_SEL(sd, sw)
>  #define REG_SC         __REG_SEL(sc.d, sc.w)
> +#define REG_ASM                __REG_SEL(.dword, .word)
>  #define SZREG          __REG_SEL(8, 4)
>  #define LGREG          __REG_SEL(3, 2)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index caadfc1d7487..87ac65696871 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -115,6 +115,9 @@
>  #define CSR_MIP                        0x344
>  #define CSR_PMPCFG0            0x3a0
>  #define CSR_PMPADDR0           0x3b0
> +#define CSR_MVENDORID          0xf11
> +#define CSR_MARCHID            0xf12
> +#define CSR_MIMPID             0xf13
>  #define CSR_MHARTID            0xf14
>
>  #ifdef CONFIG_RISCV_M_MODE
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> new file mode 100644
> index 000000000000..1b56131431c9
> --- /dev/null
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 Sifive.
> + */
> +#ifndef ASM_ERRATA_LIST_H
> +#define ASM_ERRATA_LIST_H
> +
> +#ifdef CONFIG_ERRATA_SIFIVE
> +#define        ERRATA_SIFIVE_NUMBER 0
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> index 1595c5b60cfd..8a303fb1ee3b 100644
> --- a/arch/riscv/include/asm/sections.h
> +++ b/arch/riscv/include/asm/sections.h
> @@ -11,5 +11,6 @@ extern char _start[];
>  extern char _start_kernel[];
>  extern char __init_data_begin[], __init_data_end[];
>  extern char __init_text_begin[], __init_text_end[];
> +extern char __alt_start[], __alt_end[];
>
>  #endif /* __ASM_SECTIONS_H */
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> new file mode 100644
> index 000000000000..9d934215b3c8
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 SiFive
> + */
> +#ifndef ASM_VENDOR_LIST_H
> +#define ASM_VENDOR_LIST_H
> +
> +#define SIFIVE_VENDOR_ID       0x489
> +
> +#endif
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
>         init_cpu_topology();
> +#ifdef CONFIG_RISCV_ERRATA_ALTERNATIVE
> +       apply_boot_alternatives();
> +#endif
>  }
>
>  void __init smp_prepare_cpus(unsigned int max_cpus)
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index de03cb22d0e9..7e61bc1dc36e 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -90,6 +90,13 @@ SECTIONS
>         }
>
>         __init_data_end = .;
> +
> +       . = ALIGN(8);
> +       .alternative : {
> +               __alt_start = .;
> +               *(.alternative)
> +               __alt_end = .;
> +       }
>         __init_end = .;
>
>         /* Start of data section */
> --
> 2.7.4
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
