Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6A0C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtk71SQNCPWlbApmQBIdrByvNyUyb2V//G8brKqVXSY=; b=kj+uKiYDNN3x8i
	IQd643qdaoCdyicvJb8dxM0ljqtIOASDFCDyd+bINcs645lVn3QkZOrK8Vslsb/pzcR84jPpZM1vD
	JfIPIOxLYqlWqVn69x6HvJ8f97iR6D5l6XvbcYrjo4PnawZeEqX9/lP0sn6xXJ9EdV0trTQXvJJlz
	mt5X1BNeaPG5C4itiCVqkTGa0LQwuHMegvtawNb9vAM1TKbOPaQ9JIWVAC5Rl8diXelVcZVYB/AKC
	47b7kdtjCDvVy+RmjKDyNpskb4vyaualOrAVw5Qesasimh8EK4jB4Fc1qBMBIhlsKeBzOIpBP5eVP
	esMBxJSJVh8bq06oYZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAhF-00000008KBM-3RbX;
	Mon, 13 Jul 2026 07:03:21 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAhC-00000008KAk-45ex
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 07:03:20 +0000
Received: from [10.213.6.115] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHF86rjVRqPpeSFw--.30299S2;
	Mon, 13 Jul 2026 15:03:07 +0800 (CST)
Message-ID: <7bcc6988-f225-44fb-b616-a3ca12632187@iscas.ac.cn>
Date: Mon, 13 Jul 2026 15:03:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] mm/sparse-vmemmap: flush_cache_vmap() after
 hotplugging vmemmap
To: Muchun Song <muchun.song@linux.dev>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
References: <20260713-mark-after-vmemmap-populate-v6-0-b945ceba29d4@iscas.ac.cn>
 <20260713-mark-after-vmemmap-populate-v6-2-b945ceba29d4@iscas.ac.cn>
 <E058B2BD-768A-4949-B5F3-7CBAC1347410@linux.dev>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <E058B2BD-768A-4949-B5F3-7CBAC1347410@linux.dev>
X-CM-TRANSID: rQCowAAHF86rjVRqPpeSFw--.30299S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1rWF48Cr47tFy8ur4kJFb_yoW8ZFyxpr
	Z3C3WqkF4kJr45Aw4UZw1I9FZa9w43Kay8JFsYvr1j93s8Xr12gryakan29a48u3s5Ca42
	k3yY93s5WFyDAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bnXd8UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_000319_391264_D917AF79 
X-CRM114-Status: GOOD (  15.97  )
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


On 7/13/26 14:56, Muchun Song wrote:
>
>> On Jul 13, 2026, at 14:15, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>>
>> section_activate() does not flush TLB after populating new vmemmap
>> pages. On most architectures, this is okay. However it is a problem on
>> RISC-V since there the TLB caching non-present entries is permitted,
>> which causes spurious faults on some hardwares.
>>
>> This seems to be most easily reproduced with DEBUG_VM=y and
>> PAGE_POISONING=y, which causes these newly mapped struct pages to be
>> poisoned i.e. written to immediately after mapping.
>>
>> Extend the RISC-V flush_cache_vmap() to also handle the vmemmap range,
>> and call it after hotplugging vmemmap, which gets the possible spurious
>> fault handled in the exception handler.
>>
>> At least for now, the only other architecture with both
>> SPARSEMEM_VMEMMAP and flush_cache_vmap() is PowerPC, which has a similar
>> problem with newly valid PTEs. But there flush_cache_vmap() is just a
> PowerPC is actually unaffected here since it achieves the desired effect
> via vmemmap_set_pmd. However, your patch will pave the way for a great
> cleanup to remove PowerPC's architectural vmemmap_set_pmd, given that it
> already relies on flush_cache_vmap() for the required barrier operations.

I agree. I was just talking about PowerPC in general, which requires a
ptesync after "newly valid PTEs". In this sense, PowerPC in general is
affected.

>> ptesync. So it should be safe to do this for generic code while having
>> minimal performance impact.
> After the cleanup for the PowerPC, it will emit only once ptesync operation,
> so it will be a minor performance improvement.

I haven't mentioned the future cleanup because, well, future. Otherwise
I agree on this as well.

>> Suggested-by: Muchun Song <muchun.song@linux.dev>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks for your review.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
