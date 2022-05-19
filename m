Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3687AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjq1eNLd2XKc+qyahPBi9rQXmiqmxHaGOSfJkea/NtQ=; b=gcJwEXlJ5co0BF
	eFj9Dzmkp5weYf6spiD55LqwKt4uoise7rwL23uZhUQGFIKtGciTRfO6ogQs1Tovyk6oVErZ3lTdv
	Txq7CtERtF8KpW6vaPwCUZ5VJcLEWij0dbombHri2U54pUd5PgsDjPS+5bo+lk7wJcYNZ4xF7DzS6
	u7iLgyiT9yD3Yr2iwC09xBd5nqHdJwD5QLX7hbLvyZeFPNim7uprHNxlUXeavoVzrk/umYsNi/7UK
	b+uwwLGM2OLRxCk8WZU6ZP5JCJc1pB+65CrptV0O4aNxRuKdu3lBVm8JdohMCqIM4b0YD3RWDAtEp
	q7X8RMPAE1vziMMUI6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrfp8-006sFh-0v; Thu, 19 May 2022 13:04:14 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfmL-006qXo-0U
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 13:01:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id y32so8987030lfa.6
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gave4xKcqHaRWgWmo3tUVerd7RvnPPKk9OMCUATRApE=;
 b=WIiOL9ncTVgucapluhtRwCXqu6zlMC7IDp2go/yp0SiH20cVYUiE9cqkW54xoE6kRf
 6W4zspy/SuiNoDb4fZaBhs729Keb9gZxovTS70JP+p17bmYUK4RN12flYyC2hqgWPg0S
 +A8teBWcQ0VEMgnVxf/woHyLAsmwIji/ewoP/5aQ+SCv79oDlZ39OTv4y8Texjiq5ozC
 HB7v+UBqgAW3kFVIf5gavgPbtqkmfhuShHCACJYDMtEa0zTfgfmBIABh6KYiKvPX4On8
 ABStwUQX1/FNYriiKb1PFl6hFTaSOohJ94zw1mpunKQjwdd04pdLlGgFU5OmciF0rBGt
 JEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gave4xKcqHaRWgWmo3tUVerd7RvnPPKk9OMCUATRApE=;
 b=X/L5lrq9jLAewYejJ5tRfhXc+9Unqzf4Wq0eMieE0wxyT9fwLvePy9RG3xYwvCt6kT
 eTolIjARgwF//8O7aiJYsuvsbnIU82vUwH+wsWniuXUuPwmzZnoEzdFn52xDS4uu7C1g
 DVKgksN/Xqe8LOt81HehrV//vaebws/yOjze+zHeIrs/EvvZIdieferzor4O2eEwZzEA
 DsQCAV960kayvLS6VHC/LH2r5H7WywbzWPeDkWu7Nf395ZkKCNqTgTDZwIUPJ92VWsYb
 Xu1OnfQtiryXMj+IhEPXE+6Od7M0FZpclx314yk/L0bYzUzU6KoCXo/0U50LuDM8EF/W
 LfPQ==
X-Gm-Message-State: AOAM530EXbePqrXEHCQoNZi7vm9i+CnFJ7TTZxLKd09RyRj8xxCFeR6O
 8YdYJyKuHzyZAcztm/h/W7bvWZxcJRtkDCy+1pw2Aw==
X-Google-Smtp-Source: ABdhPJyHkVwQjEUaawYpeTNZ9ptmLK/NzpeawngI0dtewKhU9y7Fzy3LJtpQj/ugmJxuTBDqYwQX0s+w7ai7V1u1Fgg=
X-Received: by 2002:a19:3852:0:b0:474:2459:26f4 with SMTP id
 d18-20020a193852000000b00474245926f4mr3304564lfj.233.1652965276049; Thu, 19
 May 2022 06:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220514152032.758738-1-ulf.hansson@linaro.org>
 <CAAhSdy3m3FzbkL-On5kPtrZgyO4x=6onr6mXi_=te5B=m_n8GQ@mail.gmail.com>
 <CAJZ5v0i+RR2nK8gew9tbnO_VVU3YUx2JgdRTBW07EPrB3UK87g@mail.gmail.com>
In-Reply-To: <CAJZ5v0i+RR2nK8gew9tbnO_VVU3YUx2JgdRTBW07EPrB3UK87g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 May 2022 15:00:39 +0200
Message-ID: <CAPDyKFrcWBL=7enQ3FJO7pFqv465-Nb3UWZm3faGYe5kG+Mjaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpuidle: psci: Fix regression leading to no genpd
 governor
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 Maulik Shah <quic_mkshah@quicinc.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@rivosinc.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_060121_067771_7597CDA5 
X-CRM114-Status: GOOD (  22.76  )
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

On Wed, 18 May 2022 at 20:50, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sat, May 14, 2022 at 6:49 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sat, May 14, 2022 at 8:50 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > While factoring out the PM domain related code from PSCI domain driver into
> > > a set of library functions, a regression when initializing the genpds got
> > > introduced. More precisely, we fail to assign a genpd governor, so let's
> > > fix this.
> > >
> > > Fixes: 9d976d6721df ("cpuidle: Factor-out power domain related code from PSCI domain driver")
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > Looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
>
> Ulf, do you want me to take this lot or is it going to be handled elsewhere?

I appreciate it if you can pick both this and the second patch.

Kind regards
Uffe

>
> > > ---
> > >  drivers/cpuidle/cpuidle-psci-domain.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> > > index 755bbdfc5b82..3db4fca1172b 100644
> > > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > > @@ -52,7 +52,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
> > >         struct generic_pm_domain *pd;
> > >         struct psci_pd_provider *pd_provider;
> > >         struct dev_power_governor *pd_gov;
> > > -       int ret = -ENOMEM, state_count = 0;
> > > +       int ret = -ENOMEM;
> > >
> > >         pd = dt_idle_pd_alloc(np, psci_dt_parse_state_node);
> > >         if (!pd)
> > > @@ -71,7 +71,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
> > >                 pd->flags |= GENPD_FLAG_ALWAYS_ON;
> > >
> > >         /* Use governor for CPU PM domains if it has some states to manage. */
> > > -       pd_gov = state_count > 0 ? &pm_domain_cpu_gov : NULL;
> > > +       pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
> > >
> > >         ret = pm_genpd_init(pd, pd_gov, false);
> > >         if (ret)
> > > --
> > > 2.25.1
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
