Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF23CD8C92
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+UWRX8ZGHFZ+TD5HJvRlRV4sd+QzJJi/+lXPnSyuPw=; b=0K6zGA5W0JAPqB
	yHjwUWO0H/CCwSgxTKn+bx0HApW0KygVsRBwA6u19sYruWTkV62/WrUA/PIOXzgxp8f/GsyJoIFg6
	MrZh+pzgv6+EivwclcmgIHBHjc6axg4Bvk5EO3abVgqgs5LcUXxTExOvvReWorhDAMfyPn2SrEJui
	+Dygdp0dUeYQo2S1IU/I8WO8LcNvR41+3d4Ke9IcD7iBQXtgiLjGbqyNn4HttykiHFnb+dbFechFu
	P3NmggSWlojVwjcP20Ar9goJbNES18y336g3Qt0AZsC3mMwbbTO7Xm+xPKx2kw8Q2Niz5h6Bmfdi7
	Al94PDfrMj2FnADQfE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWanW-00000003il9-1yc8;
	Mon, 08 Jun 2026 14:17:50 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWanT-00000003ijb-05cX
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:17:49 +0000
Received: from [192.168.0.111] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowAB3HNX9ziZqMi7mAA--.3556S2;
	Mon, 08 Jun 2026 22:17:34 +0800 (CST)
Message-ID: <b904d79c-7314-463b-99dc-1fae6d4ccd91@iscas.ac.cn>
Date: Mon, 8 Jun 2026 22:17:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260605-mark-after-vmemmap-populate-v3-1-a06001ac9264@iscas.ac.cn>
 <da19ffcf-8042-4f96-9c2d-649468dc6a0a@kernel.org>
 <953d7a60-456d-4629-b133-afce62cc5b3e@iscas.ac.cn>
 <3c88dee8-6fcd-4f72-9a73-17044214b087@kernel.org>
 <6a92f2c6-3b67-44fb-b645-91164118d8fb@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <6a92f2c6-3b67-44fb-b645-91164118d8fb@kernel.org>
X-CM-TRANSID: qwCowAB3HNX9ziZqMi7mAA--.3556S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1rCFyDXF1DKw4fuw1UAwb_yoW5Cr4kpa
	y7K3WDKr4vyr1Iyan2vw4UZF1Yk3s7W3WfWw45t3sakw1jqrWSgr48trZYkasrZrWkZ3W2
	vr4rt3y7uFyDAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_071747_440094_05F93BEA 
X-CRM114-Status: GOOD (  17.37  )
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

On 6/8/26 21:18, David Hildenbrand (Arm) wrote:

> On 6/8/26 14:43, David Hildenbrand (Arm) wrote:
>> On 6/8/26 04:24, Vivian Wang wrote:
>>> On 6/5/26 17:16, David Hildenbrand (Arm) wrote:
>>>> How does mark_new_valid_map() handle concurrent access?
>>>>
>>>> There is some comment in there, but I am not sure if that actually implies that
>>>> mark_new_valid_map() can be called concurrently from arbitrary context?
>>> AFAICT, yes, it is intended to be used concurrently from arbitrary
>>> context, and this is why I used them.
>>>
>>> I had not originally written the code, so some riscv maintainer can
>>> maybe chime in on this, but as I understand it the idea is that we only
>>> ever set bits in the bitmap in mark_new_valid_map() while "allocating",
>>> whereas the assembly code in handle_exception in
>>> arch/riscv/kernel/entry.S only ever clears individual bits. So at least
>>> the access to the bitmap itself should be fine.
>> Right, flush_cache_vmap() looks like a bitmap_set() -- non-atomically.
>>
>> .Lnew_vmalloc_kernel_address does an atomic bitmap clearing ("Atomically reset
>> the current cpu bit in new_vmalloc").
>>
>> I am primarily wondering whether we'd want atomic bit-setting as well?
>>
>>> This was added in commit 503638e0babf ("riscv: Stop emitting preventive
>>> sfence.vma for new vmalloc mappings").
>>>
>>> Do you think the mark_new_valid_map() function needs extra
>>> synchronization like smp_wmb()?
>> Right, I wonder about atomic access, but also about memory barriers.

Oh dear, I've dug up quite the rabbit hole haven't I...

I'm going to leave that at "I don't know" for now. Maybe someone more
confident at their memory ordering knowledge can chime in.

> BTW, does riscv support a better mechanism to avoid such spurious faults?
>
> E.g., on arm64 we have emit_pte_barriers() where we issue some barriers:
>
> "The isb ensures that any previous speculative "invalid translation" marker that
> is in the CPU's pipeline gets cleared, so that any access to that address after
> setting the pte to valid won't cause a spurious fault."
>
> I assume the riscv case is different, as it's about actual TLB entries, and not
> just translation markers in the pipeline?

So yeah, conceptually the "TLB" on RISC-V caches the actual pte_t words,
and RISC-V cores are permitted to cache these valid=0 PTEs indefinitely
(if no "Svvptc" feature bit), or for a finite amount of time (if with
"Svvptc" feature bit).

As mentioned in the kfence patches [1], SpacemiT X60 cores in SpacemiT
K1 appear to be able to cache these valid=0 PTEs across even an WFI, so
the "indefinitely" part is probably real, although that doesn't mean it
isn't pipeline-only if all the WFI does is to stall the pipeline.

Not that it would really help, since RISC-V also has nothing like the
lightweight pipeline clearing stuff you mentioned defined.

Vivian "dramforever" Wang

[1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn/



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
