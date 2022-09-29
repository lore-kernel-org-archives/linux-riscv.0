Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32481C04A95
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 03:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecogIGScakFhmR8ww64es64cl505OnTo3QUEOnLZ9qs=; b=TZsrsrVvahAxUT
	JmkFtrH1uOqNtmnW4Mw3zooGMAeiVCHVluWz6lZh/2KZ905CTJo7aXAkcpytq2JfM3801FILQIqjK
	qwUzvNImCM9pNqU6RXSblbE3YNz8rlAJ28qGF1MFlGguBKP7j841ffk3842P3FDSjOukhhjGSXLMF
	y5NbPHuM8xeS+N/MDk5BApTckloU5kA1xM4xhY2wwVCUvdCWjakjTu5PnHX7FvAyqEUMvlxN27olo
	ZXVGvcMfNiduJWvEgq7c4dysMgkWd+TV6bgvm7Owk22yQBx/7BJuzAq1pa4j6oz2tYM4OSIofE4G2
	NaBvAQWRGjZ1hB8LFV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odkhl-0017CW-Eb; Thu, 29 Sep 2022 03:59:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odkhh-0017BN-AR
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 03:59:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A48F3B8232B
	for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 03:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D857BC43141
	for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 03:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664423953;
	bh=XOD2tRg3K+Mi1S8FGjXss48nG6ZOBDiplumgb8d5atI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vQL/1FfWBEQBWWjd6iue8tl1RqG5V6gjV+VdRwdBJgqHDinR36dkBW+7sVDgfrOHm
	 yt0582JgT2RpaXJzZgGlu67LiM8JWiK9v2Mbgu24aSsmsPI0q7JrMaoZm4Fm0HIN3S
	 IVANIK3WPtcuZw1+ztVK1EeA1q+bJF+Y94U8e+nt57rslWH6JhdMaSdgc50W45WToB
	 wjwcih7/OnVRf18sIp1Mp4FYtATbaw8ev1wdaSsMz3u0wU9kAjGh/wIrM4ti/oCqDu
	 lk5b/1aA0H6tvJamSFNai59k0fd9HixV7Z+BE2KI0bjToBkizo81HfOCvbZ+dpSxFb
	 SiZ+aweC4wd0w==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13175b79807so432918fac.9
        for <linux-riscv@lists.infradead.org>; Wed, 28 Sep 2022 20:59:13 -0700 (PDT)
X-Gm-Message-State: ACrzQf1FA6UL3yRB64NHLmq1+7C2mWPth5ylcq4djWgBMHlpnkLKwq8D
	BLmbX1amhBdBdfvzBtrFZFt84DsjIdksdCamYNE=
X-Google-Smtp-Source: AMsMyM7FE/g6U6bfnW4OnoVKQxP4lrWveOlhh3IhnehLt0qZPyatLHOEhEtYnl/UbBvNB23SjsokJzZJgx4XUazQV00=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr7072889oap.19.1664423952849; Wed, 28 Sep
 2022 20:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220928162007.3791-1-jszhang@kernel.org> <20220928162007.3791-5-jszhang@kernel.org>
In-Reply-To: <20220928162007.3791-5-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 29 Sep 2022 11:59:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>
Message-ID: <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: entry: consolidate general regs saving into save_gp
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_205917_680261_656F24AF 
X-CRM114-Status: GOOD (  17.62  )
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

On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Consolidate the saving/restoring GPs(except ra, sp and tp) into
> save_gp/restore_gp macro.
>
> No functional change intended.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/asm.h   | 65 +++++++++++++++++++++++++
>  arch/riscv/kernel/entry.S      | 87 ++--------------------------------
>  arch/riscv/kernel/mcount-dyn.S | 58 +----------------------
>  3 files changed, 70 insertions(+), 140 deletions(-)
>
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 1b471ff73178..2f3b49536e9d 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -68,6 +68,7 @@
>  #endif
>
>  #ifdef __ASSEMBLY__
> +#include <asm/asm-offsets.h>
>
>  /* Common assembly source macros */
>
> @@ -80,6 +81,70 @@
>         .endr
>  .endm
>
> +       /* save all GPs except ra, sp and tp */
> +       .macro save_gp
How about leave x3(gp) out of the macro, and define:
.marco save_from_x5_to_x31
.marco restore_from_x5_to_x31

> +       REG_S x3,  PT_GP(sp)
> +       REG_S x5,  PT_T0(sp)
> +       REG_S x6,  PT_T1(sp)
> +       REG_S x7,  PT_T2(sp)
> +       REG_S x8,  PT_S0(sp)
> +       REG_S x9,  PT_S1(sp)
> +       REG_S x10, PT_A0(sp)
> +       REG_S x11, PT_A1(sp)
> +       REG_S x12, PT_A2(sp)
> +       REG_S x13, PT_A3(sp)
> +       REG_S x14, PT_A4(sp)
> +       REG_S x15, PT_A5(sp)
> +       REG_S x16, PT_A6(sp)
> +       REG_S x17, PT_A7(sp)
> +       REG_S x18, PT_S2(sp)
> +       REG_S x19, PT_S3(sp)
> +       REG_S x20, PT_S4(sp)
> +       REG_S x21, PT_S5(sp)
> +       REG_S x22, PT_S6(sp)
> +       REG_S x23, PT_S7(sp)
> +       REG_S x24, PT_S8(sp)
> +       REG_S x25, PT_S9(sp)
> +       REG_S x26, PT_S10(sp)
> +       REG_S x27, PT_S11(sp)
> +       REG_S x28, PT_T3(sp)
> +       REG_S x29, PT_T4(sp)
> +       REG_S x30, PT_T5(sp)
> +       REG_S x31, PT_T6(sp)
> +       .endm
> +
> +       /* restore all GPs except ra, sp and tp */
> +       .macro restore_gp
> +       REG_L x3,  PT_GP(sp)
> +       REG_L x5,  PT_T0(sp)
> +       REG_L x6,  PT_T1(sp)
> +       REG_L x7,  PT_T2(sp)
> +       REG_L x8,  PT_S0(sp)
> +       REG_L x9,  PT_S1(sp)
> +       REG_L x10, PT_A0(sp)
> +       REG_L x11, PT_A1(sp)
> +       REG_L x12, PT_A2(sp)
> +       REG_L x13, PT_A3(sp)
> +       REG_L x14, PT_A4(sp)
> +       REG_L x15, PT_A5(sp)
> +       REG_L x16, PT_A6(sp)
> +       REG_L x17, PT_A7(sp)
> +       REG_L x18, PT_S2(sp)
> +       REG_L x19, PT_S3(sp)
> +       REG_L x20, PT_S4(sp)
> +       REG_L x21, PT_S5(sp)
> +       REG_L x22, PT_S6(sp)
> +       REG_L x23, PT_S7(sp)
> +       REG_L x24, PT_S8(sp)
> +       REG_L x25, PT_S9(sp)
> +       REG_L x26, PT_S10(sp)
> +       REG_L x27, PT_S11(sp)
> +       REG_L x28, PT_T3(sp)
> +       REG_L x29, PT_T4(sp)
> +       REG_L x30, PT_T5(sp)
> +       REG_L x31, PT_T6(sp)
> +       .endm
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* _ASM_RISCV_ASM_H */
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 5a6171a90d81..a90f17ed2822 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -40,34 +40,7 @@ _save_context:
>         REG_L sp, TASK_TI_KERNEL_SP(tp)
>         addi sp, sp, -(PT_SIZE_ON_STACK)
>         REG_S x1,  PT_RA(sp)
> -       REG_S x3,  PT_GP(sp)
> -       REG_S x5,  PT_T0(sp)
> -       REG_S x6,  PT_T1(sp)
> -       REG_S x7,  PT_T2(sp)
> -       REG_S x8,  PT_S0(sp)
> -       REG_S x9,  PT_S1(sp)
> -       REG_S x10, PT_A0(sp)
> -       REG_S x11, PT_A1(sp)
> -       REG_S x12, PT_A2(sp)
> -       REG_S x13, PT_A3(sp)
> -       REG_S x14, PT_A4(sp)
> -       REG_S x15, PT_A5(sp)
> -       REG_S x16, PT_A6(sp)
> -       REG_S x17, PT_A7(sp)
> -       REG_S x18, PT_S2(sp)
> -       REG_S x19, PT_S3(sp)
> -       REG_S x20, PT_S4(sp)
> -       REG_S x21, PT_S5(sp)
> -       REG_S x22, PT_S6(sp)
> -       REG_S x23, PT_S7(sp)
> -       REG_S x24, PT_S8(sp)
> -       REG_S x25, PT_S9(sp)
> -       REG_S x26, PT_S10(sp)
> -       REG_S x27, PT_S11(sp)
> -       REG_S x28, PT_T3(sp)
> -       REG_S x29, PT_T4(sp)
> -       REG_S x30, PT_T5(sp)
> -       REG_S x31, PT_T6(sp)
> +       save_gp
>
>         /*
>          * Disable user-mode memory access as it should only be set in the
> @@ -182,35 +155,8 @@ ENTRY(ret_from_exception)
>         csrw CSR_STATUS, a0
>
>         REG_L x1,  PT_RA(sp)
> -       REG_L x3,  PT_GP(sp)
>         REG_L x4,  PT_TP(sp)
> -       REG_L x5,  PT_T0(sp)
> -       REG_L x6,  PT_T1(sp)
> -       REG_L x7,  PT_T2(sp)
> -       REG_L x8,  PT_S0(sp)
> -       REG_L x9,  PT_S1(sp)
> -       REG_L x10, PT_A0(sp)
> -       REG_L x11, PT_A1(sp)
> -       REG_L x12, PT_A2(sp)
> -       REG_L x13, PT_A3(sp)
> -       REG_L x14, PT_A4(sp)
> -       REG_L x15, PT_A5(sp)
> -       REG_L x16, PT_A6(sp)
> -       REG_L x17, PT_A7(sp)
> -       REG_L x18, PT_S2(sp)
> -       REG_L x19, PT_S3(sp)
> -       REG_L x20, PT_S4(sp)
> -       REG_L x21, PT_S5(sp)
> -       REG_L x22, PT_S6(sp)
> -       REG_L x23, PT_S7(sp)
> -       REG_L x24, PT_S8(sp)
> -       REG_L x25, PT_S9(sp)
> -       REG_L x26, PT_S10(sp)
> -       REG_L x27, PT_S11(sp)
> -       REG_L x28, PT_T3(sp)
> -       REG_L x29, PT_T4(sp)
> -       REG_L x30, PT_T5(sp)
> -       REG_L x31, PT_T6(sp)
> +       restore_gp
>
>         REG_L x2,  PT_SP(sp)
>
> @@ -237,34 +183,7 @@ ENTRY(handle_kernel_stack_overflow)
>
>         //save context to overflow stack
>         REG_S x1,  PT_RA(sp)
> -       REG_S x3,  PT_GP(sp)
> -       REG_S x5,  PT_T0(sp)
> -       REG_S x6,  PT_T1(sp)
> -       REG_S x7,  PT_T2(sp)
> -       REG_S x8,  PT_S0(sp)
> -       REG_S x9,  PT_S1(sp)
> -       REG_S x10, PT_A0(sp)
> -       REG_S x11, PT_A1(sp)
> -       REG_S x12, PT_A2(sp)
> -       REG_S x13, PT_A3(sp)
> -       REG_S x14, PT_A4(sp)
> -       REG_S x15, PT_A5(sp)
> -       REG_S x16, PT_A6(sp)
> -       REG_S x17, PT_A7(sp)
> -       REG_S x18, PT_S2(sp)
> -       REG_S x19, PT_S3(sp)
> -       REG_S x20, PT_S4(sp)
> -       REG_S x21, PT_S5(sp)
> -       REG_S x22, PT_S6(sp)
> -       REG_S x23, PT_S7(sp)
> -       REG_S x24, PT_S8(sp)
> -       REG_S x25, PT_S9(sp)
> -       REG_S x26, PT_S10(sp)
> -       REG_S x27, PT_S11(sp)
> -       REG_S x28, PT_T3(sp)
> -       REG_S x29, PT_T4(sp)
> -       REG_S x30, PT_T5(sp)
> -       REG_S x31, PT_T6(sp)
> +       save_gp
>
>         REG_L s0, TASK_TI_KERNEL_SP(tp)
>         csrr s1, CSR_STATUS
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index d171eca623b6..1b4b0aecf4f5 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -68,35 +68,8 @@
>         REG_L x1,  PT_EPC(sp)
>
>         REG_S x2,  PT_SP(sp)
> -       REG_S x3,  PT_GP(sp)
>         REG_S x4,  PT_TP(sp)
> -       REG_S x5,  PT_T0(sp)
> -       REG_S x6,  PT_T1(sp)
> -       REG_S x7,  PT_T2(sp)
> -       REG_S x8,  PT_S0(sp)
> -       REG_S x9,  PT_S1(sp)
> -       REG_S x10, PT_A0(sp)
> -       REG_S x11, PT_A1(sp)
> -       REG_S x12, PT_A2(sp)
> -       REG_S x13, PT_A3(sp)
> -       REG_S x14, PT_A4(sp)
> -       REG_S x15, PT_A5(sp)
> -       REG_S x16, PT_A6(sp)
> -       REG_S x17, PT_A7(sp)
> -       REG_S x18, PT_S2(sp)
> -       REG_S x19, PT_S3(sp)
> -       REG_S x20, PT_S4(sp)
> -       REG_S x21, PT_S5(sp)
> -       REG_S x22, PT_S6(sp)
> -       REG_S x23, PT_S7(sp)
> -       REG_S x24, PT_S8(sp)
> -       REG_S x25, PT_S9(sp)
> -       REG_S x26, PT_S10(sp)
> -       REG_S x27, PT_S11(sp)
> -       REG_S x28, PT_T3(sp)
> -       REG_S x29, PT_T4(sp)
> -       REG_S x30, PT_T5(sp)
> -       REG_S x31, PT_T6(sp)
> +       save_gp
>         .endm
>
>         .macro RESTORE_ALL
> @@ -106,35 +79,8 @@
>         addi    sp, sp, -PT_SIZE_ON_STACK
>         REG_L x1,  PT_EPC(sp)
>         REG_L x2,  PT_SP(sp)
> -       REG_L x3,  PT_GP(sp)
>         REG_L x4,  PT_TP(sp)
> -       REG_L x5,  PT_T0(sp)
> -       REG_L x6,  PT_T1(sp)
> -       REG_L x7,  PT_T2(sp)
> -       REG_L x8,  PT_S0(sp)
> -       REG_L x9,  PT_S1(sp)
> -       REG_L x10, PT_A0(sp)
> -       REG_L x11, PT_A1(sp)
> -       REG_L x12, PT_A2(sp)
> -       REG_L x13, PT_A3(sp)
> -       REG_L x14, PT_A4(sp)
> -       REG_L x15, PT_A5(sp)
> -       REG_L x16, PT_A6(sp)
> -       REG_L x17, PT_A7(sp)
> -       REG_L x18, PT_S2(sp)
> -       REG_L x19, PT_S3(sp)
> -       REG_L x20, PT_S4(sp)
> -       REG_L x21, PT_S5(sp)
> -       REG_L x22, PT_S6(sp)
> -       REG_L x23, PT_S7(sp)
> -       REG_L x24, PT_S8(sp)
> -       REG_L x25, PT_S9(sp)
> -       REG_L x26, PT_S10(sp)
> -       REG_L x27, PT_S11(sp)
> -       REG_L x28, PT_T3(sp)
> -       REG_L x29, PT_T4(sp)
> -       REG_L x30, PT_T5(sp)
> -       REG_L x31, PT_T6(sp)
> +       restore_gp
>
>         addi    sp, sp, PT_SIZE_ON_STACK
>         addi    sp, sp, SZREG
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
