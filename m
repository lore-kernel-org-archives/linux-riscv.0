Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986F0C2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 17:16:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A44B611BD
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 17:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A44B611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5ZoqzquFhPon6p9FB0wlHu6B9NqgwAOwO1/21ZHMWhc=; b=KrQOuPA8Dbkb8oeP1jysOFLSyC
	ENkD3PNVZqN+xdcMuyeHSF0VNxJI72KMrVbBAzG16K7O9iQ8Py3dcqrYArkg35iadVrJWXd+8Ms4k
	SXn+8JraLGaevy86IHzZq4CxIfX6tary+MxI3VwbBAgYoAEoRA9lSkTKmjuQN8gd999Hx094/XYMW
	9BGHRZRf4Y8lz0ZWwahc8qs91yOPUte8BijK+15VWM8CAR4Xj0JKgeW08ibX8UeLSpIIJp2uVg9zD
	1WuMKxNHXosLDy6Jf16YNkHiyYgTrrzRwPs4g6jN/0KVbgFK0J8bMWxZvb/z88SfhxEI7305bgQaz
	KW+5oEbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkVDw-002qno-87; Sat, 22 May 2021 17:15:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkVDu-002qne-1q
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 17:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=bumDb/hx+SGF/3ZOf+oQUyiA5GdTYW0dGDsrfTfTKto=; b=kvQo14vHewwt044Rt5IGcrI61r
 gB4Wr+/07TpgW8X+0CpCcnAPYZXAOLx68oop2n2I49D/zdDq3CXtdOuDImYYr0EBMkx3wabVwsbTS
 Jl8vdLbf/lexEfnmlO5x9ElyQBukWNbe4ecxGcQJT5dEW2LryISWLbGR+Gl4s3VpQGoC9r+gqv/Wz
 UuMGbjYievoFZ+hcJJEhZoMFYDQ/5H8sIwOlmyUyjaq8L32LcroeHBxudBIw/KB22rGbpW5gYmTgh
 6T68GRICaFLP/GcaUqNEz+QhCXWXiqiy6S4y3foWv4Glkhk30bHVIDP5pdmmMhOUymOn0hEdzk4By
 geb+teZQ==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkVDq-0009pk-Kh
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 17:15:36 +0000
Received: by mail-pj1-x102d.google.com with SMTP id kr9so4503234pjb.5
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bumDb/hx+SGF/3ZOf+oQUyiA5GdTYW0dGDsrfTfTKto=;
 b=HKiQ2q/Oa7xiiKcVMCa7AvIAt9lPn/A6g7V2Uq/Vg8hrn7R+rfYNUlohVddpscTyNU
 V5Au+cNL/SvvHTwX72CFR2LU0A+VngyqTuIFSn7Y+0ahorvakRAkEjVNOzlWkXTn9JBq
 oQEJcXE14jwDfLPV1UJ0DwfWZ4w2PbhO05S14kNDYimegwyn70HLU2T7bH4XG21OcyEU
 I8M/ckYHnu43cawhO5emUvxWmVTHEibrRDe/Q7Utbb3nIjGEJjAmEpCvXoksAAdRiSKN
 Olw7goXxW60jbAaZA0PIljJGGpvwZ/2JZgDfYGVv5amow52CQFURrSZ1kNGNIocWKZKb
 Sk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bumDb/hx+SGF/3ZOf+oQUyiA5GdTYW0dGDsrfTfTKto=;
 b=VJDgxmq2lPgj1GRAR2Eb51of0QijgT8WMctWCLA0Ey0/tzO8Tii2M8BoGP83O25AnP
 IuycC9evMhgOuH0dbIJscWJmZvkuyqLf8I/y6xXAt2LAfk0DFo7KR9np+5rdB7bKfGmx
 RqKJHEP4SSo0QhKvAKQV+bslW3vPGN7UpVwuJnV8diWQR1Ceuh3QTyxz0rxudPDoCKBV
 DCEJ9MheL6sZjMXb+mQjZUBToOr1Lsrj0ARvqbRvWgIp5GUwihlsxPc61akqKovjeZJW
 /ue/6TRV/zJLcrr2WxT6dLrDW/Pc2GtIGQUc6Bj5VFIbq2dQ7B3+gj2AHL+LtjRdwXC9
 aVaA==
X-Gm-Message-State: AOAM532KD+n6HRdIwXWbuB5X+0dRjP7jGWqjUR+viel1A8frr+OMDUrZ
 wpI17Dl/d3e/CLNCcFOY+j2PbNZv5csatQ==
X-Google-Smtp-Source: ABdhPJznFfwkyGma5JO+7bDUDKAIsuGWCzbs9XnmRYVhhpZpD8vBb1vKiyEXpx8qRGUM50oIFQHTLw==
X-Received: by 2002:a17:902:b406:b029:ec:fbf2:4114 with SMTP id
 x6-20020a170902b406b02900ecfbf24114mr17994784plr.32.1621703733350; 
 Sat, 22 May 2021 10:15:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r11sm7203513pgl.34.2021.05.22.10.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 10:15:32 -0700 (PDT)
Date: Sat, 22 May 2021 10:15:32 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 10:15:28 PDT (-0700)
Subject: Re: [PATCH] riscv: code patching only works on !XIP_KERNEL
In-Reply-To: <CAM4kBBJqF=AxTu50PF=EshLSyqn0=yeC2dwf4JJj_Grsi_Tccg@mail.gmail.com>
CC: jszhang3@mail.ustc.edu.cn, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vitaly.wool@konsulko.com
Message-ID: <mhng-1c10179a-d96b-4cf1-860a-03f0313ac980@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_101534_777192_6614719A 
X-CRM114-Status: GOOD (  24.15  )
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

On Mon, 10 May 2021 11:19:30 PDT (-0700), vitaly.wool@konsulko.com wrote:
> On Mon, May 10, 2021 at 6:35 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>>
>> From: Jisheng Zhang <jszhang@kernel.org>
>>
>> Some features which need code patching such as KPROBES, DYNAMIC_FTRACE
>> KGDB can only work on !XIP_KERNEL. Add dependencies for these features
>> that rely on code patching.
>
> Since we can define extra RW sections to place some tiny code bits in
> RAM, I would suggest that you hold back this patch for a while.
> I am not going to support the idea of e. g. compiling KGDB support
> into a XIP kernel, but disabling the whole HAVE_ARCH_JUMP_LABEL is
> hardly the way to go.

Do you have any updates on this?  The SOC_SIFIVE disable thread floated 
back to the top of my inbox and I didn't see anything there.  I'd prefer 
to avoid chasing around Kconfig disables for a bunch of stuff that we're 
just going to fix soon, but if this is going to be a big change then 
it's likely for next cycle anyway so in that case I'll start picking up 
these compile disable patches.

Not trying to rush any thing here, just don't want to have a bunch of 
broken configs.

>
> Best regards,
>    Vitaly
>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> ---
>> Hi,
>>
>> Currently, the RISCV_ERRATA_ALTERNATIVE also only works on !XIP_KERNEL
>> but from the maillist it seem there's effort to make the co-exist, so
>> I drop RISCV_ERRATA_ALTERNATIVE dependency on !XIP_KERNEL.
>>
>> Thanks
>>
>>  arch/riscv/Kconfig | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index a8ad8eb76120..61320b94ef97 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -60,11 +60,11 @@ config RISCV
>>         select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>>         select HANDLE_DOMAIN_IRQ
>>         select HAVE_ARCH_AUDITSYSCALL
>> -       select HAVE_ARCH_JUMP_LABEL
>> -       select HAVE_ARCH_JUMP_LABEL_RELATIVE
>> +       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>> +       select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>>         select HAVE_ARCH_KASAN if MMU && 64BIT
>>         select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
>> -       select HAVE_ARCH_KGDB
>> +       select HAVE_ARCH_KGDB if !XIP_KERNEL
>>         select HAVE_ARCH_KGDB_QXFER_PKT
>>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>>         select HAVE_ARCH_SECCOMP_FILTER
>> @@ -79,9 +79,9 @@ config RISCV
>>         select HAVE_GCC_PLUGINS
>>         select HAVE_GENERIC_VDSO if MMU && 64BIT
>>         select HAVE_IRQ_TIME_ACCOUNTING
>> -       select HAVE_KPROBES
>> -       select HAVE_KPROBES_ON_FTRACE
>> -       select HAVE_KRETPROBES
>> +       select HAVE_KPROBES if !XIP_KERNEL
>> +       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>> +       select HAVE_KRETPROBES if !XIP_KERNEL
>>         select HAVE_PCI
>>         select HAVE_PERF_EVENTS
>>         select HAVE_PERF_REGS
>> @@ -230,11 +230,11 @@ config ARCH_RV64I
>>         bool "RV64I"
>>         select 64BIT
>>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
>> -       select HAVE_DYNAMIC_FTRACE if MMU && $(cc-option,-fpatchable-function-entry=8)
>> +       select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>>         select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>> -       select HAVE_FTRACE_MCOUNT_RECORD
>> +       select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>>         select HAVE_FUNCTION_GRAPH_TRACER
>> -       select HAVE_FUNCTION_TRACER
>> +       select HAVE_FUNCTION_TRACER if !XIP_KERNEL
>>         select SWIOTLB if MMU
>>
>>  endchoice
>> --
>> 2.31.0
>>
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
