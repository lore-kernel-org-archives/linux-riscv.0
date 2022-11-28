Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8B5C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNy4VeGBSvCmMkQFg35XCzCSy5cUW3JuRTIp3rnuD/4=; b=lqzOV5Pch7nHh9
	BcgEAvKZ8ZR23EJbkRmZRPR0Prc5s16g9JmJjQZoiJSQx2nb4fqsgR+LM+r0QtVG2nm3GJ1u6oz1C
	+t+Fkut57amcwSm4AMQAUcJ+q0ZrlPYvgkLUvzYfp/uW/28CPhUyJKTNx+N7LZWjRuHYKg0bna6t+
	Ump+6UFIzRBfBsvFGV6EyGJOPj1DUB4YnWLs72UEGzUCwXwl6Ivra3qQE734BKnjRDLqE9eMLSWDd
	HDlIHWoz+VwB6D2pFC824qWChP0HL/6QjONWGajydwr4xzZHrFCx3G/EjdTaIpPvj6OdNpel0OaFU
	UNZHv2J30wGamaBhiplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlJA-004R0A-GR; Mon, 28 Nov 2022 21:04:56 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlJ7-004QyN-Q9
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:04:55 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id v7-20020a4aa507000000b00496e843fdfeso1844184ook.7
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRGZCzUJ0ffhia8X2kGoAwEvcGD3EwbjnSNO0K2/wNw=;
        b=EhD2l7i+4krHkkf9vXvO2XsUcD5IiujCezypdNr4fvjW3w70qr5E41O4r2ZyXRmXjX
         p2HI+fJuTvI6Df3He52fE/lU7Dze89xJ1KoZPBtv/zmd2NwCZbj6MT+RAYsDKrxYWBfz
         FiEBLvVukJYZpWpxIjqmBORfCsfBEET/jcuTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRGZCzUJ0ffhia8X2kGoAwEvcGD3EwbjnSNO0K2/wNw=;
        b=kuK8m9iXBeyHl2OeypHKhpWyp3UbhY8qs6nvCNrbgOB8MWoTjMiv8Pp3gHkDEMpi1s
         2pnz9Wx+ggsmALwPRYxxjjywjgLlAA8dnemL+fyKRTrx80LVcKWxYvyq/uC41tDX0fFc
         gkWPNmX+3ZZFqpjxHk6qpaFPcejJ5oW9I4bJ0gwG9quAOTSgfslnZbGl+m5VnDK7A1yu
         gOB0GFt/YozFlfhE/5ZpBZYaRLgQVAbkLSI548RtIXPTv+nbpFd6ogUVhtWUtp6LGJ6V
         5OOfRS1n6FrmYzVlR6PwXf5huxvVx6jSVGuuHqDOJQGyDbVU1Oab85JigG4ubibLHFRR
         0/yw==
X-Gm-Message-State: ANoB5plnKOTw0T0Q2kYDenPjYqEJFDj7u7sz9JUx1jJVr426wnkGQrMC
	NBhaG1L/l4MCZXIo92oBNfuGT7peF5cB6VWo9Z/8
X-Google-Smtp-Source: AA0mqf5+31JnISbgZecc7GnG0/XpncjmVgCp7OXM0CWoMRMxsX14BRJcn81qDRI9NepRLIRfMzvOi8k7RRpSLWuz2hI=
X-Received: by 2002:a4a:c58a:0:b0:49f:4297:5612 with SMTP id
 x10-20020a4ac58a000000b0049f42975612mr15036822oop.13.1669669492686; Mon, 28
 Nov 2022 13:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-5-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-5-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:04:42 -0800
Message-ID: <CAOnJCULajHen9us+AePGKarM1xSXp0wVBXyz7ySQyZz9YQvFaQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130453_877196_C935FFED 
X-CRM114-Status: GOOD (  13.79  )
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

On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should use switch-case in kvm_riscv_vcpu_set/get_reg() functions
> because the else-if ladder is quite big now.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 982a3f5e7130..68c86f632d37 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -544,22 +544,26 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
>  static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>                                   const struct kvm_one_reg *reg)
>  {
> -       if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG)
> +       switch (reg->id & KVM_REG_RISCV_TYPE_MASK) {
> +       case KVM_REG_RISCV_CONFIG:
>                 return kvm_riscv_vcpu_set_reg_config(vcpu, reg);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE)
> +       case KVM_REG_RISCV_CORE:
>                 return kvm_riscv_vcpu_set_reg_core(vcpu, reg);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR)
> +       case KVM_REG_RISCV_CSR:
>                 return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
> +       case KVM_REG_RISCV_TIMER:
>                 return kvm_riscv_vcpu_set_reg_timer(vcpu, reg);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
> +       case KVM_REG_RISCV_FP_F:
>                 return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_F);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
> +       case KVM_REG_RISCV_FP_D:
>                 return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_D);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
> +       case KVM_REG_RISCV_ISA_EXT:
>                 return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
> +       default:
> +               break;
> +       }
>
>         return -EINVAL;
>  }
> @@ -567,22 +571,26 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>  static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
>                                   const struct kvm_one_reg *reg)
>  {
> -       if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG)
> +       switch (reg->id & KVM_REG_RISCV_TYPE_MASK) {
> +       case KVM_REG_RISCV_CONFIG:
>                 return kvm_riscv_vcpu_get_reg_config(vcpu, reg);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE)
> +       case KVM_REG_RISCV_CORE:
>                 return kvm_riscv_vcpu_get_reg_core(vcpu, reg);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR)
> +       case KVM_REG_RISCV_CSR:
>                 return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
> +       case KVM_REG_RISCV_TIMER:
>                 return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
> +       case KVM_REG_RISCV_FP_F:
>                 return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_F);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
> +       case KVM_REG_RISCV_FP_D:
>                 return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
>                                                  KVM_REG_RISCV_FP_D);
> -       else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
> +       case KVM_REG_RISCV_ISA_EXT:
>                 return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
> +       default:
> +               break;
> +       }
>
>         return -EINVAL;
>  }
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
