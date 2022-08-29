Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D12AECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ja9zwNfBggcraitfMSoTRjP+0bLt1fhz+RKwNWl/OZ8=; b=3oMQxMQnStkw4I
	EGaHjHunjgTQjNbg4Ik0H4QlFazArOmzSxAN6TKXZxlaHGI+DpuHm9Z5TQT4ZpkFmrFtwzpr2Awzf
	yRwQaMOFJwRpjE9SMpdPGXyWHA2BMURCJFmfRbhPmdaoDadGutnfZpmZvMGKoWgRijk0rKuKHZnJP
	1+RBQBINGIsHh+K58O20mtSEJUEzKI/Sszi1TxwdRmJ+wGgpP2U2xMvGVXqAVK/F6MKw1ZRJOut6q
	OYh4ARAQSALvqkv40mSm7lHeMW9NUtD381UAtBNl1CDz+pMVER/AKkv8gBtWwa1jviE4XvuvbylAi
	ceDgWdek7RXsvO5Dnw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaDL-006En3-Fu; Mon, 29 Aug 2022 08:33:48 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaB1-006DKH-HZ
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 08:31:28 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-340f82c77baso61870587b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HhkDsDA80zH9OWHmK2nGu5RFBtVZXnjtoCv9dyej5Ag=;
        b=vTlFk8K6+piI/hraTj4z1RaLXDO11MVfTc34bTdeBTn5goYp3OBp6ubASyg/IWIsSO
         qOgvhHINIv5IhkS2DXq9clfHMQVsppY9NHqRS4qX3cPh3RQFcZzhoCNHnZEfd6RVcvR4
         SJWonWz802UBhbCeZrytqddkf+0Obs+1cShEt+b1wk1KzBiukT+KcfuySTJvSdvhVhyA
         uamZeh060q9HBxj/ek+mIVhLMNG7AIHwecA59dqLvvWDztIor2kBKSF26dvdCAovijSo
         Qifs6y9N7N0MFjYxmtItcDCCBrP6FHKO8ycSDaoCzMZzTYJo2gzfSY4HbN3R0J0bHGqQ
         3Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HhkDsDA80zH9OWHmK2nGu5RFBtVZXnjtoCv9dyej5Ag=;
        b=n3RHKEcVXODo16MH7PgBFjNgclS2eD6idaLZCejflDHazkpRsq0R7xc3KjhCqjgHzd
         VV79HPj2ZiQktrkvSIHrjBJBxJy1JSaEa4m0R/uww0w1Sb8jhhsUxN+sSr2V8l+WDybx
         OhhzB5Q+k2sZ2ogaYbresXv9R3YPzZ4kw9nXIH4hsXUsAf71OZBaTN8LSFX7KCLJy81m
         JcbM9OG8Psz8ZKbVjYdgieamZwivMtF1tNiJWnuWD609MssaBB9zmdUlZPIXl3OOpdoS
         /3vsSS3Hu/FNQtPtXzGjUmSjcJ9YNJ7TTUDsyqJROlKuRWi95aY+WmHMV7XjsgzwuG+h
         yCrg==
X-Gm-Message-State: ACgBeo2Nfz+eX7cLhBYIIuAxTBtk8kmWZ5+O1+qRExTjUMHJDwB00w5d
	tjGwmSTkZ2/QX4GbW/hFxRtvAdtx4VolsDj1sZV2pw==
X-Google-Smtp-Source: AA6agR43z1nY3ei/WrttWc11d05Z1Md+aZfj4UacatrD1NZZTdNID4+e2lva3ipUumyedS+VjNEbH1FhGdD6MwE1xH4=
X-Received: by 2002:a25:234a:0:b0:696:435f:df06 with SMTP id
 j71-20020a25234a000000b00696435fdf06mr7486832ybj.180.1661761882106; Mon, 29
 Aug 2022 01:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220819140250.3892995-1-ajones@ventanamicro.com> <20220819140250.3892995-3-ajones@ventanamicro.com>
In-Reply-To: <20220819140250.3892995-3-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Aug 2022 14:01:06 +0530
Message-ID: <CAAhSdy3KcjR-jFTxH-oYEw=mLTSdbMnadoLcygDPQaa0h3JbxQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] riscv: Introduce support for defining instructions
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, mchitale@ventanamicro.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_013123_767275_A9EAF279 
X-CRM114-Status: GOOD (  22.37  )
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

On Fri, Aug 19, 2022 at 7:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When compiling with toolchains that haven't yet been taught about
> new instructions we need to encode them ourselves. Create a new file
> where support for instruction definitions will evolve. We initiate
> the file with a macro called INSN_R(), which implements the R-type
> instruction encoding. INSN_R() will use the assembler's .insn
> directive when available, which should give the assembler a chance
> to do some validation. When .insn is not available we fall back to
> manual encoding.
>
> Not only should using instruction encoding macros improve readability
> and maintainability of code over the alternative of inserting
> instructions directly (e.g. '.word 0xc0de'), but we should also gain
> potential for more optimized code after compilation because the
> compiler will have control over the input and output registers used.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                |  3 ++
>  arch/riscv/include/asm/insn-def.h | 82 +++++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 arch/riscv/include/asm/insn-def.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..f8f3b316b838 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -227,6 +227,9 @@ config RISCV_DMA_NONCOHERENT
>         select ARCH_HAS_SETUP_DMA_OPS
>         select DMA_DIRECT_REMAP
>
> +config AS_HAS_INSN
> +       def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
> +
>  source "arch/riscv/Kconfig.socs"
>  source "arch/riscv/Kconfig.erratas"
>
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> new file mode 100644
> index 000000000000..4cd0208068dd
> --- /dev/null
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_INSN_DEF_H
> +#define __ASM_INSN_DEF_H

Add a new line here.

> +#include <asm/asm.h>
> +
> +#define INSN_R_FUNC7_SHIFT             25
> +#define INSN_R_RS2_SHIFT               20
> +#define INSN_R_RS1_SHIFT               15
> +#define INSN_R_FUNC3_SHIFT             12
> +#define INSN_R_RD_SHIFT                         7
> +#define INSN_R_OPCODE_SHIFT             0
> +
> +#ifdef __ASSEMBLY__
> +
> +#ifdef CONFIG_AS_HAS_INSN
> +
> +       .macro insn_r, opcode, func3, func7, rd, rs1, rs2
> +       .insn   r \opcode, \func3, \func7, \rd, \rs1, \rs2
> +       .endm

Maybe use indentation here ?

.macro <xyz>
     .insn ...
.endm

> +
> +#else
> +
> +#include <asm/gpr-num.h>
> +
> +       .macro insn_r, opcode, func3, func7, rd, rs1, rs2
> +       .4byte  ((\opcode << INSN_R_OPCODE_SHIFT) |             \
> +                (\func3 << INSN_R_FUNC3_SHIFT) |               \
> +                (\func7 << INSN_R_FUNC7_SHIFT) |               \
> +                (.L__gpr_num_\rd << INSN_R_RD_SHIFT) |         \
> +                (.L__gpr_num_\rs1 << INSN_R_RS1_SHIFT) |       \
> +                (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
> +        .endm
> +
> +#endif
> +
> +#define INSN_R(...)    insn_r __VA_ARGS__
> +
> +#else /* ! __ASSEMBLY__ */
> +
> +#ifdef CONFIG_AS_HAS_INSN
> +
> +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)     \
> +       ".insn  r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
> +
> +#else
> +
> +#include <linux/stringify.h>
> +#include <asm/gpr-num.h>
> +
> +#define DEFINE_INSN_R                                                  \
> +       __DEFINE_ASM_GPR_NUMS                                           \
> +"      .macro insn_r, opcode, func3, func7, rd, rs1, rs2\n"            \
> +"      .4byte  ((\\opcode << " __stringify(INSN_R_OPCODE_SHIFT) ") |"  \
> +"               (\\func3 << " __stringify(INSN_R_FUNC3_SHIFT) ") |"    \
> +"               (\\func7 << " __stringify(INSN_R_FUNC7_SHIFT) ") |"    \
> +"               (.L__gpr_num_\\rd << " __stringify(INSN_R_RD_SHIFT) ") |"    \
> +"               (.L__gpr_num_\\rs1 << " __stringify(INSN_R_RS1_SHIFT) ") |"  \
> +"               (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
> +"      .endm\n"
> +
> +#define UNDEFINE_INSN_R                                                        \
> +"      .purgem insn_r\n"
> +
> +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)                     \
> +       DEFINE_INSN_R                                                   \
> +       "insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
> +       UNDEFINE_INSN_R
> +
> +#endif
> +
> +#endif /* ! __ASSEMBLY__ */
> +
> +#define OPCODE(v)      __ASM_STR(v)
> +#define FUNC3(v)       __ASM_STR(v)
> +#define FUNC7(v)       __ASM_STR(v)
> +#define __REG(v)       __ASM_STR(x ## v)
> +#define RD(v)          __REG(v)
> +#define RS1(v)         __REG(v)
> +#define RS2(v)         __REG(v)
> +
> +#endif /* __ASM_INSN_DEF_H */
> --
> 2.37.1
>

Apart from new nit comments above, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
