Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B61ACF6C1D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAn/PAvui8fbA3aayZG5gIqlmFrcWO471lQlPOMcwQ0=; b=CbDm/lh7iaQrbE
	GPOe32BYq7pBeZpwcO1KsRPJMniISc7j5L5B27MquD0vfT0jBR+fbprH4qsMn5O/Y1jykhGTD5JH8
	j11HDoYTxEy3yC6S61ffN81PwWcdQ6uTgQsx0l4GpKD/R+ajs1WScs7rYHX8xV5DM7EiWdJ2QEW1s
	Lw2v8+/+UPCGqhfL+Qf8R3CievowDCPypq2q+ttk37g/q3b++9pUS6/Fl5upwj6Q4MRTfVec/snMZ
	yrK3niAQtfSObUxpaGlvcX1ayauENdxhgHyt5Z7XgAa9gCTBGT350xJrF9GCu/rcUFXQbHj2XIiQX
	euZ09u7UTAT223BPyXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPr0-0000000EWvk-11yg;
	Wed, 07 Jan 2026 09:29:22 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPqx-0000000EWtu-1dQi
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 09:29:21 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso1539024d50.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 01:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767778158; x=1768382958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wk512LwmO/uZGHz1Ojwhz3Ek5WphQWvtFTpjZjwnzlQ=;
        b=ZHSqziHHXa+TQgwUEydc3ScJc70UyM03LbRO7gJv/ftOTiohyGaEsNofe4fYBSNFsr
         lA2JhzE1e3bJQLiJ3PhkuDiP2e0edMpAo9OrpesZ1JfxYjgX8LOXnIgIExSY/aLxCXeQ
         XMA+y/Gddowxx2rtobZ4bxDS+HRTd6sPJXGB4Bf8+qZRnqSj5BUU/uIWzivqA4baVwoD
         VP+E592YEX5d0i+cC/D/gjbkMaHycw9el25BifBFLYGNWGPaawVvZYUzSPcDiWIEvvku
         xamEWCGuQG4ba4qOmVY/8jbH/IxAL2GRKPLBSyJcrbjoHl8l/d+Z50f2NHvpZfD7TLjk
         Bgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778158; x=1768382958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk512LwmO/uZGHz1Ojwhz3Ek5WphQWvtFTpjZjwnzlQ=;
        b=kpSFnusBizeRUnI4aFeW2l9gB30l06Dh2/PFW0ao7+6Mp7cfQc0j5Qac0Do53s4UEb
         JNlO4AQLxj8h6zK+6GQ+e2awwa2Nw22OrHyI26zs6R6yAeQ40HCZvY/+Fk6uJqIuw245
         DWsDA0QLcIVY1EuetzjRRKGt/VP7MWWDghoArrwwtiLyMG/GqWI/akJZ0XmUNwCn7bJN
         lM4Nhq1XYydHq+BUDTysMFScV5kS2wCfwcaYMbciYnGgKVJrRXP98A5CoYKou1dUyWZq
         cfHwoSugFvo+yj6X3Q5zWpVoMZZk0QYsNUdoccpxCSOaZ5uUgx9szAlOtqaLA9EZ3Ypz
         2maQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3nlh/6lykhpe1LZbFe612Hh8pkUWLOMnzx5pO6Kj1/uyymk8MIxgWGrz/c2/hxYj9ZXpNHlL5+LPRiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMGUhDbfSBVHvnOo8f7wuOYScQoMw5FZZrEG74PXfm6vn6AXT/
	sLg1oXIydUj8Oy5p0JSGtmxl4eNB1hLXfgft3IkxspDI05QfMk8nDO4S
X-Gm-Gg: AY/fxX5dCOQPpXiMhS1m0VwubtmR7l9Fmkjp7GUoKvh5+2YwXVlmxApqqeeiev6xCPL
	DoR2K4oQOA0xgstKwVeEHbjuFDJ/MDwTzLkaO5PJa8jRHIs6ClDYmvjSwaE92LUiL/dG7c+emnm
	fiN2xn2qLx7y8lTwlRr94NW5lLGt3Ejlyum1vNrhAzwWRHyZ/gZTsv50t4lP+4JCXwT7OhiaTbM
	FiJiLOoBMMLV4A6uoT8P6sPuMtHOHZ71YtrWg2uykFvj8zzOODH2CXHLLqxoVqteYe0NqT6jVVS
	ZFv6KPUecv4JFfHV1Bcr9vqLBkSKFY3dCZmWidQE9YmFPdFAUIsLqy8ZjcuS6AUTjFGXIGRyVXG
	+p0/VJ+/0fUBwjZ91RINjPPlaZmqT2xH30gUVYOyiVatqk+YQO06hO6zD3G2GePLgwPc7NoKcvJ
	O2sAKXEvz1/Lg+VTJNHn/Uk9i9x4fylMZF5u9F+g==
X-Google-Smtp-Source: AGHT+IGPYSkTJQTXRdeZJNO0Ptp1UF4C4ZvN+4Y+pwY9mfVj1KcuNobxA+hhEKXT47wj8D4Ny+QBYg==
X-Received: by 2002:a05:690e:1483:b0:644:60d9:8654 with SMTP id 956f58d0204a3-64716c69eccmr1598952d50.87.1767778157608;
        Wed, 07 Jan 2026 01:29:17 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6470d80be64sm1865006d50.6.2026.01.07.01.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 01:29:16 -0800 (PST)
Message-ID: <080e493a-e4f1-4c97-a3e1-f76f126b5213@gmail.com>
Date: Wed, 7 Jan 2026 17:28:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pgtable: convert pgtable_t to ptdesc pointer
To: Mike Rapoport <rppt@kernel.org>, alexs@kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-arch@vger.kernel.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-mm@kvack.org>,
 "open list:C-SKY ARCHITECTURE" <linux-csky@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:OPENRISC ARCHITECTURE" <linux-openrisc@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>
References: <20260107064642.15771-1-alexs@kernel.org>
 <aV4h5vQUNXn5cpMY@kernel.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <aV4h5vQUNXn5cpMY@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_012919_435305_66F076F6 
X-CRM114-Status: GOOD (  15.78  )
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



On 2026/1/7 17:05, Mike Rapoport wrote:
> On Wed, Jan 07, 2026 at 02:46:35PM +0800,alexs@kernel.org wrote:
>> From: Alex Shi<alexs@kernel.org>
>>
>> After struct ptdesc introduced, pgtable_t should used it instead of old
>> struct page pointer. The only thing in the way for this change is just
>> pgtable->lru in pgtable_trans_huge_deposit/withdraw.
>>
>> Let's convert them into ptdesc and use struct ptdesc* as pgtable_t.
>> Thanks testing support from kernel test robot<lkp@intel.com>
>>
>> Signed-off-by: Alex Shi<alexs@kernel.org>
>> ---
> ...
> 
>> diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/pgalloc.h
>> index a17f01235c29..1a3484c2df4c 100644
>> --- a/arch/arm/include/asm/pgalloc.h
>> +++ b/arch/arm/include/asm/pgalloc.h
>> @@ -96,12 +96,12 @@ pte_alloc_one(struct mm_struct *mm)
>>   {
>>   	struct page *pte;
>>   
>> -	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
>> +	pte = ptdesc_page(__pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM));
> When ptdesc will be separated from struct page, ptdesc_page() would fail if the
> allocation failed. This line should be split into something like
> 
> 	struct ptdesc *ptdesc = __pte_alloc_one(...);
> 	if (!ptesc)
> 		return NULL;
> 	pte = ptdesc_page(ptdesc);
> 
> 

Right, I will fix this. and sent the 2nd version.
Thanks a lot!

>>   	if (!pte)
>>   		return NULL;
>>   	if (!PageHighMem(pte))
>>   		clean_pte_table(page_address(pte));
>> -	return pte;
>> +	return page_ptdesc(pte);
>>   }
>>   
>>   static inline void __pmd_populate(pmd_t *pmdp, phys_addr_t pte,
> -- Sincerely yours, Mike.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
