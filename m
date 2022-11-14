Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28222C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUSDBY2yN9jfNRIgnftflmSiPBWKbqkFim/TvWXbObI=; b=f3IwEBIwAfbvhW
	anzX1iZgKvvQhnBG35kHVdXLx2byNbJUbK8hdBaHOhg1mYvLW/C+6qt+qnBYc8M3g701SQ7N9N8yE
	gxswvL7xTBz7nSMOc3t5xz+72yJzgpETXx2J/DScqSLq6ssDXHEV+a6pUXQrL2t5FMfP+aDjNoVEL
	nfy9/HaD4vs6H62MepfEIAkhe8gZp4BN7IckjJkhGmkjS5C2TPQqjFmu/NjdAi687QrmSYe8b/jb7
	8UtCXuOkPKueKvkk352fNu5vzI0ALBjIrzJgSSlopKY0TtSF7zapMBpCH3JudgA0l6GTe+PvhktTh
	W6sV1wKk1yVXr6c87g4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXAG-00091I-7S; Mon, 14 Nov 2022 10:58:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXAD-00090Z-Qk
	for linux-riscv@bombadil.infradead.org; Mon, 14 Nov 2022 10:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q9CAZfX4fEaiYHJxRPofStc3477hVqgh/WxqyU/tVkc=; b=FF8eGzRyxl9AP2cUibLZLB+UdO
	9fng02gIZYOEy71VcX6jv4PJ9aMSL0mjb6IsjYAHkCqVS+MIIUq+mLs99mCVhPZVLwUG+481qIUMS
	Q74SiNkB7XBeBGq8zkiRqbD+ujJCx5iryVwoxpwr6HZnda/iBsHt/mHKjqoy7VkSQJ+a76ogPtQfa
	aeqhg2d4mzm/jnxYnLq/LaG3bFaIHqxIhepH3hMxDYA11/mxGuQj+2akv8l3knVMpuOa3rqYJEP93
	Uc8pC6OWbO4oLCf45HTJLRENvqGOOtbI0fjaFiondNm1tA5i+z/rr2Pd1xeQSzmjEkTc5iBZFWxgt
	0HA0dzmQ==;
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXA8-000oJ3-6z
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 10:58:02 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3766A412BF
	for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668423467;
	bh=q9CAZfX4fEaiYHJxRPofStc3477hVqgh/WxqyU/tVkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HBb9UmYzGJ69Y/D7lJve3xFJsqkXuD2DO4y5H/lYOi4gtD89I/nWlrbKRhEUVH0Jp
	 Ib2GvymVvKujxZEg3vnsvlzRpkyPJh0sucf4dzncYN+VrvgjkTHbuo7PfWW333aK0u
	 I2DCL8s8lXgqbLcsCNrS0RJ6xg72lCnTOpms36yg1CEHlITNY6lQyxmNP6+VTqLaHe
	 Bk2QOg/fcCiLR0sTK98FNWJfpZFbaBAU0R/l861V7Gw4RsSoxaD0914sY0A52Nods3
	 JHeuLJ4i14YaO5x1SUv2wwu+y7w5BPuJlB2KZCTIuoDOWSTqz8zxXe+Ie9C8R4aRSZ
	 sdM9yawFOonoA==
Received: by mail-yb1-f197.google.com with SMTP id z125-20020a25c983000000b006dc905e6ccfso10061762ybf.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 02:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9CAZfX4fEaiYHJxRPofStc3477hVqgh/WxqyU/tVkc=;
        b=No3H3Ts/kugmEQ3cjeZ5rm7TkoJjdT27aMFaiAqG2u8PnV0pku4STAP8rs4tvJALiG
         N9rZZAePyxsby/odTqGxpKpMIw1hnZWyXJZCfgcve73kcNeCKtKxp44ox0xXyAJoHUSE
         kFWha24/OmzUzk4tWBeso2QxHFJTFRuH9We97STUHKPlNCDrgZI4UqhO0K9gFK1KZ+Il
         oKlPAsX0GK9BZTQAf516rIqmgxdgzXERPhUcdGI3qc6l9Szv/JoHjMgAfC53pXISYFcF
         9wIUPPPqVxlfAWlpgbghiKz6luJnE82otAyccBB5h+GYAgI7TbiQ8BFR1nD3bXfCqwMt
         5h4Q==
X-Gm-Message-State: ANoB5pmJWbcAlDpag/mRMSYlVpklC+MGTPuhVm1MiHcG4WFsY9NahpJE
	fXd//q5oOJQ5igq64iE8RDDPLq9xpDZK7EfxO48a6ItJMBnp/4PlDIneb1mocVStzJVxh2He+i4
	iywWaMXEMAp6+qyblXfgJfqUyzGJslH8WIQXQJGF2h4OfzgjAtkFPypcYLA3JJg==
X-Received: by 2002:a81:556:0:b0:378:5e3a:8fad with SMTP id 83-20020a810556000000b003785e3a8fadmr12316761ywf.78.1668423466290;
        Mon, 14 Nov 2022 02:57:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7wwRMgVurx749TijzN2M94hhiJ9uzfl/UNHpcqwCx4rp5ARrGLoiQvGZ/3NmA0BTPWweMgCuEJeO5yaVcr4BE=
X-Received: by 2002:a81:556:0:b0:378:5e3a:8fad with SMTP id
 83-20020a810556000000b003785e3a8fadmr12316747ywf.78.1668423466101; Mon, 14
 Nov 2022 02:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-6-heiko@sntech.de>
In-Reply-To: <20221110164924.529386-6-heiko@sntech.de>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 14 Nov 2022 11:57:29 +0100
Message-ID: <CAJM55Z8PBGWr6ej1GSfks8nCvK0q=sF8qDK6f8w=+Nh1mr4sSg@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, 
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_105800_555712_75DC6609 
X-CRM114-Status: GOOD (  25.14  )
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

On Thu, 10 Nov 2022 at 17:50, Heiko Stuebner <heiko@sntech.de> wrote:
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
> +       int num_instr = len / sizeof(u32);
> +       unsigned int call[2];
> +       int i;
> +       int imm1;
> +       u32 rd1;
> +
> +       for (i = 0; i < num_instr; i++) {
> +               /* is there a further instruction? */
> +               if (i + 1 >= num_instr)
> +                       continue;

Isn't this the same as for (i = 0; i < num_instr - 1; i++) ?

> +
> +               if (!is_auipc_jalr_pair(*(alt_ptr + i), *(alt_ptr + i + 1)))
> +                       continue;
> +
> +               /* call will use ra register */
> +               rd1 = EXTRACT_RD_REG(*(alt_ptr + i));
> +               if (rd1 != 1)
> +                       continue;
> +
> +               /* get and adjust new target address */
> +               imm1 = EXTRACT_UTYPE_IMM(*(alt_ptr + i));
> +               imm1 += EXTRACT_ITYPE_IMM(*(alt_ptr + i + 1));
> +               imm1 -= patch_offset;
> +
> +               /* pick the original auipc + jalr */
> +               call[0] = *(alt_ptr + i);
> +               call[1] = *(alt_ptr + i + 1);
> +
> +               /* drop the old IMMs */
> +               call[0] &= ~(U_IMM_31_12_MASK);
> +               call[1] &= ~(I_IMM_11_0_MASK << I_IMM_11_0_OPOFF);
> +
> +               /* add the adapted IMMs */
> +               call[0] |= to_auipc_imm(imm1);
> +               call[1] |= to_jalr_imm(imm1);
> +
> +               /* patch the call place again */
> +               patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);
> +       }
> +}
> +
>  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>                                                   struct alt_entry *end,
>                                                   unsigned int stage)
> @@ -316,8 +384,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>                 }
>
>                 tmp = (1U << alt->errata_id);
> -               if (cpu_req_feature & tmp)
> -                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +               if (cpu_req_feature & tmp) {
> +                       /* do the basic patching */
> +                       patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> +                                         alt->alt_len);
> +
> +                       riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> +                                                        alt->alt_len,
> +                                                        alt->old_ptr - alt->alt_ptr);

Here you're casting a void pointer to an instruction to an unsigned
int pointer, but since we enable compressed instructions this may
result in an unaligned pointer. Using this pointer will work, but may
be slow. Eg. fault to m-mode to be patched up. We already do that in
other places in the arch/riscv, but I'd prefer not to add new
instances of this.

> +               }
>         }
>  }
>  #endif
> --
> 2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
