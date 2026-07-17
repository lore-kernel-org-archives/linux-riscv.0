Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB92C44516
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVdrUSWQhsGc8hG7ufJSbSf2+VsO4AshqTTvjr2isTw=; b=CDWaNKo8DoYKvq
	9ciTHQ4nDoDBt6TB1+AjaaSnUCdTJr3ZJWMFTaoSbAY0bb5k25xGwOAib9HQvSqmroJD3HVD9xvhJ
	rkNN650CfqmZd0VGWCcTsegdsyYhjwr2x212C887dmz4ppagbO1xGsbGNr45U4jl8FJZLjG63fwwI
	goJm2D4O5LM0CkCn1sBcH1akC6nerHPkX5ZEBC96z4cv1r2aljysltareyKhX/NkfWphDkJ7Fz3n+
	lSHM7OfXpk8j6kHmNBzNhzyQwc41CX1JWDqHRu3qI6rcpEVf+6Ou5RYYCiim4Ng3Q/JsY/TqJeMDu
	0THeSNGYTOD6Y+zM7yig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiZW-00000002PDL-2w4R;
	Fri, 17 Jul 2026 13:25:46 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiZT-00000002PCi-3o9K
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 13:25:45 +0000
Received: from [192.168.0.104] (unknown [123.116.46.73])
	by APP-05 (Coremail) with SMTP id zQCowAAHKkNSLVpqFEwIAA--.10753S2;
	Fri, 17 Jul 2026 21:25:38 +0800 (CST)
Message-ID: <d5e04816-9ee9-4929-b1ec-af44653d56f3@iscas.ac.cn>
Date: Fri, 17 Jul 2026 21:25:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] riscv: errata: picoheart: Add workaround for
 cbo.clean errata
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, geshijian@picoheart.com,
 niehaitao@picoheart.com, cuiyunhui@bytedance.com
References: <20260715084724.26578-1-yang.yicong@picoheart.com>
 <20260715084724.26578-3-yang.yicong@picoheart.com>
 <96c3e2f3-602e-497a-937e-b56047ca3a27@iscas.ac.cn>
 <3ac14150-a3f1-4512-bb97-357e4ba24459@picoheart.com>
 <380e13a0-38c6-4cf2-9079-cfffae422d26@iscas.ac.cn>
 <81075022-4fa8-414a-9636-59097ed13d16@picoheart.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <81075022-4fa8-414a-9636-59097ed13d16@picoheart.com>
X-CM-TRANSID: zQCowAAHKkNSLVpqFEwIAA--.10753S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1rGr1fWF4UZFyDCry3Jwb_yoW8uF17pF
	WSqr4YkrWktryIkry0gFnY9FyrJrsagFn8Aan8Gas3Aa98XryxtF1kt3yjgF1Sgr4Iya1a
	vF4qqF1rWFZ3ZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bYYLPUUUUU=
X-Originating-IP: [123.116.46.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_062544_322678_FFF56981 
X-CRM114-Status: GOOD (  12.20  )
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


On 7/17/26 18:42, Yicong Yang wrote:
> On 7/17/26 4:06 PM, Vivian Wang wrote:
>> [...]
>>
>> So you only need to have the wback function, and inv and wback can be
>> left as zero initialized. In that case arch_dma_cache_*() in
> benefit?
>
> I don't have strong feelings for either way but I feel this implicit
> assignment will make the code a bit less readable and not that
> self-explained. Considering only ~10 more LOCs if implement all
> these three callbacks...

To me the benefit is showing more clearly that wback_inv and inv are
standard, and only wback is non-standard.

>> arch/riscv/mm/dma-noncoherent.c will just do the standard operation. See
>> e.g.:
>>
>>     static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>>     {
>>     	void *vaddr = phys_to_virt(paddr);
>>
>>     #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
>>     	if (unlikely(noncoherent_cache_ops.inv)) {         // <-- HERE
>>     		noncoherent_cache_ops.inv(paddr, size);
>>     		return;
>>     	}
>>     #endif
>>
>>     	ALT_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
>>     }
>>
>> And after you've done that, consider this somewhat out of left field
>> suggestion: Move the static inline void arch_dma_cache_*() functions to
>> dma-noncoherent.h and here just define the nonstandard cache ops here as:
>>
>>     struct riscv_nonstd_cache_ops picoheart_errata_cmo_ops = {
>>     	.wback = arch_dma_cache_wback_inv
>>     };
>>
>> It's somewhat weirdly recursive but in a way that I think makes sense:
>> It's saying "Instead of wback, do a wback_inv" (Inform 7, anyone? :P).
>> Perf-wise this has one extra cache-hot load for the NULL wback_inv (hot
>> since it's *right* next to the wback function pointer just loaded), and
>> one predictably non-taken branch, and in exchange you get to just
>> completely drop all of your own implementations.
>>
> But I'll just implement the custom callback directly for the readability
> here (as you also find it weirdly, and probably more person will have
> doubts here).
>
Sure. I'm more of a fan of arranging the existing stuff, but, well,
that's just a personal preference.

Vivian "dramforever" Wang.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
