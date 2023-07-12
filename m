Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33C7EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=i3klxKDXbVsosybHdJG8o3zIPe4zEgf7+FAFN57oNlo=; b=pd0UM6tIlRogHe3rhtNY4ANaNO
	kPGFJBb4q6cUciZMRSZ4CCiI+zIRTqArOFSZP+VzVj4864LjxqqxLOYYofbRXJYffbnqd4C6CHcHl
	mSY19+1tyR9Guj7wzCrrc2xOo0xwEuAhogYr3qyNBf0IR0A0C1eKV6pgRfDrRTvn0tYZqPu7ZX+df
	E3UPo4XEH4kwDwwsXsZCsNwwP8tcKVIl0nMzj9bcb06TzCmqVckQT2h+0ixkCyGgReTWajqrKRmJC
	eVeYRZcA/fQGUaOK4ib3tcmB3gEtMKg/jySGChbYKz3M5F9wK2/tPs42pzbbZ6myshb/ATJLfCAm9
	oo6IwAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJb8K-000Ek5-1e;
	Wed, 12 Jul 2023 14:48:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJb8H-000Eip-2k
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 14:47:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6686708c986so6414692b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689173274; x=1691765274;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7ZzdgCSce0eXgObZSf/O2dLzVDaP+oy72QGw+Tibn8=;
        b=CJwggF8FMrwIjJ9tXt6iTCr6SiGkrSs1Ymg8zi2c7djR8FfYv6ZPKycuearRYI08s5
         XCIeE8mZxPx3nwtU0OSEPEzMdtU/shDnk0ZIjJdcmCrDHx0/OVxKMuya59vUetOsyDBL
         My1TD+XJgeZcoSJOYFIvv3DBFpdtYjfDv8wB/omrIJqgZAwuXvwTdHM9DFqz+5k4+fa7
         zWhZGs9PDK3oKzyyFdK8x35EiWJT2E4TA0rb41wC56gKJr/jCrH/s7rPQv/kBWHAMpx8
         UOd2mqEaLojLTE5g1utqN3hTUa+0rT2IkVkNRHq5gGioYmY0ZJ6CaAc2LQJiDghwyV75
         9CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689173274; x=1691765274;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7ZzdgCSce0eXgObZSf/O2dLzVDaP+oy72QGw+Tibn8=;
        b=CPCoNjOx7oq4+3tqr5IalyDbsPjHgHZhBsgJRpX/U5n7TC1G1yZIJKR05I8CS5v63w
         wTMjSX2q47avycG8fvwh8tpV14CPtCsKheLN2UV4ReqYYz41xQfcfPfJjUcvGnYXsVdg
         pE/CJ+V2QhSuiyyybWpPlUsqmaGmGZ++pzad0hEq2d4rUxoD3dykk2TYVATtiZU2JjL4
         8CJw6cMRZSlvJeat7iANOz/mPiBx5xdDoIpy06JPNFsOUciCFRqwuTshJjHyfeUb3WM3
         n1/EJ7Z0EsyjaeZCDkD8VP3IRD+1dSK4hkWZWm4WcuTOnnwxejJ+J2d9b55/sncIwHLY
         VexQ==
X-Gm-Message-State: ABy/qLaGxMBih0lXg94dgVu0QyX99Ql05N1f5VwxDB2hlVsibYynZJbi
	fUIc9c+cf3ekZaFXb3Z3OGXJoMYmWvMHTgnCeeU=
X-Google-Smtp-Source: APBJJlGkn2tgs/TqDBK0+vdIimjq1Xq/P8alAABP9Glj3OYDvpYiDYUH6IYWQVt1qmgfBH8+N5Zadg==
X-Received: by 2002:a05:6a20:9707:b0:126:39ce:476b with SMTP id hr7-20020a056a20970700b0012639ce476bmr18799590pzc.12.1689173274290;
        Wed, 12 Jul 2023 07:47:54 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id z186-20020a6333c3000000b0055c656ef91asm2922080pgz.77.2023.07.12.07.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 07:47:53 -0700 (PDT)
Date: Wed, 12 Jul 2023 07:47:53 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jul 2023 07:47:04 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Re-alphabetize Kconfig
In-Reply-To: <20230707-contrite-old-0efdb8702633@wendy>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-2052d618-06e1-4c84-b6d9-e841e966b4a9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_074757_892718_E86149B9 
X-CRM114-Status: GOOD (  17.50  )
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

On Fri, 07 Jul 2023 02:55:21 PDT (-0700), Conor Dooley wrote:
> On Thu, Jul 06, 2023 at 02:04:57PM -0700, Palmer Dabbelt wrote:
>> Looks like I missed a few of these, I just stumbled on these again due
>> to a merge conflict.
>>
>> Fixes: f32b4b467ebd ("RISC-V: enable dynamic ftrace for RV32I")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  arch/riscv/Kconfig | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index b49793cf34eb..6553cc6c0858 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -105,9 +105,15 @@ config RISCV
>>  	select HAVE_CONTEXT_TRACKING_USER
>>  	select HAVE_DEBUG_KMEMLEAK
>>  	select HAVE_DMA_CONTIGUOUS if MMU
>> +	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
>> +	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>>  	select HAVE_EBPF_JIT if MMU
>> +	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>>  	select HAVE_FUNCTION_ARG_ACCESS_API
>>  	select HAVE_FUNCTION_ERROR_INJECTION
>> +	select HAVE_FUNCTION_GRAPH_TRACER
>> +	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>> +	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
>>  	select HAVE_GCC_PLUGINS
>>  	select HAVE_GENERIC_VDSO if MMU && 64BIT
>>  	select HAVE_IRQ_TIME_ACCOUNTING
>> @@ -148,12 +154,6 @@ config RISCV
>>  	select TRACE_IRQFLAGS_SUPPORT
>>  	select UACCESS_MEMCPY if !MMU
>>  	select ZONE_DMA32 if 64BIT
>> -	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
>> -	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>> -	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>> -	select HAVE_FUNCTION_GRAPH_TRACER
>> -	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>> -	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
>>
>>  config CLANG_SUPPORTS_DYNAMIC_FTRACE
>>  	def_bool CC_IS_CLANG
>
> There's a bunch more elsewhere in our Kconfig stuff, but no point
> hanging around on re-sorting this stuff..

Ya, it's become a mess again.  At some point I had a script to poke 
these when merging patches, but I lost most of that stuff when I moved 
to b4.

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
