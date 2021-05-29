Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92067C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DEC61090
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42DEC61090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iRGXFCMCp+fkpn3Aq/blYLJ/jhVgs4xuuz3Hl3cotBQ=; b=ZMJAdsE9EggT4uiZWZUyvtZG8Y
	WQaC7yiuVi1rt3hEqQrPmNfGG9jedF7r2Uz6BKMIU9QPkvATjXuTsXV0eLy102BTKAClMUiWeILCM
	qq0uBm6wNvW/rmznWuY3TKTO6NgN/did3GJCUm9eQwUAqRdLQEqGx96sq3n6k9bZR0rErYhXETLL8
	GEP8SQYyg2AuNbQTmvkL2gZdN0NJcii9CKPv59UZmYu1gbX2CjvC1oECrREOEJEUyev6Ak6Rdswai
	EWFkGgb4zBx1t+zl13YPVMF9zkr+92rK5KTWf27u0iV8AW12LKZp8NJYmYFxhrs/YNnOLUux5ITw7
	v+sJwjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln844-008Y1S-15; Sat, 29 May 2021 23:08:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln840-008Y0X-NY
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 23:08:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id 69so3361793plc.5
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 16:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sRVlaEEdmy2fejqm1LOYoX48nSor38C+saK1W6Lf4/s=;
 b=E1wgVzZGpfyq9t7N8n24R3QZGtn759prQ9Ypv80Idx5khXw3ckZKvEoArXvhg/yXoQ
 bOIba+tCmn/iOFPQDmOc9EY3VqLAmTqvm/C4b+CGAPfyS2aO1WfPSAQJcVq2gSQf7P6q
 pxwLT+k0/9sJc7ZYQkKt2YgyV2Lcct2eKmc0vu4wcsMLS7iH5jgEXpAJyGNJLTnCIguW
 wl6L3ckQ4hBnkmIGXtyHuEiE1RpCBzsp4zd0gXxEteKgo/Jj2jYY0LQNkDL371GamncT
 ro54HMR92i/U+NZQFKVACEiB0WsYqtR13aljHT+8L4GqF+Y1+r/7U07YI10mV4LgXTF4
 9kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sRVlaEEdmy2fejqm1LOYoX48nSor38C+saK1W6Lf4/s=;
 b=n+GWgO+6rqLmuV00R9QPWK0pxLve57NZkeE46VG9sc+KVpoSRX8A6Cxon33RiYjzo9
 4r2XqZ90MvatutH0VxElu+7OC+fhtx1dsEGi+/QaMk5DASc8bRvhJEzPfrRDqBLaNUMS
 p/z72y2lyNJXaA494HSiipzOBnHyZ3sTC//PdX+25Qy1VgN7e54kD4Emad5jnUOnTNZo
 Yew6jzVQhQSpmcrrCgiPpE4ZXHh87HKl2d+WTe7roeEr3NbP5GZY5O+exiLc7XbFXaLA
 0bKzCDev+KJBWfkAc8f7PMSg1N7ICurFPlQE7I5ZUQFTVJI5ukQVMcuPXLYlVM/DbWEI
 7YBA==
X-Gm-Message-State: AOAM531Rg+2SgEzGTFJccsfwuEgmjYq6k3o2DH+0rkfNCq0mdbPOHNqb
 WFaLBVtVpHzI2hOxQQnJhBopZA==
X-Google-Smtp-Source: ABdhPJwFfFnBe8aicTdBk4lfp+U758kjADLjg1HfzNkpIgiuq6BLJtEMp3irt06nPnjgz+jn88h+nQ==
X-Received: by 2002:a17:90a:a78d:: with SMTP id
 f13mr11437791pjq.161.1622329695920; 
 Sat, 29 May 2021 16:08:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r11sm7503153pgl.34.2021.05.29.16.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 16:08:15 -0700 (PDT)
Date: Sat, 29 May 2021 16:08:15 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 16:04:50 PDT (-0700)
Subject: Re: [PATCH -next] riscv: TRANSPARENT_HUGEPAGE: depends on MMU
In-Reply-To: <a2953d37-aaf3-3db5-f4a3-488a8ca7f245@infradead.org>
CC: linux-mm@kvack.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 akpm@linux-foundation.org, sunnanyong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org, rppt@kernel.org
Message-ID: <mhng-184591e7-860d-4bec-86c1-7a26ad6e806e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_160816_790038_F3AA2F96 
X-CRM114-Status: GOOD (  21.48  )
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

On Tue, 25 May 2021 08:40:10 PDT (-0700), rdunlap@infradead.org wrote:
> On 5/25/21 3:33 AM, Mike Rapoport wrote:
>> On Mon, May 24, 2021 at 05:13:02PM -0700, Randy Dunlap wrote:
>>> Fix a Kconfig warning and many build errors:
>>>
>>> WARNING: unmet direct dependencies detected for COMPACTION
>>>   Depends on [n]: MMU [=n]
>>>   Selected by [y]:
>>>   - TRANSPARENT_HUGEPAGE [=y] && HAVE_ARCH_TRANSPARENT_HUGEPAGE [=y]
>>>
>>> and the subseqent thousands of build errors and warnings.
>>>
>>> Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>>> Cc: linux-riscv@lists.infradead.org
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Nanyong Sun <sunnanyong@huawei.com>
>>
>> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
>>
>>> ---
>>> I really think that mm/Kconfig should have "depends on MMU" for
>>> TRANSPARENT_HUGEPAGE, but commit 15626062f4a9 from 2012
>>> ("thp, x86: introduce HAVE_ARCH_TRANSPARENT_HUGEPAGE") thought
>>> differently. I.e., mm/Kconfig should be protecting all arches
>>> against this Kconfig problem.
>>
>> We could
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 02d44e3420f5..85bc8bf32e7b 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -403,7 +403,7 @@ config NOMMU_INITIAL_TRIM_EXCESS
>>
>>  config TRANSPARENT_HUGEPAGE
>>  	bool "Transparent Hugepage Support"
>> -	depends on HAVE_ARCH_TRANSPARENT_HUGEPAGE
>> +	depends on MMU && HAVE_ARCH_TRANSPARENT_HUGEPAGE
>>  	select COMPACTION
>>  	select XARRAY_MULTI
>>  	help
>>
>> but in a sense HAVE_ARCH_TRANSPARENT_HUGEPAGE should imply that MMU is
>> selected :)
>
> Yes, I had this patch before the one that I sent but decided against it
> based on history.

IMO 15626062f4a9 ("thp, x86: introduce HAVE_ARCH_TRANSPARENT_HUGEPAGE") 
is really saying "the arches that have transparent huge pages are MMU=y, 
so we don't need the extra check".  That seems reasonable as of when the 
code landed, and while arm has MMU=n and THP it already depends on MMU 
(via ARM_LPAE, which seems kind of natural there).

The generic version seems fine to me, but I'm going to take this one now 
so we can avoid the build issues.

>>>  arch/riscv/Kconfig |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> --- linux-next-20210524.orig/arch/riscv/Kconfig
>>> +++ linux-next-20210524/arch/riscv/Kconfig
>>> @@ -106,7 +106,7 @@ config RISCV
>>>  	select SYSCTL_EXCEPTION_TRACE
>>>  	select THREAD_INFO_IN_TASK
>>>  	select UACCESS_MEMCPY if !MMU
>>> -	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT
>>> +	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
>>>
>>>  config ARCH_MMAP_RND_BITS_MIN
>>>  	default 18 if 64BIT
>>>
>>
>
> thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
