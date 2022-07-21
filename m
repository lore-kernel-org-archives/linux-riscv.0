Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9BAC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 04:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQUx56DLch6y1LoGrbboIVqy8Suy3tghWbCVAoe9/jA=; b=RjaiqyfQjJGe2B
	UEXzjnsajJ633dwCoTYhAufVs03m+kgLMgjmbHCdMRNpqx5exw5stWdyJkGDX/myqJMp6Npj5KV5Y
	INwOfi2kvcnvE6JVX8ZqDQk1X++oV39G8oSeXkwtlmVLRH9MOnRoLzLbupzmRQeQfsoxnmUXanNC6
	S1FjKgtja3BRV+AoKswjbeskeUke6rKd1b+hDkhSJFRJIN6YNfj/l4NDvP74bztMk4CrPe6hvFG21
	6Feb/KbonjWl+5NSDj6yqDaRAlj0HfttCT2tnL+Yvv9rjrwJjrUiYt9U1nCNHnH+eTJsjTUHgeUAO
	RXMa0nmA7OUUw84MvFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oENsr-00GZ0O-Pa; Thu, 21 Jul 2022 04:33:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oENso-00GYzD-Lf
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 04:33:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id n12so528776wrc.8
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 21:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XSl/7nq5z08bx2Aess7HWT4O/bdlrIbzwKY5APH/Hxs=;
        b=DKizClMVpO8msoFXsVkBikgjCshHCshC/jj7yzE3QYL+MTnC2UV0lAtmqbw2sXtjEq
         JMwOAZGMDNEv+8bwYSdv5+xk/WZbDi0K1XBYEtF3kFVBr9O40NkTMLhYm8oFctFx//Kv
         W4noy4QiGsBw37Lqh76196f3Nk7hH509t0Ab1N0N51ajrhcVedcBA2rov9O6tbHTT/Vn
         wdR11z3Sf5Pu/COvSjLG36R9RCSGUBjcxWz8DvKXKqu/XOzXHqiBcU8hFPPygju0Hbvi
         XMcIE1azMg2KjNufDV97F6qUkWo2+bNIm708HHBlZhS/jfx+fKj5OSfLABG2z2nJYfm2
         bkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XSl/7nq5z08bx2Aess7HWT4O/bdlrIbzwKY5APH/Hxs=;
        b=gCSHcuCurhheFNPsZLT/OhA3C9mym/YYBUeUETszdkJZt0RhS0XrpD6/1oSyqHd19p
         OnyzrGmhELKEEa6ZSbCXTjpW/UNXMiY8CTcvzqwL7T93z4RPZLYfJzXqvs7Tf0uvwnlh
         ELPOTlFeJHThHszQJbVMBitHmFJDILFUjdnhJtMeiOI7MJSNJdbF1xRZjybB09VTh2Pp
         KlOhQRctsmpmc8l16VBxfn0+B4dW7Z279NDUBJWbDDUoN9ExN0WC2m3XsPD3cloB2rDN
         RNMdBBlTaesfrn2RPNmSNpC1/IysXg7KioYs/aKn/TeSYohQKi7sn0G4lfm1MNBJHFmm
         Rfwg==
X-Gm-Message-State: AJIora9qfsHqD162BWZN3tdI/+OnFvPPdPmRHl+qTinIzMrsyOJ4ezgv
	Kzt8uhixDO31gBQy/UW3J7R4xeunDVn49B2L0alyug==
X-Google-Smtp-Source: AGRyM1v+TXXaRFeSIhq1JbQy/B3tFJNUd2iglYr8fSfxSYw44WHTmNpVBpVLfSrpqPTxZc+kxqsHUzmVOuiuvaGL5bM=
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id
 m12-20020a5d64ac000000b0021d7832ecf9mr32606583wrp.86.1658378031886; Wed, 20
 Jul 2022 21:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220720192342.3428144-1-atishp@rivosinc.com> <20220720192342.3428144-5-atishp@rivosinc.com>
In-Reply-To: <20220720192342.3428144-5-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Jul 2022 10:03:38 +0530
Message-ID: <CAAhSdy1b0pAhex6V-T5AhLmvo5-F1B4fOTpphJ-0A3+si-Q2OA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] RISC-V: KVM: Support sstc extension
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Liu Shaohua <liush@allwinnertech.com>, 
	Niklas Cassel <niklas.cassel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Thomas Gleixner <tglx@linutronix.de>, 
	Tsukasa OI <research_trasio@irq.a4lg.com>, Wei Fu <wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_213354_962648_2EA41D60 
X-CRM114-Status: GOOD (  27.71  )
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

On Thu, Jul 21, 2022 at 12:53 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Sstc extension allows the guest to program the vstimecmp CSR directly
> instead of making an SBI call to the hypervisor to program the next
> event. The timer interrupt is also directly injected to the guest by
> the hardware in this case. To maintain backward compatibility, the
> hypervisors also update the vstimecmp in an SBI set_time call if
> the hardware supports it. Thus, the older kernels in guest also
> take advantage of the sstc extension.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_timer.h |   7 ++
>  arch/riscv/include/uapi/asm/kvm.h       |   1 +
>  arch/riscv/kvm/vcpu.c                   |   7 +-
>  arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
>  4 files changed, 152 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
> index 50138e2eb91b..0d8fdb8ec63a 100644
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
> @@ -40,5 +45,7 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
>  void kvm_riscv_guest_timer_init(struct kvm *kvm);
> +void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
> +bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
>
>  #endif
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 24b2a6e27698..9ac3dbaf0b0f 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_H,
>         KVM_RISCV_ISA_EXT_I,
>         KVM_RISCV_ISA_EXT_M,
> +       KVM_RISCV_ISA_EXT_SSTC,

Please don't add a new ISA ext register in-between to maintain
UAPI compatibility.

>         KVM_RISCV_ISA_EXT_SVPBMT,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 5d271b597613..9ee6ad376eb2 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -51,6 +51,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         RISCV_ISA_EXT_h,
>         RISCV_ISA_EXT_i,
>         RISCV_ISA_EXT_m,
> +       RISCV_ISA_EXT_SSTC,

Move this at the end of array as-per above.

>         RISCV_ISA_EXT_SVPBMT,
>  };
>
> @@ -203,7 +204,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>
>  int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>  {
> -       return kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER);
> +       return kvm_riscv_vcpu_timer_pending(vcpu);
>  }
>
>  void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
> @@ -785,6 +786,8 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
>         if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
>                 henvcfg |= ENVCFG_PBMTE;
>
> +       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SSTC))
> +               henvcfg |= ENVCFG_STCE;
>         csr_write(CSR_HENVCFG, henvcfg);
>  #ifdef CONFIG_32BIT
>         csr_write(CSR_HENVCFGH, henvcfg >> 32);
> @@ -828,6 +831,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>                                      vcpu->arch.isa);
>         kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
>
> +       kvm_riscv_vcpu_timer_save(vcpu);
> +
>         csr->vsstatus = csr_read(CSR_VSSTATUS);
>         csr->vsie = csr_read(CSR_VSIE);
>         csr->vstvec = csr_read(CSR_VSTVEC);
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index 595043857049..16f50c46ba39 100644
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
>  void kvm_riscv_guest_timer_init(struct kvm *kvm)
>  {
>         struct kvm_guest_timer *gt = &kvm->arch.timer;
> --
> 2.25.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
