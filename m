Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA62CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 18:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVu+diQ1JTBeHoeif8uk+jFPeaIXcWKaeIPZeBXe30g=; b=J8sW+gje4LcAxX
	pqa4tu7tjqIY+tABB8U279aNWlC2CBw4qvmykuUEi9hyiFVUCAXT4B27fffpDHximXojPn3yWtV8D
	S1zAjLl7QpIPN2Rhw+PVDw1u+knYQpVFmIkOqz4kATD2G6naBVxd7fOV30AoJo5F5tLSAF73OulKn
	ou/I8PmW7NESw9BmgpDynyapztAnZ/EXw4t916OqXbDSFMej0GcXullNmoum+/pknTiEpwY4ial1r
	mNwVSGTL4ahPXw2bL44zjKHBrMogYGpFqCXip2H3QuJM2c9U2jCwsBXM4VvpPfDeEShUzBY+2/eS5
	KL8NL6LmMevEIFpMM7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoo0Q-0000000Ej71-0QFB;
	Wed, 20 Aug 2025 18:57:54 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokrz-0000000EHaB-3QKb
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 15:37:01 +0000
Received: from [192.168.0.110] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAAXq1uV66VopRy+DQ--.7550S2;
	Wed, 20 Aug 2025 23:36:54 +0800 (CST)
Message-ID: <800585ca-29ff-40ef-bddd-8cc14806dbb1@iscas.ac.cn>
Date: Wed, 20 Aug 2025 23:36:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] riscv: bitops: Convert to use_alternative_likely
To: Yury Norov <yury.norov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Vivian Wang <uwu@dram.page>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
 <20250820-riscv-altn-helper-wip-v1-5-c3c626c1f7e6@iscas.ac.cn>
 <aKXj_zTwvk0SwUpV@yury>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <aKXj_zTwvk0SwUpV@yury>
X-CM-TRANSID: zQCowAAXq1uV66VopRy+DQ--.7550S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4UZry5Aw47ZFWfAry5Jwb_yoW5Gw13pF
	n3K3ZxCFWkGa4fu3Zrtw1qgr1Fy397G343Gr9agr1kXF1qk3ySyr15K3WrCryrAFWvv34I
	vr4UCa4rC3Z8uFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUqVcEUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_083700_228228_B749DBC8 
X-CRM114-Status: GOOD (  19.74  )
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

On 8/20/25 23:04, Yury Norov wrote:

> On Wed, Aug 20, 2025 at 09:44:49PM +0800, Vivian Wang wrote:
>> Use use_alternative_likely() to check for RISCV_ISA_EXT_ZBB, replacing
>> the use of asm goto with ALTERNATIVE.
>>
>> The "likely" variant is used to match the behavior of the original
>> implementation using ALTERNATIVE("j %l[legacy]", "nop", ...).
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> ---
>>  arch/riscv/include/asm/bitops.h | 112 ++++++++++++++++++----------------------
>>  1 file changed, 50 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
>> index d59310f74c2ba70caeb7b9b0e9221882117583f5..0257d547a96293909d90b017c8a48b508d0fd642 100644
>> --- a/arch/riscv/include/asm/bitops.h
>> +++ b/arch/riscv/include/asm/bitops.h
>> @@ -47,20 +47,17 @@
>>  
>>  static __always_inline unsigned long variable__ffs(unsigned long word)
>>  {
>> -	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>> -				      RISCV_ISA_EXT_ZBB, 1)
>> -			  : : : : legacy);
>> -
>> -	asm volatile (".option push\n"
>> -		      ".option arch,+zbb\n"
>> -		      "ctz %0, %1\n"
>> -		      ".option pop\n"
>> -		      : "=r" (word) : "r" (word) :);
>> -
>> -	return word;
>> -
>> -legacy:
>> -	return generic___ffs(word);
>> +	if (use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
> I don't think that 'likely' is used properly here. The likely/unlikely
> wording has a meaning of a hint to the compiler:
>
>         if (unlikely(WARN_ON(cond))
>                 goto err;
>
> In your case, it's just meaningless, because whatever is 'likely' for
> one CPU, will be always 'unlikely' for another. 

As mentioned in the reply for patch 1, I do believe that unfortunately
we currently have no way of leaving the decision up to the compiler, so
we have to pick one. The situation is similar to
static_branch_{likely,unlikely}.

So I have preserved the original choice made here: The original asm goto
uses the "likely" pattern, so I kept it as "likely".

>> +		asm volatile (".option push\n"
>> +			      ".option arch,+zbb\n"
>> +			      "ctz %0, %1\n"
>> +			      ".option pop\n"
>> +			      : "=r" (word) : "r" (word) :);
>> +
>> +		return word;
>> +	} else {
>> +		return generic___ffs(word);
>> +	}
>>  }
> This tabs wipe most of the history. Can you reorganize your patch
> such that it preserves as much history as you can?
>
>         if (use_alternative_unlikely(...))
>                 return generic___ffs();
>
>         asm volatile (".option push\n"
>                       ".option arch,+zbb\n"
>                       "ctz %0, %1\n"
>                       ".option pop\n"
>                       : "=r" (word) : "r" (word) :);
>
>         return word;
>
> And so on.

Thanks for the tip, I'll give it a go at minimizing the diff for v2.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
