Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA791C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cHxGDKPzVQxTpgcc0XsHxNIbFaCmEXb9Q9wEA12i4c=; b=aEoebp+//Jh5Rp
	azRtkC8/ELt42qOTrga+e02RN4hdRQFxia9tR5Rsih/BRhSqDnyJmNde9YNo/OnlQCM+/hV2VUcLv
	RFVxUWBwggCy+Z4tJNFbuISzFxxcgg5AlHxTGgWw7PyouyJtlwSEJMAGDQnR8tvvjhdOFV9TUeRH8
	S0/wJKlEBJa/e6699bdh2eU8hCFmRbO5ntNX5Y/ECZMx/iXg2ICNTIHuBJvoIm/BXFx5orC7Wg2X6
	WghDZtT1HrIl37ZrPkaLAPTCmvgn02jnYMAUt8qNZARsE1hjn/dBP8Lzha6twwGg4qHK3cWqEJyqL
	j8Gw9ActrLiBEOZj0oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3Rq-00BzWQ-Bn; Mon, 21 Nov 2022 09:50:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3Rn-00BzUG-Cc
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 09:50:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id f18so27234664ejz.5
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 01:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xFQDqkAyqijtwe7ymd/0K6jiv9owQzxk/WizQB1KDOs=;
        b=HC5Z/gW0xEL+4m8UWRKOYrXs19NGK/Lg+MEjy7PBZhOhfbkgDt5uMlmREf6oC5KNrO
         LIMceJpUHDTzuKxOaTrtkpRJWSin2gROQwCtMqjveUaLeNtRIqDX8D+sYyLVg6FK8KcN
         dfxAEj0e77GCDYHhZzVJ2WJF79hwnOM72+8wVEhrci+1RDlwPHorurpxslMmH9KwnOB7
         leksDFUTuWzyhuwWF9698QLEWqRaNLVPNnXUi1Gz+8h5JxauOEPA2geDEHNj4m8ETSJw
         9qcduICd+CaCZ5TCwztYTP+uIAEOYQ6pK3bM/YEBktAWPcl7RberH5+AmcVXoKcYbWP/
         aOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFQDqkAyqijtwe7ymd/0K6jiv9owQzxk/WizQB1KDOs=;
        b=CaT7kVeuizgj0QJZsvHpAQ5rGSoSO+N8MjOfljLE9t/AHfSNx7/3b+vn+aotIsCkTT
         4w28mZ0X14GRAhIStDB0i+gjxD3/PD9jPVQ9a4smi55Q1DEZIMrarLKKIBF3DNmnD6tN
         FCssDR/clzsWIJ1VQZW0bwKawZ4/Zb8BWl/NN5nzFpkkXpeqGdo5JbYY2J0DurHanve+
         gyu40b727gvE3mIeEYfJbwQBkjmhNKEz/dOLnAYOjIbvfbyEU+Ur86s3AUqD1658m237
         mCeqMpJvfj/PIHHMBUKlUu378eNT21TU9lklO/eYxRACabweSc1STp8y4nnIOC4b4vX4
         MjBQ==
X-Gm-Message-State: ANoB5pkjudIOoWPjbQpVdm/sAcFX0/GBUL3a97iu6sj8sdZmPjkadpq/
	J87MEoUQYL42tB/ZXSsvq0U2/Nu5tdDr8SPWMig=
X-Google-Smtp-Source: AA0mqf7HSYgyBz4vFpca9KCzG6rEQv0pp3XUl48hxg4vU6Tqv1z5wK0OZ3PZ1QLYMePpUzzOsuIm13lcmtrlm9QDVoA=
X-Received: by 2002:a17:906:3792:b0:7aa:97c7:2bfe with SMTP id
 n18-20020a170906379200b007aa97c72bfemr14531899ejc.196.1669024236468; Mon, 21
 Nov 2022 01:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-6-heiko@sntech.de>
In-Reply-To: <20221110164924.529386-6-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Nov 2022 09:50:09 +0000
Message-ID: <CA+V-a8tNjE+eeZEafnCXbXMdhEdzOXcft2UJNYbXxs0+Pag58Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_015039_450801_1F380CCD 
X-CRM114-Status: GOOD (  22.68  )
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

I have the below assembly code which I have tested without the
alternatives for the RZ/Five CMO,

#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)        \
asm volatile(".option push\n\t\n\t"                    \
         ".option norvc\n\t"                    \
         ".option norelax\n\t"                    \
         "addi sp,sp,-16\n\t"                    \
         "sd    s0,0(sp)\n\t"                    \
         "sd    ra,8(sp)\n\t"                    \
         "addi    s0,sp,16\n\t"                    \
         "mv a4,%6\n\t"                        \
         "mv a3,%5\n\t"                        \
         "mv a2,%4\n\t"                        \
         "mv a1,%3\n\t"                        \
         "mv a0,%0\n\t"                        \
         "call rzfive_cmo\n\t"                    \
         "ld    ra,8(sp)\n\t"                    \
         "ld    s0,0(sp)\n\t"                    \
         "addi    sp,sp,16\n\t"                    \
         ".option pop\n\t"                        \
         : : "r"(_cachesize),                    \
         "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),    \
         "r"((unsigned long)(_start) + (_size)),            \
         "r"((unsigned long) (_start)),                \
         "r"((unsigned long) (_size)),                \
         "r"((unsigned long) (_dir)),                \
         "r"((unsigned long) (_ops))                \
         : "a0", "a1", "a2", "a3", "a4", "memory")

Now when integrate this with ALTERNATIVE_2() as below,

#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)        \
asm volatile(ALTERNATIVE_2(                        \
    __nops(14),                            \
    "mv a0, %1\n\t"                            \
    "j 2f\n\t"                            \
    "3:\n\t"                            \
    "cbo." __stringify(_op) " (a0)\n\t"                \
    "add a0, a0, %0\n\t"                        \
    "2:\n\t"                            \
    "bltu a0, %2, 3b\n\t"                        \
    __nops(8), 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,    \
    ".option push\n\t\n\t"                        \
    ".option norvc\n\t"                        \
    ".option norelax\n\t"                        \
    "addi sp,sp,-16\n\t"                        \
    "sd    s0,0(sp)\n\t"                        \
    "sd    ra,8(sp)\n\t"                        \
    "addi    s0,sp,16\n\t"                        \
    "mv a4,%6\n\t"                            \
    "mv a3,%5\n\t"                            \
    "mv a2,%4\n\t"                            \
    "mv a1,%3\n\t"                            \
    "mv a0,%0\n\t"                            \
    "call rzfive_cmo\n\t"                \
    "ld    ra,8(sp)\n\t"                        \
    "ld    s0,0(sp)\n\t"                        \
    "addi    sp,sp,16\n\t"                        \
    ".option pop\n\t"                        \
    , ANDESTECH_VENDOR_ID,                        \
            ERRATA_ANDESTECH_NO_IOCP, CONFIG_ERRATA_RZFIVE_CMO)    \
    : : "r"(_cachesize),                        \
    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),    \
    "r"((unsigned long)(_start) + (_size)),            \
    "r"((unsigned long) (_start)),                \
    "r"((unsigned long) (_size)),                \
    "r"((unsigned long) (_dir)),                \
    "r"((unsigned long) (_ops))                \
    : "a0", "a1", "a2", "a3", "a4", "memory")

I am seeing kernel panic with this change. Looking at the
riscv_alternative_fix_auipc_jalr() implementation it assumes the rest
of the alternative options are calls too. Is my understanding correct
here?

Do you think this is the correct approach in my case?

Note, I wanted to test with ALTERNATIVE_2() first to make sure
everything is okay and then later test my ALTERNATIVE_3()
implementation.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
