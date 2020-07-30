Return-Path: <SRS0=rfC7=BJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E95C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 21:21:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AFA20829
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 21:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G++rtUmu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="UM7q/hh3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AFA20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=97jTvwJW7UD6gOTcT9m94k5UtOWqF4cmEe+3lSqCHOQ=; b=G++rtUmu8g/8eqZWOJ8TRSzvr
	I6opbxcBhId2zxZwFFHb0VmqdoIL1hqFyf21L9z1bLS3HQKZC/5a28zB2dyE6nO6IBgyvjkBJTpeI
	muw1+CDQ1Dyg0wOqZAYE74ztPY8pt9zbh0R57WdIKzSGIf+pUnWzSD+gVimY+VXqH8SLmHysbNneZ
	Gz4XzYfKHkbGtqaacZvJKTmFW5yPFI6dn8XxnRYzVu3xNcW1XqZG6wxKQltJYis4Ao9nHwRDK0ICU
	kpUTXzhufJG4ogVhzFnL7YjsAwRYAqtCo++tuMy2927mN5MPnRkkHnMTrn8furl+WDqpBOvmGzBWy
	rjvXfdJ7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Fyp-0008WM-Ns; Thu, 30 Jul 2020 21:20:47 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Fym-0008VH-M9
 for linux-riscv@lists.infradead.org; Thu, 30 Jul 2020 21:20:45 +0000
Received: by mail-pl1-x643.google.com with SMTP id m16so15350548pls.5
 for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2020 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=T9TN+IiG05axbq9DvASXkbUWMclW/1L5ezZkeAERv5E=;
 b=UM7q/hh3+ycXamy6DmVDsqTeyGwToom5lGdDqRMu9nAmBIv9chtjGOtptQGetwvOLM
 dsbPN8u5TFZ4QxDmLlK2Qc8xKyIcI/Q4NYjbUuaSrkkEI6pidokfHVungFblJBmjzoz6
 m8k0/Kw7NxtrkfSYNWkXwhoqyaNZZ6d/gv+ZRsx9H+ofRvhogUmbxCvbEb9ELRr/ntEr
 seYQhSQhj4IkcOY/BiB6K++rUFLn5u5hKFGYT3+Q79YBWK/qBEMpIgkbhzctmN/Qmqqt
 CMP9i25xSEC9So5qlz7pEJooph+gaPlzD40QmetOhYuvq0Tc5Ft0hUd0GDEKws4bGMMs
 xBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=T9TN+IiG05axbq9DvASXkbUWMclW/1L5ezZkeAERv5E=;
 b=Tz4ZqIk1YYvn0rEzkqR0ys/yZbFxXgSFV2d9HOh8M3qLme7S8IKqWh2OVQp7IGBuhN
 f9lVCw07w5Xc+CWyiZ9WGqAHbFDs7UomFo2tK5/HkgHBALEbKbaYTKcKM66k9UupAP0t
 YIPhR0SZiorNZwh8dHhf43oNfk7kyGQWc4JpQSzVNLRPqfgxankfbLyTPl+bpz1h5S8X
 6G30RUYap73RuZDDzx+sOVxM87KeiT8DuGrS1aUltuJ/pWaIu25p2cmCXMAkBReUU7h4
 QGLNc7gMKXKGhoWS8Z0tWZLHiwE2x8jIZFuNYWhy3JmB0MzS3RE0lqVxnuPpR/Ox1u+6
 AQaA==
X-Gm-Message-State: AOAM5311+TnknosdXIzo4g1fPFtW1Q7YIOOENCTwv0saLgVTKnZBgMZX
 meGNBela88G4fLWW8QR4nVTzCA==
X-Google-Smtp-Source: ABdhPJzjBOdzPpZw2Zy8gz/U2wDGlNr+GQCGfyGI52RbMq/aPY97IjWGN5aeZxp17vggsWF8JUIiGw==
X-Received: by 2002:a63:5b55:: with SMTP id l21mr813118pgm.348.1596144040321; 
 Thu, 30 Jul 2020 14:20:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d9sm7277389pgv.45.2020.07.30.14.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 14:20:39 -0700 (PDT)
Date: Thu, 30 Jul 2020 14:20:39 -0700 (PDT)
X-Google-Original-Date: Thu, 30 Jul 2020 14:20:34 PDT (-0700)
Subject: Re: [PATCH 17/24] riscv: use asm-generic/mmu_context.h for no-op
 implementations
In-Reply-To: <20200728033405.78469-18-npiggin@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: npiggin@gmail.com
Message-ID: <mhng-5c1b7324-11f8-4334-bfc4-6fc1920aeaa3@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_172044_777919_631671BA 
X-CRM114-Status: GOOD (  18.46  )
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 linux-mm@kvack.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 27 Jul 2020 20:33:58 PDT (-0700), npiggin@gmail.com wrote:
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/riscv/include/asm/mmu_context.h | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index 67c463812e2d..250defa06f3a 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -13,34 +13,16 @@
>  #include <linux/mm.h>
>  #include <linux/sched.h>
>
> -static inline void enter_lazy_tlb(struct mm_struct *mm,
> -	struct task_struct *task)
> -{
> -}
> -
> -/* Initialize context-related info for a new mm_struct */
> -static inline int init_new_context(struct task_struct *task,
> -	struct mm_struct *mm)
> -{
> -	return 0;
> -}
> -
> -static inline void destroy_context(struct mm_struct *mm)
> -{
> -}
> -
>  void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  	struct task_struct *task);
>
> +#define activate_mm activate_mm
>  static inline void activate_mm(struct mm_struct *prev,
>  			       struct mm_struct *next)
>  {
>  	switch_mm(prev, next, NULL);
>  }
>
> -static inline void deactivate_mm(struct task_struct *task,
> -	struct mm_struct *mm)
> -{
> -}
> +#include <asm-generic/mmu_context.h>
>
>  #endif /* _ASM_RISCV_MMU_CONTEXT_H */

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

I'm assuming this is going in along with the others.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
