Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973A3C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGv6CocS2h7rfuzfPhKT03yqRxBzVPc27U7a6gDDWDA=; b=hfQsnGpiGYczTT
	UEyQ5KilAGOcfvCoAW1zGeHg2cCyJO8qVZ65usg3MKUydOzoHjjHjuWl/Bw46Dke9K4AHdougL6mQ
	510SQnGLtYoyOYZGk1epw+69leEKPImo8U5xNtGLObMH2pHNYl74E9kRLZJmNgNkQdO1OvKH8Agh8
	1g6vZGcUuIfSMbrBaK3Dehp26G3t5Dj/t1HpxYOI6Tl4ubRNjkmcwCkhG2hWdOvwUYKPdnz1ykV9Q
	Dc/viteuNSWSDnOK0YiDMNzaJmKYGMJGYqwu9y//Dp3CMejbv3WuYv9ACOBjLN9nPO7VTBu9i+gBN
	c0Nn6pcomdc8ylmvHfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuep-00000003Vf6-2V6I;
	Thu, 09 Jul 2026 19:43:39 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuem-00000003Vcg-0PPU
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 19:43:38 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so126803a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783626215; x=1784231015; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcViCEZV9Tm/crNMdaH3VAbncnTvlz/mpQaPDKjBGxQ=;
        b=Rk6QvIPchZE/vkYoAn3ZcO0kGqzpH6P+NZWTLdSKjwRRCpIhKURVGl6UB3hGh6HEEB
         ez8268U/f9Onu73FYgb96Km7O4ZGH2OdLSS1HmWsDtWNXiUbnr+PLLNtO6phijXJ36YH
         LGkk68B0cZzQQUXi3nyUyQ746qg951l8Rcdnfp/ZRvDOIsMJkHkyZq/uOcknesURebyH
         J7MUWTAuZdNfaf8Ev8T2XgRKbkg2jpaX2tYpQWb3/ATWGpYlzNkGVZ/4GLN1nWHmxM4n
         QVNWWUUJWCmW6eztlIqPm4JbzVrxn7aiUOrAY0+nPfdDM7Rez9INsjhH2RF7krwFQhqI
         diEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783626215; x=1784231015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcViCEZV9Tm/crNMdaH3VAbncnTvlz/mpQaPDKjBGxQ=;
        b=kOulIfMnPArmuAUGPbK0SNNR3qVw2A9v0VtvlgfqPkR4ZS7veWG1xLnqeU9+7f6YmG
         XtulAU8iDuV9/EdkO5x+1NqerR6UPdjwrXv9WGrDLixaW3VI6bzCe0JmoXYJ2e0s4/ct
         VtBuw6W/yNJO/YgNifRyRw5g51k7jHQ9SRUrBl8n+dIPH1cEwytyJhQSnev0PGmsss1z
         rd3Gjj41NZJ1CBu+og/4UMCwqEZdZS0W5NJvc7tREhWZUz8rvGSIw3jeuAAB48mgyZtd
         xGKAqJfUzhOqqEFolhUS6mrwv2CxQ8ieP+gbKQnNBQTc72QcSNTmLO2jbFCYwdVld3g6
         389Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Qpyo36LbhJgu4N5cX284lgnrIYemMr4JO5S4WQ6REQHO+N/TeLRCXiYWwZ7GJWUJSVxqE2EpU8sBnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnBWzDCRy7GILjQzU/eSbN72LRyWtBv63heqKtG6WWELdl8eHW
	+wpxfn5ljHV+IBvFmoTlWwfIfWRMsps9+Z42CWhHp2FPruAiChMJCd5X
X-Gm-Gg: AfdE7cmE5kY8hC8qZ2+W/Zbfi5DsmJ3YEa0T8XuAxaEBLR5SgEcc5EUljWeuau1YL60
	PCCpFmPHKz6SWbeFRj15ZReHM3uloOmUJicQRjH64bUgEgCPUi8kqr9u7MuI9He3G6qIuZLIfYC
	CUQqlo5QjwJcuXjOOjmk9trVOduusP994PO48Tlx7zkzSQQ6olI3s8G4UL/Ri+Y9Ij+XMKOV1f4
	duFBYTmn0Ztqrx5Rken2o95xrn31zGQlUfLsNbvv2kTAfIyhh+G+/DYDmzGeY9wQuAB0EOhOn5N
	fhPiKZWW2lKn4wOsJVhRYS/6M5Gbh4k2SGgbKDbojcYvCfQgR6058LeFLvy7jZL/bnbeujr+yD8
	W+1xeERlMwPq8qJHjxpMi0cAxWNBHKogbxfRA+Ve5mJl6/YqmyLhp0TWR+DCoaSxAyaYp5heZvI
	6c2us94s2XrKh9GIyO2o4wX5pULjBtyBq9ETPcSI9ctXddM0y6/QmJg3ALx9iR
X-Received: by 2002:a05:6a21:6daa:b0:3c0:9c1a:8949 with SMTP id adf61e73a8af0-3c0bd287dd3mr11145411637.65.1783626215188;
        Thu, 09 Jul 2026 12:43:35 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm39667491c88.2.2026.07.09.12.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:43:34 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:13:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 15/18] x86/entry: Make syscall functions static
Message-ID: <ak_5y-p4DPztR-CH@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.438361565@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.438361565@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_124336_133699_53ED1224 
X-CRM114-Status: GOOD (  18.69  )
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

On Tue, Jul 07, 2026 at 09:06:57PM +0200, Thomas Gleixner wrote:
> They are only used in the respective source files. No point in exposing
> them.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  arch/x86/entry/syscall_32.c    |    2 +-
>  arch/x86/entry/syscall_64.c    |   10 ++++++----
>  arch/x86/include/asm/syscall.h |    8 --------
>  3 files changed, 7 insertions(+), 13 deletions(-)
> 
> --- a/arch/x86/entry/syscall_32.c
> +++ b/arch/x86/entry/syscall_32.c
> @@ -41,7 +41,7 @@ const sys_call_ptr_t sys_call_table[] =
>  #endif
>  
>  #define __SYSCALL(nr, sym) case nr: return __ia32_##sym(regs);
> -long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
>  	switch (nr) {
>  	#include <asm/syscalls_32.h>
> --- a/arch/x86/entry/syscall_64.c
> +++ b/arch/x86/entry/syscall_64.c
> @@ -32,7 +32,7 @@ const sys_call_ptr_t sys_call_table[] =
>  #undef  __SYSCALL
>  
>  #define __SYSCALL(nr, sym) case nr: return __x64_##sym(regs);
> -long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
>  	switch (nr) {
>  	#include <asm/syscalls_64.h>
> @@ -40,15 +40,17 @@ long x64_sys_call(const struct pt_regs *
>  	}
>  }
>  
> -#ifdef CONFIG_X86_X32_ABI
> -long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
> +#ifdef CONFIG_X86_X32_ABI
>  	switch (nr) {
>  	#include <asm/syscalls_x32.h>
>  	default: return __x64_sys_ni_syscall(regs);
>  	}
> -}
> +#else
> +	return -ENOSYS;
>  #endif
> +}
>  
>  static __always_inline bool do_syscall_x64(struct pt_regs *regs, int nr)
>  {
> --- a/arch/x86/include/asm/syscall.h
> +++ b/arch/x86/include/asm/syscall.h
> @@ -21,14 +21,6 @@ typedef long (*sys_call_ptr_t)(const str
>  extern const sys_call_ptr_t sys_call_table[];
>  
>  /*
> - * These may not exist, but still put the prototypes in so we
> - * can use IS_ENABLED().
> - */
> -extern long ia32_sys_call(const struct pt_regs *, unsigned int nr);
> -extern long x32_sys_call(const struct pt_regs *, unsigned int nr);
> -extern long x64_sys_call(const struct pt_regs *, unsigned int nr);
> -
> -/*
>   * Only the low 32 bits of orig_ax are meaningful, so we return int.
>   * This importantly ignores the high bits on 64-bit, so comparisons
>   * sign-extend the low 32 bits.
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
