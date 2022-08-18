Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD630C32772
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 08:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dn6OnhMQixNYeiRfxOOngXXHeSmKmLmxqYrcT1HFHX4=; b=iDi+UH8Pl13BRL
	3KpJZcfUfzuow1xDL3QMu8ozS5LBuYxW3pFaF/3EANCIMnWhB0kIvwofVRVfAzPbhWj9n/W+cRiLI
	hscXCtLAp84lALeoZVDiXTE++ieFB94x9IAd/xF659+PcuvXUoOZUld/xWYc8fUtd2rkZmJ0dJFQJ
	zxFlCCNCObHguYN6J/lTPZ8bTcv3wx/1j8FyD5fY0mAxMSLEVSJZaYoKRg3op+bRTMgg0EY5YV/DX
	fLmpan/F4n+p4WebgEZp/8Fnuij27QfMFPIcGFlcH30M6AQYoLL/OQXAX3Ga7eqaI8oVKhy9JLD7p
	eh8c1H0HMrrt9giUFnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOape-000mPQ-98; Thu, 18 Aug 2022 08:24:50 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOapb-000mMk-FN
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 08:24:49 +0000
Received: by mail-lj1-x22a.google.com with SMTP id l21so1032052ljj.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Eh2ca1k897f/fpjj6GZcTMr0pxfwU8M3TTyUS5TvUjQ=;
        b=RFAr/7oW0zPoFkfRwvLBYI6LDgLSLVUN5klD12foZ9OmtfSkRvsOrWZEritkdGO1xL
         iJ3j3xORTEcKizlPkv86BZq2eENXcAAnZcM+ikePNVq43yw1OTAe+YIdHgFPjYvO9CJo
         ch0Kjfj8slEewPzXVdNSjziu7L/AWXRKfyfQSpHE4PMqBdkZYUAdH5zh+/LU8L5ROd40
         qCxAEYkwYGGFfuaQzIth8EdRpRgDLxw8RJuUFmtXNyr7g2Bmx8gGkrEnhSqv5Cta9EAN
         Mztj/sIcEGbcD050FLuHwxxsw+iGEvceb0c6CymKRtJZNmms48/Iqf1S6QAxNFlpp2Az
         IdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Eh2ca1k897f/fpjj6GZcTMr0pxfwU8M3TTyUS5TvUjQ=;
        b=1BmPgAr3CWjIamBjmiSDtlEJsKswlVQ1b2Lxz7bbffOBWM9Q3wud17eBbmvd122KVu
         oI9b0fj4QZZ6q1pnciscXNNBmMmgV6oVqztmSfOvVUos+201R+dqRRp233XU7j//ehjL
         xkNU6qsEV5v9turG4dHGwysxbQxumVH0GSPANHS4gHyVmGO5yQmKDmkEOXyttgcFYglM
         Bzvui19XDXhZ8bq9TYfLXhYC+9j/+fOSYJ+m8B+ElZaBVu4ljHpe5czrzTZmljvzVKqV
         n8zRONrUg1zDVYOdIKdVLuaFnyBxSrimHP8kv7Esv1E8iYaN6EklDqxwh2tdiQUfBgqi
         6LhQ==
X-Gm-Message-State: ACgBeo30vo45aOlgN2yW2kU9CN+VWG8wIkqLbHTuyV9YN6dQOKdumXdT
	qjFt6lENkh7rSc4EUS7n2msMXzT46RfkoK6Tm24j/w==
X-Google-Smtp-Source: AA6agR4kT1zW8SyEa7wWTUQD8xI3ALBqcvbJWB9om1QxAwEqviJpffov94G4tr/ClkhNvS6S7KPFKkPZgnDHkV01QSA=
X-Received: by 2002:a2e:a987:0:b0:25f:d70a:c63c with SMTP id
 x7-20020a2ea987000000b0025fd70ac63cmr589061ljq.34.1660811084327; Thu, 18 Aug
 2022 01:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220817111348.745527-1-heiko@sntech.de> <CAOnJCUJu1fr2qxOkX4Sz-kLhB64xkcjAbBAeTkp214ZHAa0btA@mail.gmail.com>
In-Reply-To: <CAOnJCUJu1fr2qxOkX4Sz-kLhB64xkcjAbBAeTkp214ZHAa0btA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 18 Aug 2022 13:54:33 +0530
Message-ID: <CAK9=C2U3OvUZmYTJ-C0wkSp8ViPA1+Nj2L6pd4CHTCuzaVtDJg@mail.gmail.com>
Subject: Re: [PATCH] drivers/perf: riscv_pmu_sbi: add support for PMU variant
 on T-Head C9xx cores
To: Atish Patra <atishp@atishpatra.org>
Cc: Heiko Stuebner <heiko@sntech.de>, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, philipp.tomsich@vrull.eu, cmuellner@linux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_012447_562615_8637935C 
X-CRM114-Status: GOOD (  41.82  )
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

On Thu, Aug 18, 2022 at 1:03 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Aug 17, 2022 at 4:13 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > With the T-HEAD C9XX cores being designed before or during the ratification
> > to the SSCOFPMF extension, they implement functionality very similar but
> > not equal to it. So add some adaptions to allow the C9XX to still handle
> > its PMU through the regular SBI PMU interface instead of defining new
> > interfaces or drivers.
> >
>
> IMO, vendor specific workarounds in the generic implementation is not
> a good idea.
> If we have to support it, I think we should just put the IRQ number in
> the DT and parse from the DT.
> The initial sscofpmf series was based on the DT. It was removed later
> as there was no need for it at that time.
> We can always revive it.
>
> Regarding the CSR number difference and static key enablement, can we
> use code patching techniques here as well ?
> At least all the T-HEAD C9XX core erratas are in one place.
>
> The alternate would be just to say T-HEAD C9XX support SSCOFPMF but
> with erratas. I don't prefer this approach
> but it keeps the vendor specific checks out of the generic code.

Whether to have a DT node (or not) was already discussed and concluded
in the past.

We don't need a DT node just to get the IRQ number. The T-HEAD custom
IRQ number can be derived based on mvendorid.

Also, all these T-HEAD specific changes in SBI PMU driver should be
implemented as erratas using ALTERNATIVE() macros.

Regards,
Anup



>
> > To work properly, this requires a matching change in SBI, though the actual
> > interface between kernel and SBI does not change.
> >
>
> Do you have a working OpenSBI implementation for this ?
>
> > The main differences are a the overflow CSR and irq number.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c | 27 +++++++++++++++++++--------
> >  1 file changed, 19 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 6f6681bbfd36..4589166e0de4 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -41,12 +41,17 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
> >         NULL,
> >  };
> >
> > +#define THEAD_C9XX_RV_IRQ_PMU                  17
> > +#define THEAD_C9XX_CSR_SCOUNTEROF              0x5c5
> > +
> >  /*
> >   * RISC-V doesn't have hetergenous harts yet. This need to be part of
> >   * per_cpu in case of harts with different pmu counters
> >   */
> >  static union sbi_pmu_ctr_info *pmu_ctr_list;
> > +static unsigned int riscv_pmu_irq_num;
> >  static unsigned int riscv_pmu_irq;
> > +static bool is_thead_c9xx;
> >
> >  struct sbi_pmu_event_data {
> >         union {
> > @@ -575,7 +580,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
> >         fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
> >         event = cpu_hw_evt->events[fidx];
> >         if (!event) {
> > -               csr_clear(CSR_SIP, SIP_LCOFIP);
> > +               csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> >                 return IRQ_NONE;
> >         }
> >
> > @@ -583,13 +588,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
> >         pmu_sbi_stop_hw_ctrs(pmu);
> >
> >         /* Overflow status register should only be read after counter are stopped */
> > -       overflow = csr_read(CSR_SSCOUNTOVF);
> > +       overflow = !is_thead_c9xx ? csr_read(CSR_SSCOUNTOVF)
> > +                                 : csr_read(THEAD_C9XX_CSR_SCOUNTEROF);
> >
> >         /*
> >          * Overflow interrupt pending bit should only be cleared after stopping
> >          * all the counters to avoid any race condition.
> >          */
> > -       csr_clear(CSR_SIP, SIP_LCOFIP);
> > +       csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> >
> >         /* No overflow bit is set */
> >         if (!overflow)
> > @@ -653,8 +659,8 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
> >
> >         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> >                 cpu_hw_evt->irq = riscv_pmu_irq;
> > -               csr_clear(CSR_IP, BIT(RV_IRQ_PMU));
> > -               csr_set(CSR_IE, BIT(RV_IRQ_PMU));
> > +               csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
> > +               csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
> >                 enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
> >         }
> >
> > @@ -665,7 +671,7 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
> >  {
> >         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> >                 disable_percpu_irq(riscv_pmu_irq);
> > -               csr_clear(CSR_IE, BIT(RV_IRQ_PMU));
> > +               csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
> >         }
> >
> >         /* Disable all counters access for user mode now */
> > @@ -681,7 +687,11 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
> >         struct device_node *cpu, *child;
> >         struct irq_domain *domain = NULL;
> >
> > -       if (!riscv_isa_extension_available(NULL, SSCOFPMF))
> > +       is_thead_c9xx = (sbi_get_mvendorid() == THEAD_VENDOR_ID &&
> > +                        sbi_get_marchid() == 0 &&
> > +                        sbi_get_mimpid() == 0);
> > +
> > +       if (!riscv_isa_extension_available(NULL, SSCOFPMF) && !is_thead_c9xx)
> >                 return -EOPNOTSUPP;
> >
> >         for_each_of_cpu_node(cpu) {
> > @@ -703,7 +713,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
> >                 return -ENODEV;
> >         }
> >
> > -       riscv_pmu_irq = irq_create_mapping(domain, RV_IRQ_PMU);
> > +       riscv_pmu_irq_num = !is_thead_c9xx ? RV_IRQ_PMU : THEAD_C9XX_RV_IRQ_PMU;
> > +       riscv_pmu_irq = irq_create_mapping(domain, riscv_pmu_irq_num);
> >         if (!riscv_pmu_irq) {
> >                 pr_err("Failed to map PMU interrupt for node\n");
> >                 return -ENODEV;
> > --
> > 2.35.1
> >
>
>
> --
> Regards,
> Atish
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
