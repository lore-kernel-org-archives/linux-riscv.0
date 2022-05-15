Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7977FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 15 May 2022 05:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4b7k00OJ+ZbKUueygJdLDvfaGEZ3i5THSHBHga3SC5Y=; b=J4awYrYPmSjk6d
	ESiyu/kbNJclVI4B7FezLBBEXiKipEinLpWJJdD93oGsYdOAdckg0foXSJIFqcYe4g/2Gd9qDpi49
	UpWhmxHJ1PGxgsBEM8y6+uAD0sy+QSX54Ybd3Wgb22qvj8tpZ8WXC66zj2TM+NKHmNZ1vlOnlpvfK
	haEXFuVvqt6oUd47Sf4h+Qi3f6u3gGOu5Ti9sSk5ThykbIS3Qgz4X3sBEvAlU3CQ65X+WPqyUy8Ju
	rwsaxtDzAXE9A9DmHbT68uonCR4qlhQRz9uB0M7CDlZpnD25RN5GPHD53615sN5AAhnQJ/310t+LM
	S/Ib3DzOolyws0sV+oHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nq6iS-003CkE-4K; Sun, 15 May 2022 05:22:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nq6iP-003Cjl-Pe
 for linux-riscv@lists.infradead.org; Sun, 15 May 2022 05:22:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4D3F60C88;
 Sun, 15 May 2022 05:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD346C34100;
 Sun, 15 May 2022 05:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652592166;
 bh=SMApoQBrwmguznnu6OZ3wGTSnLpxhB1UNHnIM9qqIW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1R023dFG2+WP4S5Q6tv6yFDBWsKyqf1eEWflFvhGN9juQgRQh+0cF+COpuMz8ai9
 GXdsyIsoCV3LQL2TsMHCU41Tw8Sr30gdFcbYMVysS3VfrcGCtWKkpUVL60EtDIIgUi
 9fzlWcaAibf/eev2XaCjyRscovLRVIgaBU2pfkpqQ68UU0PxCfaIfV3+dxpdSCqgGX
 rMbr2d8hMufOqGDsSpVIAlzmdaS95JHWX+Yn2jHzZAgUajAdI+3G2Thblv1fDl+Cva
 xehQjYcQLyDp7fdmKK5OvohPMGNi0UtJPGD5hdNMrvR11078liDJas9SplZDEBVDIo
 MKVMaNve0l4iQ==
Date: Sun, 15 May 2022 13:14:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: add irq stack support
Message-ID: <YoCMJhH9EP4+01pB@xhacker>
References: <20220307140804.1400-1-jszhang@kernel.org>
 <CAK8P3a33aPwi0hBAyFREqM-BKVJwin=O9cOR4NzWPtr1j2pLiA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a33aPwi0hBAyFREqM-BKVJwin=O9cOR4NzWPtr1j2pLiA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_222249_947640_31542948 
X-CRM114-Status: GOOD (  34.80  )
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

On Mon, Mar 07, 2022 at 08:19:35PM +0100, Arnd Bergmann wrote:
> On Mon, Mar 7, 2022 at 3:08 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Currently, IRQs are still handled on the kernel stack of the current
> > task on riscv platforms. If the task has a deep call stack at the time
> > of interrupt, and handling the interrupt also requires a deep stack,
> > it's possible to see stack overflow.
> >
> > Before this patch, the stack_max_size of a v5.17-rc1 kernel running on
> > a lichee RV board gave:
> > ~ # cat /sys/kernel/debug/tracing/stack_max_size
> > 3736
> >
> > After this patch,
> > ~ # cat /sys/kernel/debug/tracing/stack_max_size
> > 3176
> >
> > We reduce the max kernel stack usage by 560 bytes!
> >
> > From another side, after this patch, it's possible to reduce the
> > THREAD_SIZE to 8KB for RV64 platforms. This is especially useful for
> > those systems with small memory size, e.g the Allwinner D1S platform
> > which is RV64 but only has 64MB DDR.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Very nice!
> 
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index ed29e9c8f660..57c9b64e16a5 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -126,12 +126,39 @@ skip_context_tracking:
> >          */
> >         bge s4, zero, 1f
> >
> > -       la ra, ret_from_exception
> > +       /* preserve the sp */
> > +       move s0, sp
> >
> > -       /* Handle interrupts */
> >         move a0, sp /* pt_regs */
> > +
> > +       /*
> > +        * Compare sp with the base of the task stack.
> > +        * If the top ~(THREAD_SIZE - 1) bits match, we are on a task stack,
> > +        * and should switch to the irq stack.
> > +        */
> > +       REG_L t0, TASK_STACK(tp)
> > +       xor t0, t0, s0
> > +       li t1, ~(THREAD_SIZE - 1)
> > +       and t0, t0, t1
> > +       bnez t0, 2f
> > +
> > +       la t1, irq_stack
> > +       REG_L t2, TASK_TI_CPU(tp)
> > +       slli t2, t2, RISCV_LGPTR
> > +       add t1, t1, t2
> > +       REG_L t2, 0(t1)
> > +       li t1, IRQ_STACK_SIZE
> > +       /* switch to the irq stack */
> > +       add sp, t2, t1
> > +
> > +2:
> 
> What is the benefit of doing this in assembler? Is it measurably faster?
> 
> I see that arm64 does the same thing in C code, and it would be best to
> have a common implementation for doing this, in terms of maintainability.
> 

Hi Arnd,

Sorry for delay. The assembler code is mainly to cal the stack ptr then
change the SP to use the stack, which equals to arm64 call_on_irq_stack()
which is implemented in assembler too.

> > +
> > +       for_each_possible_cpu(cpu) {
> > +#ifdef CONFIG_VMAP_STACK
> > +               void *s = __vmalloc_node(IRQ_STACK_SIZE, THREAD_ALIGN,
> > +                                        THREADINFO_GFP, cpu_to_node(cpu),
> > +                                        __builtin_return_address(0));
> > +#else
> > +               void *s = (void *)__get_free_pages(GFP_KERNEL, get_order(IRQ_STACK_SIZE));
> > +#endif
> 
> On a related topic: is there a reason to still keep the non-VMAP_STACK

irq stack is 16KB on RV64 now, vmalloc doesn't gurantee physical
continuous pages, I want to keep the stack physical continuous
characteristic for !VMAP_STACK case.

Thanks

> code path around? I see that it currently is optional for 64-bit with MMU,
> but not available otherwise. The benefits should still outweigh the downside
> (virtual address space usage mainly) on 32-bit, especially when this allows
> a common implementation. Not sure about NOMMU, but I would guess
> that it's not a big issue to use the same code there as well, since nommu
> vmalloc just turns into a kmalloc as well.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
