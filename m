Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BACAC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 01:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1M3doUl9Rssd0Xu9ppZjWykrdNTi7W7Af84vRdf5xSo=; b=uqu5WtPG0NNklt
	qE3cjUOwVtyLOPwtob62gVCpCn9t++8KkgveJEwTJwDkMhUf+Bt48HFrdkKmBbcnmkjAxRUVK+91B
	9XWDaj5Xj/4HqITdPjYNjRQ9wcXVYt0BfN3tzFcodiegA8UjpbSTTU7dcMz4P45BXagp3bB7Rc8Pz
	K2yqMIrHW35USkQTN5ZOhKIk8YwCu10F1/5czwJqk2T6iOytlBvcSFeDPg6sdfVBE+yFtdjIJ/eHM
	+NbW6MOI0W19PQHpEbDXM298ssSQzUc0ksepUBoA3g2y7Wurk8UeANIjQWcTsv2uKK6crDQsZrcu5
	9VOgBCIVzIFpyb9PvE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBR6l-00GMCQ-2k; Wed, 13 Jul 2022 01:24:07 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBR6h-00GMA8-Qe
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 01:24:05 +0000
Received: by mail-yb1-xb36.google.com with SMTP id g4so16913080ybg.9
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 18:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YxOh0nLFFVmYSRH0bGoSLFMwaYMfiAsAxktFavty9+E=;
        b=A/l4VpczNL+qIPVoPAmdw5rmr3hZET1GfjqWyIQyU6QVbLdHkupXiiGeAivJMI5Y2q
         UUED2SFUDX7v6cJBHpLH6mTaw26pLid3XLm4YpAleqf6ybOVqlITCQo0zJoErF59t++V
         Vhf/vlRY1AvKBd7Pkv54IVx2HwmVDaQvyyVLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YxOh0nLFFVmYSRH0bGoSLFMwaYMfiAsAxktFavty9+E=;
        b=OlUcfNnuw74Q9jtST/xJGoQzeLwesY4o+bW/o04Fw3VKLxgbAzbKjZGrwXtI66k0Lg
         VdFamOtl2Juta+SKGAI/PTzIqhFWVx+fhLpfXivzUM1d+bEzVgKQHP4f+mseRvClxljT
         splPxFSuxyMk4Ttq7hEAUUu3M7sdMYjWWhZj5IYaHU99N4vHUzfK5wfmymDCJLQ7O4wC
         zi/Pl0TxFdutq1Ytjc8Vy9JU/KY2GWCHhmvgecgZPDejUQtlamfPLA79GZfgTr/EOywf
         fS73+N0suuzxVrgxqtNpLlAQ37N8nbaHTym59tv7ty9h5Eu5KEhFKEXqyEOWf7cFKMRB
         EBag==
X-Gm-Message-State: AJIora9uxv7FuWQbbhkduDGbOs1GrAyfpKLpU4zG63Q+b4VualLz/FNt
	BBGoE1tbRPKu09jOhLx7eQmi1pfttbdrN3q2hncF
X-Google-Smtp-Source: AGRyM1vEKkssVrNxZ28zlQCEI65AGSBjQ9cE5H7vmQHY8qoVVQohpUQteCrlS9kr714Wr1mcNE3jYQ/qcwwecPy33H0=
X-Received: by 2002:a05:6902:154e:b0:66e:6718:f6f2 with SMTP id
 r14-20020a056902154e00b0066e6718f6f2mr1293389ybu.228.1657675440625; Tue, 12
 Jul 2022 18:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com> <20220707145248.458771-6-apatel@ventanamicro.com>
In-Reply-To: <20220707145248.458771-6-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Jul 2022 18:23:50 -0700
Message-ID: <CAOnJCU+H_inpUj1EuvqEYx41iEguCdcC4B3Lr9TWdo+aFhFNAA@mail.gmail.com>
Subject: Re: [PATCH 5/5] RISC-V: KVM: Add support for Svpbmt inside Guest/VM
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_182403_888429_0E13490F 
X-CRM114-Status: GOOD (  20.48  )
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

On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The Guest/VM can use Svpbmt in VS-stage page tables when allowed by the
> Hypervisor using the henvcfg.PBMTE bit.
>
> We add Svpbmt support for the KVM Guest/VM which can be enabled/disabled
> by the KVM user-space (QEMU/KVMTOOL) using the ISA extension ONE_REG
> interface.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h      | 16 ++++++++++++++++
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 6d85655e7edf..17516afc389a 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -156,6 +156,18 @@
>                                  (_AC(1, UL) << IRQ_S_TIMER) | \
>                                  (_AC(1, UL) << IRQ_S_EXT))
>
> +/* xENVCFG flags */
> +#define ENVCFG_STCE                    (_AC(1, ULL) << 63)
> +#define ENVCFG_PBMTE                   (_AC(1, ULL) << 62)
> +#define ENVCFG_CBZE                    (_AC(1, UL) << 7)
> +#define ENVCFG_CBCFE                   (_AC(1, UL) << 6)
> +#define ENVCFG_CBIE_SHIFT              4
> +#define ENVCFG_CBIE                    (_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
> +#define ENVCFG_CBIE_ILL                        _AC(0x0, UL)
> +#define ENVCFG_CBIE_FLUSH              _AC(0x1, UL)
> +#define ENVCFG_CBIE_INV                        _AC(0x3, UL)
> +#define ENVCFG_FIOM                    _AC(0x1, UL)
> +
>  /* symbolic CSR names: */
>  #define CSR_CYCLE              0xc00
>  #define CSR_TIME               0xc01
> @@ -252,7 +264,9 @@
>  #define CSR_HTIMEDELTA         0x605
>  #define CSR_HCOUNTEREN         0x606
>  #define CSR_HGEIE              0x607
> +#define CSR_HENVCFG            0x60a
>  #define CSR_HTIMEDELTAH                0x615
> +#define CSR_HENVCFGH           0x61a
>  #define CSR_HTVAL              0x643
>  #define CSR_HIP                        0x644
>  #define CSR_HVIP               0x645
> @@ -264,6 +278,8 @@
>  #define CSR_MISA               0x301
>  #define CSR_MIE                        0x304
>  #define CSR_MTVEC              0x305
> +#define CSR_MENVCFG            0x30a
> +#define CSR_MENVCFGH           0x31a
>  #define CSR_MSCRATCH           0x340
>  #define CSR_MEPC               0x341
>  #define CSR_MCAUSE             0x342
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 6119368ba6d5..24b2a6e27698 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_H,
>         KVM_RISCV_ISA_EXT_I,
>         KVM_RISCV_ISA_EXT_M,
> +       KVM_RISCV_ISA_EXT_SVPBMT,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 6dd9cf729614..b7a433c54d0f 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -51,6 +51,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         RISCV_ISA_EXT_h,
>         RISCV_ISA_EXT_i,
>         RISCV_ISA_EXT_m,
> +       RISCV_ISA_EXT_SVPBMT,
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -777,6 +778,19 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>         return -EINVAL;
>  }
>
> +static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
> +{
> +       u64 henvcfg = 0;
> +
> +       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
> +               henvcfg |= ENVCFG_PBMTE;
> +
> +       csr_write(CSR_HENVCFG, henvcfg);
> +#ifdef CONFIG_32BIT
> +       csr_write(CSR_HENVCFGH, henvcfg >> 32);
> +#endif
> +}
> +
>  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  {
>         struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> @@ -791,6 +805,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>         csr_write(CSR_HVIP, csr->hvip);
>         csr_write(CSR_VSATP, csr->vsatp);
>
> +       kvm_riscv_vcpu_update_config(vcpu->arch.isa);
> +
>         kvm_riscv_gstage_update_hgatp(vcpu);
>
>         kvm_riscv_vcpu_timer_restore(vcpu);
> --
> 2.34.1
>

LGTM.


Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
