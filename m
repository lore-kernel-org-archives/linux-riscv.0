Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CD61061B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 03:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2p24fMZVJKR5RYl9o2gHAFLzY82djCbPHF/wLNNs9Gg=; b=4oss9cP32O5XYa
	1/mbvIRlkzrTJctXzpwZ1AT4QL+czAvI97M9eRvKEv3Ei6+WKNzLZsziQcnf8HexP5LHSS6yyKlC1
	FQLQt7XyDu3ZefdfUV5ChUmwtO16j2yR7q1bCXJ55d1pjdU4n9grSrVeCoLJE6aUWLhOmgVwOumkr
	y8JauYH/Sz8Ppd24CftxwAF/S8LG2go+0oMDQEf993kMvIhLmXmjtl/OgPXCV9BJ1Mb/54yap0cq5
	x6rL41v08j19Qqy3ftWCZlax5WmRhfmQuuC08qMfjvqixKkG2JqUFPysOdn0Zdkxzlg9rCEKq31ka
	UlMASjXjndlLOeCo6WMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PuD-0000000CElY-3S9g;
	Tue, 31 Mar 2026 03:36:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PuB-0000000CElB-14OI
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 03:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F60842DB0;
	Tue, 31 Mar 2026 03:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822D1C19423;
	Tue, 31 Mar 2026 03:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774928196;
	bh=ihLYSveTWjZa4kTzzAkdyJdOaXiS/qM7fQtyS3kL4go=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vQeUhbg757ymedWFZc+YNZ8NuiwzKsmRiVO4Y0w+NVu0NY+72+6eplyw6vEazNAJM
	 wW5MQD7a9/qGiTGt+D3NRHlHMzxZ0QCvoHKXFEUMBC1I+4X5oGjeaHMItyv1GHLFsH
	 7sQQEiPOejP6ggsHr4UHiGc2KVw0BHp4/roLq7lBaHy7VdsSydBlcN/5NAf6SIS5fv
	 VxoV2AnZ1kMR/NRDBapyMDnpd76sBzxZZ6AFQTSSMFma3cHUAP9NzbYk04iAHnVpV+
	 uSF+OJrHS0hJFx/cFY7sl/9C6KNsvldp0+FF/OKt2sdA10SpdsLfT/mBxFOapybnzP
	 XC2SCtCRAroGQ==
Message-ID: <248cd5c4-e1ac-4d08-a88a-efb472f94752@kernel.org>
Date: Tue, 31 Mar 2026 14:36:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: signal: refactor debug logging to use macros
To: Austin Kim <austindh.kim@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <acn9Yha4JufGcQah@adminpc-PowerEdge-R7525>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <acn9Yha4JufGcQah@adminpc-PowerEdge-R7525>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_203639_342960_F3060458 
X-CRM114-Status: GOOD (  13.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/3/2026 15:34, Austin Kim wrote:
> From: Austin Kim <austin.kim@lge.com>
> 
> Replace manual #if DEBUG_SIG blocks with a unified DEBUGP macro.
> This will improve code readability.
> 
> Signed-off-by: Austin Kim <austin.kim@lge.com>
> ---
>   arch/riscv/kernel/compat_signal.c | 10 ++++++----
>   arch/riscv/kernel/signal.c        | 10 ++++++----
>   2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
> index 6ec4e3425..c82235be7 100644
> --- a/arch/riscv/kernel/compat_signal.c
> +++ b/arch/riscv/kernel/compat_signal.c
> @@ -12,7 +12,11 @@
>   #include <asm/ucontext.h>
>   #include <asm/vdso.h>
>   
> -#define COMPAT_DEBUG_SIG 0
> +#ifdef DEBUG_SIG
> +#  define DEBUGP(fmt, args...) pr_info("%s: " fmt, __func__, ##args)
> +#else
> +#  define DEBUGP(fmt, args...)
> +#endif
>   
>   struct compat_sigcontext {
>   	struct compat_user_regs_struct sc_regs;
> @@ -233,11 +237,9 @@ int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
>   	regs->a1 = (unsigned long)(&frame->info); /* a1: siginfo pointer */
>   	regs->a2 = (unsigned long)(&frame->uc);   /* a2: ucontext pointer */
>   
> -#if COMPAT_DEBUG_SIG
> -	pr_info("SIG deliver (%s:%d): sig=%d pc=%p ra=%p sp=%p\n",
> +	DEBUGP("SIG deliver (%s:%d): sig=%d pc=%p ra=%p sp=%p\n",
>   		current->comm, task_pid_nr(current), ksig->sig,
>   		(void *)regs->epc, (void *)regs->ra, frame);
> -#endif
>   
>   	return 0;
>   }
Is there any reason not to use pr_devel()?

Or pr_debug() if enabling it at runtime is desirable (with 
CONFIG_DYNAMIC_DEBUG=y).

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
