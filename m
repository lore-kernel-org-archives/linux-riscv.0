Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBB1C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 11:43:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B502064F69
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 11:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B502064F69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sDJ6aW7vStZmsk2UAcEm+ldLpc3MHLV2P690F74ki/k=; b=YNkgPbAh+BkP6ajxQtp+kmVqS
	oFwW3iNxc0lzeZB5bfGSQ+gisx6uQi2FHr6JTGesT6ikNvUbmgsFaMPK5aH0qnMbwfKRj+bm8SVtR
	CT5bzXm8fCXQOq/kJ+uglMHVdIp6WHFyP9mJKwoIDxJo3s0C1N/O6+iN0rbliKvWsBQ3ZklmJiRiJ
	G54nSwQv2qjrKde4eSdFebQJ49dSgoeblxVALp7wcPBh78kl8dZRSSxL76Fw+dgWouTL5QmtjyPQ5
	WKOWQX/q7hahZon4rBMA7LZBENa27pByuGk37eTyx3mq61K7MEzIeAVMOWVsOJhidfGYNHFLID21P
	9oS1zNGMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMUaF-0032as-GD; Wed, 17 Mar 2021 11:43:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMUaA-0032a5-Ff
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 11:43:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so972658wmc.0
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pRz6O6EXaao/jewuI/udREYpMxfzXVTdPXq+nqFNB8o=;
 b=dRmshHiPzCzmuCNTVzQMlSzYKUYcnSZmTHbkehJVWH0awR31yfjKI5JMVHlumsFOee
 Td1WUNjlkT+cdR/45UKURygVvKZkMdoWf6M/YR1mZPgnfyf0GLPYr/D7pT5/jL0jrPZr
 jn44XBWZrDtAYoI5G5X5GeVKia3udjsbySEC+nZbJO9/6nNxzHI4Zw/bh8h5MQSCpX2C
 CmcHDzONQ7CnLcBNrRXxrN8UeYywAmVh4KCP944ETRpSvQq3F9+PjG6N8nfNp93ufhaZ
 TKcoU7dFCcw1JeKSLdWcxR/kHkFg6VTInR7cY4vQsoQeKO4x4gklWTj5wixj+qzUFtfU
 IJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pRz6O6EXaao/jewuI/udREYpMxfzXVTdPXq+nqFNB8o=;
 b=g/GfGckYX0K8kgBUQIC/X1dI7zdo+Vxhr6peJwZ8i+CaEEfI7bcyB9xSsEiI8zEqAW
 jiRroFV/M9qOHrqLbMc2qtf+fXAxM7VrehKsqkVJF/QMtbkPapJmJ1NfAvqVuxSQjtYO
 niyBgjm8HxrQmn3mQyBq+qjGzghZ996iw+4QkedsnCOlzAKLDiEtbUY3FAxJ4MtlxMAp
 CLS9v5Lrp+Os/IIAnvTPmnRHNtz7DbBW4GXdpyiP+ibeheI3ClOZjqZzd+aqPGlFiezU
 nYAX22uKz4vuITaeV1Y0nAKZtMjYw94kJCYFsOHtlKckwlQcOzgNsNbQqBQ5iXV+EMr8
 Jo+A==
X-Gm-Message-State: AOAM531DvhcLKMSwPsk3s9TWhj4KoF4aBKdMFQye/UH+8SbbgVH63hdo
 vMIYPwd9mJxsYRlDIIlLYHyk0k7STMZoBrOA0Zlilg==
X-Google-Smtp-Source: ABdhPJyoIJPqUkDPbNr0FI/y3UGfJiiZSAYnMcpZU78jRmKcWn5cj9qGbcrr40hq5Wj2xt6ykaDYgE4/6SvgLRecLyk=
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr3308026wmj.185.1615981401844; 
 Wed, 17 Mar 2021 04:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
 <1615973613-22364-4-git-send-email-vincent.chen@sifive.com>
In-Reply-To: <1615973613-22364-4-git-send-email-vincent.chen@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Mar 2021 17:13:09 +0530
Message-ID: <CAAhSdy1y1bmD0V+sqJpQEWoHGn7OkyjPk6tsyKfCG-WuQRZLZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] riscv: sifive: Add SiFive alternative ports
To: Vincent Chen <vincent.chen@sifive.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Frank.Zhao@starfivetech.com, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@kernel.org>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 ruinland@andestech.com, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_114322_686257_C34B8F42 
X-CRM114-Status: GOOD (  29.99  )
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
> Add required ports of the Alternative scheme for SiFive.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/Kconfig.erratas           | 11 ++++++
>  arch/riscv/Kconfig.socs              |  1 +
>  arch/riscv/errata/Makefile           |  1 +
>  arch/riscv/errata/alternative.c      |  5 +++
>  arch/riscv/errata/sifive/Makefile    |  1 +
>  arch/riscv/errata/sifive/errata.c    | 68 ++++++++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/alternative.h |  3 ++
>  7 files changed, 90 insertions(+)
>  create mode 100644 arch/riscv/errata/sifive/Makefile
>  create mode 100644 arch/riscv/errata/sifive/errata.c
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index 4d0bafc536df..e50ab67f4830 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -9,4 +9,15 @@ config RISCV_ERRATA_ALTERNATIVE
>           code patching is performed once in the boot stages. It means
>           that the overhead from this mechanism is just taken once.
>
> +config ERRATA_SIFIVE
> +       bool "SiFive errata"
> +       depends on RISCV_ERRATA_ALTERNATIVE
> +       default y

Remove the "default y" here.

Let the ERRATA Kconfig be explicitly selected from riscv/Kconfig.socs

> +       help
> +         All SiFive errata Kconfig depend on this Kconfig. Disabling
> +         this Kconfig will disable all SiFive errata. Please say "Y"
> +         here if your platform uses SiFive CPU cores.
> +
> +         Otherwise, please say "N" here to avoid unnecessary overhead.
> +
>  endmenu
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 7efcece8896c..b9eda857fc87 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -7,6 +7,7 @@ config SOC_SIFIVE
>         select CLK_SIFIVE
>         select CLK_SIFIVE_PRCI
>         select SIFIVE_PLIC
> +       select ERRATA_SIFIVE
>         help
>           This enables support for SiFive SoC platform hardware.
>
> diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> index 43e6d5424367..b8f8740a3e44 100644
> --- a/arch/riscv/errata/Makefile
> +++ b/arch/riscv/errata/Makefile
> @@ -1 +1,2 @@
>  obj-y  += alternative.o
> +obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
> diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
> index 8efa60ad69b7..3b15885db70b 100644
> --- a/arch/riscv/errata/alternative.c
> +++ b/arch/riscv/errata/alternative.c
> @@ -42,6 +42,11 @@ static void __init init_alternative(void)
>         riscv_fill_cpu_mfr_info();
>
>         switch (cpu_mfr_info.vendor_id) {
> +#ifdef CONFIG_ERRATA_SIFIVE
> +       case SIFIVE_VENDOR_ID:
> +               vendor_patch_func = sifive_errata_patch_func;
> +               break;
> +#endif
>         default:
>                 vendor_patch_func = NULL;
>         }
> diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
> new file mode 100644
> index 000000000000..2d644e19caef
> --- /dev/null
> +++ b/arch/riscv/errata/sifive/Makefile
> @@ -0,0 +1 @@
> +obj-y += errata.o
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> new file mode 100644
> index 000000000000..826cd391fc55
> --- /dev/null
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 Sifive.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/bug.h>
> +#include <asm/patch.h>
> +#include <asm/alternative.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/errata_list.h>
> +
> +struct errata_info_t {
> +       char name[ERRATA_STRING_LENGTH_MAX];
> +       bool (*check_func)(unsigned long  arch_id, unsigned long impid);
> +};
> +
> +static u32 __init sifive_errata_probe(unsigned long archid, unsigned long impid)
> +{
> +       int idx;
> +       u32 cpu_req_errata = 0;
> +
> +       for (idx = 0; idx < ERRATA_SIFIVE_NUMBER; idx++)
> +               if (errata_list[idx].check_func(archid, impid))
> +                       cpu_req_errata |= (1U << idx);
> +
> +       return cpu_req_errata;
> +}
> +
> +static void __init warn_miss_errata(u32 miss_errata)
> +{
> +       int i;
> +
> +       pr_warn("----------------------------------------------------------------\n");
> +       pr_warn("WARNING: Missing the following errata may cause potential issues\n");
> +       for (i = 0; i < ERRATA_SIFIVE_NUMBER; i++)
> +               if (miss_errata & 0x1 << i)
> +                       pr_warn("\tSiFive Errata[%d]:%s\n", i, errata_list[i].name);
> +       pr_warn("Please enable the corresponding Kconfig to apply them\n");
> +       pr_warn("----------------------------------------------------------------\n");
> +}
> +
> +void __init sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> +                                    unsigned long archid, unsigned long impid)
> +{
> +       struct alt_entry *alt;
> +       u32 cpu_req_errata = sifive_errata_probe(archid, impid);
> +       u32 cpu_apply_errata = 0;
> +       u32 tmp;
> +
> +       for (alt = begin; alt < end; alt++) {
> +               if (alt->vendor_id != SIFIVE_VENDOR_ID)
> +                       continue;
> +               if (alt->errata_id >= ERRATA_SIFIVE_NUMBER) {
> +                       WARN(1, "This errata id:%d is not in kernel errata list", alt->errata_id);
> +                       continue;
> +               }
> +
> +               tmp = (1U << alt->errata_id);
> +               if (cpu_req_errata & tmp) {
> +                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +                       cpu_apply_errata |= tmp;
> +               }
> +       }
> +       if (cpu_apply_errata != cpu_req_errata)
> +               warn_miss_errata(cpu_req_errata - cpu_apply_errata);
> +}
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 430bc4fea133..e625d3cafbed 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -32,5 +32,8 @@ struct errata_checkfunc_id {
>         bool (*func)(struct alt_entry *alt);
>  };
>
> +void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> +                             unsigned long archid, unsigned long impid);
> +
>  #endif
>  #endif
> --
> 2.7.4
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Apart from the minor comment above, this patch looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
