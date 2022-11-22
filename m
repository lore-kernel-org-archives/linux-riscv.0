Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45768C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 23:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wijqe8YpkxVLy6OJezv7afovGnqylpZ73YqCskNhVN8=; b=nTsGk1GXCryAGT
	FSj+9Nd6QlB6KruLB29kH3ONXtgSCjMS1xmJf+JNSdpqD6U61MKm/zc8eIN/LseHcIKF6i5TjRwpq
	umc+ByU6B02AUomN9ui2dOMOoaum66E3Qa6iv6vOPxvbjGRzEP0lZwBqqhcS4lVGW//6TXxndwxn+
	X1c3bpAm7Ve7f6XN1cZq4tUujpQKJGcjdGWLSPFyMJrl9gQf+z7BmEZWjFU0cJxhZoR497Dz7YVVG
	ZTEeAeNDR63Xz7IixA4dqI2AhRJ3hkXmf7fvm2Z/HyAuUPc2JrxE0AiQYcCUngmNSNtVdIfv/O+Bp
	9zpYdUbv9arTSstVBJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxcNn-00CGWW-Sl; Tue, 22 Nov 2022 23:08:51 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxcNk-00CGUw-7B
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 23:08:49 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1322d768ba7so19020809fac.5
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 15:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dnwQLll7j5glmZ/FjjNqX7xxGcy9V27kLQ/eS+TZVJc=;
        b=Lx8eewRkUxV3R1eURWJaWYl8C7rb8Jrllpe6eat9wUzdDXp9I+nMCRhjPTmjugOrFJ
         Yxg3YSRF7z9VvJ3uAcebFjHtyQUrh2zoiO3YdumK+IPnLzsxRP05ihX9WPw7CAtsYq05
         wHmpzaIL1mjKSlVrNluHjwKTkLqb+LN336+TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnwQLll7j5glmZ/FjjNqX7xxGcy9V27kLQ/eS+TZVJc=;
        b=cZTYQLv8SgQIuGGhdpiq+obT6Ur1GPiCLkFrOBB86RFvoPTk6ErV480Kl/XpG/TdX7
         Rm1lWJbyYQhYM4chWifYGggVkJTI+6fpzXCpReE6liVfP0tdxgH7aU9kfUXtdb8G8afs
         B6o6+5v4NbIo55Gp9JP7kS05rVueB8jC41Ht5Ge4zg3d0cykBxRRw7bp3EUrdBZIlqZc
         fxw+jZtTH/J8T7RuaX/BmNzxGVDim6+ocXD/may9XdvBkBq2LpSFXEDx1vKsqJ6dQi1i
         NdBercvOucpRe+lGPGObCFV6uhnqxRXjL2a4F4ZP9WfXaisKboKATUcYC9Cxg1TlWkG5
         rv8Q==
X-Gm-Message-State: ANoB5pmY6RUmgJSzMc22hbcJYkOsf+jlzakfSTwDwwzQPCOXO3iNqyx/
	ttJfTyr4w+JbNflNKmhYVTKBg5VZgXy6Mq6zAsJB
X-Google-Smtp-Source: AA0mqf7hEsP/35Av5P+L3H+s8znmbb5O5QBMHQfJXJW5q8XxBmNGJHt1qUBIl2sA9KpAOxR17ddZQCW1dlrZACVSrQc=
X-Received: by 2002:a05:6870:c18a:b0:142:870e:bd06 with SMTP id
 h10-20020a056870c18a00b00142870ebd06mr11786804oad.181.1669158525178; Tue, 22
 Nov 2022 15:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-7-atishp@rivosinc.com>
 <20221101142631.du54p4kyhlgf54cr@kamzik>
In-Reply-To: <20221101142631.du54p4kyhlgf54cr@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Nov 2022 15:08:34 -0800
Message-ID: <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
Subject: Re: [RFC 6/9] RISC-V: KVM: Add SBI PMU extension support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_150848_269011_E860A278 
X-CRM114-Status: GOOD (  33.58  )
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

On Tue, Nov 1, 2022 at 7:26 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jul 18, 2022 at 10:02:02AM -0700, Atish Patra wrote:
> > SBI PMU extension allows KVM guests to configure/start/stop/query about
> > the PMU counters in virtualized enviornment as well.
> >
> > In order to allow that, KVM implements the entire SBI PMU extension.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
> >  arch/riscv/kvm/vcpu_sbi_pmu.c | 81 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 92 insertions(+)
> >  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
> >
> > diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> > index d45e7da3f0d3..da9f7959340e 100644
> > --- a/arch/riscv/kvm/vcpu_sbi.c
> > +++ b/arch/riscv/kvm/vcpu_sbi.c
> > @@ -50,6 +50,16 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
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
> > @@ -58,6 +68,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
> >       &vcpu_sbi_ext_rfence,
> >       &vcpu_sbi_ext_srst,
> >       &vcpu_sbi_ext_hsm,
> > +     &vcpu_sbi_ext_pmu,
> >       &vcpu_sbi_ext_experimental,
> >       &vcpu_sbi_ext_vendor,
> >  };
> > diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > new file mode 100644
> > index 000000000000..90c51a95d4f4
> > --- /dev/null
> > +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > @@ -0,0 +1,81 @@
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
> > +                                unsigned long *out_val,
> > +                                struct kvm_cpu_trap *utrap,
> > +                                bool *exit)
> > +{
> > +     int ret = -EOPNOTSUPP;
> > +     struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > +     unsigned long funcid = cp->a6;
> > +     uint64_t temp;
>
> I think we need something like
>
>    if (!vcpu_to_pmu(vcpu)->enabled)
>       return -EOPNOTSUPP;
>
> here. Where 'enabled' is only true when we successfully initialize
> the pmu. And, successful initialization depends on

Yes. I have added the flag. But should we do the check here or
respective function
as a paranoia sanity check ?

> IS_ENABLED(CONFIG_RISCV_PMU_SBI) and

Why do we need to guard under CONFIG_RISCV_PMU_SBI ?
vcpu_sbi_pmu.c is only compiled under CONFIG_RISCV_PMU_SBI

If CONFIG_RISCV_PMU_SBI is not enabled, probe function will return failure.

In fact, I think we should also add the pmu enabled check in the probe function
itself. Probe function(kvm_sbi_ext_pmu_probe) should only true when
both vcpu_to_pmu(vcpu)->enabled and
riscv_isa_extension_available(NULL, SSCOFPMF) are true.

Thoughts?

> riscv_isa_extension_available(NULL, SSCOFPMF) as well as not
> failing other things. And, KVM userspace should be able to
> disable the pmu, which keep enabled from being set as well.
>
We already have provisions for disabling sscofpmf from guests via ISA
one reg interface.
Do you mean disable the entire PMU from userspace ?

Currently, ARM64 enables pmu from user space using device control APIs
on vcpu fd.
Are you suggesting we should do something like that ?

If PMU needs to have device control APIs (either via vcpu fd or its
own), we can retrieve
the hpmcounter width and count from there as well.

> > +
> > +     switch (funcid) {
> > +     case SBI_EXT_PMU_NUM_COUNTERS:
> > +             ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, out_val);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_GET_INFO:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, out_val);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> > +#if defined(CONFIG_32BIT)
> > +             temp = ((uint64_t)cp->a5 << 32) | cp->a4;
> > +#else
> > +             temp = cp->a4;
> > +#endif
> > +             ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, temp);
> > +             if (ret >= 0) {
> > +                     *out_val = ret;
> > +                     ret = 0;
> > +             }
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_START:
> > +#if defined(CONFIG_32BIT)
> > +             temp = ((uint64_t)cp->a4 << 32) | cp->a3;
> > +#else
> > +             temp = cp->a3;
> > +#endif
> > +             ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2, temp);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_STOP:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_FW_READ:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, out_val);
> > +             break;
> > +     default:
> > +             ret = -EOPNOTSUPP;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +unsigned long kvm_sbi_ext_pmu_probe(unsigned long extid)
> > +{
> > +     /*
> > +      * PMU Extension is only available to guests if privilege mode filtering
> > +      * is available. Otherwise, guest will always count events while the
> > +      * execution is in hypervisor mode.
> > +      */
> > +     return riscv_isa_extension_available(NULL, SSCOFPMF);
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



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
