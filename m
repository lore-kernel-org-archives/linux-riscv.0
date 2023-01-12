Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E643C61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKmVFLKE/leEVFhxPCgld0/lluqZAejW1xMka/ucdfo=; b=HkdUzTPEW5HR/m
	aXBVA+5mV/7fqLP7JONMHaPx1NCUvCkBpnmJukqb3bzBfbUrciPaiaBX3YykBIydja78aZtG+i4bU
	DqwZYAPmedxPemLAab7HTDvIWLFjjMqmn1VWcHcdDg+er9xnO8sZ12sbwMSHUcLNUK8VuCC9ltfNL
	X6VaLYQNvthbdlBw0Tc0FsUk84ZiH2uL2WtzirgZ1V67TZEtroM5TLUDHWx6xJ/GXOapBtgrfKg8O
	HnBGXu/mrAeBeHrwAHMAbBmnxHZmgDpNMY6SLKX5e0ppofbthx0I1ZjyIue5PoYJRJx7L5cgG+cmd
	LMTIIYVyjXENnmRf+FTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG29f-00GGmp-Vg; Thu, 12 Jan 2023 18:18:24 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG29a-00GGkO-Pf
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 18:18:21 +0000
Received: by mail-pg1-x530.google.com with SMTP id f3so13348154pgc.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 10:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=imZPqnzDLF2i+5vb28S1oLdL2hZHuB+mTkpveovIShk=;
        b=8VPUwINSyiSI8p+IdNef4gnXqazXTASW8rBSVLlDYvmPraC9doolFMbw3zp/AJjK6m
         Rf7FeuSH8EFiRzhi8a2coSTBWG6ltnJghPB4eoWhm645OGLNdAbbP0i3HCo+H7/+/R+h
         +3QmsyeDcsezIxnvJ/Bux8S2zdsvWQBPmE1Z2/XCBemjEz1NAd1qMe6yF7K4ormQQJwm
         nVWCX4gWlYISWrLoo03A7nPZIkgjtpVyNAZOZJ3PKyvMPuz6/ibPdUHSXJaVI5Mokhdb
         FOFv8/88KlRvqTyZaxBzoOcZ7KQWg6A/RhfCMAXEySD2Num6gP/vrdCa/hkP0F5cLPx5
         +jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imZPqnzDLF2i+5vb28S1oLdL2hZHuB+mTkpveovIShk=;
        b=ZI15MPzXmvC1Yg5BKxng8QXnTPyUiJF8gHAhdjYqqYFuPQOHh4cf9rR7TVTZneK4X/
         mxf2kHmAdO6frmhRcvii6Xceh8Sv3MY0e73xpbWWBFcY6moYHDJiqIr3ur3n3ad/gqGD
         BXScLwgWwkN0htBekkrIWA95VEMw4oTRriTHkd93B9MgGBVhLqP/x10lCBlK41Nntk6M
         XHKtUTn6oDSHc0yIcSou2sENAV5omhERHboIn0//RQ9ZSLFCWcSlZ4hw34UNWN2cIT36
         Up0d+PVsvtcTDavsurrDPr5rspFOowSl86Z9sOGkPaGT+2qxtT/e2MqN2toe2JxGhgO7
         3Kaw==
X-Gm-Message-State: AFqh2kqNxdMW9tjPcPeJEA0ASKHgO3zAkf0Ea5nBv5z431gC+ZkBMZVU
	g6li69pvuMXGc2/3RJh5a9Mn833yJovH6n69i4HKjg==
X-Google-Smtp-Source: AMrXdXs4LmKDqs/bftcofPxFVGYVQUr5DcCTiOz9NFVAYiCNRH8NqmJaD8MgxRimG8MqrplGeje8Ej8e82AA9dGt8Vs=
X-Received: by 2002:a63:d902:0:b0:490:597e:1c0a with SMTP id
 r2-20020a63d902000000b00490597e1c0amr3599808pgg.309.1673547496600; Thu, 12
 Jan 2023 10:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20221215170046.2010255-1-atishp@rivosinc.com> <20221215170046.2010255-2-atishp@rivosinc.com>
 <20230112100608.d7tnvhbotjfctlgk@orel>
In-Reply-To: <20230112100608.d7tnvhbotjfctlgk@orel>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 12 Jan 2023 10:18:05 -0800
Message-ID: <CAHBxVyESkQ9Krmn-44f-A8hYzMrZBtBfq15fdx-sHDQfkBMtKQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] RISC-V: Define helper functions expose hpm
 counter width and count
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Eric Lin <eric.lin@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_101818_874057_B6F3B691 
X-CRM114-Status: GOOD (  35.01  )
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

On Thu, Jan 12, 2023 at 2:06 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Dec 15, 2022 at 09:00:36AM -0800, Atish Patra wrote:
> > KVM module needs to know how many hardware counters and the counter
> > width that the platform supports. Otherwise, it will not be able to show
> > optimal value of virtual counters to the guest. The virtual hardware
> > counters also need to have the same width as the logical hardware
> > counters for simplicity. However, there shouldn't be mapping between
> > virtual hardware counters and logical hardware counters. As we don't
> > support hetergeneous harts or counters with different width as of now,
> > the implementation relies on the counter width of the first available
> > programmable counter.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c   | 35 +++++++++++++++++++++++++++++++++-
> >  include/linux/perf/riscv_pmu.h |  3 +++
> >  2 files changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 3852c18..65d4aa4 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -49,6 +49,9 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
> >  static union sbi_pmu_ctr_info *pmu_ctr_list;
> >  static unsigned int riscv_pmu_irq;
> >
> > +/* Cache the available counters in a bitmask */
> > +unsigned long cmask;
>
> I presume this can be static since it's not getting added to the header.
> And don't we need this to be a long long for rv32? We should probably
> just use u64.
>

Yeah. u64 would be better. I will change it along with static. Thanks.

> > +
> >  struct sbi_pmu_event_data {
> >       union {
> >               union {
> > @@ -264,6 +267,37 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
> >       return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
> >  }
> >
> > +/*
> > + * Returns the counter width of a programmable counter and number of hardware
> > + * counters. As we don't support heterneous CPUs yet, it is okay to just
>
> heterogeneous
>

Fixed.

> > + * return the counter width of the first programmable counter.
> > + */
> > +int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
> > +{
> > +     int i;
> > +     union sbi_pmu_ctr_info *info;
> > +     u32 hpm_width = 0, hpm_count = 0;
> > +
> > +     if (!cmask)
> > +             return -EINVAL;
> > +
> > +     for_each_set_bit(i, &cmask, RISCV_MAX_COUNTERS) {
> > +             info = &pmu_ctr_list[i];
> > +             if (!info)
> > +                     continue;
> > +             if (!hpm_width && (info->csr != CSR_CYCLE) && (info->csr != CSR_INSTRET))
>
> nit: No need for () around the != expressions
>

Fixed.

> > +                     hpm_width = info->width;
> > +             if (info->type == SBI_PMU_CTR_TYPE_HW)
> > +                     hpm_count++;
> > +     }
> > +
> > +     *hw_ctr_width = hpm_width;
> > +     *num_hw_ctr = hpm_count;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(riscv_pmu_get_hpm_info);
>
> EXPORT_SYMBOL_GPL ?
>

Is that mandatory ? I have seen usage of both in arch/riscv and other
places though.
I am also not sure if any other non-GPL module should/need access to this.

> > +
> >  static int pmu_sbi_ctr_get_idx(struct perf_event *event)
> >  {
> >       struct hw_perf_event *hwc = &event->hw;
> > @@ -798,7 +832,6 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
> >  static int pmu_sbi_device_probe(struct platform_device *pdev)
> >  {
> >       struct riscv_pmu *pmu = NULL;
> > -     unsigned long cmask = 0;
> >       int ret = -ENODEV;
> >       int num_counters;
> >
> > diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> > index e17e86a..a1c3f77 100644
> > --- a/include/linux/perf/riscv_pmu.h
> > +++ b/include/linux/perf/riscv_pmu.h
> > @@ -73,6 +73,9 @@ void riscv_pmu_legacy_skip_init(void);
> >  static inline void riscv_pmu_legacy_skip_init(void) {};
> >  #endif
> >  struct riscv_pmu *riscv_pmu_alloc(void);
> > +#ifdef CONFIG_RISCV_PMU_SBI
> > +int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
> > +#endif
> >
> >  #endif /* CONFIG_RISCV_PMU */
> >
> > --
> > 2.25.1
> >
>
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
