Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B76C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhAyVAqQut04nQbFQydLXqJgSv0zjxZVyStnZ2Lw9ls=; b=cbk59hR+UfXK9o
	5B9QXeOHHMB5XmHAkmpp/M0jixizIOi0lLd+TmkbaDaVmEPf98q/6PWL74tktTx9CUoz3hp5Dthby
	qqrtqwnEf7/LY4K3jCkDqf6dgJR1cg3yPe7x/YHYOuHgoAuqarAMM9ey69PfcJPeZbS2o5SrL076E
	ERMZigACjPakDAr0khh5unbBpeL95qALy0oLxGdXGb17kF8QoJpLfbxJEL3svToojljlGbfoE1/dX
	07QWkEmbbc4UCFcTNcu1MlnDn29hJTHbP1lZ4Ch+j/uQahq1nmHDs2QliJs/4cL4++rReoe6e4awz
	0XEj2XYzYeakhKmEpGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuL5-00000003SKO-1MSW;
	Thu, 09 Jul 2026 19:23:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuL4-00000003SJQ-1rR5
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Jul 2026 19:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bVq923fN3xICcTFI/CD38blZ0rxbZHjRTcEK6CjQmAw=; b=aCPOGhtfwLxOnYvD0wsuD94StS
	hN06MJ/itKy1VqTSvRFzsVUz97jyhS/OTiRh/vWSJtgiPxea+yCt+03a8GhDX/NGV2euPmp266TMC
	k7krCzBMlLDEzM3SnQvD78ieb5hM/lfsBbCMjEqoSWSRgbGx2yzdG/LaMEcon6OwNmv+9q94g1hq2
	nyUsZu1HK0IqqvssHSIh1kZtCae5FbU/5bdTPXseF5K2jWFpwvrKsPKA506FqsLAbWnE6uHY+o2fI
	HASUnU2WoiNZLRBcfpDEDKCDXafSPl5dwrzh8TMMDqaU1wwUYrSgQ1+4L1uvKT7zJYJJkWusIPR/v
	BSwCCtKw==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whuKy-00000009UUP-2TSG
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 19:23:12 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so170161a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 12:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783624986; x=1784229786; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bVq923fN3xICcTFI/CD38blZ0rxbZHjRTcEK6CjQmAw=;
        b=eQDe0OJLza2UmQ57UmBMBLafI1MaOaFOOUF1rWIx7gvlqCPdIyO7sW8lmW4P/hVB5C
         HH28IGWYCQy6PWxj0tygmmUlCR3c64PuYUfOdgaZzFBQ25DquI79OE5mi6Jm5n/8JcjQ
         YRzYARvCi5d+cPJ39m8jS0Koa43K71ZCRTK/Y0/XphQTvpSPb4fgIAZ1MURJoMlvzvgq
         fh30JT3pRFIrquiez4ngujmShSG0ltaz1sngvCXofyYZQLPJ5xc2RhlzPFirl/sBk7iJ
         IkylJxMw2kjbWiyxtwEqkUs0hGMsLTsTtU2rmbuPiI+ZIrvYVFAT0NnOFKU4hqsGrhg0
         icbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624986; x=1784229786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVq923fN3xICcTFI/CD38blZ0rxbZHjRTcEK6CjQmAw=;
        b=awmcv1yeQtfwskWB/2K7ugY0hUj0deHBQcLV21SdGb8PRFissGX0phkEFyHL20c09V
         ehjAGEcCo+9ihYmOcnbytkYJvYAEO5VoEgWIamXPbkjdOtLgZoJxu7sbhGYtxkpF286H
         kjGUotigjw23bxx0Ob+soRTB2aWMSBktCb5o0cOInsszeGy9VKkCLuHhC2YK8G8xXQqY
         mmM8gWssuF+8aFQcaJIP1FeYtJl8ZTsH5LDL1lmbtPqKniv1BEJcoNGkh5Aq6i4mI6Ru
         D0nq1SaMk6AuwK2Z/HfI/BN6Y7KGd3yeXzzEdZ/PAavQXk/ccV5yGuKH15Z5wAblsjST
         16Pg==
X-Forwarded-Encrypted: i=1; AHgh+RoFpVMOfFYABEohZYPBtiAvCKJ6hpnEIwjyBwyD5nvxe6sfLPfLjn6CAxP9zes1LH10Tyh46deQMSAUyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/igBW4w+ovykGl7u+rly6qYncU//UXGHY+nCWYcHt2FRhhSB
	yxmLl9pKDCxnM7mUcqXbFef+ZA9rH2oHSAtSoSsGlF6+512Du0z2gQxR
X-Gm-Gg: AfdE7cntOBc1FA3VFuKM8mGTKCL6CCNoCJFiVz3b5txEU0BPDe7q43A8KQ9kGTOxCCY
	5g95FlQr+s40nQxddeewuDwPiPVd3WD32/JYbL+XpUNMXnkop1iWOxMnSeXx4tDq0fHKIkP/Dr2
	L88aoU8RnmtBRB6SpN4CeZyoLpkX3zuGnI8STllcMEu40nyCqCIGe3WB3RuMa46gN0Q6dbBE5cu
	1p0O79butOmHJBkFqMI7urSGPOvyz/HU92DNutxeqWN+RqG2xL7uiu4pONJihaJqB3X15UYOw2S
	5tnOV9GmDs/VYWyZxe/2sqWPBUnqsEcfJvit/rm9Mn/ETHabDTBzu9oSX3boFHxuYZ0JGhMKaqb
	rjeV44U8zuc6HJO0SqtfjMLfS8zKA1EURNSDoA1oQc5iFTbUpYTbulaFO3oKIX1aJn29ml46imZ
	08r/YXavwME2QbqcfBgJok6vwErYLgxSlUP+rACizADwAaq8sz5PImfKep/P7z
X-Received: by 2002:a05:6a21:6e8f:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3c0bcbc046bmr10368851637.45.1783624986079;
        Thu, 09 Jul 2026 12:23:06 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm29005934eec.14.2026.07.09.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:23:04 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:52:35 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 12/18] ptrace, treewide: Rename
 ptrace_report_syscall_entry() to ptrace_report_syscall_permit_entry()
Message-ID: <ak_0g7JaD9Z_ApYe@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.280015701@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.280015701@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_202308_790332_5E28F9A5 
X-CRM114-Status: GOOD (  21.37  )
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

On Tue, Jul 07, 2026 at 09:06:44PM +0200, Thomas Gleixner wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
> 
> Rename the function so the purpose is clear and make the return type bool.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Brian Cain <bcain@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-arch@vger.kernel.org
> ---
>  arch/alpha/kernel/ptrace.c      |    2 +-
>  arch/arc/kernel/ptrace.c        |    2 +-
>  arch/arm/kernel/ptrace.c        |    2 +-
>  arch/arm64/kernel/ptrace.c      |    2 +-
>  arch/csky/kernel/ptrace.c       |    2 +-
>  arch/hexagon/kernel/traps.c     |    2 +-
>  arch/m68k/kernel/ptrace.c       |    2 +-
>  arch/microblaze/kernel/ptrace.c |    2 +-
>  arch/mips/kernel/ptrace.c       |    2 +-
>  arch/nios2/kernel/ptrace.c      |    2 +-
>  arch/openrisc/kernel/ptrace.c   |    2 +-
>  arch/parisc/kernel/ptrace.c     |   10 ++++------
>  arch/sh/kernel/ptrace_32.c      |    2 +-
>  arch/sparc/kernel/ptrace_32.c   |    2 +-
>  arch/sparc/kernel/ptrace_64.c   |    2 +-
>  arch/um/kernel/ptrace.c         |    2 +-
>  arch/xtensa/kernel/ptrace.c     |    2 +-
>  include/asm-generic/syscall.h   |    4 ++--
>  include/linux/entry-common.h    |   25 ++++++++++++-------------
>  include/linux/ptrace.h          |   13 ++++++-------
>  20 files changed, 40 insertions(+), 44 deletions(-)
> 
[...]
> --- a/arch/parisc/kernel/ptrace.c
> +++ b/arch/parisc/kernel/ptrace.c
> @@ -326,7 +326,7 @@ long compat_arch_ptrace(struct task_stru
>  long do_syscall_trace_enter(struct pt_regs *regs)
>  {
>  	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
> -		int rc = ptrace_report_syscall_entry(regs);
> +		bool permit = ptrace_report_syscall_permit_entry(regs);
>  
>  		/*
>  		 * As tracesys_next does not set %r28 to -ENOSYS
> @@ -334,12 +334,10 @@ long do_syscall_trace_enter(struct pt_re
>  		 */
>  		regs->gr[28] = -ENOSYS;
>  
> -		if (rc) {
> +		if (!permit) {
>  			/*
> -			 * A nonzero return code from
> -			 * ptrace_report_syscall_entry() tells us
> -			 * to prevent the syscall execution.  Skip
> -			 * the syscall call and the syscall restart handling.
> +			 * Skip the syscall call and the syscall restart
> +			 * handling.
Hey Thomas,

This comment `syscall call` sounds a bit weird.

Apart from this, Everything looks good.

Regards,
Mukesh

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
