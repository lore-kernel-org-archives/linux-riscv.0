Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FB5C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 07:51:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED926196F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 07:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED926196F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RhLUwThW64TIbRcQlUH5DeYvw89xJijI1YoDHLuJc4c=; b=jRukM7GzR4rb/E0rwUeFHRpCy
	/9u0cuLzp2Oj23wq9czOdGMXISuCOkz59blh3NskQS8Z38iLV+xDqXkLVjcU6LLqJ2smfK19t3Sba
	NIlGFT1yep6uDgQRlCRDOAez+fYvCCR4tWBU3VfK8LXfdqedxHwAjQ9xCxm0aVppwWIlciIbTh0bA
	CTgc5G4nONmjLJX9S4xRwq77S5BWu8/+hLeA7ILPH6LMGy9aJU9JWArclQ8Pw4y15F/0d5RrH7+KO
	pApphGE8hCDakFTu4i7fu+Fsm49oVCzyF6t13hKj6ejwZCASqUg+5gSbwZYb6kzRW15wBoQPT2BxO
	9PzpV1ywg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOFLD-00B6Zs-QC; Mon, 22 Mar 2021 07:51:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOFL4-00B6ZA-6R
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 07:51:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id c17so3477182pfn.6
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q8RU1rfMaLj+77pnn/3hEqWWuShd/4lhRS7IBIt6G6s=;
 b=FTpv40AAUhNeu1B7tSFInj+YQWeN0PAFlrrTaEg4ADlBlh4ZNa06+EzDcMYxuAH0L2
 mHRrJn+YKHti6eimhG5hNgWCk1ZN6gwUAi9bMFBgiK+79QsJyymwQGiBVzeuQ7IXlcAc
 im3pQAQKpo2XGopHaCGCiCk7Ock34adgEt7xeOaZlnbRnJsyd7mN5S8qhznxcJozjVz9
 lqKickqtigMnYz4YF/hCD8mz8wUeOXAK/C20FafVICqkibgRjRJhLwfu5RZU60P4yVxa
 NMl0esikELzHgRaVFpF4TiMWtbDrvIIuDQE+zRJ52o6YNzrHEXZU6fLqNuub0yiwPNON
 5uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q8RU1rfMaLj+77pnn/3hEqWWuShd/4lhRS7IBIt6G6s=;
 b=lmedBeiKyrxZMYR0BdZy2z/+yzdsj66Xfd2PRyE+jYvf+dLvznE95iAvtNeOu8FsBv
 s3tHHXP+wrfRIgrXseB4SShiaFqd8MXG0kCp6uG4vjuEDLDjWC5Fn1ALO2rIoegNOXPc
 VHynB3uHKFZTD4F0a4hj/dH9ILJryxksEcGJPMTfLonFCe3U3IjdAAoaTWdLpF62SgNr
 FJXNe4WdeyW7RKxiAQ/fNs/+hihvzndfNT4RyVzauZlBFpAm7G9s4NUMwZZpSpIQ95Wh
 nSR864xFeuk3Z0gHM7zMaMfEEv89uHD8xdXKPg2GmZQ4AZWUbeBpMjANjHj3nm5v/BVK
 Fo4g==
X-Gm-Message-State: AOAM530PR1EoYbrDP0LSvBQoColMsFoHbd0g30WTcKnYFEfzR2njb9ct
 7BQBCBYA8cBpNudGQTkidlozGKBKGlWm/F22soaHp4iJGMQ5Cg==
X-Google-Smtp-Source: ABdhPJydyXJfZs+r4+396+NIL21Gs6urb0dcCK7spI0WsY/38DSQhopLUWRiEuiqQAyBgjchaZBQlpwe/Ss1NpSfZKg=
X-Received: by 2002:a05:6a00:852:b029:211:d819:7f57 with SMTP id
 q18-20020a056a000852b0290211d8197f57mr16592701pfk.17.1616399457239; Mon, 22
 Mar 2021 00:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
 <1615973613-22364-4-git-send-email-vincent.chen@sifive.com>
 <CAAhSdy1y1bmD0V+sqJpQEWoHGn7OkyjPk6tsyKfCG-WuQRZLZA@mail.gmail.com>
 <CABvJ_xigsjJCF5uj6epEpbs60g41My8VWXszPUbcE_J4XunCmg@mail.gmail.com>
 <CABvJ_xjn7nU62Om5R5FZ-4Lpok_BCTN2eYHCsZCJtUQ98taHAA@mail.gmail.com>
 <CAAhSdy1sXxcTvZ4FcDxt0L2uH-Ee0t5HGas75OgzXFovrY10Gw@mail.gmail.com>
In-Reply-To: <CAAhSdy1sXxcTvZ4FcDxt0L2uH-Ee0t5HGas75OgzXFovrY10Gw@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 22 Mar 2021 15:50:46 +0800
Message-ID: <CABvJ_xhqqtcE5AXyc5ouQvNmRCVWiJ8F6+h-0WpCLXno=CfkJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] riscv: sifive: Add SiFive alternative ports
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Frank.Zhao@starfivetech.com, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@kernel.org>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Ruinland ChuanTzu Tsai <ruinland@andestech.com>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_075103_478647_89466869 
X-CRM114-Status: GOOD (  43.28  )
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

On Mon, Mar 22, 2021 at 2:08 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Mar 22, 2021 at 11:10 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > On Mon, Mar 22, 2021 at 8:26 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> > >
> > > On Wed, Mar 17, 2021 at 7:43 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Wed, Mar 17, 2021 at 3:04 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> > > > >
> > > > > Add required ports of the Alternative scheme for SiFive.
> > > > >
> > > > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > > > ---
> > > > >  arch/riscv/Kconfig.erratas           | 11 ++++++
> > > > >  arch/riscv/Kconfig.socs              |  1 +
> > > > >  arch/riscv/errata/Makefile           |  1 +
> > > > >  arch/riscv/errata/alternative.c      |  5 +++
> > > > >  arch/riscv/errata/sifive/Makefile    |  1 +
> > > > >  arch/riscv/errata/sifive/errata.c    | 68 ++++++++++++++++++++++++++++++++++++
> > > > >  arch/riscv/include/asm/alternative.h |  3 ++
> > > > >  7 files changed, 90 insertions(+)
> > > > >  create mode 100644 arch/riscv/errata/sifive/Makefile
> > > > >  create mode 100644 arch/riscv/errata/sifive/errata.c
> > > > >
> > > > > diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> > > > > index 4d0bafc536df..e50ab67f4830 100644
> > > > > --- a/arch/riscv/Kconfig.erratas
> > > > > +++ b/arch/riscv/Kconfig.erratas
> > > > > @@ -9,4 +9,15 @@ config RISCV_ERRATA_ALTERNATIVE
> > > > >           code patching is performed once in the boot stages. It means
> > > > >           that the overhead from this mechanism is just taken once.
> > > > >
> > > > > +config ERRATA_SIFIVE
> > > > > +       bool "SiFive errata"
> > > > > +       depends on RISCV_ERRATA_ALTERNATIVE
> > > > > +       default y
> > > >
> > > > Remove the "default y" here.
> > > >
> > > > Let the ERRATA Kconfig be explicitly selected from riscv/Kconfig.socs
> > > >
> > > This is a good suggestion. I will modify it in my next version patch.
> > > Thank you,
> > >
> > Sorry, I found the "default y" may not be removed here. It is because
> > SiFive's customers possibly only license our Core IP. In this case, it
> > does not enable CONFIG_SOC_SIFIVE. Therefore, I prefer to keep the
> > "default y" feature. (In this patch, I have made the CONFIG_SOC_SIFIVE
> > select the CONFIG_SOC_SIFIVE )
>
> If you are using SiFive IP for your <xyz> SOC then your
> CONFIG_SOC_<xyz> in Kconfig option should select
> ERRATA_SIFIVE
>
> Basically, SOC Kconfig options should explicitly select required
> ERRATA configs so that if someone wants to disable ERRATs from
> menuconfig then it can be easily done without knowledge of which
> SOCs need which ERRATAs.
>
> Regards,
> Anup
>
I got it. I will remove it in my next version patch.
Thank you for the explanation.

Best regards,
Vincent

> >
> > > > > +       help
> > > > > +         All SiFive errata Kconfig depend on this Kconfig. Disabling
> > > > > +         this Kconfig will disable all SiFive errata. Please say "Y"
> > > > > +         here if your platform uses SiFive CPU cores.
> > > > > +
> > > > > +         Otherwise, please say "N" here to avoid unnecessary overhead.
> > > > > +
> > > > >  endmenu
> > > > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > > > index 7efcece8896c..b9eda857fc87 100644
> > > > > --- a/arch/riscv/Kconfig.socs
> > > > > +++ b/arch/riscv/Kconfig.socs
> > > > > @@ -7,6 +7,7 @@ config SOC_SIFIVE
> > > > >         select CLK_SIFIVE
> > > > >         select CLK_SIFIVE_PRCI
> > > > >         select SIFIVE_PLIC
> > > > > +       select ERRATA_SIFIVE
> > > > >         help
> > > > >           This enables support for SiFive SoC platform hardware.
> > > > >
> > > > > diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> > > > > index 43e6d5424367..b8f8740a3e44 100644
> > > > > --- a/arch/riscv/errata/Makefile
> > > > > +++ b/arch/riscv/errata/Makefile
> > > > > @@ -1 +1,2 @@
> > > > >  obj-y  += alternative.o
> > > > > +obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
> > > > > diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
> > > > > index 8efa60ad69b7..3b15885db70b 100644
> > > > > --- a/arch/riscv/errata/alternative.c
> > > > > +++ b/arch/riscv/errata/alternative.c
> > > > > @@ -42,6 +42,11 @@ static void __init init_alternative(void)
> > > > >         riscv_fill_cpu_mfr_info();
> > > > >
> > > > >         switch (cpu_mfr_info.vendor_id) {
> > > > > +#ifdef CONFIG_ERRATA_SIFIVE
> > > > > +       case SIFIVE_VENDOR_ID:
> > > > > +               vendor_patch_func = sifive_errata_patch_func;
> > > > > +               break;
> > > > > +#endif
> > > > >         default:
> > > > >                 vendor_patch_func = NULL;
> > > > >         }
> > > > > diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
> > > > > new file mode 100644
> > > > > index 000000000000..2d644e19caef
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/errata/sifive/Makefile
> > > > > @@ -0,0 +1 @@
> > > > > +obj-y += errata.o
> > > > > diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> > > > > new file mode 100644
> > > > > index 000000000000..826cd391fc55
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/errata/sifive/errata.c
> > > > > @@ -0,0 +1,68 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/*
> > > > > + * Copyright (C) 2021 Sifive.
> > > > > + */
> > > > > +
> > > > > +#include <linux/kernel.h>
> > > > > +#include <linux/string.h>
> > > > > +#include <linux/bug.h>
> > > > > +#include <asm/patch.h>
> > > > > +#include <asm/alternative.h>
> > > > > +#include <asm/vendorid_list.h>
> > > > > +#include <asm/errata_list.h>
> > > > > +
> > > > > +struct errata_info_t {
> > > > > +       char name[ERRATA_STRING_LENGTH_MAX];
> > > > > +       bool (*check_func)(unsigned long  arch_id, unsigned long impid);
> > > > > +};
> > > > > +
> > > > > +static u32 __init sifive_errata_probe(unsigned long archid, unsigned long impid)
> > > > > +{
> > > > > +       int idx;
> > > > > +       u32 cpu_req_errata = 0;
> > > > > +
> > > > > +       for (idx = 0; idx < ERRATA_SIFIVE_NUMBER; idx++)
> > > > > +               if (errata_list[idx].check_func(archid, impid))
> > > > > +                       cpu_req_errata |= (1U << idx);
> > > > > +
> > > > > +       return cpu_req_errata;
> > > > > +}
> > > > > +
> > > > > +static void __init warn_miss_errata(u32 miss_errata)
> > > > > +{
> > > > > +       int i;
> > > > > +
> > > > > +       pr_warn("----------------------------------------------------------------\n");
> > > > > +       pr_warn("WARNING: Missing the following errata may cause potential issues\n");
> > > > > +       for (i = 0; i < ERRATA_SIFIVE_NUMBER; i++)
> > > > > +               if (miss_errata & 0x1 << i)
> > > > > +                       pr_warn("\tSiFive Errata[%d]:%s\n", i, errata_list[i].name);
> > > > > +       pr_warn("Please enable the corresponding Kconfig to apply them\n");
> > > > > +       pr_warn("----------------------------------------------------------------\n");
> > > > > +}
> > > > > +
> > > > > +void __init sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> > > > > +                                    unsigned long archid, unsigned long impid)
> > > > > +{
> > > > > +       struct alt_entry *alt;
> > > > > +       u32 cpu_req_errata = sifive_errata_probe(archid, impid);
> > > > > +       u32 cpu_apply_errata = 0;
> > > > > +       u32 tmp;
> > > > > +
> > > > > +       for (alt = begin; alt < end; alt++) {
> > > > > +               if (alt->vendor_id != SIFIVE_VENDOR_ID)
> > > > > +                       continue;
> > > > > +               if (alt->errata_id >= ERRATA_SIFIVE_NUMBER) {
> > > > > +                       WARN(1, "This errata id:%d is not in kernel errata list", alt->errata_id);
> > > > > +                       continue;
> > > > > +               }
> > > > > +
> > > > > +               tmp = (1U << alt->errata_id);
> > > > > +               if (cpu_req_errata & tmp) {
> > > > > +                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > > > +                       cpu_apply_errata |= tmp;
> > > > > +               }
> > > > > +       }
> > > > > +       if (cpu_apply_errata != cpu_req_errata)
> > > > > +               warn_miss_errata(cpu_req_errata - cpu_apply_errata);
> > > > > +}
> > > > > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > > > > index 430bc4fea133..e625d3cafbed 100644
> > > > > --- a/arch/riscv/include/asm/alternative.h
> > > > > +++ b/arch/riscv/include/asm/alternative.h
> > > > > @@ -32,5 +32,8 @@ struct errata_checkfunc_id {
> > > > >         bool (*func)(struct alt_entry *alt);
> > > > >  };
> > > > >
> > > > > +void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> > > > > +                             unsigned long archid, unsigned long impid);
> > > > > +
> > > > >  #endif
> > > > >  #endif
> > > > > --
> > > > > 2.7.4
> > > > >
> > > > >
> > > > > _______________________________________________
> > > > > linux-riscv mailing list
> > > > > linux-riscv@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > > >
> > > > Apart from the minor comment above, this patch looks good to me.
> > > >
> > > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > > >
> > > > Regards,
> > > > Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
