Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D844C6FA82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 23:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LicuEtkAHA4/9ziFokgQHqtf2f0wuZsUB0vMfOzxjDw=; b=EPAuzC8LwwkFkk
	uZs7rwv/EJKx4PJ10Aaf2qt///KFgLUsEIZHPmExC7k3WD38/BEAyZgANZD2nxFRQCMVBBTo+IMiV
	3grTUlsmrXTfJv9GqQGvoYc2z3pa3d510Zva4FmLRygqoFxDqX2AfXE6Ljw+yzPlYPZscHlULhRIL
	uLKm8ltCQ87QCY48jyAuzvxfCIJTK8CaTdJctkHaSwCLxVZeW6i/EIPXXWpneFh9Ld3A9PRapT8hm
	w/PvOPhToLkIGLakZMoAQVJ3E6L7Byvk8BSP96uX2OdW8FUjAB+emI+onVWOQ3BVqMeuclF0WSozY
	psVyGWXFzjsx5iSGR5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocb4h-000Cp3-Bg; Sun, 25 Sep 2022 23:30:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocb4e-000Co4-Jw
	for linux-riscv@lists.infradead.org; Sun, 25 Sep 2022 23:30:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12490612AB
	for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 23:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B346C433B5
	for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 23:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664148611;
	bh=0dkLfkpN4bl6+XUgOrEzocRDFO2GLiA4mip+arTaoJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QQSkMZYZUkGzP15UheuDVf6q6ELa7I+MaMsKTleqTBELVuJF0HsUlZ0E+QO7dCAUZ
	 SdzVfxXScTZd1iY4dT/g6SJbI3QZr0hQqMPLyvz3dONRCiXxbOhUhZe5sYfnXx4rF3
	 PWGrHS4tdqFLkX1p9Q+o10b+/J4iusUrPzIjqep3G8zGYDAGnkOyrRyxgk/dd9aI95
	 tuae4uV9bxFs8WiYaPmfq3rkuDFoqwAvMBDNf9VXCmurtDDN/d2jWF/5auc7ORZHGp
	 BtDw2e9JiYNSK+msY4nW0ePXf6zdA4g7JfcX5uAfPL8QoYd5SfHzsi30IWORNE/6Px
	 Y0ELg+0zECppw==
Received: by mail-oi1-f169.google.com with SMTP id n83so6391884oif.11
        for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 16:30:11 -0700 (PDT)
X-Gm-Message-State: ACrzQf0RWQoa5jdJVqIO6ljIrNY8rX3Su6Xl5QCfS+69GbnuBQKVVAzm
	yYjTqLbcFjr1lmKaUb4Xj48nthNIxpwreExsv+o=
X-Google-Smtp-Source: AMsMyM78H8xRByyG0Kx8aSGOYIjP57Juz7vq8m3nhivoMNVDUsp0tW0/ImKxj4XFvVU/79/z7jAP6Vux6xHUVeayUiU=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr13923041oiw.112.1664148610641; Sun, 25
 Sep 2022 16:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220925175356.681-1-jszhang@kernel.org> <20220925175356.681-5-jszhang@kernel.org>
In-Reply-To: <20220925175356.681-5-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 26 Sep 2022 07:29:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT+NuLOfzOqm2bLy4-AK7z1M-nb17zgQKVqyz9uxAg8LQ@mail.gmail.com>
Message-ID: <CAJF2gTT+NuLOfzOqm2bLy4-AK7z1M-nb17zgQKVqyz9uxAg8LQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: entry: consolidate general regs saving into save_gp
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_163012_755705_83542BBD 
X-CRM114-Status: GOOD (  19.09  )
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

Acked-by: Guo Ren <kernel.org>

For the save & restore pair, I also suggest adding restore_gp.

On Mon, Sep 26, 2022 at 2:03 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Consolidate the saving GPs(except sp and tp into save_gp macro.
> No functional change.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/entry.S | 85 ++++++++++++++-------------------------
>  1 file changed, 31 insertions(+), 54 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 442d93beffcf..04e11d257ad6 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -14,31 +14,8 @@
>  #include <asm/asm-offsets.h>
>  #include <asm/errata_list.h>
>
> -ENTRY(handle_exception)
> -       /*
> -        * If coming from userspace, preserve the user thread pointer and load
> -        * the kernel thread pointer.  If we came from the kernel, the scratch
> -        * register will contain 0, and we should continue on the current TP.
> -        */
> -       csrrw tp, CSR_SCRATCH, tp
> -       bnez tp, _save_context
> -
> -_restore_kernel_tpsp:
> -       csrr tp, CSR_SCRATCH
> -       REG_S sp, TASK_TI_KERNEL_SP(tp)
> -
> -#ifdef CONFIG_VMAP_STACK
> -       addi sp, sp, -(PT_SIZE_ON_STACK)
> -       srli sp, sp, THREAD_SHIFT
> -       andi sp, sp, 0x1
> -       bnez sp, handle_kernel_stack_overflow
> -       REG_L sp, TASK_TI_KERNEL_SP(tp)
> -#endif
> -
> -_save_context:
> -       REG_S sp, TASK_TI_USER_SP(tp)
> -       REG_L sp, TASK_TI_KERNEL_SP(tp)
> -       addi sp, sp, -(PT_SIZE_ON_STACK)
> +       /* save all GPs except sp and tp */
> +       .macro save_gp
>         REG_S x1,  PT_RA(sp)
>         REG_S x3,  PT_GP(sp)
>         REG_S x5,  PT_T0(sp)
> @@ -68,6 +45,34 @@ _save_context:
>         REG_S x29, PT_T4(sp)
>         REG_S x30, PT_T5(sp)
>         REG_S x31, PT_T6(sp)
> +       .endm
> +
> +ENTRY(handle_exception)
> +       /*
> +        * If coming from userspace, preserve the user thread pointer and load
> +        * the kernel thread pointer.  If we came from the kernel, the scratch
> +        * register will contain 0, and we should continue on the current TP.
> +        */
> +       csrrw tp, CSR_SCRATCH, tp
> +       bnez tp, _save_context
> +
> +_restore_kernel_tpsp:
> +       csrr tp, CSR_SCRATCH
> +       REG_S sp, TASK_TI_KERNEL_SP(tp)
> +
> +#ifdef CONFIG_VMAP_STACK
> +       addi sp, sp, -(PT_SIZE_ON_STACK)
> +       srli sp, sp, THREAD_SHIFT
> +       andi sp, sp, 0x1
> +       bnez sp, handle_kernel_stack_overflow
> +       REG_L sp, TASK_TI_KERNEL_SP(tp)
> +#endif
> +
> +_save_context:
> +       REG_S sp, TASK_TI_USER_SP(tp)
> +       REG_L sp, TASK_TI_KERNEL_SP(tp)
> +       addi sp, sp, -(PT_SIZE_ON_STACK)
> +       save_gp
>
>         /*
>          * Disable user-mode memory access as it should only be set in the
> @@ -234,35 +239,7 @@ ENTRY(handle_kernel_stack_overflow)
>         addi sp, sp, -(PT_SIZE_ON_STACK)
>
>         //save context to overflow stack
> -       REG_S x1,  PT_RA(sp)
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
