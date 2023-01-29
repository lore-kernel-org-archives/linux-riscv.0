Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E0AC05027
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jan 2023 12:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLsCnw9eYJUGe/8gPE8vErEpJMjVD2GrgZtXB3fR80E=; b=XJw6FF42g/SvHG
	MZFM2W/m6KZg6shduUXbUkiZg/MXqObS9OFlkBzzLI1oYV4neU/peFZ+tuyDC+2Cy5zQU48vaCEyr
	wEIJGdyFh6Jvc9fb3xPHK6xZcvZ8KyfYXmPZoyjQuUJ4MkkAyUQpGznEfPaBt18NHnQylu+qmeL8k
	tvczoACqOSxY48ANaIZmvxNo+UyibbuA0SaY7GrTzXZMWd7P/+yMM3MJ4Yo9wawUUVPQRC6yW2IoY
	i7gb8xbEoUt3kOelCmhni2RPxmXCyomC0ZsY39WseTuORjxF9Jp9sHaxlXBvydQU9atUaKzPmaXPp
	ddAMScSGMf4FPmesU9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM6t2-001QkO-4L; Sun, 29 Jan 2023 12:34:20 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM6sw-001QjG-Su
	for linux-riscv@lists.infradead.org; Sun, 29 Jan 2023 12:34:19 +0000
Received: by mail-ed1-x52d.google.com with SMTP id z11so8567864ede.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 04:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yC1ZVzAzDf/aBZibreOVSzWXlxaYIBd7WvOisdNT7VA=;
        b=qioVjfNFel+z8e1jsIAR4Xn72T1hGd4nypq3J3AXlahG4IAoERmpJsKfTiv3WNQy7Z
         zFFGaR6KrrVqWUgk+rKp0RMnYXaBgXq0vYc84MvZbatoTYzTPXM3sQv80LJmDF7yYFLI
         i1wl08URz3cjse6mbslWFKmVAv70rWX7YVBBqNJQNnluaMiGzIG8nDFDUG1Op8KaPPU/
         q8tgNLdeB+dgeCH9b+wcxduKrhCjb+ia9noW9SGr2L5Bj3CAMz4T00r/JNTo1kkueluR
         +V6/bHItfKm0TJj7PEWwTK1bL/xtSgpaANpl9UIHzoIMGZmRCbOY9Akk7NVeiQ1MZ3SJ
         EcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yC1ZVzAzDf/aBZibreOVSzWXlxaYIBd7WvOisdNT7VA=;
        b=eIxhTfOFSgSynq1lcus+Q1FrrcG3D6fD/eZGkBi9RGccpP1YI/OlF/EaTRyfjVvXss
         JcCvYNNfL293r0BZznJyo5S+ZfSvpmPK6EBALC4gygwHq+BMOh083bkI2rmb/QbI6TDN
         9itg3yy4l1nEd9OtiQA/or/wOlsNGgx7w68VaJHBLJpFSBg/ykcHGl/fTQro9GRR14Ky
         AIb2Zg8rJUxWwYGIOJ4cFLdzycHYJ7MQepW6IszvGjuBhwjwe0AuickX4vyeKjUktBL9
         uUvTXuS1mqBJ/gB/Fo0VBWaoxouN3pjpHOK8BtGvxDThlfMXKI14MFH3S1jNXW688A6t
         jTJA==
X-Gm-Message-State: AFqh2kpYSJcPe0S1NHjHJS+MaZ7hyDA+tX0NVOTDIrxJXxReA19B/I8x
	DyGTFHkllZ6tnVQ1xnZ9evjjeM21Rxgil7KYJnK/pg==
X-Google-Smtp-Source: AMrXdXumZIj7SGhctuNfaDc2qWvtYehKUwqt8979HMLFD3CVyFWnjV0PLsHmeH1Uj9pYMdi3GForP1iAC/77hwhazLY=
X-Received: by 2002:a05:6402:1008:b0:499:f0f:f788 with SMTP id
 c8-20020a056402100800b004990f0ff788mr8081610edu.25.1674995652901; Sun, 29 Jan
 2023 04:34:12 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-9-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-9-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 29 Jan 2023 18:04:01 +0530
Message-ID: <CAAhSdy1RK=ambgNYDdKYW-+qVE--Wv8=9vrxLe48u7_DL6gF1w@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] RISC-V: KVM: Add SBI PMU extension support
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_043414_942298_9431FAF3 
X-CRM114-Status: GOOD (  25.21  )
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

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> SBI PMU extension allows KVM guests to configure/start/stop/query about
> the PMU counters in virtualized enviornment as well.
>
> In order to allow that, KVM implements the entire SBI PMU extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/Makefile       |  2 +-
>  arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
>  arch/riscv/kvm/vcpu_sbi_pmu.c | 86 +++++++++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
>
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 5de1053..278e97c 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -25,4 +25,4 @@ kvm-y += vcpu_sbi_base.o
>  kvm-y += vcpu_sbi_replace.o
>  kvm-y += vcpu_sbi_hsm.o
>  kvm-y += vcpu_timer.o
> -kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
> +kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index aa42da6..04a3b4b 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -20,6 +20,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>  };
>  #endif
>
> +#ifdef CONFIG_RISCV_PMU_SBI
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> +#else
> +static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> +       .extid_start = -1UL,
> +       .extid_end = -1UL,
> +       .handler = NULL,
> +};
> +#endif
> +
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_v01,
>         &vcpu_sbi_ext_base,
> @@ -28,6 +38,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_rfence,
>         &vcpu_sbi_ext_srst,
>         &vcpu_sbi_ext_hsm,
> +       &vcpu_sbi_ext_pmu,
>         &vcpu_sbi_ext_experimental,
>         &vcpu_sbi_ext_vendor,
>  };
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> new file mode 100644
> index 0000000..73aab30
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Rivos Inc
> + *
> + * Authors:
> + *     Atish Patra <atishp@rivosinc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/csr.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +
> +static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +                                  struct kvm_vcpu_sbi_ext_data *edata,
> +                                  struct kvm_cpu_trap *utrap)
> +{
> +       int ret = 0;
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +       unsigned long funcid = cp->a6;
> +       uint64_t temp;
> +
> +       /* Return not supported if PMU is not initialized */
> +       if (!kvpmu->init_done)
> +               return -EINVAL;
> +
> +       switch (funcid) {
> +       case SBI_EXT_PMU_NUM_COUNTERS:
> +               ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, edata);
> +               break;
> +       case SBI_EXT_PMU_COUNTER_GET_INFO:
> +               ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, edata);
> +               break;
> +       case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> +#if defined(CONFIG_32BIT)
> +               temp = ((uint64_t)cp->a5 << 32) | cp->a4;
> +#else
> +               temp = cp->a4;
> +#endif
> +               /*
> +                * This can fail if perf core framework fails to create an event.
> +                * Forward the error to the user space because its an error happened
> +                * within host kernel. The other option would be convert this to
> +                * an SBI error and forward to the guest.
> +                */
> +               ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
> +                                                      cp->a2, cp->a3, temp, edata);
> +               break;
> +       case SBI_EXT_PMU_COUNTER_START:
> +#if defined(CONFIG_32BIT)
> +               temp = ((uint64_t)cp->a4 << 32) | cp->a3;
> +#else
> +               temp = cp->a3;
> +#endif
> +               ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
> +                                                  temp, edata);
> +               break;
> +       case SBI_EXT_PMU_COUNTER_STOP:
> +               ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, edata);
> +               break;
> +       case SBI_EXT_PMU_COUNTER_FW_READ:
> +               ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, edata);
> +               break;
> +       default:
> +               edata->err_val = SBI_ERR_NOT_SUPPORTED;
> +       }
> +
> +       return ret;
> +}
> +
> +unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +
> +       return kvpmu->init_done;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
> +       .extid_start = SBI_EXT_PMU,
> +       .extid_end = SBI_EXT_PMU,
> +       .handler = kvm_sbi_ext_pmu_handler,
> +       .probe = kvm_sbi_ext_pmu_probe,
> +};
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
