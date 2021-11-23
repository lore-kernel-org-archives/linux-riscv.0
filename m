Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ECBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 08:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QC2DX4uav3mEyFMvzA7ujjPai9Ek2bsIDCwqYa5N/zc=; b=3G1pFk76GFiIhA
	Q376WgtLxBPCL/a9kiuGL3orrSWi+3CAM9pRElAXFLJ/f8IWTkNRrfw6Xj1K3PCGjYDCR0EqFAKGw
	dUkRyBb5oy+WHqo9CDjarL2z51nIrGxq/iqAu1o5nTJBlrU15tRFaGF8cwMrUlZe1UN80aVOK5RQf
	bY+GlEi14AI3GL4vXOXgosod/fb1MmltA52cCRqNPL5NNqHknTooOdbqP7oKExHLjRBdR1eLQpv/A
	tZ/FToKcHQeryXC5Tq3nsMRo8bBH6vwI8janaILKlgoZPtkSHUntbJDoBxI1YKIwC9/2S50H7xIsb
	whvUbJiw+DXo1GJxvzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpR0f-001ExX-FQ; Tue, 23 Nov 2021 08:18:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpQmV-001AXR-1a
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 08:04:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id u1so37360675wru.13
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 00:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nTNgdmZ9wB/Gxu8oMf7Ub084hMMsDwJb0gLTfiLVOpU=;
 b=CIw9iIkTZyLu/hfw0VAvt3Sb2X6b4R6xVkYDNorbOb6BrdjuwNPsO/SPWi0rGhRMOc
 u424Aq0BYoP+unYRLh8TOP2MHhb/Dkse/wpxBIc+RN/mvi5/uRqmlUotgjGkmKfXn5Rw
 mFZOZVZtZwetJesLceCk8017PP18wxla6jz95V+3juZ7mqJ0tLC7NqBPn+miEHRYe+pc
 Fj9HW8s4xQOX1ka0ERAUK5eAfb/2/n5zu0GGLwC1Vtc6h02LwCEV8QXHPb3vtUQSvQw0
 kXclxnSTLiGkaH4Zvq6zIuEeR0wSHhnE1wR7z061YVp440RL6KXvRfKQ37LeO0RyImTi
 fkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTNgdmZ9wB/Gxu8oMf7Ub084hMMsDwJb0gLTfiLVOpU=;
 b=tTwUHr2qR8c6tPyAwdukAPiF4X7FAmbSwWA7pM8H89KsoVfrBh/X90YZe20ziAW8EI
 VM0Bj3j1UUcaju9Hk09Pv5dzBDDndeaekR1KAzn/qDj95Wt+ZVdmfVr9u6TcfiwQIVTt
 KrlywEvssXHtt9u8jnr8k7gdDLXOvmVgZenAPES9frgAEQ+C/97CN7TT+lIn3eEfCZw7
 rr8do4ur0QdksqbFbGGTDW1cb9tTXUCq50t2Bse6e49NFcnf615Q47rhvVvXB1r3taFG
 I3NRJMfcwJNvHOLVlsDwyPgSznGphKsKSbTCIrQyU6vycuxbeFVvcjur1goivIc1cNFA
 eTXg==
X-Gm-Message-State: AOAM532uYS0ZCZ/2mCINKys7/wdFNstTsbzW2kWYz5bDz33SLyURhMN0
 8TIw1hEVK0jZortMFy7WMZmkLf/kgA+z38fJl7SOtw==
X-Google-Smtp-Source: ABdhPJwqfFq6Kr3GoEK347Js9vj5hVc3xSOZTyxcCnjkoFM/qVHH23h3vMRZf+EOATwSFAxiA6xpJeRMA8rkQ3gCxws=
X-Received: by 2002:adf:8165:: with SMTP id 92mr5086376wrm.199.1637654613464; 
 Tue, 23 Nov 2021 00:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20211118083912.981995-1-atishp@rivosinc.com>
 <20211118083912.981995-4-atishp@rivosinc.com>
In-Reply-To: <20211118083912.981995-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 13:33:21 +0530
Message-ID: <CAAhSdy2hPh-2r6iOs5T7eH3KJO3sMui6Nk+DER2muVssV0jBCA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] RISC-V: KVM: Add SBI v0.2 base extension
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_000359_151298_48FEFCB9 
X-CRM114-Status: GOOD (  25.79  )
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

On Thu, Nov 18, 2021 at 2:10 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> SBI v0.2 base extension defined to allow backward compatibility and
> probing of future extensions. This is also the only mandatory SBI
> extension that must be implemented by SBI implementors.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

I have queued this for 5.17

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +
>  arch/riscv/include/asm/sbi.h          |  8 +++
>  arch/riscv/kvm/Makefile               |  1 +
>  arch/riscv/kvm/vcpu_sbi.c             |  3 +-
>  arch/riscv/kvm/vcpu_sbi_base.c        | 70 +++++++++++++++++++++++++++
>  5 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 704151969ceb..76e4e17a3e00 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -9,6 +9,8 @@
>  #ifndef __RISCV_KVM_VCPU_SBI_H__
>  #define __RISCV_KVM_VCPU_SBI_H__
>
> +#define KVM_SBI_IMPID 3
> +
>  #define KVM_SBI_VERSION_MAJOR 0
>  #define KVM_SBI_VERSION_MINOR 2
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0d42693cb65e..4f9370b6032e 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -27,6 +27,14 @@ enum sbi_ext_id {
>         SBI_EXT_IPI = 0x735049,
>         SBI_EXT_RFENCE = 0x52464E43,
>         SBI_EXT_HSM = 0x48534D,
> +
> +       /* Experimentals extensions must lie within this range */
> +       SBI_EXT_EXPERIMENTAL_START = 0x0800000,
> +       SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> +
> +       /* Vendor extensions must lie within this range */
> +       SBI_EXT_VENDOR_START = 0x09000000,
> +       SBI_EXT_VENDOR_END = 0x09FFFFFF,
>  };
>
>  enum sbi_ext_base_fid {
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index d3d5ff3a6019..84c02922a329 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -24,4 +24,5 @@ kvm-y += vcpu_fp.o
>  kvm-y += vcpu_switch.o
>  kvm-y += vcpu_sbi.o
>  kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
> +kvm-y += vcpu_sbi_base.o
>  kvm-y += vcpu_timer.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index a8e0191cd9fc..915a044a0b4f 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -39,9 +39,10 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>         .handler = NULL,
>  };
>  #endif
> -
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_v01,
> +       &vcpu_sbi_ext_base,
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> new file mode 100644
> index 000000000000..641015549d12
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *     Atish Patra <atish.patra@wdc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/csr.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_timer.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +
> +static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +                                   unsigned long *out_val,
> +                                   struct kvm_cpu_trap *trap, bool *exit)
> +{
> +       int ret = 0;
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       struct sbiret ecall_ret;
> +
> +       switch (cp->a6) {
> +       case SBI_EXT_BASE_GET_SPEC_VERSION:
> +               *out_val = (KVM_SBI_VERSION_MAJOR <<
> +                           SBI_SPEC_VERSION_MAJOR_SHIFT) |
> +                           KVM_SBI_VERSION_MINOR;
> +               break;
> +       case SBI_EXT_BASE_GET_IMP_ID:
> +               *out_val = KVM_SBI_IMPID;
> +               break;
> +       case SBI_EXT_BASE_GET_IMP_VERSION:
> +               *out_val = 0;
> +               break;
> +       case SBI_EXT_BASE_PROBE_EXT:
> +               *out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> +               if ((!*out_val) &&
> +                   ((cp->a0 >= SBI_EXT_EXPERIMENTAL_START &&
> +                    cp->a0 <= SBI_EXT_EXPERIMENTAL_END) ||
> +                   ((cp->a0 >= SBI_EXT_VENDOR_START &&
> +                    cp->a0 <= SBI_EXT_VENDOR_END)))) {
> +               /* For experimental/vendor extensions forward to the userspace*/
> +                       kvm_riscv_vcpu_sbi_forward(vcpu, run);
> +                       *exit = true;
> +               }
> +               break;
> +       case SBI_EXT_BASE_GET_MVENDORID:
> +       case SBI_EXT_BASE_GET_MARCHID:
> +       case SBI_EXT_BASE_GET_MIMPID:
> +               ecall_ret = sbi_ecall(SBI_EXT_BASE, cp->a6, 0, 0, 0, 0, 0, 0);
> +               if (!ecall_ret.error)
> +                       *out_val = ecall_ret.value;
> +               /*TODO: We are unnecessarily converting the error twice */
> +               ret = sbi_err_map_linux_errno(ecall_ret.error);
> +               break;
> +       default:
> +               ret = -EOPNOTSUPP;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
> +       .extid_start = SBI_EXT_BASE,
> +       .extid_end = SBI_EXT_BASE,
> +       .handler = kvm_sbi_ext_base_handler,
> +};
> --
> 2.33.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
