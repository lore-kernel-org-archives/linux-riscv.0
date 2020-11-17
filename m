Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450E4C63777
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:48:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5396620674
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/P1YDKW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="RWwNYKUJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5396620674
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4dJP9RY1Yn6BlrNEmZ9LyUGhhoe66S7GiEv4UHJda9I=; b=h/P1YDKWzcpWIqrVt5Sq2Fv+a
	GQSWoQEgjplIRs5+mxRsBQHGxa4SgVA7tY6BqE5Oa8UH39ssy27H5EU7WsDPR1OtIDB5Si5w0xHQ9
	GF3Yx4rKf/rNb26Q7iZ4FrJmXh9tLDn3AbReA+v8whLhIol4p6+8QFS2eX0OHZDT7ZB9oeYFhmtLM
	7di4jeAR4xA67G7jyzV1jMTp/PTADcjgHoXMFstMea+oVgy4gh9zWF0vCAlzkKBY91YMprysXo871
	66GyuiaSLCTzInCWezxZyP2rihZALrxJEiSXpr4jLfKQWiyz+1JT4fDNrUFN7r1ag62pohuelwXDD
	+N0fa/wWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf6x8-00044m-3w; Tue, 17 Nov 2020 19:47:46 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf6vv-0003JN-Cd
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 19:46:33 +0000
Received: by mail-pg1-x544.google.com with SMTP id t21so10405350pgl.3
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 11:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nWLn5FutqVhu6C2envdImtz3KsoVlAIGjTIx4c1QXNg=;
 b=RWwNYKUJ8FHrbEAF2X7STaEV0pLcso44r/P15V8Qw9UoO+Uu5XaR3xyuYg8SMZY5MB
 6O0nhled1fN8K81Rsb0gHRvoW8w1YJvmAgRq1KlsgbdLIb7bLbmqofZ+Q115kxkSDVuc
 poX1jX5OMLYnvAWbT+R6Eyu4Pxy4nXfwsOaYFx9UiUrFm1tUwogK7jzvRzF4AgxvDGrf
 iBjOqLPLynUKCIftZocEKRrDWH92FloVkxHYgPM75KjV05sudUTl82bXfrSY119Bzcgx
 MXOrrCiejU0KKMfmLTPOTt9vpO6s8wvQoux4Ud47/mOc2lGTa9pGLz1PqijS2/Q77Ygw
 K/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nWLn5FutqVhu6C2envdImtz3KsoVlAIGjTIx4c1QXNg=;
 b=ZGuQYaU18yZYCv+Kj1e+d0uzU2moBYS5UnWsID5wdc7+9A4LzeFG+GljzCTFOTUilx
 C88ustTcU7a4Kue0nDVFEy/7Ej6fYhBWJDWx3VWM5W1AiqhrB4fVPugLrGgsAvtd569o
 tEJD053vUQlI5jWY1DnK0K13bUJezzgtyrLGQXNxHTYSFIx4Nee1PbOkO40W7+X7QNb1
 lGzazdpgX0QhjJ1I6WlBrOelaMx+W9WpCgSJwpN2ffm5LsWgmefPMLqNMYZDKxExwBUf
 w9fPROdIsopLdscd6SbRkDsK8Ped/LzIwx7nSj3bfl1kU92U9iZLUyfWaQ8JRwE0EkTb
 Ln8Q==
X-Gm-Message-State: AOAM531bfH9vZSBa4AOQnmAsZhktmft7NjPch82/kOUSzdQ8TJQpN6WL
 myKWmn6euzhADfXfhKvTh3DjOjqxO0RNzPA1mTwbew==
X-Google-Smtp-Source: ABdhPJyDrcELE42tedArMs204mY5PQM+V4W1fuc8fBPXx/V/yrIUb8NjyaPqo5jxCNkKPfw2LRZFqLy1QtS2JF7B58Q=
X-Received: by 2002:a65:4485:: with SMTP id l5mr4795692pgq.10.1605642388738;
 Tue, 17 Nov 2020 11:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20201117193053.18990-1-rdunlap@infradead.org>
In-Reply-To: <20201117193053.18990-1-rdunlap@infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Nov 2020 11:46:18 -0800
Message-ID: <CAKwvOdnAHqNkN2yRPnSSbe=C6Uc0MJXH=VU2KFRyE3AtHpcXXg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: fix barrier() use in <vdso/processor.h>
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_144632_281313_0F6E93C6 
X-CRM114-Status: GOOD (  18.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 11:31 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> riscv's <vdso/processor.h> uses barrier() so it should
> #include <asm/barrier.h> to prevent build errors.
>
> Fixes this build error:
>   CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
> In file included from ./include/vdso/processor.h:10,
>                  from ./arch/riscv/include/asm/processor.h:11,
>                  from ./include/linux/prefetch.h:15,
>                  from drivers/net/ethernet/emulex/benet/be_main.c:14:
> ./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
> ./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
>    14 |  barrier();
>
> This happens with a total of 5 networking drivers -- they all use
> <linux/prefetch.h>.
>
> rv64 and rv32 allmodconfig now build cleanly after this patch.
>
> Fixes: 3347acc6fcd4 ("compiler.h: fix barrier_data() on clang")
> Fixes: ad5d1122b82f ("riscv: use vDSO common flow to reduce the latency of the time-related functions")
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Arvind Sankar <nivedita@alum.mit.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: clang-built-linux@googlegroups.com
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1202

> ---
> v2: update Fixes: tags (Nick);
>     also built allmodconfig cleanly on rv32;
>
>  arch/riscv/include/asm/vdso/processor.h |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- lnx-510-rc4.orig/arch/riscv/include/asm/vdso/processor.h
> +++ lnx-510-rc4/arch/riscv/include/asm/vdso/processor.h
> @@ -4,6 +4,8 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
> +
>  static inline void cpu_relax(void)
>  {
>  #ifdef __riscv_muldiv



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
