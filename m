Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA60C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R67qT56xNB5694ijqHNv727nEVVjYtyG/cyeDIdyojc=; b=k3/I8cGO1LZuTT
	lhQSNoWrloEAvEfa54DRVlAmOaWIpTu5kzVTY5XBd2Q1Ml71YAJmWwBBnLwE0tZRFqVDA0FEtORwC
	6GgTC4ytsHx8oUD0jhXANrJ6BDFNuUW+BU8p23kXjYa6Sf+lcHQnuCxBQa9YT4BFbSlZvNO9oxzos
	Xp0DMu690vbOaVOf2Yg2zxoA61wuM5csOoz4Dwi/0vDTc3mnLKxe5bO6ULGoIekiF/40yO26ZCToW
	q+ebwSzxpns9NmK5vjbT9GN3xa+Vo4EXI8bvpYBFwOTefiIPi5g+1Arew4or4bKJn585K1mBLytNp
	qZTElG0vYLoJq56uPnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtoc-00000003Jn1-2hou;
	Thu, 09 Jul 2026 18:49:42 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtoZ-00000003Jl5-0H8E
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 18:49:41 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38101f85591so981757a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622978; x=1784227778; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwM8hgg0owOvY9szEO+ZJ41xpH48S7vT5kW5bfv9ji8=;
        b=Oa4tjdps+Y/HSpjMxLnY4vd2GRKD8Yqs49jGB7z96o2QKlyA7lKoBj+z9Ge5QypFDQ
         ZQyGMuciW0FNLcqQqjr5bANN2AAvi+nJQgDLoYy6DTS2x7ywwDAXwEMS+h7IQ+YvD9I5
         6okRy+w6ofbKKvIT9Xu70nzSCGJxNfr7KymYWHZ1G5D5qIOvvOvfVgQUpWzrGiA8L4NR
         nwcSL0uF0Ifkfhvaa4Dai86iFoq6YvbmF7OCDNgY/B5vchKot2nC0OC9b0Fas9bJ/FIh
         IgJR64mCHMRVrWoYIR2L4pqkhR9+SMgVgIUTZgz+EQkjtDcOHKBl5Q4DZQy08qpwSUSM
         4Vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622978; x=1784227778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwM8hgg0owOvY9szEO+ZJ41xpH48S7vT5kW5bfv9ji8=;
        b=mSCWytvgZT6lEoBlrkBxXYjZVq08Zo6ssM0q85vMlMiVW9/V7Bm+bq4FF63mp1c31z
         hWT5e5Vt3TYfv0yosBkEl6cOwr31r9pgmW+qe3tbCDNCRa+Gh31QXTPzeHCpHo+37ezW
         /x+Vg3v+m3uhVHc5GSCrLVf3gyvMJmfO2NAf2AI+24IBFkbApKvSwC8Rw1Q3fU41OGun
         5tZg0i4uJM9AWvY5KcI0/eydOf+aOVzQtYSMd9V2QoOqlpooeBeT2PpbZNFRxG1dnKm3
         k0pctKxIWWUj3cwYHMSIr1NGT3rp6JbODkECswm/zx5Ulx893oPEGtEmiyIXOYHUdPlu
         1LsA==
X-Forwarded-Encrypted: i=1; AHgh+RqJLnCZhmETQHQoWx05vgR5CUL3SlJ2oYfJWXZGCGKpL/4vfRx36wX+vazxkDs9/VDRi9jMeOYIUic9ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRzMAmJqdv6+pAz+Zqo513aUKOc+3YBt6h0g7033of0aRZhyEj
	bX5J+f+x++bm2e3msSlzgMXME1hgD6y8euCRyA+SOBbB+c1VyxikYgBC
X-Gm-Gg: AfdE7cm0bF1nS54TPVqZ+STV4B9AdyVCt5QjVfoz3I1GeMtvNabhr8WMN0SnPPw9ga+
	uxkogzgkapaQ0ZFWj76ALuF3SARXUngSQPo8uTjOxG3XeQWx81u6bOALTAdNGEzHVC2vxUJysgl
	DmrSAhR3uquzl2NJrlj1P326c6nCNAQnhtV8WK00Rs2mzL2neLZBtG3BujFyWgN15D5o7WSRgQR
	NLXSxQJq3OrF/xmqkOhLCim7UFWNGT8jNDaeCP3LRBiTAC2J+V6xxmLgQ9+TPlf8+Smph6gNXxa
	kJjWmtpx/DGUhL2I0P94gelnE1pntMcXfqqMvrdHLuB2QbjbS2GfyBMQGSybpXsZkvyWJ7xpZxS
	CdQA5JFyksyyVAopU/durFH4ntRoP4UPajgloqW4sV3UHwQv4eoxc6DGlleNQanw0H0A/SgXzzC
	UNVlzQvQTeHsUEMpukVB/wzCZ7iT1pIR9esV2qnTwQcZScjdt0OKaXBrvFZ8H3
X-Received: by 2002:a17:90b:180a:b0:387:d9cc:7dc1 with SMTP id 98e67ed59e1d1-38d15c8e9c6mr429024a91.19.1783622978242;
        Thu, 09 Jul 2026 11:49:38 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm37887153eec.1.2026.07.09.11.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:49:37 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:19:18 +0530
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
Subject: Re: [patch 09/18] entry: Remove syscall_enter_from_user_mode()
Message-ID: <ak_tIel1LZh-zlAU@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.132654198@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.132654198@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114939_115274_F075A22C 
X-CRM114-Status: GOOD (  32.52  )
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

On Tue, Jul 07, 2026 at 09:06:32PM +0200, Thomas Gleixner wrote:
> All architecture use either:
> 
>     nr = enter_from_user_mode_randomize_stack(regs, nr);
> 
> or
> 
>     enter_from_user_mode_randomize_stack(regs);
>     nr = syscall_enter_from_user_mode_work(regs, nr);
> 
> Remove the now unused function.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  Documentation/core-api/entry.rst |   17 +++++++++-------
>  include/linux/entry-common.h     |   40 +++------------------------------------
>  include/linux/irq-entry-common.h |    6 ++---
>  3 files changed, 17 insertions(+), 46 deletions(-)
> 
> --- a/Documentation/core-api/entry.rst
> +++ b/Documentation/core-api/entry.rst
> @@ -68,7 +68,7 @@ low-level C code must not be instrumente
>    noinstr void syscall(struct pt_regs *regs, int nr)
>    {
>  	arch_syscall_enter(regs);
> -	nr = syscall_enter_from_user_mode(regs, nr);
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
>  
>  	instrumentation_begin();
>  	if (!invoke_syscall(regs, nr) && nr != -1)
> @@ -78,12 +78,14 @@ low-level C code must not be instrumente
>  	syscall_exit_to_user_mode(regs);
>    }
>  
> -syscall_enter_from_user_mode() first invokes enter_from_user_mode() which
> -establishes state in the following order:
> +syscall_enter_from_user_mode_randomize_stack() first invokes
> +enter_from_user_mode_randomize_stack() which establishes state in the
> +following order:
>  
>    * Lockdep
>    * RCU / Context tracking
>    * Tracing
> +  * Apply stack randomization
>  
>  and then invokes the various entry work functions like ptrace, seccomp, audit,
>  syscall tracing, etc. After all that is done, the instrumentable invoke_syscall
> @@ -99,10 +101,11 @@ that it invokes exit_to_user_mode() whic
>    * RCU / Context tracking
>    * Lockdep
>  
> -syscall_enter_from_user_mode() and syscall_exit_to_user_mode() are also
> -available as fine grained subfunctions in cases where the architecture code
> -has to do extra work between the various steps. In such cases it has to
> -ensure that enter_from_user_mode() is called first on entry and
> +syscall_enter_from_user_mode_randomize_stack() and
> +syscall_exit_to_user_mode() are also available as fine grained subfunctions
> +in cases where the architecture code has to do extra work between the
> +various steps. In such cases it has to ensure that
> +enter_from_user_mode_randomize_stack() is called first on entry and
>  exit_to_user_mode() is called last on exit.
>  
>  Do not nest syscalls. Nested syscalls will cause RCU and/or context tracking
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -19,7 +19,7 @@
>  #endif
>  
>  /*
> - * SYSCALL_WORK flags handled in syscall_enter_from_user_mode()
> + * SYSCALL_WORK flags handled in syscall_enter_from_user_mode_work()
>   */
>  #define SYSCALL_WORK_ENTER	(SYSCALL_WORK_SECCOMP |			\
>  				 SYSCALL_WORK_SYSCALL_TRACEPOINT |	\
> @@ -205,42 +205,10 @@ do {									\
>  	_ret;								\
>  })
>  
> -/**
> - * syscall_enter_from_user_mode - Establish state and check and handle work
> - *				  before invoking a syscall
> - * @regs:	Pointer to currents pt_regs
> - * @syscall:	The syscall number
> - *
> - * Invoked from architecture specific syscall entry code with interrupts
> - * disabled. The calling code has to be non-instrumentable. When the
> - * function returns all state is correct, interrupts are enabled and the
> - * subsequent functions can be instrumented.
> - *
> - * This is the combination of enter_from_user_mode() and
> - * syscall_enter_from_user_mode_work() to be used when there is no
> - * architecture specific work to be done between the two.
> - *
> - * Returns: The original or a modified syscall number. See
> - * syscall_enter_from_user_mode_work() for further explanation.
> - */
> -static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
> -{
> -	long ret;
> -
> -	enter_from_user_mode(regs);
> -
> -	instrumentation_begin();
> -	local_irq_enable();
> -	ret = syscall_enter_from_user_mode_work(regs, syscall);
> -	instrumentation_end();
> -
> -	return ret;
> -}
> -
>  /*
> - * If SYSCALL_EMU is set, then the only reason to report is when
> - * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
> - * instruction has been already reported in syscall_enter_from_user_mode().
> + * If SYSCALL_EMU is set, then the only reason to report is when SINGLESTEP is
> + * set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall instruction has been
> + * already reported in syscall_enter_from_user_mode_work().
>   */
>  static __always_inline bool report_single_step(unsigned long work)
>  {
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -49,9 +49,9 @@
>   * Defaults to an empty implementation. Can be replaced by architecture
>   * specific code.
>   *
> - * Invoked from syscall_enter_from_user_mode() in the non-instrumentable
> - * section. Use __always_inline so the compiler cannot push it out of line
> - * and make it instrumentable.
> + * Invoked from enter_from_user_mode_syscall_and_randomize_stack() in the
> + * non-instrumentable section. Use __always_inline so the compiler cannot push
> + * it out of line and make it instrumentable.
>   */
>  static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs);
>  
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
