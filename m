Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0CDC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 07:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAZ7p7RuV4iL7pbXGJuDTPkBinQQSi6x95OfbkYIXxM=; b=lsYuHMyOuAPPdF
	R5J6TQzy/xqmdDekYg/3B/EKn1lhCuw5YSVJ9eEKSeDfQ1TxrKXYx6dTNXLQ+YIdZlG7DPqERLVcf
	1RxFI3owsuQEiYrCukIk/ZBAAEANoAo4x4Fjs8YmDPsdk765uELSfaS7eWCQztRH/5DY9CnPZuiI0
	TFezq0Zb0e1PBIofk9+VgYqPkvKuxezBRJvNxyL7G3ZaovQUOFaDAua7JIjZO8HIeagXjZT6njlHp
	XYecqF56Q620Cp2T/mBXlVYwH4swy2dBK2bdFW+iFCqqpwl3uTTYL+0Km+aiyqvR7alkjue1/Lg8K
	NeNL4uxpAsdVJQJ+4ZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy5Hw-006msd-1d;
	Wed, 01 Nov 2023 07:05:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy5Hp-006ms4-2m
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 07:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A3ECCE091A;
	Wed,  1 Nov 2023 07:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA7CC433C7;
	Wed,  1 Nov 2023 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698822305;
	bh=j9ykpsBlFRKe7DDjM3F4E4o0mNxil1zOXhS2aCHKGpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YjjLTuv/okiR0psaAHUqPoY3KJE0Gv/tCKYbFkgJeyb0/c+tpUKx31DNUnNenjA7w
	 6s/plmHRr6YIa6EK1qtNHfQ/Zzk/6z628H5q4SCaF1nNjBfaEekACsBKoWbTGxnkj6
	 s7fbZnl47gRFwAAgaXkIFGcOvegKVhGlPlQSiEelu40AL15FkE8pp9BWxhgb0/cw6d
	 M7fnP1rqhZyQE7NQPx20WxeguOaxMr7WqpRAEWRkAlqXL8FCgjYQI4wsNn/H2Dj5kl
	 Ov7/yxXdxQFd21AEobNmSkerlr9FQKjoq6Liz3/kzE1ljkqF9R4cXxwIjJVgoKEnsb
	 SJAKIeqWUglow==
Message-ID: <5d80e129-b3b3-4bad-b432-897728113bb7@kernel.org>
Date: Wed, 1 Nov 2023 16:05:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Support RANDOMIZE_KSTACK_OFFSET
To: Song Shuai <songshuaishuai@tinylab.org>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 guoren@kernel.org, bjorn@rivosinc.com, jszhang@kernel.org,
 conor.dooley@microchip.com, andy.chiu@sifive.com, samitolvanen@google.com,
 coelacanthushex@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20231101064423.1906122-1-songshuaishuai@tinylab.org>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20231101064423.1906122-1-songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_000510_262504_61A10145 
X-CRM114-Status: GOOD (  19.96  )
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

On 11/1/23 15:44, Song Shuai wrote:
> Inspired from arm64's implement -- commit 70918779aec9
> ("arm64: entry: Enable random_kstack_offset support")
> 
> Add support of kernel stack offset randomization while handling syscall,
> the offset is defaultly limited by KSTACK_OFFSET_MAX() (i.e. 10 bits).
> 
> In order to avoid trigger stack canaries (due to __builtin_alloca) and
> slowing down the entry path, use __no_stack_protector attribute to
> disable stack protector for do_trap_ecall_u() at the function level.
> 
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
> Testing with randomize_kstack_offset=y cmdline, lkdtm/stack-entropy.sh
> showed appropriate stack offset instead of zero.
> ---
>  arch/riscv/Kconfig        |  1 +
>  arch/riscv/kernel/traps.c | 18 +++++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d607ab0f7c6d..0e843de33f0c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -100,6 +100,7 @@ config RISCV
>  	select HAVE_ARCH_KGDB_QXFER_PKT
>  	select HAVE_ARCH_MMAP_RND_BITS if MMU
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> +	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>  	select HAVE_ARCH_SECCOMP_FILTER
>  	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>  	select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 19807c4d3805..3f869b2d47c3 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -6,6 +6,7 @@
>  #include <linux/cpu.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/signal.h>
> @@ -296,9 +297,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>  	}
>  }
>  
> -asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
> +asmlinkage __visible __trap_section  __no_stack_protector
> +void do_trap_ecall_u(struct pt_regs *regs)
>  {
>  	if (user_mode(regs)) {
> +

White line change.

>  		long syscall = regs->a7;
>  
>  		regs->epc += 4;
> @@ -308,10 +311,23 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
>  
>  		syscall = syscall_enter_from_user_mode(regs, syscall);
>  
> +		add_random_kstack_offset();
> +
>  		if (syscall >= 0 && syscall < NR_syscalls)
>  			syscall_handler(regs, syscall);
>  		else if (syscall != -1)
>  			regs->a0 = -ENOSYS;
> +		/*
> +		 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
> +		 * so the maximum stack offset is 1k bytes (10 bits).
> +		 *
> +		 * The actual entropy will be further reduced by the compiler when
> +		 * applying stack alignment constraints: 16-byte (i.e. 4-bit) aligned
> +		 * for RV32I or RV64I.
> +		 *
> +		 * The resulting 6 bits of entropy is seen in SP[9:4].
> +		 */
> +		choose_random_kstack_offset(get_random_u16());
>  
>  		syscall_exit_to_user_mode(regs);
>  	} else {

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
