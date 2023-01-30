Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D17C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0vYbswQlUXshiyvfxsDAvbC1em0o5GLnC+lCo5nE0I=; b=l2n2/9msEc708u
	aOEZj+Kf/jgKtFO8DWcuLX3G89JOZqOezYjQFEjfDLVGkZIdX5TSCgRzdQ43Jc5MIlnLBo/mD5Yck
	6MuHDDhLu8RL4ATbGXc3EMVQHVKCYgEZyvoAo+aupkPxCxV0inz0d6YaPTjsOE42NGZqC52S+PzPp
	HCIxXNXF6xUYag2wVYxeUPkhsPLnPoCpOuSj5ccqCMpr3jl+JRD2L/5u57/3oegStzK/gEG2XNQeM
	+BYqVKt4ARQn2ydUvVkal+tMoMQbn/IdVZSIfRmRqRyKQ/QVW3GRCWvsV+kyGWBLdAt+1Wazrqr3E
	OfNAW+ZRkiXVfvr+t8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWOS-0046Xm-EV; Mon, 30 Jan 2023 15:48:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWOP-0046WF-ER
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 15:48:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id hx15so13450808ejc.11
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 07:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6cSvTtaPluKjivYl4UrQE4bipaF+IzwEg2ePwmyFKRo=;
        b=Cedm42tTIOsEhgfb6LgujmAeg6lfxqPfaBVz3TYK7+w0tf3BR9jHq71TeBjS9VhyA8
         QRyokjxnWJIrBYox+pVP0IuDxAAD4Hu672xbY9vLkpfYucxS2qf/8GRsogStfI81OYUF
         +4sLUq1RvN6H2RZs/rWAMYvs3z777/zbgdnMBfcbuXX8Ee78rGU9TRoMLI5thuAczQpS
         j3UphqgjtUAjLoxDqskm/zgV5dT/6ox45G+R6n6XLYZBRcFg+jrt+8YWQLqvBGUdCLQl
         C7FVjavrW8bPUtIuo0WnZRMfstKiFhIaXtlbrfW5w567w+k/6xRH8/6KMwc0O8edcR7r
         doBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cSvTtaPluKjivYl4UrQE4bipaF+IzwEg2ePwmyFKRo=;
        b=kCvr7GpbPo7E1UZX77prZRhdXVAHqex31PbFVbW3tMBj3IHwINGE9qEedFzEuhnm9T
         IRSyDe4OHFR7dRbzfBUPfEpKjVrs8wfL3zBi9q9zxm4l3Vx7UhmfyTU6srGfpIPjjNJl
         H3GuD1lpZ+fqTKslONhzyqlLayFaIB2aqaw4WixRMlAg3hdkFWqzYhxdZre993Gx5E2O
         omrkfnLOvo1J3v/99T7Uj828+tNGfnlmNXwOp8N1ha7oX/i+JyYin9W3hBMrDuTEqwYL
         KweA+rI6ZEhHmDyWVgP3O4QR7y/z7h70ITadLqQZ+lVgfTzZGOeRaZfxpGI1gycmkixu
         rvMA==
X-Gm-Message-State: AO0yUKXtDYliDGZEB8q4dO2yXg58zeMvOGYDVjHlPBeKeCnvrt7rvMbb
	YtI1kaeJgU15a+Ih+03tBQZa6yRdkELA8O9FrJLiFA==
X-Google-Smtp-Source: AK7set9qVB5OX6ni0Lk55dQYAPF5FY9x1JC11OZle5po67AkILOWqlwslRl3M2sAdorBp77iVCghti5lhVQF6GMNHlg=
X-Received: by 2002:a17:906:88f:b0:88a:7cf5:5d33 with SMTP id
 n15-20020a170906088f00b0088a7cf55d33mr617944eje.100.1675093703810; Mon, 30
 Jan 2023 07:48:23 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-15-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-15-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Jan 2023 21:18:10 +0530
Message-ID: <CAAhSdy1C1wKDBwRbyx=i63_AyGBsgN881_E-fxR=8qqYgwUtGw@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] RISC-V: KVM: Increment firmware pmu events
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_074825_509359_E9D947F3 
X-CRM114-Status: GOOD (  16.57  )
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
> KVM supports firmware events now. Invoke the firmware event increment
> function from appropriate places.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/tlb.c              | 4 ++++
>  arch/riscv/kvm/vcpu_sbi_replace.c | 7 +++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 309d79b..b797f7c 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -181,6 +181,7 @@ void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
>
>  void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
>  {
> +       kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_RCVD);
>         local_flush_icache_all();
>  }
>
> @@ -264,15 +265,18 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
>                                                 d.addr, d.size, d.order);
>                         break;
>                 case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
> +                       kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
>                         kvm_riscv_local_hfence_vvma_asid_gva(
>                                                 READ_ONCE(v->vmid), d.asid,
>                                                 d.addr, d.size, d.order);
>                         break;
>                 case KVM_RISCV_HFENCE_VVMA_ASID_ALL:
> +                       kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
>                         kvm_riscv_local_hfence_vvma_asid_all(
>                                                 READ_ONCE(v->vmid), d.asid);
>                         break;
>                 case KVM_RISCV_HFENCE_VVMA_GVA:
> +                       kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
>                         kvm_riscv_local_hfence_vvma_gva(
>                                                 READ_ONCE(v->vmid),
>                                                 d.addr, d.size, d.order);
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index abeb55f..71a671e 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -11,6 +11,7 @@
>  #include <linux/kvm_host.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
> +#include <asm/kvm_vcpu_pmu.h>
>  #include <asm/kvm_vcpu_sbi.h>
>
>  static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> @@ -25,6 +26,7 @@ static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 return 0;
>         }
>
> +       kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_SET_TIMER);
>  #if __riscv_xlen == 32
>         next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
>  #else
> @@ -57,6 +59,7 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 return 0;
>         }
>
> +       kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_IPI_SENT);
>         kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
>                 if (hbase != -1UL) {
>                         if (tmp->vcpu_id < hbase)
> @@ -67,6 +70,7 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 ret = kvm_riscv_vcpu_set_interrupt(tmp, IRQ_VS_SOFT);
>                 if (ret < 0)
>                         break;
> +               kvm_riscv_vcpu_pmu_incr_fw(tmp, SBI_PMU_FW_IPI_RECVD);
>         }
>
>         return ret;
> @@ -90,6 +94,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
>         switch (funcid) {
>         case SBI_EXT_RFENCE_REMOTE_FENCE_I:
>                 kvm_riscv_fence_i(vcpu->kvm, hbase, hmask);
> +               kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
>                 if (cp->a2 == 0 && cp->a3 == 0)
> @@ -97,6 +102,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
>                 else
>                         kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
>                                                   cp->a2, cp->a3, PAGE_SHIFT);
> +               kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
>                 if (cp->a2 == 0 && cp->a3 == 0)
> @@ -107,6 +113,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
>                                                        hbase, hmask,
>                                                        cp->a2, cp->a3,
>                                                        PAGE_SHIFT, cp->a4);
> +               kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
