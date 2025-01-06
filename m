Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6C4E77199
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnJgBLBKeIQ6rtSC0d1szq45pvG4Yop38UnAqPJD/FM=; b=Iw+6pZsmulypJU
	9UHLBf/Gaa8rTQOuvNlISBddvwVN+yRCMIONoORa3PjMGvCK/fZ3AQxY4LPD2dvz6GyEsgY+5sY7c
	mrxFkkYxJnaZ3ao1Rtz6ITTzrfpYrIZu/YGMZwFffp4YhgrGndRybM9zpt1Ao/rNLgEeDJtzTQz24
	BHId9T0PT050Qm2jiNoytuSZZHZhWyXBokYRpZHI/xQjZuLECLWsB/IAGhoe94rVRWbp1JEqt4M7b
	RkvCdqhjF7mzfXDxX+yucCynx2L5XWDNUYdMBQO0nFTPL/GDBK0N8wKTMZuYyPbEkemVD7mEEdw6t
	PKNs8jl6+aniKphbi3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkth-00000000yD1-3vkH;
	Mon, 06 Jan 2025 11:03:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUksg-00000000y01-1H8N
	for linux-riscv@bombadil.infradead.org;
	Mon, 06 Jan 2025 11:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=; b=MZMEFP2KP4ij3sd8/f0MUKbjQ+
	ZYqJCHhdm8RjcfDQxU0Mf19beb/t932jy6ucno9GxDWUB3iW7T3GIcOYqW0lSpDp/WNdpMRzGCQlq
	vfdcN01XprvWyI2u2cDBUSWz94KkUpgWv1QJEvRBxtsQwjddrv0B6SFzdk631hiWiQK8o2ymPFPXm
	yUEIVfpV/UOJv3dUkmZ9Ige9sNIu1B4jM4FKrTIujgW6MH+atj7B8Aok/lHqFtxYGYBVYotFSfko3
	ueZhNJR1FXjp8zXD2gvLWnMQ1nAlw3QDz6JSGoNV8GmEC3f1E1Dl5RzYlzq76MdQzi12SV0n+pMz1
	BkXcwWdQ==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUksa-00000008uLp-409i
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 11:02:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216634dd574so133958625ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 03:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736161353; x=1736766153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
        b=Eus7dqncoI10RzDL5zgOdMzEsHXl/xJ9w81cT25gIev9l4X6mNV0Q8gVlBn4b32n2S
         E65Vbbw0okGDSJ9Xy9u+dY8WNt/wV5e1NlYe8ELRbW+Jg+J/C3+VIXdJiwgdTqGu7hPj
         Sv7gDXqlmQUmuWWs5xpQJ4mkcQmgRsMjwdlPkxGwWslGTm49i1paAQy1agjMwzqQ9Wwk
         0a29UL+N+yHTkLUSJTisJd2tnRmZ5JS8NsFtxxiMifCzGWRLNPUARVe5MtFBrNj4gIvb
         M/6EMqTNfY0toCzrDdKkSTscuUVsvtJz6NdWqFUD/HKLmp6ngNCVzTLH7XiWH9SHwnVJ
         IDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161353; x=1736766153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
        b=c+aX6TiA6cr042MteP+l3nHIz5fK6SBCxtJ82rQ04Jh5E9bdAzkNJQRqnJy1WCO9S2
         N8na8zwEE1jF18jvV/5cOjPUfJLO1yWU3XS45YKpn9qKlVHqubUIrP8j9REiCGojmTYF
         N6iRnQ81qKRZkXhm9+gztG8+mWZGosiMbipDznNQnajwYVP3lU66EgWY4/T7CJFFCIFq
         EcNvGacI2GTklNPF/EsFC6hrqYweIoMP58T9W9DhYAICoYoru6YNJirA80DpfDqGwE7Z
         D1fhh3ndE0AXYYwelWuaYdaR4a3dngHkCNMeNKIhh0cte2ZNtHUUaE6GOe93ScfhhmIu
         4dWg==
X-Forwarded-Encrypted: i=1; AJvYcCXcOInB681XBMFJZtyFj1Oy767KzY/SxWCMO1sS32e+nX1i8Zfnf5mGyknT9tvS8y5aS4Mk0Se13LlMlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYF9pZVyEULuFq7wLMUb1tWxezK8IvsOhCeSFnhY9+1raQXXaJ
	0/X60jzMKEr91zBWn/4vC6krzMUDEW/Ye3ONC1G4CMm0Smrlz35jOEZPi6zAjBU=
X-Gm-Gg: ASbGncv0ZyNYIHHY3bzsoGbkz+OpjvT8KCjNbSnbjyPIltTPHoxt31QAn+MAKMndiVp
	Sk6vSBcEFRUEoCyXPOPmeEpF6MREzPa3U3WDjqjF5/5+EUnL/tPVtC7uMsMvCpbRVHlWDNkNR2T
	+U/VgGHmGKpIjw8OOvEd7ZQZVbPIUB2S3mjRuNZ27jdc5FrreL/9S8MVE8gn8RwRidymtbRNX70
	w4rp1bE3wftwSZ5f35nIketbxN2WylFrSt7nQ2IT26AtqnVRdLeTnmCNlh/4xoQBwNRtJQCDQA4
	lA0sPg==
X-Google-Smtp-Source: AGHT+IFCeOw2arXEHpOUWAGun1CKXf9/XTpPQ1dFbIMLlKInW35U2LjXZ6DtTEzjdru/7w1/tbEHpw==
X-Received: by 2002:a05:6a00:4644:b0:725:b347:c3cc with SMTP id d2e1a72fcca58-72abdeb9c33mr83929136b3a.23.1736161353534;
        Mon, 06 Jan 2025 03:02:33 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816464sm31123318b3a.40.2025.01.06.03.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 03:02:33 -0800 (PST)
Message-ID: <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
Date: Mon, 6 Jan 2025 19:02:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD
 to __tlb_remove_table()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_110241_636398_63BC05FE 
X-CRM114-Status: GOOD (  12.84  )
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



On 2025/1/6 18:36, Alexander Gordeev wrote:
> On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>> PMD|PUD|P4D to __tlb_remove_table().
> 
> The above and Subject are still incorrect: pagetable_dtor() is
> called from pagetable_dtor_free(), not from __tlb_remove_table().

Hmm, __tlb_remove_table() calls pagetable_dtor_free(), so moving to
pagetable_dtor_free() means moving to __tlb_remove_table(). Right?
And the main purpose of this patch is also to move pagetable_dtor()
to __tlb_remove_table(). So I think this description makes sense?

> 
> ...
>> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
>> index 569de24d33761..c73b89811a264 100644
>> --- a/arch/s390/mm/pgalloc.c
>> +++ b/arch/s390/mm/pgalloc.c
>> @@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>>   	return table;
>>   }
>>   
>> -static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
>> +static void pagetable_dtor_free(struct ptdesc *ptdesc)
>>   {
>>   	pagetable_dtor(ptdesc);
>>   	pagetable_free(ptdesc);
>> @@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>>   {
>>   	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>>   
>> -	pagetable_pte_dtor_free(ptdesc);
>> +	pagetable_dtor_free(ptdesc);
>>   }
>>   
>>   void __tlb_remove_table(void *table)
>>   {
>>   	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>> -	struct page *page = ptdesc_page(ptdesc);
>>   
>> -	if (compound_order(page) == CRST_ALLOC_ORDER) {
>> -		/* pmd, pud, or p4d */
>> -		pagetable_free(ptdesc);
>> -		return;
>> -	}
>> -	pagetable_pte_dtor_free(ptdesc);
>> +	pagetable_dtor_free(ptdesc);
>>   }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
