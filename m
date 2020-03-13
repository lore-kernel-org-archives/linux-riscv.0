Return-Path: <SRS0=Sj4V=46=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BE1C10DCE
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2020 21:10:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 239A12074E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2020 21:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="caaVnzQb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="D/VbLwcK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 239A12074E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KTqP9lFdrfA7HI3NfBtdd7hcVnzMZW5gkko9g1SwGmE=; b=caaVnzQb08t0c/9q9tOkBAKIT
	w5q8YbqqvPddLBXZdfC1bWgqUl8k8RRvlyI3/j9IPyzEDjXqrDWA6TD/X3kkXVCAN3VCKymiDcVoK
	yeYBX6B/WXsMnnwboXtsLhauoIJvTgy+0P7KfABjWEIt7adqrUn8WEfqmINf42H07rN29sxR5zT8c
	ftEyJz+cs0W86tA+v2LVrk6IXOypRxk4DaEOJTspgXI5Uc2jaDs1g5ydOYXOzohFs5i1EmqXRZxuE
	rnrMTZja4lt3gJhCDdf27p6LPG/Qx10IJv401u7/5yBGk0L/Cmydp32TINDu5rQHLLDBdZkcH0xeM
	vA62IkCuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCrZf-0006gk-Gx; Fri, 13 Mar 2020 21:10:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCrZc-0006gJ-4F
 for linux-riscv@lists.infradead.org; Fri, 13 Mar 2020 21:10:29 +0000
Received: by mail-wr1-x444.google.com with SMTP id b2so7611355wrj.10
 for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2020 14:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KTqP9lFdrfA7HI3NfBtdd7hcVnzMZW5gkko9g1SwGmE=;
 b=D/VbLwcKy6d2afrn63btqgJ6htyjmnaCDY3a+Oz3u25JhvO4G+ZUfJW2Aw2RJg7b07
 qcFmsMgyZBk2mYlYjvzh0IaUrNB1PkbEjeSFPXLeFo4kPVdIjN4ObbTrInZ7Xbr1Q3Nv
 mTkekcjtFq9d8vw0rNgn2bxy8vrrwukqWnZ/de41EvhbDjlJFnqqyzUAj1VBZ2Qqm9mI
 mutlHHmeqbUwrwumwzhyp4z5g98MnRheMdTQmXkKlDHDR5ODywHpybV36WQrm3RUpWdr
 uGtbFx/U/VG4HQG7RY2lKU6sqm2fIPjqJWvG87TBqOz4K66E5MYdbS9ZXhum2CHCkhM6
 X5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KTqP9lFdrfA7HI3NfBtdd7hcVnzMZW5gkko9g1SwGmE=;
 b=Yf18YerfDVYk1+Jjb/4xrMXJOzUXbMf2ibRqM2g22n76UIwGBkuRZfUnX6OkI8dl/I
 Kh+tHqKl1MXpMcdblrrDhCBMNgk0X/Dobya35UGyr7T3Oo3UacAr3dC08Ll5tn4fNnyM
 +T0fHK1+gXbLzGcB5+mPmXAUiXNMdkUys21xbavj2ua3iLEvF0w7fdChGKXyyMApAie8
 LemmJIty3uA9+o72xKgbjxHv2SaJ5dkBQ3XLS1otyUYFMNsTObi+HDGgFoLAuFbVO3ad
 xXSUcFznEnuPiefOIHTw9Ft16ETVuEp7jscY5uyx6x2IHFS4rx3kAG98B6MJJOWtaM3M
 7MWw==
X-Gm-Message-State: ANhLgQ2axukuuKBRSQKLrA3PMQEyL3ApRqX75FRM2AnbhKb8FTadbPNS
 A+lT3SbUD9py0Wc8qzvAVNPA/dIfM+EkYgbDYf/L
X-Google-Smtp-Source: ADFU+vsztDV/lNPCV12eYvM40gf8pnS7zoy/ofAygQn67Qyhz3NGYrGXGS9Q70VSuF6zve4F0T41wd98HOGDdqjFs1M=
X-Received: by 2002:adf:ee10:: with SMTP id y16mr420067wrn.162.1584133824950; 
 Fri, 13 Mar 2020 14:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200312051107.1454880-1-damien.lemoal@wdc.com>
 <20200312051107.1454880-4-damien.lemoal@wdc.com>
 <CAOnJCUJ_aHi1tZ4WoMQVFctq6YMC5CbL4+XEQP0T3_zGZk8F3A@mail.gmail.com>
 <2b565ad4afd7453a5b1aca6b5d8d8368d6688518.camel@wdc.com>
In-Reply-To: <2b565ad4afd7453a5b1aca6b5d8d8368d6688518.camel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 13 Mar 2020 14:10:14 -0700
Message-ID: <CAOnJCUK4dZcBFwn1i4O-jEZWya_yDh2zoRwAVSxxwYTZBi8hLw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] riscv: Add SOC early init support
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_141028_243770_C9D32A71 
X-CRM114-Status: GOOD (  28.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2020 at 11:42 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On Thu, 2020-03-12 at 13:53 -0700, Atish Patra wrote:
> > On Wed, Mar 11, 2020 at 10:11 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> > > Add a mechanism for early SoC initialization for platforms that need
> > > additional hardware initialization not possible through the regular
> > > device tree and drivers mechanism. With this, a SoC specific
> > > initialization function can be called very early, before DTB parsing
> > > is done by parse_dtb() in Linux RISC-V kernel setup code.
> > >
> > > This can be very useful for early hardware initialization for No-MMU
> > > kernels booted directly in M-mode because it is quite likely that no
> > > other booting stage exist prior to the No-MMU kernel.
> > >
> > > Example use of a SoC early initialization is as follows:
> > >
> > > static void vendor_abc_early_init(const void *fdt)
> > > {
> > >         /*
> > >          * some early init code here that can use simple matches
> > >          * against the flat device tree file.
> > >          */
> > > }
> > > SOC_EARLY_INIT_DECLARE("vendor,abc", abc_early_init);
> > >
> > > This early initialization function is executed only if the flat device
> > > tree for the board has a 'compatible = "vendor,abc"' entry;
> > >
> > > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > > ---
> > >  arch/riscv/include/asm/soc.h    | 23 +++++++++++++++++++++++
> > >  arch/riscv/kernel/Makefile      |  1 +
> > >  arch/riscv/kernel/head.S        |  1 +
> > >  arch/riscv/kernel/soc.c         | 28 ++++++++++++++++++++++++++++
> > >  arch/riscv/kernel/vmlinux.lds.S |  6 ++++++
> > >  5 files changed, 59 insertions(+)
> > >  create mode 100644 arch/riscv/include/asm/soc.h
> > >  create mode 100644 arch/riscv/kernel/soc.c
> > >
> > > diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
> > > new file mode 100644
> > > index 000000000000..9b8c332cbe76
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/soc.h
> > > @@ -0,0 +1,23 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +/*
> > > + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> > > + */
> > > +
> > > +#ifndef _ASM_RISCV_SOC_H
> > > +#define _ASM_RISCV_SOC_H
> > > +
> > > +#include <linux/of.h>
> > > +#include <linux/linkage.h>
> > > +#include <linux/types.h>
> > > +
> > > +#define SOC_EARLY_INIT_DECLARE(compat, fn)                             \
> > > +       static const struct of_device_id __soc_early_init               \
> > > +               __used __section(__soc_early_init_table)                \
> > > +                = { .compatible = compat, .data = fn  }
> > > +
> >
> > There may be some future kendryte board or some other RISC-V board
> > which want to use SOC_EARLY_INIT_DECLARE.
> > There should be a name parameter as well which allows multiple usage
> > of SOC_EARLY_INIT_DECLARE.
>
> I am not sure I understand your point here. Currently, the call to an
> early init functions is driven by the value (name) specified in the DT
> compatible entry. If what needs to be done in the early init function
> for one SoC is common with another, the same function can be used for
> different SOC_EARLY_INIT_DECLARE() with different compatible strings,
> or the same compatible string used in the different boards DT. No ? Am
> I missing something ?
>

To use different compatible strings, SOC_EARLY_INIT_DECLARE has to be
declared twice.
As SOC_EARLY_INIT_DECLARE is just a macro that declares
__soc_early_init, redefinition compile error
will happen. That's why __soc_early_init has to be suffixed with name
to avoid the redefinition error.
Here is the diff I am talking about

-#define SOC_EARLY_INIT_DECLARE(compat, fn)                             \
-       static const struct of_device_id __soc_early_init               \
+#define SOC_EARLY_INIT_DECLARE(name, compat, fn)
         \
+       static const struct of_device_id __soc_early_init__##name
         \
                __used __section(__soc_early_init_table)                \
                 = { .compatible = compat, .data = fn  }


> >
> > > +void soc_early_init(void);
> > > +
> > > +extern unsigned long __soc_early_init_table_start;
> > > +extern unsigned long __soc_early_init_table_end;
> > > +
> > > +#endif
> > > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > > index 97d0c35f8b37..e4a22999dbc6 100644
> > > --- a/arch/riscv/kernel/Makefile
> > > +++ b/arch/riscv/kernel/Makefile
> > > @@ -10,6 +10,7 @@ endif
> > >  extra-y += head.o
> > >  extra-y += vmlinux.lds
> > >
> > > +obj-y  += soc.o
> > >  obj-y  += cpu.o
> > >  obj-y  += cpufeature.o
> > >  obj-y  += entry.o
> > > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > > index 85f2073e7fe4..52ed11b4fda6 100644
> > > --- a/arch/riscv/kernel/head.S
> > > +++ b/arch/riscv/kernel/head.S
> > > @@ -131,6 +131,7 @@ clear_bss_done:
> > >         call kasan_early_init
> > >  #endif
> > >         /* Start the kernel */
> > > +       call soc_early_init
> > >         call parse_dtb
> > >         tail start_kernel
> > >
> > > diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
> > > new file mode 100644
> > > index 000000000000..0b3b3dc9ad0f
> > > --- /dev/null
> > > +++ b/arch/riscv/kernel/soc.c
> > > @@ -0,0 +1,28 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> > > + */
> > > +#include <linux/init.h>
> > > +#include <linux/libfdt.h>
> > > +#include <asm/pgtable.h>
> > > +#include <asm/soc.h>
> > > +
> > > +/*
> > > + * This is called extremly early, before parse_dtb(), to allow initializing
> > > + * SoC hardware before memory or any device driver initialization.
> > > + */
> > > +void __init soc_early_init(void)
> > > +{
> > > +       void (*early_fn)(const void *fdt);
> > > +       const struct of_device_id *s;
> > > +       const void *fdt = dtb_early_va;
> > > +
> > > +       for (s = (void *)&__soc_early_init_table_start;
> > > +            (void *)s < (void *)&__soc_early_init_table_end; s++) {
> > > +               if (!fdt_node_check_compatible(fdt, 0, s->compatible)) {
> > > +                       early_fn = s->data;
> > > +                       early_fn(fdt);
> > > +                       return;
> > > +               }
> > > +       }
> > > +}
> > > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > > index 1e0193ded420..32b160942f40 100644
> > > --- a/arch/riscv/kernel/vmlinux.lds.S
> > > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > > @@ -24,6 +24,12 @@ SECTIONS
> > >         HEAD_TEXT_SECTION
> > >         INIT_TEXT_SECTION(PAGE_SIZE)
> > >         INIT_DATA_SECTION(16)
> > > +       . = ALIGN(8);
> > > +       __soc_early_init_table : {
> > > +               __soc_early_init_table_start = .;
> > > +               KEEP(*(__soc_early_init_table))
> > > +               __soc_early_init_table_end = .;
> > > +       }
> > >         /* we have to discard exit text and such at runtime, not link time */
> > >         .exit.text :
> > >         {
> > > --
> > > 2.24.1
> > >
> > >
> >
> >
>
> --
> Damien Le Moal
> Western Digital Research



--
Regards,
Atish

