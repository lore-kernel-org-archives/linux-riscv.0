Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF34AECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 18:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IOu34H87hyRPbOfouVQLedttnk4B+r/A/pKga6mWpE=; b=QQG/DOZXieNe9h
	nSinQJIvBK4mMojS38wXoVCjgD0N4d/4FjN3uAPnTc5vEj2yVQaGBWnCpIwC+TVp7arFz4uRPXWDx
	DiJ5I5pIYDmLWWtozcQ6BH74F4YEiYnY80/0bR2zkBoyzYodU8fXflN7dYy99hYxZXtmHQarwsF0p
	zS1dPSeJKqfFSEoWnywQKHr/EHEsxP8lK+QwJ3xH+1+fL6A6Hl8JCP8eA+dok6zy32qSsRXEjl4jd
	ezPEmGX80wqH+z29R3UClTXr0/1jsHKlPUMEfDUkpRbzpID/+8jH+/xA16pu3ZPmPpO54b1rj6su7
	xubDWcQC6Ozq9wu0CXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWiwN-001KX2-FU; Fri, 09 Sep 2022 18:41:23 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWiwL-001KVI-5w
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 18:41:22 +0000
Received: by mail-io1-xd2a.google.com with SMTP id d68so2130866iof.11
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 11:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DmeNuQpBHB7aqjM/udksATzePHFCNiKGvkPvOqLhHsQ=;
        b=al9EbWKIw1OiaKoWW7AQpAsAwOXKO1KnPbpv+Z0WOhWzShbzRPFRObWQO3IUT2Bdzk
         Gx3Qgn5E+9s8Z2Z2dSDB9m2LX2LWtQ6r77Z9hzXylcAM1DPDKqVS6IYdekfTnuLzk+8D
         hwzvVLlXgeJv4WP6OJ73FRVELdd2GYpXUV9nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DmeNuQpBHB7aqjM/udksATzePHFCNiKGvkPvOqLhHsQ=;
        b=cdBgrP1RasJfeacmfp0R/3aubcP7Qqnro0ykeKkLarn+XNWK/+qIvc1tD3xgs2R2tp
         O/e5yzxcHxn4Gf0HyKGh8Lwr7F1sN87EuXKCEMTL45Tdbuqe/vahDZhsL0CFSzApLnXN
         78Lav4C1cqE3Okha9oGJuXGgLrOTjX+1erhfNzePPUyJeUoEcFLrCvTyeWHoEF0E0wlM
         C2LsGHMc1Eor0HTJbj8kjXTTequCBlGCgFzH/k7lyXev6Qj0DJ1hu0abUm22yC2jWt6b
         enq36qqw6hwed6uVDMSzDGC/1bOtn8Jwp8KaS7wBHWeGdKdpsheeFaGXoTD3w20GVMKv
         Z0GQ==
X-Gm-Message-State: ACgBeo0hORjTdKvygZaSIDHakaFmuB/tqYCQF6ee6h8ghgbAy0h4ygDU
	IFBt9hEC4PZnMs/MgFaAEMFyBWS5ZHkSpbyFb3mr
X-Google-Smtp-Source: AA6agR6g0bqA/4Wf2B5aiGgDwYNpViulDvPJUULIG3E5AxHzdAqhFBBgK5rf1jcjiyw/clt7ixAXjK0KU6nsa4pAJr0=
X-Received: by 2002:a05:6638:2045:b0:35a:f41:d1a3 with SMTP id
 t5-20020a056638204500b0035a0f41d1a3mr1340643jaj.75.1662748879421; Fri, 09 Sep
 2022 11:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220909144400.1114485-1-ajones@ventanamicro.com> <20220909144400.1114485-2-ajones@ventanamicro.com>
In-Reply-To: <20220909144400.1114485-2-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 Sep 2022 11:41:08 -0700
Message-ID: <CAOnJCULo_5OROypyBaq3chQDf2p4wFfP7kYsWuBz9V=8sy_ABg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Provide UAPI for Zicbom block size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_114121_248353_0CAE13F2 
X-CRM114-Status: GOOD (  21.48  )
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

On Fri, Sep 9, 2022 at 7:44 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> We're about to allow guests to use the Zicbom extension. KVM
> userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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


Reviewed-by: Atish Patra <atishp@rivosinc.com>
--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
