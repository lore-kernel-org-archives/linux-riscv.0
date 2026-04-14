Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A05BED7B95
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJEMmppbBRf2bNFGZqNPq3CBvPzValxIDDWmjZxLtlA=; b=nw+99t2qM04lgp
	NwaDaIIf1SSzyDslHgUnQMJTxtmU6BDv5MptgiJ/Ck2hS87M80xXN/mSxh5HxPN8EyxK5gE4rjHni
	ngC4dZdj+iHpiR40xgaACZg3xItWTJx9IV7LVIs/tBaf15ekA74bU1dpG0ZDSTQCbYTBCrk/6H4Mi
	LeurOph0GAYuAyg6cQp6s0Jr/Rm3a6YgiL1l4NVUxOtSe2bM/epGstZFtyVVUjDPlkuWip1eO2JTM
	XGjV6pezvP+3b8DpSVwIgIZELbj3abdrfDMBwR2p8ubIbEpgwnyDNVhS/3fD7QPft7LwTS3qwZK5f
	LlizuAAyuH9qu+u2a8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaoA-0000000H7gM-0gTu;
	Tue, 14 Apr 2026 10:15:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCao7-0000000H7fu-3etw
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 10:15:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso66082675e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776161746; x=1776766546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCAdQQYTWgc6G+kBIPkvatkt1LtP91HaA3fA5VOFl5A=;
        b=UT/ktHDwAs/CuQ6T7jMd9gQBB8i3GQRO3Y1bRVJAJLPWncCTXnk9HDQ3Wb6JrXkqb2
         VFxl73hedE+1UV71lQU9RMvyx05jXyDQD5y/pRfrib6sAD5LP7t5iZz+G8Lj5XKLGNY2
         u/5VTFTHU0hPtNJBlmu/oQuC84lJROLFwrkYWu4CyTUYtC1kHlbvTVst3cHj3qaj22wF
         jtowF8TZ0v5QcfB0kzHqI0rYvAd8p+2g7ByhoWQEyhr4ojtufgsIsSLsSBOH+f03Ml6a
         bN+GE2Tr1pwu28lPpd/vwTx0iwHT9FULxBvpDJpbReMsFDTo0GBFXXHk5vrprdHgDLTD
         Fc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161746; x=1776766546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RCAdQQYTWgc6G+kBIPkvatkt1LtP91HaA3fA5VOFl5A=;
        b=fEqDfN6t6V0wig+ozKAMFVqqnUsZm9QudJG/t2LwtwR3MzdFoYjNROWR7Vw+nwENww
         h9Q2M03kNoeaSMiA8oa42DP5RcibJZk29yUWE/+041ltQUmuSeS8PRn4/WZdzPU5KWls
         0b2R0i6+4qZwI0GkmAQrxiGV2wyGGgvvyFp8wub9u1Lq1iPDj3SXPDmfz8HX75pZPHK7
         Ov0+X9b7ARFWDN0qHJuKAwRAvrPhWosJrCUsFeterT0fVFnZRpa7D+a3aZ8QYCI+B8f4
         QwYIkIgtpOmnHeVky4c6JwiKSwAolfN/K68N1Vk4ps+bYNcm+Yrd9vPr7jX5vO4uXos6
         lEdA==
X-Forwarded-Encrypted: i=1; AFNElJ9JkCCJaqcxnBSYSm0j6Ov/aakY1D29Jbwn5dbzxxPPGI7d8YMCWYU+tIXOnj3bY4AhAxjwJKyQ8wX4sA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Ixba/53zafBer2YKPrLhZRPmwpkVdGPycNcY/iTiEkjhcw5b
	ojiY1dZhyx6kCEhUwN2f29yS9xKxET6yC0IY7i5PEKwefFwIVDnFyE8K
X-Gm-Gg: AeBDieuQwE41P3+E8mto8+KM2BtOkOCSDCP0djLkVJ7hCLhNuKEhx6rFYPxOImi90NC
	hgHPC0xqNjiPY2IpqihNYmquXyMVe71r9XlR3nRaXhDFv4AmVzO5lLFRK975hI+tbkj2oaOPySv
	QpCXtQeUwbWnAlkDdTm0xFpmky9a2T9+oEc4rLhFlcxiiqKfd4aLmYWtJ1SbQ1cALJNGzmycC5T
	Jti3goLhyexdU8X+A7RpYvCNsTs9qZGPx4vwxA7/o4uOigS0WjTDok7scrlelZGwYjspluxN+zq
	2IgHzWjPJhjEAjNEqXoLf7nQWcdIT5EviTwoKkGJmG+DJDSxNs96/EOCHe/+nTi4T4eg8muZbJL
	96gGJ9JcYMDQbHeTNuAt3HfYX4SD3qkQaaJ5LqJkmXrNi2cKGDf9n1JWiz/GSq39LjgS8WlU3pc
	d46hZs7eCD//AYouP3SBrPNwdVUuFlhFE1+pkAz43jL9NmvAlZWLMNVzoC6w==
X-Received: by 2002:a05:6000:240f:b0:43d:77f4:714e with SMTP id ffacd0b85a97d-43d77f4749fmr12143895f8f.48.1776161745939;
        Tue, 14 Apr 2026 03:15:45 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:1aaa:ede0:d93f:dcaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46a85sm40627273f8f.24.2026.04.14.03.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:15:45 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:15:43 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Gleixner <tglx@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: panic if IRQ handler stacks cannot be allocated
Message-ID: <ad4Tz7TIqXlQixFP@osama>
References: <20260404185522.21767-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260404185522.21767-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_031547_926760_D4C466E1 
X-CRM114-Status: GOOD (  19.25  )
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

On Sat, Apr 04, 2026 at 08:55:20PM +0200, Osama Abdelkader wrote:
> init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
> or scs_alloc return NULL, call panic() in this case.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2:
> - call panic() in place instead of return -ENOMEM
> ---
>  arch/riscv/kernel/irq.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index b6af20bc300f..017d42e778be 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -75,28 +75,34 @@ DECLARE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
>  DEFINE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
>  #endif
>  
> -static void init_irq_scs(void)
> +static void __init init_irq_scs(void)
>  {
>  	int cpu;
> +	void *s;
>  
>  	if (!scs_is_enabled())
>  		return;
>  
> -	for_each_possible_cpu(cpu)
> -		per_cpu(irq_shadow_call_stack_ptr, cpu) =
> -			scs_alloc(cpu_to_node(cpu));
> +	for_each_possible_cpu(cpu) {
> +		s = scs_alloc(cpu_to_node(cpu));
> +		if (!s)
> +			panic("Failed to allocate IRQ shadow call stack resources\n");
> +		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
> +	}
>  }
>  
>  DEFINE_PER_CPU(ulong *, irq_stack_ptr);
>  
>  #ifdef CONFIG_VMAP_STACK
> -static void init_irq_stacks(void)
> +static void __init init_irq_stacks(void)
>  {
>  	int cpu;
>  	ulong *p;
>  
>  	for_each_possible_cpu(cpu) {
>  		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
> +		if (!p)
> +			panic("Failed to allocate IRQ stack resources\n");
>  		per_cpu(irq_stack_ptr, cpu) = p;
>  	}
>  }
> @@ -104,7 +110,7 @@ static void init_irq_stacks(void)
>  /* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
>  DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
>  
> -static void init_irq_stacks(void)
> +static void __init init_irq_stacks(void)
>  {
>  	int cpu;
>  
> @@ -129,8 +135,8 @@ void do_softirq_own_stack(void)
>  #endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
>  
>  #else
> -static void init_irq_scs(void) {}
> -static void init_irq_stacks(void) {}
> +static void __init init_irq_scs(void) {}
> +static void __init init_irq_stacks(void) {}
>  #endif /* CONFIG_IRQ_STACKS */
>  
>  int arch_show_interrupts(struct seq_file *p, int prec)
> -- 
> 2.43.0
> 

Hi All,

Can you please review?

Best regards,
Osama

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
