Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F447CD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lo4b863gCWwf9IkYeL4vjbdab1g+huAhfsgvQYYCVg=; b=O7fPHcdg3tM/Sk
	SryxYFj61wFnjPQDM5gYB8zuKfTrIuEFyK7n1ci0eU4BbO1mQvscq2MV01u8vHyYkJWjsvJ+aaFv+
	cTBGY1mFupBQ/I5dlCh6wzzlsyoBbqGqORALxKwFZ1KEfrDjjDZYlLm8H9MF5vwbLPFPF500PfW7Q
	tOUJEXiCuErSbLgItzoV+vcrcogUa3RUoP+hbmm2bfKP81jmthaXOKWTJjniuyI5mEE0LllKsuEu1
	0vzGCpOZi1MFZ+LGy44yOVEJAEFE2wfuTdUalUGdzPVZwjs+Bm42DNzvtRg0+UXKFh5uy3m6dM4Ih
	l0B5MqddXpgQJzDwi32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxyz-0000000AM5X-1nS2;
	Mon, 01 Jun 2026 08:26:49 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxyw-0000000AM47-27j4
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:26:48 +0000
Received: from [10.213.19.193] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAB3F9A5Qh1qWQpVAA--.175S2;
	Mon, 01 Jun 2026 16:26:34 +0800 (CST)
Message-ID: <48855978-6834-4427-ae55-e05650b1ea89@iscas.ac.cn>
Date: Mon, 1 Jun 2026 16:26:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Call mark_new_valid_map() after hotplugging
 vmemmap
To: Mike Rapoport <rppt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn>
 <ah0xLeD1_6oRKDkx@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <ah0xLeD1_6oRKDkx@kernel.org>
X-CM-TRANSID: qwCowAB3F9A5Qh1qWQpVAA--.175S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4DKF4kJF4DWw1DGFyUJrb_yoW5Gr4DpF
	W29a1fKF4UJr1xuws7u3WIqr4Fk3ZYvr18G3WrK34rZry5uFy29wnYkF4Ygry7Gr97Ga40
	yFn0kas8G34DAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5-jjPUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_012646_932216_DABD011C 
X-CRM114-Status: GOOD (  20.70  )
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

Hi Mike,

Thanks for your review.

On 6/1/26 15:13, Mike Rapoport wrote:
> Hi,
>
> On Mon, May 25, 2026 at 12:23:29PM +0800, Vivian Wang wrote:
>> section_activate() creates new mappings in the vmemmap range without
>> flushing TLB, which may cause faults on some RISC-V implementations that
>> cache non-present PTEs and crashes.
>>
>> This seems to be most easily reproduced with DEBUG_VM=y and
>> PAGE_POISONING=y, which causes these newly mapped struct pages to be
>> poisoned i.e. written to immediately after mapping.
>>
>> Add a hook vmemmap_populate_finalize() in __populate_section_memmap(),
>> and implement it as calling mark_new_valid_map() on RISC-V, which
>> arranges for the exception handler to deal with these faults if they
>> happen.
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> ---
>> I'm not sure if this is the right place to add this hook. I didn't add
>> it to vmemmap_populate because it doesn't seem to be called in all
>> cases. Please advise.
> Indeed it looks like we'd need a new hook to let architectures run
> post-populate actions.
>
> The explanation that says why a new hook is needed should be a part of the
> changelog.
>  

I will reorganize this in v2.

>> Depends on my earlier kfence fixes for mark_new_valid_map() [1].
>>
>> Found while testing AMD_HSA/ZONE_DEVICE on SpacemiT K3. Using
>> ZONE_DEVICE requires another fix [2].
>>
>> [1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn
>> [2]: https://lore.kernel.org/linux-riscv/20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn
>> ---
>>  arch/riscv/mm/init.c | 6 ++++++
>>  include/linux/mm.h   | 1 +
>>  mm/sparse-vmemmap.c  | 6 ++++++
>>  3 files changed, 13 insertions(+)

[...]

>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index 6eadb9d116e4..2b860d2b1703 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -544,6 +544,10 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>>  
>>  #endif
>>  
>> +void __weak __meminit vmemmap_populate_finalize(void)
>> +{
>> +}
>> +
> The existing hooks in sparse-vmemmap use #ifdef <hook> rather than __weak
> functions. Take a look at vmemmap_can_optimize() and
> vmemmap_populate_compound_pages().
>
> Let's keep it consistent.

I wasn't sure since it seems that both styles exist in this file.

I will change it to #ifdef in v2, as that seems to be preferable.

Vivian "dramforever" Wang

> [...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
