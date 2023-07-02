Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98940EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 18:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Chs1EUc7b4QhmVYR3O6L7kNwadaE6s3x7KDz+R8esbM=; b=M+UDgOtPgibogK
	kYQ0aM7Y+XqW98KtY8W2yK6++XqB6TmNyfdxisNlF9MKtkySqiHjua/LfM18ega17omdgwSYAjfwG
	5kqGA7A17UCxeNxEArRHYx/Vp73YLelypdR5doApKOILPTsm77jhhWZjL5CbtwLHVXM6wP57H30xk
	cbmF0nqOatcMREu2Gp3P6Se8fcqRrxUzay4ijQCnF+jVeVBTPnFLdsjbM899BddF/SPKYz6uC/yXk
	UKEZEepDmoIyN6e1JZYia60/EeguuMToOQPdDHe2r7noq+kBJeWmJHdCa0cm9JhSGxWeJe01IXYAJ
	jaKkXdIlHaHs7vAxPxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2GB-008Pgj-0Q;
	Sun, 02 Jul 2023 18:57:23 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2G7-008PfG-0H
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 18:57:21 +0000
Date: Sun, 2 Jul 2023 20:57:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1688324230; bh=67ILj3chIboW2gmsBz04V0Mib+VgnjMHIAk/zViRZ/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4wmFcsE48BwNsSf/NiYdrV2MaT8cgcaO8c1oFIG9IFyjeQvnkNvSB3BFW6Eszhte
	 e8k9qEe8ohCQcD7VshlVt7ULvk7BOT3Cf3/BZMVcIMX8bkU9ULaLkLPcLUGJhas/pQ
	 fG68qTYRXpNDXQe8ka2YkquxZxqTDRlGvbLWswV8=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 03/11] tools/nolibc: include crt.h before arch.h
Message-ID: <e1cf8fd3-f8cd-4c3c-9f8c-24bbc0a7cde3@t-8ch.de>
References: <cover.1687976753.git.falcon@tinylab.org>
 <c61b5bc53895e8c6b2f30d59f86067973e6bbce0.1687976753.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c61b5bc53895e8c6b2f30d59f86067973e6bbce0.1687976753.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_115719_608678_9DBC851A 
X-CRM114-Status: GOOD (  15.04  )
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

On 2023-06-29 02:54:35+0800, Zhangjin Wu wrote:
> The crt.h provides a new _start_c() function, which is required by the
> new assembly _start entry of arch-<ARCH>.h (included by arch.h), let's
> include crt.h before arch.h.
> 
> This '#include "crt.h"' doesn't let the new _start_c() work immediately,
> but it is a base of the coming patches to move most of the assembly
> _start operations to the _start_c() function for every supported
> architecture.

Why don't the arch-*.h files include this new header?
They are the users of the new symbol.

> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/Makefile | 1 +
>  tools/include/nolibc/nolibc.h | 1 +
>  tools/include/nolibc/signal.h | 1 +
>  tools/include/nolibc/stdio.h  | 1 +
>  tools/include/nolibc/stdlib.h | 1 +
>  tools/include/nolibc/sys.h    | 1 +
>  tools/include/nolibc/time.h   | 1 +
>  tools/include/nolibc/unistd.h | 1 +
>  8 files changed, 8 insertions(+)
> 
> diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> index 875e13e3c851..00471e59b11e 100644
> --- a/tools/include/nolibc/Makefile
> +++ b/tools/include/nolibc/Makefile
> @@ -37,6 +37,7 @@ NARCH            = $(or $(NARCH_$(ARCH)),$(ARCH))
>  arch_file := arch-$(NARCH).h
>  all_files := \
>  		compiler.h \
> +		crt.h \

This should be part of the patch adding the file.

>  		ctype.h \
>  		errno.h \
>  		nolibc.h \
> diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
> index 1f8d821000ac..2cc9ccd90d56 100644
> --- a/tools/include/nolibc/nolibc.h
> +++ b/tools/include/nolibc/nolibc.h
> @@ -93,6 +93,7 @@
>  #define _NOLIBC_H
>  
>  #include "std.h"
> +#include "crt.h"
>  #include "arch.h"
>  #include "types.h"
>  #include "sys.h"
> diff --git a/tools/include/nolibc/signal.h b/tools/include/nolibc/signal.h
> index 137552216e46..f0a1418c1cb2 100644
> --- a/tools/include/nolibc/signal.h
> +++ b/tools/include/nolibc/signal.h
> @@ -8,6 +8,7 @@
>  #define _NOLIBC_SIGNAL_H
>  
>  #include "std.h"
> +#include "crt.h"
>  #include "arch.h"
>  #include "types.h"
>  #include "sys.h"
> diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
> index 0eef91daf289..89d3749b3620 100644
> --- a/tools/include/nolibc/stdio.h
> +++ b/tools/include/nolibc/stdio.h
> @@ -10,6 +10,7 @@
>  #include <stdarg.h>
>  
>  #include "std.h"
> +#include "crt.h"
>  #include "arch.h"
>  #include "errno.h"
>  #include "types.h"
> diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
> index 902162f80337..0ff7fac40bd4 100644
> --- a/tools/include/nolibc/stdlib.h
> +++ b/tools/include/nolibc/stdlib.h
> @@ -8,6 +8,7 @@
>  #define _NOLIBC_STDLIB_H
>  
>  #include "std.h"
> +#include "crt.h"
>  #include "arch.h"
>  #include "types.h"
>  #include "sys.h"
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index 2c302f3feb71..b6c33c40c037 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -24,6 +24,7 @@
>  #include <linux/reboot.h> /* for LINUX_REBOOT_* */
>  #include <linux/prctl.h>
>  
> +#include "crt.h"
>  #include "arch.h"
>  #include "errno.h"
>  #include "types.h"
> diff --git a/tools/include/nolibc/time.h b/tools/include/nolibc/time.h
> index 84655361b9ad..bbe8f9aa3e9b 100644
> --- a/tools/include/nolibc/time.h
> +++ b/tools/include/nolibc/time.h
> @@ -8,6 +8,7 @@
>  #define _NOLIBC_TIME_H
>  
>  #include "std.h"
> +#include "crt.h"
>  #include "arch.h"
>  #include "types.h"
>  #include "sys.h"
> diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
> index e38f3660c051..f1677224bb5a 100644
> --- a/tools/include/nolibc/unistd.h
> +++ b/tools/include/nolibc/unistd.h
> @@ -8,6 +8,7 @@
>  #define _NOLIBC_UNISTD_H
>  
>  #include "std.h"
> +#include "crt.h"
>  #include "arch.h"
>  #include "types.h"
>  #include "sys.h"
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
