Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E12DC6FA86
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WivNRpkoi3tx7R1mvh+eXb8a6armonZGsYylwifpaC4=; b=b4WSiaDMEJhUDi
	tJf0/21p7bKP+SFo4wJku0JiFVbypYMPjZTTJAyjoZewFyc4WxyctMSCMJEACkm7oMG77emwbE1OM
	9ObNipafMdncEZRqiKbqq21vd1wo+QV7G1DSwSOaTwo/htBcdRQwJPZMOkU3YoGgniXYYtDXwNEsZ
	vQtVk5m6ibOHT3PP8mZcYHa8SNtySxIIkFx8K7tK2pIYILpixvaaWOVb/LEuyt4ZmKFZoRy9dAuV0
	hsn1pU3+Ye2ocByxvZtfZY9kxOu39OIG1hNi1gWsBvDJFb1Thlvs2T+xnZRRJ9DSMNy8zJmzbgxAz
	ixI8oC0bFTKyOvS33w8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocky5-003v5k-TM; Mon, 26 Sep 2022 10:04:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockxx-003v0j-Uo
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 10:04:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id dv25so12876769ejb.12
        for <linux-riscv@lists.infradead.org>; Mon, 26 Sep 2022 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o06StNo2M9WrT0ODsKpRjdc9TAWBj1w8fFxxf0cgmk0=;
        b=kQTOv4rO/G5uqsauY2EStfgJbhS6rIV+3BXfEMrjXF7QqzSvkQrnE1/u3KQibG2Bda
         H4tZd8EqayJEVh2SSZzFLxZS548XVeeVO3BN0hY+3ubqBfQ5FzOPF27LXAeI32qN6NFz
         J3hHQnukf3fKqhtVkNv4iedFgOGu2y8NxKAClgVQxDeoHj0PRj8be3aRRCWdYcnT/T+8
         kKzJRw4YWIYUkK9DgDp1RomQx9PPqH44WdzpPC1L/pXaWHT968uTYbzKvvOsyrrAbh9U
         TseEkOzRKdYDL9UOsxHjlSZCqM3MdySZZDVg4mDkbnpE/3wSJGtVB6OteYL26CtZ0syu
         VoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o06StNo2M9WrT0ODsKpRjdc9TAWBj1w8fFxxf0cgmk0=;
        b=aGYotr+/Ffo9WZD7A2WzgL2BNxv+q1pbSCnRm8DeWxI0xv2SuP+T7KixmA6RCc7O8F
         zcjhwgKueFzB4LuH4q/dcgJXibMj3fDo7sYtj2DzqLV9KW39w/OPajxtwmopSbtfcwW/
         1jD9m0iqcrats/xDoM8Qwnlqv55RcsY/jb2IFneesdSNeJDeySFCY7A9fuJiWcNt0PMN
         MEaVPpT3HSLNoatr0Sof3MukjqMRUvGZsYmFQey9HFoiZFLZjbblhiMnZzA7bnG5woh0
         D21jqj1Xfpexjf84jws37qGGlmoSpkHWyJPcRbqRGHWnb+s6EbF5FZnS9AVgTc1BQ8Oj
         /XDQ==
X-Gm-Message-State: ACrzQf1P2Xr09GwBudtQjquCmoINVN8RGsue1hzMil2DkEobO4jyPrTU
	gbR/kl2T1qfJETeTWhT+qEbjfb3OHUXgY90TFtoSZg==
X-Google-Smtp-Source: AMsMyM7rK+A36TW17UrNs7E0XR7XwVA38SMVO+5zBqTOVkBRkE7RQ9JfWrLIqlsnd+aIy+gIvjbOlTV3VSHGe7gYDvM=
X-Received: by 2002:a17:907:7d8d:b0:781:fd6b:4545 with SMTP id
 oz13-20020a1709077d8d00b00781fd6b4545mr18076864ejc.117.1664186633965; Mon, 26
 Sep 2022 03:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220909144400.1114485-1-ajones@ventanamicro.com> <20220909144400.1114485-2-ajones@ventanamicro.com>
In-Reply-To: <20220909144400.1114485-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Sep 2022 15:33:40 +0530
Message-ID: <CAAhSdy3vx2KR+8HHhx0_J+jycd2ABF7qmDwXb3GrCHWkO76WQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Provide UAPI for Zicbom block size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_030358_039842_6314782C 
X-CRM114-Status: GOOD (  21.75  )
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

On Fri, Sep 9, 2022 at 8:14 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> We're about to allow guests to use the Zicbom extension. KVM
> userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Rebased and queued this patch for Linux-6.1

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 8 ++++++++
>  arch/riscv/mm/cacheflush.c        | 1 +
>  3 files changed, 10 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 7351417afd62..b9a4cf36be4b 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -48,6 +48,7 @@ struct kvm_sregs {
>  /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_config {
>         unsigned long isa;
> +       unsigned long zicbom_block_size;
>  };
>
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index d0f08d5b4282..2ef33d5d94d1 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -18,6 +18,7 @@
>  #include <linux/fs.h>
>  #include <linux/kvm_host.h>
>  #include <asm/csr.h>
> +#include <asm/cacheflush.h>
>  #include <asm/hwcap.h>
>
>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> @@ -254,6 +255,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>         case KVM_REG_RISCV_CONFIG_REG(isa):
>                 reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
>                 break;
> +       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> +               if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
> +                       return -EINVAL;
> +               reg_val = riscv_cbom_block_size;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -311,6 +317,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>                         return -EOPNOTSUPP;
>                 }
>                 break;
> +       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> +               return -EOPNOTSUPP;
>         default:
>                 return -EINVAL;
>         }
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index e5b087be1577..f318b2553612 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -90,6 +90,7 @@ void flush_icache_pte(pte_t pte)
>  #endif /* CONFIG_MMU */
>
>  unsigned int riscv_cbom_block_size;
> +EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
>
>  #ifdef CONFIG_RISCV_ISA_ZICBOM
>  void riscv_init_cbom_blocksize(void)
> --
> 2.37.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
