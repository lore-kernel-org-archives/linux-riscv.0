Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6335C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 05:40:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5961461159
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 05:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5961461159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esu1bPZOUN4DXGu80BmOX6kdQkbVJ0Lga7oka1ZftNw=; b=BPbhFgnhRpXMFy
	mjtYTREFGSdwCTnmZjeAgkNxdYG4C3VY2bFz0JEGa9ZlWX85mCodHVuBdU5y0ho9jGqRgaAmdlcZE
	OySQRJkxYSvjylPLSNmzFt8HS37RalfhVKJ72oeT7ukN+8+bpGAR1/0f7ub8WGpGkgMHOB+39rclU
	rGOS42C98PEmEVYNiu+4pXV3bwVPB6vG98CiQTMSMEPWHxrbMx42letTOxz2b7s38iXzlJjLFMzIB
	X8WdfMukjWhqaQiCSk1/DCwWIo3vhCHtBaJf1YMxEocXXWIeJvAuMjReZA/Gl6TWD/R8Oe1S8iUaG
	Me9D0ZxKZpUbZxEEzl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llPn8-003SEG-9T; Tue, 25 May 2021 05:39:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llPms-003SBZ-Ht
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 05:39:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id x8so30734690wrq.9
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 22:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XQiX/rQDAoKlbFuUGF3PSR+oQN5hRwJFo9Bkf8URLIk=;
 b=swljZTkozfJKaBoih9exTUXxqih582ijHRewXuKt1qmE88o78KJZkY/zGuFg1US/Nh
 2MDTrSf79z5K9N2imkJbnhVC9R8ecG6t/8fh6rMeLKQPBjL9xtgE/BDfsywU2AIvfOn2
 Gmk1ifact4m3P0F1HVhGvqwDgAPBgFNC1W5moBzZEDfd3encZX5qXuyYQtRjvcZaVCV+
 CnHxE4banq8ZoelswFk9YQDt6IcEJrYqO51A8x6iY///aJ4+9MGEGpBZWRRsrHz+koGX
 fS7OzkNLHe3hvMgUn68DQ+dfdPTzfSZQe/eJ2pLVJqvI7aGuR46dXp0njZkZ+pAC/S91
 cDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XQiX/rQDAoKlbFuUGF3PSR+oQN5hRwJFo9Bkf8URLIk=;
 b=NiQLjyQKepXra/nNXYnc5GmcD3BIGZDMUOp0bX332c7NW9Hpi0b5DW4BNrhKl8NyqA
 RANXGscDPubH+95NbGgPgBZiW7GwPNkEbOLKr0ih0yiAj6YVoBK+20NB9bCF7cnQgf4H
 li/5YgoZMeXTeK57B1+3mI8waHcS5elYxxyM9GjhdVvMI8MiDDz3GTCqnRQTvmN+qjX9
 rZ0ex2LU2AOJeVg2c3oCeMHdQ77mkUzn1b+7eikIDJrZj2kjErEfmczO3CrzW/Rzq4Ci
 O2qqsiNHinu543eQpokzliNhkzxEF25JnkYiB1/F6afjUfAkvte+4LRox6p0zYN8xmKz
 dIcQ==
X-Gm-Message-State: AOAM53210XDtP6iPOlwh35avDGIGaYSr42GWMwYSsQlEb6n+UOcKJyKN
 HkjZW5Ho5eMIHGdrIuRGmpjpKPRH+JY5Tma2zG+c9Q==
X-Google-Smtp-Source: ABdhPJyBgMoZRcFrFb6b8bdZS6V3TxmteE0u5AEexQOZc501tkOujoVNGZfR3Vqd+MuBm9VOvVL5cVaBBDZE1wmDGLw=
X-Received: by 2002:adf:e38c:: with SMTP id e12mr24819885wrm.128.1621921168743; 
 Mon, 24 May 2021 22:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210517130823.796963-1-anup.patel@wdc.com>
 <20210517130823.796963-6-anup.patel@wdc.com>
 <CAPDyKFpxx-jBbL4o_iJCcivFL2ei5a7PcWVfUaBmLu-q89Mkjg@mail.gmail.com>
In-Reply-To: <CAPDyKFpxx-jBbL4o_iJCcivFL2ei5a7PcWVfUaBmLu-q89Mkjg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 25 May 2021 11:09:17 +0530
Message-ID: <CAAhSdy1quHePY_HM875LHQgXGKrjm24SzeD5yFJUnqunpcHd8g@mail.gmail.com>
Subject: Re: [RFC PATCH v4 5/8] cpuidle: Factor-out power domain related code
 from PSCI domain driver
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_223930_685921_0748410D 
X-CRM114-Status: GOOD (  40.76  )
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

On Mon, May 24, 2021 at 11:31 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 17 May 2021 at 15:10, Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The generic power domain related code in PSCI domain driver is largely
> > independent of PSCI and can be shared with RISC-V SBI domain driver
> > hence we factor-out this code into dt_idle_genpd.c and dt_idle_genpd.h.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>
> This is clearly a big step in the right direction. Just a couple minor
> things, see more below.
>
> Note that, I have a couple of patches in the pipe for the
> cpuidle-psci-domain driver (not ready to be posted). I need a couple
> of more days to confirm this restructuring still makes sense beyond
> these potential new changes. I will let you know as soon as I can with
> the outcome.

Sure, I will wait for more comments from you. I was thinking of sending
next revision of patches sometime next week with the renaming of
function names which you suggested.

>
> [...]
>
> > diff --git a/drivers/cpuidle/dt_idle_genpd.c b/drivers/cpuidle/dt_idle_genpd.c
>
> I think it would be a good idea to add a new section for this to the
> MAINTAINERS file. Perhaps a "DT IDLE DOMAIN" section? Or perhaps you
> have another idea?
>
> In any case, I am happy to continue with maintenance of this code,
> even in the new restructured form.

Yes, a separate "DT IDLE DOMAIN" section in MAINTAINERS file
sounds good to me.

Anyway the dt_idle_genpd is factored-out code from cpuidle-psci-domain.c
so I suggest you to maintain dt_idle_genpd as well.

Do you want me to add a "DT IDLE DOMAIN" section in the
MAINTAINERS file as part of this patch ??

>
> > new file mode 100644
> > index 000000000000..5a901773db60
> > --- /dev/null
> > +++ b/drivers/cpuidle/dt_idle_genpd.c
> > @@ -0,0 +1,182 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * PM domains for CPUs via genpd.
> > + *
> > + * Copyright (C) 2019 Linaro Ltd.
> > + * Author: Ulf Hansson <ulf.hansson@linaro.org>
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + */
> > +
> > +#define pr_fmt(fmt) "dt-idle-genpd: " fmt
> > +
> > +#include <linux/cpu.h>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +
> > +#include "dt_idle_genpd.h"
> > +
> > +static int dt_pd_parse_state_nodes(
> > +                       int (*parse_state)(struct device_node *, u32 *),
> > +                       struct genpd_power_state *states, int state_count)
> > +{
> > +       int i, ret;
> > +       u32 state, *state_buf;
> > +
> > +       for (i = 0; i < state_count; i++) {
> > +               ret = parse_state(to_of_node(states[i].fwnode), &state);
> > +               if (ret)
> > +                       goto free_state;
> > +
> > +               state_buf = kmalloc(sizeof(u32), GFP_KERNEL);
> > +               if (!state_buf) {
> > +                       ret = -ENOMEM;
> > +                       goto free_state;
> > +               }
> > +               *state_buf = state;
> > +               states[i].data = state_buf;
> > +       }
> > +
> > +       return 0;
> > +
> > +free_state:
> > +       i--;
> > +       for (; i >= 0; i--)
> > +               kfree(states[i].data);
> > +       return ret;
> > +}
> > +
> > +static int dt_pd_parse_states(struct device_node *np,
> > +                       int (*parse_state)(struct device_node *, u32 *),
> > +                       struct genpd_power_state **states,
> > +                       int *state_count)
> > +{
> > +       int ret;
> > +
> > +       /* Parse the domain idle states. */
> > +       ret = of_genpd_parse_idle_states(np, states, state_count);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Fill out the dt specifics for each found state. */
> > +       ret = dt_pd_parse_state_nodes(parse_state, *states, *state_count);
> > +       if (ret)
> > +               kfree(*states);
> > +
> > +       return ret;
> > +}
> > +
> > +static void dt_pd_free_states(struct genpd_power_state *states,
> > +                             unsigned int state_count)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < state_count; i++)
> > +               kfree(states[i].data);
> > +       kfree(states);
> > +}
> > +
> > +void dt_pd_free(struct generic_pm_domain *pd)
> > +{
> > +       dt_pd_free_states(pd->states, pd->state_count);
> > +       kfree(pd->name);
> > +       kfree(pd);
> > +}
> > +EXPORT_SYMBOL_GPL(dt_pd_free);
> > +
> > +struct generic_pm_domain *dt_pd_alloc(struct device_node *np,
> > +                       int (*parse_state)(struct device_node *, u32 *))
> > +{
> > +       struct generic_pm_domain *pd;
> > +       struct genpd_power_state *states = NULL;
> > +       int ret, state_count = 0;
> > +
> > +       pd = kzalloc(sizeof(*pd), GFP_KERNEL);
> > +       if (!pd)
> > +               goto out;
> > +
> > +       pd->name = kasprintf(GFP_KERNEL, "%pOF", np);
> > +       if (!pd->name)
> > +               goto free_pd;
> > +
> > +       /*
> > +        * Parse the domain idle states and let genpd manage the state selection
> > +        * for those being compatible with "domain-idle-state".
> > +        */
> > +       ret = dt_pd_parse_states(np, parse_state, &states, &state_count);
> > +       if (ret)
> > +               goto free_name;
> > +
> > +       pd->free_states = dt_pd_free_states;
> > +       pd->name = kbasename(pd->name);
> > +       pd->states = states;
> > +       pd->state_count = state_count;
> > +
> > +       pr_debug("alloc PM domain %s\n", pd->name);
> > +       return pd;
> > +
> > +free_name:
> > +       kfree(pd->name);
> > +free_pd:
> > +       kfree(pd);
> > +out:
> > +       pr_err("failed to alloc PM domain %pOF\n", np);
> > +       return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(dt_pd_alloc);
> > +
> > +int dt_pd_init_topology(struct device_node *np)
> > +{
> > +       struct device_node *node;
> > +       struct of_phandle_args child, parent;
> > +       int ret;
> > +
> > +       for_each_child_of_node(np, node) {
> > +               if (of_parse_phandle_with_args(node, "power-domains",
> > +                                       "#power-domain-cells", 0, &parent))
> > +                       continue;
> > +
> > +               child.np = node;
> > +               child.args_count = 0;
> > +               ret = of_genpd_add_subdomain(&parent, &child);
> > +               of_node_put(parent.np);
> > +               if (ret) {
> > +                       of_node_put(node);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(dt_pd_init_topology);
>
> May I suggest that we stick to dt_idle_* as the prefix for all of the
> exported functions in this file. Static functions can just skip the
> prefix altogether.

Sure, I will update the function names like you suggested in next
patch revision.

>
> > +
> > +struct device *dt_idle_genpd_attach_cpu(int cpu, const char *name)
> > +{
> > +       struct device *dev;
> > +
> > +       dev = dev_pm_domain_attach_by_name(get_cpu_device(cpu), name);
> > +       if (IS_ERR_OR_NULL(dev))
> > +               return dev;
> > +
> > +       pm_runtime_irq_safe(dev);
> > +       if (cpu_online(cpu))
> > +               pm_runtime_get_sync(dev);
> > +
> > +       dev_pm_syscore_device(dev, true);
> > +
> > +       return dev;
> > +}
> > +EXPORT_SYMBOL_GPL(dt_idle_genpd_attach_cpu);
> > +
> > +void dt_idle_genpd_detach_cpu(struct device *dev)
> > +{
> > +       if (IS_ERR_OR_NULL(dev))
> > +               return;
> > +
> > +       dev_pm_domain_detach(dev, false);
> > +}
> > +EXPORT_SYMBOL_GPL(dt_idle_genpd_detach_cpu);
>
> Again, a minor comment on the naming of the functions. How about
> skipping "genpd" in the prefix, thus just dt_idle_attach|detach_cpu()?

Sure, I will update.

>
> [...]
>
> Kind regards
> Uffe

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
