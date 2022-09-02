Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F864C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJL6lZBD8pty8WxFau3H3go1BpuphP85ycO9eyRKEOs=; b=Pz8J1CjSpdUSyW
	Fpl+DKRpTJPiAJLThpkH+Bb1NrcJRqdyv8PY//L+44kUSu2gsNrjZvYBh/w5dYI3UTSQmI+qUoUim
	fPF/XpeD8Y39W/+PHh7iO9TZuhoILy3+myET4Jh80px6UDCvZ3mLPZotJC9lbcgQsY1loNbTF3orz
	U9gU9XiYW/iCyUc2ssULvI15vBCM2haZvULEJXSIXkbsSwBAQ6Z4PTWKRS7OoxJr75DUo6+XhkCKd
	WtlBO+RrtBYcEWbA9tCdIa9Sdm14629zh264Va/Qq2Kq/zW12S3qlLDVE8vIgNLSS24Lmn82mb2vG
	RgyHx5q3YPM66m42z8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0Xa-0010iV-Cz; Fri, 02 Sep 2022 06:52:34 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0XX-0010fK-AU
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 06:52:32 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id g5so1845545ybg.11
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 23:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jEmD+sonir/wrrBAuM3WRSeJRwInUyaKyDNim+FUfro=;
        b=1UpWumfHYOWbr/JF9ogYs0NCweH8XNqdDUFG7CKvmJGwKc3LG4vllMgVJO45zt/tWy
         sl5jMrXTOqQ5y2OKzBaRT5df1mjFBbRcA44rQwmqDWdR67Yx3sN2XZmGxw7eYGSZ9bNF
         DQmWmBkjNYMa4/yIqwlCmihn6gXNfi5Fcvz2XWCDs5Y1kMowy+SO5VPJY8hC1ul9gIqS
         kiBXybjMmsfrWM+FPQDiRyXFszD0J4mdO1nIjJSPcEyQ7A+KwcXFA+34C9YElCMGBw8K
         S7kLDXV+dNPnS0oMl2vV3vw4/i7V9GOkyE0uG+9sHJCwyw1njOFtzpYfkFpXAaG/THkD
         zRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jEmD+sonir/wrrBAuM3WRSeJRwInUyaKyDNim+FUfro=;
        b=ZfoTvEQbpe4tt5UK/tSbZKKWT8wHLzrWdgYbtKU/fgI5kbAASy/hE4L6+sM1t+qkIz
         nMdBmWW+XT2Cd5CxR2nrhtNjGoVT6xdPGq0IOcWOCP+0izkOFhiAefva/+4gmSRrhRi+
         vb3SExIm57Q/sj3I1/SzpifQsZWjAGtroRURPc5TJJxbBctRcBbWJYld4zKWhV+Im4hX
         vpK3US4hqEiWF98d8V0gkLyZC4IPJHf05BN3yGWTIUcvSkXurf3zFbjDUSvjxBHKZ3e/
         Hy30/0e/+BVYnOybTU5HAI0Y7UhHtzGaa6nvv0JjyrlJaRRYwVvLmWZgrrrTcM0ZOYt6
         UU4Q==
X-Gm-Message-State: ACgBeo2Vc7S+yynNLCK+KKp0c5zvMXUvZuDSkqGReqwY7es6lYRjQ5aW
	CbIw98YGm8Ii8hvyy1IDzk6crguuueE+HuFvzzajEw==
X-Google-Smtp-Source: AA6agR44g/Ju9nqb+toCfK/zUEecF64y1FoAxAcnWFvNBCqUEEo7XSRHfJBznJrPc7Sa4iE44Migg0Ovl3hCOmU1szI=
X-Received: by 2002:a25:2596:0:b0:696:5c19:6e34 with SMTP id
 l144-20020a252596000000b006965c196e34mr22259794ybl.423.1662101549009; Thu, 01
 Sep 2022 23:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220831172500.752195-1-ajones@ventanamicro.com> <20220831172500.752195-3-ajones@ventanamicro.com>
In-Reply-To: <20220831172500.752195-3-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Sep 2022 12:22:16 +0530
Message-ID: <CAAhSdy3OE_+ZafzYN5dtLWvgX7X8-ZN0SVv4ML+pT2sGarmEBQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: Introduce support for defining instructions
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, mchitale@ventanamicro.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_235231_382758_681DB22C 
X-CRM114-Status: GOOD (  22.70  )
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

On Wed, Aug 31, 2022 at 10:55 PM Andrew Jones <ajones@ventanamicro.com> wrote:
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
> Reviewed-by: Anup Patel <anup@brainfault.org>

I have queued this patch for Linux-6.1

Thanks,
Anup

> ---
>  arch/riscv/Kconfig                |  3 ++
>  arch/riscv/include/asm/insn-def.h | 86 +++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+)
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
> index 000000000000..2dcd1d4781bf
> --- /dev/null
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_INSN_DEF_H
> +#define __ASM_INSN_DEF_H
> +
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
> +       .endm
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
> +#define RD(v)          __ASM_STR(v)
> +#define RS1(v)         __ASM_STR(v)
> +#define RS2(v)         __ASM_STR(v)
> +#define __REG(v)       __ASM_STR(x ## v)
> +#define __RD(v)                __REG(v)
> +#define __RS1(v)       __REG(v)
> +#define __RS2(v)       __REG(v)
> +
> +#endif /* __ASM_INSN_DEF_H */
> --
> 2.37.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
