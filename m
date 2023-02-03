Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE86C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBC/bmxGNudcYoMOwPSfhdTuvQnQUZmaevU5cDqfIpM=; b=C4Iidn6nNz3+Jr
	3nRmuO2GvkMsfOlXMOmJyiSAScjBO08UDMcATdg6kGtAVoYbw9l1X8haLr6yN2dedigF5ePRQtNcp
	wlzfpdZBBViEqAKrpEglNp5umuNSDepgehRjmf85NwjinZbDX5fmfFt73qvibrgCpfJZBItfcNgIw
	Evgza5schv8N5K6/l/u5XIjLyYsL9JkWm3VvsVm3fbvi4hVQ154JkYyfHQI6ewk4I4Cj3wyV0LV1P
	oPjVOAJ+6GTG2VOb64N6tdX15SmrxI4CzJhaYpbbAHZSnGGID7ysd+t6NmDHFSPWOBY6a7rWEzjo+
	h2kTK798INbSB0CvKDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNs3V-0016jV-PK; Fri, 03 Feb 2023 09:08:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNs3T-0016gt-5w
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 09:08:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id 144so3072141pfv.11
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 01:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9hCe7LqUEWeZE/OgEJQeEjnmtgN7ZemsL4+QPvUKJRA=;
        b=ZVk2+2xbB/aWLNr1Loefu3Gdj0GZtzpwTjvssVNCNrunuPoQa7dz8DDdqDBayaVt+k
         R9MJRxlZHIqZ0qeIn5Oe1ukgP2r7CGePcV0Ah8AiMKZyJkhi+JKiMYd4UCuou/X7G7Hk
         4T2ynDCL/jG3XpgRQl1hFn6BDXrVnK3SthMH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hCe7LqUEWeZE/OgEJQeEjnmtgN7ZemsL4+QPvUKJRA=;
        b=tBWwbl/KtqaY+YHi8wBVPZHxfuzAyw6E3olCk79DT7r6ePmtRWxOdj45cVfXIys7TX
         ss80bCLuN/8xOFXcsqryhOVElANYQTU+tSULfFQyLGJTRbvv6kJa0+yWlIt98hWeVQJN
         7SUq9mu5/dmfJZVWNuBNfeWtnhdNY8rPttxkE/641fNBCmYcXfSBLOqe+WLWPiAWH7ks
         yz+841myGGSmwK1syswGjC3owsDkOYEVAlxjINIsCM1J1D9Ea12EyU+l6JKY95lFx9Lw
         XReCovldveA+Uuoxy/hjvkkqP5FJp8NBA2IU5sbOtkAFpzCDhJMhmofIOdp96O/6+VGN
         MXyQ==
X-Gm-Message-State: AO0yUKXmSafDyzHGLqAGwrKQGSBclrTlHs0I66FEdkQweEHkNBrjmK18
	gEpRyzXikHQOpmeFQItprYjTT/E8e9bWzDu6k/vm
X-Google-Smtp-Source: AK7set90iUP5jpoPJ7/sawh5zPeMwXJYzaJvdAZOfpucQSoA1rTYqBgi6FrdrY0Djllor8Pb7T2IOa6zbXKF74fq1I0=
X-Received: by 2002:a63:1941:0:b0:483:f80c:cdf3 with SMTP id
 1-20020a631941000000b00483f80ccdf3mr1660477pgz.70.1675415288579; Fri, 03 Feb
 2023 01:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20230201231250.3806412-1-atishp@rivosinc.com> <20230201231250.3806412-9-atishp@rivosinc.com>
 <20230202172927.jlwjkv6nbvhzcakw@orel>
In-Reply-To: <20230202172927.jlwjkv6nbvhzcakw@orel>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 3 Feb 2023 01:07:57 -0800
Message-ID: <CAOnJCULStHjnFX70QjVemdt4fqr5HKBiNFaf89nabF19E_kYZw@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] RISC-V: KVM: Add SBI PMU extension support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Eric Lin <eric.lin@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_010823_229127_39F2FA4E 
X-CRM114-Status: GOOD (  35.50  )
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

On Thu, Feb 2, 2023 at 9:29 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Feb 01, 2023 at 03:12:44PM -0800, Atish Patra wrote:
> > SBI PMU extension allows KVM guests to configure/start/stop/query about
> > the PMU counters in virtualized enviornment as well.
> >
> > In order to allow that, KVM implements the entire SBI PMU extension.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kvm/Makefile       |  2 +-
> >  arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
> >  arch/riscv/kvm/vcpu_sbi_pmu.c | 85 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 97 insertions(+), 1 deletion(-)
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
> > index 0000000..e028b0a
> > --- /dev/null
> > +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > @@ -0,0 +1,85 @@
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
> > +     uint64_t temp;
> > +
> > +     /* Return not supported if PMU is not initialized */
> > +     if (!kvpmu->init_done)
> > +             return -EINVAL;
>
> Shouldn't this be the following?
>
>   if (!kvpmu->init_done)
>      retdata->err_val = SBI_ERR_NOT_SUPPORTED;
>      return 0;
>   }
>

This condition presents an additional sanity check and indicates a bug
in the guest code
where it invokes PMU extension calls when the probe function already
returns NOT_SUPPORTED.

Earlier, I was in two minds whether this should just return not
supported to the guest or report an
error. However, given that it's just a driver in the guest, the error
shouldn't be fatal. It should just
return the sbi error back to the guest.

Thanks for catching this. I have fixed it in v5.

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
> > +              * Forward the error to the user space because its an error happened
>
> "Forward the error to userspace because it's an error which happened within
>  the host kernel."
>

Fixed.

> > +              * within host kernel. The other option would be convert this to
>                                                                 ^ to
> > +              * an SBI error and forward to the guest.
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
> > +unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
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



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
