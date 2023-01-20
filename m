Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B95C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44J8DleftKpmvnM4p0C08ArPJ0nxuWwQ2aAhJTzHICA=; b=AdAx3qIWGcZZUd
	8cW4ljfz7TeA6yY4rLvU2Eo2CxqarM+oX88xljPCTYrubpo63nGqJspF0EizWlCsjhK5rta71jFrY
	GWYhzYCM+qOG7LoAOQnHatrPxlO5UezdhCc3RqRKjc4e1kyp4k0LqPmL9gUDs0O5GMx5Ks4R0imz8
	lQlvviG5M8NAbEtWTsaNd82Bz/R7eG0v90YDmIaKc/ODMf/OMgBxqNlREdfvQo9xYGijzl+UlZhkV
	HhYKSY+bZc2uwqIxG7x2CmATwZROcj+SQ8KzAstKB++o6e/8ql0HVGW+G7kJOpK6xmXTD2Vh3i/T5
	gKMz7aBQlxW4G3HUEiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIvMK-00Bfd2-AB; Fri, 20 Jan 2023 17:39:24 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIvMB-00BfV1-OG
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 17:39:17 +0000
Received: by mail-qt1-x82c.google.com with SMTP id g16so2648832qtu.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 09:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUwcPnODL6tkDv1+EEZooXCQzQNc6RaXSg0BM7X5yck=;
        b=HiwKJ0B8Tq/Czmzvwwj3WFQLpQg4XyD1sycR56XD6gZQIrpV2B/W0G3/bD7G+kPeN/
         fUNUt7l8O6BDKRneUBI0nTIYBN3P90cZCv567eleh4T/6U0V8UadYf1YT2M39pM9Bzsk
         X/UD8ELxspxIMH00oddsGsis4zD8Y2Q2vA0nJvVDXg88j1qdaMxX/oweh8tuO9jKbRrq
         pe5NRKabG8x5L6MsyTdHb2dPurmwlUL5TxtwzK+LwO1PcPdIWkk2ZlfYLEEp1rHhOmLC
         Cy+FwEYdm7Gp4+Zoz/kyrpwZdTSffy/MGvB6+XbhQjHwTKH80gLMoYSIIf9tP+xwlXFu
         UMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUwcPnODL6tkDv1+EEZooXCQzQNc6RaXSg0BM7X5yck=;
        b=JbDs/UZOYSbBbABgKZ6kXws4jFgQ5yguGx7DVR49nsGTJ75fuMD7IEX2zjmIrtfs5u
         XZYcv5rm5uUl+ptinCrX6uDTJrcl1Lu0/KZZz7iZxdGSDWVMhKbrGd7YogomFrvkgo5h
         Qs3ESVEyp/RFD1pH1Dr1vpumg2NWVIkl/D7j9u+zD5XKs59icoWCErDthCtiDYA6lRbH
         gcD4hT6SO5ohrxtTOfdEKMFCIGghsIrLsQ9rq6zNhr2A4NRcoBrnJvZnsq2A3hSp0+I7
         LrfBX884qJO9RM/PmdZA9AG2301dUMnji+DMbXFEYS4cbLlPWuG6AaHn0e28qaYwCmEl
         40uw==
X-Gm-Message-State: AFqh2krWvn68qaFQVNlIi815Tnu2VQ2C+ebeKdM4WSiMzh3Xpt1SpW7T
	IWKSrCEcgNd9OCTVnIC+s8g=
X-Google-Smtp-Source: AMrXdXut8qn33mbyBanIQct87VFtSEsClB7xkNdQJFYnrNKxxe8k6Ic9jvSF+Utibg/3+zmxkSdVJw==
X-Received: by 2002:ac8:6650:0:b0:3b6:2ce9:baef with SMTP id j16-20020ac86650000000b003b62ce9baefmr20448474qtp.59.1674236351179;
        Fri, 20 Jan 2023 09:39:11 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id fp26-20020a05622a509a00b003a70a675066sm615724qtb.79.2023.01.20.09.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 09:39:09 -0800 (PST)
Message-ID: <056f0d30-d340-fdc4-3744-1cdedd8b4048@gmail.com>
Date: Fri, 20 Jan 2023 12:39:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
 <20230119052642.1112171-2-Mr.Bossman075@gmail.com> <Y8pJ4y7FyBDQPqIT@wendy>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <Y8pJ4y7FyBDQPqIT@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_093916_090568_5810FB44 
X-CRM114-Status: GOOD (  18.55  )
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



On 1/20/23 02:59, Conor Dooley wrote:
> Hello!
> 
> Since you'll have to re-submit, making sure that allowing !MMU on rv32
> doesn't break the build due to canaan k210 drivers being enabled despite
> relying on 64-bit divisions, I've got some nits for you.
Not sure what driver needs 64bit, but sense !MMU was only selected by 
64BIT. This should work.
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..b9835b8ede86 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -43,7 +43,7 @@ config SOC_VIRT

  config SOC_CANAAN
         bool "Canaan Kendryte K210 SoC"
-       depends on !MMU
+       depends on !MMU && 64BIT
         select CLINT_TIMER if RISCV_M_MODE
         select SERIAL_SIFIVE if TTY
         select SERIAL_SIFIVE_CONSOLE if TTY

> On Thu, Jan 19, 2023 at 12:26:41AM -0500, Jesse Taube wrote:
>> From: Yimin Gu <ustcymgu@gmail.com>
>>
>> Some RISC-V 32bit ores do not have an MMU, and the kernel should be
> 
>   s/ores/cores
OH thanks sorry for the spelling mistakes.

Thanks,
Jesse Taube
>> able to build for them. This patch enables the RV32 to be built with
>> no MMU support.
>>
>> Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
>> CC: Jesse Taube <Mr.Bossman075@gmail.com>
>> Tested-By: Waldemar Brodkorb <wbx@openadk.org>
> 
> And the automation complains that this tag is not "Tested-by:"
> 
> Thanks,
> Conor.
> 
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>>   arch/riscv/Kconfig | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 59d18881f35b..49759dbe6a8f 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -163,8 +163,8 @@ config MMU
>>   
>>   config PAGE_OFFSET
>>   	hex
>> -	default 0xC0000000 if 32BIT
>> -	default 0x80000000 if 64BIT && !MMU
>> +	default 0xC0000000 if 32BIT && MMU
>> +	default 0x80000000 if !MMU
>>   	default 0xff60000000000000 if 64BIT
>>   
>>   config KASAN_SHADOW_OFFSET
>> @@ -262,7 +262,6 @@ config ARCH_RV32I
>>   	select GENERIC_LIB_ASHRDI3
>>   	select GENERIC_LIB_LSHRDI3
>>   	select GENERIC_LIB_UCMPDI2
>> -	select MMU
>>   
>>   config ARCH_RV64I
>>   	bool "RV64I"
>> -- 
>> 2.39.0
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
