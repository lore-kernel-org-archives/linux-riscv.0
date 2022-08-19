Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED001C32772
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDuGYev7ONW8Ya+twOxOdAwlhKsU6Mlu6/1+MZTo4sk=; b=YMKne2oHTcYWIH
	Vtx8zUwJfYjkp9sautW+BjxSTam4Zluqp6bWg69x3CUSrIGzcdsON3w/ZcNwrP4kqjXdYSgdxDAcC
	jbXdGiqwIiDQPhKhnrpuJRyYVb404uDXZkksFeAusikNniv7EBj4brjIx9ioxvo619+fiD21CfWJJ
	v+IBpxH1QDi/5o6hC5m85SN18I3HweWTLWi2N6NOlvmIMCyF79/QoibYgxoLD+uXyHIvgk3ZgqxcO
	85hifKiRzjoyr/I68k6K/yKWOOMVTI6d34EpC9kb8vpoYcEIsRVHL24bG8nObcDvYpzTyye+bNGGa
	j67neGqwwPPXRA2nZwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2wz-009U7p-Qr; Fri, 19 Aug 2022 14:26:17 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2ww-009U3O-P5
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:26:16 +0000
Received: by mail-ed1-x52d.google.com with SMTP id s11so5845984edd.13
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=fFhF+3XP6naP0ZUj4bms8XHGKJDA61lcJSZD3iKtxUw=;
        b=GzGtS0qGqcbT3ZOUCDh9ZmEwsbXx8fJibrnq0qhJSCm6olm7FJiAhA2ANhWqaFCtfZ
         P/F/JkZVEQ1y9QQNtyV8W7MH0lMgrz5iU3GU0DAn5L+fX5irWCOt557ANXambeB0ixww
         Hu/UK89XLPopqAh4wdHUI7EJvZeLPfxERgYbS2WL5Il79yGntUhiLlihfCSdt7dX4NVB
         /ost9aDlnJOT4rpuKtacFJUEn8Xgs4c21K/Samr94S0vu72uSZ0aE9nE5o8cswszZTML
         fHER1lcOKxDVQcwnf3uDZTH8dmcicTnRIL/1gZ08mKQEAmngswTJhaCom5jG263DpqHF
         BODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=fFhF+3XP6naP0ZUj4bms8XHGKJDA61lcJSZD3iKtxUw=;
        b=4X8W+DLv6x9gpMfhWSw3tA9Dy64znDiPcojXbayIFxFSaXWVYfjhKBqCFLFNUBuVgY
         9S+zsF28yoZZqah2eox8lCRPWsYdGs6XJ+J/N4L9ws9iF2eOLNdNTrXsQQBenUfqiXXu
         2JxyT7gMq07+u7uKODO9fGWUsZeimgHgc0I6b4pohqEg7ZAGl9tJ0Up4BBK11hPKpLBR
         vv1/diJaRfP3bzT/5KDV6Pt6cKvbRLf+eDu1+SAi5NLiMyaxdPkknS+o6g+RLTYdv3f7
         poTvX0CQylOZWArp4gw+JDF5hmSajhg8iUKTS6lG+K3xa+GbAXS/7e0TzLYB9Sq+XNzA
         R10Q==
X-Gm-Message-State: ACgBeo3Nd2TLfzj6/HEX4j/rdHuVoTNwkeuoT5GwY3IHE3ZWJD56fuvf
	I/dJQxzZq1Hp/Mo65EoWmoZpoOdnnIsuOw==
X-Google-Smtp-Source: AA6agR6T8+Us3I3yAILhsdbXqW3Vr1uQ9Ap68Pb15BPdvtLCGkeCkD8ohZ3rbVdll6nmLOmqYzNa5A==
X-Received: by 2002:a05:6402:d0b:b0:443:df38:9df with SMTP id eb11-20020a0564020d0b00b00443df3809dfmr6361959edb.9.1660919170199;
        Fri, 19 Aug 2022 07:26:10 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id kf14-20020a17090776ce00b0073851453444sm2395288ejc.60.2022.08.19.07.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 07:26:09 -0700 (PDT)
Date: Fri, 19 Aug 2022 16:26:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org,
	mchitale@ventanamicro.com, heiko@sntech.de
Subject: Re: [PATCH 2/4] riscv: Introduce support for defining instructions
Message-ID: <20220819142608.uzqvtd7qfejvhzia@kamzik>
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
 <20220819140250.3892995-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819140250.3892995-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_072614_846389_7805476B 
X-CRM114-Status: GOOD (  23.32  )
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

On Fri, Aug 19, 2022 at 04:02:48PM +0200, Andrew Jones wrote:
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
>  	select ARCH_HAS_SETUP_DMA_OPS
>  	select DMA_DIRECT_REMAP
>  
> +config AS_HAS_INSN
> +	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
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
> +#include <asm/asm.h>
> +
> +#define INSN_R_FUNC7_SHIFT		25
> +#define INSN_R_RS2_SHIFT		20
> +#define INSN_R_RS1_SHIFT		15
> +#define INSN_R_FUNC3_SHIFT		12
> +#define INSN_R_RD_SHIFT			 7
> +#define INSN_R_OPCODE_SHIFT		 0
> +
> +#ifdef __ASSEMBLY__
> +
> +#ifdef CONFIG_AS_HAS_INSN
> +
> +	.macro insn_r, opcode, func3, func7, rd, rs1, rs2
> +	.insn	r \opcode, \func3, \func7, \rd, \rs1, \rs2
> +	.endm
> +
> +#else
> +
> +#include <asm/gpr-num.h>
> +
> +	.macro insn_r, opcode, func3, func7, rd, rs1, rs2
> +	.4byte	((\opcode << INSN_R_OPCODE_SHIFT) |		\
> +		 (\func3 << INSN_R_FUNC3_SHIFT) |		\
> +		 (\func7 << INSN_R_FUNC7_SHIFT) |		\
> +		 (.L__gpr_num_\rd << INSN_R_RD_SHIFT) |		\
> +		 (.L__gpr_num_\rs1 << INSN_R_RS1_SHIFT) |	\
> +		 (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
> +        .endm

Doh, checkpatch told me about the spaces vs. tabs before .endm, but I
forgot to refresh before sending. I won't send a v2 until the series
gets more feedback, but I've already got it fixed.

> +
> +#endif
> +
> +#define INSN_R(...)	insn_r __VA_ARGS__
> +
> +#else /* ! __ASSEMBLY__ */
> +
> +#ifdef CONFIG_AS_HAS_INSN
> +
> +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)	\
> +	".insn	r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
> +
> +#else
> +
> +#include <linux/stringify.h>
> +#include <asm/gpr-num.h>
> +
> +#define DEFINE_INSN_R							\
> +	__DEFINE_ASM_GPR_NUMS						\
> +"	.macro insn_r, opcode, func3, func7, rd, rs1, rs2\n"		\
> +"	.4byte  ((\\opcode << " __stringify(INSN_R_OPCODE_SHIFT) ") |"	\
              ^
              ^ checkpatch didn't tell me those are spaces instead of a
	      tab, but I found it while fixing the other tab issue.

> +"		 (\\func3 << " __stringify(INSN_R_FUNC3_SHIFT) ") |"	\
> +"		 (\\func7 << " __stringify(INSN_R_FUNC7_SHIFT) ") |"	\
> +"		 (.L__gpr_num_\\rd << " __stringify(INSN_R_RD_SHIFT) ") |"    \
> +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_R_RS1_SHIFT) ") |"  \
> +"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
> +"	.endm\n"
> +
> +#define UNDEFINE_INSN_R							\
> +"	.purgem insn_r\n"
> +
> +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
> +	DEFINE_INSN_R							\
> +	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
> +	UNDEFINE_INSN_R
> +
> +#endif
> +
> +#endif /* ! __ASSEMBLY__ */
> +
> +#define OPCODE(v)	__ASM_STR(v)
> +#define FUNC3(v)	__ASM_STR(v)
> +#define FUNC7(v)	__ASM_STR(v)
> +#define __REG(v)	__ASM_STR(x ## v)
> +#define RD(v)		__REG(v)
> +#define RS1(v)		__REG(v)
> +#define RS2(v)		__REG(v)
> +
> +#endif /* __ASM_INSN_DEF_H */
> -- 
> 2.37.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
