Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650A0C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJW4wxnvUrVH2gDvYG0o5PvhM3TmbZq2IVeLGUMWmMc=; b=JLXEmNLjcLD5lc
	VGgq79zaObRBhIm799ZXqtAR711vjzBOCZLBJUU09aAf+UUrHZ2BBxWYEl5v/aflmdAVoltM6Ikx0
	2TGUvVYfalSKMGX11PnfCWpLG/wxch2IuBRcuCPp1dDoWMjvLNohy0rMg9Zinh4hxwpb9qflc2bPP
	ebSuib4elReJMgBLCQNHnMf4vcLfGlynhNQAKIjyWze3/cx865bzvkvsUTkaCShDknXmeZtL2Hwce
	DWk/a6k7bvmwBR1lGeS0GX3FV4HHr6y0hlWSVuoUwaMkw5XZU8fb6B9v/bb259TB6Pmw2fy5lLMFN
	EkptBrar1xG6eOIKU8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEYA-0000000EApS-3ktZ;
	Fri, 24 Jan 2025 07:56:22 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEY7-0000000EAom-3kcI
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 07:56:21 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f42992f608so2744319a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 23:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737705379; x=1738310179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Puavfv6Mwo40wvE/QGDVA8qgrBgZXijyP93Qz2d9GhQ=;
        b=Kf4PHUO/df+m0W0YapI2wPOpyaiFiN+V+qBTVYzzVm3p6NK2h1Swr9S/GGt/5q+L0F
         3o51bFWowwyTJe3kjahWkS1Aex/Qoze7nEQbqXFIpKTzCJVTQ14NeYHft9WDsaxp38J1
         Z2QJ0Y2hYMETrDRXcggA7tgEQseJgV/N/N86nvXPYDsDegPQ/hxTf9mWLvD3CuQMTrsO
         Z28b1w3g0NT47F01oKFNCIzca0FJKllQ9ErulAPxFdevAODbEk/a+nlJeo5m36utqFrp
         YKu8hZ2H8d/gPePqhqpWnhrTCyh8sZzq2hX2ZQQyjGPFxMvljkD0HvYO9XRU+fF95O9D
         nvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737705379; x=1738310179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Puavfv6Mwo40wvE/QGDVA8qgrBgZXijyP93Qz2d9GhQ=;
        b=I97v/6N60GMJzW+29tcroZM9GQ+YdDvL8cvxkJuo5SjxNYrtQ5El/KBynHbYY1gsyY
         iUBg5kX0MU9kCu8WDC735uXo8bPU3QIm91PBeA7LkhZpIu9SLLzxegmJvv9Z8S0Sza18
         lCZHVCXZf6eI2WHDpGOzhvKOOe2l7namPRugawgw/0N9gMv/jMPrA2C2NpGe/hlzGyu+
         27fQt6oHHVypafX6nsCY/4dw5FJjfz8SUnVFzXmNNJ6YEXa8HlymtvC/G5fiH/p+FglJ
         f6urXXKZnOtVgKVEAhrptNAN4ZJAL//TbtdXh1MnMyZWUQz7sHsYgMph+z4Tfoieap9T
         XBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvd/GOegxCA6q0p5kGXEB9ftyEoKIJxmBg+mWpaw0Ui1BU28AdeHh1/rveKqThCrM/xMRDPLHmapDYAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjMd5DLUnhLwm4jKswSeg54OmvjqGb1E/rUOExQGE4FypRwmln
	yPYcxPKaz5LRG7TXbDvftppgUenOJzeWWUu88+m9ttMSK+QqdXj0t4Ca+OeSh4tePdMsYuYcN+d
	mHfs=
X-Gm-Gg: ASbGncst3QLRUsX3dsvunIt+281ChC67Uo4ymaVudGlrfjgeI8g8zMEQEsmZVyV/e8K
	bLozBjoBTkhaIu9xl2MXBlPGEoIgPi4rKxIfcNKL8+OaGATawLlopMZvnPAEYM1ucxGvwP3LHWA
	OsXVauPIBRpn3rxvwGOO1/ZjpYTMz54GazkCiHQKzwKuXxOTpWmenoxLndTHcZ6Ir2Dw3JxH6tW
	eJ5H823RHzXSQgdPG5mqKYvRMPWNRq2AfSYhu1LiHaH4awz8ADC67hv8lb9Jt22yKHE5k6/GbvW
X-Google-Smtp-Source: AGHT+IGtfy5k0PlhMUnKgepez8xy7+vWZVhDSj6+NmuJiXytfOUnL0FH4Jlly+P6YjqyMghE081Vyg==
X-Received: by 2002:aa7:9a83:0:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-72daf97a541mr41394847b3a.14.1737705378949;
        Thu, 23 Jan 2025 23:56:18 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:db66:c77e:13aa:17a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a7614e9sm1238956b3a.109.2025.01.23.23.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 23:56:18 -0800 (PST)
Date: Thu, 23 Jan 2025 23:56:16 -0800
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
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
Message-ID: <Z5NHoNI2UFc6q_O8@ghost>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
 <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
 <3c2d171a-1e6c-459e-b254-e9684a4e5ba4@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c2d171a-1e6c-459e-b254-e9684a4e5ba4@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_235619_937211_2CDD7B27 
X-CRM114-Status: GOOD (  22.87  )
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

On Fri, Jan 24, 2025 at 08:09:16AM +0100, Alexandre Ghiti wrote:
> Hi Charlie,
> 
> On 22/01/2025 23:56, Charlie Jenkins wrote:
> > Move the main section of ret_from_fork() to C to allow inlining of
> > syscall_exit_to_user_mode().
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/asm-prototypes.h |  1 +
> >   arch/riscv/kernel/entry.S               | 15 ++++++---------
> >   arch/riscv/kernel/process.c             | 14 ++++++++++++--
> >   3 files changed, 19 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> > index cd627ec289f163a630b73dd03dd52a6b28692997..733ff609778797001006c33bba9e3cc5b1f15387 100644
> > --- a/arch/riscv/include/asm/asm-prototypes.h
> > +++ b/arch/riscv/include/asm/asm-prototypes.h
> > @@ -52,6 +52,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> >   DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> >   DECLARE_DO_ERROR_INFO(do_trap_break);
> > +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
> >   asmlinkage void handle_bad_stack(struct pt_regs *regs);
> >   asmlinkage void do_page_fault(struct pt_regs *regs);
> >   asmlinkage void do_irq(struct pt_regs *regs);
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> >   ASM_NOKPROBE(handle_kernel_stack_overflow)
> >   #endif
> > -SYM_CODE_START(ret_from_fork)
> > +SYM_CODE_START(ret_from_fork_asm)
> >   	call schedule_tail
> > -	beqz s0, 1f	/* not from kernel thread */
> > -	/* Call fn(arg) */
> > -	move a0, s1
> > -	jalr s0
> > -1:
> > -	move a0, sp /* pt_regs */
> > -	call syscall_exit_to_user_mode
> > +	move a0, s1 /* fn */
> > +	move a1, s0 /* fn_arg */
> 
> 
> You pass the arguments in the right order but the comments are wrong (s1
> contains fn_arg and s0 fn).

Oh thank you! I originally had it in this order but then moved it around
to reduce the amount of register shuffling that is needed on the C side,
I will fix in the next version.

- Charlie

> 
> 
> > +	move a2, sp /* pt_regs */
> > +	call ret_from_fork
> >   	j ret_from_exception
> > -SYM_CODE_END(ret_from_fork)
> > +SYM_CODE_END(ret_from_fork_asm)
> >   #ifdef CONFIG_IRQ_STACKS
> >   /*
> > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > index 58b6482c2bf662bf5224ca50c8e21a68760a6b41..0d07e6d8f6b57beba438dbba5e8c74a014582bee 100644
> > --- a/arch/riscv/kernel/process.c
> > +++ b/arch/riscv/kernel/process.c
> > @@ -17,7 +17,9 @@
> >   #include <linux/ptrace.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/personality.h>
> > +#include <linux/entry-common.h>
> > +#include <asm/asm-prototypes.h>
> >   #include <asm/unistd.h>
> >   #include <asm/processor.h>
> >   #include <asm/csr.h>
> > @@ -36,7 +38,7 @@ unsigned long __stack_chk_guard __read_mostly;
> >   EXPORT_SYMBOL(__stack_chk_guard);
> >   #endif
> > -extern asmlinkage void ret_from_fork(void);
> > +extern asmlinkage void ret_from_fork_asm(void);
> >   void noinstr arch_cpu_idle(void)
> >   {
> > @@ -206,6 +208,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
> >   	return 0;
> >   }
> > +asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> > +{
> > +	if (unlikely(fn))
> > +		fn(fn_arg);
> > +
> > +	syscall_exit_to_user_mode(regs);
> > +}
> > +
> >   int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   {
> >   	unsigned long clone_flags = args->flags;
> > @@ -242,7 +252,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >   	p->thread.riscv_v_flags = 0;
> >   	if (has_vector())
> >   		riscv_v_thread_alloc(p);
> > -	p->thread.ra = (unsigned long)ret_from_fork;
> > +	p->thread.ra = (unsigned long)ret_from_fork_asm;
> >   	p->thread.sp = (unsigned long)childregs; /* kernel sp */
> >   	return 0;
> >   }
> > 
> 
> With the comment fix, you can add:
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> Thanks,
> 
> Alex
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
