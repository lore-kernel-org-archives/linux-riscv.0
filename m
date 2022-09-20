Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66D5C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PiZ5C2zF3fhzlgXRxcNpSAkBaio+8B/KTLIQtl54+ZA=; b=v8y1NeN4ax1l8n
	Pmq75yfqCMLq4boeEW1vi1da2NcN/n7ZRDrE/AUMvYryIZN/wKxTXSbgzsbra0JSupd322nYwDh2a
	j/Vmmg6CXumumglJ8Amtk3COaUqzTPainVHlFE/GQLlPApFQx/YMoIbpSyqQdSQqvHvJd1DpThnr0
	dlbgKrAngdwSEZ05cmb3uGdHo13ducCVcSa68z4rOsf155BOBHqiUeb82DjXVuqtylTM2MVdHxKx2
	Ycegb3IemlRdYhExHy9l5eUD/aoLFqfkaf6+yCyzNwPNXIZrP/vRroOdPHyPDBleMx4PRTP4edVC5
	mgHL5g6cXZoWblFLEBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oahzN-005izb-6H; Tue, 20 Sep 2022 18:28:57 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oahzJ-005ixK-Vt
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:28:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id z25so5290869lfr.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JYYtvIt6iM9mPdTfxCc9AnnwheqgzsbjEn3HbjOUnNA=;
        b=jgnRxfxr4BHiMOCV8HgXfxNKuMHNtv1RyScbBPYEuQbphG1b3Dh9O8nB/uvl+ny680
         F3ExNJdTgF5nE6YGAErR9t9t8dcc8Dq+UG1LSzvJoYHt/5kdRKZ8acPwMqhHYeWH2oBI
         LC/wcy6wv4Q054O6YtDaApEwlOJmjfZm2aYU7rqerI9cMyjbnYM5K2eT+q/JUMV3myQ8
         OQbQoyEatbEJfxLx6pQooAUSDG2SUNSRLpVSaY4cF9FKyYrzEq1SBkfQ90wfY9Z3Ebg9
         ZnlOWuzArpvjg7xjBMPY6oT5HVlaJOUzhnpIsK6NFjZSjeGWdt+yOe9RgSwtmZm2hwCU
         keAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JYYtvIt6iM9mPdTfxCc9AnnwheqgzsbjEn3HbjOUnNA=;
        b=jgEOu9R8exi1rj70YEsJVJrSCrF0dO3hCVc5TuxpV3ejf0AmakUHdQf1SsNU2ro6Bp
         oesPsJMR0ZyZaaa53OQ1yN4TQPjNwOXPhIVFk95N7aaQDK4FoMeWysb8iS2+4/nasHvS
         bcL6sHjs1MvB1G1UjyLUo9MrF1eP6VFFancloaD1wabh9TtWVJGG4QEfElxDT5sVLyHP
         X0NdTEGSHstX/AwF3S+mWgjz8UTJbGyAOK5ikewDVcd+fJFsFY5PorQQPUeLC95fr7LX
         Uzfo5T5RKkooGjAAT14Z5n3JHSb6tSdd3+3k5DWPwoqbTkrnLB58ffQIJJ6TVqF717AS
         PWzA==
X-Gm-Message-State: ACrzQf3bx3HpNbwQVdd9D+VZbq75q20I/e2I//0X6IsnkVXyDKpE2TyW
	2LrViU0bkjPzNcVRG367WI9tgyZ4tYHZNkweBmIUfA==
X-Google-Smtp-Source: AMsMyM7GDObk78jF+nCePzMRdp+C7t8prCuS0BITZApohU4CcLlrxIS95F0F/aRxInsHE47XGpcgQ0nowFgFTne7rjU=
X-Received: by 2002:a05:6512:401f:b0:49e:ea65:cd49 with SMTP id
 br31-20020a056512401f00b0049eea65cd49mr8435164lfb.419.1663698526077; Tue, 20
 Sep 2022 11:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220916054637.24133-1-mchitale@ventanamicro.com>
In-Reply-To: <20220916054637.24133-1-mchitale@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 20 Sep 2022 23:58:34 +0530
Message-ID: <CAK9=C2UhaRo6idT3xXLUx52UHyTeHVfMQczXyYQRPboNxjXiFQ@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: KVM: Allow Guest use Zihintpause extension
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_112854_072638_15FF9D8B 
X-CRM114-Status: GOOD (  15.60  )
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

On Fri, Sep 16, 2022 at 11:17 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> We should advertise Zihintpause ISA extension to KVM user-space whenever
> host supports it. This will allow KVM user-space (i.e. QEMU or KVMTOOL)
> to pass on this information to Guest via ISA string.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

I have queued this patch for 6.1

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b6770ee08872..9085b90cf324 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_SVPBMT,
>         KVM_RISCV_ISA_EXT_SSTC,
>         KVM_RISCV_ISA_EXT_SVINVAL,
> +       KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 901bb5c0cb50..0de0dd22e734 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         RISCV_ISA_EXT_SVPBMT,
>         RISCV_ISA_EXT_SSTC,
>         RISCV_ISA_EXT_SVINVAL,
> +       RISCV_ISA_EXT_ZIHINTPAUSE,
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>         case KVM_RISCV_ISA_EXT_M:
>         case KVM_RISCV_ISA_EXT_SSTC:
>         case KVM_RISCV_ISA_EXT_SVINVAL:
> +       case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>                 return false;
>         default:
>                 break;
> --
> 2.34.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
