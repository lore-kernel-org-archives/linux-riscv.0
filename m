Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102B4C369A2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBIiYMULWiSibrdIyXXHDtR2Yji/dwygSezJFQ1Gz18=; b=acBsyr1AFib4or
	fxG9uh/U1WoX5F/mxwzGKMKT6i5QOJNJrE2A53NGY/uKvavc+aYuDgvwqjnQP9ifkbRDmu8Q/0D3t
	paJvNox4Kwgh3M3UWbrc1lfLiRnwxiqvHu0UvYrwFsSpkEMlzICLtplcugO4LzXUTsh3sERiTva8I
	wP6vPbFGoAie4uOI8K9DkaNBURwLquqin0mO3/KIK+tCCLA9hThVEyWpTCQ9CfHkm8+NCOdPIBhRU
	aYH21m2DoQJ7EX/sFAxhKRKbgR2FOrL7tyDTitiyyvzIJVkBavsejMVrKaTBKQG8aomUM71Ri5jVm
	i0B0hXSPwZLP6B06pAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2eo0-00000008kvk-4AcN;
	Wed, 09 Apr 2025 23:26:04 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2enx-00000008kvM-3Fnz
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 23:26:03 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id E506372C8CC;
	Thu, 10 Apr 2025 02:26:00 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id D38F47CCB3A; Thu, 10 Apr 2025 02:26:00 +0300 (IDT)
Date: Thu, 10 Apr 2025 02:26:00 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>, Kees Cook <kees@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
Message-ID: <20250409232600.GB31728@strace.io>
References: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_162602_141430_F9A9177C 
X-CRM114-Status: GOOD (  28.08  )
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

On Wed, Apr 09, 2025 at 02:24:46PM -0700, Nathan Chancellor wrote:
> When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> because of the memcpy() in syscall_get_arguments():
> 
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
>   include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     580 |                         __read_overflow2_field(q_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> The fortified memcpy() routine enforces that the source is not overread
> and the destination is not overwritten if the size of either field and
> the size of the copy are known at compile time. The memcpy() in
> syscall_get_arguments() intentionally overreads from a1 to a5 in
> 'struct pt_regs' but this is bigger than the size of a1.
> 
> Normally, this could be solved by wrapping a1 through a5 with
> struct_group() but there was already a struct_group() applied to these
> members in commit bba547810c66 ("riscv: tracing: Fix
> __write_overflow_field in ftrace_partial_regs()").
> 
> Just avoid memcpy() altogether and write the copying of args from regs
> manually, which clears up the warning at the expense of three extra
> lines of code.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I omitted a Fixes tag because I think this has always been an overread
> if I understand correctly but it is only the addition of the checks from
> commit f68f2ff91512 ("fortify: Detect struct member overflows in
> memcpy() at compile-time") that it becomes a noticeable issue.
> 
> This came out of a discussion from the addition of
> syscall_set_arguments(), where the same logic causes a more noticeable
> fortify warning because it happens without W=1, as it is an overwrite:
> https://lore.kernel.org/20250408213131.GA2872426@ax162/
> ---
>  arch/riscv/include/asm/syscall.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce66b31fe79b691b8edd816c8019e9..eceabf59ae482aa1832b09371ddb3ba8cd65f91d 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -62,8 +62,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 unsigned long *args)
>  {
>  	args[0] = regs->orig_a0;
> -	args++;
> -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> +	args[1] = regs->a1;
> +	args[2] = regs->a2;
> +	args[3] = regs->a3;
> +	args[4] = regs->a4;
> +	args[5] = regs->a5;
>  }
>  
>  static inline int syscall_get_arch(struct task_struct *task)

Reviewed-by: Dmitry V. Levin <ldv@strace.io>


-- 
ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
