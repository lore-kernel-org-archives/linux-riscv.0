Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8EAC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 22:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FyaGaKt+fHhndJQTmIWgqTyaBcxkcddBXAs+bmDDYo=; b=NDvfO4WVsRdCQQ
	cylRPIdo2yuKigoqXsUETsFEYaiC/wT4efXkwsPqPRDkjMGQM3qLE3Pj6wFzc2RBFm+3dOL/h9d4V
	2bXAgQYZz0ShK3uCrji/a/fjU+RoIf7hGcOv2Zd8nsRl27QJSN9ILOAeu3n4RO1UwnhRkJqVlP9LJ
	AwjvrM1M3l3b1oAguPCkDXIaCuqdYVmOkfpUwY/ZFdJOjZkX2ptHyRpxdPxnG/MWIz+6RYTuWrHbU
	qiivten/W5f/1toOA8NJohuay4h+TM6R43BkFxj19r+PNqVybQv/hemMizJ7nRheuGDrfypcgP3mo
	EtO6nW+O3dZU5dGhtEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMzOv-009al7-84; Tue, 31 Jan 2023 22:46:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMzOr-009ak3-Nb
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 22:46:51 +0000
Received: by mail-pl1-x62d.google.com with SMTP id 5so16644250plo.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 14:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ChdY/BOQPZ1uBdSScQAnHVJgIw1TfyjijiWytBSiQJU=;
        b=P/csI0Dsr6pSP+yfsdWmPLyR2OV2O9L2+BIw5ZYpmKa46y6S8PELKWe4xTX4sx2mEN
         iz0CIV4aU/Xp55F7vPWK75l8XALnKMEi/qkTo8b0lRlStd85P958+Ao3ZedelC7yXENR
         ORsQfgbiccitrYTxaXdve26+HM4rKn+N02qzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChdY/BOQPZ1uBdSScQAnHVJgIw1TfyjijiWytBSiQJU=;
        b=2vjHy5lxPHleTNfWDGP0nrPN8sFobib7FXTUQ1wY3VmgImhFniRnsblrhjSbDHaqJl
         xcGRon4ji1jLcLPEl/Mt6Ri75sqg79SKhPzo9yQbYTxQJFiYosphIxgdI9Zr+HyyppZq
         iDBd9Vh1I1RUodYp+TlirImglOxptwaa8nnUFM0O7WPTiTw7T6OMmmBjx0/dLNl0zZ+D
         RIzh+Ls2kIODMclN9g/nXsvCmskjndvtdN+nkeVHHEm3OZZAqnaklReKfnDBbdbbaLcr
         ihA/W7FawPALv1fX2ILJQGF6o2hpsQaOJyQUFKdkcPLFuY/3ocFhaWF/JQ5Ph1gWFGbK
         4X2Q==
X-Gm-Message-State: AO0yUKWVWS4nNy4VIvWsYPl/e0gtNmIx/ZoBI+E+CjhtEwMuolSC/Sm7
	YQ7EJ4wksGsPwCEJQuSgx5DLXb82yC5uvZZnp8Nv
X-Google-Smtp-Source: AK7set8AS0MpCMygHXWVJkHhzF3cP+gjObUvIrlXz6+xUJd4hSDWhV5uI7961IASYnnUHYVzNYuuX139DCNVJlEBhXE=
X-Received: by 2002:a17:90a:2dc9:b0:22c:dd5:8f54 with SMTP id
 q9-20020a17090a2dc900b0022c0dd58f54mr4059996pjm.62.1675205208315; Tue, 31 Jan
 2023 14:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-12-atishp@rivosinc.com>
 <CAAhSdy1+6AprOdzRRTG98p6swisNFO6MUKjXobxW3RWbixvjCg@mail.gmail.com>
In-Reply-To: <CAAhSdy1+6AprOdzRRTG98p6swisNFO6MUKjXobxW3RWbixvjCg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 14:46:36 -0800
Message-ID: <CAOnJCU+=A1GXvaQis5RrDabPAvAZccmc9HF1KU4ReuRTSx5pCQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] RISC-V: KVM: Implement trap & emulate for hpmcounters
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_144649_792009_D351216A 
X-CRM114-Status: GOOD (  23.94  )
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

On Sun, Jan 29, 2023 at 4:44 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > As the KVM guests only see the virtual PMU counters, all hpmcounter
> > access should trap and KVM emulates the read access on behalf of guests.
> >
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++++
> >  arch/riscv/kvm/vcpu_insn.c            |  4 ++-
> >  arch/riscv/kvm/vcpu_pmu.c             | 45 ++++++++++++++++++++++++++-
> >  3 files changed, 63 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > index 3f43a43..022d45d 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > @@ -43,6 +43,19 @@ struct kvm_pmu {
> >  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
> >  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
> >
> > +#if defined(CONFIG_32BIT)
> > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > +{ .base = CSR_CYCLEH,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
> > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > +#else
> > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > +#endif
> > +
> > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > +                               unsigned long *val, unsigned long new_val,
> > +                               unsigned long wr_mask);
> > +
> >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
> >  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> >                                 struct kvm_vcpu_sbi_ext_data *edata);
> > @@ -65,6 +78,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> >  #else
> >  struct kvm_pmu {
> >  };
> > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > +{ .base = 0,      .count = 0, .func = NULL },
> > +
>
> Redundant newline here.
>

Fixed.

> >
> >  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> >  {
> > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > index 0bb5276..f689337 100644
> > --- a/arch/riscv/kvm/vcpu_insn.c
> > +++ b/arch/riscv/kvm/vcpu_insn.c
> > @@ -213,7 +213,9 @@ struct csr_func {
> >                     unsigned long wr_mask);
> >  };
> >
> > -static const struct csr_func csr_funcs[] = { };
> > +static const struct csr_func csr_funcs[] = {
> > +       KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> > +};
> >
> >  /**
> >   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index 7713927..894053a 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -17,6 +17,44 @@
> >
> >  #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
> >
> > +static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                       unsigned long *out_val)
> > +{
> > +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +       struct kvm_pmc *pmc;
> > +       u64 enabled, running;
> > +
> > +       pmc = &kvpmu->pmc[cidx];
> > +       if (!pmc->perf_event)
> > +               return -EINVAL;
> > +
> > +       pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> > +       *out_val = pmc->counter_val;
> > +
> > +       return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > +                               unsigned long *val, unsigned long new_val,
> > +                               unsigned long wr_mask)
> > +{
> > +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +       int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
> > +
> > +       if (!kvpmu || !kvpmu->init_done)
> > +               return KVM_INSN_EXIT_TO_USER_SPACE;
>
> As discussed previously, this should be KVM_INSN_ILLEGAL_TRAP.
>

Done.
> > +
> > +       if (wr_mask)
> > +               return KVM_INSN_ILLEGAL_TRAP;
> > +
> > +       cidx = csr_num - CSR_CYCLE;
> > +
> > +       if (pmu_ctr_read(vcpu, cidx, val) < 0)
> > +               return KVM_INSN_EXIT_TO_USER_SPACE;
>
> Same as above.
>

Done.

> > +
> > +       return ret;
> > +}
> > +
> >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
> >  {
> >         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > @@ -69,7 +107,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> >  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> >                                 struct kvm_vcpu_sbi_ext_data *edata)
> >  {
> > -       /* TODO */
> > +       int ret;
> > +
> > +       ret = pmu_ctr_read(vcpu, cidx, &edata->out_val);
> > +       if (ret == -EINVAL)
> > +               edata->err_val = SBI_ERR_INVALID_PARAM;
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.25.1
> >
>
> Regards,
> Anup



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
