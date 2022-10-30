Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FD3ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0W5sd/QZF6tthDsLR7D6zegLPk3VANwwnWnV2bkjBE=; b=WOHF1Wu8W2YDOo
	+gJS7kTu6M/CeZLAnfOm7ymTV9i5uoAzN+6agS+GhDGpOT2qHxjWa55naGDxVffWQ64w65K+uKBo6
	QbeF41KmhgoBnAEcKlLchFEB8RxNOHCHM3sWJH91DwrdXgOOScV8+d1gTNpn3rZtDz9qtsi22Befi
	iTcPkojcdZWsGQd76eFdgYBDm48H5vw8sUdv8o8P6rOhuuM6iwOwHXTYXcjaOpoiITFOOIEpLzeqr
	CU7b1IGMUDI4Ph18fJdQ5OmIlstIxPIyEkIdZTVqqkydoW8xfEeWp/g3BZrUrhdDW8lqw7EiRcVad
	C7gHrGec4O1beOoUcMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8IL-00GO3F-Jd; Sun, 30 Oct 2022 13:24:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8II-00GO1R-Sg
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 13:24:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 76BAE60B3C
	for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 13:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60D8C433D6
	for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667136244;
	bh=R5uAAOwfhBbjV6oM76LGmmVk9MxkU7/sTXwusw3/Mxs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a3GKiaC0hK08JreV1E2wvjYIXFxsyC0FotLYKaAMaPxNtqizbDuLeYwFdQS7Dchtt
	 SaqA827YASFLTyHkjIWoAIlSGbzZiqdp+d3GX7cMEnxG5t4MJg1RhqHkmJTkLdeS4c
	 Lf96++REpXouQkDkxJMoaibzFnY3svy2r8Me1PYmgv/tgjnSkhqte8hICQ+UbcEPSH
	 nB6n1YfJ5Lmd6Jg+ZuUnSCjO/7YBA9XWVL91jnjmDMo9AG7Xpc+mWYT7m7vbPRpX81
	 hOklM0gE5GJV0sPE7EUS/TAL+7GbELYtsueIaBz3BDD9buSQ4l0Mu38c1c3arxuJiC
	 We9fPTw8O6+1Q==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-13bd19c3b68so11107040fac.7
        for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 06:24:04 -0700 (PDT)
X-Gm-Message-State: ACrzQf3ZQsb5Zdis+po6+1pBJOiytId3s5z8XBLIxtlZ2wEM6ABfCh+D
	85jcrZ4qAustguuy93RG3epQOVd0FXB8+n+cZ9s=
X-Google-Smtp-Source: AMsMyM6JDTigjpyhc9s9y68ntLbzzQG3iswsqkU6mLrFLhpaBY0LV9z9NUcaBTc40L0yrTXODfGOgaSqyytpO39funI=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr13430439oap.19.1667136243989; Sun, 30
 Oct 2022 06:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221030124517.2370-1-jszhang@kernel.org>
In-Reply-To: <20221030124517.2370-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Oct 2022 21:23:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRPECoPFHXKZZ8bRc27YSYv7z4xkYh+hTmfzmZg8=2Ejg@mail.gmail.com>
Message-ID: <CAJF2gTRPECoPFHXKZZ8bRc27YSYv7z4xkYh+hTmfzmZg8=2Ejg@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: fix race when vmap stack overflow
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_062407_038531_FD17BC3A 
X-CRM114-Status: GOOD (  22.56  )
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

On Sun, Oct 30, 2022 at 8:54 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Currently, when detecting vmap stack overflow, riscv firstly switches
> to the so called shadow stack, then use this shadow stack to call the
> get_overflow_stack() to get the overflow stack. However, there's
> a race here if two or more harts use the same shadow stack at the same
> time.
>
> To solve this race, we introduce spin_shadow_stack atomic var, which
> will be swap between its own address and 0 in atomic way, when the
> var is set, it means the shadow_stack is being used; when the var
> is cleared, it means the shadow_stack isn't being used.
>
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Guo Ren <guoren@kernel.org>
> ---
> Since v2:
>  - use REG_AMOSWAP
>  - add comment to the purpose of smp_store_release()
>
> Since v1:
>  - use smp_store_release directly
>  - use unsigned int instead of atomic_t
>
>
>  arch/riscv/include/asm/asm.h | 1 +
>  arch/riscv/kernel/entry.S    | 4 ++++
>  arch/riscv/kernel/traps.c    | 9 +++++++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 1b471ff73178..acf563072b8b 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -23,6 +23,7 @@
>  #define REG_L          __REG_SEL(ld, lw)
>  #define REG_S          __REG_SEL(sd, sw)
>  #define REG_SC         __REG_SEL(sc.d, sc.w)
> +#define REG_AMOSWAP    __REG_SEL(amoswap.d, amoswap.w)
>  #define REG_ASM                __REG_SEL(.dword, .word)
>  #define SZREG          __REG_SEL(8, 4)
>  #define LGREG          __REG_SEL(3, 2)
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index b9eda3fcbd6d..ea6b78dac739 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
>
>  #ifdef CONFIG_VMAP_STACK
>  handle_kernel_stack_overflow:
> +1:     la sp, spin_shadow_stack
> +       REG_AMOSWAP sp, sp, (sp)
> +       bnez sp, 1b
> +
>         la sp, shadow_stack
>         addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index f3e96d60a2ff..dea47f329708 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -221,11 +221,20 @@ asmlinkage unsigned long get_overflow_stack(void)
>                 OVERFLOW_STACK_SIZE;
>  }
>
> +unsigned long spin_shadow_stack;
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>         unsigned long tsk_stk = (unsigned long)current->stack;
>         unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>
> +       /*
> +        * to ensure spin flag is set after the sp is used in entry.S:
> +        * //load per-cpu overflow stack.
> +        * REG_L sp, -8(sp)
> +        */
> +       smp_store_release(&spin_shadow_stack, 0);
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
