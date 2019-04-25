Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F40C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 19:13:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA19206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 19:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjPfHJoW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kYGyyBe1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA19206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRDC+cwGv+guK4d7jOoR9lcdrs2nmWclNHOtCK/QyUU=; b=XjPfHJoWLWwNl8
	zIj1G1BLaoyfwb0NuOpYfRxCwue+YGiSzk4oWHKZLCjt2uiWLUE+Ytz++T4OON9YVTCZDuxsx90ff
	ha0UuiCrTUlZjcd8euyMvH7al1evyo/dq87AEk71vq3AvbNkQFFKaVh1O3Tn+KbQ+GI304UHnzKzW
	OMjumesasGfMaoz/j1FqLhySXlvhsjz/YRYvCJlpM6kI5msLpQp2DvP/7aOqoU59s2Ao/+o8BdQ9A
	nobdkz9B3lMUtFj9iD1wTl8V+5K3diU8rGgqt/EIj1abK/KP2CUViNMdSOHvt5yWa9zoC3toADF5W
	w6ONRxrGCQAcUHsR0R5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJjoC-00044G-TX; Thu, 25 Apr 2019 19:13:24 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJjo9-00041g-3K
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 19:13:23 +0000
Received: by mail-it1-x144.google.com with SMTP id k64so1925382itb.5
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=A5wwbzdeiQrMV1W27Xj1YcX0Qjh4zwjiYg44ZJ89oQU=;
 b=kYGyyBe13Wv+DV3jzR0y04R2wwk23zd9LzN2fFhhKu+gP6ghvr5EqrDx+R0V5B/Dx9
 +ADYCq07AZJP8BTRi4uKSRBzHzNRPfKxhp5Jr5XaPD2HE7zuiDksc/lTZIu0/7YvbQWm
 27H5VqYNjX0nbRTtHvl17iN4bJ2kirlqKsnBNvO2GU3nFryc/NnEtVOqwdEh6Z9D34UN
 Tyiz29JcVOvCgmf87FmmV2Iy8oVV8DgsKdehmnYR3X0QfKfWhp5w2A/u6PmeNBWh+KUH
 SpX3zPDI/7H1LEAo52MG74rQS4w79ELl7hgoVLz6BHWOK0UD6QZtPCGyn4tz7om2z+01
 DFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=A5wwbzdeiQrMV1W27Xj1YcX0Qjh4zwjiYg44ZJ89oQU=;
 b=gYuMcJiUv5qEwrjG+Q+vDjDGlkVQTK7ozg6pntQeUvQqsUfKmr/7lgWRHEhct2fLsf
 W8QqoBbtpfyTKFLKVPa+4SCZq+4RyqFQ3O5i6Ij+Yu9ZeOOGuHBOcyXwlEdNMT+COh8R
 740dCCL1pgck/rQN8HxPWAoNQpnBQ3jZK2anjuFPqkU22wYMNuub4iRwK7MIsTSIZR+J
 kyJkUMEbnuY7I4yPZykhvAd9oXwID+Sd15BOeDK5sGww0vTmnphfz4gaFJ1s683f+D5P
 LKBMuVXmhANBC6sEcgVZVfVaID7DgVZunOs75BwXLgy8UuOurgQiYzJIyjArCpaUZ2iP
 skgQ==
X-Gm-Message-State: APjAAAVQt2XOIh7kYbbPn13OAOkqtUDqKHDbrnHfZO1+/+1J/tJZ4T8S
 quCfWZvwuHbmfe6aXjRvFHXddQ==
X-Google-Smtp-Source: APXvYqyr9NZCc/VcZOsEXVnVfgTlkN1QJMAR6T0f5ifenFiCwrEKIdf/L1GbTz4r9RiJzpOIT9eQxQ==
X-Received: by 2002:a24:76d5:: with SMTP id z204mr4967251itb.44.1556219600184; 
 Thu, 25 Apr 2019 12:13:20 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 x187sm10583787itb.39.2019.04.25.12.13.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 12:13:19 -0700 (PDT)
Date: Thu, 25 Apr 2019 12:13:18 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
In-Reply-To: <20190411115623.5749-8-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1904251208140.17442@viisi.sifive.com>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-8-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_121321_153143_887038E8 
X-CRM114-Status: GOOD (  17.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On Thu, 11 Apr 2019, Christoph Hellwig wrote:

> No need to have two names for the same thing.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This is probably worth cleaning up across the entire tree.  

asm-{generic,x86,arm64,powerpc}/ptrace.h all define similar GET_IP/SET_IP
macros - although it seems that arch/riscv is the only architecture that 
uses them.


- Paul


> ---
>  arch/riscv/include/asm/ptrace.h | 21 ++++++---------------
>  arch/riscv/kernel/stacktrace.c  |  8 ++++----
>  arch/riscv/kernel/traps.c       |  2 +-
>  3 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index d35ec2f41381..9c867a4bac83 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -70,47 +70,38 @@ struct pt_regs {
>  
>  
>  /* Helpers for working with the instruction pointer */
> -#define GET_IP(regs) ((regs)->sepc)
> -#define SET_IP(regs, val) (GET_IP(regs) = (val))
> -
>  static inline unsigned long instruction_pointer(struct pt_regs *regs)
>  {
> -	return GET_IP(regs);
> +	return regs->sepc;
>  }
>  static inline void instruction_pointer_set(struct pt_regs *regs,
>  					   unsigned long val)
>  {
> -	SET_IP(regs, val);
> +	regs->sepc = val;
>  }
>  
>  #define profile_pc(regs) instruction_pointer(regs)
>  
>  /* Helpers for working with the user stack pointer */
> -#define GET_USP(regs) ((regs)->sp)
> -#define SET_USP(regs, val) (GET_USP(regs) = (val))
> -
>  static inline unsigned long user_stack_pointer(struct pt_regs *regs)
>  {
> -	return GET_USP(regs);
> +	return regs->sp;
>  }
>  static inline void user_stack_pointer_set(struct pt_regs *regs,
>  					  unsigned long val)
>  {
> -	SET_USP(regs, val);
> +	regs->sp =  val;
>  }
>  
>  /* Helpers for working with the frame pointer */
> -#define GET_FP(regs) ((regs)->s0)
> -#define SET_FP(regs, val) (GET_FP(regs) = (val))
> -
>  static inline unsigned long frame_pointer(struct pt_regs *regs)
>  {
> -	return GET_FP(regs);
> +	return regs->s0;
>  }
>  static inline void frame_pointer_set(struct pt_regs *regs,
>  				     unsigned long val)
>  {
> -	SET_FP(regs, val);
> +	regs->s0 = val;
>  }
>  
>  static inline unsigned long regs_return_value(struct pt_regs *regs)
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index a4b1d94371a0..25fe0ff81f9e 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -33,9 +33,9 @@ static void notrace walk_stackframe(struct task_struct *task,
>  	unsigned long fp, sp, pc;
>  
>  	if (regs) {
> -		fp = GET_FP(regs);
> -		sp = GET_USP(regs);
> -		pc = GET_IP(regs);
> +		fp = frame_pointer(regs);
> +		sp = user_stack_pointer(regs);
> +		pc = instruction_pointer(regs);
>  	} else if (task == NULL || task == current) {
>  		const register unsigned long current_sp __asm__ ("sp");
>  		fp = (unsigned long)__builtin_frame_address(0);
> @@ -83,7 +83,7 @@ static void notrace walk_stackframe(struct task_struct *task,
>  
>  	if (regs) {
>  		sp = GET_USP(regs);
> -		pc = GET_IP(regs);
> +		pc = instruction_pointer(regs);
>  	} else if (task == NULL || task == current) {
>  		const register unsigned long current_sp __asm__ ("sp");
>  		sp = current_sp;
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 24a9333dda2c..86731a2fa218 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -70,7 +70,7 @@ void do_trap(struct pt_regs *regs, int signo, int code,
>  	    && printk_ratelimit()) {
>  		pr_info("%s[%d]: unhandled signal %d code 0x%x at 0x" REG_FMT,
>  			tsk->comm, task_pid_nr(tsk), signo, code, addr);
> -		print_vma_addr(KERN_CONT " in ", GET_IP(regs));
> +		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
>  		pr_cont("\n");
>  		show_regs(regs);
>  	}
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
