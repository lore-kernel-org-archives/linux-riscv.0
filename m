Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BD1C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn7xTLt6KwPjnsY1otxbg3LUiPtL1GE3U1iPBFxRSvU=; b=PKQRoSXWv58KYY
	IpxtTB+YMkhMDEX8zslE11JOR/5CosAZd0U5iVtlsEicpk4Xb7VPla8/mkPOACkwk6cZOevNzkbYr
	kdyyipOz9NS1d9rBcORSPP92jFE3zJ90aQQn5VAyAC2rcgvBOtEQGqd38Y6hWKjqs8LjlMPKDQwPs
	D14cYjRJ5R88HGqCeQ2E20x2Tgu4H362paY+YzaWgGt+drXvD1z5OngSkiPkrugPi71dz4ydr3OGY
	NbtRr0/lFCu3kztSlHt4AzvJqwCeNNQhEmscKUFatG/zz/RRIaaC5Y+oHNoamtXI1ZlWWl9VR/sRS
	/xkSSp+p/egdYgPwBimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8xT-00Au2K-Mz; Wed, 01 Feb 2023 08:59:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8xR-00Au1C-2r
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 08:59:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id z1so10248733plg.6
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 00:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MsiWfKMhO8V8ake/oMGe13EZKsi0si1DZ5pIY6nialg=;
        b=QQ4xw7awnS2eQeWmbichWhcwdgl0psemdV5DTEqye2xxbnf30Om3rRBkyNtwI8M5Pp
         X0KEJvGHX4xInJ4TsWXwbxlqoGfdEtw+DMlbjiIl6SI2439kwf9f4KiVjWJtk7dphYzC
         rXne3lAenDp4/eDSNJq2CCnWnP/Hy1gUiENu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsiWfKMhO8V8ake/oMGe13EZKsi0si1DZ5pIY6nialg=;
        b=WtzOkApH0nFqW97qTyG3xu+mr+gHp60NtUduOiVworL49Ed9aBBEOMrOjt63s/XZiQ
         JukHqmvBfBwWK6tTuSdl9QqkvYcK4sUxyKwjzRO8LlKKgv/sDnk0hACw9V+sM3eAOkCP
         PG8R7GHem9T8/diaaS/Fq04/qQ1qOzu1z+bRq26Xt/EPxxXVEN08LGGN6j/EvC/OBCgI
         y1nw1qCRhXJiKf55dXCu6mS6gxX3ddo+rHzh9cxhEkCwaa5bOCxfK7omK0bg3QKzkBzv
         y1t7qhrE+XYBzBbvX7aD1vyhk+plqSkOm8zIx7kW1HZSnUXbIWPe08aiEbX76oLdFZYm
         CfpQ==
X-Gm-Message-State: AO0yUKV6JngWW3OCyHIiRhQO82s3FgtY6RFLiHdDPvw38V1JHwS6ife/
	lFBUH663tXNvkGQTtiNzPxzlLO4a2OOgNiXWhB8g
X-Google-Smtp-Source: AK7set/7hUDhdbximkycvws+gp+DAtJQVy+K2ZGiJXrD0KIyNd0YO7VDr6uvWis6v4ws3ZeBQwaXAEhGKT70VbgU4FE=
X-Received: by 2002:a17:90a:1346:b0:22c:1613:164f with SMTP id
 y6-20020a17090a134600b0022c1613164fmr228761pjf.103.1675241947590; Wed, 01 Feb
 2023 00:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-12-atishp@rivosinc.com>
 <CAAhSdy1+6AprOdzRRTG98p6swisNFO6MUKjXobxW3RWbixvjCg@mail.gmail.com> <CAOnJCU+=A1GXvaQis5RrDabPAvAZccmc9HF1KU4ReuRTSx5pCQ@mail.gmail.com>
In-Reply-To: <CAOnJCU+=A1GXvaQis5RrDabPAvAZccmc9HF1KU4ReuRTSx5pCQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 1 Feb 2023 00:58:54 -0800
Message-ID: <CAOnJCUL27aBGre7=mPX7BwMUkUN8CC_UFzmFh7W9LzCxktyGVg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] RISC-V: KVM: Implement trap & emulate for hpmcounters
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_005909_136162_7340D41E 
X-CRM114-Status: GOOD (  30.43  )
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

On Tue, Jan 31, 2023 at 2:46 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sun, Jan 29, 2023 at 4:44 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
> > >
> > > As the KVM guests only see the virtual PMU counters, all hpmcounter
> > > access should trap and KVM emulates the read access on behalf of guests.
> > >
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++++
> > >  arch/riscv/kvm/vcpu_insn.c            |  4 ++-
> > >  arch/riscv/kvm/vcpu_pmu.c             | 45 ++++++++++++++++++++++++++-
> > >  3 files changed, 63 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > index 3f43a43..022d45d 100644
> > > --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > @@ -43,6 +43,19 @@ struct kvm_pmu {
> > >  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
> > >  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
> > >
> > > +#if defined(CONFIG_32BIT)
> > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > +{ .base = CSR_CYCLEH,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
> > > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > > +#else
> > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> > > +#endif
> > > +
> > > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > > +                               unsigned long *val, unsigned long new_val,
> > > +                               unsigned long wr_mask);
> > > +
> > >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
> > >  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> > >                                 struct kvm_vcpu_sbi_ext_data *edata);
> > > @@ -65,6 +78,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> > >  #else
> > >  struct kvm_pmu {
> > >  };
> > > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > > +{ .base = 0,      .count = 0, .func = NULL },
> > > +
> >
> > Redundant newline here.
> >
>
> Fixed.
>
> > >
> > >  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> > >  {
> > > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > > index 0bb5276..f689337 100644
> > > --- a/arch/riscv/kvm/vcpu_insn.c
> > > +++ b/arch/riscv/kvm/vcpu_insn.c
> > > @@ -213,7 +213,9 @@ struct csr_func {
> > >                     unsigned long wr_mask);
> > >  };
> > >
> > > -static const struct csr_func csr_funcs[] = { };
> > > +static const struct csr_func csr_funcs[] = {
> > > +       KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> > > +};
> > >
> > >  /**
> > >   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
> > > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > > index 7713927..894053a 100644
> > > --- a/arch/riscv/kvm/vcpu_pmu.c
> > > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > > @@ -17,6 +17,44 @@
> > >
> > >  #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
> > >
> > > +static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > > +                       unsigned long *out_val)
> > > +{
> > > +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > +       struct kvm_pmc *pmc;
> > > +       u64 enabled, running;
> > > +
> > > +       pmc = &kvpmu->pmc[cidx];
> > > +       if (!pmc->perf_event)
> > > +               return -EINVAL;
> > > +
> > > +       pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> > > +       *out_val = pmc->counter_val;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > > +                               unsigned long *val, unsigned long new_val,
> > > +                               unsigned long wr_mask)
> > > +{
> > > +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > +       int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
> > > +
> > > +       if (!kvpmu || !kvpmu->init_done)
> > > +               return KVM_INSN_EXIT_TO_USER_SPACE;
> >
> > As discussed previously, this should be KVM_INSN_ILLEGAL_TRAP.
> >

Thinking about it more, this results in a panic in guest S-mode which
is probably undesirable.
As per your earlier suggestion, we can return 0 for cycle/instret
counters if accessed.
This is only possible through legacy pmu drivers running in guests or
some other OS that access any hpmcounters
for random reasons.

I think we should return KVM_INSN_ILLEGAL_TRAP for other counters and
make the guest kernel panic.
This does separate the behavior between fixed and programmable
counters when everything is denied access in hcounteren.

The new code will look like this:

if (!kvpmu || !kvpmu->init_done) {
    if (csr_num == CSR_CYCLE || csr_num == CSR_INSTRET) {
        *val = 0;
        return ret;
    } else
         return KVM_INSN_ILLEGAL_TRAP;
}

Let me know if you think otherwise.

>
> Done.
> > > +
> > > +       if (wr_mask)
> > > +               return KVM_INSN_ILLEGAL_TRAP;
> > > +
> > > +       cidx = csr_num - CSR_CYCLE;
> > > +
> > > +       if (pmu_ctr_read(vcpu, cidx, val) < 0)
> > > +               return KVM_INSN_EXIT_TO_USER_SPACE;
> >
> > Same as above.
> >

We can get rid of this as pmu_ctr_read doesn't return errors anyways.

>
> Done.
>
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
> > >  {
> > >         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > > @@ -69,7 +107,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> > >  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > >                                 struct kvm_vcpu_sbi_ext_data *edata)
> > >  {
> > > -       /* TODO */
> > > +       int ret;
> > > +
> > > +       ret = pmu_ctr_read(vcpu, cidx, &edata->out_val);
> > > +       if (ret == -EINVAL)
> > > +               edata->err_val = SBI_ERR_INVALID_PARAM;
> > > +
> > >         return 0;
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
> >
> > Regards,
> > Anup
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
