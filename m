Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF9FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4+odf4MutjTXIFeWnOqWHImCp5GuLw9FTgvrLJZ09w=; b=nvs+RDX+6MpOsP
	AE99Z4mFHy8i48K5CN3Tc6MXskzZYDWDjTe5OiIdzEBP6FoNUmeTzvD4QiXGEU7tXkvGDksFGow6d
	Jn7wkS5v9Lv8BbPJfhaXpcKwG98UzjXtGsmF0RoLUIXABy4e7QhHS6GguRs8mNW9DTUO9DrSHvzWv
	qAiGO1PAnOl8XrjuUvMlVNQKFTCTBD9kj1Hv1b7u80fl93b4n8trKFgtxPYkxxrYB5bgoXWl2AI9M
	79+8aq1li2cu95Y7fMV0l2j+XYxAjJv6bWXahJNbL9XmrxtPaXfh+j6WNTl7OxEKAxEmvoyz0EOLH
	djZXyHdERHjYS6ksxUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlNY-004Sao-9s; Mon, 28 Nov 2022 21:09:28 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlNV-004SZj-AG
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:09:26 +0000
Received: by mail-oi1-x22b.google.com with SMTP id t62so13002530oib.12
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ilVgGC8TOxHzgJU/67Xu5FjqKUjFndYhRBD1pSBbUXQ=;
        b=lMZqt+KmgNbP1xC1+0PEw1zG7OaHp+6QccMIYADd+TiGioedQISw+Bf0QI6CqLDEqu
         nh9IlSILqfeP5yROj2or137eOdwz0TtEf0hKQzW0cHr7UAlBi6eZE5jjT5Ht38Cb0K1s
         MgDKQVhDFeRzba2/3FDM1BmzLnnYbQxqGs2f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilVgGC8TOxHzgJU/67Xu5FjqKUjFndYhRBD1pSBbUXQ=;
        b=ViVDErBUEahzg5uoIJRqCvLMbLQuyk/Wm34Fy7UObj67IQS1Id3sNtWWHJGgSjqbA1
         e8qH2vWdFIpWEF/Gahmjb4OSy2tx3dJYRhdt+IGNRW2kG/ZmGQtBq5Uk8i1+a9A2ZvzV
         pY/LrvhjjiRaVyECwucwNnLTcV9E3XsbrBwUAa5eM415VhOlKZLInR45/mE+U9mgYDrZ
         nPwzGgTjnppAYRMEm4dPD7C0LbKVrIi3dzTgwB9QYNoZGyObUAdd+FHN7SuztUJUvmFB
         tW9gVUFAD8QToNp7FH++FSCLC1YoMyGn26RFMO0sSah2IMki4WhjHRyU84F/DJWmPhZt
         EMRg==
X-Gm-Message-State: ANoB5pm4Zg/mVW/JdPx/oGcTIbTOl08qKOLqGFHqWvvFONcKERrylUVg
	K2KoFKqwPrigEe4kj1pIKvFpFpgBLOFPnSW1P60r
X-Google-Smtp-Source: AA0mqf4VPR4z8hBPap7MOUP+bfI/yUr6Hc/zRJpKRmEImo2WSYflhgiYPEGYjq1l59c2HcOT2pepYwYUt4fDHY55jMk=
X-Received: by 2002:a05:6808:51:b0:359:f091:104 with SMTP id
 v17-20020a056808005100b00359f0910104mr29358704oic.274.1669669764575; Mon, 28
 Nov 2022 13:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-9-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-9-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:09:13 -0800
Message-ID: <CAOnJCULA77d+S37aPuC_kJAi769beasdgsK+WfkZe623SsYEow@mail.gmail.com>
Subject: Re: [PATCH 8/9] RISC-V: KVM: Add ONE_REG interface for mvendorid,
 marchid, and mimpid
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130925_374017_1202885B 
X-CRM114-Status: GOOD (  15.77  )
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

On Mon, Nov 28, 2022 at 8:15 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add ONE_REG interface for VCPU mvendorid, marchid, and mimpid
> so that KVM user-space can change this details to support migration
> across heterogeneous hosts.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  3 +++
>  arch/riscv/kvm/vcpu.c             | 27 +++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 8985ff234c01..92af6f3f057c 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -49,6 +49,9 @@ struct kvm_sregs {
>  struct kvm_riscv_config {
>         unsigned long isa;
>         unsigned long zicbom_block_size;
> +       unsigned long mvendorid;
> +       unsigned long marchid;
> +       unsigned long mimpid;
>  };
>
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 312a8a926867..7c08567097f0 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -276,6 +276,15 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>                         return -EINVAL;
>                 reg_val = riscv_cbom_block_size;
>                 break;
> +       case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> +               reg_val = vcpu->arch.mvendorid;
> +               break;
> +       case KVM_REG_RISCV_CONFIG_REG(marchid):
> +               reg_val = vcpu->arch.marchid;
> +               break;
> +       case KVM_REG_RISCV_CONFIG_REG(mimpid):
> +               reg_val = vcpu->arch.mimpid;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -338,6 +347,24 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>                 break;
>         case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>                 return -EOPNOTSUPP;
> +       case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> +               if (!vcpu->arch.ran_atleast_once)
> +                       vcpu->arch.mvendorid = reg_val;
> +               else
> +                       return -EBUSY;
> +               break;
> +       case KVM_REG_RISCV_CONFIG_REG(marchid):
> +               if (!vcpu->arch.ran_atleast_once)
> +                       vcpu->arch.marchid = reg_val;
> +               else
> +                       return -EBUSY;
> +               break;
> +       case KVM_REG_RISCV_CONFIG_REG(mimpid):
> +               if (!vcpu->arch.ran_atleast_once)
> +                       vcpu->arch.mimpid = reg_val;
> +               else
> +                       return -EBUSY;
> +               break;
>         default:
>                 return -EINVAL;
>         }
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
