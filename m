Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C42C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFBgYPzlKMgFCed3pNNYcMJ0ZyjSx05YkXxZkpdbinQ=; b=3Zh+qG+4gMXahR
	7KgeNbaPBHeerg665igNBvh41JKF6RkplJvbGvLX//fV/b3lCWBSDB5jC0rS7IelDrVCpei6i1SGo
	v37DLYu7L8blTMSpaDq7ieNggRI1+MWzw3AABEkpkZhLj+LPF0965UogYmXXBgKniZf2QNBxAICmS
	/N9Ss9WvtAfhmrk0J8nISp++X8AsStClI5fASq2uzugM7SrpJF0ZUjop2mT7LiSO1vHd0rBZEcpAI
	DmxyqVGfCqH8dlmEbTsjCzID/oQvyRzs1y1UIS8kUxWr+YPMDOFc3gwmz1ZRa55SmxS2FyVCeyi5V
	W4b2MOSlphQfYgS5p6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh4zo-007qTF-MX; Wed, 20 Apr 2022 07:43:28 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4zS-007qH8-QF
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 07:43:10 +0000
Received: by mail-yb1-xb31.google.com with SMTP id x200so1332465ybe.13
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cic/lmVeICvTPM3bIFzSlnqztIyS7Y2EoW5ARigCG0A=;
 b=s/ciJ8lMhG4LLgARFOfSM8q0G/vnREGeJ2tEuGmZ6Qz1x6PcfJ3F9bjpoNTp9q28S8
 /N8Md10+1Hw3XlKP2UFVKbmaXKPUg4UCnMfyyxtO1ZXXiF/dOrIzNxuHB4aYG+JWXRTl
 aIXcM0vNX7r4oypff+hHWhIS+iEa26RDMZyQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cic/lmVeICvTPM3bIFzSlnqztIyS7Y2EoW5ARigCG0A=;
 b=s3cfc/SGJ6bGb632fGWvk78HeA9H9PiRRgKOKmZDjHLz659vIEf9fD6BGVdi6YgABG
 8z8w+5GrnSPyIAXj8cNkUr1X5iZGE/sbtq5x1rYNIGgIY1BoEtIHPxILphFLdblaFRlO
 mk51BTR4P492d4e4FKkg44ETixsbXKlado+GMOJGYnLQKoXSrmFwRadHtyQV77T+04mz
 4cClDYMz4dTHrKDUvZZJUAtmvj0llyR1dbtugO14YaHYNygZ8Msnzb7QLwEk/XC8ebid
 SoPxZwjhx15wvgdp5PrKx6lrRBWI8+rvY0jy63rU4UKaf5zGKFO5TM3udTgJOv90G9lD
 mEEw==
X-Gm-Message-State: AOAM531XiZ4GZa9hNYIGqPw4H7z+PLY5IEpqjg+vSmeVnADn8dqaJyYu
 pRqvWyuFLjDazyb7YfOJ2TxxZgmab7JlbMebWcyX
X-Google-Smtp-Source: ABdhPJy6qgrX3X0fcMprBIXxkdVXgaBpxQHgQNT5mrlWB67ltcFM8mvuiIGYv+VxFX94vHy9xIzWFAjaUpdkySngZZo=
X-Received: by 2002:a5b:803:0:b0:633:749f:9acd with SMTP id
 x3-20020a5b0803000000b00633749f9acdmr19288159ybp.236.1650440581619; Wed, 20
 Apr 2022 00:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220420013258.3639264-1-atishp@rivosinc.com>
 <20220420013258.3639264-3-atishp@rivosinc.com>
In-Reply-To: <20220420013258.3639264-3-atishp@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 20 Apr 2022 00:42:50 -0700
Message-ID: <CAOnJCU+EPHxD7MqbswKMy=gZhmyyXMiezqaw1+D1h+O+pbYR2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: KVM: Restrict the extensions that can be
 disabled
To: Atish Patra <atishp@rivosinc.com>
Cc: KVM General <kvm@vger.kernel.org>, Anup Patel <anup@brainfault.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_004306_916265_90D65FDF 
X-CRM114-Status: GOOD (  20.21  )
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

On Tue, Apr 19, 2022 at 6:33 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently, the config reg register allows to disable all allowed
> single letter ISA extensions. It shouldn't be the case as vmm
> shouldn't be able disable base extensions (imac).

/s/able/able to/

> These extensions should always be enabled as long as they are enabled
> in the host ISA.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 2e25a7b83a1b..14dd801651e5 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -38,12 +38,16 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
>                        sizeof(kvm_vcpu_stats_desc),
>  };
>
> -#define KVM_RISCV_ISA_ALLOWED  (riscv_isa_extension_mask(a) | \
> -                                riscv_isa_extension_mask(c) | \
> -                                riscv_isa_extension_mask(d) | \
> -                                riscv_isa_extension_mask(f) | \
> -                                riscv_isa_extension_mask(i) | \
> -                                riscv_isa_extension_mask(m))
> +#define KVM_RISCV_ISA_DISABLE_ALLOWED  (riscv_isa_extension_mask(d) | \
> +                                       riscv_isa_extension_mask(f))
> +
> +#define KVM_RISCV_ISA_DISABLE_NOT_ALLOWED      (riscv_isa_extension_mask(a) | \
> +                                               riscv_isa_extension_mask(c) | \
> +                                               riscv_isa_extension_mask(i) | \
> +                                               riscv_isa_extension_mask(m))
> +
> +#define KVM_RISCV_ISA_ALLOWED (KVM_RISCV_ISA_DISABLE_ALLOWED | \
> +                              KVM_RISCV_ISA_DISABLE_NOT_ALLOWED)
>
>  static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  {
> @@ -217,9 +221,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>         switch (reg_num) {
>         case KVM_REG_RISCV_CONFIG_REG(isa):
>                 if (!vcpu->arch.ran_atleast_once) {
> -                       vcpu->arch.isa = reg_val;
> +                       /* Ignore the disable request for these extensions */
> +                       vcpu->arch.isa = reg_val | KVM_RISCV_ISA_DISABLE_NOT_ALLOWED;
>                         vcpu->arch.isa &= riscv_isa_extension_base(NULL);
> -                       vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
> +                       vcpu->arch.isa &= KVM_RISCV_ISA_DISABLE_ALLOWED;
>                         kvm_riscv_vcpu_fp_reset(vcpu);
>                 } else {
>                         return -EOPNOTSUPP;
> --
> 2.25.1
>

Sorry. I forgot to add the fixes tag.

Fixes: 92ad82002c39 (RISC-V: KVM: Implement
KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls)

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
