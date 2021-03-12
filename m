Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9FBC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 03:50:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE1364ED6
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 03:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FE1364ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eahbTlORh6NuskP4wSixh9Y0KEmRZtnxAHNC8NIHSqw=; b=WkCshaCKDsKKuEvPIr4CyaGNt
	udbeNKaKoM0D1zlX/GwJRdKrqDp9mhnE8zZWtbtppNeUfClA0A7o9S67UQMYtTAjJf4o5t0XpIosI
	LLmJwAAdc21GHGcn6x2zELYckAWM+9G43z/VEnEQCoJ390N35uZtbokPRTdqbe51V3IGAsagDJz6r
	VaPxssH1n4QHKd3mBkIygBNruFgvciBozBuusEjTC3B7BFN/JCugnnUZkxGevdpwNoUBPKeS6s0XR
	GG2FWLPqIlqc7xg/Z63IckBuzwhkFAcFvWconm0O6MY6/6ZBv+U+3eYuIJx+676+04LpzqjZIE912
	0BcNNvyYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKYok-00AbCk-UY; Fri, 12 Mar 2021 03:50:27 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKYod-00AbCH-UH
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 03:50:24 +0000
Received: by mail-pg1-x52c.google.com with SMTP id n10so14995064pgl.10
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 19:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qZ7Iivt0WYzQrEf1Ow8/OnLQJANtoanIhrY+9zrrV2I=;
 b=TqZ5yg0O6bRxY0uRUR+vgsJ53ucPPgXYOuADM+HHO2xzLYMLcVr/M9XYmpikG6JARa
 N5dE7tbaial+YtFwmCQ0MzdAdB9xomh2ydMvAqOF9+MxNFtTvIXHH4yIh+997HIMcS8z
 xT7MM4vkLM2Zi0MSjsVEqKVOGzCUh09qscgLpXyUn7Xg/hA0+XBSYJVEFmXIJ3ApfQZh
 owG+iqDReUL8o2eWjaeEl69Ns1zLuV17xBJBVcuOVCCt4ZE22IaU3WpOcWZieoz1GADk
 EIBkWnqOd+O7nsdO+K++6aww1jUZrXxTYaUQzn/6A0slTPciQ/THuDyMUQfgZFbno/9O
 2xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qZ7Iivt0WYzQrEf1Ow8/OnLQJANtoanIhrY+9zrrV2I=;
 b=PuC59R4x+cahi8YabkHBZi+rc3yXXzSfNM25gcUE6aapiB1ABWu9ow34vNLFHq/yoz
 pz7kw/0k79F+MWbIUsGw0b4Ub+pDjkTNmqMUkyk2VhC830hc80R7S+qYVXmX11ptiRsi
 anSX5Yo17Z8AYO+xATTr08cqE8IlQckWVTdPzjNO6OjU24szl0KB3bmwYtcq+tIQvqUF
 mJkQ/oEmcm8vUVtQIGu8Lw+TsUAC67oyRx+imBVVlNkTK6oPpUqkuIaV0SEZmK98lW1D
 /JkDJkK7NlnT/+IH8gTl/Fy8ephBHVyj5JY7kC8SzqV8UOqIkTNHuwrK0NaBQ5tSU3yB
 b2Dg==
X-Gm-Message-State: AOAM532jc9s2v18cfIR1H6IbCkAZXLGoYakuXDM9ToO7S12+8PWGY6PJ
 9AnTuJrGbR3nmfSnOniN4rnHNXe15VoL5aNiU4DseZzj/2SRAQ==
X-Google-Smtp-Source: ABdhPJzsrxQEoxXZ6ISFKI7TxXV/4IqILY0UjSQcpUKXXsSSk2eoTfre6pBo6zax6OaVwSi1Dsdobp4/Nso69sDKWL4=
X-Received: by 2002:a63:318b:: with SMTP id x133mr1505255pgx.233.1615521018012; 
 Thu, 11 Mar 2021 19:50:18 -0800 (PST)
MIME-Version: 1.0
References: <1615175897-23509-5-git-send-email-vincent.chen@sifive.com>
 <mhng-7543e0a9-4633-46f3-9a59-32d5c7aea9de@penguin>
In-Reply-To: <mhng-7543e0a9-4633-46f3-9a59-32d5c7aea9de@penguin>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 12 Mar 2021 11:50:07 +0800
Message-ID: <CABvJ_xj366JhM7-H4HMf+9XpyoM1G81kpA9tskfyyQwMBw+OYQ@mail.gmail.com>
Subject: Re: [RFC patch 4/4] riscv: sifive: apply errata "cip-453" patch
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Frank.Zhao@starfivetech.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Guo Ren <guoren@kernel.org>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_035020_737307_1B28EB56 
X-CRM114-Status: GOOD (  44.82  )
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

On Wed, Mar 10, 2021 at 12:39 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 07 Mar 2021 19:58:17 PST (-0800), vincent.chen@sifive.com wrote:
> > Add sign extension to the $badaddr before addressing the instruction page
> > fault and instruction access fault to workaround the issue "cip-453".
>
> The documentation I see quite explicitly says that this bug doesn't manifest in
> Linux.  IDK if I'm just reading an old one, but if not that should be fixed as
> presumably it does actually manifest?
>
> > To avoid affecting the existing code sequence, this patch will creates two
> > trampolines to add sign extension to the $badaddr. By the "alternative"
> > mechanism, these two trampolines will replace the original exception
> > handler of instruction page fault and instruction access fault in the
> > excp_vect_table. In this case, only the specific SiFive CPU core jumps to
> > the do_page_fault and do_trap_insn_fault through these two trampolines.
> > Other CPUs are not affected.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  arch/riscv/Kconfig.erratas                | 20 +++++++++++
> >  arch/riscv/Kconfig.socs                   |  1 +
> >  arch/riscv/errata/Makefile                |  1 +
> >  arch/riscv/errata/sifive/Makefile         |  2 ++
> >  arch/riscv/errata/sifive/errata.c         | 56 +++++++++++++++++++++++++++++++
> >  arch/riscv/errata/sifive/errata_cip_453.S | 34 +++++++++++++++++++
> >  arch/riscv/include/asm/errata_list.h      |  3 +-
> >  arch/riscv/kernel/entry.S                 | 12 +++++--
> >  8 files changed, 126 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/riscv/errata/sifive/Makefile
> >  create mode 100644 arch/riscv/errata/sifive/errata.c
> >  create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S
> >
> > diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> > index 4d0bafc536df..907fa6b13ee2 100644
> > --- a/arch/riscv/Kconfig.erratas
> > +++ b/arch/riscv/Kconfig.erratas
> > @@ -9,4 +9,24 @@ config RISCV_ERRATA_ALTERNATIVE
> >         code patching is performed once in the boot stages. It means
> >         that the overhead from this mechanism is just taken once.
> >
> > +config ERRATA_SIFIVE
> > +     bool "SiFive errata"
> > +     help
> > +       All SiFive errata Kconfig depend on this Kconfig. Please say "Y"
> > +       here if your platform uses SiFive CPU cores.
> > +
> > +       Otherwise, please say "N" here to avoid unnecessary overhead.
> > +
> > +config ERRATA_SIFIVE_CIP_453
> > +     bool "Apply SiFive errata CIP-453"
> > +     depends on ERRATA_SIFIVE
> > +     depends on RISCV_ERRATA_ALTERNATIVE
> > +     default y
> > +     help
> > +       This will apply the SiFive CIP-453 errata to add sign extension
> > +       to the $badaddr when exception type is instruction page fault
> > +       and instruction access fault.
> > +
> > +       If you don't know what to do here, say "Y".
> > +
> >  endmenu
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 7efcece8896c..b9eda857fc87 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -7,6 +7,7 @@ config SOC_SIFIVE
> >       select CLK_SIFIVE
> >       select CLK_SIFIVE_PRCI
> >       select SIFIVE_PLIC
> > +     select ERRATA_SIFIVE
> >       help
> >         This enables support for SiFive SoC platform hardware.
> >
> > diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> > index 43e6d5424367..b8f8740a3e44 100644
> > --- a/arch/riscv/errata/Makefile
> > +++ b/arch/riscv/errata/Makefile
> > @@ -1 +1,2 @@
> >  obj-y        += alternative.o
> > +obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
> > diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
> > new file mode 100644
> > index 000000000000..b7f4cd7ee185
> > --- /dev/null
> > +++ b/arch/riscv/errata/sifive/Makefile
> > @@ -0,0 +1,2 @@
> > +obj-y += altern_ops.o
> > +obj-y += errata_cip_453.o
> > diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> > new file mode 100644
> > index 000000000000..0b0a9af42a55
> > --- /dev/null
> > +++ b/arch/riscv/errata/sifive/errata.c
> > @@ -0,0 +1,56 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2021 Sifive.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/string.h>
> > +#include <linux/bug.h>
> > +#include <asm/alternative.h>
> > +#include <asm/vendorid_list.h>
> > +#include <asm/errata_list.h>
> > +
> > +#define MAX_ERRATA_IMPID 5
>
> Why 5?  I only see 2.
>
This is my mistake. I forgot to modify it after I completed some
testing. I will modify it.

> > +struct errata_info_t {
> > +     char name[ERRATA_STRING_LENGTH_MAX];
> > +     unsigned long arch_id;
> > +     unsigned long imp_id[MAX_ERRATA_IMPID];
> > +} errata_info;
> > +
> > +struct errata_info_t sifive_errata_list[ERRATA_NUMBER] = {
> > +     {
> > +             .name = "cip-453",
> > +             .arch_id = 0x8000000000000007,
> > +             .imp_id = {
> > +                     0x20181004, 0x00200504
>
> Is there any way to figure these out from the documentation?
>
Sorry. Currently, there is no public document to record the information.
> > +             },
> > +     },
> > +};
> > +
> > +static inline bool __init cpu_info_cmp(struct errata_info_t *errata, struct alt_entry *alt)
> > +{
> > +     int i;
> > +
> > +     if (errata->arch_id != cpu_mfr_info.arch_id)
> > +             return false;
> > +
> > +     for (i = 0; i < MAX_ERRATA_IMPID && errata->imp_id[i]; i++)
> > +             if (errata->imp_id[i] == cpu_mfr_info.imp_id)
> > +                     return true;
> > +
> > +     return false;
> > +}
> > +
> > +static bool __init sifive_errata_check(struct alt_entry *alt)
> > +{
> > +     if (cpu_mfr_info.vendor_id != alt->vendor_id)
> > +             return false;
> > +
> > +     if (likely(alt->errata_id < ERRATA_NUMBER))
> > +             return cpu_info_cmp(&sifive_errata_list[alt->errata_id], alt);
> > +
> > +     WARN_ON(1);
> > +     return false;
> > +}
> > +
> > +REGISTER_ERRATA_CHECKFUNC(sifive_errata_check, SIFIVE_VENDOR_ID);
> > diff --git a/arch/riscv/errata/sifive/errata_cip_453.S b/arch/riscv/errata/sifive/errata_cip_453.S
> > new file mode 100644
> > index 000000000000..34d0fe26172e
> > --- /dev/null
> > +++ b/arch/riscv/errata/sifive/errata_cip_453.S
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2021 SiFive
> > + */
> > +
> > +#include <linux/linkage.h>
> > +#include <asm/asm.h>
> > +#include <asm/asm-offsets.h>
> > +#include <asm/alternative.h>
> > +
> > +.macro ADD_SIGN_EXT pt_reg badaddr tmp_reg
> > +     REG_L \badaddr, PT_BADADDR(\pt_reg)
> > +     li \tmp_reg,1
> > +     slli \tmp_reg,\tmp_reg,0x26
> > +     and \tmp_reg,\tmp_reg,\badaddr
> > +     beqz \tmp_reg, 1f
> > +     li \tmp_reg,-1
> > +     slli \tmp_reg,\tmp_reg,0x27
> > +     or \badaddr,\tmp_reg,\badaddr
> > +     REG_S \badaddr, PT_BADADDR(\pt_reg)
> > +1:
> > +.endm
> > +
> > +ENTRY(do_page_fault_trampoline)
> > +     ADD_SIGN_EXT a0, t0, t1
> > +     la t0, do_page_fault
> > +     jr t0
> > +END(do_page_fault_trampoline)
> > +
> > +ENTRY(do_trap_insn_fault_trampoline)
> > +     ADD_SIGN_EXT a0, t0, t1
> > +     la t0, do_trap_insn_fault
> > +     jr t0
> > +END(do_trap_insn_fault_trampoline)
>
> These should get names that are more specific to the errata in question, as
> they're global symbols.
>
OK
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > index 5e5a1fcd90ba..d3752c8eff1f 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -4,5 +4,6 @@
> >   */
> >
> >  #ifdef CONFIG_SOC_SIFIVE
> > -#define      ERRATA_NUMBER 0
> > +#define      ERRATA_CIP_453 0
> > +#define      ERRATA_NUMBER 1
> >  #endif
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 744f3209c48d..821e86ee67e4 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -12,6 +12,9 @@
> >  #include <asm/unistd.h>
> >  #include <asm/thread_info.h>
> >  #include <asm/asm-offsets.h>
> > +#include <asm/alternative.h>
> > +#include <asm/vendorid_list.h>
> > +#include <asm/errata_list.h>
> >
> >  #if !IS_ENABLED(CONFIG_PREEMPTION)
> >  .set resume_kernel, restore_all
> > @@ -450,7 +453,9 @@ ENDPROC(__switch_to)
> >       /* Exception vector table */
> >  ENTRY(excp_vect_table)
> >       RISCV_PTR do_trap_insn_misaligned
> > -     RISCV_PTR do_trap_insn_fault
> > +     ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),
> > +                 __stringify(RISCV_PTR do_trap_insn_fault_trampoline),
> > +                 SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
>
> You've only got the instruction patching function in the errata framework, but
> this is data.  It doesn't really matter, as we fence before the other CPUs come
> online, but a comment in there that both are OK would be good.
>
OK. I got it. Thanks
> >       RISCV_PTR do_trap_insn_illegal
> >       RISCV_PTR do_trap_break
> >       RISCV_PTR do_trap_load_misaligned
> > @@ -461,7 +466,10 @@ ENTRY(excp_vect_table)
> >       RISCV_PTR do_trap_ecall_s
> >       RISCV_PTR do_trap_unknown
> >       RISCV_PTR do_trap_ecall_m
> > -     RISCV_PTR do_page_fault   /* instruction page fault */
> > +     /* instruciton page fault */
> > +     ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),
> > +                 __stringify(RISCV_PTR do_page_fault_trampoline),
> > +                 SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
> >       RISCV_PTR do_page_fault   /* load page fault */
> >       RISCV_PTR do_trap_unknown
> >       RISCV_PTR do_page_fault   /* store page fault */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
