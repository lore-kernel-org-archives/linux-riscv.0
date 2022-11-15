Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A1AC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2bbv6Ipm+m67ftNAfRy5a6Lsc08HzVecw9KeHPvkTc=; b=LX/Ul32UipL1QE
	EWBZHS9BZqM/HSWFPTjtYzjRlEXB70jbI+rCajma+j5lC6fei4I5WRWil+3u8td/CU0hugYObUXg/
	10OMXmVlYC1UycGpGGX7u6Mq+LYOBo18g1FeaOEnZEy0ReGeecOOBbZ4iJNEyCFTCXnJ0p4Sz3xYF
	JiN61pQqiBr7wuu8kC1CspbL8/KSspSdUEHB5LtSWR2iyx+7i0te55Pspinx1Qt66wJU/puzNUUe8
	kZ1TK/zkvUVkezBYHPDGUSJZOY2HozHudXdBb3KNCR/cxGtZNrlurjrCnsbukkgKUhsHXSiBskK7E
	rr1uWtjdGYtwEsvM9I5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouww0-00BtNE-GE; Tue, 15 Nov 2022 14:29:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwvy-00BtIz-0J
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 14:29:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id n20so15851064ejh.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 06:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D/Re1O9DH2uniZAyOudlh9lB7yJvXS0vKWeR9pA+Tio=;
        b=JdhpU0m7qQyPYImpCxM7odfn/SbTIiv+5pHCUR/L+InofJaqgATCGKCYeMtnrGgUMt
         AVFbsIk4CX5jAsokTURHXtqcrXSJxXD7aC83CddQJyt1mElUEtVYK6g6wIhTwnmkIFbH
         Yvw1gw1K7YdGcPBWOfGdFWwZnSw5kDPtUNJuamn8ug3ouEjKuNXVp2kY5zmRsULuEyD0
         itghsmb2xRVO+kpKVD3ORDsa3Vzmgti1S8kx6xEZV87bQLhVDfbT9lsY5ZosiJJ2zOy3
         KFxLUdGbQ/zYcaNP3boMvWM1vRl+UhmeUNMUl7CWpN+qB+o/zhcksenViShLMGwWPdYp
         SEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/Re1O9DH2uniZAyOudlh9lB7yJvXS0vKWeR9pA+Tio=;
        b=HqtcLEw9NEn+oqSArGWZgM7L5+tb4dEraihCtb1Hgo0YUuN4K55xsQUc6yiEgB4qsd
         t2GDyNXRhaxo0XOEN6b8gdpwGje4UbenVek04rLJmz8apEWWWrrVE8Ap4yk7IM2jNjNu
         uiyp7SWgOUYMXLebJlasqD1cAemdSEDGCBWjF1RtSsM+ZoAHnX3EKTKlCI30CtHQS7ZN
         nW93iJs5lQ/fk+nkLGIgMvDbgF/NH6GqEtTTqL6iCtL9VKQKUfL8kGY4uC+zbzm00Ror
         VIh3FKt7OhT5ocJx1MGzjsPeCMlSVdooStRWW66AW+Vfg0wTs3nWnKm4dslKVMd431cR
         EAVA==
X-Gm-Message-State: ANoB5plgAFyGmPlJoey+plqtIJduEfNB+6QqFhPYR+RKjJ2Cb/3ELNZV
	5MGUuCAgNnPMN3sq0RXn0fx9H+i1SqLPgUnN6cc=
X-Google-Smtp-Source: AA0mqf7siFtnqM9gkDCoent5vTwz/7WCxPc5bFanYOJe7Se7Vl8pYGLbesNNesqSP4MvhFX567VLn1iGWnD9UTFkX+c=
X-Received: by 2002:a17:906:4e42:b0:781:e568:294f with SMTP id
 g2-20020a1709064e4200b00781e568294fmr14251930ejw.447.1668522534925; Tue, 15
 Nov 2022 06:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-6-heiko@sntech.de>
In-Reply-To: <20221110164924.529386-6-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Nov 2022 14:28:27 +0000
Message-ID: <CA+V-a8v4=vvCMNRfOtgA2LQN+O5S3w6oQJfY5ZdBtSHCKJ=Hcw@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_062906_071373_F273915F 
X-CRM114-Status: GOOD (  16.58  )
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

Hi Heiko,

Thank you for the patch.

On Thu, Nov 10, 2022 at 4:50 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> Alternatives live in a different section, so addresses used by call
> functions will point to wrong locations after the patch got applied.
>
> Similar to arm64, adjust the location to consider that offset.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/cpufeature.c | 79 +++++++++++++++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..026512ca9c4c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -298,6 +298,74 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>         return cpu_req_feature;
>  }
>
> +#include <asm/parse_asm.h>
> +
> +DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
> +DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
> +
> +static inline bool is_auipc_jalr_pair(long insn1, long insn2)
> +{
> +       return is_auipc_insn(insn1) && is_jalr_insn(insn2);
> +}
> +
> +#define JALR_SIGN_MASK         BIT(I_IMM_SIGN_OPOFF - I_IMM_11_0_OPOFF)
> +#define JALR_OFFSET_MASK       I_IMM_11_0_MASK
> +#define AUIPC_OFFSET_MASK      U_IMM_31_12_MASK
> +#define AUIPC_PAD              (0x00001000)
> +#define JALR_SHIFT             I_IMM_11_0_OPOFF
> +
> +#define to_jalr_imm(offset)                                            \
> +       ((offset & I_IMM_11_0_MASK) << I_IMM_11_0_OPOFF)
> +
> +#define to_auipc_imm(offset)                                           \
> +       ((offset & JALR_SIGN_MASK) ?                                    \
> +       ((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) :    \
> +       (offset & AUIPC_OFFSET_MASK))
> +
> +static void riscv_alternative_fix_auipc_jalr(unsigned int *alt_ptr,
> +                                            unsigned int len, int patch_offset)
> +{

I am yet to test this with my ASM code yet, but maybe can we move this
to [0] so that other erratas can make use of it too?

[0] arch/riscv/kernel/patch.c

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
