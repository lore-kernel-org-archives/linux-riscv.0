Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7000BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbpnAlC97LAKdXX3V7EUfEdacBHAB/cMTfmv0WzuCWU=; b=2TITMO6bJMxmt4
	4ti7o7hMcGibYeq2tuREyNlRl+N5EjlgZrW+GqoEU72uRV6aXd37morA0GjNB2d4kpOzWtfJjqLcr
	u2Zr1vQtj5y9T2Oq5YiZ8b8bQMAEKBRJNvEflZYap4hUNLEvC51Cpp/23e0vL9cKPH2cSYBQ5gRh8
	ISVIVNhvy9N/mgQWeiGfZr8fJJvVMLSXeOQaeMLeF7p1qAdf5mM1Uv1Uo17u/NlebZQEKBNdgpR0A
	mlRj9yGOcQdvMUwJ+L0ybeH3uzVW01Hxbdnbw3uGjaTISaE2nfYbhDZqwyk2zYTX/W3tUbqyXazxt
	5rs4B+8QVhKyqca4qwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrlG-000TkB-Jp; Wed, 23 Nov 2022 15:34:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrkt-000TYP-Vd
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 15:33:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 79D26B82108;
	Wed, 23 Nov 2022 15:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D521CC433D6;
	Wed, 23 Nov 2022 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669217621;
	bh=L+7mmGSwYmB27FnIUdnUXABjZk7v8plFfYZee6on5P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jcp4scnFf95K8fs7MLYgfmNNGjNYl+47x/Tc5/QwKp2DvUvXiuyW/Ej0T+tZRLv1y
	 hfLbkffrtAH+IGaDnrwl86ysgWUrvtXoyjqNXb8miTGIVw3o4Oko7lFnJ5HOe5kb1F
	 olMoa2OyFK/GXyfJ34U2Y45ST1My6Yj9AA5HA8MBf5Kuyy2Y929aP2b8a2yxbtbcGs
	 gaxhBrQ5uQsXyrhCDbiTl/gwJASvqyrKoR4I+SyfIUJ/02CrWaZmtvUoqDXkDm8tKx
	 3dJ6I+6rBtKArHE66wu9+PxgtSuytS9YXCpNfr0/4Jm27AlOQkpzl+n6jDCS31weg3
	 k1/Is6TlrGIUw==
Date: Wed, 23 Nov 2022 23:23:51 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix race when vmap stack overflow
Message-ID: <Y347B0x4VUNOd6V7@xhacker>
References: <20221030124517.2370-1-jszhang@kernel.org>
 <CAJF2gTRPECoPFHXKZZ8bRc27YSYv7z4xkYh+hTmfzmZg8=2Ejg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRPECoPFHXKZZ8bRc27YSYv7z4xkYh+hTmfzmZg8=2Ejg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_073344_400414_637CDC61 
X-CRM114-Status: GOOD (  24.74  )
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

On Sun, Oct 30, 2022 at 09:23:51PM +0800, Guo Ren wrote:
> Reviewed-by: Guo Ren <guoren@kernel.org>
> 

Gentle ping? This patch is still missing in mainline.

> On Sun, Oct 30, 2022 at 8:54 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Currently, when detecting vmap stack overflow, riscv firstly switches
> > to the so called shadow stack, then use this shadow stack to call the
> > get_overflow_stack() to get the overflow stack. However, there's
> > a race here if two or more harts use the same shadow stack at the same
> > time.
> >
> > To solve this race, we introduce spin_shadow_stack atomic var, which
> > will be swap between its own address and 0 in atomic way, when the
> > var is set, it means the shadow_stack is being used; when the var
> > is cleared, it means the shadow_stack isn't being used.
> >
> > Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Suggested-by: Guo Ren <guoren@kernel.org>
> > ---
> > Since v2:
> >  - use REG_AMOSWAP
> >  - add comment to the purpose of smp_store_release()
> >
> > Since v1:
> >  - use smp_store_release directly
> >  - use unsigned int instead of atomic_t
> >
> >
> >  arch/riscv/include/asm/asm.h | 1 +
> >  arch/riscv/kernel/entry.S    | 4 ++++
> >  arch/riscv/kernel/traps.c    | 9 +++++++++
> >  3 files changed, 14 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> > index 1b471ff73178..acf563072b8b 100644
> > --- a/arch/riscv/include/asm/asm.h
> > +++ b/arch/riscv/include/asm/asm.h
> > @@ -23,6 +23,7 @@
> >  #define REG_L          __REG_SEL(ld, lw)
> >  #define REG_S          __REG_SEL(sd, sw)
> >  #define REG_SC         __REG_SEL(sc.d, sc.w)
> > +#define REG_AMOSWAP    __REG_SEL(amoswap.d, amoswap.w)
> >  #define REG_ASM                __REG_SEL(.dword, .word)
> >  #define SZREG          __REG_SEL(8, 4)
> >  #define LGREG          __REG_SEL(3, 2)
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index b9eda3fcbd6d..ea6b78dac739 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
> >
> >  #ifdef CONFIG_VMAP_STACK
> >  handle_kernel_stack_overflow:
> > +1:     la sp, spin_shadow_stack
> > +       REG_AMOSWAP sp, sp, (sp)
> > +       bnez sp, 1b
> > +
> >         la sp, shadow_stack
> >         addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
> >
> > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > index f3e96d60a2ff..dea47f329708 100644
> > --- a/arch/riscv/kernel/traps.c
> > +++ b/arch/riscv/kernel/traps.c
> > @@ -221,11 +221,20 @@ asmlinkage unsigned long get_overflow_stack(void)
> >                 OVERFLOW_STACK_SIZE;
> >  }
> >
> > +unsigned long spin_shadow_stack;
> > +
> >  asmlinkage void handle_bad_stack(struct pt_regs *regs)
> >  {
> >         unsigned long tsk_stk = (unsigned long)current->stack;
> >         unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
> >
> > +       /*
> > +        * to ensure spin flag is set after the sp is used in entry.S:
> > +        * //load per-cpu overflow stack.
> > +        * REG_L sp, -8(sp)
> > +        */
> > +       smp_store_release(&spin_shadow_stack, 0);
> > +
> >         console_verbose();
> >
> >         pr_emerg("Insufficient stack space to handle exception!\n");
> > --
> > 2.37.2
> >
> 
> 
> -- 
> Best Regards
>  Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
