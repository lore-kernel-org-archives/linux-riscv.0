Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21291C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DCjollFoeRAWQ/TpBrr5lgpKHmsvcfi+HV3uTEtlVw=; b=DOBzIFQ29RW1Qg
	kR9+7B0qXe9tA/3qlilgyWj5arYLzjOd/RZDS8nYokvBP+zMBYCnGDZDZjXV3VkaJNWU4Beduf6s4
	8XLkSGM1KkHcTUSWMPXAf9Y2AwFBxda/HtZFu5GTFYL67e5skMc7eAcbD1Av1LAE485nQuEKWuJrt
	j6CMvGkHnEup3/pQYY5+6GeVM2JhvWTbIwsMFarbZBKcjvqi+v6M0RZO/LFoy35GSnoi/jOsSk+fw
	BZRMjlzaT4hMPQeiVTuz8XvgHKibQd+2hZSnRMxzxi/zK5PQWAoU03EeZUY7YUtHXpcqSfO+085pf
	UijKGUtSAf1LC1cldzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrOkq-003V88-9T; Wed, 18 May 2022 18:50:40 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrOke-003V5w-Pd; Wed, 18 May 2022 18:50:30 +0000
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2f83983782fso34419807b3.6; 
 Wed, 18 May 2022 11:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JeOeCVH7gCGznzqm2nGSE0funGSjnIdlMb+nr+xRP/A=;
 b=cATO92eDIwFa8ZNUMj7M819PF1A/b45DjTwYz8N8YyrAaJmRwKc9syMTzNd7vcOcn0
 6OJOYTNJIjeM19N/148Fa2zn90+8on6sKWqcrHKt+oP9FyAYZuZWDwueITAc2mqU63M4
 Z4FxiYebCC6FXbuJibjsyrkUwNKP6uLMK/TISMs8VbmWOAOrhsA3bAxQ6yKc55TGrY0y
 M1viqOHRhewzXhcNCFO4MxIBttdeDTRq/3uinyXKca8kQ6iP5OgAZ++Hj2/Jxiy8BsnI
 JWh0JhXRhUONMjXfWY2HbUxf8SIV+uXHofxFeQqIKaP5x5oh7q9hmj4a+yWdrvkA9cSN
 J1Nw==
X-Gm-Message-State: AOAM533XFNgUI7Zr7gvdTxd9/o1PUhCqflWrVRjEvuJMh1sO17fuMCR3
 28duHrH29GtcDzqq4sIRWufRdygAFiQ4AVRvqVw=
X-Google-Smtp-Source: ABdhPJxcL5gAMOBXXOO+YGL6Y0P2PkXH2MCCVm1GVtiV2ayBXlf+abelWHS3qgKA5DVkPjc2lFFUvR3mDUeY/B0dZQA=
X-Received: by 2002:a0d:c8c3:0:b0:2fe:e9eb:664 with SMTP id
 k186-20020a0dc8c3000000b002fee9eb0664mr844761ywd.301.1652899826747; Wed, 18
 May 2022 11:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220514152032.758738-1-ulf.hansson@linaro.org>
 <CAAhSdy3m3FzbkL-On5kPtrZgyO4x=6onr6mXi_=te5B=m_n8GQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3m3FzbkL-On5kPtrZgyO4x=6onr6mXi_=te5B=m_n8GQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 18 May 2022 20:50:15 +0200
Message-ID: <CAJZ5v0i+RR2nK8gew9tbnO_VVU3YUx2JgdRTBW07EPrB3UK87g@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpuidle: psci: Fix regression leading to no genpd
 governor
To: Anup Patel <anup@brainfault.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, 
 Maulik Shah <quic_mkshah@quicinc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_115028_868453_6462F897 
X-CRM114-Status: GOOD (  20.79  )
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

On Sat, May 14, 2022 at 6:49 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, May 14, 2022 at 8:50 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > While factoring out the PM domain related code from PSCI domain driver into
> > a set of library functions, a regression when initializing the genpds got
> > introduced. More precisely, we fail to assign a genpd governor, so let's
> > fix this.
> >
> > Fixes: 9d976d6721df ("cpuidle: Factor-out power domain related code from PSCI domain driver")
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>

Ulf, do you want me to take this lot or is it going to be handled elsewhere?

> > ---
> >  drivers/cpuidle/cpuidle-psci-domain.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> > index 755bbdfc5b82..3db4fca1172b 100644
> > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > @@ -52,7 +52,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
> >         struct generic_pm_domain *pd;
> >         struct psci_pd_provider *pd_provider;
> >         struct dev_power_governor *pd_gov;
> > -       int ret = -ENOMEM, state_count = 0;
> > +       int ret = -ENOMEM;
> >
> >         pd = dt_idle_pd_alloc(np, psci_dt_parse_state_node);
> >         if (!pd)
> > @@ -71,7 +71,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
> >                 pd->flags |= GENPD_FLAG_ALWAYS_ON;
> >
> >         /* Use governor for CPU PM domains if it has some states to manage. */
> > -       pd_gov = state_count > 0 ? &pm_domain_cpu_gov : NULL;
> > +       pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
> >
> >         ret = pm_genpd_init(pd, pd_gov, false);
> >         if (ret)
> > --
> > 2.25.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
