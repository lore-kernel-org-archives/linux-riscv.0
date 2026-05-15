Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95597CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 19:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZ7f8Ux4xEPKLAZTSExIiJWpdj7rwvyzz9f54kOOV3U=; b=Qp0Kq87TkkEiti
	y7AxktOTYZjuBrDNXO7eaeC9zlt3xtBwhV3mulr6w61AUp8zYQAAcSqHJZjq2XX7SfgewqPAneBgM
	ijq7MdR52AjhUxh1N7dWlLMv9khWttDcI5bQieeGIRus5Rc84XT3y3RtT6S8VCK7IzZnxB3asfe7I
	HADeEVjtLpXa7X+l/wKzExfwy+uTun8QP3ze9jI1u3r5QuoHMZh4lIGkKlgPCwI+nr0kjN7PJ2vAU
	fSJL/Ox4jkiMv35XR+syEwnhMgECNTBuknoJwA0guOZ/ORSCWsS1SPLxYh8dEnciNu2nziTfHa8q/
	sEyar4Aj6sGoUMUXnz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyOG-00000009EqH-3qKh;
	Fri, 15 May 2026 19:40:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyOF-00000009Eq7-1uVu
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 19:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCCBB601DF;
	Fri, 15 May 2026 19:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4EBC2BCB3;
	Fri, 15 May 2026 19:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778874006;
	bh=3yyQkYdxChwarAweftCvJrPicHgtEMSdTY4CgyHFHQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkPUbcm8VX6YlsCEuEPuJrnYm9SbKuyFOtePI+sU8nRJRhOpok/mJB1eLpXLAQdEt
	 jJog4xlA8nxDF0OlC+YML7KHZVAFB2QwcTEE671syL5xPhEP7O6nYh7WWjely9B9zf
	 +c4a9GATU5oaP8k+gzAh0wGrpYnB/CcpNydmOhX353a97eP7o16Fvv+kpD0Y33v32y
	 c5fZskya4WtVGUOF9KVfzXFDlYWgSpzupIsgr5CIbUNsRgKGrLD6PfOyXL6ldxTIb9
	 8w1Uo91Bfhrexx54X2rzou0gZODnS86I+a+tiD6nfpaQLfsWH16/RsNljP3ESb5yjX
	 WLuPE3BOIQMKA==
Date: Sat, 16 May 2026 04:40:01 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] Disable -Wattribute-alias for clang-23 and newer
Message-ID: <20260515194001.GA3434682@ax162>
References: <20260515-syscall-disable-attribute-alias-for-clang-v1-1-9a9d95d41df6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260515-syscall-disable-attribute-alias-for-clang-v1-1-9a9d95d41df6@kernel.org>
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

On Fri, May 15, 2026 at 07:35:18PM +0900, Nathan Chancellor wrote:
> Clang recently added support for -Wattribute-alias [1], which results in
> the same warnings that necessitated commit bee20031772a ("disable
> -Wattribute-alias warning for SYSCALL_DEFINEx()") for GCC.
> 
>   kernel/time/itimer.c:325:1: error: alias and aliasee have different types 'long (unsigned int)' and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long)') [-Werror,-Wattribute-alias]
>     325 | SYSCALL_DEFINE1(alarm, unsigned int, seconds)
>         | ^
>   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFINE1'
>     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
>         |                                    ^
>   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
>     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>         |         ^
>   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DEFINEx'
>     251 |                 __attribute__((alias(__stringify(__se_sys##name))));    \
>         |                                ^
>   kernel/time/itimer.c:325:1: note: aliasee is declared here
>   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFINE1'
>     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
>         |                                    ^
>   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
>     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>         |         ^
>   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DEFINEx'
>     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
>         |                         ^
>   <scratch space>:16:1: note: expanded from here
>      16 | __se_sys_alarm
>         | ^
> 
> Disable the warnings in the same way for clang-23 and newer.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2163
> Link: https://github.com/llvm/llvm-project/commit/40da6920a0d71d49dfa2392b09153600b0759f5e [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I plan to take this via my clang-fixes tree for 7.1.
> ---
>  arch/riscv/include/asm/syscall_wrapper.h | 2 ++
>  include/linux/compat.h                   | 2 ++
>  include/linux/compiler-clang.h           | 6 ++++++
>  include/linux/syscalls.h                 | 2 ++
>  4 files changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/syscall_wrapper.h b/arch/riscv/include/asm/syscall_wrapper.h
> index ac80216549ff..366a5354caa5 100644
> --- a/arch/riscv/include/asm/syscall_wrapper.h
> +++ b/arch/riscv/include/asm/syscall_wrapper.h
> @@ -32,6 +32,8 @@ asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *);
>  	__diag_push();									\
>  	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
>  			"Type aliasing is used to sanitize syscall arguments");		\
> +	__diag_ignore(clang, 23, "-Wattribute-alias",					\
> +			"Type aliasing is used to sanitize syscall arguments");		\
>  	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
>  					ulong)						\
>  			__attribute__((alias(__stringify(___se_##prefix##name))));	\
> diff --git a/include/linux/compat.h b/include/linux/compat.h
> index 56cebaff0c91..a1ce6d559db9 100644
> --- a/include/linux/compat.h
> +++ b/include/linux/compat.h
> @@ -72,6 +72,8 @@
>  	__diag_push();								\
>  	__diag_ignore(GCC, 8, "-Wattribute-alias",				\
>  		      "Type aliasing is used to sanitize syscall arguments");\
> +	__diag_ignore(clang, 23, "-Wattribute-alias",				\
> +		      "Type aliasing is used to sanitize syscall arguments");\
>  	asmlinkage long compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
>  		__attribute__((alias(__stringify(__se_compat_sys##name))));	\
>  	ALLOW_ERROR_INJECTION(compat_sys##name, ERRNO);				\
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index e1123dd28486..527e4e136020 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -131,6 +131,12 @@
>  #define __diag_str(s)		__diag_str1(s)
>  #define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
>  
> +#if CONFIG_CLANG_VERSION >= 230000
> +#define __diag_clang_23(s)	__diag(s)
> +#else
> +#define __diag_clang_23(s)
> +#endif
> +
>  #define __diag_clang_13(s)	__diag(s)
>  
>  #define __diag_ignore_all(option, comment) \
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index f5639d5ac331..97e3411b49d2 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -247,6 +247,8 @@ static inline int is_syscall_trace_event(struct trace_event_call *tp_event)
>  	__diag_push();							\
>  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
>  		      "Type aliasing is used to sanitize syscall arguments");\
> +	__diag_ignore(clang, 23, "-Wattribute-alias",			\
> +		      "Type aliasing is used to sanitize syscall arguments");\
>  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
>  		__attribute__((alias(__stringify(__se_sys##name))));	\
>  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\

The kbuild test robot pointed out that I need

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index e8fd77593b68..369966598a2c 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -711,6 +711,10 @@ struct ftrace_likely_data {
 #define __diag_GCC(version, severity, string)
 #endif
 
+#ifndef __diag_clang
+#define __diag_clang(version, severity, string)
+#endif
+
 #define __diag_push()	__diag(push)
 #define __diag_pop()	__diag(pop)
 
--

for this to build properly with GCC, which I will fold in.

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
