Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB36FC38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdjMuA/0McP0QzsvXlZv6/kCGvmV+NWQM9HJ/gL1STI=; b=NngEy1OhoDRnq8
	agO9etovwNxYevgjugjbPOxgf2Ti+zSBqtEbyzBkex9WKk2Z2Oo2pdd2l6Y+ZJ4XkpNGT7xZf4UdP
	efgsAQyw2x9dx0YQA7l5OpunY1vDbt8ZbCdHqmEdBnhJQkrJV5OE8znmGYOX339BQmDupJOAkAHYr
	rC4BAVId9Bq63ltbODqEgz8DN6p59T0BgSWfubiWJkIPd5+AGTALOdAvKPltsdJLzy7RKaGl04K1c
	6fvx743pfECNCq65/72zVXqUUIpUTZy1QKg6kfVQi8MhYjWg9kr5lrEYhxaPF2FpoOOJ7oMw5q6bt
	0g3qrjjX4LmO+LDF+vWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN97l-00Ax5N-Ff; Wed, 01 Feb 2023 09:09:49 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN97g-00Ax2z-Du
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 09:09:47 +0000
Received: by mail-vk1-xa33.google.com with SMTP id s76so3448408vkb.9
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 01:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aITMviYfm8fMzGzu1E4FJT26sq3+JmPG6tHklfmZTHM=;
        b=DhEcJjCLxeylirs1z9kQ4cZENCgjXvZoi58R4zINMkRoQXAbqSNL9RmWH5pZsZ6BFb
         z5PRQiRhPf/jRoEukij1FLqrjJPHGyz2/fhqDqrgrpqS5UlBxZEWwRcWOAlaJ/S/lo5F
         z5XYMeE0vt9p/jksQ93UO9YYeiqTKYdYLNyUkAfFAld2f7/2gIAn3WhMLCN+QGpCs8k/
         cBaUCOPA0IjSxFHify4QD9HoAIQ+1eD5Is+Trmeq2MdGBrhCD6NpCvcikl7UIvZVwrdB
         +bvQgIkDMuLOa5UXmaSBR/33ZcPvp33Cj3eyGYeE9AL21irz2ossPXclZ5WqalJoa9BL
         4tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aITMviYfm8fMzGzu1E4FJT26sq3+JmPG6tHklfmZTHM=;
        b=XjfNqN0t5k4s82XrWLyF6HYvomW2REk2Wb8MbQekbvEYF3bs41muyPP+F+XvBFY/ZL
         /KiorNGzV1tyZTkug1faLaYApu1z8uDaBd3P7fh4nYHBLNo0ps5CRaZmmqjHYHvOlgot
         8FWZCZBvt+6u4LEVcBrY+kL6gCebO+Rq/Y6TdmWQdnPEJAQr0U4pruX5fDgaFbsViKFU
         gCKygXq7M4Ukj9aZojULfP5vPWq+fVzIm4zyhiLJkIkiTWCZKwRm57XKQktsSd3fKm8h
         cM2jO2QyO3B1Gi6BvDdX9jPhM4H8v4BDKAELFzhrHy4bjWyNoAm8ut84j+AuoR1AuC//
         70vQ==
X-Gm-Message-State: AO0yUKWCxMUz9H4E1R4zBEIkZ2RPg1RSI3G0KiqFwMna23r7CTse0BiP
	V7iLBWIjGcFcu0PE73jomAnCdAdQi6+aawRUcLfFKA==
X-Google-Smtp-Source: AK7set9KkJGY2ec3OdKKnCoSlIqqx4LSiBC81tOJA0eLV87kcizG+AoJ1kaKuVpatq00rMhYlMGCbBol3NcVP4VZqaI=
X-Received: by 2002:a1f:6e0c:0:b0:3e1:95e8:fe1e with SMTP id
 j12-20020a1f6e0c000000b003e195e8fe1emr248504vkc.1.1675242581785; Wed, 01 Feb
 2023 01:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-12-atishp@rivosinc.com>
 <CAAhSdy1+6AprOdzRRTG98p6swisNFO6MUKjXobxW3RWbixvjCg@mail.gmail.com>
 <CAOnJCU+=A1GXvaQis5RrDabPAvAZccmc9HF1KU4ReuRTSx5pCQ@mail.gmail.com> <CAOnJCUL27aBGre7=mPX7BwMUkUN8CC_UFzmFh7W9LzCxktyGVg@mail.gmail.com>
In-Reply-To: <CAOnJCUL27aBGre7=mPX7BwMUkUN8CC_UFzmFh7W9LzCxktyGVg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 1 Feb 2023 14:39:30 +0530
Message-ID: <CAK9=C2U7pP8VegGTaDJhkh2gBVzhPmpx+Um=QCC7uZ-5k4KyOQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] RISC-V: KVM: Implement trap & emulate for hpmcounters
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_010944_514157_D3122054 
X-CRM114-Status: GOOD (  35.91  )
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

On Wed, Feb 1, 2023 at 2:29 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Jan 31, 2023 at 2:46 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Sun, Jan 29, 2023 at 4:44 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
> > > >
> > > > As the KVM guests only see the virtual PMU counters, all hpmcounter
> > > > access should trap and KVM emulates the read access on behalf of guests.
> > > >
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > ---
> > > >  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++++
> > > >  arch/riscv/kvm/vcpu_insn.c            |  4 ++-
> > > >  arch/riscv/kvm/vcpu_pmu.c             | 45 ++++++++++++++++++++++++++-
> > > >  3 files changed, 63 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > index 3f43a43..022d45d 100644
> > > > --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > @@ -43,6 +43,19 @@ struct kvm_pmu {
> > > >  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
> > > >  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
> > > >
> > > > +#if defined(CONFIG_32BIT)
> > > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > > +{ .base = CSR_CYCLEH,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
> > > > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > > > +#else
> > > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > > > +#endif
> > > > +
> > > > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > > > +                               unsigned long *val, unsigned long new_val,
> > > > +                               unsigned long wr_mask);
> > > > +
> > > >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
> > > >  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> > > >                                 struct kvm_vcpu_sbi_ext_data *edata);
> > > > @@ -65,6 +78,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> > > >  #else
> > > >  struct kvm_pmu {
> > > >  };
> > > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > > +{ .base = 0,      .count = 0, .func = NULL },
> > > > +
> > >
> > > Redundant newline here.
> > >
> >
> > Fixed.
> >
> > > >
> > > >  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> > > >  {
> > > > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > > > index 0bb5276..f689337 100644
> > > > --- a/arch/riscv/kvm/vcpu_insn.c
> > > > +++ b/arch/riscv/kvm/vcpu_insn.c
> > > > @@ -213,7 +213,9 @@ struct csr_func {
> > > >                     unsigned long wr_mask);
> > > >  };
> > > >
> > > > -static const struct csr_func csr_funcs[] = { };
> > > > +static const struct csr_func csr_funcs[] = {
> > > > +       KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> > > > +};
> > > >
> > > >  /**
> > > >   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
> > > > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > > > index 7713927..894053a 100644
> > > > --- a/arch/riscv/kvm/vcpu_pmu.c
> > > > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > > > @@ -17,6 +17,44 @@
> > > >
> > > >  #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
> > > >
> > > > +static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > > > +                       unsigned long *out_val)
> > > > +{
> > > > +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > > +       struct kvm_pmc *pmc;
> > > > +       u64 enabled, running;
> > > > +
> > > > +       pmc = &kvpmu->pmc[cidx];
> > > > +       if (!pmc->perf_event)
> > > > +               return -EINVAL;
> > > > +
> > > > +       pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> > > > +       *out_val = pmc->counter_val;
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > > > +                               unsigned long *val, unsigned long new_val,
> > > > +                               unsigned long wr_mask)
> > > > +{
> > > > +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > > +       int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
> > > > +
> > > > +       if (!kvpmu || !kvpmu->init_done)
> > > > +               return KVM_INSN_EXIT_TO_USER_SPACE;
> > >
> > > As discussed previously, this should be KVM_INSN_ILLEGAL_TRAP.
> > >
>
> Thinking about it more, this results in a panic in guest S-mode which
> is probably undesirable.
> As per your earlier suggestion, we can return 0 for cycle/instret
> counters if accessed.
> This is only possible through legacy pmu drivers running in guests or
> some other OS that access any hpmcounters
> for random reasons.
>
> I think we should return KVM_INSN_ILLEGAL_TRAP for other counters and
> make the guest kernel panic.
> This does separate the behavior between fixed and programmable
> counters when everything is denied access in hcounteren.
>
> The new code will look like this:
>
> if (!kvpmu || !kvpmu->init_done) {
>     if (csr_num == CSR_CYCLE || csr_num == CSR_INSTRET) {
>         *val = 0;
>         return ret;
>     } else
>          return KVM_INSN_ILLEGAL_TRAP;
> }
>
> Let me know if you think otherwise.

Looks good to me. Please also add comment block inside
"if (!kvpmu || !kvpmu->init_done)"

>
> >
> > Done.
> > > > +
> > > > +       if (wr_mask)
> > > > +               return KVM_INSN_ILLEGAL_TRAP;
> > > > +
> > > > +       cidx = csr_num - CSR_CYCLE;
> > > > +
> > > > +       if (pmu_ctr_read(vcpu, cidx, val) < 0)
> > > > +               return KVM_INSN_EXIT_TO_USER_SPACE;
> > >
> > > Same as above.
> > >
>
> We can get rid of this as pmu_ctr_read doesn't return errors anyways.
>
> >
> > Done.
> >
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
> > > >  {
> > > >         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > > @@ -69,7 +107,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> > > >  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > > >                                 struct kvm_vcpu_sbi_ext_data *edata)
> > > >  {
> > > > -       /* TODO */
> > > > +       int ret;
> > > > +
> > > > +       ret = pmu_ctr_read(vcpu, cidx, &edata->out_val);
> > > > +       if (ret == -EINVAL)
> > > > +               edata->err_val = SBI_ERR_INVALID_PARAM;
> > > > +
> > > >         return 0;
> > > >  }
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > Regards,
> > > Anup
> >
> >
> >
> > --
> > Regards,
> > Atish
>
>
>
> --
> Regards,
> Atish

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
