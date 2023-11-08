Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53378C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 23:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Lw8gdX/ZGu1gdlLdblYlmgL1lorxkwT+ug6DuAco6I=; b=JrQS2r7lDetTKr
	kODo8qE6s3tKhbypJkhyGI/7LcpMOAztGiH8B3+cqXpWYe7kk69EUTm4oYW7yqa245xftpen8kJwC
	+4fJ4pewcx1hVeTp20ghHi+ugRdKJCEUby2HbXmdtVABjg0coU5KLws4XWV75/Mu0F76IFc5HKRtA
	wzG8wXRYifqS0X5SD2vGwa6NHS7CjP2X5SvjF+AI1Gvyw6REHlBb94vjL8SxQ9gxVpA9v0GWOSCIN
	T+OCC6G0YPJFo6rd6gKwB6ZRnbjvnvx0G6nC3+7OP0t4Uy5kF0uTvSB5w+DWyqqkXaCAs+iIamhTl
	xlrvKJKm0cHQa6fAX6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0sLh-004xhp-0y;
	Wed, 08 Nov 2023 23:52:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0sLd-004xh9-1I
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 23:52:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc131e52f1so10486995ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 15:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699487555; x=1700092355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AvjSg1y4bT22KnIGIJJ0Cbw4BydLG7eim8o3gquiKz8=;
        b=GfCtJpyVM82cdk83cfvZxxW7oP5lNJrbm9cOfSvkSwVKwbiBxTHKt3gSO6wH0eWyd1
         lm8X+/Pw3aZDJXaaETlaQeBsmiMNFIBwP3qK0DY565rX8ulH5ImqfMIXgwP4ncNEmV/G
         8gXk0A0JjaV7WZpeLvhFy58hLsDtYEKwqVD+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699487555; x=1700092355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvjSg1y4bT22KnIGIJJ0Cbw4BydLG7eim8o3gquiKz8=;
        b=IhUSbN4PXkFlpFZJTEidOmVq2v8ABbTejAr8C4hZYQGS3mN4xhpWXmmbYKx+FoL1cG
         SD9W5rDPDCRjxiOJQWmHrxQyPdD+K7pD49JgilhYfsu69B4CXfCtaVEmButgLq1TCPja
         MfFTm9buQxUPmacnSzLaN6XA/f5kvB03vlhExt7psTELMEcMCTHYHFJeU+tb996QCCs7
         C8q9ZLuGsWuGNTH87Qj06DvLdirtBsg2kKIsrWcSN02iXyyw/NXbGE0/mDGRf1EhNNnK
         /YxTya3u8cYLZJKwJG84swzsBcFYkdW3UA0oJ0Og57GIZYWRNF0MU6w+Ck5QaTSTWrnN
         eXNw==
X-Gm-Message-State: AOJu0YyLHSJTFy9PugEPBM0mmm/aBnVNblrYwkRncSagAnz9QOCRMLGm
	h1VPJyt/TIn5bBsb4QU3GoQo19nqkrjCa7IAyPGp/w==
X-Google-Smtp-Source: AGHT+IE56iyH+j6M2vVGHUa3z3ealRKT2+uoIcQR+3BIJD6IhmJ2vPyWIcKCRvZ0dai7YaSYbWg6zg==
X-Received: by 2002:a17:903:4304:b0:1cc:3004:750c with SMTP id jz4-20020a170903430400b001cc3004750cmr7931071plb.20.1699487555307;
        Wed, 08 Nov 2023 15:52:35 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b001cc311ef152sm2267003pli.286.2023.11.08.15.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 15:52:34 -0800 (PST)
Date: Wed, 8 Nov 2023 15:52:34 -0800
From: Kees Cook <keescook@chromium.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	guoren@kernel.org, bjorn@rivosinc.com, jszhang@kernel.org,
	conor.dooley@microchip.com, andy.chiu@sifive.com,
	samitolvanen@google.com, coelacanthushex@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv: Support RANDOMIZE_KSTACK_OFFSET
Message-ID: <202311081552.062D21EB@keescook>
References: <20231101064423.1906122-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231101064423.1906122-1-songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_155237_490410_F3DE240F 
X-CRM114-Status: GOOD (  24.30  )
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

On Wed, Nov 01, 2023 at 02:44:23PM +0800, Song Shuai wrote:
> Inspired from arm64's implement -- commit 70918779aec9
> ("arm64: entry: Enable random_kstack_offset support")
> 
> Add support of kernel stack offset randomization while handling syscall,
> the offset is defaultly limited by KSTACK_OFFSET_MAX() (i.e. 10 bits).
> 
> In order to avoid trigger stack canaries (due to __builtin_alloca) and
> slowing down the entry path, use __no_stack_protector attribute to
> disable stack protector for do_trap_ecall_u() at the function level.
> 
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>

I can't speak to the correctness of the entropy level, but the usage of
the helpers looks correct to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> Testing with randomize_kstack_offset=y cmdline, lkdtm/stack-entropy.sh
> showed appropriate stack offset instead of zero.
> ---
>  arch/riscv/Kconfig        |  1 +
>  arch/riscv/kernel/traps.c | 18 +++++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d607ab0f7c6d..0e843de33f0c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -100,6 +100,7 @@ config RISCV
>  	select HAVE_ARCH_KGDB_QXFER_PKT
>  	select HAVE_ARCH_MMAP_RND_BITS if MMU
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> +	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>  	select HAVE_ARCH_SECCOMP_FILTER
>  	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>  	select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 19807c4d3805..3f869b2d47c3 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -6,6 +6,7 @@
>  #include <linux/cpu.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/signal.h>
> @@ -296,9 +297,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>  	}
>  }
>  
> -asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
> +asmlinkage __visible __trap_section  __no_stack_protector
> +void do_trap_ecall_u(struct pt_regs *regs)
>  {
>  	if (user_mode(regs)) {
> +
>  		long syscall = regs->a7;
>  
>  		regs->epc += 4;
> @@ -308,10 +311,23 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
>  
>  		syscall = syscall_enter_from_user_mode(regs, syscall);
>  
> +		add_random_kstack_offset();
> +
>  		if (syscall >= 0 && syscall < NR_syscalls)
>  			syscall_handler(regs, syscall);
>  		else if (syscall != -1)
>  			regs->a0 = -ENOSYS;
> +		/*
> +		 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
> +		 * so the maximum stack offset is 1k bytes (10 bits).
> +		 *
> +		 * The actual entropy will be further reduced by the compiler when
> +		 * applying stack alignment constraints: 16-byte (i.e. 4-bit) aligned
> +		 * for RV32I or RV64I.
> +		 *
> +		 * The resulting 6 bits of entropy is seen in SP[9:4].
> +		 */
> +		choose_random_kstack_offset(get_random_u16());
>  
>  		syscall_exit_to_user_mode(regs);
>  	} else {
> -- 
> 2.20.1
> 

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
