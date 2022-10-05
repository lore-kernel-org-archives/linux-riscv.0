Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD163C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 14:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9viilEzAyBg8ozfpl6m1dwsSePdTJtXdc+DpyCCchA=; b=VSqlkzzCKHOT7V
	mjJzjioOaBheVFBlDfc4Fik+WUaOID1AeuQFkr7QDhVcf6wWa6Ke+bJsYvQ/4mBx3WAD0Xx2iAj4f
	y/FSI1lMCrwh8G6iWaKBJYHj83VDsuyC0SxYObpZdBibywiuIXTexEKAv5gVPGaiEUAeg2Y6tzUD0
	jOf0etFBtKeTkOovkNTh/IpiBxrJeUHdbN5EziTKCFrWOHnF6cO1Foh6XmhkS1aS8wGpOJ3wO41+/
	qHK1YBSw69FuZCkqAqDosPUpqiYkNQXgyoCos2VMONehZuytvnUg1G7ZD/5tPjI+BcEjddie+r3ld
	fVzHrcxL6ZMGBiH2p6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5jS-00EgB5-EN; Wed, 05 Oct 2022 14:50:46 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5jO-00EgAN-SZ
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 14:50:45 +0000
Received: from [124.16.96.231] (unknown [124.16.96.231])
	by APP-03 (Coremail) with SMTP id rQCowACHj0u9mT1jRZ4TAw--.62163S3;
	Wed, 05 Oct 2022 22:50:38 +0800 (CST)
Message-ID: <dcc9dd28-da75-35a1-856d-60b091e960d0@iscas.ac.cn>
Date: Wed, 5 Oct 2022 22:50:35 +0800
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
 <9055bb90-b314-d2cf-8d5d-8c12936f4cf7@iscas.ac.cn>
 <20221005132555.hmwrzncg6wizt3k6@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221005132555.hmwrzncg6wizt3k6@kamzik>
X-CM-TRANSID: rQCowACHj0u9mT1jRZ4TAw--.62163S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1UKw4fur43ZF4UGr1kAFb_yoW5WFWfpr
	y2yay2ka1DtF13JwsFvw1kXr4jyw47AryUXry5JrykJr9YqFySgF4Uta15uF1xAr4rAw4j
	qrWjg3sxWas8Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r
	15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Xryl42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUg3fHDUUUU
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwIKDGM9Lg6VRAAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_075043_345310_9D92CF12 
X-CRM114-Status: GOOD (  17.70  )
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

On 10/5/22 9:25 PM, Andrew Jones wrote:
> On Wed, Oct 05, 2022 at 08:41:02PM +0800, Qinglin Pan wrote:
>> On 10/5/22 3:15 PM, Andrew Jones wrote:
>>> On Wed, Oct 05, 2022 at 12:43:01PM +0800, Qinglin Pan wrote:
>>>> Hi Conor and Andrew,
>>>>
>>>> On 10/5/22 2:33 AM, Conor Dooley wrote:
>>>>> On Tue, Oct 04, 2022 at 07:00:27PM +0200, Andrew Jones wrote:
>>>>>> On Mon, Oct 03, 2022 at 09:47:18PM +0800, panqinglin2020@iscas.ac.cn wrote:
>>>
>>>>>>> +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
>>>>>>> +asm(ALTERNATIVE("and %0, %0, %1\n\t"					\
>>>>>>> +		"srli %0, %0, %2\n\t"					\
>>>>>>> +		__nops(3),						\
>>>>>>> +		"srli t3, %0, %3\n\t"					\
>>>>>>> +		"and %0, %0, %1\n\t"					\
>>>>>>> +		"srli %0, %0, %2\n\t"					\
>>>>>>> +		"sub  t4, %0, t3\n\t"					\
>>>>>>> +		"and  %0, %0, t4",					\
>>>>>>
>>>>>> This implements
>>>>>>
>>>>>>      temp = ((pte & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
>>>>>>      pfn = temp & (temp - (pte >> _PAGE_NAPOT_SHIFT));
>>>>>>
>>>>>> which for a non-napot pte just returns the same as the non-napot
>>>>>> case would, but for a napot pte we return the same as the non-napot
>>>>>> case but with its first set bit cleared, wherever that first set
>>>>>> bit was. Can you explain to me why that's what we want to do?
>>>>>>
>>>>
>>>> For 64KB napot pte, (pte >> _PAGE_NAPOT_SHIFT) will get 1, and temp will be
>>>> something like 0xabcdabcdab8, but the correct pfn we expect should be
>>>> 0xabcdabcdab0. We can get it by calculating (temp & (temp - 1)).
>>>> So temp & (temp - (pte >> _PAGE_NAPOT_SHIFT)) will give correct pfn
>>>> both in non-napot and napot case:)
>>>
>>> I understood that and it makes sense to me for your example, where
>>> temp = 0xabcdabcdab8, as we effectively clear the lower four bits as
>>> expected (I think) for napot-order = 4. But, what if temp = 0xabcdabcdab0,
>>> then we'll get 0xabcdabcdaa0 for the napot case. Is that still correct?
>>> With the (temp & (temp - 1)) approach we'll always clear the first set
>>> bit, wherever it is, e.g. 0xabcd0000800 would be 0xabcd0000000.  Am I
>>> missing something about the expectations of the lower PPN bits of the PTE?
>>
>> According to spec, when napot-order=4, the last 3 bit of temp will be 0, and
>> the fourth bit from the bottom must be 1. All 16 PTEs will be the same.
>> We'll always need to clear the first set bit of napot PTE's pfn.
>> The first set bit is used by MMU to determine this PTE's napot-order.
> 
> Thank you for the clarification. My first reading of the spec left me
> confused, so I was hoping your answer would help me understand it and
> it did. The assembly you've pulled together is indeed a clever way to
> handle this :-)
> 

You are welcome :-)

Yours,
Qinglin

> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
