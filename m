Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76660C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8z82B+uSZ+5zLcoJfP/0VIgKEfxAEJQMyZCSb42RzKs=; b=ADMZcz6WfbBu+a
	xV+Ns1DcUCH8NJT3YamV3eXvcXw5GLGErXepH38epNqPhpGWmeGh0jd3xn0yzoQHO5q8xVXJFzYV4
	j2HKBqRsKcq8FYcHV/JIQhPP5ZApOyVnydZLiH6eFr3pRqa0OANPvA3/ezCnHvzBPVsHh5RyEVcTC
	mSaUbmwulJIownJkzhqtH2xlik2vgYkHF7pb3rBLIa1bay5McawEVflkbsd2bZSKfR59uz5NcpRA5
	18LZJUHuLLVujJxkfE5C7dbUVaSsIC4OKJpnYyhtU+x3mQsxhQfsYRvR3BWkLd2te6xj6C7FMMK+l
	MVCB1l5z1lkub70xv6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noRL4-002dSx-P5; Tue, 10 May 2022 14:59:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noRL1-002dPl-PD
 for linux-riscv@lists.infradead.org; Tue, 10 May 2022 14:59:49 +0000
Received: by mail-wr1-x429.google.com with SMTP id q23so24203387wra.1
 for <linux-riscv@lists.infradead.org>; Tue, 10 May 2022 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zy0q38hbFw40Sq+7rWYl2W9NS/43Or3wh3FVtf7AHik=;
 b=S7+1zDRFW9/cYqjSR86okpMRKuCC9XcU9HyEOVI2BNsXl7oefcfTrVKEbAWFqr+Mxf
 uptJofTLpL7TCXt2VTkiLvhC59q8UuYlZ/SQmybkiebb25kRPy3K42CfmG6Dn2xP/XVp
 zsIHlsh2XX4D8GAuzGm5ewiMIjo/jbwBQZee+jMVNFMguCTD5YB4LjOmvfkFQCPueuur
 v7QbxpiaShFDgfuJ04VrJLN+X3oIb8FWX3x6vp8YsA+W0IyrLkQ53iEVUx3zdArjlrCN
 ym004kK0GwDJ5ijF4+rbYGtoQoCAq9b49sXBvyAk6/tVVqa9yglkYfhec6+XixvAM4dp
 bXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zy0q38hbFw40Sq+7rWYl2W9NS/43Or3wh3FVtf7AHik=;
 b=jM0VELOvWDHF3RdWtF/gT6IdhxBx4tCXRhfn5ZH64OPt1AjFt78/oC8zwdxtUTqgiw
 pBwZmOQXh1fvbHybO6JiMbcwDd9rDrQkR0Tgy/6+eAmaEy7WEQVPvmUpyV+9ed9ZvbUv
 oDvVdu+laNpBm9xZwrtpjJSr9fdI2H1u/QkhLEi+BPAaQsMmVHN/3g6nOiHXcCpeZnrY
 AMAk/IkwRKtAZ7aMRPc7n4yVXK48ktDKScBZ6nbqJ2dQXMyT5TjdBhuvcv4RY5mZ/Ore
 oeXEuPrAcK43VZQt7g5dNqTIkvpBVjNHuj4lhGpGS+kkZosNjbJGZQY/m+8J6lWDuO9t
 E1bg==
X-Gm-Message-State: AOAM531+G40iuWwImRsqX/KHSlnLgEGDRCFquZglg5VJtfNsdWr0slb0
 fb/WkS+FYDcIoe6YWGY3BqyLx4b3+wBs5nLqtKzreQ==
X-Google-Smtp-Source: ABdhPJxHPqfxlchHk0nGnhVo680p7h7XyQI3klCSyMtzbYEBsnoUT4wc0KaakcWziqG3NNDNjTaL7+t8y7Y52+3TGhI=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr19048585wrz.690.1652194782989; Tue, 10
 May 2022 07:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220509182937.1881849-1-atishp@rivosinc.com>
In-Reply-To: <20220509182937.1881849-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 May 2022 20:29:31 +0530
Message-ID: <CAAhSdy2V20HEftXz04mOv40HV3pcyn+mAgwM7HRuDfQ+a7FGHA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Introduce ISA extension register
To: Atish Patra <atishp@rivosinc.com>
Cc: KVM General <kvm@vger.kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_075947_847662_E11D3061 
X-CRM114-Status: GOOD (  35.87  )
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

On Mon, May 9, 2022 at 11:59 PM Atish Patra <atishp@rivosinc.com> wrote:
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

Looks good to me.

Queued this patch for 5.19

Thanks,
Anup

> ---
> Changes from v2->v3:
> 1. Fixed the comment style.
> 2. Fixed the kvm_riscv_vcpu_get_reg_isa_ext function.
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 20 +++++++
>  arch/riscv/kvm/vcpu.c             | 99 +++++++++++++++++++++++++++++++
>  2 files changed, 119 insertions(+)
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
> index 7461f964d20a..0875beaa1973 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -365,6 +365,101 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
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
> +       if (__riscv_isa_extension_available(&vcpu->arch.isa, host_isa_ext))
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
> +               /*
> +                * Multi-letter ISA extension. Currently there is no provision
> +                * to enable/disable the multi-letter ISA extensions for guests.
> +                * Return success if the request is to enable any ISA extension
> +                * that is available in the hardware.
> +                * Return -EOPNOTSUPP otherwise.
> +                */
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
> @@ -382,6 +477,8 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>         else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
>                 return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_D);
> +       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
> +               return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
>
>         return -EINVAL;
>  }
> @@ -403,6 +500,8 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
>         else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
>                 return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_D);
> +       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
> +               return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
>
>         return -EINVAL;
>  }
> --
> 2.36.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
