Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121B8C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 23:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8X6b0dhAPPOKV7Io41yufFvon2ZHBZvoYj7aV3Wd7zc=; b=BeRbJjduiOVzWr
	yqEgU+bfO0GfmqvnJmcEktQ7KgkePMbvFsthoYdizLpsEo40cxByzIIq5uUw3eVbA3uyh9KhLlHFU
	vJ5rEOaKwLxkqy72rRLVu9XbfCYFfTUonSAsnHQgtufa8Frj1RV8CurB9o0wTCgTXiDA0mdrOp6Ti
	BIjcDuLcwsRRH6ui7qg/GXs9vNGJnpsYMxrQCADbB37HRcrP5v4XKhUWajcpxlRM2FXmAP5frBoaQ
	5f8N2U35MiatsnyHgpiHf7LFxpQ7i2/UfScbHqjU6uIPxsI3ekbjF4rdGSaHQ4xK8f0SmCnkd56So
	sZFyamSKbXCv5H6AcOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxcQi-00CH1u-F3; Tue, 22 Nov 2022 23:11:52 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxcQf-00CH0h-MY
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 23:11:51 +0000
Received: by mail-oo1-xc33.google.com with SMTP id e11-20020a4ab14b000000b0049be568062bso2485006ooo.4
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 15:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0F5kMiUlq64q8nCDKVZtkRiIUZb8kvHBOw3uONUExAc=;
        b=fPTnVe3oiuwz/G5MN1kBQcgY7ChJLEbwMY+Hfh9hd1AQPTKW1l2XWXSPRp8J/z0ZZq
         WlZrLBdvtg5j4rFva57cIh3QxE4uw2zvYXnT0zaBeX0hXFhtlQK8OoZRXXvYSr9qrRl0
         cuywZC0taIV++s/fssiNKbQok+rKoJGvN85v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0F5kMiUlq64q8nCDKVZtkRiIUZb8kvHBOw3uONUExAc=;
        b=WMGbJsTmY2g/147vVZhYM0p1JXuOYL9l2WasxoaTUhe7bzbwM3S77o6p4qg84aUxiF
         H7FUwItIrytspoxz3J0jikp6E1ZwdOVZ1Z5tQQLldxp7ef8+w1VQVOASpGOlKaUNPISp
         DNP5NHnb4zT0KcTJC/+AS9dt5ylASoCy/0F7zRX4j5HDN/MMOmxVPisp8eiXwuy7i29D
         Ogd67c8g5EEW3Y1hJGacc1dkhsysPaAsQ/wvWwf/HLejuVLVI7M+w6AQyk6TPR3E7uM0
         y2ciT08HUc0I9E7JaFrLtAAvtq+l8pdCZtWwnQbDhZmNVx/rd8v8rWTMQjSkFU1YeeLl
         adPw==
X-Gm-Message-State: ANoB5plVSfhzi3jkGtn64aHBcWSEBKWi5VD/bmiV7DF5nnfRyZ8TMRor
	shzcEOW9//TCavI5/8tyTA2yhBU3+GlDOaWDfnpx
X-Google-Smtp-Source: AA0mqf57bcoG90p5DmgjAxb7W0jzbcNfQw08fpiG6rN94B6mly1lkSsznesqy37/frKm6RIeW2AWt6sIRigspQOcLLY=
X-Received: by 2002:a4a:dcd2:0:b0:49f:b5fe:2b43 with SMTP id
 h18-20020a4adcd2000000b0049fb5fe2b43mr11172083oou.49.1669158705939; Tue, 22
 Nov 2022 15:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-8-atishp@rivosinc.com>
 <20221101143548.plvlhedzt3oifa3u@kamzik>
In-Reply-To: <20221101143548.plvlhedzt3oifa3u@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Nov 2022 15:11:35 -0800
Message-ID: <CAOnJCU+ddtoJtdHYQXTH2_m57SEuFPj7ndpQJKM9v4JeYW=QnQ@mail.gmail.com>
Subject: Re: [RFC 7/9] RISC-V: KVM: Implement trap & emulate for hpmcounters
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_151149_743542_A7B7A91E 
X-CRM114-Status: GOOD (  27.09  )
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

On Tue, Nov 1, 2022 at 7:35 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jul 18, 2022 at 10:02:03AM -0700, Atish Patra wrote:
> > As the KVM guests only see the virtual PMU counters, all hpmcounter
> > access should trap and KVM emulates the read access on behalf of guests.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 +++++++++
> >  arch/riscv/kvm/vcpu_insn.c            |  1 +
> >  arch/riscv/kvm/vcpu_pmu.c             | 47 +++++++++++++++++++++++----
> >  3 files changed, 57 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > index bffee052f2ae..5410236b62a8 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > @@ -39,6 +39,19 @@ struct kvm_pmu {
> >  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
> >  #define pmc_to_pmu(pmc)   (&(pmc)->vcpu->arch.pmu)
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
> > +                             unsigned long *val, unsigned long new_val,
> > +                             unsigned long wr_mask);
> > +
> >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val);
> >  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
> >                               unsigned long *ctr_info);
> > @@ -59,6 +72,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> >  #else
> >  struct kvm_pmu {
> >  };
> > +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> > +{ .base = 0,      .count = 0, .func = NULL },
> > +
> >
> >  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> >  {
> > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > index 0aa334f853c8..7c2a4b1a69f7 100644
> > --- a/arch/riscv/kvm/vcpu_insn.c
> > +++ b/arch/riscv/kvm/vcpu_insn.c
> > @@ -215,6 +215,7 @@ struct csr_func {
> >  };
> >
> >  static const struct csr_func csr_funcs[] = {
> > +     KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> >  };
> >
> >  /**
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index 3168ed740bdd..5434051f495d 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -14,6 +14,46 @@
> >  #include <asm/kvm_vcpu_pmu.h>
> >  #include <linux/kvm_host.h>
> >
> > +int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > +                             unsigned long *out_val)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +     struct kvm_pmc *pmc;
> > +     u64 enabled, running;
> > +
> > +     if (!kvpmu)
> > +             return -EINVAL;
> > +
> > +     pmc = &kvpmu->pmc[cidx];
> > +     if (!pmc->perf_event)
> > +             return -EINVAL;
> > +
> > +     pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> > +     *out_val = pmc->counter_val;
> > +
> > +     return 0;
> > +}
> > +
> > +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> > +                             unsigned long *val, unsigned long new_val,
> > +                             unsigned long wr_mask)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +     int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
> > +
> > +     if (!kvpmu)
> > +             return KVM_INSN_EXIT_TO_USER_SPACE;
> > +     //TODO: Should we check if vcpu pmu is initialized or not!
>
> I guess it depends on the path to this call. It'd be best to keep the
> checks to the minimum, so if this isn't a top level call then I'd say
> no, but we need to check in the top level.
>

Based on the discussion on PATCH 6 we won't require the initialization check
at these functions.

We can leave the paranoia sanity check at kvm_riscv_vcpu_pmu_num_ctrs and
kvm_riscv_vcpu_pmu_ctr_info though.

> > +     if (wr_mask)
> > +             return KVM_INSN_ILLEGAL_TRAP;
> > +     cidx = csr_num - CSR_CYCLE;
> > +
> > +     if (kvm_riscv_vcpu_pmu_ctr_read(vcpu, cidx, val) < 0)
> > +             return KVM_INSN_EXIT_TO_USER_SPACE;
> > +
> > +     return ret;
> > +}
> > +
> >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val)
> >  {
> >       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > @@ -60,13 +100,6 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
> >       return 0;
> >  }
> >
> > -int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> > -                             unsigned long *out_val)
> > -{
> > -     /* TODO */
> > -     return 0;
> > -}
> > -
> >  int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
> >  {
> >       int i = 0, num_hw_ctrs, num_fw_ctrs, hpm_width;
> > --
> > 2.25.1
> >
>
> Thanks,
> drew



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
