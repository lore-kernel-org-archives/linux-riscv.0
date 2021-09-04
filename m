Return-Path: <SRS0=w10S=N2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7760C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Sep 2021 12:01:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C86E603E7
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Sep 2021 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C86E603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gqaji8nrPGV6A5siB94w+hXInrzMsecc3Q1XUnbHsHY=; b=sx8/MM5M/ojvc6EXQC3BwcdGNT
	kSmjHUHwQtCjqwmCAXnGCsXPcdjzTbozTnhYzu1q/4sVnfyIx5/6K8yoP2F7jlF5gwXlOYpaNUeEz
	rW/Oc4rc0/SWlRq8c4ytgYeByoH5uDeRjVeWkNkUZSgA4RW1c0urwLlY33kY4NJg1tlGHKc1OhAxV
	fcsIMujSyolu7W/aY8JdMUhimchLGi5pkzb2PKOHkzQcPPDJ91r86+xNbE+GXHMa2xnhnJ0wSi257
	JfHvo0cet/WvflTM4ODR1FJ8S5xMb3TbDwvXoFmbGxcJgq1GhkJi4sOaskx/V+1B1r2ynTLtpdR1Z
	IFqGyDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMULE-00E4uZ-5v; Sat, 04 Sep 2021 12:00:12 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMUL1-00E4tC-0z; Sat, 04 Sep 2021 12:00:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id i13so1291188pjv.5;
 Sat, 04 Sep 2021 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cSlbZmXpuYD8xFeqZ0DwF8X1WWOBci0BBC9riaxZUYA=;
 b=V/PDsqjvnlJBrJ+JE89/2f5evnVWxc43lhab6iUxot8bmYz+k40WJyKDXQ4ADGSfpn
 SP/aotyqNyc9kL2HYOrc9BpAmWTCKz8FSnqj1J0FsqZA5wkQ4FRt4kFsFVPOvt5Yb+sr
 JmDzj4fa2KlG+O109gOcKvbkkoLWQBV0YL/i5AEuut3omZNT3FWgfwM2Oo14pv2N9o1L
 kxMZLAkfy3GNBL2rPG08tKEF8IIomALvwgQjBC5qOE8Ag9YrjJxA3FstQiTkUf7ltZPL
 8nv83RBDTNJCHU0CzhxrnbeL1pQOZRn+l3h1XXCV6RjYe52sAPWYc2fgymiBKkDrXJSZ
 VFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cSlbZmXpuYD8xFeqZ0DwF8X1WWOBci0BBC9riaxZUYA=;
 b=E0jbnqeSymvRbmjJWbESBBUTGNEkjgm55US/4glC7qfnzv8494ImumMCG0PUTbULtw
 IDty9pMi+2RJ5+Q5om/juW+PcV4yv32Ti+vlQ2rasBjPHlVmb4YotwtYyo/brc02VbDc
 3BC3muHdo92zwtdDKRb5G5ixbRC+I5SfvUTwJMfEW0vOfJFyUdO+LUsyNF6ioEFhwRYL
 Tau9rxhHH/H8RZEhFId4mztCsA+d+jQhAztoQVlMwPe83QkG6D2LeBYYG4DgtGOqAuyS
 RM/qPN+foCpP9aNHwwfWxYpNwdWW4MnrwAIB0XwkyqQxnhPm+tMS1ItTkKLirI6C8WI9
 x8nQ==
X-Gm-Message-State: AOAM5301AzdxhVirQ+LXPBuq4wFOi5bhQIF7E7QLM8VYjpzrRz38hgm+
 vRCRDFeQHT392afyWtNd9aU=
X-Google-Smtp-Source: ABdhPJwgObY05FTJzW20N4IfqsEwUWKxifFXB24KxwFfOt7JwTfAmgET7xmnoFJ+rG39t5ClYQmC5w==
X-Received: by 2002:a17:90b:4c4f:: with SMTP id
 np15mr3954617pjb.30.1630756797323; 
 Sat, 04 Sep 2021 04:59:57 -0700 (PDT)
Received: from owniadeMacBook-Pro.local ([103.97.201.4])
 by smtp.gmail.com with ESMTPSA id z11sm2306331pfr.157.2021.09.04.04.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 04:59:56 -0700 (PDT)
Subject: Re: [PATCH] ftrace: Cleanup ftrace_dyn_arch_init()
To: rostedt@goodmis.org, mingo@redhat.com
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 guoren@kernel.org, monstr@monstr.eu, tsbogend@alpha.franken.de,
 nickhu@andestech.com, green.hu@gmail.com, deanbo422@gmail.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
 dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
References: <20210903071817.1162938-1-o451686892@gmail.com>
From: Weizhao Ouyang <o451686892@gmail.com>
Message-ID: <609ef9ee-079a-8d46-4ebe-ef8ab3e1e7ab@gmail.com>
Date: Sat, 4 Sep 2021 19:59:48 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903071817.1162938-1-o451686892@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_045959_148862_9CDD8C8C 
X-CRM114-Status: GOOD (  21.78  )
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


On 2021/9/3 15:18, Weizhao Ouyang wrote:
> Most ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
>
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> ---
>  arch/arm/kernel/ftrace.c          | 5 -----
>  arch/arm64/kernel/ftrace.c        | 5 -----
>  arch/csky/kernel/ftrace.c         | 5 -----
>  arch/ia64/kernel/ftrace.c         | 6 ------
>  arch/microblaze/kernel/ftrace.c   | 5 -----
>  arch/mips/include/asm/ftrace.h    | 2 ++
>  arch/nds32/kernel/ftrace.c        | 5 -----
>  arch/parisc/kernel/ftrace.c       | 5 -----
>  arch/powerpc/include/asm/ftrace.h | 4 ++++
>  arch/riscv/kernel/ftrace.c        | 5 -----
>  arch/s390/kernel/ftrace.c         | 5 -----
>  arch/sh/kernel/ftrace.c           | 5 -----
>  arch/sparc/kernel/ftrace.c        | 5 -----
>  arch/x86/kernel/ftrace.c          | 5 -----
>  include/linux/ftrace.h            | 1 -
>  kernel/trace/ftrace.c             | 5 +++++
>  16 files changed, 11 insertions(+), 62 deletions(-)
>
> diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
> index 3c83b5d29697..a006585e1c09 100644
> --- a/arch/arm/kernel/ftrace.c
> +++ b/arch/arm/kernel/ftrace.c
> @@ -193,11 +193,6 @@ int ftrace_make_nop(struct module *mod,
>  
>  	return ret;
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>  
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
> index 7f467bd9db7a..fc62dfe73f93 100644
> --- a/arch/arm64/kernel/ftrace.c
> +++ b/arch/arm64/kernel/ftrace.c
> @@ -236,11 +236,6 @@ void arch_ftrace_update_code(int command)
>  	command |= FTRACE_MAY_SLEEP;
>  	ftrace_modify_all_code(command);
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>  
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c
> index b4a7ec1517ff..50bfcf129078 100644
> --- a/arch/csky/kernel/ftrace.c
> +++ b/arch/csky/kernel/ftrace.c
> @@ -133,11 +133,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  				(unsigned long)func, true, true);
>  	return ret;
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> diff --git a/arch/ia64/kernel/ftrace.c b/arch/ia64/kernel/ftrace.c
> index b2ab2d58fb30..d6360fd404ab 100644
> --- a/arch/ia64/kernel/ftrace.c
> +++ b/arch/ia64/kernel/ftrace.c
> @@ -194,9 +194,3 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  	flush_icache_range(addr, addr + 16);
>  	return 0;
>  }
> -
> -/* run from kstop_machine */
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> diff --git a/arch/microblaze/kernel/ftrace.c b/arch/microblaze/kernel/ftrace.c
> index 224eea40e1ee..188749d62709 100644
> --- a/arch/microblaze/kernel/ftrace.c
> +++ b/arch/microblaze/kernel/ftrace.c
> @@ -163,11 +163,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  	return ret;
>  }
>  
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> -
>  int ftrace_update_ftrace_func(ftrace_func_t func)
>  {
>  	unsigned long ip = (unsigned long)(&ftrace_call);
> diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
> index b463f2aa5a61..ed013e767390 100644
> --- a/arch/mips/include/asm/ftrace.h
> +++ b/arch/mips/include/asm/ftrace.h
> @@ -76,6 +76,8 @@ do {						\
>  
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +
>  static inline unsigned long ftrace_call_adjust(unsigned long addr)
>  {
>  	return addr;
> diff --git a/arch/nds32/kernel/ftrace.c b/arch/nds32/kernel/ftrace.c
> index 0e23e3a8df6b..f0ef4842d191 100644
> --- a/arch/nds32/kernel/ftrace.c
> +++ b/arch/nds32/kernel/ftrace.c
> @@ -84,11 +84,6 @@ void _ftrace_caller(unsigned long parent_ip)
>  	/* restore all state needed by the compiler epilogue */
>  }
>  
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> -
>  static unsigned long gen_sethi_insn(unsigned long addr)
>  {
>  	unsigned long opcode = 0x46000000;
> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 0a1e75af5382..01581f715737 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -94,11 +94,6 @@ int ftrace_disable_ftrace_graph_caller(void)
>  #endif
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>  int ftrace_update_ftrace_func(ftrace_func_t func)
>  {
>  	return 0;
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index debe8c4f7062..4db83cf4283f 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>  };
>  #endif /* __ASSEMBLY__ */
>  
> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> +int __init ftrace_dyn_arch_init(void);
> +#endif
> +

Sorry there is a mistake CONFIG, I will send a v2 patch later.

>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>  #endif
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 7f1e5203de88..4716f4cdc038 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -154,11 +154,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  
>  	return ret;
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>  #endif
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
> index 0a464d328467..3fd80397ff52 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -262,11 +262,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  	return 0;
>  }
>  
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> -
>  void arch_ftrace_update_code(int command)
>  {
>  	if (ftrace_shared_hotpatch_trampoline(NULL))
> diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c
> index 295c43315bbe..930001bb8c6a 100644
> --- a/arch/sh/kernel/ftrace.c
> +++ b/arch/sh/kernel/ftrace.c
> @@ -252,11 +252,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  
>  	return ftrace_modify_code(rec->ip, old, new);
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>  
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c
> index 684b84ce397f..eaead3da8e03 100644
> --- a/arch/sparc/kernel/ftrace.c
> +++ b/arch/sparc/kernel/ftrace.c
> @@ -82,11 +82,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  	new = ftrace_call_replace(ip, (unsigned long)func);
>  	return ftrace_modify_code(ip, old, new);
>  }
> -
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
>  #endif
>  
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 1b3ce3b4a2a2..23d221a9a3cd 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -252,11 +252,6 @@ void arch_ftrace_update_code(int command)
>  	ftrace_modify_all_code(command);
>  }
>  
> -int __init ftrace_dyn_arch_init(void)
> -{
> -	return 0;
> -}
> -
>  /* Currently only x86_64 supports dynamic trampolines */
>  #ifdef CONFIG_X86_64
>  
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 832e65f06754..f1eca123d89d 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -573,7 +573,6 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char *buf, int enable);
>  
>  /* defined in arch */
>  extern int ftrace_ip_converted(unsigned long ip);
> -extern int ftrace_dyn_arch_init(void);
>  extern void ftrace_replace_code(int enable);
>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>  extern void ftrace_caller(void);
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 7efbc8aaf7f6..4c090323198d 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6846,6 +6846,11 @@ void __init ftrace_free_init_mem(void)
>  	ftrace_free_mem(NULL, start, end);
>  }
>  
> +int __init __weak ftrace_dyn_arch_init(void)
> +{
> +	return 0;
> +}
> +
>  void __init ftrace_init(void)
>  {
>  	extern unsigned long __start_mcount_loc[];

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
