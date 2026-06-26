Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D255CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rl2+5ppeVXlWMs8oyXPNIf4T+o7j96/6VW5vx46VjqE=; b=XDIg2mQwv0YjEz
	U6IDaM4wO89RWz+Jpukcuk96Tg6wrnBoPQK3g/zqWtOstiTtgtArTrDB6A3Qn/TXu65SocM8ovWbj
	6hC5yx4ivYBGOJ298O9cKyIquj0H88D/EtyjQCwy4B7qhSbcOcWVy7K486z+KqaYmrtn5rozeHRPO
	R40gfnpus7zzHdK6PSJA2Laxa+XYTCnx2+CiCd5FazuPFn/v4XA+SaKGTyVnINT8kjvOlogfc4PyN
	TMPEgRkY8woa+UrIwvuiwO3U9BEc9KZ4mDcWDi0Q7ExQ4hjZLwONqMnmfXZakgCvQ0+5s4EEn8tAE
	hcnYys+9+NDcd1h/57OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd28h-0000000AseV-09L9;
	Fri, 26 Jun 2026 08:42:19 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd28d-0000000Ase7-2CoX
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:42:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c89370405aaso300598a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 01:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782463334; x=1783068134; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JsvSBjnG06bUFbh9b1fjdG1LZreCknqQFnMC8kjK6/8=;
        b=OPgoTX3KMTOFj3PAQgN/NhYmIEnjex5iC3gkIqH3nl12Iv22/IeNTEfMs2FOqmgYW/
         t8xzQYVJqx7r/FQbPnlK1PTqapWC8p5VBXwBF97Eho91hZ7M3sPSti4Tai6dWzmftCuZ
         dr31xcNN2SJzKUmyvcl8+gaqNeO3YY0BVMI7QFBt3/MvWWoRYk9t9ePPvzE1huDYlzeK
         HS8Ej5ffmldB4WbG5sZGbnO24tjE6CXydGFEeujPZ33FawgwBMVIWEXx4RLQVo0L5Iom
         kscfpO2FIydPqFOI/mWxHRc8CjHNIxkYBiFtlULlzVturK7nFDGEMdCrhkF8fX3pfNk/
         XClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463334; x=1783068134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsvSBjnG06bUFbh9b1fjdG1LZreCknqQFnMC8kjK6/8=;
        b=Prt1kT7c6srMB7VKMOWM9H7/ZvZKAxiVDaZXI9aCsLL6kKJ2KEiZhDSOC0hxhqzjv9
         ZTUTQQqi0UM+GYK+lFvnhYwqri6ojsphEe378QyOhs96V8BXfiIkHYWfm7Pt3m2UJudE
         xWyrfEo9R2FacGFPZCgfrxpTDNf8uB2w0UVsidjdaYYVMWbtIF+1hCaG+GUSdbxYNwx6
         8s1ET6AO5UtYkKG2DG0gkWoBkhVgA8pq7fj51Di47W7hg+XjtDLWV/mn2W9RYJvMLnjS
         iBvzKxsK6ne7cnizC2q7IrYvzy/WWrGA11wd1Q8mXTlyOXyRcPgxQbjom4XtnF3PRCUs
         +33Q==
X-Forwarded-Encrypted: i=1; AFNElJ8eabM06qZpNGs6m7OHT4zeKL6OPg6jTEoRaSml8nyb1UA5Ka7lszPGvsmpuBwp1oE3zGf4V3VNaw0Fcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQFYBs+UMKOhxaGd9IifwPk15xHPhNJ7r/oUJ96LkrO1YWzEOs
	LyBDutb5kj+endBJDwopQ2qrNGk/znDLSgNBDHrN51yLSEvdjUTFTkzI
X-Gm-Gg: AfdE7cmAurbRl91WMgL9/yrR/SzanxU4eLty1NiG2PnYnFtgzgLH+UmnAjQ4rBQnL5m
	ZDf4p7lzU0EvKISThOyEiGjp0qvbTvaYnUtgawsg2jAo14P3xit2lbv4JwKBeErNHrjTCFUO83L
	YFp82YIRU/4MB3wE5cd7mR2nT5ncmZ+3Kn3FJS/ivWHg0xFwxXWdQbD3X1+11Sft1Cts4+o3JQR
	OGJu5bhHEz1vsU5hZJAC+eT76nu9cdM93i8iMEIX8j67gcWMCswoaecpqujYUfFBAUNyMKmFY7F
	Agei1v0NwYXZ3mjW44BQpo1BT822ziHUntPDYEMXhrPTW/+l+D8iTMDG8rm3nXfcEyCp/Q+i0tT
	NUJGHu+5Uda38WrFF6l+aD83BDQsHp3gnMj9yRx0AlF+bgGlO/9jiyrIgFV7KToZA
X-Received: by 2002:a05:6a20:9397:b0:3b7:8027:dfeb with SMTP id adf61e73a8af0-3bd4aec7163mr7059290637.22.1782463334219;
        Fri, 26 Jun 2026 01:42:14 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b96eccf8sm3107580a12.3.2026.06.26.01.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:42:13 -0700 (PDT)
Date: Fri, 26 Jun 2026 16:41:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: guoren@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Leonardo Bras <leobras@redhat.com>, Raj Vishwanathan4 <rvishwanathan@mips.com>, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Han Gao <gaohan@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, sophgo@lists.linux.dev
Subject: Re: [PATCH V5] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <aj463BBQccFwUoV5@inochi.infowork>
References: <20260421143154.1590156-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260421143154.1590156-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_014215_579065_C1EA1CA9 
X-CRM114-Status: GOOD (  36.59  )
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

On Tue, Apr 21, 2026 at 10:31:40AM -0400, guoren@kernel.org wrote:
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
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Yao Zi <me@ziyao.cc>
> Cc: Chen Wang <unicorn_wang@outlook.com>
> Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
> Changelog
> 
> v5:
>  - Add Acked-by: Arnd Bergmann <arnd@arndb.de> for asm/generic
>  - Add Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
>  - Rebase on v7.0
> 

Hi, Paul

I wonder whether this is possible for applying? I think this is 
a necessary fix for SG2042.

Regards,
Inochi


> v4:
> https://lore.kernel.org/linux-riscv/20260412143116.1445893-1-guoren@kernel.org/
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
