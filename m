Return-Path: <SRS0=YRhX=PZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B99C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 04:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3559561051
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 04:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3559561051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yiQXvTwJQVL8HzrlpzE/dcM20XIEls13KB/BgsM+vdY=; b=AcqBXtN0ODgGI/
	7FklqaOzzKpYjqY7EFhMSWQH0jVcyZltaxiVnGLpXX8nmbALllgypcCdykizQFruOuz41Y9wHhW+X
	meSx2zKT9Ouj4z9LIpG2fUPOQZOalshEN56Ltlpc+Z6wT0gKinFSP9L3zt9VAwRmOU8gf3myrjKLG
	t9h8XN93CEZgZGh/k3HWusfgbVNBTAAQd9mUrBRBQjnmngZosINqv3pNtpiYPEeqOXQugdOBJ3kLP
	nIG7Ee8nbh4zVphd+0T0QZYcyvcVTd7t+iBfD9u3xLyKEVE9gOwPoB9dUn7y/i+Mz9gHD2lzJ7WS4
	5u2/2jSCPg2yp5s88PZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjDf5-00Cfcr-GJ; Sat, 06 Nov 2021 04:50:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjDf2-00CfcF-0h
 for linux-riscv@lists.infradead.org; Sat, 06 Nov 2021 04:50:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d24so16876445wra.0
 for <linux-riscv@lists.infradead.org>; Fri, 05 Nov 2021 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MZj3Va5fnKVma/Uxx2Yy0YeclXVEgl4ZrTkK9Iz75dc=;
 b=yPMOtvOTWlFAZ87vpmmyMFyf3Awhvh6B5VIXlEjKMPyg9+Yg5yJuIWJdN2c45vAXeO
 0qUruN7RQJ9BNmHISbmhBBpkUmON2iiBVn2CgDkDZtkfcpunPO7j1S3oLj+beUpOHzgL
 Y3Ciw53Yx7f0KZtBlO2HvbqF4mEM127mJSdiP0nkiDDIc5o5XG6Dy3dmVV6M35isp+5Q
 SojnES6vUFC1MN7/8IAPEHhgN2jHc+C02WYEIHBmYIchNw99mfcSVbEv81/bwqwBeXuY
 EAZVFzuEoauYQMuwSNBjYHt8VEWbFPy5HbrW7ot7adY0HSBbYH5xshH3xfrpcWuf4U9i
 GplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZj3Va5fnKVma/Uxx2Yy0YeclXVEgl4ZrTkK9Iz75dc=;
 b=uR9ty5hGrY/csNKxnPcv6+IXv83wEBC7lyV3iqwOWB/s/488c8yFUgYXGXkZfhvS3g
 8cqqULrFCysiS+jDpzLJFujljBbCpOQwXyqYgSVyCAIEIkRnXSR6fLRV5Gd9+gsD6Rgm
 TRyrfcwjXUfLWxyKeJoFLlJKvdXThR/JPY/UAMfHp+qahsFbjvBFmke+JG3lBQM3NLnJ
 pmhcR2lAeBFZr5fTL/r/5+2NYghH12W/qHSfmN4Vzqp5IaOzzx4IbTttHG76FEX0Zhxt
 syJs0sgwB4zE9v2ONSs7EsnCFMq7sUvnPyFD7OML6kjdcdia8Vq1B4AIMHaKFxLNAkj+
 Plgg==
X-Gm-Message-State: AOAM530dKdYrbCW5fJtBKd8ZN07kXem36tldPmaGTm3eFN22Jn7cI/yF
 klfZ5O/Cdo2cuJgczSrSc03N/7g2NcZ0H3XSkcQbkQ==
X-Google-Smtp-Source: ABdhPJzjm+xVGsM7YVJVpKRaC71CEBRXMFbI5k0SrhttJBHT6/XVhcZSYxYGnKMQ6B88I8ZGxZhXsyN0FAqyFW8pMf4=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr33119453wrs.249.1636174234651; 
 Fri, 05 Nov 2021 21:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211105235852.3011900-1-atish.patra@wdc.com>
 <20211105235852.3011900-6-atish.patra@wdc.com>
In-Reply-To: <20211105235852.3011900-6-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 6 Nov 2021 10:20:23 +0530
Message-ID: <CAAhSdy1GBcjzAPL3PDoKgUcHPFAHi7W_2USMorwXX08Yi8imJQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] RISC-V: KVM: Add SBI HSM extension in KVM
To: Atish Patra <atish.patra@wdc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Vincent Chen <vincent.chen@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_215036_106165_25AC6450 
X-CRM114-Status: GOOD (  31.46  )
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

On Sat, Nov 6, 2021 at 5:29 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> SBI HSM extension allows OS to start/stop harts any time. It also allows
> ordered booting of harts instead of random booting.
>
> Implement SBI HSM exntesion and designate the vcpu 0 as the boot vcpu id.
> All other non-zero non-booting vcpus should be brought up by the OS
> implementing HSM extension. If the guest OS doesn't implement HSM
> extension, only single vcpu will be available to OS.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/sbi.h  |   1 +
>  arch/riscv/kvm/Makefile       |   1 +
>  arch/riscv/kvm/vcpu.c         |  23 ++++++++
>  arch/riscv/kvm/vcpu_sbi.c     |   4 ++
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 107 ++++++++++++++++++++++++++++++++++
>  5 files changed, 136 insertions(+)
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
> index 3502c6166eba..bff753b6e4b0 100644
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
> index 000000000000..aefee16a1560
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -0,0 +1,107 @@
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
> +       if (!cp)
> +               return -EINVAL;

Same as other patches. Drop the check on "cp".

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
> 2.31.1
>

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
