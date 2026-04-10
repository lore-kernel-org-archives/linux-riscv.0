Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D911CF4484C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1Iy26KjDD7uj+TE4E3Dvc3FLJhSzpmBM+htR7+WIjo=; b=ZtRcBktZFhsJrf
	t4lvA2gYexwztGR41Kf4swT8uqV+knSZ9m8N5I0yUzkbG4cFotMh1zkF720b0momf7m0oi/3094VE
	aXb+WFbNpvB1TyTL644nJ9fCU6cZGmhkHKheSut9wKQyJoXjdsZlGzgXiv0apPtgw5TZvbEfbKmnS
	5F9tHYQcrKkpia2XO0k7lVOHuYERoUV4cNs0SPJyFfzUNME7Xp3mC0Xkh+yFSv/529fKdFloJHndQ
	aLo+DzxmMP9cw3mqFWk1K7Aa1hG8ejwP8aKBa/P5mBtx19WNZB7DWR62KeE+AEqQMm1TZw42TzSj2
	L9Cwfeyp64WOyGtAYhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAwR-0000000CFZj-2Gda;
	Fri, 10 Apr 2026 12:26:31 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAwN-0000000CFYo-2jxB
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 12:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775823976; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=QDctR1Ti50dosVtQ0PuV1rV0QHHowo/QoSB6MQcgpPg=;
	b=YTAjUpPsEyQZxqKIKU6uV2o7Xk3YLy3iy5zKU2pBJtGmwFZiPVDvyk/IrxhF4QoMDrqPdDOvrjJ17BA7lbIRK1D3W7J7DS9Gxr5Csa7njtA+SN1CYHUkwsm8nn6v0m/0kgdqWFuJPMMojr9LCS/uxRHfefqbc0cRBNhqGSTh8EA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X0lH0Dz_1775823968;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X0lH0Dz_1775823968 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Apr 2026 20:26:12 +0800
From: cp0613@linux.alibaba.com
To: wangruikang@iscas.ac.cn
Cc: pjw@kernel.org,
	alex@ghiti.fr,
	cleger@rivosinc.com,
	alexghiti@rivosinc.com,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Implement arch_within_stack_frames() for HARDENED_USERCOPY
Date: Fri, 10 Apr 2026 20:26:07 +0800
Message-ID: <20260410122607.118282-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c95d9003-58e5-46d2-ba5b-5d32a8743f1d@iscas.ac.cn>
References: <c95d9003-58e5-46d2-ba5b-5d32a8743f1d@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_052629_247417_C7F17514 
X-CRM114-Status: GOOD (  30.66  )
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

Hi Vivian,

Thank you very much for your review and suggestions.

On Fri, 10 Apr 2026 15:25:54 +0800, wangruikang@iscas.ac.cn wrote:

> On 4/10/26 09:50, cp0613@linux.alibaba.com wrote:
> > From: Chen Pei <cp0613@linux.alibaba.com>
> >
> > Implement arch_within_stack_frames() to enable precise per-frame stack
> > object validation for CONFIG_HARDENED_USERCOPY on RISC-V.
> >
> > == Background ==
> >
> > [...]
> >
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> 
> Patch message is probably too long. You can put additional information
> like testing under a --- line to cut those out of the eventual actual
> commit message.
> 
> Make sure that Signed-off-by is above the cut if you do that.

Okay, that's really helpful advice, I've learned a lot.

> > ---
> >  arch/riscv/Kconfig                   |  1 +
> >  arch/riscv/include/asm/thread_info.h | 66 ++++++++++++++++++++++++++++
> >  2 files changed, 67 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 6fe90591a274..4f765ff608d9 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -150,6 +150,7 @@ config RISCV
> >  	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
> >  	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
> >  	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
> > +	select HAVE_ARCH_WITHIN_STACK_FRAMES
> >  	select HAVE_ASM_MODVERSIONS
> >  	select HAVE_BUILDTIME_MCOUNT_SORT
> >  	select HAVE_CONTEXT_TRACKING_USER
> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> > index 36918c9200c9..616a41eb7416 100644
> > --- a/arch/riscv/include/asm/thread_info.h
> > +++ b/arch/riscv/include/asm/thread_info.h
> > @@ -101,6 +101,72 @@ struct thread_info {
> >  void arch_release_task_struct(struct task_struct *tsk);
> >  int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
> >  
> > +#ifdef CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES
> 
> Not needed since you've selected it above.

Okay, it seems that it's indeed not necessary.

> > +/*
> > + * RISC-V stack frame layout (with frame pointer enabled):
> > + *
> > + * high addr
> > + *   +------------------+  <--- fp (s0) points here
> > + *   |   saved ra       |  fp - 8  (return address)
> > + *   |   saved fp       |  fp - 16 (previous frame pointer)

> fp - 2*sizeof(void*) probably, to account for RV32?

Yes, You are right. The implementation already uses 2 * sizeof(void *) to
be RV32-compatible. However, the comments still hardcode. I'll update the
comments to use fp - 2*sizeof(void*) to be architecture-neutral.

> > + *   +------------------+
> > + *   |   local vars     |
> > + *   |   arguments      |
> > + *   +------------------+  <--- sp
> > + * low addr
> > + *
> > + * The struct stackframe { fp, ra } lives at (fp - sizeof(stackframe)),
> > + * i.e. fp[-2]=saved_fp and fp[-1]=saved_ra.
> > + *
> 
> Maybe link to the authoritative source:
> 
  > https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention

Okay, I will add this link.

> > + * For usercopy safety, we allow copies within [prev_fp, fp - 2*sizeof(void*))
> > + * for each frame in the chain, where prev_fp is the fp of the previous
> > + * (lower) frame.  This covers local variables and arguments but excludes
> > + * the saved ra/fp slots at the top of the frame.
> > + *
> > + * We walk the frame chain starting from __builtin_frame_address(0) (the
> > + * current frame), with prev_fp initialized to current_stack_pointer.
> > + * Using current_stack_pointer -- rather than the 'stack' argument (which is
> > + * the thread's entire stack base) -- ensures that objects in already-returned
> > + * frames (address below current sp) are correctly detected as BAD_STACK,
> > + * because no live frame in the chain will claim that region.
> > + */
> > +__no_kmsan_checks
> > +static inline int arch_within_stack_frames(const void * const stack,
> > +					   const void * const stackend,
> > +					   const void *obj, unsigned long len)
> > +{
> > +#if defined(CONFIG_FRAME_POINTER)
> > +	const void *fp = (const void *)__builtin_frame_address(0);
> > +	const void *prev_fp = (const void *)current_stack_pointer;
> > +
> > +	/*
> > +	 * Walk the frame chain. Each iteration checks whether [obj, obj+len)
> > +	 * falls within the local-variable area of the current frame:
> > +	 *
> > +	 *   [prev_fp, fp - 2*sizeof(void*))
> > +	 *
> > +	 * i.e. from the base of this frame (sp of this frame, which equals
> > +	 * the fp of the frame below) up to (but not including) the saved
> > +	 * fp/ra area at the top of this frame.
> > +	 */
> > +	while (stack <= fp && fp < stackend) {
> 
> Since we access fp - 2 * sizeof(void *) below, this probably should be
> something like this:
> 
    > while (stack + 2 * sizeof(void *) <= fp && fp < stackend) {
> 
> (Possibly with some casts added.)

Thank you for pointing it out; I hadn't considered the potential for
boundary violations here.

> > +		const void *frame_vars_end = (const char *)fp - 2 * sizeof(void *);
> > +
> > +		if (obj + len <= frame_vars_end) {
> > +			if (obj >= prev_fp)
> > +				return GOOD_FRAME;
> > +			return BAD_STACK;
> > +		}
> > +		prev_fp = fp;
> > +		fp = *(const void * const *)((const char *)fp - 2 * sizeof(void *));
> 
> Maybe: fp = *(const void * const *)frame_vars_end;

Yes, direct reuse.

> > +	}
> > +	return BAD_STACK;
> > +#else
> > +	return NOT_STACK;
> > +#endif
> > +}
> > +#endif /* CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES */
> > +
> >  #endif /* !__ASSEMBLER__ */
> >  
> >  /*

> Thanks,
> Vivian "dramforever" Wang

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
