Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A485C636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 00:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VlrdNEY3Z4mBiO6Vqj+Q9kZ/A0Kjy2cKloO3MeTiVQ=; b=YugMIFyxOAhE2W
	nHVdlz//+/Rpwwm4RDxXJMiWUrSc7xDmCRmq0XpzqJ/FfMq1Jj9Rferp9VyJwgaT0WjL5kuTkxEL4
	jLbCTTEaSI9SEnraEhpxq3PAhBNFARo/QrkCgM3iauxqIGEfgTs9k6mDNXX5mkZpW4fil1MLpCzBl
	YWFz6RZQ/ZXPZ95xQsVMwr12xGTq6ofSVZmISkBImJuAqrMXzpOE9FCoi1Ljcndgwvc+Ycq36wVqf
	MyKOYAe9HQsHT3jVmNsg1IFJOXTlT29k71oEXPw5F8zcb31QcYwAfOlhzd99HiGNpxD1t+VAMN+TZ
	/pe4e7xa+HbdzPqtjdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPXxE-00Dhyn-ST; Wed, 08 Feb 2023 00:04:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPXxA-00Dhxt-PA
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 00:04:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id u9so13162184plf.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 16:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dfEPQhR9+nvRYFuut3HlmHRlPkp8cAR6z45/icvtvuw=;
        b=bY80V9xOPF3ktFiiVHSWnzAiW7EJ+dEDiCHGs3IiSfFYGRXEEuUKNi+EsMjFtPWZ6v
         6ER4zszQSi4bzyZ31Q8wKhOv8RmhRopyjRvd5Q6KwjPUGj13I96N7ZNYSqnIJgcn2n9Y
         WsJA4YpowQfpU6KDhEdlxhItrUUBVdcMfE3Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfEPQhR9+nvRYFuut3HlmHRlPkp8cAR6z45/icvtvuw=;
        b=NCmkX7kuNZ5VdbTX4cFcUUO0ZzQF1E2xDMTA3J2E9cfGGZFdhk9vtFXvblwf1WuGGy
         PC6PIRhG9iE14jj/JNZiKoXFSzqdkuLHpr80fFpGW5euNqXMDokqlCmTgDdQS3tDDIL2
         f/ULaQS2DEsVhQuoLQJBHtaQZx0jhKSKKBRlB/d2Cu9HWMBZizjYFqBT0G0DZwo1lDGh
         Wkhnw8e5CBKWVZNiUF4bT66+5JCRe/S385nl2IOdpyrTBAkhVUqp/ntB0YYhSBAZDdPn
         D4FjjAmDmv5nXnRr28SBVqjYtJ2frT8f5tNVDaKz1i7OdfrCpskzfqEH3c4+tCI0vMl8
         SxfQ==
X-Gm-Message-State: AO0yUKXjxLmEeXml0FmQ+YR2rjfob24JLRkPrOWlSfXvXnhQc6MGMj0n
	apwA10hXj175SQKAFI2T6+TfbNC9mUub/22vvsjT
X-Google-Smtp-Source: AK7set+x2RMP9jPOWJjqB5AuZaFMEzKB81CZ5V6vAu5s3Oc0iy8TPASMirZbhn0c2Wzd3Tp69FACa6p/DaneNwBZ4Mk=
X-Received: by 2002:a17:902:8348:b0:193:794:ba9 with SMTP id
 z8-20020a170902834800b0019307940ba9mr1322433pln.22.1675814687080; Tue, 07 Feb
 2023 16:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-1-apatel@ventanamicro.com> <20230128072737.2995881-6-apatel@ventanamicro.com>
In-Reply-To: <20230128072737.2995881-6-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 7 Feb 2023 16:04:35 -0800
Message-ID: <CAOnJCUKh6s6v0TK=4KRZk9GXN23ebvPuy2OHtWBtTOpnN4g9dg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_160449_107969_E5B5A061 
X-CRM114-Status: GOOD (  26.76  )
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

On Fri, Jan 27, 2023 at 11:28 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We extend the CSR ONE_REG interface to access both general CSRs and
> AIA CSRs. To achieve this, we introduce "subtype" field in the ONE_REG
> id which can be used for grouping registers within a particular "type"
> of ONE_REG registers.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 15 ++++-
>  arch/riscv/kvm/vcpu.c             | 96 ++++++++++++++++++++++++-------
>  2 files changed, 89 insertions(+), 22 deletions(-)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 71992ff1f9dd..d0704eff0121 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -64,7 +64,7 @@ struct kvm_riscv_core {
>  #define KVM_RISCV_MODE_S       1
>  #define KVM_RISCV_MODE_U       0
>
> -/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +/* General CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_csr {
>         unsigned long sstatus;
>         unsigned long sie;
> @@ -78,6 +78,10 @@ struct kvm_riscv_csr {
>         unsigned long scounteren;
>  };
>
> +/* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_aia_csr {
> +};
> +
>  /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_timer {
>         __u64 frequency;
> @@ -105,6 +109,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_SVINVAL,
>         KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>         KVM_RISCV_ISA_EXT_ZICBOM,
> +       KVM_RISCV_ISA_EXT_SSAIA,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> @@ -134,6 +139,8 @@ enum KVM_RISCV_SBI_EXT_ID {
>  /* If you need to interpret the index values, here is the key: */
>  #define KVM_REG_RISCV_TYPE_MASK                0x00000000FF000000
>  #define KVM_REG_RISCV_TYPE_SHIFT       24
> +#define KVM_REG_RISCV_SUBTYPE_MASK     0x0000000000FF0000
> +#define KVM_REG_RISCV_SUBTYPE_SHIFT    16
>
>  /* Config registers are mapped as type 1 */
>  #define KVM_REG_RISCV_CONFIG           (0x01 << KVM_REG_RISCV_TYPE_SHIFT)
> @@ -147,8 +154,12 @@ enum KVM_RISCV_SBI_EXT_ID {
>
>  /* Control and status registers are mapped as type 3 */
>  #define KVM_REG_RISCV_CSR              (0x03 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_CSR_GENERAL      0x0
> +#define KVM_REG_RISCV_CSR_AIA          0x1
>  #define KVM_REG_RISCV_CSR_REG(name)    \
> -               (offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
> +       (offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
> +#define KVM_REG_RISCV_CSR_AIA_REG(name)        \
> +       (offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
>
>  /* Timer registers are mapped as type 4 */
>  #define KVM_REG_RISCV_TIMER            (0x04 << KVM_REG_RISCV_TYPE_SHIFT)
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 3cf50eadc8ce..37933ea20274 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -58,6 +58,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         [KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
>         [KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
>
> +       KVM_ISA_EXT_ARR(SSAIA),
>         KVM_ISA_EXT_ARR(SSTC),
>         KVM_ISA_EXT_ARR(SVINVAL),
>         KVM_ISA_EXT_ARR(SVPBMT),
> @@ -96,6 +97,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>         case KVM_RISCV_ISA_EXT_C:
>         case KVM_RISCV_ISA_EXT_I:
>         case KVM_RISCV_ISA_EXT_M:
> +       case KVM_RISCV_ISA_EXT_SSAIA:
>         case KVM_RISCV_ISA_EXT_SSTC:
>         case KVM_RISCV_ISA_EXT_SVINVAL:
>         case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> @@ -451,30 +453,79 @@ static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
>         return 0;
>  }
>
> +static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
> +                                         unsigned long reg_num,
> +                                         unsigned long *out_val)
> +{
> +       struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +
> +       if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
> +               return -EINVAL;
> +
> +       if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
> +               kvm_riscv_vcpu_flush_interrupts(vcpu);
> +               *out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
> +       } else
> +               *out_val = ((unsigned long *)csr)[reg_num];
> +
> +       return 0;
> +}
> +
>  static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
>                                       const struct kvm_one_reg *reg)
>  {
> -       struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +       int rc;
>         unsigned long __user *uaddr =
>                         (unsigned long __user *)(unsigned long)reg->addr;
>         unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>                                             KVM_REG_SIZE_MASK |
>                                             KVM_REG_RISCV_CSR);
> -       unsigned long reg_val;
> +       unsigned long reg_val, reg_subtype;
>
>         if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
>                 return -EINVAL;
> +
> +       reg_subtype = (reg_num & KVM_REG_RISCV_SUBTYPE_MASK)
> +                       >> KVM_REG_RISCV_SUBTYPE_SHIFT;
> +       reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
> +       switch (reg_subtype) {
> +       case KVM_REG_RISCV_CSR_GENERAL:
> +               rc = kvm_riscv_vcpu_general_get_csr(vcpu, reg_num, &reg_val);
> +               break;
> +       case KVM_REG_RISCV_CSR_AIA:
> +               rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
> +               break;
> +       default:
> +               rc = -EINVAL;
> +               break;
> +       }
> +       if (rc)
> +               return rc;
> +
> +       if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +
> +static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
> +                                                unsigned long reg_num,
> +                                                unsigned long reg_val)
> +{
> +       struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +
>         if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
>                 return -EINVAL;
>
>         if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
> -               kvm_riscv_vcpu_flush_interrupts(vcpu);
> -               reg_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
> -       } else
> -               reg_val = ((unsigned long *)csr)[reg_num];
> +               reg_val &= VSIP_VALID_MASK;
> +               reg_val <<= VSIP_TO_HVIP_SHIFT;
> +       }
>
> -       if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
> -               return -EFAULT;
> +       ((unsigned long *)csr)[reg_num] = reg_val;
> +
> +       if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
> +               WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
>
>         return 0;
>  }
> @@ -482,31 +533,36 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
>  static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
>                                       const struct kvm_one_reg *reg)
>  {
> -       struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +       int rc;
>         unsigned long __user *uaddr =
>                         (unsigned long __user *)(unsigned long)reg->addr;
>         unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>                                             KVM_REG_SIZE_MASK |
>                                             KVM_REG_RISCV_CSR);
> -       unsigned long reg_val;
> +       unsigned long reg_val, reg_subtype;
>
>         if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
>                 return -EINVAL;
> -       if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
> -               return -EINVAL;
>
>         if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
>                 return -EFAULT;
>
> -       if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
> -               reg_val &= VSIP_VALID_MASK;
> -               reg_val <<= VSIP_TO_HVIP_SHIFT;
> +       reg_subtype = (reg_num & KVM_REG_RISCV_SUBTYPE_MASK)
> +                       >> KVM_REG_RISCV_SUBTYPE_SHIFT;
> +       reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
> +       switch (reg_subtype) {
> +       case KVM_REG_RISCV_CSR_GENERAL:
> +               rc = kvm_riscv_vcpu_general_set_csr(vcpu, reg_num, reg_val);
> +               break;
> +       case KVM_REG_RISCV_CSR_AIA:
> +               rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
> +               break;
> +       default:
> +               rc = -EINVAL;
> +               break;
>         }
> -
> -       ((unsigned long *)csr)[reg_num] = reg_val;
> -
> -       if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
> -               WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
> +       if (rc)
> +               return rc;
>
>         return 0;
>  }
> --
> 2.34.1
>

This can be split into two patches. The first patch can just modify
the existing implementation
to parse subtypes for general CSRs. AIA support can be added in the next one.


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
