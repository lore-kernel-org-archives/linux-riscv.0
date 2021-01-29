Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE092C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:05:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9411564DFB
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9411564DFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=60+5NbyyGTesgXLX8doPCk45pQfrN2DMarMrpZk84LI=; b=D2OR8o48qf6tEhD2zFRuOSqWZ
	OXi3M+M2UaOKpro/xhaOGTc1Tj5xkB06J0NH0pEejHpxKTHL8Dn3w/8QciI6E0+GY7xU8imjFBFzG
	YlqXiqScX3rHeuq+zCzXW3+ZtBx0maux+4AiiVBcAr9/xRtIH0ZqhuD3aWVwXiYsWQuoalrRfX1UE
	wmpjHuCYMcQZcVQvyseplqmg5AZZ2BI2Y7r53epvrXx64c0IEX5FL2HORgjEUPBa8HBydWJeg21jV
	uEC5kC4wAT++pERRA08wGBdF6P1bQmXKvvjvBQap1PObcoEqjufVAoye2t43Q71x5yrICLqnccjCR
	qtkdXQcUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Z4y-0006aB-Gu; Fri, 29 Jan 2021 19:05:12 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Z4v-0006ZS-2f
 for linux-riscv@lists.infradead.org; Fri, 29 Jan 2021 19:05:09 +0000
Received: by mail-io1-xd35.google.com with SMTP id u7so10396900iol.8
 for <linux-riscv@lists.infradead.org>; Fri, 29 Jan 2021 11:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P0Q2YwM0Q9fPfFhBWrEuMIdGapoLcfD0AryeJ6s3IjA=;
 b=rV5CaW3gbUWl2EwFuZNzJH9+C49eSAIPUGnQnQWRxa08+o1vgTkEv94GH2IOOYFr+6
 BgseBWLTOxUpQ4F4J04LoV0VbQ23nuiIdWRmQtqc1g95VDFzQlYtc1FShMsuMflOYyyv
 +UGjKjSgnmrKGfj/h9kJD+l7RNcUyxWNIDGMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0Q2YwM0Q9fPfFhBWrEuMIdGapoLcfD0AryeJ6s3IjA=;
 b=dk5OK5ZwSLp/yiA9k7URThkPzHHUAQtP/wjXY0q1h+/a6/tR7zEvwn+Lk9Y9aeKt2l
 rkuQVk1+rLvzsWSrVtOzmYlCO6LYYWGADAlBMvlPoSXsQrO1RcAhUFZRhRPIhE+SODbe
 ZfW42tvfaeDBj5wPlXSSkoYMuqfdZn6QbfV37TFMM2vRtCLU6ZOrsgwLh5hIfwEItglW
 wNjG1/GHz5VU3SHbqPltEnho52vTRo5/GlDXdFMPQQNbIjObrrU2Z9Iu8zO37rW1q0Tb
 qAjLUSZBGuRT/k0ugZrum1Br72v66t2zArekwCDEU8m7z0x0TFNv4u/PYl4zYf0j7JoA
 0Qkw==
X-Gm-Message-State: AOAM532nFBu9lh3TxbX4jEChNCymUNzFX8D9PUEhLcQst7XwovW4wEYL
 L067ynwObQGjIh+YBSi/Q8l+hrUtO/ADGdFzeUKB
X-Google-Smtp-Source: ABdhPJy1ZbZ+tYdJvQM/DTMXF/T+OYg3kxT2NHTvjsN873ujwbydFJMZoCZB5Svu3gDfqjiVljSyWsNwtjYDn6b6S7U=
X-Received: by 2002:a05:6638:13c6:: with SMTP id
 i6mr4682079jaj.141.1611947105409; 
 Fri, 29 Jan 2021 11:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20210129173105.22020-1-alex@ghiti.fr>
In-Reply-To: <20210129173105.22020-1-alex@ghiti.fr>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 29 Jan 2021 11:04:54 -0800
Message-ID: <CAOnJCUJ3q3uiO__VsfwcmOFhvE6L4=Ht7-KBDuLFfvC8ndSwqA@mail.gmail.com>
Subject: Re: [PATCH] riscv: virt_addr_valid must check the address belongs to
 linear mapping
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_140509_129454_167CDA03 
X-CRM114-Status: GOOD (  16.31  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 29, 2021 at 9:31 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> virt_addr_valid macro checks that a virtual address is valid, ie that
> the address belongs to the linear mapping and that the corresponding
>  physical page exists.
>
> Add the missing check that ensures the virtual address belongs to the
> linear mapping, otherwise __virt_to_phys, when compiled with
> CONFIG_DEBUG_VIRTUAL enabled, raises a WARN that is interpreted as a
> kernel bug by syzbot.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/asm/page.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 2d50f76efe48..64a675c5c30a 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -135,7 +135,10 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
>
>  #endif /* __ASSEMBLY__ */
>
> -#define virt_addr_valid(vaddr) (pfn_valid(virt_to_pfn(vaddr)))
> +#define virt_addr_valid(vaddr) ({                                              \
> +       unsigned long _addr = (unsigned long)vaddr;                             \
> +       (unsigned long)(_addr) >= PAGE_OFFSET && pfn_valid(virt_to_pfn(_addr)); \
> +})
>
>  #define VM_DATA_DEFAULT_FLAGS  VM_DATA_FLAGS_NON_EXEC
>
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
