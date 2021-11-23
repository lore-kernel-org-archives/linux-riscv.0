Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB230C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtursHJulTXMXzncZmN3mh/b7qg+9z9BEmz+iMIvleQ=; b=hl5KcJeu+dbIdO
	s0k06BauprCMOKk6RhFRWbw7wZPDXsUl+vn8bCuupmmg+6ut6B7kgAhu0ezfa/4k2e1rwG2PUZ8Hj
	ACs+fkLuxbJI4uBLpa+/lzUuDTd3X1ye1imClk2WKlT3uESbnG3BSDRtZdu3AuHIDaKuLw/eL+L3n
	f3EacG2Yd7/gTQ8/9Os8mdy5gHYB6K0iKxEG20untVsZ7j+aYeNErhGIU8T3aVuVeQ5pA+BuzWaMq
	Y/b1T/oA8tQsAzqJgthkNvuwYCQmug/rXdiQbEuDquX/jNc7x7kmzh4gto/SDKqMCWyR+ff+h91bj
	Yv+WDc2YKOjUT9A/bSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpQyS-001EIo-0v; Tue, 23 Nov 2021 08:16:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpQlF-001AIX-MQ
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 08:02:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso811172wmr.5
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 00:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcOThBA52zPLhCS2zPMb4qpl869iJkhdJeBDm9K1m+A=;
 b=HqA5YbSrueDLeFJdmmk0X8ku7AbQ43ptWJKPgT+vSDnTsPNC+L235iAEGBlnOhariW
 69qonCe8yJCsgEHEQ7wZYB4q9Nji1BoPEEDHWBFx+/ai5VaF+xigRqUeAPvtnHiYhsm5
 5C0KdvNsKiNhKqtfk2Lond8uRIOShGBdpttLLFQtICb28/ZZwUlzHdY6nEqIuAI+Ml79
 yhpbuaGM9G7/wGdjg6NtmsZW9dAO0Xj/mymubi5ADdk7z/DvRLRSgMec1j+nbPWJxzec
 SnMokwlrpsdRHocdAU1qOO8TnO7LCH8CGWNTMlAVf/wRa3fdm5fOc37allhajf4n3ZAu
 k/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcOThBA52zPLhCS2zPMb4qpl869iJkhdJeBDm9K1m+A=;
 b=dgQT2ejAIWLUy/kCa1QSghIJvhLSi75AKilWVwxIpWdBwipk9ynz4wy7yRmmAY1vuq
 9b06gY7r7I6wcDJnbwh7psfCqrDYsecdPG5WKqbNFX+5pWg432eVYCJrP0IX0oA1DkOc
 cADsJwB9ayp/0FChDLvbFwLyYb09pvfmHfCm8Xqi6Ez9X+xM3ZudCtW/FDIIxC8z8Vwp
 TPGoNpaPQ5rfqOjE+v613zH5buwdITrzz9u1ZJhwn0ADkjWUuloe81/V6HNx/vqiidgd
 UjMstyMzd3Gca7PkC+H1o5XDPXa8A/VymFympi/SxU8ubSNls0Haw3WSqhhe7rxPD/kg
 rFwQ==
X-Gm-Message-State: AOAM530zB7p1GuB0ZINjfE3wVlfCIoK0LxrtuN+fq0Hl/jBzRLSitzdz
 /urBxia0oFIBMMbl6coyiFHq9Gy453sfFRtyouvVwg==
X-Google-Smtp-Source: ABdhPJyhcMIMLuH2MyEC66R1s74CyMvA46Ejn2Gj4Vs7G6l+/+piFlUNEMq8byRwemOdCO5s06VkN1YoFdcZd0YT7eM=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr660067wmc.176.1637654559549;
 Tue, 23 Nov 2021 00:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20211118083912.981995-1-atishp@rivosinc.com>
 <20211118083912.981995-2-atishp@rivosinc.com>
In-Reply-To: <20211118083912.981995-2-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 13:32:28 +0530
Message-ID: <CAAhSdy0q30ftusYnsNnXPLHjfMPahpdo6J5pY45AnK69S5bnSw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] RISC-V: KVM: Mark the existing SBI implementation
 as v01
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
X-CRM114-CacheID: sfid-20211123_000241_815867_0901E4A7 
X-CRM114-Status: GOOD (  34.55  )
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
> The existing SBI specification impelementation follows v0.1
> specification. The latest specification allows more
> scalability and performance improvements.
>
> Rename the existing implementation as v01 and provide a way to allow
> future extensions.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

I have queued this for 5.17

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  29 +++++
>  arch/riscv/kvm/vcpu_sbi.c             | 149 ++++++++++++++++++++------
>  2 files changed, 145 insertions(+), 33 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> new file mode 100644
> index 000000000000..1a4cb0db2d0b
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/**
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *     Atish Patra <atish.patra@wdc.com>
> + */
> +
> +#ifndef __RISCV_KVM_VCPU_SBI_H__
> +#define __RISCV_KVM_VCPU_SBI_H__
> +
> +#define KVM_SBI_VERSION_MAJOR 0
> +#define KVM_SBI_VERSION_MINOR 2
> +
> +struct kvm_vcpu_sbi_extension {
> +       unsigned long extid_start;
> +       unsigned long extid_end;
> +       /**
> +        * SBI extension handler. It can be defined for a given extension or group of
> +        * extension. But it should always return linux error codes rather than SBI
> +        * specific error codes.
> +        */
> +       int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +                      unsigned long *out_val, struct kvm_cpu_trap *utrap,
> +                      bool *exit);
> +};
> +
> +const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
> +#endif /* __RISCV_KVM_VCPU_SBI_H__ */
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index eb3c045edf11..32376906ff20 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
>   *
>   * Authors:
> @@ -12,9 +12,25 @@
>  #include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
> +#include <asm/kvm_vcpu_sbi.h>
>
> -#define SBI_VERSION_MAJOR                      0
> -#define SBI_VERSION_MINOR                      1
> +static int kvm_linux_err_map_sbi(int err)
> +{
> +       switch (err) {
> +       case 0:
> +               return SBI_SUCCESS;
> +       case -EPERM:
> +               return SBI_ERR_DENIED;
> +       case -EINVAL:
> +               return SBI_ERR_INVALID_PARAM;
> +       case -EFAULT:
> +               return SBI_ERR_INVALID_ADDRESS;
> +       case -EOPNOTSUPP:
> +               return SBI_ERR_NOT_SUPPORTED;
> +       default:
> +               return SBI_ERR_FAILURE;
> +       };
> +}
>
>  static void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu,
>                                        struct kvm_run *run)
> @@ -72,21 +88,19 @@ static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
>         run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
>  }
>
> -int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +                                     unsigned long *out_val,
> +                                     struct kvm_cpu_trap *utrap,
> +                                     bool *exit)
>  {
>         ulong hmask;
> -       int i, ret = 1;
> +       int i, ret = 0;
>         u64 next_cycle;
>         struct kvm_vcpu *rvcpu;
> -       bool next_sepc = true;
>         struct cpumask cm, hm;
>         struct kvm *kvm = vcpu->kvm;
> -       struct kvm_cpu_trap utrap = { 0 };
>         struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
>
> -       if (!cp)
> -               return -EINVAL;
> -
>         switch (cp->a7) {
>         case SBI_EXT_0_1_CONSOLE_GETCHAR:
>         case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> @@ -95,8 +109,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>                  * handled in kernel so we forward these to user-space
>                  */
>                 kvm_riscv_vcpu_sbi_forward(vcpu, run);
> -               next_sepc = false;
> -               ret = 0;
> +               *exit = true;
>                 break;
>         case SBI_EXT_0_1_SET_TIMER:
>  #if __riscv_xlen == 32
> @@ -104,47 +117,42 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  #else
>                 next_cycle = (u64)cp->a0;
>  #endif
> -               kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
> +               ret = kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
>                 break;
>         case SBI_EXT_0_1_CLEAR_IPI:
> -               kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
> +               ret = kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
>                 break;
>         case SBI_EXT_0_1_SEND_IPI:
>                 if (cp->a0)
>                         hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
> -                                                          &utrap);
> +                                                          utrap);
>                 else
>                         hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
> -               if (utrap.scause) {
> -                       utrap.sepc = cp->sepc;
> -                       kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> -                       next_sepc = false;
> +               if (utrap->scause)
>                         break;
> -               }
> +
>                 for_each_set_bit(i, &hmask, BITS_PER_LONG) {
>                         rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
> -                       kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
> +                       ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
> +                       if (ret < 0)
> +                               break;
>                 }
>                 break;
>         case SBI_EXT_0_1_SHUTDOWN:
>                 kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
> -               next_sepc = false;
> -               ret = 0;
> +               *exit = true;
>                 break;
>         case SBI_EXT_0_1_REMOTE_FENCE_I:
>         case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
>         case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
>                 if (cp->a0)
>                         hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
> -                                                          &utrap);
> +                                                          utrap);
>                 else
>                         hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
> -               if (utrap.scause) {
> -                       utrap.sepc = cp->sepc;
> -                       kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> -                       next_sepc = false;
> +               if (utrap->scause)
>                         break;
> -               }
> +
>                 cpumask_clear(&cm);
>                 for_each_set_bit(i, &hmask, BITS_PER_LONG) {
>                         rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
> @@ -154,22 +162,97 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>                 }
>                 riscv_cpuid_to_hartid_mask(&cm, &hm);
>                 if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
> -                       sbi_remote_fence_i(cpumask_bits(&hm));
> +                       ret = sbi_remote_fence_i(cpumask_bits(&hm));
>                 else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA)
> -                       sbi_remote_hfence_vvma(cpumask_bits(&hm),
> +                       ret = sbi_remote_hfence_vvma(cpumask_bits(&hm),
>                                                 cp->a1, cp->a2);
>                 else
> -                       sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
> +                       ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
>                                                 cp->a1, cp->a2, cp->a3);
>                 break;
>         default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
> +       .extid_start = SBI_EXT_0_1_SET_TIMER,
> +       .extid_end = SBI_EXT_0_1_SHUTDOWN,
> +       .handler = kvm_sbi_ext_v01_handler,
> +};
> +
> +static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
> +       &vcpu_sbi_ext_v01,
> +};
> +
> +const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid)
> +{
> +       int i = 0;
> +
> +       for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +               if (sbi_ext[i]->extid_start <= extid &&
> +                   sbi_ext[i]->extid_end >= extid)
> +                       return sbi_ext[i];
> +       }
> +
> +       return NULL;
> +}
> +
> +int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +{
> +       int ret = 1;
> +       bool next_sepc = true;
> +       bool userspace_exit = false;
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       const struct kvm_vcpu_sbi_extension *sbi_ext;
> +       struct kvm_cpu_trap utrap = { 0 };
> +       unsigned long out_val = 0;
> +       bool ext_is_v01 = false;
> +
> +       sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
> +       if (sbi_ext && sbi_ext->handler) {
> +               if (cp->a7 >= SBI_EXT_0_1_SET_TIMER &&
> +                   cp->a7 <= SBI_EXT_0_1_SHUTDOWN)
> +                       ext_is_v01 = true;
> +               ret = sbi_ext->handler(vcpu, run, &out_val, &utrap, &userspace_exit);
> +       } else {
>                 /* Return error for unsupported SBI calls */
>                 cp->a0 = SBI_ERR_NOT_SUPPORTED;
> -               break;
> +               goto ecall_done;
> +       }
> +
> +       /* Handle special error cases i.e trap, exit or userspace forward */
> +       if (utrap.scause) {
> +               /* No need to increment sepc or exit ioctl loop */
> +               ret = 1;
> +               utrap.sepc = cp->sepc;
> +               kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> +               next_sepc = false;
> +               goto ecall_done;
>         }
>
> +       /* Exit ioctl loop or Propagate the error code the guest */
> +       if (userspace_exit) {
> +               next_sepc = false;
> +               ret = 0;
> +       } else {
> +               /**
> +                * SBI extension handler always returns an Linux error code. Convert
> +                * it to the SBI specific error code that can be propagated the SBI
> +                * caller.
> +                */
> +               ret = kvm_linux_err_map_sbi(ret);
> +               cp->a0 = ret;
> +               ret = 1;
> +       }
> +ecall_done:
>         if (next_sepc)
>                 cp->sepc += 4;
> +       if (!ext_is_v01)
> +               cp->a1 = out_val;
>
>         return ret;
>  }
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
