Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07EBC61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 18:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mditOessVBXlrorUo88D89sogvSj7ypc/EtwTmBipwA=; b=wLXtjCdjQoDclt
	lR3cpbmHjbXhi99HZGWMtrY9Zae/NsK8xl+QnoLP7s13ntu/KzW9rjJiSgWHfiF8UtxOJf8Ah1sTP
	9q2fbFO7+TODN9IKKskBGFjg7cDV/D7WFfiNMtRqy2jVz1bywb0U4OhrTwlXMRlPZ2Ffa4QE+yzne
	EFkxRNbFMUYzh8vugg++rKp/6rXb2FOkhYUScjO3m00s58wNeZROxnWy3ykrI/yfu5jM1LIKjm9LA
	hlOCj7Fz9O0B+EmGiF9+OBU6VgXRhtUgti5+CBtAA7PPNMa7Ccs0G4T6EusQMttq5jeEP5OrkEGc9
	z/gIwid0d3q2VkFjy22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG1zM-00GDbk-1j; Thu, 12 Jan 2023 18:07:44 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG1w4-00GCEc-Ix
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 18:04:24 +0000
Received: by mail-pf1-x42f.google.com with SMTP id h7so10170099pfq.4
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 10:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TxWhCwPu5LJsqg+vUhYvruNUByCvr504SVJ2EQlA0KA=;
        b=BTjV8oUa7Ed+ZbWoFOVVgaZTO8KHvYB4mpyDw2hp1beDa6ri8H1s9rmAvwqBSB40/8
         Ajwhv1g2NnEBGu5dfQj1Vzt2N0/+s2WXP4HK0KqqY6h9ql/qRJHto+qLngU6H6rSftsG
         WDd5uTEyEwYCLBiGUSXvHMonkKnb9puFNv2rJDbYWl6MKcW2ceFCVkSx610YhbhzllQE
         rGe6sunHorm2UE/e2q2Hc/i7PddOpS1j5fIpIl5a7U/7UrV0QaaqGvXWhTVwViBWgrVY
         rcsF/ZPZ+OsIGBkmBcTViK54nA4NmxM77OM1EeKCLC2g1ahnDA6P+tOY7jSpr68Zb865
         TJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxWhCwPu5LJsqg+vUhYvruNUByCvr504SVJ2EQlA0KA=;
        b=W3f5JmMzFg7ugTqMLwsvMZQ3RCGCtRPfUxOhOYzD3nhZ9WjpbOPtoXAFjR5BCqgfvH
         tZsxPzRB5pw+4I3i8msMXnyquwqk4MGQUQDe1suJRieYdy/8Zm3tgrPgAPYOeMAQWHMU
         qj6F9MRj9s0RKJlrbnnhPLbcbpbjRAFTTrvpMMVZCHvxEcdopJnTFjt8+DMjm/K/OBmv
         w9HkRetrO7yNK6hN73XApB3An9gyea0WSvoahcYOboAZfN25acu1Bn2jx27BMZlj2G6m
         nLY3V/VYoK515uIqPMWcdXNjq/PjrJYRfOcTk0MG8YiHS7cClawgS87Ind6vvZcXRc50
         5gNg==
X-Gm-Message-State: AFqh2kriA2fKb9AthKtWRpVdOTEqAdZS0jA1EvHlPIx22cr3L4OuksaR
	MzX6+hy7YT0bC6hEeh2lGd27KGbAyPvRgpUwtveBBw==
X-Google-Smtp-Source: AMrXdXtAuAvBhytBCvvI2YJ8Ey/sxvh2qUIiwV8yvF5Zt0Wm1fFtJCOPhSydBTaBDLjX8Xxn/GyGRvD2CPXD5pTzxs0=
X-Received: by 2002:a63:104f:0:b0:4ac:d14e:2d01 with SMTP id
 15-20020a63104f000000b004acd14e2d01mr1375022pgq.595.1673546657212; Thu, 12
 Jan 2023 10:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20221215170046.2010255-1-atishp@rivosinc.com> <20221215170046.2010255-8-atishp@rivosinc.com>
 <20230112152948.3vagzedhegbj4jbj@orel>
In-Reply-To: <20230112152948.3vagzedhegbj4jbj@orel>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 12 Jan 2023 10:04:06 -0800
Message-ID: <CAHBxVyGDun+7XxxnRkTgYYKEWdcZ6UM+N52zUFsRsgma8dyHeg@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] RISC-V: KVM: Add SBI PMU extension support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Eric Lin <eric.lin@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_100421_994003_8F1D9214 
X-CRM114-Status: GOOD (  29.03  )
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

On Thu, Jan 12, 2023 at 7:29 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Dec 15, 2022 at 09:00:42AM -0800, Atish Patra wrote:
> > SBI PMU extension allows KVM guests to configure/start/stop/query about
> > the PMU counters in virtualized enviornment as well.
> >
> > In order to allow that, KVM implements the entire SBI PMU extension.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kvm/Makefile       |  2 +-
> >  arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
> >  arch/riscv/kvm/vcpu_sbi_pmu.c | 86 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 98 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
> >
> > diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> > index 5de1053..278e97c 100644
> > --- a/arch/riscv/kvm/Makefile
> > +++ b/arch/riscv/kvm/Makefile
> > @@ -25,4 +25,4 @@ kvm-y += vcpu_sbi_base.o
> >  kvm-y += vcpu_sbi_replace.o
> >  kvm-y += vcpu_sbi_hsm.o
> >  kvm-y += vcpu_timer.o
> > -kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
> > +kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
> > diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> > index 50c5472..3b8b84e8 100644
> > --- a/arch/riscv/kvm/vcpu_sbi.c
> > +++ b/arch/riscv/kvm/vcpu_sbi.c
> > @@ -20,6 +20,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
> >  };
> >  #endif
> >
> > +#ifdef CONFIG_RISCV_PMU_SBI
> > +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> > +#else
> > +static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> > +     .extid_start = -1UL,
> > +     .extid_end = -1UL,
> > +     .handler = NULL,
> > +};
> > +#endif
> > +
> >  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
> >       &vcpu_sbi_ext_v01,
> >       &vcpu_sbi_ext_base,
> > @@ -28,6 +38,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
> >       &vcpu_sbi_ext_rfence,
> >       &vcpu_sbi_ext_srst,
> >       &vcpu_sbi_ext_hsm,
> > +     &vcpu_sbi_ext_pmu,
> >       &vcpu_sbi_ext_experimental,
> >       &vcpu_sbi_ext_vendor,
> >  };
> > diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > new file mode 100644
> > index 0000000..223752f
> > --- /dev/null
> > +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > @@ -0,0 +1,86 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2022 Rivos Inc
> > + *
> > + * Authors:
> > + *     Atish Patra <atishp@rivosinc.com>
> > + */
> > +
> > +#include <linux/errno.h>
> > +#include <linux/err.h>
> > +#include <linux/kvm_host.h>
> > +#include <asm/csr.h>
> > +#include <asm/sbi.h>
> > +#include <asm/kvm_vcpu_sbi.h>
> > +
> > +static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> > +                                struct kvm_vcpu_sbi_ext_data *edata,
> > +                                struct kvm_cpu_trap *utrap)
> > +{
> > +     int ret = 0;
> > +     struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +     unsigned long funcid = cp->a6;
> > +     uint64_t temp;
> > +
> > +     /* Return not supported if PMU is not initialized */
> > +     if (!kvpmu->init_done)
> > +             return -EINVAL;
> > +
> > +     switch (funcid) {
> > +     case SBI_EXT_PMU_NUM_COUNTERS:
> > +             ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, edata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_GET_INFO:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, edata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> > +#if defined(CONFIG_32BIT)
> > +             temp = ((uint64_t)cp->a5 << 32) | cp->a4;
> > +#else
> > +             temp = cp->a4;
> > +#endif
> > +             ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
> > +                                                    cp->a2, cp->a3, temp, edata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_START:
> > +#if defined(CONFIG_32BIT)
> > +             temp = ((uint64_t)cp->a4 << 32) | cp->a3;
> > +#else
> > +             temp = cp->a3;
> > +#endif
> > +             ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
> > +                                                temp, edata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_STOP:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, edata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_FW_READ:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, edata);
> > +             break;
> > +     default:
> > +             edata->err_val = SBI_ERR_NOT_SUPPORTED;
> > +     }
> > +
> > +
> > +     return ret;
> > +}
> > +
> > +unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu, unsigned long extid)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +
> > +     /*
> > +      * PMU Extension is only available to guests if privilege mode filtering
> > +      * is available. Otherwise, guest will always count events while the
> > +      * execution is in hypervisor mode.
> > +      */
> > +     return kvpmu->init_done && riscv_isa_extension_available(NULL, SSCOFPMF);
>
> Assuming we're only supporting homogeneous systems, then can't we just
> check for Sscofpmf at PMU init time? When the extension isn't present
> we'd fail to init and then here init_done wouldn't be set.
>

Sure. We can do that too. Will revise it v3.

> > +}
> > +
> > +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> > +     .extid_start = SBI_EXT_PMU,
> > +     .extid_end = SBI_EXT_PMU,
> > +     .handler = kvm_sbi_ext_pmu_handler,
> > +     .probe = kvm_sbi_ext_pmu_probe,
> > +};
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
