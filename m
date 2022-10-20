Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D796C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 02:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qQPGjorYXHhcsiiup+FjNOi8Jy06+iPIswwozLVtS8=; b=he87nAs/PzWSwl
	0jEzxyXPMTC7yIgVWi57JgVETvGpXK0dHfx4BfYtHDEptiGPrH25pIHV/MBJSR/bHx3DOmg1s2Ts9
	Tof4wzoGSQCxlEBORAFljdVUFUfWvnDT+dHB6M1UaFQsK5o5hbOGGIzrBKP8xcyRrAl6Zv9PkdlLB
	CaUGB0t6qQukx/vleMseygU4noDDZLjLzyalJ/EbILJIqM/bV+TZ4dnXse3FU6gr5sTXuUCwa9Y5K
	f//0RJZLfbbtwqt1Lc3eftBMReVCGlYQLhEVCa6Fq7P7VNZelyREiy5NmWDsjsIIBKIe9T2At+O1i
	iWZy5lF8a2l9f3i1GkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olL7L-009QHo-2a; Thu, 20 Oct 2022 02:17:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olL7I-009QGk-Iu
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 02:17:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E50296199F
	for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 02:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8799C433B5
	for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 02:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666232220;
	bh=QcE4a6lyZTBOYzdGsCVBjzAQTInHnjccgas3h1EUBDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RetYFmJ1PNbTT866t2UgZoRo/gvjP8q0801coX6/uHBVq1fKZXk4xVeRcPBxAdKcp
	 upf30on6Ze6QWx2WJmj3pVzPog/2znDY/qlr3fe1u9a04CcPnUOlooLtXqTj/092cE
	 CiTslVTLaB9rTWSiJlhlbR+LzM3QmFSDSgbUMZhVrw1EIA/w+xLDN1aF1TiX3kc0Vt
	 OjVF9XG1bNwjUeYYRXSUxV6Dv6l2+V49HO3UIu5f5kMdl+oxhlW/dZDJMVzEy+W4Kp
	 2obtNAkbe4HV6RneFeZ6Bai/KzKCWn7Uxruflkv2Zp7IVQG8mkbjPQZE4WsGAjswOj
	 u7KzaQwu29vIQ==
Received: by mail-oi1-f169.google.com with SMTP id w74so21414421oie.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 19:17:00 -0700 (PDT)
X-Gm-Message-State: ACrzQf16YHRV7truAFF3QR3mnPSOu+ZwoLNeTkEHVHzg1Z8AK1csFRxz
	kkZJ9UIW2SygL9iE5VVxT8ToKB84bjRPnFjfXBo=
X-Google-Smtp-Source: AMsMyM45GSUJ/pcnnwCagrJgMES7QTECVvKHr6V5A4ld9tsms33NriVNc2MFbIPxl6TfE8Sjx2mcJqBZjmYZ1Ykc49w=
X-Received: by 2002:a05:6808:14cf:b0:355:5204:dd81 with SMTP id
 f15-20020a05680814cf00b003555204dd81mr5611016oiw.112.1666232219837; Wed, 19
 Oct 2022 19:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221019154727.2395-1-jszhang@kernel.org>
In-Reply-To: <20221019154727.2395-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Oct 2022 10:16:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSHH69B+KAOJdpLvQdGuhS1nJ+GnW2hVCb+e+8nrnaJ7Q@mail.gmail.com>
Message-ID: <CAJF2gTSHH69B+KAOJdpLvQdGuhS1nJ+GnW2hVCb+e+8nrnaJ7Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_191704_743968_5B3435BF 
X-CRM114-Status: GOOD (  21.39  )
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

On Wed, Oct 19, 2022 at 11:57 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Currently, when detecting vmap stack overflow, riscv firstly switches
> to the so called shadow stack, then use this shadow stack to call the
> get_overflow_stack() to get the overflow stack. However, there's
> a race here if two or more harts use the same shadow stack at the same
> time.
>
> To solve this race, we introduce spin_shadow_stack atomic var, which
> will make the shadow stack usage serialized.
>
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/entry.S | 4 ++++
>  arch/riscv/kernel/traps.c | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index b9eda3fcbd6d..7b924b16792b 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
>
>  #ifdef CONFIG_VMAP_STACK
>  handle_kernel_stack_overflow:
> +1:     la sp, spin_shadow_stack
> +       amoswap.w sp, sp, (sp)
If CONFIG_64BIT=y, it would be broken. Because we only hold 32bit of
the sp, and the next loop would get the wrong sp value of
&spin_shadow_stack.
Here is the correction.
-----
diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 1b471ff73178..acf563072b8b 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -23,6 +23,7 @@
 #define REG_L          __REG_SEL(ld, lw)
 #define REG_S          __REG_SEL(sd, sw)
 #define REG_SC         __REG_SEL(sc.d, sc.w)
+#define REG_AMOSWAP    __REG_SEL(amoswap.d, amoswap.w)
 #define REG_ASM                __REG_SEL(.dword, .word)
 #define SZREG          __REG_SEL(8, 4)
 #define LGREG          __REG_SEL(3, 2)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..ea6b78dac739 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -404,6 +404,10 @@ handle_syscall_trace_exit:

 #ifdef CONFIG_VMAP_STACK
 handle_kernel_stack_overflow:
+1:     la sp, spin_shadow_stack
+       /* Reuse the address as the spin value, so they must be all
XLEN's width. */
+       REG_AMOSWAP sp, sp, (sp)
+       bnez sp, 1b
+
        la sp, shadow_stack
        addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f3e96d60a2ff..9e6cc0d63833 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
                OVERFLOW_STACK_SIZE;
 }

+unsigned long spin_shadow_stack = 0;
+
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
        unsigned long tsk_stk = (unsigned long)current->stack;
        unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);

+       smp_store_release(&spin_shadow_stack, 0);
+
        console_verbose();

        pr_emerg("Insufficient stack space to handle exception!\n");

> +       bnez sp, 1b
> +
>         la sp, shadow_stack
>         addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index f3e96d60a2ff..88a54947dffb 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
>                 OVERFLOW_STACK_SIZE;
>  }
>
> +atomic_t spin_shadow_stack;
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>         unsigned long tsk_stk = (unsigned long)current->stack;
>         unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>
> +       atomic_set_release(&spin_shadow_stack, 0);
> +
>         console_verbose();
>
>         pr_emerg("Insufficient stack space to handle exception!\n");
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
