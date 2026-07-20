Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6003DC44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3dEmWoR5AJsCilQbroO8Yo9NXIbrLDB39yz1NSnv5o=; b=T1+/zh3ZGUodWu
	zK9p3qCKej4QOAvM+vHFRsIVZyv2kBJnOvp6TemRFtT2h/ts8Dk+VfZ8S3reNOrkgfXXyK7wcBDLu
	TuXHRb0qfwpFMvQqCPZnCMk3WkcLMlXXWM5Vo3qi9P1CySS62/BJSvaawr5bK7kwc9uZqQ84T5bxH
	2xfRePYF0Nz1CRIRm8JtL+3M9XgeP38JJ5TQFW5EIF60tbHlLArAJJqRj7fGBQhxFnqxiQouSEfO7
	Ax7Y5indPW3G5huBGCpX6d1vcDBytuRxMrfig5sh0AY8BZLcnMLQooC8przqQFKeBFqLKZFMzBlrR
	xEDwCMxclk3bGZC5BPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlt10-00000007gaq-3Dfr;
	Mon, 20 Jul 2026 18:46:58 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlt0x-00000007gZW-16o4
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 18:46:57 +0000
Message-ID: <e9703d2e-f815-4d96-b5ce-074aba281f76@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784573201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOPh5TJ7QQOTxu69DpiTtyBt1SBHPlcquVGb26F3iFg=;
	b=waT3i14dwG8syaSu1aqMzUR8+Dpb70cNQeB16/5E+TQ2yjhDoAHJgRhg4Sfiv74p+QgSPw
	6uRBAFyBEe8+H2am6f34vBbmlpEkpWR/Wv2qaWCBCh1bDZl7pp4RZkKQpsDaVd+VqVWIHk
	9Xa39pley9bMBExsI065/Ic4TQoqxwY=
Date: Mon, 20 Jul 2026 19:46:27 +0100
MIME-Version: 1.0
Subject: Re: [PATCH RFC v3 2/6] riscv/mm: add untagged_addr_remote_unlocked()
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 kernel-team@meta.com, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
References: <20260720115741.239657-1-usama.arif@linux.dev>
 <13ec2603d5cbfdc493939f182b71e5133c26af54.camel@surriel.com>
 <46dc1b58-f2de-492a-9da5-a5c429c19a10@linux.dev>
 <51c0025d2eb885ff1f4775e4d9ffcf34f478f378.camel@surriel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <51c0025d2eb885ff1f4775e4d9ffcf34f478f378.camel@surriel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_114655_461888_F7108625 
X-CRM114-Status: GOOD (  13.80  )
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



On 20/07/2026 18:34, Rik van Riel wrote:
> On Mon, 2026-07-20 at 17:46 +0100, Usama Arif wrote:
>>
>>
>> On 20/07/2026 16:08, Rik van Riel wrote:
>>> On Mon, 2026-07-20 at 04:57 -0700, Usama Arif wrote:
>>>> On Fri, 17 Jul 2026 13:00:32 -0400 Rik van Riel
>>>> <riel@surriel.com>
>>>> wrote:
>>>>
>>>>
>>>>>
>>>>> mm->context.pmlen is set only through PR_SET_TAGGED_ADDR_CTRL
>>>>> and
>>>>> is stable
>>>>> afterwards, so it can be read without the mmap lock, as it
>>>>> already
>>>>> is from
>>>>> untagged_addr() and mm_untag_mask().
>>>>>
>>>>
>>>> I think it might not be stable? set_tagged_addr_ctrl() can change
>>>> it
>>>> repeatedly until a CLONE_VM operation sets MM_CONTEXT_LOCK_PMLEN.
>>>
>>> You're right, ARM tagged addresses seem to work a
>>
>> ah do you mean RISCV here?
> 
> Ugh, I looked at the wrong one.  RISCV is like
> x86, with a dynamic (though a limited number
> of options?) mask.
> 
> Having said that, won't a process have all of
> its VMAs in the masked-off area, so coming in
> from a remote process to a valid memory address
> should already give us a valid address?
> 

So my understanding from exploring this code is, and hopefully someone
in CC from riscv can correct me, for example:

Tagged pointer:  0xabcd000012345678
PMLEN 16:        0x0000000012345678
PMLEN 7:         0xffcd000012345678

The target VMA might be at 0x12345678, but applying PMLEN 7
to that tagged pointer does not produce that address.

Previously, the order was:

Take mmap read lock.
Read pmlen.
Untag the address.
Look up the VMA.

Changing PMLEN takes the mmap write lock. The read and write
operations were therefore serialized.

The new order is:

Read pmlen without mmap lock.
Untag the address.
Attempt the per-VMA lookup.
Possibly take mmap lock later.
Continue using the already-untagged address.

A concurrent PMLEN change can occur between those operations?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
