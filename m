Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FF9D10DCF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMyF2WNPsDtvcTUORc8Iqjeb4HnZRbk7gDYug0i2ddM=; b=lmF5x0IIqyST9+
	bAtIyrpJq/JdlYM08ev009bJZJC6N1pFMzz0YorfTwy/xt3yCD4UX/m3mK9EUiKdilccvCHreZ1o1
	I0wrMWQHoWyn5HgJaqyDT2GrI0SaOP/ElT6bHk3pShU7IomOx5TDw56/5pWize9uzJJvvT1QqW9cb
	IAB5o8F91PoQaaAgtPaeL6nSdr1FYWK4BJOHgUdEFPxu3283xG8GvEi8CAnOsfmPJJEAGUOXwi1+7
	RB4bMjYylbWpEGzq4dpJ5Hbi03rffYaz+hosFgL3Ehrv5VhwoYZwTr/lLFKkn84LaCQH6phNFVaLT
	/iQW4JPkTmS7EmRUqPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2XG-00000005WtC-3hLs;
	Mon, 02 Dec 2024 09:16:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2XE-00000005WsN-1D5r
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 09:16:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so23031735e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 01:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733130962; x=1733735762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PbXPoKzuEWLEsDPk3b5xGk6riuot8uVZBLJoJHizJos=;
        b=AXvSZn2j3bgSYyneD5q7OT8qipBHfrG+wMVUPSs4iWiApZR9GocjIdjV7ivwyIYO5g
         YvEvIvvMwDzHHKspkt6KXBGb3X9eUfurQLEHswlOC6JsNeMYpyslWAa4Xy2Z3pOw0q/8
         x+9YadNmGb3H2UCSWkch4Uoy+Fsg3APAypo0QjmmEQq7rl7VjaeOiXh4jarpIbJ2uDTy
         ba9gNGXVtpOtsLJNtY9/KwRkNCpI8k0QqrmJM/5AX24AyykxJH66+13wPX0NEefWKAM8
         iJT0w4FbXo1H7wRGOg2KqQtpfnXFTt9JoVktQ0x7UfJEw56IUQudcYqfar7gIAJFs8AY
         i0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130962; x=1733735762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbXPoKzuEWLEsDPk3b5xGk6riuot8uVZBLJoJHizJos=;
        b=Pwh5esIkoRu+pwEq6VDUbABXIM7u8do1HB4JrpzW9X3hpIjq8/KH+ESbRPj/0ZNnQY
         Iq7sOey5jD5G+Q896v6Xogvc833P3LaKDup7H4nVluYWmQeA0fmBHHziKIBeABbBS0bz
         rIFwFNemzPB2KJ6MVHh8S5+BLgE9vakh1DTlpvAFwRRdf/zXaYYek+2l7kAnVHSzSqVl
         bOylle8FF9Z4iPpNHvt3ul87sye/K1WpPnafipikE8xolbXhPiswYmw7Xqi6kWhzpsWR
         88kds1ZNfmpjLoj+EQqgTG+FPctgUVgzwicbpSVwaCWYmlFOLKJdoMKCPzfzxOlZmyE5
         epgw==
X-Gm-Message-State: AOJu0YyPzL+01ZQYe5UGXcNctEBKzmG8znu3AvYbxzTDlaktsF0Hf6WK
	LaritzEURsifWDoK62dQwOUSFW/6wEC53eU+/Nni+YQUZcB5lZAzpQ3YH4I1DjxMWKZzllzbEBq
	nWYk=
X-Gm-Gg: ASbGncuIUPMvy4qg4a4w5/sJlW09itq8jU+5GExtzOA+iIPLNAWGtYOo2rVXJQdhIc+
	gT2iedhKmpWsidq6rkb9rOlZ7qJkj77q/aWEIk4ZpH0kE/T4n/iYMeuBBdW1EV8sNJ6OVRzE+RS
	HbTWsON+F8AXnEUFUiMWidUhk+NjtJ/Au71ApoZAb7UIpltWW5NLLK+HSpHn79CZvkzuJcL2J6H
	2XqZ5yRMEYk2xPk9XeVx3z9i7zy1sk6B0QkFHCavktEcr1ZYJnTl5XiH9eYCrA+wjrzz167/wxt
	hyXt6YIov3VY8VNYTYUCuzUB1427HlF32dE=
X-Google-Smtp-Source: AGHT+IHqZ75AXxhsyKLVSfouB+KsS0L2VXCacky6WK3uuCVf2bPCWBUxF/tCs8qW1GWYlzuVciPY7Q==
X-Received: by 2002:a05:600c:5123:b0:434:9ff4:24a1 with SMTP id 5b1f17b1804b1-434afc3e694mr158679625e9.13.1733130962357;
        Mon, 02 Dec 2024 01:16:02 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bcf9sm144343075e9.6.2024.12.02.01.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:16:01 -0800 (PST)
Date: Mon, 2 Dec 2024 10:16:01 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: Re: [PATCH v2 2/3] riscv: traps: make insn fetch common in unknown
 instruction
Message-ID: <20241202-497efc55997ac9d7c8c297fc@orel>
References: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
 <20241201102759.221176-3-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241201102759.221176-3-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_011604_327019_6845F71E 
X-CRM114-Status: GOOD (  21.84  )
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

On Sun, Dec 01, 2024 at 10:27:58AM +0000, Ben Dooks wrote:
> Add the trapped instruction (insn) as the second argument to
> riscv_v_first_use_handler() from the trap handler so when we
> add more handlers we can do the fetch of the instruction just
> once.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> - fixed wording of patch from rfc
> v2:
>   - fixed todo by going to illegal instruction error if get_user fails
>   - added pointer print for failed read
>   - fixed issues with rebasing onto main branch
> ---
>  arch/riscv/include/asm/vector.h |  4 ++--
>  arch/riscv/kernel/traps.c       | 14 +++++++++++++-
>  arch/riscv/kernel/vector.c      | 11 +----------
>  3 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index c7c023afbacd..9ec2473c1b73 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -22,7 +22,7 @@
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
>  bool insn_is_vector(u32 insn_buf);
> -bool riscv_v_first_use_handler(struct pt_regs *regs);
> +bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn);
>  void kernel_vector_begin(void);
>  void kernel_vector_end(void);
>  void get_cpu_vector_context(void);
> @@ -270,7 +270,7 @@ struct pt_regs;
>  static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
>  static __always_inline bool has_vector(void) { return false; }
>  static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
> -static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
> +static inline bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn) { return false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
>  static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>  #define riscv_v_vsize (0)
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 51ebfd23e007..9662138ba45c 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -172,11 +172,23 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>  	bool handled;
>  
>  	if (user_mode(regs)) {
> +		u32 __user *epc = (u32 __user *)regs->epc;
> +		u32 insn = (u32)regs->badaddr;
> +
>  		irqentry_enter_from_user_mode(regs);
>  
>  		local_irq_enable();
>  
> -		handled = riscv_v_first_use_handler(regs);
> +		if (!insn) {
> +			if (__get_user(insn, epc)) {
> +				printk_ratelimited(KERN_ERR "traps: failed to read instruction at user %px\n", epc);

I don't think we want this, even ratelimited.

> +				handled = false;
> +				insn = 0;
> +			}
> +		}
> +
> +		if (insn)
> +			handled = riscv_v_first_use_handler(regs, insn);
>  
>  		local_irq_disable();
>  
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 821818886fab..08164a9121fe 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -168,11 +168,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
>  }
>  EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
>  
> -bool riscv_v_first_use_handler(struct pt_regs *regs)
> +bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn)
>  {
> -	u32 __user *epc = (u32 __user *)regs->epc;
> -	u32 insn = (u32)regs->badaddr;
> -
>  	if (!has_vector())
>  		return false;
>  
> @@ -184,12 +181,6 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
>  	if (riscv_v_vstate_query(regs))
>  		return false;
>  
> -	/* Get the instruction */
> -	if (!insn) {
> -		if (__get_user(insn, epc))
> -			return false;
> -	}
> -
>  	/* Filter out non-V instructions */
>  	if (!insn_is_vector(insn))
>  		return false;
> -- 
> 2.37.2.352.g3c44437643
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
