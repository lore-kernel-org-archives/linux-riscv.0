Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20B8C47074
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 11:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vmiD7+JmEzIEmMOKDdPJw2STBiiL3udO8A0IRspd9E=; b=zMJOtIIdFxnHcx
	HVVbthZHqMk4H+xLlqL+7CdULHk+MnhjXOemuQzfoiZ0DzAQxUTww7M7xOVew7IEH1Gnmnf356qsz
	T/QClBcFmXidYWk4TqL3bFw+Qzj4RQ62vEvp7GiBxfWmyewsY0kiQ10CBtIthY14lrQoKTA2llsBx
	of2TzpIbSN8+lSk6qqCPjeLftiqdLctDvI1RR/teaAeWq+dcVALwdupSOcy09q5Locw9acQ/ug4Ho
	HgLyvRHHkA8TcOMDxYe/mhe4PFlDbPs8QucN6zOQyZh+Jyoj1M8bbBqflawSIGpBHovN9XXPl5qjk
	/8tpjJyRxMjoX7i3jXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcnV-007h64-29;
	Tue, 02 Jan 2024 11:19:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcnS-007h4i-2C
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 11:18:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a2343c31c4bso1039045266b.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 03:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704194335; x=1704799135; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDW+u+a15ExUx3Vc0dt3K0IdM4f8o7iazZ5ZQ68mxqM=;
        b=W/xiqtPqEXHzNzbT20Lzic79nPIJXfP3qNed4sINDrl3PBQPegfOdRZ/9w3xAEp9X5
         lpe28xTD5gLwi2uQzkY52c1PpUuoLBQkMOXiGnfVoVcwfb/XKtJ9a8K0T+hPCO1tJUoV
         KGSsklepdSqATPpvDDGY/1eNg7pgfgkrJPUnfkGkiqi03W553U0VqPgMeDlLimcr6/j3
         2/ctO57wyom5z9lnmejKVxnibBiYMamE6rUfKRd4X2c9ppI1+C7zfT5UTi5Pdu651JMj
         l2BPgdnYDtMxUTJn0F6593Skg2Dc8j1YBc057QyXTOvzVJYMymYvqBUlGAWP+mv8U2yW
         cAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704194335; x=1704799135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDW+u+a15ExUx3Vc0dt3K0IdM4f8o7iazZ5ZQ68mxqM=;
        b=bceg/U9v2vtehrxbeNMuQrVzNUfucLn5UOAuAyOu6WqfUGZiq890AnAmwjGjy8PsZQ
         epXM73wlxvLrcucrdyFhkQvkIsEGrtaQglsJA1SzceFzJaa10r0rsstMnvm1p4mlhz0F
         soZKWMaVDx2s4+uH5fMvQtkhR0ltOmFZavunmVA1Blf6mTKPNxUo6Tv73JU9HHRgCyRn
         qnIEYu/f07BzJu2KZqFB2EX86pJ5WErZ9YYzykNI66dAe6SHviUz2FQgded+qotrDLqd
         uoQdFQUzvQPO9XkuwtVWcWcfoYB+OYOdhJNmL9wd/hH87carFiG4IOpPIqLoNhPZtqFJ
         n1iA==
X-Gm-Message-State: AOJu0YyKsnPx8CvOddXbpyeJHG6DceY7i1kU0JaUES6NFQ7f0JYdkfeg
	Pkjmr2Rdg0QaMCrMnrIx5LCDPO0Ksg07Dw==
X-Google-Smtp-Source: AGHT+IFBhJg0nvf63SW4dKofH6YheDdq61fVDoG8wzwL4ptYI5pLENo1amuLwxoT29fRt30e4xkXCg==
X-Received: by 2002:a17:906:3602:b0:a28:71c4:e246 with SMTP id q2-20020a170906360200b00a2871c4e246mr19162ejb.96.1704194335418;
        Tue, 02 Jan 2024 03:18:55 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709060f4f00b00a26e1122762sm8754870ejj.192.2024.01.02.03.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 03:18:54 -0800 (PST)
Date: Tue, 2 Jan 2024 12:18:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Subject: Re: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for
 sc.w
Message-ID: <20240102-81391283df04c430d76c0eb0@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231231082955.16516-4-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_031858_725049_98294327 
X-CRM114-Status: GOOD (  21.41  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 31, 2023 at 03:29:53AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The cost of changing a cacheline from shared to exclusive state can be
> significant, especially when this is triggered by an exclusive store,
> since it may result in having to retry the transaction.
> 
> This patch makes use of prefetch.w to prefetch cachelines for write
> prior to lr/sc loops when using the xchg_small atomic routine.
> 
> This patch is inspired by commit: 0ea366f5e1b6 ("arm64: atomics:
> prefetch the destination word for write prior to stxr").
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 26cea2395aae..d7b9d7951f08 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -10,6 +10,7 @@
>  
>  #include <asm/barrier.h>
>  #include <asm/fence.h>
> +#include <asm/processor.h>
>  
>  #define __arch_xchg_masked(prepend, append, r, p, n)			\

Are you sure this is based on v6.7-rc7? Because I don't see this macro.

>  ({									\
> @@ -23,6 +24,7 @@
>  									\
>  	__asm__ __volatile__ (						\
>  	       prepend							\
> +	       PREFETCHW_ASM(%5)					\
>  	       "0:	lr.w %0, %2\n"					\
>  	       "	and  %1, %0, %z4\n"				\
>  	       "	or   %1, %1, %z3\n"				\
> @@ -30,7 +32,7 @@
>  	       "	bnez %1, 0b\n"					\
>  	       append							\
>  	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
> -	       : "rJ" (__newx), "rJ" (~__mask)				\
> +	       : "rJ" (__newx), "rJ" (~__mask), "rJ" (__ptr32b)		\

I'm pretty sure we don't want to allow the J constraint for __ptr32b.

>  	       : "memory");						\
>  									\
>  	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
> -- 
> 2.40.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
