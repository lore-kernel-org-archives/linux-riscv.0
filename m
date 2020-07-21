Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26930C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 05:16:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E14022080D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 05:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f3O6RLe2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSKnoUQE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E14022080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g6xcLva3in/RDXcdJRHSvpToGomTHugrGHIbCb0G9MQ=; b=f3O6RLe2j42rrpj/2WOJBSGfi
	wB0qwIahnu+LaM2+0yP39VHKGNqUZHJv7P9JRUJO+3F90tyFQET5mkO0wqPSMRxGOGy53k1LKaXyV
	MxnNJNlPfg7pf6RUkJWZGtBCROgrOtLg3ElECCHm2aEhCJW6/w6u8o51N5gDCPZv9s/XMdq66AMMQ
	lauc/6FaZuQAZ+mxI2W9J6n37EI2a6Ujm4liWV5GoWZFGIEwqprOhFqc/0oXLby1b36vFRRWwTZd1
	n+EcBMMYXEsnzyYoPZJ9tKpkwk7NzrJwXYq4DdxyGNtmeUaO6I9dzguBXNOEwo7zMAF5LzTjqhSru
	uOeUbI6bA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxkcy-0002bc-Bo; Tue, 21 Jul 2020 05:15:44 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxkcv-0002az-UG
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 05:15:42 +0000
Received: by mail-pg1-x544.google.com with SMTP id g67so11398295pgc.8
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 22:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J/mLB+L0dOxfPh4NtkLPCqOs8EVtpXS97aRzfQLSOBY=;
 b=lSKnoUQE0R4Avng+9DcTTSHH7IW0zeDZbyN2CH/xra/dmMk3rjnsrtFkHk/oRCRmas
 s7BXjxjEGA7hGaP1WNhCasSE8NnKu2i5RyEeSv6aQqPEehCL5J/Pi4wSBKyTfvAUivhs
 ua0ir8m5/L5Ul5S6MPv/AcO6dQ9/3G9xSWOAMLQ9g18X6CPiLEC4JNzgguAyT9rzVsyK
 sWbJuNleeC1iomc9FG77nI8pxj/Ier1Vdtisj/eqLofsAcWzeIFGVvijTrv4LcKndT6C
 3VnhMq7krR36uHB4ZpI29SYw0J4JEV10klKxNtqT0OboaTGh5LWfOBJ27IyoXFR7CBTo
 5VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=J/mLB+L0dOxfPh4NtkLPCqOs8EVtpXS97aRzfQLSOBY=;
 b=c7AtdKSN98mXsnAIu31Ov8hZVpUJMYmpWC6EUXv9lIyembk2/KuOVwzhcWypU2zTZ9
 PPasOAiekI5ZVeQJMcabYJMZ2Ux2LWaQifMYKzMJLXxRVSQvcbN7wdOYlQFW6k5OxCdu
 EX+D+hjq7qOdluWouwS6Irkj+L3PN1eT0w1EMbcrLutLO58+m2AyiiKukogCLITyJ+TH
 Pe1XC9hQu+K+sMVYscXSajZHUIVEL4lROeFAi+atVX69VEb2ubfIYtoKTc4mKbqas3is
 YatIPOijwkzBTZh1Wt+yx1z/hkqio++GNohZUKcaTFWDfxTvJ+B0HbFBqRYYdBQ+U69g
 PaLg==
X-Gm-Message-State: AOAM5311aLtVeNzd5Z9SjqLxEjG2UEMbSw+wR9GKyxRPmGMrJn6gxIXg
 7iIstrkOkTv0znX/8+VfWlc=
X-Google-Smtp-Source: ABdhPJz7gajG5bMolZEayzYlwuiuSQoyPXgvbYF3R934l1q818CtSBW16Y9JPVNx4YladMuCuW9+rA==
X-Received: by 2002:a63:5a20:: with SMTP id o32mr21544060pgb.15.1595308539618; 
 Mon, 20 Jul 2020 22:15:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 np5sm1537105pjb.43.2020.07.20.22.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 22:15:38 -0700 (PDT)
Subject: Re: [PATCH 1/6] syscalls: use uaccess_kernel in addr_limit_user_check
To: Christoph Hellwig <hch@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-2-hch@lst.de> <20200718013849.GA157764@roeck-us.net>
 <20200718094846.GA8593@lst.de> <20200720221046.GA86726@roeck-us.net>
 <20200721045834.GA9613@lst.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <eb470677-b569-a6f0-e63b-60149b54863a@roeck-us.net>
Date: Mon, 20 Jul 2020 22:15:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721045834.GA9613@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_011542_121178_A7B72225 
X-CRM114-Status: GOOD (  30.47  )
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
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/20/20 9:58 PM, Christoph Hellwig wrote:
> On Mon, Jul 20, 2020 at 03:10:46PM -0700, Guenter Roeck wrote:
>> I had another look into the code. Right after this patch, I see
>>
>> #define uaccess_kernel() segment_eq(get_fs(), KERNEL_DS)
>>
>> Yet, this patch is:
>>
>> -       if (CHECK_DATA_CORRUPTION(!segment_eq(get_fs(), USER_DS),
>> +       if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
>>
>> So there is a negation in the condition. Indeed, the following change
>> on top of next-20200720 fixes the problem for mps2-an385.
>>
>> -       if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
>> +       if (CHECK_DATA_CORRUPTION(!uaccess_kernel(),
>>
>> How does this work anywhere ?
> 
> No, that is the wrong check - we want to make sure the address
> space override doesn't leak to userspace.  The problem is that
> armnommu (and m68knommu, but that doesn't call the offending
> function) pretends to not have a kernel address space, which doesn't
> really work.  Here is the fix I sent out yesterday, which I should
> have Cc'ed you on, sorry:
> 

The patch below makes sense, and it does work, but I still suspect
that something with your original patch is wrong, or at least suspicious.
Reason: My change above (Adding the "!") works for _all_ of my arm boot
tests. Or, in other words, it doesn't make a difference if true
or false is passed as first parameter of CHECK_DATA_CORRUPTION(), except
for nommu systems. Also, unless I am really missing something, your
original patch _does_ reverse the logic.

I didn't track this down further.

Thanks,
Guenter

> ---
>>From 2bb889b2d99a2d978e90640ade8fe02359287092 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Mon, 20 Jul 2020 17:46:50 +0200
> Subject: arm: don't call addr_limit_user_check for nommu
> 
> On arm nommu kernel use the same constant for USER_DS and KERNEL_DS,
> and seqment_eq always returns false.  With the current check in
> addr_limit_user_check that works by accident, but when replacing
> seqment_eq with uaccess_kerne it will fail.  Just remove the not
> needed check entirely.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reported-by: Guenter Roeck <linux@roeck-us.net>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/arm/kernel/signal.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
> index ab2568996ddb0c..c9dc912b83f012 100644
> --- a/arch/arm/kernel/signal.c
> +++ b/arch/arm/kernel/signal.c
> @@ -713,7 +713,9 @@ struct page *get_signal_page(void)
>  /* Defer to generic check */
>  asmlinkage void addr_limit_check_failed(void)
>  {
> +#ifdef CONFIG_MMU
>  	addr_limit_user_check();
> +#endif
>  }
>  
>  #ifdef CONFIG_DEBUG_RSEQ
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
