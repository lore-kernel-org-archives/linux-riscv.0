Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA59C636D6
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkB6SN5K4LXfOUB3NBiWEw3/mpJ9wcBhwMDLej4r8x4=; b=B8y3HFr6FqARfY
	lkzufTGaoWW5d6T9f/70OjK5KVmxwyQ431RIZ2fZcTAUp89aTOE5+rdB0FMYGdz2A5G7VQ8n+IB/+
	CEyJs0KEwXtAz/nFrgoLvrwO8JN39pg3tD3SDOwBWe+El4ricFFJN9w7fXZUDGzsltCznWwaEpRwC
	mmp1D5MPQatVMWMPSbqpqR4Y3ovq3anxRhDU9G5CfzslegLlcAsrdgFVPxPkEYa8//nrkFsaXW7rH
	QHay13B0U7C5W5yERS/UmPM+ce1MxY7/0WrUnKMTGZxS9n/f8r5hMEowWZBXSXaNJ9C86rEFoo4+s
	qOhnLCLr4sWpduNvDVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPPv-00Caaq-7R; Tue, 07 Feb 2023 14:57:55 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPPs-00CaYz-Km
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 14:57:54 +0000
Received: by mail-ed1-x52a.google.com with SMTP id v13so15821164eda.11
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i1Xk4UxjkX2lM5lBm9X6gAvbk7g7P+8uUM07nXciiIY=;
        b=2ju73tcI/+b1hffAojtONj6F9dgvGR2+rarFT1sFhIMciYTHxycrQDlW5ldgnqNlby
         1eHTFP0z1b1PXX29+hY55NhQxK08NIWk08nJ7Iw0wTro6gOSR7ZW5k+QZAJqwrrJnjcd
         7b3GaYnEWO0xsLpk/3TL11MmMl7KXhS2LszSpKXxBGFaeUPFdd8e3kfnKb7gLRuXPU4v
         rOdU8oITbhzDcRN0L9SPAI7XgnF7C8Oi8iYsodh8GJByhWESxw5brIY5+3ZugcRqf9WI
         5Zo96vrCMnHsc3VLwhVOeF54S4w3BEVAGR/ByK2+0eiFA4ieyprA01InkHgvUhW7AQRS
         D2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1Xk4UxjkX2lM5lBm9X6gAvbk7g7P+8uUM07nXciiIY=;
        b=25lIXhKwWtRfpF4afPKRKn8fBO25i4rDVOoqwM3k1UyAcTV+3uEa2lz4wzuSX9ypaL
         yKNBkgLUehe1HPxaQ1zlQ2ezYoaW9kwPwGxxQXGqPb0EAFlf5N1Atf2aCn99iHh1+5rC
         0CXbuZ34tzByxEg8sihMywFhdDntOssvTzSz5tblbhLwFLzhPKPuCxw7wcesZ53RGAIc
         WW4sy+c720gbA2weyLzHMUzo8ISXU1OYTsqQWjZQW1zDsdk3fvk2tfJEnRdzaUSijjJX
         q7ZuvlqjpwW+5gcetcF2amLmJ1/Wm6UOilP0tomvH5N/dc4ScuwZrCcA2E+cFLqWt6Ei
         TERA==
X-Gm-Message-State: AO0yUKUxOxuYVQf9OT4PiGdqc6vBxRM2uB5F/yiJxjvvOU8jO6lxwPPH
	EQ+Sie3awhT7zaESks5F/M7G9PBA+oqeimKaqAqzsQ==
X-Google-Smtp-Source: AK7set8TMMTVARsJ/lKBSntIVoBF2AzZr+FUM1UuvRDmEwf7yn9MTW+eHyvr5Gr4VRnr6Tgq3T6Rjrvs1clD/htMdK4=
X-Received: by 2002:a50:99cc:0:b0:499:f0f:f788 with SMTP id
 n12-20020a5099cc000000b004990f0ff788mr931128edb.25.1675781871354; Tue, 07 Feb
 2023 06:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20230207095529.1787260-1-atishp@rivosinc.com> <20230207095529.1787260-3-atishp@rivosinc.com>
 <20230207104350.ekjklgxehrc7qtil@orel>
In-Reply-To: <20230207104350.ekjklgxehrc7qtil@orel>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Feb 2023 20:27:40 +0530
Message-ID: <CAAhSdy0c7ufa--ipbuZc5f_0ZN6V_Ed0=iEfLYyOXMO7aUaE4A@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] RISC-V: KVM: Add SBI PMU extension support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_065752_702550_BD3ED548 
X-CRM114-Status: GOOD (  28.93  )
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

Hi Drew,

On Tue, Feb 7, 2023 at 4:13 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Feb 07, 2023 at 01:55:23AM -0800, Atish Patra wrote:
> > SBI PMU extension allows KVM guests to configure/start/stop/query about
> > the PMU counters in virtualized enviornment as well.
> >
> > In order to allow that, KVM implements the entire SBI PMU extension.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
> > index fe2897e..15fde15 100644
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
> > index 0000000..38efadb
> > --- /dev/null
> > +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > @@ -0,0 +1,86 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2023 Rivos Inc
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
> > +                                struct kvm_vcpu_sbi_return *retdata)
> > +{
> > +     int ret = 0;
> > +     struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +     unsigned long funcid = cp->a6;
> > +     u64 temp;
> > +
> > +     if (!kvpmu->init_done) {
> > +             retdata->err_val = SBI_ERR_NOT_SUPPORTED;
> > +             return 0;
> > +     }
> > +
> > +     switch (funcid) {
> > +     case SBI_EXT_PMU_NUM_COUNTERS:
> > +             ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, retdata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_GET_INFO:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, retdata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> > +#if defined(CONFIG_32BIT)
> > +             temp = ((uint64_t)cp->a5 << 32) | cp->a4;
> > +#else
> > +             temp = cp->a4;
> > +#endif
> > +             /*
> > +              * This can fail if perf core framework fails to create an event.
> > +              * Forward the error to userspace which is an error happened
>
> "Forward the error to userspace because it's an error which happened..."
>
> (Can probably be fixed up on merge.)

Sure, I will fix this at the time of merging this patch.

Thanks,
Anup

>
> > +              * within the host kernel. The other option would be to convert
> > +              * to an SBI error and forward to the guest.
> > +              */
> > +             ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
> > +                                                    cp->a2, cp->a3, temp, retdata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_START:
> > +#if defined(CONFIG_32BIT)
> > +             temp = ((uint64_t)cp->a4 << 32) | cp->a3;
> > +#else
> > +             temp = cp->a3;
> > +#endif
> > +             ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
> > +                                                temp, retdata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_STOP:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
> > +             break;
> > +     case SBI_EXT_PMU_COUNTER_FW_READ:
> > +             ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
> > +             break;
> > +     default:
> > +             retdata->err_val = SBI_ERR_NOT_SUPPORTED;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> > +
> > +     return kvpmu->init_done;
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
