Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE90BC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQlO/Mv0q+Vv8ORddrtPT6QREvtiRyAq0rNrsT61ufk=; b=tnYOaJUpTe3kIf
	frlxJYLTGtsKa6GPIRH6c6bL9R2lEnsCB0qxhCS5kk7jxDXaRWWflTBvishg0xzcaVxH3MlZGFmgO
	1KmGTUFIgXqXXk/R+bJyb02uljKE4eknhBkM3+zScu7HDmAlb25qtNOiQAq5W7Jm1Fiks6VnYgFDP
	z/3XfEBH7Eud/29MDnQsDh6TVV6jxDztggoe9nakVrUcvE/RYQd55Tf1y4SxD7SRMoeuhligZvUwS
	/pJ7x/PcgmUEPU77DY5pcFGJoTE8Mphgr5sHWiJo7Lj7P9xbvQTcM3/n+vE/BaQuITqxMwv6Fp2dG
	5P7a9Q7Azo/77ZNQflzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtl6-00000003JED-30ZU;
	Thu, 09 Jul 2026 18:46:04 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtl2-00000003JBu-3bCP
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 18:46:02 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8453427d3f4so70958b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622760; x=1784227560; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPf+9G20chtvWfhmlbsBAcrLn3a4nXZU9b8fTPixMo0=;
        b=ohutmatX3xgDw8P797LqMgg7heIW+K8L4EnxNIpyVqoBr+LuAmLxsGSeeFr1ycmtc7
         EHx6vwvKIcoKdcxqMMST3C2N5NHMkVPjurlal97gR8TVOd50wCnN0Di0f+ylUWjBZRwh
         P+6iHnei8eUMYM/CMo4d8+iRaEN7BYQ+nY4NV2WaUnHkGnAht5y7goP7aPJAlwWN2WSS
         Oy/mAMMiBKW43tM010n5keho6g6hBcpOaeJH8XNGJA1hYJanoGSbrQ70NgTbRAIPVrbA
         VZWG/n+n4mp8ZlTXmLl/RaCNL2fmIAUk/uxa5ijJSPRfd56M6Mq7vtZF9wSP1wKqid0b
         we6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622760; x=1784227560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPf+9G20chtvWfhmlbsBAcrLn3a4nXZU9b8fTPixMo0=;
        b=I7qTGHQJ8lUVSOeE8F8NvQVjcJyUijyrOrIZ/JtNjmgITLQEGiQzI1+mrJ9MDUB0bp
         3M51VuEKHTvIyDP9w62ftvJ8SjhMFlnTyv1BtJ7FNulGSAGmW+MV7l5O9LXW0qNiMC0h
         twFIXmXV25AHlPbH0CRdtNb+P2JW4/8ROodNMp7+mCkcVkJJv+bqDfvb4Ju2F111dZ6P
         bBgt0b7QJD8M+5i/zmtqeSj2FUitgGIi9AEI8DbBUwS0ga2OIq5Ywsu2z+LYAginHec2
         TqsdzkvFsTZJJ18H5dBXhIx7acNJDbLeNJpzWofd7yW512vZNenW+BrD6SVQmJwbZsOm
         lhLw==
X-Forwarded-Encrypted: i=1; AHgh+RqXnsndy6rUaA9Xnf5+KMgQuz7iYHcHeNeGTHNebKzepITaEgEyBvQIApSzCpfGfqUlhdpEyMt8vEknkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz5lpYp+OVcqaOtYFrqvy1WLlJjCErPS8nnxIK7eiwu9ISTy5h
	Sm7ngsuS5d1C1DF1/j3wpwp6D7o+TNPsg4E6++M50xVEkdfd3cJb79NL
X-Gm-Gg: AfdE7clo21nGKWBewY+//2gI+28WHJLPrffN1YnZ0Im8p7YxYSWkK2zpIrwoIKUd/jP
	i4C7ZKfmVrY+konJHjOVRHQX1i3O+npp9Q+9gg6d0vqBrlBw1Xq2YFw3YaseuNSnBTeXGuDFgED
	lP2Pmqdu81hRegfV8KlttkPU0kFhRwbFYh0GiKKaA2AwFlJu4AIidHIqYuLFz/nKtOBhA5/d8BN
	Qb9L2K8+TqkLp53NgIPydWlZqI8vFP4uqWJ/aU+bBVC0hBdfOZuFZa/OafTcCM9duiJAf1nuUQ2
	ubOqXipXMlTOZS+Sc4AyXAy8TPeWg0jUGsNSqWJqbQoxvwBxn7gQ6e0+2r+Y1eYhiD2LMXiisl6
	7cwWzZrtqpXtlDYFObmyRMKnGTdTIsHzYh1+JWCvZgieEdegnP0mvMEG2BqLMJpuab8mktO5wMX
	uYI8itccGJSOswo4Prs3uLU3Bj6LsCY7HVEEe1/BjTwd8YVbt53PK2775oObNt
X-Received: by 2002:a05:6a20:430b:b0:3bf:ae43:4d26 with SMTP id adf61e73a8af0-3c0bcf49cacmr9958974637.5.1783622760038;
        Thu, 09 Jul 2026 11:46:00 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm33384231eec.2.2026.07.09.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:45:59 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:15:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 08/18] x86/syscall: Use
 [syscall_]enter_from_user_mode_randomize_stack()
Message-ID: <ak_sOt1kr8nrVCju@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.079478122@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.079478122@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114600_906419_05A49FB9 
X-CRM114-Status: GOOD (  23.90  )
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

On Tue, Jul 07, 2026 at 09:06:27PM +0200, Thomas Gleixner wrote:
> These functions integrate the stack randomization.
> 
> syscall_enter_from_user_mode_randomize_stack() has the advantage that the
> randomization happens early right after enter_from_user_mode().
> 
> In both cases also the overhead of get/put_cpu_var() in
> add_random_kstack_offset() is avoided.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: x86@kernel.org
> ---
>  arch/x86/entry/syscall_32.c         |   19 +++++--------------
>  arch/x86/entry/syscall_64.c         |    3 +--
>  arch/x86/include/asm/entry-common.h |    1 -
>  3 files changed, 6 insertions(+), 17 deletions(-)
> 
> --- a/arch/x86/entry/syscall_32.c
> +++ b/arch/x86/entry/syscall_32.c
> @@ -142,10 +142,9 @@ static __always_inline bool int80_is_ext
>  	 * int80_is_external() below which calls into the APIC driver.
>  	 * Identical for soft and external interrupts.
>  	 */
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  
>  	/* Validate that this is a soft interrupt to the extent possible */
>  	if (unlikely(int80_is_external()))
> @@ -210,11 +209,9 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
>  {
>  	int nr;
>  
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
> -
>  	/*
>  	 * FRED pushed 0 into regs::orig_ax and regs::ax contains the
>  	 * syscall number.
> @@ -252,10 +249,10 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
>  	 * orig_ax, the int return value truncates it. This matches
>  	 * the semantics of syscall_get_nr().
>  	 */
> -	nr = syscall_enter_from_user_mode(regs, nr);
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
> +
>  	instrumentation_begin();
>  
> -	add_random_kstack_offset();
>  	do_syscall_32_irqs_on(regs, nr);
>  
>  	instrumentation_end();
> @@ -268,15 +265,9 @@ static noinstr bool __do_fast_syscall_32
>  	int nr = syscall_32_enter(regs);
>  	int res;
>  
> -	/*
> -	 * This cannot use syscall_enter_from_user_mode() as it has to
> -	 * fetch EBP before invoking any of the syscall entry work
> -	 * functions.
> -	 */
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  	local_irq_enable();
>  	/* Fetch EBP from where the vDSO stashed it. */
>  	if (IS_ENABLED(CONFIG_X86_64)) {
> --- a/arch/x86/entry/syscall_64.c
> +++ b/arch/x86/entry/syscall_64.c
> @@ -86,10 +86,9 @@ static __always_inline bool do_syscall_x
>  /* Returns true to return using SYSRET, or false to use IRET */
>  __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
>  {
> -	nr = syscall_enter_from_user_mode(regs, nr);
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  
>  	if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr) && nr != -1) {
>  		/* Invalid system call, but still a system call. */
> --- a/arch/x86/include/asm/entry-common.h
> +++ b/arch/x86/include/asm/entry-common.h
> @@ -2,7 +2,6 @@
>  #ifndef _ASM_X86_ENTRY_COMMON_H
>  #define _ASM_X86_ENTRY_COMMON_H
>  
> -#include <linux/randomize_kstack.h>
>  #include <linux/user-return-notifier.h>
>  
>  #include <asm/nospec-branch.h>
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
