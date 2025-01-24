Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2F1C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJN/PwZ/ufTuin58ToMi089CFAxS96sUN7uBMZII5vI=; b=KRDGL3chDyBuuu
	qR8MHAAvT9rqQu91u2cnPjLBzM89pcBiS+X/T9T0Zexpswqz9bCIolpKW/sJyj5DOjiapes4nFsUB
	1df/fvM6FgyRuOhrDb2HNZtEKx7sZa/fo6i8cfsiDW1k7GIiA8w7WKrY1bW/kAX+acjae8TcbjjD5
	+rJigxqCVLjUHb5nVm40iXUD0KolnE56uqIOizIZFi6xlfFPMf2HkPSRMXRLv7Kja38IUp12qeinF
	2Sv8w2vW/5HH4/OP+j7E6/Aen7jo/nq1wxsOcKngJRW0lCL+CbrKBFTIUPrvEcxquQ7lb5BI7DjSa
	xZX+AKL9Id68CakX7LfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEVL-0000000EAeF-0HBz;
	Fri, 24 Jan 2025 07:53:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEVH-0000000EAdJ-2Td0
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 07:53:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2167141dfa1so33415625ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 23:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737705202; x=1738310002; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1D6xSUMx6yY9EExV7q645xrMDEE4y5ZutPMhix8rPCw=;
        b=kqSXIrM6XlcsymzhTCpC8+X0hwKCDh2esbbcwRf1H9XLzNvpeI79PLJCiDnwTTwsAx
         fhVjo2JYzxVjtcJV6IfE5t9tzK989CPknI1W7r+eFocafjFf++0yNIWtT1yP4363K0RM
         Ue9ED8ciAfdWPMquLOTTIM1E9aMKUpY9PTk4uxk+7bx3c/Jg/ms5f1qVidSgtqmvRULL
         6bX7sAJXBXyAJkxltGq0rOrcECGxRxHB5FFZTsrP442aeyE85AJedLVo2FlmhQGh8nx4
         JTaeAUpOoiV8daHYiVyJVCBQghnAv1ewjPT+ilMLtZUHYa8XtLDc/8QGKABJ5vGtQTHq
         F8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737705202; x=1738310002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D6xSUMx6yY9EExV7q645xrMDEE4y5ZutPMhix8rPCw=;
        b=lCQg2WmxSxktIJLj5Vxe11md1EOnaAWkXAwQg11+ksUQUAAPVMSdk9JdOM6BiHysow
         ma8XNnvUNyK4kljoTd+X0SbqsggAMMz/oQBs5SfWUhpIxr6PpwUmxFCDa1Uj1XTzNHXA
         y1/e615n3OT6rLl9dAzPi0AtgCcfAkoifm1I109nXxC+3/eIrtOrvXslqukv742oVhxh
         faOjmqubI/XLqONiIUS/XOf4NeUFAqNjhR2h7MtrmttMB5pHMnoJVYVqGCMAnQdn3+in
         Uqn8bNDtsfjS5iKVDEC8UOnl0V689IyTfygs18FIs+zsBDAmkWx4IZ5yyX7O3492Pdt+
         2Kgw==
X-Forwarded-Encrypted: i=1; AJvYcCWIImEFGRbmOFeXFxrKP6PYrHfems1G91O0ZuBDN/hNiCD3K6IwG+SpTaPaZFDAfTnmPYE4NNGN+7JofA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTIwvd6ivex0nS3AbQN5F36a3s8xTaTzcckIpyUYbCehKFIPb3
	koH0h2jL90cafQPvdNw36HjM4PiYcviFYsAnR6YNgs4kVec3UVWIsjjK4os/xkQ0EVfkuOesNKk
	YPR8=
X-Gm-Gg: ASbGncuDt4OSux99H5jglaMpdsstVrdzniIa57vfl/c3tR3nHwwBfBellGnFa1h4aTF
	qZAjDIB1xHrks7VK+HF575yANQ4uhiShY7RjythKlqYntxGjPoto/QRXsrAkOreHXL62ZW34Hn+
	bagpPsb4nRbmTRmkXbq2BE67eBFAjV0GYAZ1Xrmk/6l6LPGuPUY5+UY8YFVHP9oIYHtVs1SgXP7
	l9bWZNRS+ReKDcs0JsQr+pk4ue647QiPaY/6u1jxl8TyyLdtzUYnjgISlqo/EpNctdOi09SPlKe
X-Google-Smtp-Source: AGHT+IHHGxH/HpkilKLbQogSJE/TNcVINRyD5SPXZk/okYZGkzNq3qPlVSt7eLNhXfhsaqVlbYLkJg==
X-Received: by 2002:a17:902:fc4e:b0:215:8847:4377 with SMTP id d9443c01a7336-21d9936e91bmr100372865ad.15.1737705202331;
        Thu, 23 Jan 2025 23:53:22 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:db66:c77e:13aa:17a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424e7a6sm10521215ad.231.2025.01.23.23.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 23:53:21 -0800 (PST)
Date: Thu, 23 Jan 2025 23:53:19 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
Message-ID: <Z5NG7-0YyophMcZy@ghost>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
 <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_235323_900020_53202E64 
X-CRM114-Status: GOOD (  28.88  )
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

On Fri, Jan 24, 2025 at 08:19:18AM +0100, Alexandre Ghiti wrote:
> Hi Charlie,
> 
> On 23/01/2025 20:14, Charlie Jenkins wrote:
> > This function was unified into a single function in commit ab9164dae273
> > ("riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork").
> > However that imposed a performance degradation. Partially reverting this
> > commit to have ret_from_fork() split again results in a 1% increase on
> > the number of times fork is able to be called per second.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/asm-prototypes.h |  3 ++-
> >   arch/riscv/kernel/entry.S               | 13 ++++++++++---
> >   arch/riscv/kernel/process.c             | 17 +++++++++++------
> >   3 files changed, 23 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> > index 733ff609778797001006c33bba9e3cc5b1f15387..bfc8ea5f9319b19449ec59493b45b926df888832 100644
> > --- a/arch/riscv/include/asm/asm-prototypes.h
> > +++ b/arch/riscv/include/asm/asm-prototypes.h
> > @@ -52,7 +52,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> >   DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> >   DECLARE_DO_ERROR_INFO(do_trap_break);
> > -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> > +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> > +asmlinkage void ret_from_fork_user(struct pt_regs *regs);
> >   asmlinkage void handle_bad_stack(struct pt_regs *regs);
> >   asmlinkage void do_page_fault(struct pt_regs *regs);
> >   asmlinkage void do_irq(struct pt_regs *regs);
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 9225c322279aa90e737b1d7144db084319cf8103..9386ef7444267f0b9bf8a0550f4e31deaeb85881 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> >   ASM_NOKPROBE(handle_kernel_stack_overflow)
> >   #endif
> > -SYM_CODE_START(ret_from_fork_asm)
> > +SYM_CODE_START(ret_from_fork_kernel_asm)
> >   	call schedule_tail
> >   	move a0, s1 /* fn */
> >   	move a1, s0 /* fn_arg */
> >   	move a2, sp /* pt_regs */
> > -	call ret_from_fork
> > +	call ret_from_fork_kernel
> >   	j ret_from_exception
> > -SYM_CODE_END(ret_from_fork_asm)
> > +SYM_CODE_END(ret_from_fork_kernel_asm)
> > +
> > +SYM_CODE_START(ret_from_fork_user_asm)
> > +	call schedule_tail
> > +	move a0, sp /* pt_regs */
> > +	call ret_from_fork_user
> > +	j ret_from_exception
> > +SYM_CODE_END(ret_from_fork_user_asm)
> >   #ifdef CONFIG_IRQ_STACKS
> >   /*
> > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > index 0d07e6d8f6b57beba438dbba5e8c74a014582bee..5f15236cb526bd9fe61636ed372b4b76c94df946 100644
> > --- a/arch/riscv/kernel/process.c
> > +++ b/arch/riscv/kernel/process.c
> > @@ -38,7 +38,8 @@ unsigned long __stack_chk_guard __read_mostly;
> >   EXPORT_SYMBOL(__stack_chk_guard);
> >   #endif
> > -extern asmlinkage void ret_from_fork_asm(void);
> > +extern asmlinkage void ret_from_fork_kernel_asm(void);
> > +extern asmlinkage void ret_from_fork_user_asm(void);
> >   void noinstr arch_cpu_idle(void)
> >   {
> > @@ -208,14 +209,18 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
> >   	return 0;
> >   }
> > -asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> > +asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> >   {
> > -	if (unlikely(fn))
> > -		fn(fn_arg);
> > +	fn(fn_arg);
> >   	syscall_exit_to_user_mode(regs);
> >   }
> > +asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> > +{
> > +	syscall_exit_to_user_mode(regs);
> > +}
> > +
> >   int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   {
> >   	unsigned long clone_flags = args->flags;
> > @@ -238,6 +243,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   		p->thread.s[0] = (unsigned long)args->fn;
> >   		p->thread.s[1] = (unsigned long)args->fn_arg;
> > +		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
> >   	} else {
> >   		*childregs = *(current_pt_regs());
> >   		/* Turn off status.VS */
> > @@ -247,12 +253,11 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   		if (clone_flags & CLONE_SETTLS)
> >   			childregs->tp = tls;
> >   		childregs->a0 = 0; /* Return value of fork() */
> > -		p->thread.s[0] = 0;
> > +		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
> >   	}
> >   	p->thread.riscv_v_flags = 0;
> >   	if (has_vector())
> >   		riscv_v_thread_alloc(p);
> > -	p->thread.ra = (unsigned long)ret_from_fork_asm;
> >   	p->thread.sp = (unsigned long)childregs; /* kernel sp */
> >   	return 0;
> >   }
> > 
> 
> Can you benchmark this change on some HW? I'm not sure we would indeed gain
> this 1%.

It reduces the syscall path by 3 instructions, two for not needing to
move the fn and fn_args from:

move a0, s1 /* fn */
move a1, s0 /* fn_arg */

And one for not needing to do the conditional. This one is also saved on
kernel threads.

It's a very small improvement, but there is only something like 100
instructions along the direct syscall path so it ends up being a large
percentage. On hardware moving registers is very cheap and this branch
will be almost always be correctly predicted so the cost is close to
zero. I just figured that since I am making changes around here it would
be nice if it was optimal instead of being close to optimal.

- Charlie

> 
> Thanks,
> 
> Alex
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
