Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCB6C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 12:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vw+0s1TKvmrk9M7+JHYvLAg672qTt/cB22OgfhqKReg=; b=jjxWvhUVQ5bEO9
	sckKecA1G1j2Sm4NetW9S9VyZInsx5b4yR0JemoNvp1FEqtsTLxbX/fph6VUyCIjBmvNAF4lgSZGC
	80C2oONCxcW48t9U08NEwBNhOXSjB2B6Cl2mmiY4ihnDjzeZzwPCmyQXKSV/XXKlctl87RNdI641y
	uVzy7MBPWYNf5aM5FeB4H/oeM/QK4HRK47dhqcxVMv5pqs9zwRrzETcPJCaTVW7DB5eycfVcTMRtq
	jGC5pk4LVVmm5ufaqNiO123OzyxpMZ8mccqGzoF5XBciiq3hyjuzBdLfWkZTfaK2PshZTlhVEDk5R
	AjnU3zTblpMr//YO5ZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXK4-0000000GwmG-24VR;
	Tue, 30 Jun 2026 12:12:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJu-0000000Gwhi-0kOn
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 12:12:07 +0000
Date: Tue, 30 Jun 2026 14:11:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782821523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DaDb0CU51jw5hzrTPh2WUQ8iMvCaTrfevuJoRExFH8c=;
	b=FSGDMkiriO8CeVJbAIVVKRewEJrQhivcXvYRRLfYySHMS5MLNNs47VttEato6F0RO6A9/D
	1N7/9+DmqXMj7udEuXLnqxkhXIBqI8Fo7dkMxhTXlUXzlzefWWrWphmlZhDlG4zCVQ2aGQ
	cv2we4PSZ4nSQk015NVkqAW3LPMJJa70HGxXiPz3/d9XUksIt4OFv9rzt2SdyxgOGIENb7
	ZAP7NuucL9QQKtcHxI0dzWGPS0Aqf3cPcI9mY3IF/7Zi8WhJHD+VJCiNF6rTYLdceyfX9i
	8t2CLH63ZJodIMyEnhHIFaY/+hS7w5HssnK/xMOzj4U2cTcsWR2jP2zHFqls8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782821523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DaDb0CU51jw5hzrTPh2WUQ8iMvCaTrfevuJoRExFH8c=;
	b=XB//KrXWyXVzZaK+SHEdn4DTPNkSJzAJBYh8vc1l1af6SmwdLd4CdktIN7glie5umzJK8r
	rOwCX7FpizoddXBA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 5/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <20260630135316-f26f0e0f-c08c-4d4d-9963-10f9985a7689@linutronix.de>
References: <cover.1781876501.git.namcao@linutronix.de>
 <7e567e288f9ddeb2128f5d7ed83a518945fb50d9.1781876501.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e567e288f9ddeb2128f5d7ed83a518945fb50d9.1781876501.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051206_363720_88CE4740 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 19, 2026 at 04:11:21PM +0200, Nam Cao wrote:
(...)
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -27,12 +27,24 @@ asflags-y += -DVDSO_CFI=1
>  endif
>  
>  # Files to link into the vdso
> -obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
> +obj-vdso := $(patsubst %, %.o, $(vdso-syms)) note.o
>  
>  ifdef CONFIG_VDSO_GETRANDOM
>  obj-vdso += vgetrandom-chacha.o
>  endif
>  
> +ifdef CONFIG_FUTEX_ROBUST_UNLOCK
> +
> +obj-vdso += futex.o
> +
> +ifdef CONFIG_64BIT
> +vdso-syms += __vdso_futex_robust_list64_try_unlock
> +else
> +vdso-syms += __vdso_futex_robust_list32_try_unlock
> +endif
> +
> +endif
> +
>  ccflags-y := -fno-stack-protector
>  ccflags-y += -DDISABLE_BRANCH_PROFILING
>  ccflags-y += -fno-builtin

This is missing a

CFLAGS_REMOVE_futex.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)

Otherwise we get this:

https://lore.kernel.org/oe-kbuild-all/202606270658.zYkKDlzo-lkp@intel.com/

Or add a preparatory commit which uses ccflags-remove-y instead of
listing all the objects manually.

(...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
