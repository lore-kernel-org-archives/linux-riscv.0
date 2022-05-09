Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7597EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyiqZRkatW+wgaaNjJOhBCHO5Z5bpQtwx41B0oG868g=; b=uFj5ibZJQm0ZQT
	BaGG3a00G+pGYeVIEa4/J+TTDDe+z0XheyPUtJGkIPUipPmRoQMHgCjR1px5YeHN8kbE6tpmccH39
	uGOU6CEHtbeV4edg9zfCjGpjxuOFOWF8R0/hwrkkgeuoExpzIhVfWdua9194dl3FZzax/g1tP7EEy
	JjuzDbEghY+T98oSnvYxMBx6ZFORjzD8HMzodv1Vmh4IZDKxg+ao3BYeaaOGQCiH2GlLmMXk4PIx/
	/HS3Us8d8dts5PsXQAvuU9AIUi1RSZgR2Qq1q+GaDvB+skIN8EnBG7SFtIuHxRJ6ZvsYX2cO2z6xZ
	0/SUeyVhstXmJ3cGJWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnvtv-00CUpm-6B; Mon, 09 May 2022 05:25:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnvtr-00CUmM-R5
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 05:25:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 129so7717792wmz.0
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 22:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C5XQ3hyloMLLLndWdB5WuxNpqTy9IY4sqDd7KReZqGs=;
 b=8RiGiBo+uASe2nrpMeEYKuUlERVz2sxygUTXvTS8ZfE21z62USL/imBvv9O1oDc/KK
 HafKoNK0ndDOWOsrPW2HXF2zZ1Xc4dK+zU6TiAXakwPyB1rEJAIrdpMW9/+V/KZdkGVv
 Nkpcqhmg5TsD7CHqGQukBZ14MgdwAtzWy228sARUW/+86BivOJ/K0oyKdoEdxQEidxjH
 vW095C/5DO/vWVCVodXsGKTPYNKms03cv2Zn+FAVLNSW5qMz9NXxlyliStrX81KD0p9n
 /XmWLZ5tHOrfEdD/ro+T6jQ21AoX6Wz8O8zwnxgJJ5nGyZiU0K9YHc/kWVeTK8XidRKh
 u6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C5XQ3hyloMLLLndWdB5WuxNpqTy9IY4sqDd7KReZqGs=;
 b=s7mo10LEynRxVuvPrxZkQLEJJKqNre8F3p5kT+5Nm1VCktS/5MFBQNaDhzgZATEeIh
 hWmbG9BqAkAU/2mZfxaDPd/ScM2BLWLASO3LwgLkhyykKefL1o0JrhYvljs2baAm/nP2
 sypYxMMHiUiYwuqZHHfW14NH/3xYQseVUpp8aU7RHVEfE62WFkV4PVFrNCP8Qe7vjPa3
 TXS4bUVcqE2PJ9JFOsi8L1u2t7sJIO+gRF9FSlv3lp0/lGUUFgGRYSTedeuJLn6DAw0F
 kez42PQFpxbdrDXqx0BjKpVMXvOEd5U1nToBqg9Mp6Wv7c/qQoET3RcyGaX2kYe2/ep2
 whdA==
X-Gm-Message-State: AOAM531VYXnAi0E2z5yJf1jByj/lqO7SwtGkZwIkx+OZnDKdM/scHCu0
 JMhVqvYU8a/Kx9WqFMx7RI9h3OlwhZfAjDrBCdbLqp2tOPJE2w==
X-Google-Smtp-Source: ABdhPJxHSZExdSWviiroriTDm831/Jlr/IS7vqQiuq680DL3bLAGu7DJ3UApThrZkmb5ekR7dSqjOv0IKm/PinsyNQE=
X-Received: by 2002:a05:600c:4fd5:b0:394:55ae:32c7 with SMTP id
 o21-20020a05600c4fd500b0039455ae32c7mr20935325wmq.73.1652073937743; Sun, 08
 May 2022 22:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220422150519.3818093-1-atishp@rivosinc.com>
In-Reply-To: <20220422150519.3818093-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 10:55:26 +0530
Message-ID: <CAAhSdy0QW7o9f0_Nqx7KwHtn2Kh4Z-zURZQ2qt--L7Dc8cYnTg@mail.gmail.com>
Subject: Re: [v2 PATCH] RISC-V: KVM: Introduce ISA extension register
To: Atish Patra <atishp@rivosinc.com>
Cc: KVM General <kvm@vger.kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_222539_931417_485369D3 
X-CRM114-Status: GOOD (  36.51  )
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

On Fri, Apr 22, 2022 at 8:38 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently, there is no provision for vmm (qemu-kvm or kvmtool) to
> query about multiple-letter ISA extensions. The config register
> is only used for base single letter ISA extensions.
>
> A new ISA extension register is added that will allow the vmm
> to query about any ISA extension one at a time. It is enabled for
> both single letter or multi-letter ISA extensions. The ISA extension
> register is useful to if the vmm requires to retrieve/set single
> extension while the config register should be used if all the base
> ISA extension required to retrieve or set.
>
> For any multi-letter ISA extensions, the new register interface
> must be used.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Changes from v1->v2:
> 1. Sending the patch separate from sstc series as it is unrelated.
> 2. Removed few redundant lines.
>
> The kvm tool patches can be found here.
>
> https://github.com/atishp04/kvmtool/tree/sstc_v2
>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 20 +++++++
>  arch/riscv/kvm/vcpu.c             | 98 +++++++++++++++++++++++++++++++
>  2 files changed, 118 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index f808ad1ce500..92bd469e2ba6 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -82,6 +82,23 @@ struct kvm_riscv_timer {
>         __u64 state;
>  };
>
> +/**
> + * ISA extension IDs specific to KVM. This is not the same as the host ISA
> + * extension IDs as that is internal to the host and should not be exposed
> + * to the guest. This should always be contiguous to keep the mapping simple
> + * in KVM implementation.
> + */
> +enum KVM_RISCV_ISA_EXT_ID {
> +       KVM_RISCV_ISA_EXT_A = 0,
> +       KVM_RISCV_ISA_EXT_C,
> +       KVM_RISCV_ISA_EXT_D,
> +       KVM_RISCV_ISA_EXT_F,
> +       KVM_RISCV_ISA_EXT_H,
> +       KVM_RISCV_ISA_EXT_I,
> +       KVM_RISCV_ISA_EXT_M,
> +       KVM_RISCV_ISA_EXT_MAX,
> +};
> +
>  /* Possible states for kvm_riscv_timer */
>  #define KVM_RISCV_TIMER_STATE_OFF      0
>  #define KVM_RISCV_TIMER_STATE_ON       1
> @@ -123,6 +140,9 @@ struct kvm_riscv_timer {
>  #define KVM_REG_RISCV_FP_D_REG(name)   \
>                 (offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
>
> +/* ISA Extension registers are mapped as type 7 */
> +#define KVM_REG_RISCV_ISA_EXT          (0x07 << KVM_REG_RISCV_TYPE_SHIFT)
> +
>  #endif
>
>  #endif /* __LINUX_KVM_RISCV_H */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index aad430668bb4..93492eb292fd 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -365,6 +365,100 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
>         return 0;
>  }
>
> +/* Mapping between KVM ISA Extension ID & Host ISA extension ID */
> +static unsigned long kvm_isa_ext_arr[] = {
> +       RISCV_ISA_EXT_a,
> +       RISCV_ISA_EXT_c,
> +       RISCV_ISA_EXT_d,
> +       RISCV_ISA_EXT_f,
> +       RISCV_ISA_EXT_h,
> +       RISCV_ISA_EXT_i,
> +       RISCV_ISA_EXT_m,
> +};
> +
> +static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
> +                                         const struct kvm_one_reg *reg)
> +{
> +       unsigned long __user *uaddr =
> +                       (unsigned long __user *)(unsigned long)reg->addr;
> +       unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> +                                           KVM_REG_SIZE_MASK |
> +                                           KVM_REG_RISCV_ISA_EXT);
> +       unsigned long reg_val = 0;
> +       unsigned long host_isa_ext;
> +
> +       if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
> +               return -EINVAL;
> +
> +       if (reg_num >= KVM_RISCV_ISA_EXT_MAX || reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
> +               return -EINVAL;
> +
> +       host_isa_ext = kvm_isa_ext_arr[reg_num];
> +       if (__riscv_isa_extension_available(NULL, host_isa_ext))

This should be "__riscv_isa_extension_available(vcpu->arch.isa, host_isa_ext)".

> +               reg_val = 1; /* Mark the given extension as available */
> +
> +       if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +
> +static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
> +                                         const struct kvm_one_reg *reg)
> +{
> +       unsigned long __user *uaddr =
> +                       (unsigned long __user *)(unsigned long)reg->addr;
> +       unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> +                                           KVM_REG_SIZE_MASK |
> +                                           KVM_REG_RISCV_ISA_EXT);
> +       unsigned long reg_val;
> +       unsigned long host_isa_ext;
> +       unsigned long host_isa_ext_mask;
> +
> +       if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
> +               return -EINVAL;
> +
> +       if (reg_num >= KVM_RISCV_ISA_EXT_MAX || reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
> +               return -EINVAL;
> +
> +       if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
> +               return -EFAULT;
> +
> +       host_isa_ext = kvm_isa_ext_arr[reg_num];
> +       if (!__riscv_isa_extension_available(NULL, host_isa_ext))
> +               return  -EOPNOTSUPP;
> +
> +       if (host_isa_ext >= RISCV_ISA_EXT_BASE &&
> +           host_isa_ext < RISCV_ISA_EXT_MAX) {
> +               /** Multi-letter ISA extension. Currently there is no provision
> +                * to enable/disable the multi-letter ISA extensions for guests.
> +                * Return success if the request is to enable any ISA extension
> +                * that is available in the hardware.
> +                * Return -EOPNOTSUPP otherwise.
> +                */

Use double-winged comment-block for multi-line comments.

> +               if (!reg_val)
> +                       return -EOPNOTSUPP;
> +               else
> +                       return 0;
> +       }
> +
> +       /* Single letter base ISA extension */
> +       if (!vcpu->arch.ran_atleast_once) {
> +               host_isa_ext_mask = BIT_MASK(host_isa_ext);
> +               if (!reg_val && (host_isa_ext_mask & KVM_RISCV_ISA_DISABLE_ALLOWED))
> +                       vcpu->arch.isa &= ~host_isa_ext_mask;
> +               else
> +                       vcpu->arch.isa |= host_isa_ext_mask;
> +               vcpu->arch.isa &= riscv_isa_extension_base(NULL);
> +               vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
> +               kvm_riscv_vcpu_fp_reset(vcpu);
> +       } else {
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
>  static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>                                   const struct kvm_one_reg *reg)
>  {
> @@ -382,6 +476,8 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>         else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
>                 return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_D);
> +       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
> +               return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
>
>         return -EINVAL;
>  }
> @@ -403,6 +499,8 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
>         else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
>                 return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_D);
> +       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
> +               return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
>
>         return -EINVAL;
>  }
> --
> 2.25.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
