Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB159C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 18:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0ch5yoAbiB0fYZki5yrnkKr787T7A/8RYCCl3k8hII=; b=m04JWbYo+eVRtb
	Th95mRP9RAhkAOYQN9XhwBGm9JdT+MGXUqU2JoQd40Ft+sv+yEjaTm0F4iIK+uRJYxfx6XyxIS/6L
	f2p+gqQHVfNDzLFMgKT038VxBwuUb8V7291Q++UeAS+oSml9fENiUGot5es807lq/K/il+vrKr2VH
	tu9r8QKAzddfMqB+Fd9RS9ICv+LseFFXo3Zfb5Xd7lq3S45Ce2Txg4bjUJEyjzNgPrj+hUWy9B/8D
	7s/2EDTB1WbsW/ySoZkHyeuB+/IzHugiaHImo/cAlJY5Qq99QGWeIVK2Nvv1C2rar3LZGBShdbcSO
	IQYSRjBEKDtlUu+X17Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBm0-00000005y8r-07ox;
	Tue, 26 Mar 2024 18:43:48 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBlw-00000005y7q-41mJ
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 18:43:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8811B1C0006;
	Tue, 26 Mar 2024 18:43:36 +0000 (UTC)
Message-ID: <a083fe56-19ba-4c12-8364-944d8bbcc043@ghiti.fr>
Date: Tue, 26 Mar 2024 19:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Mark __se_sys_* functions __used
Content-Language: en-US
To: Sami Tolvanen <samitolvanen@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20240326153712.1839482-2-samitolvanen@google.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240326153712.1839482-2-samitolvanen@google.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_114345_317791_B839C43A 
X-CRM114-Status: GOOD (  13.50  )
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

Hi Sami,

On 26/03/2024 16:37, Sami Tolvanen wrote:
> Clang doesn't think ___se_sys_* functions used even though they are
> aliased to __se_sys_*, resulting in -Wunused-function warnings when
> building rv32. For example:
>
>     mm/oom_kill.c:1195:1: warning: unused function '___se_sys_process_mrelease' [-Wunused-function]
>      1195 | SYSCALL_DEFINE2(process_mrelease, int, pidfd, unsigned int, flags)
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFINE2'
>       221 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
>           |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/syscalls.h:231:2: note: expanded from macro 'SYSCALL_DEFINEx'
>       231 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     arch/riscv/include/asm/syscall_wrapper.h:81:2: note: expanded from macro '__SYSCALL_DEFINEx'
>        81 |         __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)                         \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     arch/riscv/include/asm/syscall_wrapper.h:40:14: note: expanded from macro '__SYSCALL_SE_DEFINEx'
>        40 |         static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
>           |                     ^~~~~~~~~~~~~~~~~~~~
>     <scratch space>:30:1: note: expanded from here
>        30 | ___se_sys_process_mrelease
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     1 warning generated.
>
> Mark the functions __used explicitly to fix the Clang warnings.
>
> Fixes: a9ad73295cc1 ("riscv: Fix syscall wrapper for >word-size arguments")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Do you have the link of the report? So we can add a Closes tag.


> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>   arch/riscv/include/asm/syscall_wrapper.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/syscall_wrapper.h b/arch/riscv/include/asm/syscall_wrapper.h
> index 980094c2e976..ac80216549ff 100644
> --- a/arch/riscv/include/asm/syscall_wrapper.h
> +++ b/arch/riscv/include/asm/syscall_wrapper.h
> @@ -36,7 +36,8 @@ asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *);
>   					ulong)						\
>   			__attribute__((alias(__stringify(___se_##prefix##name))));	\
>   	__diag_pop();									\
> -	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
> +	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
> +			__used;								\
>   	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
>   
>   #define SC_RISCV_REGS_TO_ARGS(x, ...) \
>
> base-commit: 4cece764965020c22cff7665b18a012006359095


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

As the commit fixed here was merged in 6.9, this should go into fixes.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
