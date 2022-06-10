Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BDFC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 04:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCQm96GgXlt8ay5jjMvkl1fSsl6jNPf1agV8NP++LUo=; b=YTf6d8d/cL2Bdi
	34B3rBifQHy+kewb/ZlBj9R2Y7wJSM/9HlTduu9Fa5e/+Spox7Xv29wx5qD2BSlFsMBOBJi4831Z2
	+/bFNJ3chLcfTTIfIsZ0CEINpkFq0HItvvApSThXcsIDKF+/WMMFhm5leX5YQElx3+DY1cBNZLerW
	MTiwKSlZqdc4q5zSlrTEoiRb3iYt8qLSlCb8XFwOwFVZLmktiIK+lrHlEUeuNJrzKN262C+Av4V0O
	qOxEI+5vfXNjLmbr6oXF8ey1hfm14kAHKuTnHtsXtPYJakz/hQCEQOSNQarENaNbW5rucaf/PgTdw
	+XBGYjkTnSr+eQBullCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWba-005qLx-Ix; Fri, 10 Jun 2022 04:50:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWbW-005qJH-SD
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 04:50:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id i17-20020a7bc951000000b0039c4760ec3fso1536029wml.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 21:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WRDpOb946zBFjC4zPGmam2E6l5Rn6rl1xZpXcF5z5oI=;
        b=UKmqgHrmvtrmZbGRiI9LOkSvL+PMJ/6864X/TbtQH9BwhK6nMu7YZf/TO7aTOJeH/I
         aWhLe9eDqiM2I5hHfCJqTxQFTB+S+D40aFMbq/H5MHRnjBWl8wQTfo3Ewq8WJgjyO7p0
         AKH5zpq1tY0UW7epjvFUmFtgsADkNa8f0m0aGC0uUd2rrNyPlqna+8l4vPWNiCXx/YtD
         S+exQgS8nSyQbvGY/wcxAmDFKnWKsh2mpeiJEPlQ74gd4IKMQpbCH+Y39AlmAya2/L2F
         Rtuj44hryjGVccJL5UmLCOfvRQl6GkkIW5LMWMjS/1VPOnngaEwF4GeSRrpob+RN8Zye
         Ov4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WRDpOb946zBFjC4zPGmam2E6l5Rn6rl1xZpXcF5z5oI=;
        b=moP2gmgRoc5VfVHLSg7cZGq0O54QPkeiMMYNV0NslOqvI3UXm/pqii0x9jzgAI6x2F
         O0UBQCzAQY4Z/EYyxN5HISRwdD3fcTcI5tuPJcEqJtkSuYUClk5e+gB1jyC6PHXS9j3f
         awN2vhDtkM8mXY+94mqceas5XzmMe9NjrSbOSzq+7e9nLEYGzAbTvzBxAjm6FWu7k/fU
         HCAaGLXOewFaDg2MhqGnoU6JsnghQa9t9x0yfcyJmcgvadVxxgkoaS/savCzCKGT68dt
         11ZRwFYoT9Ogd8AYkfvKNM1J+6kl3bc5t4Oo1Bakl+3q3FNjtCPuH9SRAIqDF683VK0b
         sGmg==
X-Gm-Message-State: AOAM532OPCey9d91nHJaqIuHMb/xuYIluM+Xbt8YAW4u5KxiUBGupXNZ
	gVHwdP+5Fk01shVUg7cIANGZqrYRZQ28i2J/lGfMbg==
X-Google-Smtp-Source: ABdhPJw9Plq/E9pId9cZuoOdImK4TnWZnPqFhb4NsbkDIazc+Sa8s6Il6VkSjclJQMk74yBMFW161wnmXdWcEhZoBxg=
X-Received: by 2002:a05:600c:1d23:b0:39c:4215:72f9 with SMTP id
 l35-20020a05600c1d2300b0039c421572f9mr6666842wms.137.1654836636862; Thu, 09
 Jun 2022 21:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220527042937.1124009-1-atishp@rivosinc.com> <20220527042937.1124009-5-atishp@rivosinc.com>
In-Reply-To: <20220527042937.1124009-5-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Jun 2022 10:20:24 +0530
Message-ID: <CAAhSdy1UkWndCUw_3t57R4gAjq3O3P_mnNqNzeximn0JUywwBw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: KVM: Support sstc extension
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_215038_955329_46D7F07D 
X-CRM114-Status: GOOD (  27.31  )
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

On Fri, May 27, 2022 at 9:59 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Sstc extension allows the guest to program the vstimecmp CSR directly
> instead of making an SBI call to the hypervisor to program the next
> event. The timer interrupt is also directly injected to the guest by
> the hardware in this case. To maintain backward compatibility, the
> hypervisors also update the vstimecmp in an SBI set_time call if
> the hardware supports it. Thus, the older kernels in guest also
> take advantage of the sstc extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_timer.h |   8 +-
>  arch/riscv/include/uapi/asm/kvm.h       |   1 +
>  arch/riscv/kvm/main.c                   |  12 +-
>  arch/riscv/kvm/vcpu.c                   |   5 +-
>  arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
>  5 files changed, 161 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
> index 375281eb49e0..a24a265f3ccb 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_timer.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
> @@ -28,6 +28,11 @@ struct kvm_vcpu_timer {
>         u64 next_cycles;
>         /* Underlying hrtimer instance */
>         struct hrtimer hrt;
> +
> +       /* Flag to check if sstc is enabled or not */
> +       bool sstc_enabled;
> +       /* A function pointer to switch between stimecmp or hrtimer at runtime */
> +       int (*timer_next_event)(struct kvm_vcpu *vcpu, u64 ncycles);
>  };
>
>  int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles);
> @@ -39,6 +44,7 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
>  int kvm_riscv_guest_timer_init(struct kvm *kvm);
> -
> +bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
>  #endif
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 92bd469e2ba6..d2f02ba1947a 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_H,
>         KVM_RISCV_ISA_EXT_I,
>         KVM_RISCV_ISA_EXT_M,
> +       KVM_RISCV_ISA_EXT_SSTC,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 2e5ca43c8c49..83c4db7fc35f 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -32,7 +32,7 @@ int kvm_arch_hardware_setup(void *opaque)
>
>  int kvm_arch_hardware_enable(void)
>  {
> -       unsigned long hideleg, hedeleg;
> +       unsigned long hideleg, hedeleg, henvcfg;
>
>         hedeleg = 0;
>         hedeleg |= (1UL << EXC_INST_MISALIGNED);
> @@ -51,6 +51,16 @@ int kvm_arch_hardware_enable(void)
>
>         csr_write(CSR_HCOUNTEREN, -1UL);
>
> +       if (riscv_isa_extension_available(NULL, SSTC)) {
> +#ifdef CONFIG_64BIT
> +               henvcfg = csr_read(CSR_HENVCFG);
> +               csr_write(CSR_HENVCFG, henvcfg | 1UL<<HENVCFG_STCE);
> +#else
> +               henvcfg = csr_read(CSR_HENVCFGH);
> +               csr_write(CSR_HENVCFGH, henvcfg | 1UL<<HENVCFGH_STCE);
> +#endif
> +       }
> +
>         csr_write(CSR_HVIP, 0);
>
>         return 0;
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 47ad837adeb1..b9c349edb13c 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -143,7 +143,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>
>  int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>  {
> -       return kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER);
> +       return kvm_riscv_vcpu_timer_pending(vcpu);
>  }
>
>  void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
> @@ -374,6 +374,7 @@ static unsigned long kvm_isa_ext_arr[] = {
>         RISCV_ISA_EXT_h,
>         RISCV_ISA_EXT_i,
>         RISCV_ISA_EXT_m,
> +       RISCV_ISA_EXT_SSTC,
>  };
>
>  static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
> @@ -754,6 +755,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>                                      vcpu->arch.isa);
>         kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
>
> +       kvm_riscv_vcpu_timer_save(vcpu);
> +
>         csr->vsstatus = csr_read(CSR_VSSTATUS);
>         csr->vsie = csr_read(CSR_VSIE);
>         csr->vstvec = csr_read(CSR_VSTVEC);
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index 5c4c37ff2d48..6c7a1a81eafd 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -69,7 +69,18 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
>         return 0;
>  }
>
> -int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
> +static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
> +{
> +#if defined(CONFIG_32BIT)
> +               csr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
> +               csr_write(CSR_VSTIMECMPH, ncycles >> 32);
> +#else
> +               csr_write(CSR_VSTIMECMP, ncycles);
> +#endif
> +               return 0;
> +}
> +
> +static int kvm_riscv_vcpu_update_hrtimer(struct kvm_vcpu *vcpu, u64 ncycles)
>  {
>         struct kvm_vcpu_timer *t = &vcpu->arch.timer;
>         struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> @@ -88,6 +99,65 @@ int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
>         return 0;
>  }
>
> +int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
> +{
> +       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> +
> +       return t->timer_next_event(vcpu, ncycles);
> +}
> +
> +static enum hrtimer_restart kvm_riscv_vcpu_vstimer_expired(struct hrtimer *h)
> +{
> +       u64 delta_ns;
> +       struct kvm_vcpu_timer *t = container_of(h, struct kvm_vcpu_timer, hrt);
> +       struct kvm_vcpu *vcpu = container_of(t, struct kvm_vcpu, arch.timer);
> +       struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> +
> +       if (kvm_riscv_current_cycles(gt) < t->next_cycles) {
> +               delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
> +               hrtimer_forward_now(&t->hrt, ktime_set(0, delta_ns));
> +               return HRTIMER_RESTART;
> +       }
> +
> +       t->next_set = false;
> +       kvm_vcpu_kick(vcpu);
> +
> +       return HRTIMER_NORESTART;
> +}
> +
> +bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> +       struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> +
> +       if (!kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t) ||
> +           kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER))
> +               return true;
> +       else
> +               return false;
> +}
> +
> +static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> +       struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> +       u64 delta_ns;
> +
> +       if (!t->init_done)
> +               return;
> +
> +       delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
> +       if (delta_ns) {
> +               hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
> +               t->next_set = true;
> +       }
> +}
> +
> +static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
> +{
> +       kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
> +}
> +
>  int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
>                                  const struct kvm_one_reg *reg)
>  {
> @@ -180,10 +250,20 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu)
>                 return -EINVAL;
>
>         hrtimer_init(&t->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -       t->hrt.function = kvm_riscv_vcpu_hrtimer_expired;
>         t->init_done = true;
>         t->next_set = false;
>
> +       /* Enable sstc for every vcpu if available in hardware */
> +       if (riscv_isa_extension_available(NULL, SSTC)) {
> +               t->sstc_enabled = true;
> +               t->hrt.function = kvm_riscv_vcpu_vstimer_expired;
> +               t->timer_next_event = kvm_riscv_vcpu_update_vstimecmp;
> +       } else {
> +               t->sstc_enabled = false;
> +               t->hrt.function = kvm_riscv_vcpu_hrtimer_expired;
> +               t->timer_next_event = kvm_riscv_vcpu_update_hrtimer;
> +       }
> +
>         return 0;
>  }
>
> @@ -199,21 +279,73 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu)
>
>  int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu)
>  {
> +       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> +
> +       t->next_cycles = -1ULL;
>         return kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
>  }
>
> -void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
> +static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
>  {
>         struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
>
> -#ifdef CONFIG_64BIT
> -       csr_write(CSR_HTIMEDELTA, gt->time_delta);
> -#else
> +#if defined(CONFIG_32BIT)
>         csr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
>         csr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
> +#else
> +       csr_write(CSR_HTIMEDELTA, gt->time_delta);
>  #endif
>  }
>
> +void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_csr *csr;
> +       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> +
> +       kvm_riscv_vcpu_update_timedelta(vcpu);
> +
> +       if (!t->sstc_enabled)
> +               return;
> +
> +       csr = &vcpu->arch.guest_csr;
> +#if defined(CONFIG_32BIT)
> +       csr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
> +       csr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
> +#else
> +       csr_write(CSR_VSTIMECMP, t->next_cycles);
> +#endif
> +
> +       /* timer should be enabled for the remaining operations */
> +       if (unlikely(!t->init_done))
> +               return;
> +
> +       kvm_riscv_vcpu_timer_unblocking(vcpu);
> +}
> +
> +void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_csr *csr;
> +       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> +
> +       if (!t->sstc_enabled)
> +               return;
> +
> +       csr = &vcpu->arch.guest_csr;
> +       t = &vcpu->arch.timer;
> +#if defined(CONFIG_32BIT)
> +       t->next_cycles = csr_read(CSR_VSTIMECMP);
> +       t->next_cycles |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
> +#else
> +       t->next_cycles = csr_read(CSR_VSTIMECMP);
> +#endif
> +       /* timer should be enabled for the remaining operations */
> +       if (unlikely(!t->init_done))
> +               return;
> +
> +       if (kvm_vcpu_is_blocking(vcpu))
> +               kvm_riscv_vcpu_timer_blocking(vcpu);
> +}
> +
>  int kvm_riscv_guest_timer_init(struct kvm *kvm)
>  {
>         struct kvm_guest_timer *gt = &kvm->arch.timer;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
