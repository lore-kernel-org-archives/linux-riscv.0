Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2A2C4332B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1425264FF5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1425264FF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ngENGJegwUUajRjnWzO3Xx0e89or7B4a0X+treiBhkU=; b=HXJjdGT0M3CJXL6mku7Pl5xWa
	qkrEdD4zBvtchGNJUT5EKtvDEtirvNLimtA00/cE+nwBueXCpEGgdRt8ZOHW5CQPrci/TZnBsA03n
	dOoU/79PE7xU2pWds1BGOw9Zki5gh6y+Wn3qvqZrkvHGuu2MX9lDoOm7c9TIDzgxl3Ezxw7nJWW4k
	YhMVo2k6x4lfxNywdS4RlpB8zND8AWhxj7h8CHHbVyCtrXo3L4ChvgcIxAtaKZ9LzufEFscUYxA1f
	jdrG0rDXPz/rcflmvoCPu51RSG8tJT+VNEhwmsEo8SAexd4qGusNqIxRvgdL1HnhDT38DPkmuFnSo
	bn175YVyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJqdd-0060gM-Dp; Wed, 10 Mar 2021 04:40:01 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJqcx-0060aT-4i
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 04:39:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id w8so865471pjf.4
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 20:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=VqKTdvvrFz/84NmqsNiSgIvr10Nx+Mmgz9miFH9agQk=;
 b=WsKXc9y4pGcxFDXqtUuilN8LwZ+1BHotLx/ghVp1XRksNB5DAAVc2wdCFi45eVuop1
 lsY0L+Yto0GRTbx8IYlgSJ/5bZRmPcvtrj/wAjNhgaMYiR4yAtmW+kN7gBdjo54NAfD6
 WUglZ3ZU8yzC5rb06rdRHseTNpVa1ZTXZK7YDw//yIfii3YxvwTUiW4XMFihpYzvqd7i
 HM68OJVVNBkimgLbXziipnITf/mfUy6chSLpPrlxptXZjHwIzsNFEoRzJJqBgDazt4Vl
 tjHAeBkvpiWMQqyljk6SCxpK5lFh7ZNYtjt/vOxuPZj/+MZ1NpzorVuAiRacNvB4TTt7
 Jb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=VqKTdvvrFz/84NmqsNiSgIvr10Nx+Mmgz9miFH9agQk=;
 b=CE4jxusrQCWxhdYkqfTnQpi+XugJRH4zjAOoQEh+eR6Fi6wRegEI045io44M3Zi/5B
 fH1Hs4mV7tfbZXmFXjG2tjzX8lPbuw7L/B9vvILYFyZK3t1vBC1wDfUYmM2WFQ9l6Srf
 fsG8zwsAME/4f349nW1cbQq0tBube95+jAQMOXhq3b+JVb21caXw6vRycEDCpcKadsPA
 VqcWn2eDeGZWq3F4eysKM/F/G3G7cPLG6pzMskqVAt8J8c8WOky+uaLehpiWCxV2FVgP
 tfm21XeYetUGrRNZvKvh0cQ9axr+EAtRQuOR/gM7lCFnVsiFey63msuhZUrKz7ARWZPp
 QL2w==
X-Gm-Message-State: AOAM530tFEKGmkC7b6bkgSJjXqjfb9u7rNXeX74quiH1YguLxvWbCXpQ
 nQXUb3jJsbKC6pjuqZ9BF+MJ0y9vITcoZg==
X-Google-Smtp-Source: ABdhPJyVtSJ4XvqgBRDDEl/XLyn9IHEcAUOXiB31B5MwVo/WQ/T98r4UIPgxxwya0UnszVO/3ZGzRQ==
X-Received: by 2002:a17:90b:4c4d:: with SMTP id
 np13mr1588836pjb.81.1615351157295; 
 Tue, 09 Mar 2021 20:39:17 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 10sm9607864pfp.4.2021.03.09.20.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 20:39:16 -0800 (PST)
Date: Tue, 09 Mar 2021 20:39:16 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 20:23:52 PST (-0800)
Subject: Re: [RFC patch 4/4] riscv: sifive: apply errata "cip-453" patch
In-Reply-To: <1615175897-23509-5-git-send-email-vincent.chen@sifive.com>
CC: linux-riscv@lists.infradead.org, Frank.Zhao@starfivetech.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 guoren@kernel.org, alankao@andestech.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-7543e0a9-4633-46f3-9a59-32d5c7aea9de@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_043924_676491_DA23929C 
X-CRM114-Status: GOOD (  41.40  )
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

On Sun, 07 Mar 2021 19:58:17 PST (-0800), vincent.chen@sifive.com wrote:
> Add sign extension to the $badaddr before addressing the instruction page
> fault and instruction access fault to workaround the issue "cip-453".

The documentation I see quite explicitly says that this bug doesn't manifest in 
Linux.  IDK if I'm just reading an old one, but if not that should be fixed as 
presumably it does actually manifest?

> To avoid affecting the existing code sequence, this patch will creates two
> trampolines to add sign extension to the $badaddr. By the "alternative"
> mechanism, these two trampolines will replace the original exception
> handler of instruction page fault and instruction access fault in the
> excp_vect_table. In this case, only the specific SiFive CPU core jumps to
> the do_page_fault and do_trap_insn_fault through these two trampolines.
> Other CPUs are not affected.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/Kconfig.erratas                | 20 +++++++++++
>  arch/riscv/Kconfig.socs                   |  1 +
>  arch/riscv/errata/Makefile                |  1 +
>  arch/riscv/errata/sifive/Makefile         |  2 ++
>  arch/riscv/errata/sifive/errata.c         | 56 +++++++++++++++++++++++++++++++
>  arch/riscv/errata/sifive/errata_cip_453.S | 34 +++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h      |  3 +-
>  arch/riscv/kernel/entry.S                 | 12 +++++--
>  8 files changed, 126 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/errata/sifive/Makefile
>  create mode 100644 arch/riscv/errata/sifive/errata.c
>  create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index 4d0bafc536df..907fa6b13ee2 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -9,4 +9,24 @@ config RISCV_ERRATA_ALTERNATIVE
>  	  code patching is performed once in the boot stages. It means
>  	  that the overhead from this mechanism is just taken once.
>
> +config ERRATA_SIFIVE
> +	bool "SiFive errata"
> +	help
> +	  All SiFive errata Kconfig depend on this Kconfig. Please say "Y"
> +	  here if your platform uses SiFive CPU cores.
> +
> +	  Otherwise, please say "N" here to avoid unnecessary overhead.
> +
> +config ERRATA_SIFIVE_CIP_453
> +	bool "Apply SiFive errata CIP-453"
> +	depends on ERRATA_SIFIVE
> +	depends on RISCV_ERRATA_ALTERNATIVE
> +	default y
> +	help
> +	  This will apply the SiFive CIP-453 errata to add sign extension
> +	  to the $badaddr when exception type is instruction page fault
> +	  and instruction access fault.
> +
> +	  If you don't know what to do here, say "Y".
> +
>  endmenu
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 7efcece8896c..b9eda857fc87 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -7,6 +7,7 @@ config SOC_SIFIVE
>  	select CLK_SIFIVE
>  	select CLK_SIFIVE_PRCI
>  	select SIFIVE_PLIC
> +	select ERRATA_SIFIVE
>  	help
>  	  This enables support for SiFive SoC platform hardware.
>
> diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> index 43e6d5424367..b8f8740a3e44 100644
> --- a/arch/riscv/errata/Makefile
> +++ b/arch/riscv/errata/Makefile
> @@ -1 +1,2 @@
>  obj-y	+= alternative.o
> +obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
> diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
> new file mode 100644
> index 000000000000..b7f4cd7ee185
> --- /dev/null
> +++ b/arch/riscv/errata/sifive/Makefile
> @@ -0,0 +1,2 @@
> +obj-y += altern_ops.o
> +obj-y += errata_cip_453.o
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> new file mode 100644
> index 000000000000..0b0a9af42a55
> --- /dev/null
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 Sifive.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/bug.h>
> +#include <asm/alternative.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/errata_list.h>
> +
> +#define MAX_ERRATA_IMPID 5

Why 5?  I only see 2.

> +struct errata_info_t {
> +	char name[ERRATA_STRING_LENGTH_MAX];
> +	unsigned long arch_id;
> +	unsigned long imp_id[MAX_ERRATA_IMPID];
> +} errata_info;
> +
> +struct errata_info_t sifive_errata_list[ERRATA_NUMBER] = {
> +	{
> +		.name = "cip-453",
> +		.arch_id = 0x8000000000000007,
> +		.imp_id = {
> +			0x20181004, 0x00200504

Is there any way to figure these out from the documentation?

> +		},
> +	},
> +};
> +
> +static inline bool __init cpu_info_cmp(struct errata_info_t *errata, struct alt_entry *alt)
> +{
> +	int i;
> +
> +	if (errata->arch_id != cpu_mfr_info.arch_id)
> +		return false;
> +
> +	for (i = 0; i < MAX_ERRATA_IMPID && errata->imp_id[i]; i++)
> +		if (errata->imp_id[i] == cpu_mfr_info.imp_id)
> +			return true;
> +
> +	return false;
> +}
> +
> +static bool __init sifive_errata_check(struct alt_entry *alt)
> +{
> +	if (cpu_mfr_info.vendor_id != alt->vendor_id)
> +		return false;
> +
> +	if (likely(alt->errata_id < ERRATA_NUMBER))
> +		return cpu_info_cmp(&sifive_errata_list[alt->errata_id], alt);
> +
> +	WARN_ON(1);
> +	return false;
> +}
> +
> +REGISTER_ERRATA_CHECKFUNC(sifive_errata_check, SIFIVE_VENDOR_ID);
> diff --git a/arch/riscv/errata/sifive/errata_cip_453.S b/arch/riscv/errata/sifive/errata_cip_453.S
> new file mode 100644
> index 000000000000..34d0fe26172e
> --- /dev/null
> +++ b/arch/riscv/errata/sifive/errata_cip_453.S
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 SiFive
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm/asm-offsets.h>
> +#include <asm/alternative.h>
> +
> +.macro ADD_SIGN_EXT pt_reg badaddr tmp_reg
> +	REG_L \badaddr, PT_BADADDR(\pt_reg)
> +	li \tmp_reg,1
> +	slli \tmp_reg,\tmp_reg,0x26
> +	and \tmp_reg,\tmp_reg,\badaddr
> +	beqz \tmp_reg, 1f
> +	li \tmp_reg,-1
> +	slli \tmp_reg,\tmp_reg,0x27
> +	or \badaddr,\tmp_reg,\badaddr
> +	REG_S \badaddr, PT_BADADDR(\pt_reg)
> +1:
> +.endm
> +
> +ENTRY(do_page_fault_trampoline)
> +	ADD_SIGN_EXT a0, t0, t1
> +	la t0, do_page_fault
> +	jr t0
> +END(do_page_fault_trampoline)
> +
> +ENTRY(do_trap_insn_fault_trampoline)
> +	ADD_SIGN_EXT a0, t0, t1
> +	la t0, do_trap_insn_fault
> +	jr t0
> +END(do_trap_insn_fault_trampoline)

These should get names that are more specific to the errata in question, as 
they're global symbols.

> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 5e5a1fcd90ba..d3752c8eff1f 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -4,5 +4,6 @@
>   */
>
>  #ifdef CONFIG_SOC_SIFIVE
> -#define	ERRATA_NUMBER 0
> +#define	ERRATA_CIP_453 0
> +#define	ERRATA_NUMBER 1
>  #endif
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 744f3209c48d..821e86ee67e4 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -12,6 +12,9 @@
>  #include <asm/unistd.h>
>  #include <asm/thread_info.h>
>  #include <asm/asm-offsets.h>
> +#include <asm/alternative.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/errata_list.h>
>
>  #if !IS_ENABLED(CONFIG_PREEMPTION)
>  .set resume_kernel, restore_all
> @@ -450,7 +453,9 @@ ENDPROC(__switch_to)
>  	/* Exception vector table */
>  ENTRY(excp_vect_table)
>  	RISCV_PTR do_trap_insn_misaligned
> -	RISCV_PTR do_trap_insn_fault
> +	ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),
> +		    __stringify(RISCV_PTR do_trap_insn_fault_trampoline),
> +		    SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)

You've only got the instruction patching function in the errata framework, but 
this is data.  It doesn't really matter, as we fence before the other CPUs come 
online, but a comment in there that both are OK would be good.

>  	RISCV_PTR do_trap_insn_illegal
>  	RISCV_PTR do_trap_break
>  	RISCV_PTR do_trap_load_misaligned
> @@ -461,7 +466,10 @@ ENTRY(excp_vect_table)
>  	RISCV_PTR do_trap_ecall_s
>  	RISCV_PTR do_trap_unknown
>  	RISCV_PTR do_trap_ecall_m
> -	RISCV_PTR do_page_fault   /* instruction page fault */
> +	/* instruciton page fault */
> +	ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),
> +		    __stringify(RISCV_PTR do_page_fault_trampoline),
> +		    SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
>  	RISCV_PTR do_page_fault   /* load page fault */
>  	RISCV_PTR do_trap_unknown
>  	RISCV_PTR do_page_fault   /* store page fault */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
