Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9EAC02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRQRX5y13tYdAEhmXLSeUqrO5aTIY7K3Qro64+17XlI=; b=zhrBHYqPhMeXr4
	5UQimlWMJyWERhq8q4cjbmCD/5V6aO3VcfGvLEMn7YEWzELqvOCVZ1SwJNHGO/ti5GWVMyrf+wAgP
	85FiwSgLZsNj3b6JRp5CGXIH6BTFNCZVUktIO9FHWKsBMglhoHQmAtWY9HPGWZjhRgAHW6Kp1Wtr9
	xda8vzdEPrEr8j2DKzVkumz+3mPlYdNjUghE3m0LV53AkKSaMcz99w/Xzwzv4rcnP1zM+x83XQS8q
	4v67jMxhOqIaFL5XgktBuaekClHcb4C7RlDDDzLz2Qyjl9JhA4Bq1Kgl4LQWqv3mF+UPG+I4jvXPJ
	oYSXVVAfvchlKR6V1LRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipXf-0000000Drw9-39ig;
	Fri, 14 Feb 2025 06:51:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipWH-0000000Dric-26Ax
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 06:49:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B05E4113E;
	Thu, 13 Feb 2025 22:50:06 -0800 (PST)
Received: from [10.163.37.128] (unknown [10.163.37.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 052F13F58B;
	Thu, 13 Feb 2025 22:49:42 -0800 (PST)
Message-ID: <8e60766c-8567-4954-9d99-e1d702d0fcc3@arm.com>
Date: Fri, 14 Feb 2025 12:19:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mm: Make GENERIC_PTDUMP dependent on MMU
To: Steven Price <steven.price@arm.com>, linux-mm@kvack.org
Cc: christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-4-anshuman.khandual@arm.com>
 <5504fadd-6174-41c4-90a8-d3ae7f76d7f6@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <5504fadd-6174-41c4-90a8-d3ae7f76d7f6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_224949_588863_F9777F12 
X-CRM114-Status: GOOD (  14.36  )
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



On 2/13/25 16:53, Steven Price wrote:
> On 13/02/2025 04:09, Anshuman Khandual wrote:
>> There is no page table dump without a MMU. Make this dependency at generic
>> level and drop the same from riscv platform instead.
>>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> As Christophe has pointed out - this is broken. The select will override
> the dependency you've added in GENERIC_PTDUMP. Generally have "depends
> on" for symbols that are "select"ed is broken. I'd suggest just dropping
> this patch.

Agreed, will drop this patch. Thanks Steven and Christophe for the
explanation here regarding correct usage regarding the "select"'s
construct.

> 
> Steve
> 
>> ---
>>  arch/riscv/Kconfig | 2 +-
>>  mm/Kconfig.debug   | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 7612c52e9b1e..c4cdba6460b8 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -112,7 +112,7 @@ config RISCV
>>  	select GENERIC_IRQ_SHOW_LEVEL
>>  	select GENERIC_LIB_DEVMEM_IS_ALLOWED
>>  	select GENERIC_PCI_IOMAP
>> -	select GENERIC_PTDUMP if MMU
>> +	select GENERIC_PTDUMP
>>  	select GENERIC_SCHED_CLOCK
>>  	select GENERIC_SMP_IDLE_THREAD
>>  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
>> index a51a1149909a..c08406760d29 100644
>> --- a/mm/Kconfig.debug
>> +++ b/mm/Kconfig.debug
>> @@ -214,6 +214,7 @@ config DEBUG_WX
>>  	  If in doubt, say "Y".
>>  
>>  config GENERIC_PTDUMP
>> +	depends on MMU
>>  	bool
>>  
>>  config PTDUMP_CORE
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
