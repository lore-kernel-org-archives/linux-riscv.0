Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9646FE9904C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcyCMIJA6/IgvO+ihXyrz5389XjTdiY6mYaQ2Wwspzg=; b=gOP67V6cVAGma7
	PNolIjch0d7d5o1vU4We8YjVCwZDuNuw3TcVxS2OeL3PJgT+oPBzoEeNwcRd+wCLRSrPs7yumHk6D
	2ng2izLMIvCFofwHCqkG59w/sr1z4kI4bu+VEJtqEgJ8Z8jEXWrm0j/bp9aQUBWloW63t0T0n6TFP
	MIfVC4rFZ9ThGyo7PiHfSEBnVwaZ8+ghtZKT9/eTXJw2hcioIIRa0cdG/Um8nfJqLETm1ALKbBG9g
	8kBV2+yG1Kdqo05D1Jw5589NQ+cILFhYnmqgDdXdokQebQT4XKvt0RQzA8riPP0OL7g6LVr6LdHEz
	e+6xMLL4NlTQHugMKmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Fj-0000000BjXc-1onS;
	Fri, 10 Apr 2026 07:26:07 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Ff-0000000BjWb-1JQh
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 07:26:06 +0000
Received: from [10.213.21.49] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAA3G+ICpthpNa+PDQ--.2010S2;
	Fri, 10 Apr 2026 15:25:54 +0800 (CST)
Message-ID: <c95d9003-58e5-46d2-ba5b-5d32a8743f1d@iscas.ac.cn>
Date: Fri, 10 Apr 2026 15:25:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Implement arch_within_stack_frames() for
 HARDENED_USERCOPY
To: cp0613@linux.alibaba.com, pjw@kernel.org, alex@ghiti.fr,
 cleger@rivosinc.com, alexghiti@rivosinc.com, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260410015013.845-1-cp0613@linux.alibaba.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260410015013.845-1-cp0613@linux.alibaba.com>
X-CM-TRANSID: rQCowAA3G+ICpthpNa+PDQ--.2010S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4DCr13trykAFyftF45trb_yoWrKr43pF
	ZakFn3JrWUJr1I9ry2yFy09rnYg393ua1aqFWDJ3W8Ars0krW8X39xKa48ZryDArykWrW0
	9FyFgF9rCrs8X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5-YwUUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_002603_722846_FCE40D58 
X-CRM114-Status: GOOD (  23.12  )
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

Hi Chen Pei,

Thanks for your patch. I have a few minor suggestions:

On 4/10/26 09:50, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> Implement arch_within_stack_frames() to enable precise per-frame stack
> object validation for CONFIG_HARDENED_USERCOPY on RISC-V.
>
> == Background ==
>
> [...]
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Patch message is probably too long. You can put additional information
like testing under a --- line to cut those out of the eventual actual
commit message.

Make sure that Signed-off-by is above the cut if you do that.

> ---
>  arch/riscv/Kconfig                   |  1 +
>  arch/riscv/include/asm/thread_info.h | 66 ++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6fe90591a274..4f765ff608d9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -150,6 +150,7 @@ config RISCV
>  	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
>  	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
>  	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
> +	select HAVE_ARCH_WITHIN_STACK_FRAMES
>  	select HAVE_ASM_MODVERSIONS
>  	select HAVE_BUILDTIME_MCOUNT_SORT
>  	select HAVE_CONTEXT_TRACKING_USER
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 36918c9200c9..616a41eb7416 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -101,6 +101,72 @@ struct thread_info {
>  void arch_release_task_struct(struct task_struct *tsk);
>  int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>  
> +#ifdef CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES

Not needed since you've selected it above.

> +/*
> + * RISC-V stack frame layout (with frame pointer enabled):
> + *
> + * high addr
> + *   +------------------+  <--- fp (s0) points here
> + *   |   saved ra       |  fp - 8  (return address)
> + *   |   saved fp       |  fp - 16 (previous frame pointer)

fp - 2*sizeof(void*) probably, to account for RV32?

> + *   +------------------+
> + *   |   local vars     |
> + *   |   arguments      |
> + *   +------------------+  <--- sp
> + * low addr
> + *
> + * The struct stackframe { fp, ra } lives at (fp - sizeof(stackframe)),
> + * i.e. fp[-2]=saved_fp and fp[-1]=saved_ra.
> + *

Maybe link to the authoritative source:

  https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention

> + * For usercopy safety, we allow copies within [prev_fp, fp - 2*sizeof(void*))
> + * for each frame in the chain, where prev_fp is the fp of the previous
> + * (lower) frame.  This covers local variables and arguments but excludes
> + * the saved ra/fp slots at the top of the frame.
> + *
> + * We walk the frame chain starting from __builtin_frame_address(0) (the
> + * current frame), with prev_fp initialized to current_stack_pointer.
> + * Using current_stack_pointer -- rather than the 'stack' argument (which is
> + * the thread's entire stack base) -- ensures that objects in already-returned
> + * frames (address below current sp) are correctly detected as BAD_STACK,
> + * because no live frame in the chain will claim that region.
> + */
> +__no_kmsan_checks
> +static inline int arch_within_stack_frames(const void * const stack,
> +					   const void * const stackend,
> +					   const void *obj, unsigned long len)
> +{
> +#if defined(CONFIG_FRAME_POINTER)
> +	const void *fp = (const void *)__builtin_frame_address(0);
> +	const void *prev_fp = (const void *)current_stack_pointer;
> +
> +	/*
> +	 * Walk the frame chain. Each iteration checks whether [obj, obj+len)
> +	 * falls within the local-variable area of the current frame:
> +	 *
> +	 *   [prev_fp, fp - 2*sizeof(void*))
> +	 *
> +	 * i.e. from the base of this frame (sp of this frame, which equals
> +	 * the fp of the frame below) up to (but not including) the saved
> +	 * fp/ra area at the top of this frame.
> +	 */
> +	while (stack <= fp && fp < stackend) {

Since we access fp - 2 * sizeof(void *) below, this probably should be
something like this:

    while (stack + 2 * sizeof(void *) <= fp && fp < stackend) {

(Possibly with some casts added.)

> +		const void *frame_vars_end = (const char *)fp - 2 * sizeof(void *);
> +
> +		if (obj + len <= frame_vars_end) {
> +			if (obj >= prev_fp)
> +				return GOOD_FRAME;
> +			return BAD_STACK;
> +		}
> +		prev_fp = fp;
> +		fp = *(const void * const *)((const char *)fp - 2 * sizeof(void *));

Maybe: fp = *(const void * const *)frame_vars_end;

> +	}
> +	return BAD_STACK;
> +#else
> +	return NOT_STACK;
> +#endif
> +}
> +#endif /* CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES */
> +
>  #endif /* !__ASSEMBLER__ */
>  
>  /*

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
