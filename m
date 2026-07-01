Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADB1C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9z20OT1ljoQj/ec7HQ1KquJkKDnwNoaTkLx0YTR5lA=; b=kkSmAS8Xkfai7/
	vuBDsmBuGjcpcqfSoH6DnRRX0PlxZFocD2Y/wA3c05cAHWfEy+ZgXHcwwOFFslUJSdozVU+FLidsX
	C8ea5Lnn5Euf2nKMwha5XGj1qV5zhRoeLENjAQrTrXG3HDzMwZGcEl+WDhdq/XZip/xUWHurbGm/8
	TvrCau74hlp0mCP+aymcAG4F0M8EB6YqslNPRm8HiG54dLKxF4E8kpjN5uZ05rxNXNqn7CtbnRv7R
	gSRvPQ+El6RYq4Prnjhy7303FIxnnXrnFSWamNpYOTWeI3rfcXKVARgnqwDNqMzYIYwBrRKOtB8Dn
	lRT7SS8ZZzwVjzodM3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weu1H-00000001zMT-2uCL;
	Wed, 01 Jul 2026 12:26:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weu1E-00000001zM0-3757
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:26:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0682309;
	Wed,  1 Jul 2026 05:26:14 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D84A53F85F;
	Wed,  1 Jul 2026 05:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782908779; bh=U3DO0j/dmUnuT8V0sMZSGlJWF7PRalEy3TBu9TEA4Gg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6b5h+ZGlYet+l8RJqC7C3JtqgHXxikuUKU4RoK4Fcmi8iZkKNQcMim54FA961tjF
	 tAeeIFIg1H0dRzCh5JM/daTl7Cy/a6PArfhnY52jopb1oYOGQ6KcOo/fKN3z61RTKG
	 ztgWBrC1porMMbL48pZGQJBXP8T6B6zTVQHMs06Y=
Message-ID: <5158500d-0a30-4b2f-9b0f-f10e01dabd4d@arm.com>
Date: Wed, 1 Jul 2026 17:56:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
To: David CARLIER <devnexen@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260630041012.5975-1-devnexen@gmail.com>
 <c3ea35e4-833f-487f-8a8b-6f8f95b7ba95@arm.com>
 <CA+XhMqzErBiN5w56fO2_2T3Yj=-L+dPUDjoMvNdK9PcF37nsbw@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CA+XhMqzErBiN5w56fO2_2T3Yj=-L+dPUDjoMvNdK9PcF37nsbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052620_826191_D58560E5 
X-CRM114-Status: GOOD (  11.61  )
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



On 01/07/26 11:27 am, David CARLIER wrote:
> Hi Dev,
> 
> Yes, the RCU deferral covers arm64 too, so the static key and the
> mmap_lock in pud_free_pmd_page()/pmd_free_pte_page() are now
> redundant. Keep the arch_vmap_*_supported() changes though.

Sorry I should have mentioned in my previous email that I had a comment
below, on the code :) could you please see below.

[--- snip ---]


>>> diff --git a/mm/ptdump.c b/mm/ptdump.c
>>> index 973020000096..50cd96a33dfd 100644
>>> --- a/mm/ptdump.c
>>> +++ b/mm/ptdump.c
>>> @@ -178,11 +178,13 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>>>
>>>       get_online_mems();
>>>       mmap_write_lock(mm);
>>
>> mmap write lock is not required anymore no?

^
>>
>>
>>> +     rcu_read_lock();
>>
>> Is there a possibility of RCU stall here? For example a system with
>> lots of physical memory will have a huge linear map.

^


>>
>>>       while (range->start != range->end) {
>>>               walk_page_range_debug(mm, range->start, range->end,
>>>                                     &ptdump_ops, pgd, st);
>>>               range++;
>>>       }
>>> +     rcu_read_unlock();
>>>       mmap_write_unlock(mm);
>>>       put_online_mems();
>>>
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
