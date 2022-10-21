Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45122C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 06:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cymGWRoeRMU/sRzBZNtUgd+L1IwzZTSCZO1VLUAEswI=; b=0yEPosbYWA71Se
	XRNlpdvnC3qV3CtIbJy2U6qhhXfhohmxKaQoqP2yOVHz/1Pt9vLFdwyBjSO1vMYRfeRqQLc1q2NjT
	m85NugDRvuxKOHei4XkLVgQtNXSQFBMZh0QCgCTh1Y4wbo6dtYUrW+kzyBIgFhjCWAwvzgEGaoS2e
	06H64FjdCotxDCzMqoMRkuLeSytNQM8vVqXC2rjVmjGjH3ePIrI+41wtkL0V6U+ns7AaoExRinorQ
	kE9UwVw2iPFZRDIr50NsKPHWN7O62D6KGS8TriQJM8iAcS5hKfpxT6B502eadJ2JQx/0RJ1itsRDZ
	Hwuer1POI15TCrdl0kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oll9G-005ZrL-FE; Fri, 21 Oct 2022 06:04:50 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oll9E-005Zp1-7U
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 06:04:49 +0000
Received: by mail-ot1-x331.google.com with SMTP id 101-20020a9d0bee000000b00661b54d945fso1207902oth.13
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 23:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X/GRjlz3OBLLftzrQwN2BllHc/DggggRf8lVr8VG4SA=;
        b=PlbM5iStfkae1Q3fuihRV3OvtIMUFdbkjn19h/HY9jKFba1Tf4urYPX0EG/zB7yatG
         s7vi3YRFmTBcLp1LBp6rk7GZYOgD1/amQUMV/ti4hR0UXKg4gZbsYdrIwLIUYvM2zsmx
         6gTBEYHnhNuL58sglAB9TkyAsGMYRAk/2FexE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/GRjlz3OBLLftzrQwN2BllHc/DggggRf8lVr8VG4SA=;
        b=hl6JPFAd95EM6ifzZncp8ie4FYbNQpSzmfJtzMVfDwXVfoeHMMFmkhdfg+edl+QNMl
         AfJf5MXEw7bPmLmICSlVgbCvVmg4IUBpkFWC5N1Fb34BSqa3rrMpiY2bdLdvwAiCwtu+
         IStsG7Zsme7SdLpRiJRAVF2Pu8/HVh5dQ27wND6RL/MrVzbBAkqzZYQ2AQpv0NjxjL3+
         lHW0rE7kYUXmik2OFcHKJG6OL3xU0ad4W9kR9K0QdfkUjldgLeSDWdl+yZGy+DBRLj9q
         g1vJLZVtk3+PO7ixOXFmvu+AdpVBWKMCcdqUi81IKRx4gHRHoFHOudORGkMxTBsaqjFQ
         fiOQ==
X-Gm-Message-State: ACrzQf0GxHUSzlJLLvl4NY6YbObTdeAc45x3HkI1GRrgdiM8sYcIkRTb
	zjMxWRD8laRm817mBwzBlVyqKLfLlPYH/FTTcQnE
X-Google-Smtp-Source: AMsMyM7K0WAbqwMo/2+Tsz5RDOWzcEbuFbaCbLvJ8fnArjfYzaxeNfAApLoIPWQ2DzfEEIfMA3J1eUSOnC2ZFwE0G5c=
X-Received: by 2002:a05:6830:6611:b0:662:2725:d309 with SMTP id
 cp17-20020a056830661100b006622725d309mr507738otb.293.1666332286395; Thu, 20
 Oct 2022 23:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221019114535.131469-1-apatel@ventanamicro.com>
In-Reply-To: <20221019114535.131469-1-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 20 Oct 2022 23:04:35 -0700
Message-ID: <CAOnJCUJYQegEa3H+1drGAcy5ptEku9A3gtKWkOm=imC62S4UZw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_230448_274622_A36C5BD8 
X-CRM114-Status: GOOD (  21.36  )
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

On Wed, Oct 19, 2022 at 4:45 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The kvm_riscv_vcpu_timer_pending() checks per-VCPU next_cycles
> and per-VCPU software injected VS timer interrupt. This function
> returns incorrect value when Sstc is available because the per-VCPU
> next_cycles are only updated by kvm_riscv_vcpu_timer_save() called
> from kvm_arch_vcpu_put(). As a result, when Sstc is available the
> VCPU does not block properly upon WFI traps.
>
> To fix the above issue, we introduce kvm_riscv_vcpu_timer_sync()
> which will update per-VCPU next_cycles upon every VM exit instead
> of kvm_riscv_vcpu_timer_save().
>
> Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
>  arch/riscv/kvm/vcpu.c                   |  3 +++
>  arch/riscv/kvm/vcpu_timer.c             | 17 +++++++++++++++--
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
> index 0d8fdb8ec63a..82f7260301da 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_timer.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
> @@ -45,6 +45,7 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
>  void kvm_riscv_guest_timer_init(struct kvm *kvm);
> +void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
>  bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index a032c4f0d600..71ebbc4821f0 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -708,6 +708,9 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
>                                 clear_bit(IRQ_VS_SOFT, &v->irqs_pending);
>                 }
>         }
> +
> +       /* Sync-up timer CSRs */
> +       kvm_riscv_vcpu_timer_sync(vcpu);
>  }
>
>  int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index 185f2386a747..ad34519c8a13 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -320,20 +320,33 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
>         kvm_riscv_vcpu_timer_unblocking(vcpu);
>  }
>
> -void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
> +void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu)
>  {
>         struct kvm_vcpu_timer *t = &vcpu->arch.timer;
>
>         if (!t->sstc_enabled)
>                 return;
>
> -       t = &vcpu->arch.timer;
>  #if defined(CONFIG_32BIT)
>         t->next_cycles = csr_read(CSR_VSTIMECMP);
>         t->next_cycles |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
>  #else
>         t->next_cycles = csr_read(CSR_VSTIMECMP);
>  #endif
> +}
> +
> +void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> +
> +       if (!t->sstc_enabled)
> +               return;
> +
> +       /*
> +        * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
> +        * upon every VM exit so no need to save here.
> +        */
> +
>         /* timer should be enabled for the remaining operations */
>         if (unlikely(!t->init_done))
>                 return;
> --
> 2.34.1
>

Ahh. That's a tricky one. Thanks for fixing it.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
