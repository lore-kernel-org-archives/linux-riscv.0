Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEFDC5519F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 16:22:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB57020B80
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 16:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bJGZIOCh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NEZQgmYo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB57020B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FZdGeTC6yz0xMJ+SU9GND/ewCVix6RUNkHRqxvAVKog=; b=bJGZIOChNYzdbjtY89kcQW919
	fJOtn2T9drvCj+AF6z5zIgVwjf+2g5Y5O9fmciqZ9KiSuFQZNzDPEPsZKssuq6KKL+NE7iHjd6ech
	MYK/59KWrVSRTpCwz5y23W0opTN9lLQ99oYCUY59pqhzHA14V5KZNNVr/ppIXtgmzxDZA32suz63g
	pqpwMQyT9kVL7asHt+iJtX54Ip5AciDiMfKXUxMN95+oSkscKIvvZExnDjlH8CwqEucwA9ghHbG0T
	I7IHC7va1Y4Bcs25P2Zsv8deN6tqGyDLxCU9afl9LZNhTqtAf37eJC9t/2uDuDEv8xYYlvIsDWaro
	1DZyxvAxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdFMf-0004TH-WD; Thu, 12 Nov 2020 16:22:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdFMY-0004Q4-4a
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 16:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605198137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZW4Cjdd1Y3wnZ8yyT80IuYNIT2MC5nPP7PSwDghDV1Q=;
 b=NEZQgmYo85TTjpcF52kzhlxScWrst6z9esMx+i5EwXxrIS3msnsQjVGcL7tFMMqx4sIH3k
 tGNLm17SZpOM3NkWWalzbEYCG52owE8pc5rYln6ehsO5Js7yh6W78KCOi8zhCRiBlYUG2D
 CWOO5exy241iIVLe6zU3iz09mfPXtPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-hg3tEq1OPgmdqYl9GCjLuQ-1; Thu, 12 Nov 2020 11:22:13 -0500
X-MC-Unique: hg3tEq1OPgmdqYl9GCjLuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB783100F7A6;
 Thu, 12 Nov 2020 16:22:08 +0000 (UTC)
Received: from [10.36.115.61] (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6D5B6EF48;
 Thu, 12 Nov 2020 16:22:01 +0000 (UTC)
Subject: Re: [PATCH v8 2/9] mmap: make mlock_future_check() global
To: Mike Rapoport <rppt@kernel.org>
References: <20201110151444.20662-1-rppt@kernel.org>
 <20201110151444.20662-3-rppt@kernel.org>
 <9e2fafd7-abb0-aa79-fa66-cd8662307446@redhat.com>
 <20201110180648.GB4758@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <3194b507-a85f-965a-e0eb-512a79ede6a9@redhat.com>
Date: Thu, 12 Nov 2020 17:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201110180648.GB4758@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_112218_323204_E3340B8C 
X-CRM114-Status: GOOD (  25.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10.11.20 19:06, Mike Rapoport wrote:
> On Tue, Nov 10, 2020 at 06:17:26PM +0100, David Hildenbrand wrote:
>> On 10.11.20 16:14, Mike Rapoport wrote:
>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>
>>> It will be used by the upcoming secret memory implementation.
>>>
>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>>> ---
>>>    mm/internal.h | 3 +++
>>>    mm/mmap.c     | 5 ++---
>>>    2 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/mm/internal.h b/mm/internal.h
>>> index c43ccdddb0f6..ae146a260b14 100644
>>> --- a/mm/internal.h
>>> +++ b/mm/internal.h
>>> @@ -348,6 +348,9 @@ static inline void munlock_vma_pages_all(struct vm_area_struct *vma)
>>>    extern void mlock_vma_page(struct page *page);
>>>    extern unsigned int munlock_vma_page(struct page *page);
>>> +extern int mlock_future_check(struct mm_struct *mm, unsigned long flags,
>>> +			      unsigned long len);
>>> +
>>>    /*
>>>     * Clear the page's PageMlocked().  This can be useful in a situation where
>>>     * we want to unconditionally remove a page from the pagecache -- e.g.,
>>> diff --git a/mm/mmap.c b/mm/mmap.c
>>> index 61f72b09d990..c481f088bd50 100644
>>> --- a/mm/mmap.c
>>> +++ b/mm/mmap.c
>>> @@ -1348,9 +1348,8 @@ static inline unsigned long round_hint_to_min(unsigned long hint)
>>>    	return hint;
>>>    }
>>> -static inline int mlock_future_check(struct mm_struct *mm,
>>> -				     unsigned long flags,
>>> -				     unsigned long len)
>>> +int mlock_future_check(struct mm_struct *mm, unsigned long flags,
>>> +		       unsigned long len)
>>>    {
>>>    	unsigned long locked, lock_limit;
>>>
>>
>> So, an interesting question is if you actually want to charge secretmem
>> pages against mlock now, or if you want a dedicated secretmem cgroup
>> controller instead?
> 
> Well, with the current implementation there are three limits an
> administrator can use to control secretmem limits: mlock, memcg and
> kernel parameter.
> 
> The kernel parameter puts a global upper limit for secretmem usage,
> memcg accounts all secretmem allocations, including the unused memory in
> large pages caching and mlock allows per task limit for secretmem
> mappings, well, like mlock does.
> 
> I didn't consider a dedicated cgroup, as it seems we already have enough
> existing knobs and a new one would be unnecessary.

To me it feels like the mlock() limit is a wrong fit for secretmem. But 
maybe there are other cases of using the mlock() limit without actually 
doing mlock() that I am not aware of (most probably :) )?

I mean, my concern is not earth shattering, this can be reworked later. 
As I said, it just feels wrong.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
