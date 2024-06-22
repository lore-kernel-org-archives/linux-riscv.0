Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443F1C27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 00:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQ8s3DogiLzIa6XlH/qMVg6/zEIevXgI8mRLhmZtYnc=; b=iocI4g/Oub+r/1
	FCwfQl3nq2sAqde1nZHp9za4/we3XWQCJyWRu5IfZP10/VOtsbBK7d3NTjiBolu5/eK+ndHHpsx/n
	hdepnu7io/qzoWxALKKlDSxdKwPYmje5VkppgZ07PiMH4PxC6vLhLe/jntC32daWaPjzjj5WDaT4g
	GumV0zLO+xdOUWYXVSv9oBIv40a2NyHOgIuUYegMoDigGKNj/AaWaJsY8rPi5f0WbjElGPv8ngf7x
	JgDm+JxOmOORSnL+y7XYBWVLbs6SispPtR+CgwjXRYqSpSofLhI8HCbhbDRZmWdYr5VbaXXzFwr73
	75q3oYiN85ZA10NH3n5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKoPr-0000000AzB5-2Awp;
	Sat, 22 Jun 2024 00:15:39 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKoPn-0000000AzAC-3GHv
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 00:15:38 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-79baa4e8531so245693385a.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719015334; x=1719620134; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZHfc77+AsBI7ZIvrtDn0Ug3Hq+I59HmK7jqskjzb04=;
        b=MrxbFR0+BhBzcvR3FieNyWgnW3dNYMJOT7kysfJn9W1oKR8U/T2x2V+e0ivx4IccEH
         OnIQfqmxxJtjgvZ/rypeyGM66MS0MUzY8JrKjll/jpuRbjuf1slkWnFNtZ3Vt5QUORJ1
         V2l0NV/fPH286BQSI3eBr+kPBB0/Oz1PM3XAotaX3b64fegnuzDi8e9hadrg606H/g93
         KrukFoU4t+fvHXklLAkyOia1PW8wdHfpYvXQURAdIePMYFaOxLEYfQIJdsf2w1SUIWqJ
         VnF57U532kHfA1x/13jOBuLWbWDSd7FgaYVIGXXCaaIEleQcRCcAz5kWBA1h+iRzl3m7
         uYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719015334; x=1719620134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZHfc77+AsBI7ZIvrtDn0Ug3Hq+I59HmK7jqskjzb04=;
        b=xKGCsxAKMLtdHKNG2XKJ4ROKcTCU1aUhVo9JJqaPWtHNnH2HlLu55eI7XIlv7mgdiz
         Ax9lxBBPXBayuFW3zDhGVpPZ0s1ORTzaN2laN37bOiBMgbrxv1VFjfAxqwo9Fag1+Qlw
         RbBp0ko1yTYrMgyMSOgeXghRR6nl7lg668q9Bun2Vz1DiBX9NKooTurZREy52eJFHUX7
         UlwwntP5q6GP7CW3pLPD2LkBc91R++OGpCOQbY9d08Plfd7Is3OfXj69CiiWb9bGPODu
         7DR6q20rAbnIqmCm0PghGcB6y5TUK3H4u69MYp6RuKJegZtz/EZJkDR082BuvP/xTRgO
         RYLw==
X-Forwarded-Encrypted: i=1; AJvYcCU9QGDCcn/dICqq2KudHbrPSWv99Df2uk5ryFOpa0q6PkWjeVx9ZW4q2SW/gNUUgUeYEmrnhgeBDhPNXoCxub7dlnAUrg+7IFYG+5l+eiaL
X-Gm-Message-State: AOJu0Yxy2xyfBivl2lxeQvnoHX+ckDgIgCUORkpuhuP4iEFOp33Jmd2R
	eWR2LSlqxvF0wBt8YzfZCxyXk9OabbMPD/LDkuyyGSxUVyGrJzh4Y6Kea9qqMp8=
X-Google-Smtp-Source: AGHT+IEtfCy5irRgq406mdhqbxVK6tZ1eMVhw9yVZQWpU9YbH61bgxHPSLSuJD0F7ka6qLXmDGQySQ==
X-Received: by 2002:ad4:4dce:0:b0:6b4:fbec:952f with SMTP id 6a1803df08f44-6b501e45db7mr110916156d6.25.1719015334476;
        Fri, 21 Jun 2024 17:15:34 -0700 (PDT)
Received: from ghost ([50.236.12.33])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ed181fcsm13145516d6.39.2024.06.21.17.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 17:15:34 -0700 (PDT)
Date: Fri, 21 Jun 2024 17:15:29 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anton Blanchard <antonb@tenstorrent.com>,
	Cyril Bur <cyrilbur@tenstorrent.com>
Subject: Re: [PATCH 1/6] riscv: Improve exception and system call latency
Message-ID: <ZnYXoSDCeQK0Lcz8@ghost>
References: <20240616170553.2832-1-jszhang@kernel.org>
 <20240616170553.2832-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616170553.2832-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_171535_945064_13C510E4 
X-CRM114-Status: GOOD (  25.42  )
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

On Mon, Jun 17, 2024 at 01:05:48AM +0800, Jisheng Zhang wrote:
> From: Anton Blanchard <antonb@tenstorrent.com>
> 
> Many CPUs implement return address branch prediction as a stack. The
> RISCV architecture refers to this as a return address stack (RAS). If
> this gets corrupted then the CPU will mispredict at least one but
> potentally many function returns.
> 
> There are two issues with the current RISCV exception code:
> 
> - We are using the alternate link stack (x5/t0) for the indirect branch
>   which makes the hardware think this is a function return. This will
>   corrupt the RAS.
> 
> - We modify the return address of handle_exception to point to
>   ret_from_exception. This will also corrupt the RAS.
> 
> Testing the null system call latency before and after the patch:
> 
> Visionfive2 (StarFive JH7110 / U74)
> baseline: 189.87 ns
> patched:  176.76 ns
> 
> Lichee pi 4a (T-Head TH1520 / C910)
> baseline: 666.58 ns
> patched:  636.90 ns
> 
> Just over 7% on the U74 and just over 4% on the C910.
> 
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>

Do you need to sign this off since you're sending this Jisheng?

> ---
>  arch/riscv/kernel/entry.S      | 17 ++++++++++-------
>  arch/riscv/kernel/stacktrace.c |  4 ++--
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 68a24cf9481a..c933460ed3e9 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -88,7 +88,6 @@ SYM_CODE_START(handle_exception)
>  	call riscv_v_context_nesting_start
>  #endif
>  	move a0, sp /* pt_regs */
> -	la ra, ret_from_exception
>  
>  	/*
>  	 * MSB of cause differentiates between
> @@ -97,7 +96,8 @@ SYM_CODE_START(handle_exception)
>  	bge s4, zero, 1f
>  
>  	/* Handle interrupts */
> -	tail do_irq
> +	call do_irq
> +	j ret_from_exception
>  1:
>  	/* Handle other exceptions */
>  	slli t0, s4, RISCV_LGPTR
> @@ -105,11 +105,14 @@ SYM_CODE_START(handle_exception)
>  	la t2, excp_vect_table_end
>  	add t0, t1, t0
>  	/* Check if exception code lies within bounds */
> -	bgeu t0, t2, 1f
> -	REG_L t0, 0(t0)
> -	jr t0
> -1:
> -	tail do_trap_unknown
> +	bgeu t0, t2, 3f
> +	REG_L t1, 0(t0)
> +2:	jalr t1
> +	j ret_from_exception
> +3:
> +

The whitespace is odd here, but nonetheless:

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> +	la t1, do_trap_unknown
> +	j 2b
>  SYM_CODE_END(handle_exception)
>  ASM_NOKPROBE(handle_exception)
>  
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 528ec7cc9a62..5eb3d135b717 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -16,7 +16,7 @@
>  
>  #ifdef CONFIG_FRAME_POINTER
>  
> -extern asmlinkage void ret_from_exception(void);
> +extern asmlinkage void handle_exception(void);
>  
>  static inline int fp_is_valid(unsigned long fp, unsigned long sp)
>  {
> @@ -70,7 +70,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			fp = frame->fp;
>  			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
>  						   &frame->ra);
> -			if (pc == (unsigned long)ret_from_exception) {
> +			if (pc == (unsigned long)handle_exception) {
>  				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
>  					break;
>  
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
