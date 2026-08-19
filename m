Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D907C5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 04:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5jiMOwRYlvcRbv/NQX+DvYvG9rVkBN9sveUv6YE3A8=; b=pa8I5ItiLoFalD
	H9b1zOhw3kJ4O2gKColw3NXfg/DhIQgGGyJZQ+VijPoQ/pMtxieXFLZsXNCPXi5Bk+Qs/YpwI2HWm
	NGs7e+W5n6/aeSZC1RtQebWGCDPJPgBva7ZZF87Q0Mk2IGmxpFA+M4UxxCBlvuZ0YeitFjMI+Wx/p
	/mJbT0j5IH+jg8DwkXsSFvcXbPRyV/ynaMVEGrpSyQmHlYAzNzGPTGUE2mzbD4a9mRxVtlA7KpoZj
	X5g8/bN7nMT7coIUuvYLt3CLhCTXlWJNBQb6ULyPk5Z+2OAWIMzp9n13ne3Th5JlStFrrYTOpj5t0
	9IAF0luPh3qMtPkc/tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYEx-00000008zTg-1RYD;
	Wed, 19 Aug 2026 04:49:27 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYEt-00000008zT1-1Dkm
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 04:49:25 +0000
Received: from [10.213.6.193] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXa+_INYVqAIkLBg--.49317S2;
	Wed, 19 Aug 2026 12:49:12 +0800 (CST)
Message-ID: <c5934119-5fac-49b6-9edc-3ee43446e3bb@iscas.ac.cn>
Date: Wed, 19 Aug 2026 12:49:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Fix concurrency in mark_new_valid_map()
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yaxing Guo <guoyaxing@bosc.ac.cn>, "David Hildenbrand (Arm)"
 <david@kernel.org>
References: <20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn>
 <38dad5db-e298-fe26-2189-3a67ed156a4a@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <38dad5db-e298-fe26-2189-3a67ed156a4a@kernel.org>
X-CM-TRANSID: qwCowACXa+_INYVqAIkLBg--.49317S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw1UJry7ur1UZF47ZFyDtrb_yoW5uFyDpF
	W3K3WxKFn7tr43ZrnrZ3WruF1F9a1ktF4rCr95tw18uwn8Gw4Iqr47KFWYva4xurn7WF1j
	vr4Ivwn5ZFyDZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bnbytUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_214923_707723_14672421 
X-CRM114-Status: GOOD (  29.09  )
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

On 7/10/26 08:59, Paul Walmsley wrote:
> Hi Vivian,
>
> On Mon, 29 Jun 2026, Vivian Wang wrote:
>
>> Turns out, the concurrency concerns [1] were justified - BOSC reported a
>> spurious fault in KFENCE that still triggers despite previous fixes,
>> which KFENCE reports as a false-positive.
>>
>> Fix the concurrency problems in mark_new_valid_map():
>>
>> - Add smp_wmb() before filling the bitmap, to make sure page table
>>   writes are "received".
> Probably this expression should be clarified.  I guess the intent here is 
> to ensure that the page table write is visible by other cores either 
> before or simultaneously with the bitmap fill?  And the purpose of that is 
> to avoid a situation where another core could execute an sfence.vma before 
> the PTE write is observable by the other core?  If so, we should probably 
> write something like this out in the commit message.

Apologies for the mega delay. I had been focused on the other stuff.

Yes, This is the intention. I agree that this would probably need a
better wording.

> I wonder if there's still a window where spurious faults could be observed 
> by kfence.  If another core "B" faults (due to its local TLB caching an 
> invalid PTE) after the PTE write is observable by B, but before the bitmap 
> write is observable by B, core B won't sfence.vma.  If this possibility 
> still exists, we should probably document it.  It might be possible to 
> narrow that window further with a smp_mb() after the bitmap fill, but 
> unclear that it's worth trying unless more spurious faults are seen.
>   

Having thought about this more, I'm not sure how this should be handled.
The expected use case of this is some "allocation" function, at which
point the allocated pointer would be passed on to some other thread.

Here's the iffy part, *in general*, I *expect* that before the allocated
pointer or whatever becomes accessible in another thread, there's a
smp_wmb(), or an unlock-then-lock, or something like that. Otherwise,
none of the data being "sent through" this pointer wouldn't make much
sense, right. But this would have to be handled by every allocating
function, or similar, right? And I don't know if I'm able to practically
understand all the mm stuff to see if it is *actually* how it works.

> ...
>
> Also, now that we're adding an smp_wmb(), we should probably expand the 
> preemption-disabled section in kfence_protect_page() to cover the entire 
> function, to eliminate any risk that the PTE writes execute on a separate 
> CPU from the smp_wmb().

I'm not sure that this is a problem if the previous point wasn't. If the
thread is preempted, then migrated to a different CPU, then the thread
migration should have done the equivalent of a smp_mb(), right?
Something like:

        CPU a                    |      CPU b
                                 |
... thread 1 ...                 |
                                 |
[ Preemption starts here         |
                                 |
smp_mb()                         |
                                 |
Some store release in sched      |
to send the task to CPU b        |
                                 |      Some load acquire in sched to
                                 |      grab the task
                                 |
                                 |      smp_mb()
                                 |
                                 |      preemption finishes ]
                                 |
                                 |      ... thread 1 continues ...

Otherwise, even single-threaded program-order behavior wouldn't be
preserved. Therefore I believe it would still be safe even if the thread
was migrated after the smp_wmb().

As such, I do think preemption shouldn't be a problem, or should be
rolled into the other problem, namely, "wmb before sending a pointer to
another thread".

At my wit's end, again,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
