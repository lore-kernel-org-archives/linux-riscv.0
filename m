Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F1C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhulhxomJYdaER1gkzoPafKCorfkY914lMOlaAtnUVU=; b=urm4+YWPz/4Jl8
	AvjDUYnjBTsGJeiESt0Tt8DaEy03GSw1yJAKLNPFsy/agKBHgt9W4ByNmYpVbs5ngUqPhuz6f++th
	umC1D0YrCCHyHXnli7qGbvyoNbGL03ZNdfPcf7o7m69PwEQSkN5tPeWP3BlOsMqOTdGAbbi8ByqWb
	hwWyIlx7ak/+gGA1d5DJH9xQHFBIM6FKfIG381xf1RFZ6TSODZ1m2F/3yahbn1zt/KDqSM/HnJpQX
	GMwiuZfD8GA6cEb3Etteu+r2g+Rg7mE4tAvdUXspb/S20sUP2vyaouGI2T+IA/IiY3K6nnw9GVvHI
	KbLMaTGZSmCQXFtCbPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKoY-0060H4-0K; Thu, 08 Sep 2022 16:55:42 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKoT-0060E6-BZ
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 16:55:40 +0000
Received: by mail-ej1-x636.google.com with SMTP id fy31so39508809ejc.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 09:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=WVk386p7qo/YrRI0NB7C32vEp7ZyPMsdmpyHV3ZhCZc=;
        b=AHHsE1Fp27xeXS/MefPefHDudKeR8RS2EtGUNsoF+Bx0q/b5rnw/Nzndm8jZ4sBAYx
         HEfQ9tZr0pjp9cf0tAeFD8oXL9aSVPtZHoFMzjN/HXhN9aZ4umpUTeJXB4GkZGE4kHFt
         6XUjZuLba2vMe0IvfoiyYH/meIrSn64M87fjtkJo2cMd3J2PpifaB7NwU0sxflf5PXbm
         lnosKLDzlO+wOr5ZdMmrRRbnaXYQj4P8GAaZB3wvHNdsfqwruhRTueVqKMjn9F+7uBCf
         5U88Tk09nOtxneecewTjPTJsj5DDbRvnwhFZFZPteS33MQMWJ3DI5+RkClPCFbnz3HDs
         1j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WVk386p7qo/YrRI0NB7C32vEp7ZyPMsdmpyHV3ZhCZc=;
        b=68dUhSdkvOgXWbT+jIC5LtCvvmd05c4M0zG7fOGoOorxRReoeSojNUbQqrUohak9Pm
         bn6WFI8sGVhpiT1dUmBZV0xtoY9r0fxgEjPjDp3SWsBnMSZR4Px/gbxy4Zwpv2BW1wSG
         rWDkpXdJItKtUz1Y2JoeoJVGosB5zKei4TV71D0oXmQ7kTN3tVz4Nj3QDthRDIi3iPx5
         etLeLzsRxj6XghGzY8lcUDPxissyp/qQdoSzFkqyiLWfw/fM21mGnz98/KCObwBE/0pZ
         b/zfoAg2u01mLM9z9ExLcuLfpVMvhaVLr9NZxwPcBEZ5nWs6lw+Y9roocyreU+bYWJyQ
         CqgA==
X-Gm-Message-State: ACgBeo1PsCI0UWUp8JifV8SUi8Ov74pDU1HgLY5ce98O9lwcpI9XK8A4
	ekUciTMrm9yPAQgMgjt7uU+lGQ==
X-Google-Smtp-Source: AA6agR4jYxyOu4fdWJWL85z+ukeS5EpTx01kPFtRQEd8tQg5RMdWEGztm9SOP7iXLkDMJRsTHoCYkA==
X-Received: by 2002:a17:907:6eac:b0:76e:e69d:edce with SMTP id sh44-20020a1709076eac00b0076ee69dedcemr6386947ejc.256.1662656135044;
        Thu, 08 Sep 2022 09:55:35 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id k18-20020a17090632d200b007778c9b7629sm645472ejk.34.2022.09.08.09.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 09:55:34 -0700 (PDT)
Date: Thu, 8 Sep 2022 18:55:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	mchitale@ventanamicro.com
Subject: Re: [PATCH v2 2/4] riscv: Introduce support for defining instructions
Message-ID: <20220908165533.5mohd76rydgzsbz2@kamzik>
References: <20220831172500.752195-1-ajones@ventanamicro.com>
 <20220831172500.752195-3-ajones@ventanamicro.com>
 <3006889.o7ts2hSHzF@diego>
 <CAAhSdy0yiYZFhcxvDr22h1+NWgQAc-APhZfErdfgcHD1kMosfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0yiYZFhcxvDr22h1+NWgQAc-APhZfErdfgcHD1kMosfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_095537_435282_4D57E8B4 
X-CRM114-Status: GOOD (  32.22  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 08, 2022 at 09:33:15PM +0530, Anup Patel wrote:
> On Thu, Sep 8, 2022 at 9:19 PM Heiko St=FCbner <heiko@sntech.de> wrote:
> >
> > Am Mittwoch, 31. August 2022, 19:24:58 CEST schrieb Andrew Jones:
> > > When compiling with toolchains that haven't yet been taught about
> > > new instructions we need to encode them ourselves. Create a new file
> > > where support for instruction definitions will evolve. We initiate
> > > the file with a macro called INSN_R(), which implements the R-type
> > > instruction encoding. INSN_R() will use the assembler's .insn
> > > directive when available, which should give the assembler a chance
> > > to do some validation. When .insn is not available we fall back to
> > > manual encoding.
> > >
> > > Not only should using instruction encoding macros improve readability
> > > and maintainability of code over the alternative of inserting
> > > instructions directly (e.g. '.word 0xc0de'), but we should also gain
> > > potential for more optimized code after compilation because the
> > > compiler will have control over the input and output registers used.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > > ---
> > >  arch/riscv/Kconfig                |  3 ++
> > >  arch/riscv/include/asm/insn-def.h | 86 +++++++++++++++++++++++++++++=
++
> > >  2 files changed, 89 insertions(+)
> > >  create mode 100644 arch/riscv/include/asm/insn-def.h
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index ed66c31e4655..f8f3b316b838 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -227,6 +227,9 @@ config RISCV_DMA_NONCOHERENT
> > >       select ARCH_HAS_SETUP_DMA_OPS
> > >       select DMA_DIRECT_REMAP
> > >
> > > +config AS_HAS_INSN
> > > +     def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(=
comma) t0$(comma) zero)
> > > +
> > >  source "arch/riscv/Kconfig.socs"
> > >  source "arch/riscv/Kconfig.erratas"
> > >
> > > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/a=
sm/insn-def.h
> > > new file mode 100644
> > > index 000000000000..2dcd1d4781bf
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/insn-def.h
> > > @@ -0,0 +1,86 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +
> > > +#ifndef __ASM_INSN_DEF_H
> > > +#define __ASM_INSN_DEF_H
> > > +
> > > +#include <asm/asm.h>
> > > +
> > > +#define INSN_R_FUNC7_SHIFT           25
> > > +#define INSN_R_RS2_SHIFT             20
> > > +#define INSN_R_RS1_SHIFT             15
> > > +#define INSN_R_FUNC3_SHIFT           12
> > > +#define INSN_R_RD_SHIFT                       7
> > > +#define INSN_R_OPCODE_SHIFT           0
> > > +
> > > +#ifdef __ASSEMBLY__
> > > +
> > > +#ifdef CONFIG_AS_HAS_INSN
> > > +
> > > +     .macro insn_r, opcode, func3, func7, rd, rs1, rs2
> > > +     .insn   r \opcode, \func3, \func7, \rd, \rs1, \rs2
> > > +     .endm
> > > +
> > > +#else
> > > +
> > > +#include <asm/gpr-num.h>
> > > +
> > > +     .macro insn_r, opcode, func3, func7, rd, rs1, rs2
> > > +     .4byte  ((\opcode << INSN_R_OPCODE_SHIFT) |             \
> > > +              (\func3 << INSN_R_FUNC3_SHIFT) |               \
> > > +              (\func7 << INSN_R_FUNC7_SHIFT) |               \
> > > +              (.L__gpr_num_\rd << INSN_R_RD_SHIFT) |         \
> > > +              (.L__gpr_num_\rs1 << INSN_R_RS1_SHIFT) |       \
> > > +              (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
> > > +     .endm
> > > +
> > > +#endif
> > > +
> > > +#define INSN_R(...)  insn_r __VA_ARGS__
> > > +
> > > +#else /* ! __ASSEMBLY__ */
> > > +
> > > +#ifdef CONFIG_AS_HAS_INSN
> > > +
> > > +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)   \
> > > +     ".insn  r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " =
rs2 "\n"
> > > +
> > > +#else
> > > +
> > > +#include <linux/stringify.h>
> > > +#include <asm/gpr-num.h>
> > > +
> > > +#define DEFINE_INSN_R                                               =
         \
> > > +     __DEFINE_ASM_GPR_NUMS                                          =
 \
> > > +"    .macro insn_r, opcode, func3, func7, rd, rs1, rs2\n"           =
 \
> > > +"    .4byte  ((\\opcode << " __stringify(INSN_R_OPCODE_SHIFT) ") |" =
 \
> > > +"             (\\func3 << " __stringify(INSN_R_FUNC3_SHIFT) ") |"   =
 \
> > > +"             (\\func7 << " __stringify(INSN_R_FUNC7_SHIFT) ") |"   =
 \
> > > +"             (.L__gpr_num_\\rd << " __stringify(INSN_R_RD_SHIFT) ")=
 |"    \
> > > +"             (.L__gpr_num_\\rs1 << " __stringify(INSN_R_RS1_SHIFT) =
") |"  \
> > > +"             (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) =
"))\n" \
> > > +"    .endm\n"
> > > +
> > > +#define UNDEFINE_INSN_R                                             =
         \
> > > +"    .purgem insn_r\n"
> > > +
> > > +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)                  =
 \
> > > +     DEFINE_INSN_R                                                  =
 \
> > > +     "insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs=
2 "\n" \
> > > +     UNDEFINE_INSN_R
> > > +
> > > +#endif
> > > +
> > > +#endif /* ! __ASSEMBLY__ */
> > > +
> > > +#define OPCODE(v)    __ASM_STR(v)
> > > +#define FUNC3(v)     __ASM_STR(v)
> > > +#define FUNC7(v)     __ASM_STR(v)
> > > +#define RD(v)                __ASM_STR(v)
> > > +#define RS1(v)               __ASM_STR(v)
> > > +#define RS2(v)               __ASM_STR(v)
> >
> > you might want some sort of prefix here
> >         RISCV_RS1(v) ?
> >
> > While trying to adapt this for the cmo stuff I ran into the issue
> > of bpf complaining that "IMM" is already defined there.
> >
> > And names above are generic enough that these also
> > might conflict with other stuff.
> =

> I can update the KVM RISC-V queue but I suggest to
> use a smaller prefix. Maybe RV_xyz() ?

Ack and thanks for doing the update.

drew

> =

> Regards,
> Anup
> =

> >
> >
> >
> >
> > > +#define __REG(v)     __ASM_STR(x ## v)
> > > +#define __RD(v)              __REG(v)
> > > +#define __RS1(v)     __REG(v)
> > > +#define __RS2(v)     __REG(v)
> > > +
> > > +#endif /* __ASM_INSN_DEF_H */
> > >
> >
> >
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
