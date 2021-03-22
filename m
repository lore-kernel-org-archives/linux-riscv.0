Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A69C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 06:08:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E2261927
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 06:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E2261927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7im1L9AQ/sndZVg/HLE/OQCs5AQ0sJHMqzLE6dhd/tg=; b=DfZeQM2qja8V/mY8bV/kWHy3S
	6twh0u+808v9ruOc6LHQ/tC1jbyhn4AA18YhvIzRxE5PSCqo9GxeyZD0+CqvWLIATH38z084Qf3/9
	MLyhYdZ1tlttsXFo0LEH7BZoa4MnmW7f5faAUz2Z2i7oe5t+4RFzjowVtujBTrqEi8bwQ/ZcDuNIj
	yAht1bxLPN/bjVZmtT1CE2reVR3a55BC/xbFp5he8u//B/+CyX+VL+kDWrhIMlrooRVC2swnvHrOe
	qRTqX0d3bQ7nyRN8f9THLMRAo/tNHBjkGqxFo8Ln6gnH15vSsq7UcjjMAZkqHpJTE0u6u/qVmZRdr
	XfnRzSQYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lODk0-00AzjS-0x; Mon, 22 Mar 2021 06:08:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lODjp-00Azhk-0H
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 06:08:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k8so15334532wrc.3
 for <linux-riscv@lists.infradead.org>; Sun, 21 Mar 2021 23:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hAU3O+yRb3nAi7k1AFnStv9At+VqNLLtbkc/gG8qapA=;
 b=F55DCvophTtlxhN4zUDe9l5hSx7Hos+VwMwWSeK1dDTu2127A09fVNUE8aehFq6ydI
 BPuOlBXBMIzd5kf8KVhV99oqrdFsTNa8xT6Rz0I9as6MPCyGlz+iZatEXhEFwt/GAZJI
 XfeBMk82F7MncRLovUTTQGjWuKM0qWfKQFQcDpWzeIY2feP80WoCwuTNcSaVoyQosI+I
 dJtuz6IxyqeaNNgvVCbOuyMaMtNDq6GILPz9ne7LhUsoQs/kFkm8ZqmE+/oU82NkU7RC
 tKBPA+z8T8HQjlkiA+98BFv7CpuH+ymntGR4ub2icHJeXZ3Y4GKmcBgtEZwm86lO1Q0L
 yvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hAU3O+yRb3nAi7k1AFnStv9At+VqNLLtbkc/gG8qapA=;
 b=EbUGtwxrJYoAmq+9GhdRomXLoKN7wfKd3LYaeLrxqmkzHfXPBktadMKhkhlnwq21NT
 p+Y1EIV74W2Zwzbs8hgUe8VIx47mEYC5XQOUmvRKzWEwoV3oRp290jWCPXO6fa3sfP7U
 3CFeLUO1FdNN6IMCY8yyHqztfJ3mDZXLCLl/+PWjTAcaKU851NUzkiFhU4gV3thJRQh5
 0uD81hR+jqAh8vK2nfUU/EjJIg8MnW5czFhBJ3DZ0Cf+ZtjaM0+4amzeyU2GMXvM5OcC
 dr+HGbDSvkSv+kkbU55LJ5Yd61k2eKG4fR8IEmcQ/xJfqlhyg+MAd8rFXXPy5bMYoYuB
 rLeQ==
X-Gm-Message-State: AOAM530S1Smk9GJv27e6nqKF/PmAnjXIo33/RapxJOsFVDzJBOfUlbOG
 QPYiB1f8OD3mrTnIYQySIeRBENyfm5P9gAkEuaHU1Q==
X-Google-Smtp-Source: ABdhPJxXAcVQo7uQ33ZxvxCk78WGKY1s3GRoC1xmQDQprGnGXEv+11EmeNljkAM572mH1KT1Zdqo1fK/cLTMi3p9VQM=
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr16510747wrx.356.1616393307509; 
 Sun, 21 Mar 2021 23:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
 <1615973613-22364-4-git-send-email-vincent.chen@sifive.com>
 <CAAhSdy1y1bmD0V+sqJpQEWoHGn7OkyjPk6tsyKfCG-WuQRZLZA@mail.gmail.com>
 <CABvJ_xigsjJCF5uj6epEpbs60g41My8VWXszPUbcE_J4XunCmg@mail.gmail.com>
 <CABvJ_xjn7nU62Om5R5FZ-4Lpok_BCTN2eYHCsZCJtUQ98taHAA@mail.gmail.com>
In-Reply-To: <CABvJ_xjn7nU62Om5R5FZ-4Lpok_BCTN2eYHCsZCJtUQ98taHAA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Mar 2021 11:38:16 +0530
Message-ID: <CAAhSdy1sXxcTvZ4FcDxt0L2uH-Ee0t5HGas75OgzXFovrY10Gw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] riscv: sifive: Add SiFive alternative ports
To: Vincent Chen <vincent.chen@sifive.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Frank.Zhao@starfivetech.com, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@kernel.org>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Ruinland ChuanTzu Tsai <ruinland@andestech.com>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_060829_436224_441F5419 
X-CRM114-Status: GOOD (  38.83  )
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

On Mon, Mar 22, 2021 at 11:10 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> On Mon, Mar 22, 2021 at 8:26 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > On Wed, Mar 17, 2021 at 7:43 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Wed, Mar 17, 2021 at 3:04 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> > > >
> > > > Add required ports of the Alternative scheme for SiFive.
> > > >
> > > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > > ---
> > > >  arch/riscv/Kconfig.erratas           | 11 ++++++
> > > >  arch/riscv/Kconfig.socs              |  1 +
> > > >  arch/riscv/errata/Makefile           |  1 +
> > > >  arch/riscv/errata/alternative.c      |  5 +++
> > > >  arch/riscv/errata/sifive/Makefile    |  1 +
> > > >  arch/riscv/errata/sifive/errata.c    | 68 ++++++++++++++++++++++++++++++++++++
> > > >  arch/riscv/include/asm/alternative.h |  3 ++
> > > >  7 files changed, 90 insertions(+)
> > > >  create mode 100644 arch/riscv/errata/sifive/Makefile
> > > >  create mode 100644 arch/riscv/errata/sifive/errata.c
> > > >
> > > > diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> > > > index 4d0bafc536df..e50ab67f4830 100644
> > > > --- a/arch/riscv/Kconfig.erratas
> > > > +++ b/arch/riscv/Kconfig.erratas
> > > > @@ -9,4 +9,15 @@ config RISCV_ERRATA_ALTERNATIVE
> > > >           code patching is performed once in the boot stages. It means
> > > >           that the overhead from this mechanism is just taken once.
> > > >
> > > > +config ERRATA_SIFIVE
> > > > +       bool "SiFive errata"
> > > > +       depends on RISCV_ERRATA_ALTERNATIVE
> > > > +       default y
> > >
> > > Remove the "default y" here.
> > >
> > > Let the ERRATA Kconfig be explicitly selected from riscv/Kconfig.socs
> > >
> > This is a good suggestion. I will modify it in my next version patch.
> > Thank you,
> >
> Sorry, I found the "default y" may not be removed here. It is because
> SiFive's customers possibly only license our Core IP. In this case, it
> does not enable CONFIG_SOC_SIFIVE. Therefore, I prefer to keep the
> "default y" feature. (In this patch, I have made the CONFIG_SOC_SIFIVE
> select the CONFIG_SOC_SIFIVE )

If you are using SiFive IP for your <xyz> SOC then your
CONFIG_SOC_<xyz> in Kconfig option should select
ERRATA_SIFIVE

Basically, SOC Kconfig options should explicitly select required
ERRATA configs so that if someone wants to disable ERRATs from
menuconfig then it can be easily done without knowledge of which
SOCs need which ERRATAs.

Regards,
Anup

>
> > > > +       help
> > > > +         All SiFive errata Kconfig depend on this Kconfig. Disabling
> > > > +         this Kconfig will disable all SiFive errata. Please say "Y"
> > > > +         here if your platform uses SiFive CPU cores.
> > > > +
> > > > +         Otherwise, please say "N" here to avoid unnecessary overhead.
> > > > +
> > > >  endmenu
> > > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > > index 7efcece8896c..b9eda857fc87 100644
> > > > --- a/arch/riscv/Kconfig.socs
> > > > +++ b/arch/riscv/Kconfig.socs
> > > > @@ -7,6 +7,7 @@ config SOC_SIFIVE
> > > >         select CLK_SIFIVE
> > > >         select CLK_SIFIVE_PRCI
> > > >         select SIFIVE_PLIC
> > > > +       select ERRATA_SIFIVE
> > > >         help
> > > >           This enables support for SiFive SoC platform hardware.
> > > >
> > > > diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> > > > index 43e6d5424367..b8f8740a3e44 100644
> > > > --- a/arch/riscv/errata/Makefile
> > > > +++ b/arch/riscv/errata/Makefile
> > > > @@ -1 +1,2 @@
> > > >  obj-y  += alternative.o
> > > > +obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
> > > > diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
> > > > index 8efa60ad69b7..3b15885db70b 100644
> > > > --- a/arch/riscv/errata/alternative.c
> > > > +++ b/arch/riscv/errata/alternative.c
> > > > @@ -42,6 +42,11 @@ static void __init init_alternative(void)
> > > >         riscv_fill_cpu_mfr_info();
> > > >
> > > >         switch (cpu_mfr_info.vendor_id) {
> > > > +#ifdef CONFIG_ERRATA_SIFIVE
> > > > +       case SIFIVE_VENDOR_ID:
> > > > +               vendor_patch_func = sifive_errata_patch_func;
> > > > +               break;
> > > > +#endif
> > > >         default:
> > > >                 vendor_patch_func = NULL;
> > > >         }
> > > > diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
> > > > new file mode 100644
> > > > index 000000000000..2d644e19caef
> > > > --- /dev/null
> > > > +++ b/arch/riscv/errata/sifive/Makefile
> > > > @@ -0,0 +1 @@
> > > > +obj-y += errata.o
> > > > diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> > > > new file mode 100644
> > > > index 000000000000..826cd391fc55
> > > > --- /dev/null
> > > > +++ b/arch/riscv/errata/sifive/errata.c
> > > > @@ -0,0 +1,68 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (C) 2021 Sifive.
> > > > + */
> > > > +
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/string.h>
> > > > +#include <linux/bug.h>
> > > > +#include <asm/patch.h>
> > > > +#include <asm/alternative.h>
> > > > +#include <asm/vendorid_list.h>
> > > > +#include <asm/errata_list.h>
> > > > +
> > > > +struct errata_info_t {
> > > > +       char name[ERRATA_STRING_LENGTH_MAX];
> > > > +       bool (*check_func)(unsigned long  arch_id, unsigned long impid);
> > > > +};
> > > > +
> > > > +static u32 __init sifive_errata_probe(unsigned long archid, unsigned long impid)
> > > > +{
> > > > +       int idx;
> > > > +       u32 cpu_req_errata = 0;
> > > > +
> > > > +       for (idx = 0; idx < ERRATA_SIFIVE_NUMBER; idx++)
> > > > +               if (errata_list[idx].check_func(archid, impid))
> > > > +                       cpu_req_errata |= (1U << idx);
> > > > +
> > > > +       return cpu_req_errata;
> > > > +}
> > > > +
> > > > +static void __init warn_miss_errata(u32 miss_errata)
> > > > +{
> > > > +       int i;
> > > > +
> > > > +       pr_warn("----------------------------------------------------------------\n");
> > > > +       pr_warn("WARNING: Missing the following errata may cause potential issues\n");
> > > > +       for (i = 0; i < ERRATA_SIFIVE_NUMBER; i++)
> > > > +               if (miss_errata & 0x1 << i)
> > > > +                       pr_warn("\tSiFive Errata[%d]:%s\n", i, errata_list[i].name);
> > > > +       pr_warn("Please enable the corresponding Kconfig to apply them\n");
> > > > +       pr_warn("----------------------------------------------------------------\n");
> > > > +}
> > > > +
> > > > +void __init sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> > > > +                                    unsigned long archid, unsigned long impid)
> > > > +{
> > > > +       struct alt_entry *alt;
> > > > +       u32 cpu_req_errata = sifive_errata_probe(archid, impid);
> > > > +       u32 cpu_apply_errata = 0;
> > > > +       u32 tmp;
> > > > +
> > > > +       for (alt = begin; alt < end; alt++) {
> > > > +               if (alt->vendor_id != SIFIVE_VENDOR_ID)
> > > > +                       continue;
> > > > +               if (alt->errata_id >= ERRATA_SIFIVE_NUMBER) {
> > > > +                       WARN(1, "This errata id:%d is not in kernel errata list", alt->errata_id);
> > > > +                       continue;
> > > > +               }
> > > > +
> > > > +               tmp = (1U << alt->errata_id);
> > > > +               if (cpu_req_errata & tmp) {
> > > > +                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > > +                       cpu_apply_errata |= tmp;
> > > > +               }
> > > > +       }
> > > > +       if (cpu_apply_errata != cpu_req_errata)
> > > > +               warn_miss_errata(cpu_req_errata - cpu_apply_errata);
> > > > +}
> > > > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > > > index 430bc4fea133..e625d3cafbed 100644
> > > > --- a/arch/riscv/include/asm/alternative.h
> > > > +++ b/arch/riscv/include/asm/alternative.h
> > > > @@ -32,5 +32,8 @@ struct errata_checkfunc_id {
> > > >         bool (*func)(struct alt_entry *alt);
> > > >  };
> > > >
> > > > +void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> > > > +                             unsigned long archid, unsigned long impid);
> > > > +
> > > >  #endif
> > > >  #endif
> > > > --
> > > > 2.7.4
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >
> > > Apart from the minor comment above, this patch looks good to me.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > >
> > > Regards,
> > > Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
