Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9C3C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 05:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ontDkvp6p6sGM1M4H2Jiv+GpjY1W+rU+y9AzELK37tE=; b=sxFU9UTWyPODUi
	GTD8E7u2BPOlX2AqpgTWrULfQUMfKedGnXCx/ixbDK7vrTWQdf8LfQezwlVh4/1tAFbHnyu4yGBRT
	hUzrjF9yGPQaTqeLqRWXPiQ3CWKb57fWBl9g/6O3wDw/wdDvKojlQ0F4l9aFQhX1tpytOADTyIIxw
	tIBlNAUvK2U0BSGtUnbq7nRUVEkJf+k7LyWBWS3qAbEhefqNP33WSBnZnCeLPNC5QLsKMImqtRPAd
	OYDCRDPOLW7sueaWCJM7JXnvHao9GoIv/zn8Fi7DdKrg34nFzN1KcrsVfox2D3VRtcX4y1S/cc0DW
	ms5DmOtBYFa+JDNprYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh2X3-007MY2-FM; Wed, 20 Apr 2022 05:05:37 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh2Wn-007MVy-Q4; Wed, 20 Apr 2022 05:05:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C227E23A;
 Tue, 19 Apr 2022 22:05:18 -0700 (PDT)
Received: from [192.168.225.231] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E53D3F5A1;
 Tue, 19 Apr 2022 22:05:11 -0700 (PDT)
Message-ID: <16a2620e-986a-6a8f-24eb-d0f7e9c91f24@arm.com>
Date: Wed, 20 Apr 2022 10:35:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next v4 3/4] arm64: mm: add support for page table check
Content-Language: en-US
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Tong Tiangen <tongtiangen@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Guohanjun <guohanjun@huawei.com>
References: <20220418034444.520928-1-tongtiangen@huawei.com>
 <20220418034444.520928-4-tongtiangen@huawei.com>
 <073cb6a6-3dbc-75d4-dbfe-a5299a6b0510@arm.com>
 <CA+CK2bCPrQ=F0jNRxcVZ9f18Rm-kAATO3xFE79TZDoWQ99GC4Q@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CA+CK2bCPrQ=F0jNRxcVZ9f18Rm-kAATO3xFE79TZDoWQ99GC4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_220521_974599_6855CAC3 
X-CRM114-Status: GOOD (  17.89  )
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



On 4/19/22 18:49, Pasha Tatashin wrote:
> On Tue, Apr 19, 2022 at 6:22 AM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>>
>> On 4/18/22 09:14, Tong Tiangen wrote:
>>> +#ifdef CONFIG_PAGE_TABLE_CHECK
>>> +static inline bool pte_user_accessible_page(pte_t pte)
>>> +{
>>> +     return pte_present(pte) && (pte_user(pte) || pte_user_exec(pte));
>>> +}
>>> +
>>> +static inline bool pmd_user_accessible_page(pmd_t pmd)
>>> +{
>>> +     return pmd_present(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
>>> +}
>>> +
>>> +static inline bool pud_user_accessible_page(pud_t pud)
>>> +{
>>> +     return pud_present(pud) && pud_user(pud);
>>> +}
>>> +#endif
>> Wondering why check for these page table entry states when init_mm
>> has already being excluded ? Should not user page tables be checked
>> for in entirety for all updates ? what is the rationale for filtering
>> out only pxx_user_access_page entries ?
> 
> The point is to prevent false sharing and memory corruption issues.
> The idea of PTC to be simple and relatively independent  from the MM
> state machine that catches invalid page sharing. I.e. if an R/W anon

Right, this mechanism here is truly interdependent validation, which is
orthogonal to other MM states. Although I was curious, if mm_struct is
not 'init_mm', what percentage of its total page table mapped entries
will be user accessible ? These new helpers only filter out entries that
could potentially create false sharing leading upto memory corruption ?

I am wondering if there is any other way such filtering could have been
applied without adding all these new page table helpers just for page
table check purpose.

> page is accessible by user land, that page can never be mapped into
> another process (internally shared anons are treated as named
> mappings).

Right.

> 
> Therefore, we try not to rely on MM states, and ensure that when a
> page-table entry is accessible by user it meets the required
> assumptions: no false sharing, etc.

Right, filtering reduces the page table entries that needs interception
during update (set/clear), but was just curious is there another way of
doing it, without adding page table check specific helpers on platforms
subscribing PAGE_TABLE_CHECK ?

> 
> For example, one bug that was caught with PTC was where a driver on an
> unload would put memory on a freelist but memory is still mapped in
> user page table.

Should not page's refcount (that it is being used else where) prevented
releases into free list ? But page table check here might just detect
such scenarios even before page gets released.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
