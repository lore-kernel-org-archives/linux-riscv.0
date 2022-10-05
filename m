Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6172C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kTpnLpGk77Ik00J5+kyAaHp9TNKbYtWyzxljIdsWYg=; b=yXBbOGeEZfmnoE
	y0kfQpPraHJrh+KQIKuj7mMnmUmBYpekxrILrAnawlhH/Wir/oRjuMisBmIjQ46a674OJp7BSiI1q
	PBKE0hXdrQS0RryUswlWFia9sf8qhXLBqn3z9aWu+Vb2fzT8VCLuNc7tuHri5+2TDk4gV9EyPSNEt
	JJ7F04vrfZoqc/mqT2Ig45MRl+vPponKmpHn034KNpGWpDO4GIjZqevUqfnRbiUU7IfVAneBWz0Yy
	eZ+wOrrGgRx2/rpYrw6p1Rmhbk0J1V55cvd89ViqqvVeXNkuZKBCEUYGe+It3jI+E5jgB7rAYfueQ
	ZKqISywbg+oq0GThu0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og3iC-00E3W7-L9; Wed, 05 Oct 2022 12:41:20 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og3i9-00E3Tk-Dq
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 12:41:19 +0000
Received: from [124.16.96.231] (unknown [124.16.96.231])
	by APP-03 (Coremail) with SMTP id rQCowADHcElgez1jgKUPAw--.48265S3;
	Wed, 05 Oct 2022 20:41:05 +0800 (CST)
Message-ID: <9055bb90-b314-d2cf-8d5d-8c12936f4cf7@iscas.ac.cn>
Date: Wed, 5 Oct 2022 20:41:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH v5 1/4] mm: modify pte format for Svnapot
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-2-panqinglin2020@iscas.ac.cn>
 <20221004170027.duk2nc6pq52d4vcf@kamzik> <Yzx8YfVUmHc/3CJl@spud>
 <c5b417cc-2b62-d224-cffe-3f4750284377@iscas.ac.cn>
 <20221005071558.45pc3i2m3eb747ov@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221005071558.45pc3i2m3eb747ov@kamzik>
X-CM-TRANSID: rQCowADHcElgez1jgKUPAw--.48265S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4xWFWkCryrCF47tFW7twb_yoW8try8pr
	W2yay2kayDtF13JrsFv34vqF4jyw47AryUXryrtr95Jr9aqryfKr45tFWY9r1SvrW8Aw4j
	vayjv3sxWasxXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jouWdUUUUU=
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQMKDGM9K9BcJAABsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_054117_874605_6E8CCEE1 
X-CRM114-Status: GOOD (  15.37  )
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

On 10/5/22 3:15 PM, Andrew Jones wrote:
> On Wed, Oct 05, 2022 at 12:43:01PM +0800, Qinglin Pan wrote:
>> Hi Conor and Andrew,
>>
>> On 10/5/22 2:33 AM, Conor Dooley wrote:
>>> On Tue, Oct 04, 2022 at 07:00:27PM +0200, Andrew Jones wrote:
>>>> On Mon, Oct 03, 2022 at 09:47:18PM +0800, panqinglin2020@iscas.ac.cn wrote:
> 
>>>>> +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
>>>>> +asm(ALTERNATIVE("and %0, %0, %1\n\t"					\
>>>>> +		"srli %0, %0, %2\n\t"					\
>>>>> +		__nops(3),						\
>>>>> +		"srli t3, %0, %3\n\t"					\
>>>>> +		"and %0, %0, %1\n\t"					\
>>>>> +		"srli %0, %0, %2\n\t"					\
>>>>> +		"sub  t4, %0, t3\n\t"					\
>>>>> +		"and  %0, %0, t4",					\
>>>>
>>>> This implements
>>>>
>>>>     temp = ((pte & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
>>>>     pfn = temp & (temp - (pte >> _PAGE_NAPOT_SHIFT));
>>>>
>>>> which for a non-napot pte just returns the same as the non-napot
>>>> case would, but for a napot pte we return the same as the non-napot
>>>> case but with its first set bit cleared, wherever that first set
>>>> bit was. Can you explain to me why that's what we want to do?
>>>>
>>
>> For 64KB napot pte, (pte >> _PAGE_NAPOT_SHIFT) will get 1, and temp will be
>> something like 0xabcdabcdab8, but the correct pfn we expect should be
>> 0xabcdabcdab0. We can get it by calculating (temp & (temp - 1)).
>> So temp & (temp - (pte >> _PAGE_NAPOT_SHIFT)) will give correct pfn
>> both in non-napot and napot case:)
> 
> I understood that and it makes sense to me for your example, where
> temp = 0xabcdabcdab8, as we effectively clear the lower four bits as
> expected (I think) for napot-order = 4. But, what if temp = 0xabcdabcdab0,
> then we'll get 0xabcdabcdaa0 for the napot case. Is that still correct?
> With the (temp & (temp - 1)) approach we'll always clear the first set
> bit, wherever it is, e.g. 0xabcd0000800 would be 0xabcd0000000.  Am I
> missing something about the expectations of the lower PPN bits of the PTE?

According to spec, when napot-order=4, the last 3 bit of temp will be 0, 
and the fourth bit from the bottom must be 1. All 16 PTEs will be the 
same. We'll always need to clear the first set bit of napot PTE's pfn.
The first set bit is used by MMU to determine this PTE's napot-order.

Thanks,
Qinglin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
