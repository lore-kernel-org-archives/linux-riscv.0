Return-Path: <SRS0=YRhX=PZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93412C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 04:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4735460F9E
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 04:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4735460F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v92NpjVBtt+1s8rudoFXSwxNt0/ub+OPwB7wDdCQAFM=; b=Ap+dTHhih7mUCY
	BKmVM1dDDn8Vze51PlKNfK8Jmf1oGGR91Z1uz9SzTGdzU0hsbur9Fo0Z2YKTghWNteRJux+2xv22z
	9mmebrEPHmnBgtrKGIgp35IgKxTUFFGtMFDYcivMcOh2fY3OawbL0/yA3DN5ZR8Dn0RW6ul+722bt
	+Mf0KT9D4UK2ARdEbb5NnW04saPUGonKG3/O9YBogmQ16tFDsYQbEvMp2dogMDD0n40XYC/PlT7yD
	zd2EoW0u18w816vl0fyJ6ATKuiCSCmLLy0xJyfTJdhSUHl/TxgF8HxfMnKzimcYE9JkMH2LUY/A6Z
	mrgiDVhJJDiOzxZXfoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjDWm-00Cez3-6d; Sat, 06 Nov 2021 04:42:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjDWi-00CeyL-QY
 for linux-riscv@lists.infradead.org; Sat, 06 Nov 2021 04:42:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id v127so8664013wme.5
 for <linux-riscv@lists.infradead.org>; Fri, 05 Nov 2021 21:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=osEIpX8HJMe4eqljvoWc7K0MtnOg5c1wtCe6RJRNR8M=;
 b=53Qr0ABaQ8ml3mHx+ViHygFYO9Srx0xQy+ISPh7F6XVQFmLMiuri80XNs5pD8EFW4K
 Qx0mJ6L5UUh06No8eriU5r0tcxPJy1M+g28gVN7X5kKn1WLAoANgRHsD4ww8q0Db5XD5
 tJZGC4a/Lz3x8KmMiHAfzyn+5Hvg0NW9n29ijUV9S76/wPwTKD++LsKm8u6yinVxkSsm
 DjsO+2GbUFdeo9B8RdBvUCbeGLzvkZpTx33Ocy9EpPP/+/19NCeVePCUfpY8C4wu7+T3
 0w+GgFbP9o2zOGbkuPeYXNiT3HwfLMvgb5XXz6AGcst9SvtNacvAMHJpP9astfvlIrgu
 rj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=osEIpX8HJMe4eqljvoWc7K0MtnOg5c1wtCe6RJRNR8M=;
 b=PpYu5rYa5BPadyZknZPmxOBLdHANY5tIp9k2qlE6pJ1K2Lo907a0OttdIMODTTyPxy
 FJZl6K9XmMXB18SS1o7lMVSgQE0PHgewG/Q2qjwSjpwjbZvmNADuNv5TCvf9wryFdjlh
 qrw9tXNHiazDb6E5FDjqVR2tEAe4Ys2C59TFcRUca+0r+XKRAAEMLR+dH83P5xeq/ybv
 N9JFv2RacCi7tdKFfR0Fij8CGUOX9TIcUw6jsDtWSuZh2kJoW4FRDEN7zmYDkdTdtQ87
 k2RGZVE2UbcZP6ubflJ3BbqeHOm8i3BNoShekGKqCRs9sVYQ2h0CaT+zrPm1U3r1CPiw
 OvoA==
X-Gm-Message-State: AOAM530kf1UPUKreAE7SH6WTt/sDU0P3baOZki3LZPuKAMFPeZ4WgsVl
 kohhuMLySFA8TkjPweK7FVC7yIG3xX/ZY52mO5M/QA==
X-Google-Smtp-Source: ABdhPJypkd5sBHzja14SC9/fasrrg1DA0Xr2PRjxlUd/BvBypMtqSepxh9GIJpjpN/CvbfbTr2eIdkdAn4/yotGsddw=
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr18645457wmq.59.1636173718854; 
 Fri, 05 Nov 2021 21:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211105235852.3011900-1-atish.patra@wdc.com>
 <20211105235852.3011900-2-atish.patra@wdc.com>
In-Reply-To: <20211105235852.3011900-2-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 6 Nov 2021 10:11:47 +0530
Message-ID: <CAAhSdy1MLupRT3N5a9_V607kKd5y9JdEu4FREo_NPpud5fE2ow@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] RISC-V: KVM: Mark the existing SBI implementation
 as v01
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
X-CRM114-CacheID: sfid-20211105_214200_906732_A4E00C0D 
X-CRM114-Status: GOOD (  33.70  )
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
> The existing SBI specification impelementation follows v0.1
> specification. The latest specification known as v0.2 allows more
> scalability and performance improvements.

Please update commit description to not mention v0.2 as
the latest SBI specification.

>
> Rename the existing implementation as v01 and provide a way to allow
> future extensions.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  29 +++++
>  arch/riscv/kvm/vcpu_sbi.c             | 147 +++++++++++++++++++++-----
>  2 files changed, 147 insertions(+), 29 deletions(-)
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
> index eb3c045edf11..05cab5f27eee 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
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
> @@ -72,16 +88,17 @@ static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
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
>         if (!cp)
> @@ -95,8 +112,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>                  * handled in kernel so we forward these to user-space
>                  */
>                 kvm_riscv_vcpu_sbi_forward(vcpu, run);
> -               next_sepc = false;
> -               ret = 0;
> +               *exit = true;
>                 break;
>         case SBI_EXT_0_1_SET_TIMER:
>  #if __riscv_xlen == 32
> @@ -104,47 +120,42 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
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
> @@ -154,22 +165,100 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
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
> +       if (!cp)
> +               return -EINVAL;
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
>         }
>
> +       /* Handle special error cases i.e trap, exit or userspace forward */
> +       if (utrap.scause) {
> +               /* No need to increment sepc or exit ioctl loop */
> +               ret = 1;
> +               utrap.sepc = cp->sepc;
> +               kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> +               next_sepc = false;
> +               goto ecall_done;
> +       }
> +
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
> 2.31.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
