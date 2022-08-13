Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF88C19F2D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Aug 2022 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ub2uhBZaw9EU3kL5C+dhNbuybUZsPQgrX0zGOGHhE28=; b=HxzAvfjcCRaZ9u
	0ZGrHD562EtMrs1j8wtcwRoaXTvDuKuuYe1TUX/OcxZPx19IgN7I8pvgbmwHH7rzMvf5m5qRd3r04
	pDWa2iZH/lGklhsW9P+DEArfuzb2D/hwqcdkDKasQsQn5oLf5gMZDuTzT3jWK+Jgx+HzQrBNXiQHG
	T9jsKtuaLjzfOXGkqZ3ZfsZgl543Ze9QtGVIPwnkpfJkZDSzkWPyB6eH0KLh2XtDN/091bdAHkcyV
	4oLik1MNbRFNCeKV4GcE14syYkfUsXRdh1PAAG/qUEWZsGhnVRqvR3UGbZExkpacnOjASTdu7aPPv
	4GxY3J0T6VoOOWSkyg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMvBp-00GJiL-VG; Sat, 13 Aug 2022 17:44:49 +0000
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMvBl-00GJfu-F9; Sat, 13 Aug 2022 17:44:45 +0000
Message-ID: <7b97d66d-610a-6750-f17f-4de41a97b528@infradead.org>
Date: Sat, 13 Aug 2022 10:44:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] kernel/sys_ni: add compat entry for fadvise64_64
Content-Language: en-US
To: Conor.Dooley@microchip.com, linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, josh@joshtriplett.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-api@vger.kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org
References: <20220807220934.5689-1-rdunlap@infradead.org>
 <03c5f897-d4e2-8408-6116-ad7619ca385d@microchip.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <03c5f897-d4e2-8408-6116-ad7619ca385d@microchip.com>
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



On 8/13/22 10:03, Conor.Dooley@microchip.com wrote:
> On 07/08/2022 23:09, Randy Dunlap wrote:
>> When CONFIG_ADVISE_SYSCALLS is not set/enabled and CONFIG_COMPAT is
>> set/enabled, the riscv compat_syscall_table references
>> 'compat_sys_fadvise64_64', which is not defined:
>>
>> riscv64-linux-ld: arch/riscv/kernel/compat_syscall_table.o:(.rodata+0x6f8):
>> undefined reference to `compat_sys_fadvise64_64'
>>
>> Add 'fadvise64_64' to kernel/sys_ni.c as a conditional COMPAT function
>> so that when CONFIG_ADVISE_SYSCALLS is not set, there is a fallback
>> function available.
> 
> Is this in a 6.0 destined tree somewhere that I've missed?
> Bumped into it while looking at an unrelated LKP randconfig error.
> FWIW:
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> Thanks,
> Conor.

It's in Andrew's mm-hotfixes-unstable branch AFAIK.

Thanks.

>>
>> Fixes: d3ac21cacc24 ("mm: Support compiling out madvise and fadvise")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: Josh Triplett <josh@joshtriplett.org>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: linux-api@vger.kernel.org
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-mm@kvack.org
>> ---
>> v2: patch kernel/sys_ni.c (for any arch) instead of arch/riscv's
>>     unistd.h (Arnd)
>>
>>  kernel/sys_ni.c |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- a/kernel/sys_ni.c
>> +++ b/kernel/sys_ni.c
>> @@ -277,6 +277,7 @@ COND_SYSCALL(landlock_restrict_self);
>>  
>>  /* mm/fadvise.c */
>>  COND_SYSCALL(fadvise64_64);
>> +COND_SYSCALL_COMPAT(fadvise64_64);
>>  
>>  /* mm/, CONFIG_MMU only */
>>  COND_SYSCALL(swapon);
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
