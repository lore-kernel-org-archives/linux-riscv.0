Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B92C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwPivTctaZKrxcipLHoglSrbFUYSp5cJoCa4iF1jtFI=; b=TVct40btDb3/a9
	yHmSddHsFVquEI8nE30bSFvPSeb1U6OycjaLfviioZ+w0B4QqzWTKDKxJbAIXWmdJ88JbhQP8v/KR
	SceOykMXkwAwh4GL3uGc1lUQ2aU5s6BG/jYwHnEX7kD+9Qtyk6OPX4j8TzV0K6YxP5mVa4f8hvkrM
	mcaXASjfEZI+yEcOr18HOxQJ3TGaQiIU0ITPE9+vRYQ7lq3A0mj/WgVHa7YedWkP9TwB61BpUgOnu
	2zlPSBEolZbEJOGRaSZmBIPFIXIWPhDi/UTrYiIXH4uiE+mn3PzHEA1Phm8u8ceuHpZVL5ZZoBOZ6
	DnBK8f5CGBuHKXimgWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofkOe-00AACq-K0; Tue, 04 Oct 2022 16:03:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofkOa-00AAC4-U7
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 16:03:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77B94614D4
	for <linux-riscv@lists.infradead.org>; Tue,  4 Oct 2022 16:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1748C43145
	for <linux-riscv@lists.infradead.org>; Tue,  4 Oct 2022 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664899426;
	bh=XWU1JKRC7NI+h/w8R5x8piuwrX888p+n72p/dEpZdpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NUSztFFLQhx1jhQbyQ6ap7QSuKAprJQkxlYqYCKMGb9TsvVDEYnL+m2CFXOda+xa4
	 psRVXPHxnpnyo47vrMLnJpf9RpsY0+iBURTyNtt1O/75aMsjrcb3Wl19VIB2z8AH0S
	 hMnHRIGot9G+07Huk2XrG+ekPoRNQFfywoZhrUbkES3Vb5eU1LdoN7LWkax5ERdkHz
	 Iis6gmPxfjU2jXWjSr+haR8ZesSUYt0t8xSHcuLDasvmSXfU/uib65rDYWCmep6Qez
	 EioJamBCd31GzW/6pCkcqqt9JVeioo4WfKfBbUbAjKEx9b68kd5btV4E87+NMJ7JyR
	 FKK49GT95z75w==
Received: by mail-oi1-f179.google.com with SMTP id q10so14857199oib.5
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 09:03:46 -0700 (PDT)
X-Gm-Message-State: ACrzQf1+SK5im3qbrpLB/LtyV1/zQE+TyC5R+ZrOZmhk8gxjss2sLt28
	h6w3IfSnaa2rPT+l+YBrSfJzvU6NHHLYv5f6cJw=
X-Google-Smtp-Source: AMsMyM44JllKE7LW8zT6nJCzI4eCn5+eHPo9ip6/7voQYhkNJrueGVFrnyFaLQRPe2Awh599kFSXJo2iM0H65m8g+SA=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr237126oiw.112.1664899425880; Tue, 04
 Oct 2022 09:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221003102921.3973-1-jszhang@kernel.org> <20221003102921.3973-5-jszhang@kernel.org>
In-Reply-To: <20221003102921.3973-5-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 5 Oct 2022 00:03:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQckQaq1c-P6dJ5O3S6fmMQ2-uxNhQHfn+o=W7bphZg6g@mail.gmail.com>
Message-ID: <CAJF2gTQckQaq1c-P6dJ5O3S6fmMQ2-uxNhQHfn+o=W7bphZg6g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: entry: consolidate general regs saving/restoring
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_090349_091786_39104A66 
X-CRM114-Status: GOOD (  16.75  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Oct 3, 2022 at 6:39 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Consolidate the saving/restoring GPs(except zero, ra, sp, gp and tp) into
> save_from_x5_to_x31/restore_from_x5_to_x31 macros.
>
> No functional change intended.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/asm.h   | 63 +++++++++++++++++++++++++
>  arch/riscv/kernel/entry.S      | 84 ++--------------------------------
>  arch/riscv/kernel/mcount-dyn.S | 56 +----------------------
>  3 files changed, 68 insertions(+), 135 deletions(-)
>
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 1b471ff73178..bf5247aa317d 100644
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
> @@ -80,6 +81,68 @@
>         .endr
>  .endm
>
> +       /* save all GPs except zero, ra, sp, gp and tp */
> +       .macro save_from_x5_to_x31
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
> +       /* restore all GPs except zero, ra, sp, gp and tp */
> +       .macro restore_from_x5_to_x31
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
> index 48ed1df7a792..7ba3826dde84 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -41,33 +41,7 @@ _save_context:
>         addi sp, sp, -(PT_SIZE_ON_STACK)
>         REG_S x1,  PT_RA(sp)
>         REG_S x3,  PT_GP(sp)
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
> +       save_from_x5_to_x31
>
>         /*
>          * Disable user-mode memory access as it should only be set in the
> @@ -184,33 +158,7 @@ ENTRY(ret_from_exception)
>         REG_L x1,  PT_RA(sp)
>         REG_L x3,  PT_GP(sp)
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
> +       restore_from_x5_to_x31
>
>         REG_L x2,  PT_SP(sp)
>
> @@ -238,33 +186,7 @@ ENTRY(handle_kernel_stack_overflow)
>         //save context to overflow stack
>         REG_S x1,  PT_RA(sp)
>         REG_S x3,  PT_GP(sp)
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
> +       save_from_x5_to_x31
>
>         REG_L s0, TASK_TI_KERNEL_SP(tp)
>         csrr s1, CSR_STATUS
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index d171eca623b6..040d098279a9 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -70,33 +70,7 @@
>         REG_S x2,  PT_SP(sp)
>         REG_S x3,  PT_GP(sp)
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
> +       save_from_x5_to_x31
>         .endm
>
>         .macro RESTORE_ALL
> @@ -108,33 +82,7 @@
>         REG_L x2,  PT_SP(sp)
>         REG_L x3,  PT_GP(sp)
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
> +       restore_from_x5_to_x31
>
>         addi    sp, sp, PT_SIZE_ON_STACK
>         addi    sp, sp, SZREG
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
