Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EADEE49BD
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 03:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pq0eoT02cmgBKJDMyDQ/CxHKEVr9X6BrHpAXRnqFFY4=; b=wOCsHC/w+sx6CV
	s7+3uLHCAv3UuKKb9p/eDrpM6wb+cFOJ0v7h/8aOjsDTEukyMJvsfv+AS8tCbOhNUvhhPahKLFfkM
	gaCRNrRoduWb7HxTnuBRASfogqB0mN0cZtaKFTnbVbp5whzWuxxBbSH9TgQoyYyg3zSs7E8vCmC5I
	MEYo27ivVSz+WD/OqkNr5e4wUv8BOg+OvIKPbLf29ZZV+XINNYoVg0bkWiDGmGsBBEJ6WNcaWI0WC
	955YrWwHqhbB1SbbphCNo07ZOOD4mDqfQeCk3eUjHVjY4aLfcnd9u+PM3NEoJa4fow3WtTMFVsZHA
	24jn5/hvmif4Exz734UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vanBk-00000005ekG-1vpc;
	Wed, 31 Dec 2025 03:47:56 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vanBh-00000005ejl-0RFu
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 03:47:55 +0000
Received: from [192.168.0.114] (unknown [114.241.82.59])
	by APP-05 (Coremail) with SMTP id zQCowADHXBDDnFRpAPOkAg--.49133S2;
	Wed, 31 Dec 2025 11:47:16 +0800 (CST)
Message-ID: <d6076efd-d5e4-49f9-a0ed-62195ee20e01@iscas.ac.cn>
Date: Wed, 31 Dec 2025 11:47:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess
 speculation
To: David Laight <david.laight.linux@gmail.com>,
 Deepak Gupta <debug@rivosinc.com>
Cc: Lukas Gerlach <lukas.gerlach@cispa.de>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, daniel.weber@cispa.de,
 michael.schwarz@cispa.de, marton.bognar@kuleuven.be, jo.vanbulck@kuleuven.be
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
 <20251218191332.35849-2-lukas.gerlach@cispa.de>
 <aUXxW3iZOClLNofi@debug.ba.rivosinc.com> <20251227212859.3a83d65e@pumpkin>
 <aVCPCm2mHUxSzQJi@debug.ba.rivosinc.com> <20251228223430.43f14d51@pumpkin>
 <20251229123212.25ef3c4b@pumpkin>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251229123212.25ef3c4b@pumpkin>
X-CM-TRANSID: zQCowADHXBDDnFRpAPOkAg--.49133S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy7Aw1rCw4ktw18Xw4UXFb_yoWrWw1fpr
	WkK3Wjkr4kJr13Ja1jv34IgFyfKa93Gry3Wryqg34Yvrn0vF12vr1Ygw1Uury8Gr1vyw1j
	9ry5Jr9Ig3W5Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
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
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_194753_526116_0FF4F8D0 
X-CRM114-Status: GOOD (  21.75  )
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


On 12/29/25 20:32, David Laight wrote:
> On Sun, 28 Dec 2025 22:34:30 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
>
>> On Sat, 27 Dec 2025 17:59:38 -0800
>> Deepak Gupta <debug@rivosinc.com> wrote:
>>
>>> On Sat, Dec 27, 2025 at 09:28:59PM +0000, David Laight wrote:  
>>>> On Fri, 19 Dec 2025 16:44:11 -0800
>>>> Deepak Gupta <debug@rivosinc.com> wrote:
>>>>    
>>>>> On Thu, Dec 18, 2025 at 08:13:31PM +0100, Lukas Gerlach wrote:    
>>>>>> Similarly to x86 and arm64, mitigate speculation past an access_ok()
>>>>>> check by masking the pointer before use.
>>>>>>
>>>>>> On RISC-V, user addresses have the MSB clear while kernel addresses
>>>>>> have the MSB set. The uaccess_mask_ptr() function clears the MSB,
>>>>>> ensuring any kernel pointer becomes invalid and will fault, while
>>>>>> valid user pointers remain unchanged. This prevents speculative
>>>>>> access to kernel memory via user copy functions.
>>>>>>
>>>>>> The masking is applied to __get_user, __put_user, raw_copy_from_user,
>>>>>> raw_copy_to_user, clear_user, and the unsafe_* variants.
>>>>>>
>>>>>> Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
>>>>>> ---
>>>>>> arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
>>>>>> 1 file changed, 32 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>>>>>> index 36bba6720c26..ceee1d62ff9b 100644
>>>>>> --- a/arch/riscv/include/asm/uaccess.h
>>>>>> +++ b/arch/riscv/include/asm/uaccess.h
>>>>>> @@ -74,6 +74,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
>>>>>> #define __typefits(x, type, not) \
>>>>>> 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
>>>>>>
>>>>>> +/*
>>>>>> + * Sanitize a uaccess pointer such that it cannot reach any kernel address.
>>>>>> + *
>>>>>> + * On RISC-V, virtual addresses are sign-extended from the top implemented bit.
>>>>>> + * User addresses have the MSB clear; kernel addresses have the MSB set.
>>>>>> + * Clearing the MSB ensures any kernel pointer becomes non-canonical and will
>>>>>> + * fault, while valid user pointers remain unchanged.
>>>>>> + */
>>>>>> +#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
>>>>>> +static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
>>>>>> +{
>>>>>> +	unsigned long val = (unsigned long)ptr;
>>>>>> +
>>>>>> +	val = (val << 1) >> 1;
>>>>>> +	return (void __user *)val;    
>>>>> This is only clearing b63 which is what we don't need here.    
>>>> It is also entirely the wrong operation.
>>>> A kernel address needs converting into an address that is guaranteed
>>>> to fault - not a user address that might be valid.    
>>> This is about speculative accesses and not actual accesses. Due to some
>>> speculation it is possible that in speculative path a wrong address is
>>> generated with MSB=1. This simply ensures that bit is cleared for agen
>>> even in speculative path.  
>> You said you were following what x86 did - this isn't what is does.
>> Avoiding the conditional branch in access_ok() is actually a big win.
>> That is true even without the issues with speculative accesses to kernel
>> memory.
>> The 'address masking' (badly named - it isn't just masking) is a replacement
>> for access_ok(), it changes kernel addresses to invalid ones so that the
>> access faults and the trap/fault fixup code detects the error.
> If you can guarantee that address 0 is never mapped into userspace
> (not true for x86 for historic reasons) then I think you can convert
> kernel addresses to zero - which will then fault.
> This is simpler than using the base of the guard page (which is still
> needed for sequential accesses).
> Something like:
> 	addr &= (addr >= guard_page) - 1;
> will then work - but it needs (partially) coding in assembler to
> guarantee that 'setae' (or equivalent) is used rather than a
> conditional branch.
>  

Maybe use:

    addr |= (long)addr >> 63

To map kernel addresses to -1?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
