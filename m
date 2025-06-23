Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E896BC7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bAkPcEZWw05GBeCScL4QlJhOg/WkM/fMjmqg8KlBJtE=; b=lC88zl1aEUXNXg6pxQDi33ZANR
	FO5RaZtExOrQQeYw5nd6oMC+X/vflv793MAR6N3ueOl4Zf0irG+tSEqaNQ+b+cLESyN/fvD95XVPV
	5M3+r8F4ZNSHnGHA1leNAilL66kVu03m1ciJrz1imMu2mbUOn1qpHVUhb7DRY7I7M+jstDBltZnu5
	m9Pc+JizbPDYE3t420G/9VTZkEkDdqO9LN6PY3Ftv8eg4uGCwfcmwjoSgJ56HG4r3RFPjCAJ8K8Jv
	lEH/TmYCB1JOt5gwAGh3bsulwXICxcsl72SchphN8QApbQIVKBVi5EwSi+lWhwvbUIbn1Xxa4WPBe
	FN3GliOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscT-00000004NtL-3ruC;
	Tue, 24 Jun 2025 01:38:41 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpTd-000000045xz-2jXZ
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 22:17:23 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso4979253a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 15:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750717040; x=1751321840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwALQ0/M99GpNXm649yfXIYpBjTO5FIrE5mdkDBYsC4=;
        b=Z0a13kQcgaCnXOyMLJqMMleEKy/CbCpwvFgqmvsyY0CJDvUxEECG4IBez70jwcDDGl
         tyM1M2VjuzlaJrt2VZ2kw0K8SyrWSwS+zlE0AdQoct7V0VtfXoEG3HEJAKlNGCmQQlFq
         AhGAg/1ycloeatWtLQBnyn2fi2y3fEP7+VwCF37M+zYBqk46N3bjEJwqU5hL4Xp2cNTQ
         PUzqH5r+aFt51UVlxbDF3VqlvLRCcEQBpFc747vIMjKmpbojnHdo2yNeZxBhSM6DWs5+
         5SPahuCOvCT8eTHw15BfGdiMBlZZji3OgJlrQmRiWQ+NIDxAIW1qUp/A/G6REVWG741+
         yTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750717040; x=1751321840;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwALQ0/M99GpNXm649yfXIYpBjTO5FIrE5mdkDBYsC4=;
        b=iZOcokYEjvMtihaPvsLoODZxscdyyN+Ft2C/kdCiAbsZTo2opxnN35evsTdLjlFzoF
         mZXxNS3ODzmGKVONE3JcYRlRc47Dxr63hMZvZ3Tn7uRAKYsEeSlpX6j1iD8pyh093ZUf
         5fegRcco+/klEIPuOkmY8vKkD4ZmlfLG/xaoNs4QHAWq2n3XkgrX8bEHCuS+D18AQyKT
         c8ZD80a7F4qcuqBjxfsd20nWGIEcjZNORmPe6oHrkZ+RrlcNQe8yELnM9jPEgu1R84FT
         s+If6yCFM7f/YxBYm895Vdly2Kz1nu7sr9V54xn2GoloXJn0wKyBOCjiLbslHgg4h4Qi
         Bdtw==
X-Forwarded-Encrypted: i=1; AJvYcCWyCsDD/87oC12h3Oe/joJt4kF+h2o7yVW8t8dGM+6Y4lrZBwkDk7+n0ZWfhghWk1HqbK/65QXKgrQ9Qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YylX5qrzZDAB2jlXWONAodd/fq7BGphmwU7ZVoTYWfvS0JK0XTF
	cjeRsoknDAi7MTHrDWQrME9ajsd6dUz2c1wIJEXJnCdQ5rPQAR2c++nsreRiLO/r3yE=
X-Gm-Gg: ASbGncvi7rz+6whQ1x2fBcmJCCm5TbVC755Z+O7uVu2PB9oMcb4j9ZO6unhBJbREUQP
	u4IZ3TvVdVhntaIPGUYfGNXjnZgYog3/C+iVyRISAMuq6BcEP2WnqqIl1f+Ut/zI8PRMownsnaO
	Nv/BcbACemP6YgEEobFdldigctHbCZXaoOtPpj5TGB/apsDdLIkZSQQOFCyBkiNkeyM91kI5Fe6
	V7bG2Yq/MPOm5dgbVAD/ZaRjDdQbAiH1PXqpraLWyGlPPKR0E+kJr7Xgzwu+LOqx6ZB4UAF6lJ1
	9kSHtRlz3J3+19TEMSqGwNSVYVlvpK2+xTLSYVjgnmzJQ49O5Q1wZmwWgEglqyatHsE2kBc=
X-Google-Smtp-Source: AGHT+IElt6M7x8aXRpogAoTHdWeL/Uqxi5GNVPzJBQouv9xg34gl6XJEz0EoG9yvqb/nuTqJZTpptA==
X-Received: by 2002:a17:90b:4e83:b0:313:f9f6:309f with SMTP id 98e67ed59e1d1-3159d8f998cmr18402246a91.34.1750717040272;
        Mon, 23 Jun 2025 15:17:20 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d839332bsm92675595ad.40.2025.06.23.15.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:17:19 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:17:19 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 15:17:17 PDT (-0700)
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
In-Reply-To: <20250620114346.1740512-1-namcao@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
  linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  namcao@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_151721_784569_0D94F8BD 
X-CRM114-Status: GOOD (  32.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 20 Jun 2025 04:43:46 PDT (-0700), namcao@linutronix.de wrote:
> force_sig_fault() takes a spinlock, which is a sleeping lock with
> CONFIG_PREEMPT_RT=y. However, exception handling calls force_sig_fault()
> with interrupt disabled, causing a sleeping in atomic context warning.
>
> This can be reproduced using userspace programs such as:
>     int main() { asm ("ebreak"); }
> or
>     int main() { asm ("unimp"); }
>
> There is no reason that interrupt must be disabled during exception
> handling.

Looks like they used to and we lost it as of f0bddf50586d ("riscv: 
entry: Convert to generic entry"), where we'd check the PIE bit and 
quickly re-enable interrupts if they were enabled before.

This way of doing it also seems fine, and it's kind of nice that we can 
just read the code to figure out how the interrupt contexts are managed.  
So I think it's fine to keep it this way, even though it's more code.

I'm kind of split on a Fixes tag here.  One could argue it's a 
regression, as having interrupts disabled during exceptions is going to 
cause all sorts of performance issues for users.  Seems a bit risk to 
just backport, though...

That said, if nobody noticed then it's probably a good sign nobody is 
really paying attention and we should just backport it before anyone 
notices...

> Considering the previous struggle with a similar bug [1][2], fix
> this problem once for all by enabling interrupt during exception handling
> whenever possible:
>   - If exception comes from user (interrupt handling was for sure enabled)
>   - If exception comes from kernel and interrupt handling was enabled
>
> This also has the added benefit of avoiding unnecessary delays in interrupt
> handling.
>
> This patch mimics x86's implementation.
>
> Link: https://lore.kernel.org/linux-riscv/20250411073850.3699180-3-nylon.chen@sifive.com [1]
> Link: https://lore.kernel.org/linux-riscv/20250422162324.956065-3-cleger@rivosinc.com [2]
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  arch/riscv/kernel/traps.c | 36 ++++++++++++++++++++++++++++++------
>  arch/riscv/mm/fault.c     |  4 ----
>  2 files changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 9c83848797a78..f7d2372dc0eb6 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -6,6 +6,7 @@
>  #include <linux/cpu.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/irqflags.h>
>  #include <linux/randomize_kstack.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
> @@ -72,6 +73,18 @@ static void dump_instr(const char *loglvl, struct pt_regs *regs)
>  	printk("%sCode: %s\n", loglvl, str);
>  }
>  
> +static void cond_local_irq_enable(struct pt_regs *regs)
> +{
> +	if (!regs_irqs_disabled(regs))
> +		local_irq_enable();
> +}
> +
> +static void cond_local_irq_disable(struct pt_regs *regs)
> +{
> +	if (!regs_irqs_disabled(regs))
> +		local_irq_disable();
> +}
> +
>  void die(struct pt_regs *regs, const char *str)
>  {
>  	static int die_counter;
> @@ -151,11 +164,15 @@ asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
>  {										\
>  	if (user_mode(regs)) {							\
>  		irqentry_enter_from_user_mode(regs);				\
> +		local_irq_enable();						\
>  		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
> +		local_irq_disable();						\
>  		irqentry_exit_to_user_mode(regs);				\
>  	} else {								\
>  		irqentry_state_t state = irqentry_nmi_enter(regs);		\
> +		cond_local_irq_enable(regs);					\
>  		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
> +		cond_local_irq_disable(regs);					\
>  		irqentry_nmi_exit(regs, state);					\
>  	}									\
>  }
> @@ -173,24 +190,23 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>  
>  	if (user_mode(regs)) {
>  		irqentry_enter_from_user_mode(regs);
> -
>  		local_irq_enable();
>  
>  		handled = riscv_v_first_use_handler(regs);
> -
> -		local_irq_disable();
> -
>  		if (!handled)
>  			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
>  				      "Oops - illegal instruction");
>  
> +		local_irq_disable();
>  		irqentry_exit_to_user_mode(regs);
>  	} else {
>  		irqentry_state_t state = irqentry_nmi_enter(regs);
> +		cond_local_irq_enable(regs);
>  
>  		do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
>  			      "Oops - illegal instruction");
>  
> +		cond_local_irq_disable(regs);
>  		irqentry_nmi_exit(regs, state);
>  	}
>  }
> @@ -225,6 +241,7 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
>  		local_irq_enable();
>  	} else {
>  		state = irqentry_nmi_enter(regs);
> +		cond_local_irq_enable(regs);
>  	}
>  
>  	if (misaligned_handler[type].handler(regs))
> @@ -235,6 +252,7 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
>  		local_irq_disable();
>  		irqentry_exit_to_user_mode(regs);
>  	} else {
> +		cond_local_irq_disable(regs);
>  		irqentry_nmi_exit(regs, state);
>  	}
>  }
> @@ -308,15 +326,19 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>  {
>  	if (user_mode(regs)) {
>  		irqentry_enter_from_user_mode(regs);
> +		local_irq_enable();
>  
>  		handle_break(regs);
>  
> +		local_irq_disable();
>  		irqentry_exit_to_user_mode(regs);
>  	} else {
>  		irqentry_state_t state = irqentry_nmi_enter(regs);
> +		cond_local_irq_enable(regs);
>  
>  		handle_break(regs);
>  
> +		cond_local_irq_disable(regs);
>  		irqentry_nmi_exit(regs, state);
>  	}
>  }
> @@ -355,10 +377,12 @@ void do_trap_ecall_u(struct pt_regs *regs)
>  		syscall_exit_to_user_mode(regs);
>  	} else {
>  		irqentry_state_t state = irqentry_nmi_enter(regs);
> +		cond_local_irq_enable(regs);
>  
>  		do_trap_error(regs, SIGILL, ILL_ILLTRP, regs->epc,
>  			"Oops - environment call from U-mode");
>  
> +		cond_local_irq_disable(regs);
>  		irqentry_nmi_exit(regs, state);
>  	}
>  
> @@ -368,11 +392,11 @@ void do_trap_ecall_u(struct pt_regs *regs)
>  asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
>  {
>  	irqentry_state_t state = irqentry_enter(regs);
> +	cond_local_irq_enable(regs);
>  
>  	handle_page_fault(regs);
>  
> -	local_irq_disable();
> -
> +	cond_local_irq_disable(regs);
>  	irqentry_exit(regs, state);
>  }
>  #endif
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 0194324a0c506..6d23ed0ce8a28 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -306,10 +306,6 @@ void handle_page_fault(struct pt_regs *regs)
>  		return;
>  	}
>  
> -	/* Enable interrupts if they were enabled in the parent context. */
> -	if (!regs_irqs_disabled(regs))
> -		local_irq_enable();
> -
>  	/*
>  	 * If we're in an interrupt, have no user context, or are running
>  	 * in an atomic region, then we must not take the fault.
> -- 
> 2.39.5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
