Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E721EBFD0F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+taZq4gP/CLwKhiuEn6k2aHzKvLgtrwAnhUSSBMf7+c=; b=MOluCzgIxciaF3
	qXJcHO5VIz0lGP5rYGJq28aDZJlmUWRBkO9iquOncjRBYkpvVbwBxyFn0ql2seSSus8TqPb5pamui
	qJ5wzinOoIthqGhqfdJpbOVQ+k46kgr2qlGJGWpUZocYVDbpI6bz34WhuXbPH0DNqqcQ9o8tu515Q
	LfU2ZPLD2COVO9ZQw2WzEIuhOFFeMslY0Ob5zT3jqKPI8/at5EihJIhWYVO0w/HX6htzEJGWVH5Ut
	GMSSljkiK8N+CofV0M5r5dnjn8W8X5vD9QECowb/t9HyTZLmN/rmYVo5YdT8P1lNSZ3kZOAv8mXMr
	F/F/VvUuQ2sqfajh8NHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBuy-0000000FARV-2eFK;
	Mon, 13 Apr 2026 07:41:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBux-0000000FARP-1t3K
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Apr 2026 07:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XH03pGaphrFl/+YBvK4rXtUGkz/ZGoIf0lxOvNfwMWg=; b=PP1y9QgL1dhemsDwrvEh5qjpT+
	MDW1cW4Pd/nO7zskLeFyP8wm3xwlx9w8neokKYBDvYscqRcjalA+pXWCg7xyIVPeMbMq6kThSQ1yX
	v7KMkfrO16uDY2tY/qxYJfMJbAD3UrHdaNN7ReGEV8Nxs7pJ0JSxl4DJuw/wW58BFtMckCcvmO6jw
	fLdXWnfmrodl1Cc0nfuHKairsnKAVR4PXbqiYSHXO4S61D25YGfknwrk5CYGbMtcd43GQuu3n458r
	P4KZNExizrQHVBLiDe5a0FGxNArGgh9VtU/BpBdGH61zrPoLNL4QM9UKk7nl8eujt4XVWaXgpipVY
	P4FLosUA==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBus-0000000GIWm-2P1J
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:41:10 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so2862458a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066064; x=1776670864; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XH03pGaphrFl/+YBvK4rXtUGkz/ZGoIf0lxOvNfwMWg=;
        b=erMUNphlz6tThZ60tzll/kfFNwyt346fQScTVCH+AKyxwIYot9lUiCg+UXMP2Zsa2F
         3meUXOYVqL5ZGjRzkHz/iWN8GBrUfUYh5RzRnsjKQlS7AkVflpxYwpm9pkt9AZSINIFv
         2OI2Da2qESY35KI3Ih/gOesbw3uiDL1OYQMoQ7MT9cFyFYJ7+ILgqATgZZJ3K81Yr3of
         aZkCRmml2luUzL+nhpBD9YKlHek7PR/uWk6CXyvXGWgfdsh2NcrIW+v6dclauSh8bd+8
         YR3BFGatpn5vN74f4SMjMSxPdJ7HEBxhHR+O/vf7Yd1i8xLzTuwVnm2DIvt0UstN+ND3
         sy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066064; x=1776670864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH03pGaphrFl/+YBvK4rXtUGkz/ZGoIf0lxOvNfwMWg=;
        b=W8IJnndiz33mPtwns24W4dNap7jwpwP4ODuKFw6fLM5ij2cc/ALBC2Urat2dtYmQ0F
         9Bt3IPhtW8lnnz4ac8DlUJBxv0xNL8GT2TlyLk6/6lWWuxQxuWtFJYM7IKE5vyKUU+AY
         UWP6JjyQ9W4zjqqtLZX5icQex2HMc69MLgNPiCwWet44jcMmI039nhzRrxsFC4ezGJ+x
         Fav2Sq75Z2RRSiXOy6yjOPRS1Q05uC2U35Jlzt7Vgs0iueYHyLtnygeOFxgswSRisiup
         cSr/F39KB4y21iwM+vunQfZh6ogo0k7a9zC2ITXVHso6K37WvAgBVP0ak5xhmr9Uh/t2
         KyLg==
X-Gm-Message-State: AOJu0Ywcc2vphYoWZaMo+QLmFMShAZ6g7bRxnUDuxr4Aq3yiIUzy6tYq
	BMqFWCbhA1ui5r05UTiwIPF4R4SS/555KTLQut33c8bNgYAkCzODoUmv
X-Gm-Gg: AeBDies0TlRSSjJam0SwBGrZ+pxFC7fG++YljjjT91pGoAlal8NyJznZa7YhmgiqsWO
	tAO8lScvc/0A8k2UCzLN5fuiASdHJg9uwvdkHzH9geh6izv8wVtuCJkjAxkdLWff4bFtGhi3HTJ
	tO/RGwV3srSj4Ei0LeahIXDh/yeEi/WFp8BjuNekj6PcEkaRlL/iOOijiIJiGLx3KKXjD5lGBW/
	AK3mueMeWDfpHDkVOFnZ65qpEPU4hG4jvjMTJU4gYIuv2B8w6zcFJONMs3NQg8qzNGkhgTHDqOW
	/hHf42cwx6CgBE9VCUKeXBtOn+Vv72VZMghcMclhn4349JFBVIeU5KAbPgFFAaSYO0eFEv7HJmy
	x4JH9MQwFtl9MUXOrRCa4vs58q9NAi+e6lsSZlX9n6iU8iMZQlL6HAcDB8qywJwTqAKssnSFQ81
	p+8T6c64CG7kMDwAOTW/z4UOCEGUXSlX470A==
X-Received: by 2002:a05:6a00:94f6:b0:82a:6d9d:3f85 with SMTP id d2e1a72fcca58-82f0c382d6cmr13702263b3a.48.1776066063355;
        Mon, 13 Apr 2026 00:41:03 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b2455sm10434535b3a.35.2026.04.13.00.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:41:02 -0700 (PDT)
Date: Mon, 13 Apr 2026 15:40:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alex@ghiti.fr, leobras@redhat.com, djordje.todorovic@htecgroup.com, 
	aleksa.paunovic@htecgroup.com, arnd@arndb.de, rabenda.cn@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Han Gao <gaohan@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH V4] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <adyd86f4MJE8muil@inochi.infowork>
References: <20260412143116.1445893-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260412143116.1445893-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084106_957556_A4C56E0B 
X-CRM114-Status: GOOD (  35.20  )
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

On Sun, Apr 12, 2026 at 10:31:16AM -0400, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> The early version of XuanTie C910 core has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 & th1520 platforms with the qspinlock
> lock torture test.
> 
> So appending a fence w.o could immediately flush the store merge
> buffer and let other cores see the write result.
> 
> This will apply the WRITE_ONCE errata to handle the non-standard
> behavior via appending a fence w.o instruction for WRITE_ONCE().
> 
> This problem is only observed on the sg2042 hardware platform by
> running the lock_torture test program for half an hour. The problem
> was not found in the user space application, because interrupt can
> break the livelock.
> 
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Yao Zi <me@ziyao.cc>
> Cc: Chen Wang <unicorn_wang@outlook.com>
> Cc: Inochi Amaoto <inochiama@gmail.com>
> Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

> Changelog
> 
> v4:
>  - Add Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>    (https://lore.kernel.org/linux-riscv/1cfdf6c1-a384-43ad-9588-284335d073f7@ghiti.fr/)
>  - Add Tested-by: Yao Zi <me@ziyao.cc>
>  - Rebase on v7.0-rc7
> 
> v3:
> https://lore.kernel.org/linux-riscv/20260125063941.443777-1-guoren@kernel.org/
>  - Rebase on 6.19-rc6.
>  - Remove errata_list_vendors patch which has been merged.
>  - Add Tested-by tag.
> 
> v2:
> https://lore.kernel.org/linux-riscv/20250713155321.2064856-1-guoren@kernel.org/
>  - Add new header file for errata_list_vendors.
>  - Rebase newest kernel version.
> 
> v1:
> https://lore.kernel.org/all/20241214143039.4139398-1-guoren@kernel.org/
> ---
>  arch/riscv/Kconfig.errata                    | 17 ++++++++++
>  arch/riscv/errata/thead/errata.c             | 20 ++++++++++++
>  arch/riscv/include/asm/errata_list_vendors.h |  3 +-
>  arch/riscv/include/asm/rwonce.h              | 34 ++++++++++++++++++++
>  include/asm-generic/rwonce.h                 |  2 ++
>  5 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/rwonce.h
> 
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 3c945d086c7d..4d3f13522da6 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -154,4 +154,21 @@ config ERRATA_THEAD_GHOSTWRITE
>  
>  	  If you don't know what to do here, say "Y".
>  
> +config ERRATA_THEAD_WRITE_ONCE
> +	bool "Apply T-Head WRITE_ONCE errata"
> +	depends on ERRATA_THEAD
> +	default y
> +	help
> +	  The early version of T-Head C9xx cores of sg2042 & th1520 have a store
> +	  merge buffer delay problem. The store merge buffer could improve the
> +	  store queue performance by merging multi-store requests, but when there
> +	  are no continued store requests, the prior single store request would be
> +	  waiting in the store queue for a long time. That would cause signifi-
> +	  cant problems for communication between multi-cores. Appending a
> +	  fence w.o could immediately flush the store merge buffer and let other
> +	  cores see the write result.
> +
> +	  This will apply the WRITE_ONCE errata to handle the non-standard beh-
> +	  avior via appending a fence w.o instruction for WRITE_ONCE().
> +
>  endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 0b942183f708..fbe46f2fa8fb 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -168,6 +168,23 @@ static bool errata_probe_ghostwrite(unsigned int stage,
>  	return true;
>  }
>  
> +static bool errata_probe_write_once(unsigned int stage,
> +				    unsigned long arch_id, unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
> +		return false;
> +
> +	/* target-c9xx cores report arch_id and impid as 0 */
> +	if (arch_id != 0 || impid != 0)
> +		return false;
> +
> +	if (stage == RISCV_ALTERNATIVES_BOOT ||
> +	    stage == RISCV_ALTERNATIVES_MODULE)
> +		return true;
> +
> +	return false;
> +}
> +
>  static u32 thead_errata_probe(unsigned int stage,
>  			      unsigned long archid, unsigned long impid)
>  {
> @@ -183,6 +200,9 @@ static u32 thead_errata_probe(unsigned int stage,
>  
>  	errata_probe_ghostwrite(stage, archid, impid);
>  
> +	if (errata_probe_write_once(stage, archid, impid))
> +		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
> +
>  	return cpu_req_errata;
>  }
>  
> diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
> index ec7eba373437..8fd7c36307e2 100644
> --- a/arch/riscv/include/asm/errata_list_vendors.h
> +++ b/arch/riscv/include/asm/errata_list_vendors.h
> @@ -18,7 +18,8 @@
>  #define	ERRATA_THEAD_MAE 0
>  #define	ERRATA_THEAD_PMU 1
>  #define	ERRATA_THEAD_GHOSTWRITE 2
> -#define	ERRATA_THEAD_NUMBER 3
> +#define	ERRATA_THEAD_WRITE_ONCE 3
> +#define	ERRATA_THEAD_NUMBER 4
>  #endif
>  
>  #ifdef CONFIG_ERRATA_MIPS
> diff --git a/arch/riscv/include/asm/rwonce.h b/arch/riscv/include/asm/rwonce.h
> new file mode 100644
> index 000000000000..081793d4d772
> --- /dev/null
> +++ b/arch/riscv/include/asm/rwonce.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ASM_RWONCE_H
> +#define __ASM_RWONCE_H
> +
> +#include <linux/compiler_types.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/errata_list_vendors.h>
> +
> +#if defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE)
> +
> +#define write_once_fence()				\
> +do {							\
> +	asm volatile(ALTERNATIVE(			\
> +		"nop",					\
> +		"fence w, o",				\
> +		THEAD_VENDOR_ID,			\
> +		ERRATA_THEAD_WRITE_ONCE,		\
> +		CONFIG_ERRATA_THEAD_WRITE_ONCE)		\
> +		: : : "memory");			\
> +} while (0)
> +
> +#define __WRITE_ONCE(x, val)				\
> +do {							\
> +	*(volatile typeof(x) *)&(x) = (val);		\
> +	write_once_fence();				\
> +} while (0)
> +
> +#endif /* defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE) */
> +
> +#include <asm-generic/rwonce.h>
> +
> +#endif	/* __ASM_RWONCE_H */
> diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> index 52b969c7cef9..4e2d941f15a1 100644
> --- a/include/asm-generic/rwonce.h
> +++ b/include/asm-generic/rwonce.h
> @@ -50,10 +50,12 @@
>  	__READ_ONCE(x);							\
>  })
>  
> +#ifndef __WRITE_ONCE
>  #define __WRITE_ONCE(x, val)						\
>  do {									\
>  	*(volatile typeof(x) *)&(x) = (val);				\
>  } while (0)
> +#endif
>  
>  #define WRITE_ONCE(x, val)						\
>  do {									\
> -- 
> 2.40.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
