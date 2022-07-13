Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1D0C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 01:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTZ+xzcH9zukyqKKNyz2IjdiztBFVlcRx7zcf2/GTks=; b=3BM0UC5f89NlCS
	cWUtHZzxHgzAqq8MGalcs0RaUeD58FV7NdV1FjZ7Z0ZvBRhO6830RXcx3mRdxB1OuOudaVVwC+u6d
	UL0YHv27f7+aGdmgvpZZjj7cPpqcgnzxcR8zX8fXwEEhMHc0G4ZtN1DsRTVlJ1Xe+M3Jd37X0F+ym
	2v+hJMPPav1ZrFMSkAAtqoGFGIo5U73I1Z3Blkmx/xgUwoMpp2JUMAqWplQhpy2AW+1leKeje7c+4
	88zJRNFR2Q8r9WKf2I35H3L98zKDO/W8Ryh7JFRtXaoP3FVkny3EmCn4EL+nsxXOt61KeyPxK820h
	mF7kKCk2nJUBnYogH2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBR9v-00GNg6-9m; Wed, 13 Jul 2022 01:27:23 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBR9s-00GNcM-Pk
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 01:27:22 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31c8a1e9e33so98683067b3.5
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 18:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O6Fb5kdDCzIcZYHFeEW4xnlDCtrbfEUSZ89mCxSxM4U=;
        b=U7GU/80S5PF/Y/UFmAd5On+6dzTOUoAJ+UPgxPkS2vWeSk+UJ8PEesF+HiLc02npVF
         jXmyfWerXMCr8I6rUSP8X1NPzqubVYyA8R7YkPPabltR4+u0u5ufT1RBOqROeGeslukO
         s2PLDi38lkq8jacaFoFoLKljF4Ml72MUo3us8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O6Fb5kdDCzIcZYHFeEW4xnlDCtrbfEUSZ89mCxSxM4U=;
        b=ky12XJv4WiiGjNvHFqL8FEtnaD64JKvSUXmTLA+2m0Q93yTsGV0b2e3n40rMAn2Bfg
         Tx4yykLQv/OO4nI3ibW2pYhErGztPSdkloi0uSPk6WsiFm+Um24CwvDPC8UyjGrggkIK
         6PR/BsgHkKRosMkOJ1lvCDq5kOV3aLv/dPMIIiFnfrKl3RPX0XlsfZGYFAhzv8PwH1a6
         0vgGdt10Zz7AcVPKlK0c9CZDXTyEw/e2SKi0947EJcAv+8MLzM1l/bMA4YkDrESYRYmo
         jXNUToRNQkpPY1TEdizgIG3u5uaXiDjaWkUFrwMb7mVCiHfG9Q1X+pJI8oW3DDMGEohT
         KlDQ==
X-Gm-Message-State: AJIora/YognicGK30/XInCrzcOzeE6KLPaYvlc5TtDqGyGT3W27L/mQW
	ed53mj7RaweyY001vZiD0eXCO2jul4TYMzRFPSNv
X-Google-Smtp-Source: AGRyM1uY97y6sOBUOBIPOpMq1dZTliITUmcqgV6XmN+IV0YaY1ZeSiYUFRGg10w5SJ7xtz9TGki4LlEsS+A0cypUS6Q=
X-Received: by 2002:a81:134c:0:b0:31c:bd8c:eeb1 with SMTP id
 73-20020a81134c000000b0031cbd8ceeb1mr1471755ywt.274.1657675638935; Tue, 12
 Jul 2022 18:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com> <20220707145248.458771-2-apatel@ventanamicro.com>
In-Reply-To: <20220707145248.458771-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Jul 2022 18:27:08 -0700
Message-ID: <CAOnJCUKNaNz0iF5dfS9quRyDS_ZD1adWWAFjOnBPwqKEefpS8Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_182720_882551_3E9DDCF3 
X-CRM114-Status: GOOD (  18.62  )
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
> The kvm_mmu_topup_memory_cache() always uses GFP_KERNEL_ACCOUNT for
> memory allocation which prevents it's use in atomic context. To address
> this limitation of kvm_mmu_topup_memory_cache(), we add gfp_custom flag
> in struct kvm_mmu_memory_cache. When the gfp_custom flag is set to some
> GFP_xyz flags, the kvm_mmu_topup_memory_cache() will use that instead of
> GFP_KERNEL_ACCOUNT.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/linux/kvm_types.h | 1 +
>  virt/kvm/kvm_main.c       | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
> index ac1ebb37a0ff..1dcfba68076a 100644
> --- a/include/linux/kvm_types.h
> +++ b/include/linux/kvm_types.h
> @@ -87,6 +87,7 @@ struct gfn_to_pfn_cache {
>  struct kvm_mmu_memory_cache {
>         int nobjs;
>         gfp_t gfp_zero;
> +       gfp_t gfp_custom;
>         struct kmem_cache *kmem_cache;
>         void *objects[KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE];
>  };
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index a49df8988cd6..e3a6f7647474 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -386,7 +386,9 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
>         if (mc->nobjs >= min)
>                 return 0;
>         while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
> -               obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
> +               obj = mmu_memory_cache_alloc_obj(mc, (mc->gfp_custom) ?
> +                                                mc->gfp_custom :
> +                                                GFP_KERNEL_ACCOUNT);
>                 if (!obj)
>                         return mc->nobjs >= min ? 0 : -ENOMEM;
>                 mc->objects[mc->nobjs++] = obj;
> --
> 2.34.1
>

Acked-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
