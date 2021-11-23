Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E693BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wpPxrefNl6eGScMM5CQaAQdwB+FyQNl6r0cNw+JHkM=; b=P4SeAiwH/TTPUT
	xjUtFVZh6ZcaiElTrgXheouPw476ELNFvMsCFdwELwftWSNanCmWUMlsnSPIKIRT9DSsP64WGr0Yn
	i7hP3HDt0aWegFDIsEviO2mNDSoqf1u17GdWC0xSZMCFjgZTZOoPiWXQBzECqajUFxVhIl4iCes+9
	WGKzSJZC9n4vQgfCk4lOhUCT716B1bX4hpubdq2mYZKzm6lIxcUyJh4KTTYqfEcpG9b5JwdpTij1D
	WDpEL0Hq958NTVP8RsdyjyaomZKklMqCA0PtvRr9jWBDEBWoFDL5vXx24aq0Xu6cqU0euEQEn9mAF
	+kJnGEGFlgFR19Q7bm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpR1O-001FG2-QS; Tue, 23 Nov 2021 08:19:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpQou-001BIB-VS
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 08:06:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r8so37324410wra.7
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 00:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Dc9IyqXO7Wm3+bDtKtLtx9+DbBZ47LkjAeuYVgRscE=;
 b=uyE143lDDpEzHULTmTWN3E6pSz0XnoCTz9jlrWpHMlE6TbfSeOBjEgvIM9577xSgXj
 BBxJ0zrcoG5tqvWdYwTXWCO29y0BUU7yvmo35N2IaN9UaKoj8HQFcImmcUSTmURsGlFf
 5gygDqK3dkkC05wLYASGKJyOX7LLOmYDK/P+hGqZsq95cuzLi6xbVTvafUq1PCqqcBU7
 vVdZupRVVNvlF21oKydJsqvF/1K0NaWazGmdwvwj3dYbXh0Bj+VG5pXt8NsBQLK+l2ij
 FPhQJKHGkPytqV1mIuEqsA28nV332n2VHVkXtDC+dK3axYh7V+JwA/u8N35m7QeDpJok
 hKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Dc9IyqXO7Wm3+bDtKtLtx9+DbBZ47LkjAeuYVgRscE=;
 b=hyzi36ySuxnSB3WOKaVsXG39Sx+HL/aZS07mOfU6J82z3FG4VcCbq91jhEKadIpKzd
 C9ZabtXSU8EjSkS2SgQFwG+MxjMv/MBuw8GNsOJ8BQ04YBcdunyo2eQZX6rzyCy2ZLd3
 wqVR/TEo7L+8HicbkorhK6Fx8yLkyz4+9J49qTXIrdodiGkkXGY1yqPelmC7kmB7M3nd
 fnYcLkiJ3hrZmuItgwhtdFiQNaag9ZXUxYKmVe4Q/bY6A9pEC8aQRfqRG4gt7YNCA+EH
 mde8LenwEkQAKojrIj3UPD8Y9H2sR5puq0vsKLEYlWpWfMF5Xj9prfUQnYIvHvlSgsdS
 paoA==
X-Gm-Message-State: AOAM530aL+lVARlLYQwUAR+NkYdsmZFfOF0aIdKn/tlUbPsHuseTpFXL
 KuFdFAAZ6dI4DTEQ0j3tJsJpjW4p703K54y5DH9w1w==
X-Google-Smtp-Source: ABdhPJw/0TlGByNPXLRpWckwAfeK5n1U/QSPywu8h+JqZ5aS4wDj0Pv0sWPe4vPMhb02puhJ/NUfbfRfX4m2azGkTRk=
X-Received: by 2002:adf:8165:: with SMTP id 92mr5106482wrm.199.1637654787221; 
 Tue, 23 Nov 2021 00:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20211118083912.981995-1-atishp@rivosinc.com>
 <20211118083912.981995-6-atishp@rivosinc.com>
In-Reply-To: <20211118083912.981995-6-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 13:36:16 +0530
Message-ID: <CAAhSdy1V6cUYBmpTz8tT0gMg7=ZP1hQ25_zVdPg56TtnegLriw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] RISC-V: KVM: Add SBI HSM extension in KVM
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
X-CRM114-CacheID: sfid-20211123_000629_077772_7B8B9334 
X-CRM114-Status: GOOD (  31.50  )
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
> SBI HSM extension allows OS to start/stop harts any time. It also allows
> ordered booting of harts instead of random booting.
>
> Implement SBI HSM exntesion and designate the vcpu 0 as the boot vcpu id.
> All other non-zero non-booting vcpus should be brought up by the OS
> implementing HSM extension. If the guest OS doesn't implement HSM
> extension, only single vcpu will be available to OS.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

I have queued this for 5.17

Thanks,
Anup

> ---
>  arch/riscv/include/asm/sbi.h  |   1 +
>  arch/riscv/kvm/Makefile       |   1 +
>  arch/riscv/kvm/vcpu.c         |  23 ++++++++
>  arch/riscv/kvm/vcpu_sbi.c     |   4 ++
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 105 ++++++++++++++++++++++++++++++++++
>  5 files changed, 134 insertions(+)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 4f9370b6032e..79af25c45c8d 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -90,6 +90,7 @@ enum sbi_hsm_hart_status {
>  #define SBI_ERR_INVALID_PARAM  -3
>  #define SBI_ERR_DENIED         -4
>  #define SBI_ERR_INVALID_ADDRESS        -5
> +#define SBI_ERR_ALREADY_AVAILABLE -6
>
>  extern unsigned long sbi_spec_version;
>  struct sbiret {
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 4757ae158bf3..aaf181a3d74b 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -26,4 +26,5 @@ kvm-y += vcpu_sbi.o
>  kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
>  kvm-y += vcpu_sbi_base.o
>  kvm-y += vcpu_sbi_replace.o
> +kvm-y += vcpu_sbi_hsm.o
>  kvm-y += vcpu_timer.o
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e3d3aed46184..50158867406d 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -53,6 +53,17 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>         struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
>         struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
>         struct kvm_cpu_context *reset_cntx = &vcpu->arch.guest_reset_context;
> +       bool loaded;
> +
> +       /**
> +        * The preemption should be disabled here because it races with
> +        * kvm_sched_out/kvm_sched_in(called from preempt notifiers) which
> +        * also calls vcpu_load/put.
> +        */
> +       get_cpu();
> +       loaded = (vcpu->cpu != -1);
> +       if (loaded)
> +               kvm_arch_vcpu_put(vcpu);
>
>         memcpy(csr, reset_csr, sizeof(*csr));
>
> @@ -64,6 +75,11 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>
>         WRITE_ONCE(vcpu->arch.irqs_pending, 0);
>         WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
> +
> +       /* Reset the guest CSRs for hotplug usecase */
> +       if (loaded)
> +               kvm_arch_vcpu_load(vcpu, smp_processor_id());
> +       put_cpu();
>  }
>
>  int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
> @@ -100,6 +116,13 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>
>  void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  {
> +       /**
> +        * vcpu with id 0 is the designated boot cpu.
> +        * Keep all vcpus with non-zero cpu id in power-off state so that they
> +        * can brought to online using SBI HSM extension.
> +        */
> +       if (vcpu->vcpu_idx != 0)
> +               kvm_riscv_vcpu_power_off(vcpu);
>  }
>
>  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index cf284e080f3e..f62d25bc9733 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -25,6 +25,8 @@ static int kvm_linux_err_map_sbi(int err)
>                 return SBI_ERR_INVALID_ADDRESS;
>         case -EOPNOTSUPP:
>                 return SBI_ERR_NOT_SUPPORTED;
> +       case -EALREADY:
> +               return SBI_ERR_ALREADY_AVAILABLE;
>         default:
>                 return SBI_ERR_FAILURE;
>         };
> @@ -43,6 +45,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_v01,
> @@ -50,6 +53,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_time,
>         &vcpu_sbi_ext_ipi,
>         &vcpu_sbi_ext_rfence,
> +       &vcpu_sbi_ext_hsm,
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> new file mode 100644
> index 000000000000..2e383687fa48
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -0,0 +1,105 @@
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
> +#include <asm/kvm_vcpu_sbi.h>
> +
> +static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_cpu_context *reset_cntx;
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       struct kvm_vcpu *target_vcpu;
> +       unsigned long target_vcpuid = cp->a0;
> +
> +       target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
> +       if (!target_vcpu)
> +               return -EINVAL;
> +       if (!target_vcpu->arch.power_off)
> +               return -EALREADY;
> +
> +       reset_cntx = &target_vcpu->arch.guest_reset_context;
> +       /* start address */
> +       reset_cntx->sepc = cp->a1;
> +       /* target vcpu id to start */
> +       reset_cntx->a0 = target_vcpuid;
> +       /* private data passed from kernel */
> +       reset_cntx->a1 = cp->a2;
> +       kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
> +
> +       kvm_riscv_vcpu_power_on(target_vcpu);
> +
> +       return 0;
> +}
> +
> +static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
> +{
> +       if (vcpu->arch.power_off)
> +               return -EINVAL;
> +
> +       kvm_riscv_vcpu_power_off(vcpu);
> +
> +       return 0;
> +}
> +
> +static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       unsigned long target_vcpuid = cp->a0;
> +       struct kvm_vcpu *target_vcpu;
> +
> +       target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
> +       if (!target_vcpu)
> +               return -EINVAL;
> +       if (!target_vcpu->arch.power_off)
> +               return SBI_HSM_HART_STATUS_STARTED;
> +       else
> +               return SBI_HSM_HART_STATUS_STOPPED;
> +}
> +
> +static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +                                  unsigned long *out_val,
> +                                  struct kvm_cpu_trap *utrap,
> +                                  bool *exit)
> +{
> +       int ret = 0;
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       struct kvm *kvm = vcpu->kvm;
> +       unsigned long funcid = cp->a6;
> +
> +       switch (funcid) {
> +       case SBI_EXT_HSM_HART_START:
> +               mutex_lock(&kvm->lock);
> +               ret = kvm_sbi_hsm_vcpu_start(vcpu);
> +               mutex_unlock(&kvm->lock);
> +               break;
> +       case SBI_EXT_HSM_HART_STOP:
> +               ret = kvm_sbi_hsm_vcpu_stop(vcpu);
> +               break;
> +       case SBI_EXT_HSM_HART_STATUS:
> +               ret = kvm_sbi_hsm_vcpu_get_status(vcpu);
> +               if (ret >= 0) {
> +                       *out_val = ret;
> +                       ret = 0;
> +               }
> +               break;
> +       default:
> +               ret = -EOPNOTSUPP;
> +       }
> +
> +       return ret;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm = {
> +       .extid_start = SBI_EXT_HSM,
> +       .extid_end = SBI_EXT_HSM,
> +       .handler = kvm_sbi_ext_hsm_handler,
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
