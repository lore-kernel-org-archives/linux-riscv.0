Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F98C47095
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 08:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5E216101A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 08:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5E216101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UW55pyccInlks7X/uSyDLsSCZrm7s8ofro/aNHl4mHs=; b=qYi6aWGSc+p/Dg
	GI36ZQAGzE382HnqHtBawbNoAmUhLk8qpQDwdRsllVSbevde1SKBS766mjeDUuJURg0GS5kcd4+ys
	1N7Pwt+2trr6ss39d+FIgeEReD3PNNdswKoZ9X7Ge1iy1eQCFYe5gMQ/6AYypTT0C7QMjIcSc9hcB
	PLEbazJtAtU/EbB7+PWKQhqQBiSTuDPdLTNwaz9jghfUtxugFgvmVRZhnJVTvm1u8sWiAXXjfMyhO
	Kylw7e+bZwZQQPQhFvWhP8Cuu+d8o0qk6W3hy0SUrqNyFvz/xNjD/FaS+fq+awPAW9g9S3cZD9FiG
	ctQDybY2JpvyzUAfToTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqtxX-00CUvx-Gw; Wed, 09 Jun 2021 08:53:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqt9y-00CFEE-V9
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 08:02:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso3542593wms.1
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ju48vJplC/eqeHsAD3uNcfdCHg6qYZAOA8GhsxxsbGo=;
 b=RoJROVGx6pF3QoOuy/LW0b+B8pW4z/Gu8UsSrljkaodrIneT6aJ5VDM0xOo4QyIIzv
 Gj2yhqG8i/swO3l9mOI7UPStpX1mkoZb+9ZtFCrLBtHfdInHXO9DQzrqz6EnoBSCsDbJ
 CQyY7YdW8oig7+dPjOpzWmgH7zhMtk+yZskpmYk3+dOlc4KOXd1RxbP+Umt+54CUVZRm
 azXxGHY98MXetAA5dphBGr6CRGTv5bFOtfhkbMHOjIHtgKGknZuZd1qGV9narPBcUBvS
 wo8IGBL6tczovK1vv5CFCBG+VcQXdNaQ1n3muF+jV116E+phUJQoQ0NfkYF+TlXToFlL
 njGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ju48vJplC/eqeHsAD3uNcfdCHg6qYZAOA8GhsxxsbGo=;
 b=UjIfE+YUjvI1FLDw/+hHkVBOBNClSMCVj5mPR+4iBxuhas1+J2xinHtO72Jo1nKf6Y
 soDSfgvrZ59WHSlQcjUdKO2/zxSjH9rde5I7mRWuk9V1ACZBXYirrDyG+E4xYOM6tHdS
 bslRAsPitJ3xzVWjeV0PEFDpKbWLC+nDiosZj4WvBi/fj2rb8+ZYs24OxTmY2NBvz+AY
 B952B1AWxt4AwCU2zfzWBNb/jz83aLXezip6AnmHjjignM8yN1uxvjjRWgMxRzsm6n/T
 dFklqYEHVgvSFmJgmrivjFjIy6IZ7T5mr1l2a9Khf48aKDAqJqCDPU43VackjYmxDR+F
 2oQA==
X-Gm-Message-State: AOAM533zly7z8poamkxJbThds4NK9f1epDdaumFOBBE5xXITMFahV3Fs
 0Hs5w3MlyKERTZ38FcyabSovbJyFulANfaLsySO9cw==
X-Google-Smtp-Source: ABdhPJwCl3qJZm5Z606JSaosHKIbg85Mj+Z7FrvUrA4ecB82gMzqX8XkomV2Nv0hp9Jl1/jpfn0HzS95ejA1SCogr7s=
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr26760837wmj.134.1623225715467; 
 Wed, 09 Jun 2021 01:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210602112321.2241566-1-anup.patel@wdc.com>
 <20210602112321.2241566-6-anup.patel@wdc.com>
 <82217630-5f89-50dc-bbca-e591bee90950@sholland.org>
In-Reply-To: <82217630-5f89-50dc-bbca-e591bee90950@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Jun 2021 13:31:44 +0530
Message-ID: <CAAhSdy1D4HnHuuC0Da-rvia5-o3TaCUapTHb-HsBCQ9X6y-AiQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] cpuidle: Factor-out power domain related code from
 PSCI domain driver
To: Samuel Holland <samuel@sholland.org>
Cc: Anup Patel <anup.patel@wdc.com>,
 Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_010200_689170_081E1822 
X-CRM114-Status: GOOD (  22.50  )
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

On Mon, Jun 7, 2021 at 12:04 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 6/2/21 6:23 AM, Anup Patel wrote:
> > The generic power domain related code in PSCI domain driver is largely
> > independent of PSCI and can be shared with RISC-V SBI domain driver
> > hence we factor-out this code into dt_idle_genpd.c and dt_idle_genpd.h.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  MAINTAINERS                           |   7 +
> >  drivers/cpuidle/Kconfig               |   4 +
> >  drivers/cpuidle/Kconfig.arm           |   1 +
> >  drivers/cpuidle/Makefile              |   1 +
> >  drivers/cpuidle/cpuidle-psci-domain.c | 138 +------------------
> >  drivers/cpuidle/cpuidle-psci.h        |  15 ++-
> >  drivers/cpuidle/dt_idle_genpd.c       | 182 ++++++++++++++++++++++++++
> >  drivers/cpuidle/dt_idle_genpd.h       |  50 +++++++
> >  8 files changed, 263 insertions(+), 135 deletions(-)
> >  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
> >  create mode 100644 drivers/cpuidle/dt_idle_genpd.h
> >
> ...
> > diff --git a/drivers/cpuidle/dt_idle_genpd.h b/drivers/cpuidle/dt_idle_genpd.h
> > new file mode 100644
> > index 000000000000..a8a3bad3cb7f
> > --- /dev/null
> > +++ b/drivers/cpuidle/dt_idle_genpd.h
> > @@ -0,0 +1,50 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __DT_IDLE_GENPD
> > +#define __DT_IDLE_GENPD
> > +
> > +struct device_node;
> > +struct generic_pm_domain;
> > +
> > +#ifdef CONFIG_DT_IDLE_GENPD
> > +
> > +void dt_idle_pd_free(struct generic_pm_domain *pd);
> > +
> > +struct generic_pm_domain *dt_idle_pd_alloc(struct device_node *np,
> > +                     int (*parse_state)(struct device_node *, u32 *));
> > +
> > +int dt_idle_pd_init_topology(struct device_node *np);
> > +
> > +struct device *dt_idle_attach_cpu(int cpu, const char *name);
> > +
> > +void dt_idle_detach_cpu(struct device *dev);
> > +
> > +#else
> > +
> > +static inline void dt_idle_pd_free(struct generic_pm_domain *pd)
> > +{
> > +}
> > +
> > +static inline struct generic_pm_domain *dt_idle_pd_alloc(
> > +                     struct device_node *np,
> > +                     int (*parse_state)(struct device_node *, u32 *));
>
> In file included from drivers/cpuidle/cpuidle-sbi.c:27:
> drivers/cpuidle/dt_idle_genpd.h:29:1: error: expected identifier or '('
> before '{' token
>    29 | {
>       | ^
>
> Looks like you have a stray semicolon here.

Okay, I will fix this in the next revision.

Regards,
Anup

>
> > +{
> > +     return NULL;
> > +}
> > +
> > +static inline int dt_idle_pd_init_topology(struct device_node *np)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline struct device *dt_idle_attach_cpu(int cpu, const char *name)
> > +{
> > +     return NULL;
> > +}
> > +
> > +static inline void dt_idle_detach_cpu(struct device *dev)
> > +{
> > +}
> > +
> > +#endif
> > +
> > +#endif
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
