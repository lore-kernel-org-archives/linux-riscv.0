Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5063C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kamkY7oZid4Gy9eJbZmmYIneCXf8W6S7QFXJrJCi2c0=; b=cV8ii7Ry387QYTDskyy7h+Z2Z4
	ai8+gY/bt5qwA387HSWwVjt5YRjWbrhKwVPda4h4+ZQa+o+vcMX9zXZp+O7G1CqPqOnxjOCXTr1IE
	uWGLxzID9slw/1RgiO8AhlfGelpPvUXrnhgihLBAiQCLRhQNDUCtx1dcTz0Qn1yh6kJPhvjlvGnj6
	j5nImcHlbUPL1bMl7xZ3O2PW5IVE0RKe7sReWHUT635ojxlvuRrQwKqO9QJXAq02c6T9Wm+xk81R/
	BbcJalpzEThqcdYWlcEg0bKHQMe0G0Z55RFte9JTGsJL7vSNp3ibbarohD2D+Ja0lci7kwruhk7TU
	XihHDX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVE6z-00000004lGd-2W9w;
	Wed, 31 Jan 2024 17:10:57 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVE6w-00000004lFI-3It2
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 17:10:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 739B2240006;
	Wed, 31 Jan 2024 17:10:48 +0000 (UTC)
Message-ID: <139cdbd6-73d9-4452-94ce-825689b7c0c8@ghiti.fr>
Date: Wed, 31 Jan 2024 18:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: add CALLER_ADDRx support
Content-Language: en-US
To: Zong Li <zong.li@sifive.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231205085959.32177-1-zong.li@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231205085959.32177-1-zong.li@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_091055_146470_F2DAB8FA 
X-CRM114-Status: GOOD (  26.21  )
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

On 05/12/2023 09:59, Zong Li wrote:
> CALLER_ADDRx returns caller's address at specified level, they are used
> for several tracers. These macros eventually use
> __builtin_return_address(n) to get the caller's address if arch doesn't
> define their own implementation.
>
> In RISC-V, __builtin_return_address(n) only works when n == 0, we need
> to walk the stack frame to get the caller's address at specified level.


Is that a bug in gcc or something expected for riscv in general?


>
> data.level started from 'level + 3' due to the call flow of getting
> caller's address in RISC-V implementation. If we don't have additional
> three iteration, the level is corresponding to follows:
>
> callsite -> return_address -> arch_stack_walk -> walk_stackframe
> |           |                 |                  |
> level 3     level 2           level 1            level 0
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>   arch/riscv/include/asm/ftrace.h    |  5 ++++
>   arch/riscv/kernel/Makefile         |  2 ++
>   arch/riscv/kernel/return_address.c | 48 ++++++++++++++++++++++++++++++
>   3 files changed, 55 insertions(+)
>   create mode 100644 arch/riscv/kernel/return_address.c
>
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 2b2f5df7ef2c..42777f91a9c5 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -25,6 +25,11 @@
>   
>   #define ARCH_SUPPORTS_FTRACE_OPS 1
>   #ifndef __ASSEMBLY__
> +
> +extern void *return_address(unsigned int level);
> +
> +#define ftrace_return_address(n) return_address(n)
> +
>   void MCOUNT_NAME(void);
>   static inline unsigned long ftrace_call_adjust(unsigned long addr)
>   {
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fee22a3d1b53..40d054939ae2 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -7,6 +7,7 @@ ifdef CONFIG_FTRACE
>   CFLAGS_REMOVE_ftrace.o	= $(CC_FLAGS_FTRACE)
>   CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
>   CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
>   endif
>   CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
>   CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
> @@ -46,6 +47,7 @@ obj-y	+= irq.o
>   obj-y	+= process.o
>   obj-y	+= ptrace.o
>   obj-y	+= reset.o
> +obj-y	+= return_address.o
>   obj-y	+= setup.o
>   obj-y	+= signal.o
>   obj-y	+= syscall_table.o
> diff --git a/arch/riscv/kernel/return_address.c b/arch/riscv/kernel/return_address.c
> new file mode 100644
> index 000000000000..c2008d4aa6e5
> --- /dev/null
> +++ b/arch/riscv/kernel/return_address.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * This code come from arch/arm64/kernel/return_address.c
> + *
> + * Copyright (C) 2023 SiFive.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/kprobes.h>
> +#include <linux/stacktrace.h>
> +
> +struct return_address_data {
> +	unsigned int level;
> +	void *addr;
> +};
> +
> +static bool save_return_addr(void *d, unsigned long pc)
> +{
> +	struct return_address_data *data = d;
> +
> +	if (!data->level) {
> +		data->addr = (void *)pc;
> +		return false;
> +	}
> +
> +	--data->level;
> +
> +	return true;
> +}
> +NOKPROBE_SYMBOL(save_return_addr);
> +
> +void *return_address(unsigned int level)


Maybe return_address() should be noinline to make sure it's not inlined 
as it would break the "+ 3"? Not sure it's necessary though.


> +{
> +	struct return_address_data data;
> +
> +	data.level = level + 3;
> +	data.addr = NULL;
> +
> +	arch_stack_walk(save_return_addr, &data, current, NULL);
> +
> +	if (!data.level)
> +		return data.addr;
> +	else
> +		return NULL;
> +
> +}
> +EXPORT_SYMBOL_GPL(return_address);
> +NOKPROBE_SYMBOL(return_address);


And I see that with this patch, ftrace_return_address() is now defined 
whether CONFIG_FRAME_POINTER is set or not, is that correct?

This looks like a fix to me so that should go into -fixes with a Fixes 
tag (but we'll have to make sure that the "+ 3" is correct on all 
backports...):

Fixes: 10626c32e382 ("riscv/ftrace: Add basic support")

And you can finally add for your v2 (or not if you don't respin):

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks and sorry for the delay!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
