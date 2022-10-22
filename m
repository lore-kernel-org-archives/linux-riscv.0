Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28952C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Oct 2022 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urJwk1pq6XLu0b/LEXAphUsN6XbLgJfa3NZehaqU/jg=; b=HdACcSjec2lzFH
	VOBLTzZ+a7QqtW2C733Di1/IpcEspsamKYelW0nxkd1KozZBihaC4mD1aglVQWN2HjHrOMj+3nRht
	ZZgeGj5AY3Zc5ddBQcrnCkh7Z9ctUIYmSXtPvYuR/TRtaiQ7zmk3SsxF5WsPuVZT28ptU0WJtCfEc
	JeaXkuoiR+40nLJz5ybK8srC55b00zg5DZ/sILiuRX1oPXcvy/trroXdPS7k2M7PFdOCo4ikXcNGu
	FtoOJYoqKlvPyE76hQHRoyhqmXJGvGukeq8lFFBMCXuQkjkXvheeiURrgIHXbCnHmEArdAPd2KsFf
	Sg8e2DFj9xqk9AnlV7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omKa9-00DgyZ-AE; Sat, 22 Oct 2022 19:54:57 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omKa6-00DgxX-7x
	for linux-riscv@lists.infradead.org; Sat, 22 Oct 2022 19:54:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b12so17712293edd.6
        for <linux-riscv@lists.infradead.org>; Sat, 22 Oct 2022 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HfWPRu5q58QJ1JKXH68bmCGHok/snJYWZPaSUmG49w=;
        b=iy6YbSr70F78qE2NooxPIao3DPxphTPr9RnYeG3jQ0tTosLAp2CQoReO6/hn3dnB8b
         qtAIXo/uoBNqOAPAk+wVcxRNkQGo7WjvQ/k3KPJryfAMYaLt24FHfsCR4GWLj7Gx+a5J
         EHtgQ5CvYXXcSVGFaHMsHKnwVj0q2fEu0hfhRff9mRkniVjUyvRsLuXo4gxzDWxKmMw8
         wTYm3y5aQ+AbNCMe5kalWnrNySTgUOGwF2dUT1His7LtFE+AmLoejKXxqoWqiHLlfE7l
         kaXm3pD49DMxtPGvTPxz3JMAjvCQiu21bmvevaSr+VDC+4korJeZhgtInOcGoBa7bL1g
         pU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HfWPRu5q58QJ1JKXH68bmCGHok/snJYWZPaSUmG49w=;
        b=Jm2zCaoQQ+UQXP3aD8iooy4Jq8I1LeXw6HnDYns6lzpHJ5n/794BP+TIRRXPV+Rph/
         ZWHZyaEgz1EorxwrfeJnY6lPg0EBPhng7NtOEF5Em90cg9PaZV6jiRIVEDadLvP9Y5ik
         9bpKgdiwgkD1agmwB+eFH38kjMK4w5zbbtXqMDvPsmO1lLAUzIGWkr2foZNcLYoa7xh2
         yQmfgeTtp71yjBmI44gOY3Hdzdyc02f3tX6IaRTCzN6U5CVavWsYULUVclAVJ3KMK3P1
         vXBtd6ijKrdy57fDszM9KSGTU/82PthGB85+cmBPMgTEmVYWAEB6ejytxKXSGkXlFOCc
         m05Q==
X-Gm-Message-State: ACrzQf1QlC8N47IvzeK4bhUVGb56xFXVyTCq1Od+YLFqB97sWWqY1fp0
	fA0jJhv+CPVsSB8dDMLLqIc=
X-Google-Smtp-Source: AMsMyM5B4qLC2JNOJa9o1IXQHrOZMCtNDiSgCHnorj368usir9HcPehxyyr20AxDJFnoc7Rps0p7Ig==
X-Received: by 2002:a17:907:94d1:b0:790:65a:3a18 with SMTP id dn17-20020a17090794d100b00790065a3a18mr20584651ejc.428.1666468491062;
        Sat, 22 Oct 2022 12:54:51 -0700 (PDT)
Received: from andrea (host-87-17-41-249.retail.telecomitalia.it. [87.17.41.249])
        by smtp.gmail.com with ESMTPSA id cx25-20020a05640222b900b004482dd03fe8sm15453828edb.91.2022.10.22.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 12:54:50 -0700 (PDT)
Date: Sat, 22 Oct 2022 21:54:45 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v2] riscv: fix race when vmap stack overflow
Message-ID: <Y1RKFXEc5mqwQz6l@andrea>
References: <20221020143329.3276-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020143329.3276-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_125454_308533_E04AB845 
X-CRM114-Status: GOOD (  19.00  )
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

On Thu, Oct 20, 2022 at 10:33:29PM +0800, Jisheng Zhang wrote:
> Currently, when detecting vmap stack overflow, riscv firstly switches
> to the so called shadow stack, then use this shadow stack to call the
> get_overflow_stack() to get the overflow stack. However, there's
> a race here if two or more harts use the same shadow stack at the same
> time.
> 
> To solve this race, we introduce spin_shadow_stack atomic var, which
> will be swap between its own address and 0 in atomic way, when the
> var is set, it means the shadow_stack is being used; when the var
> is cleared, it means the shadow_stack isn't being used.
> 
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Guo Ren <guoren@kernel.org>
> ---
> Since v1:
>  - use smp_store_release directly
>  - use unsigned int instead of atomic_t
> 
>  arch/riscv/kernel/entry.S | 4 ++++
>  arch/riscv/kernel/traps.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index b9eda3fcbd6d..7b924b16792b 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
>  
>  #ifdef CONFIG_VMAP_STACK
>  handle_kernel_stack_overflow:
> +1:	la sp, spin_shadow_stack
> +	amoswap.w sp, sp, (sp)
> +	bnez sp, 1b
> +
>  	la sp, shadow_stack
>  	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>  
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index f3e96d60a2ff..f1f57c1241b6 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
>  		OVERFLOW_STACK_SIZE;
>  }
>  
> +unsigned int spin_shadow_stack;
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>  	unsigned long tsk_stk = (unsigned long)current->stack;
>  	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>  
> +	smp_store_release(&spin_shadow_stack, 0);
> +

Maybe add a comment integrating Guo's remarks,

  https://lore.kernel.org/all/CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com/T/#u
  https://lore.kernel.org/all/CAJF2gTRdtcpccL5W48O8VEXCMvxNAyyrKJzhwNJkc8js+H2iJg@mail.gmail.com/T/#u

It will come in handy to future reviewers (and it would address the
checkpatch.pl's "memory barrier without comment" warning).

Thanks,
  Andrea


>  	console_verbose();
>  
>  	pr_emerg("Insufficient stack space to handle exception!\n");
> -- 
> 2.37.2
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
