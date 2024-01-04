Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E89C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbM8VO6gzLrFBb8w2prNI3javaFjD8f9ARkU75ejbVs=; b=GRHoha7WtMrHLp
	IJ+hBvbctnWHC7ippK+Zpdo6zE2xyWGoyD4hSx7VCVL6p/bbgGViQIIdpB0mqDulwMSdCdUWLfbmr
	hYzXfW2aNTFGSTxjlek2PCet/qskS+BLsp+Ycrn24hwWtO79TspVeqNMxBX87Xx/F2ozw7Hw6LTPE
	ZAlr+pRCQKuCLpcNl5h//iXt/maf/c3m7SDY2fUvFOxkDUhIwVA2l93Yh3kjJh+PRAzhxbBP1zTgm
	jvBXCBJ4M+LvgT+gjV5gGlYcywzCe09nk43l2+KsOezbGw07HzJud2WBalKxYpgB93KjvdkjJNkj6
	EyjdQ+yjRmJcu0RdU4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLNLB-00E2PK-2O;
	Thu, 04 Jan 2024 13:00:53 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLNL8-00E2NL-0K;
	Thu, 04 Jan 2024 13:00:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3D03E0002;
	Thu,  4 Jan 2024 13:00:44 +0000 (UTC)
Message-ID: <6685594f-5a50-4e4d-b6ec-2834e9f8624f@ghiti.fr>
Date: Thu, 4 Jan 2024 14:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: tlb: avoid tlb flushing if fullmm == 1
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-3-jszhang@kernel.org>
 <e227f095-0c3d-43c4-8ba3-8ec1b925b929@ghiti.fr> <ZZN/IKBgbtyIc+NL@xhacker>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZZN/IKBgbtyIc+NL@xhacker>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_050050_265770_E5903D26 
X-CRM114-Status: GOOD (  18.47  )
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

On 02/01/2024 04:12, Jisheng Zhang wrote:
> On Sat, Dec 30, 2023 at 07:26:11PM +0100, Alexandre Ghiti wrote:
>> Hi Jisheng,
> Hi Alex,
>
>> On 28/12/2023 09:46, Jisheng Zhang wrote:
>>> The mmu_gather code sets fullmm=1 when tearing down the entire address
>>> space for an mm_struct on exit or execve. So if the underlying platform
>>> supports ASID, the tlb flushing can be avoided because the ASID
>>> allocator will never re-allocate a dirty ASID.
>>>
>>> Use the performance of Process creation in unixbench on T-HEAD TH1520
>>> platform is improved by about 4%.
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>    arch/riscv/include/asm/tlb.h | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
>>> index 1eb5682b2af6..35f3c214332e 100644
>>> --- a/arch/riscv/include/asm/tlb.h
>>> +++ b/arch/riscv/include/asm/tlb.h
>>> @@ -12,10 +12,19 @@ static void tlb_flush(struct mmu_gather *tlb);
>>>    #define tlb_flush tlb_flush
>>>    #include <asm-generic/tlb.h>
>>> +#include <asm/mmu_context.h>
>>>    static inline void tlb_flush(struct mmu_gather *tlb)
>>>    {
>>>    #ifdef CONFIG_MMU
>>> +	/*
>>> +	 * If ASID is supported, the ASID allocator will either invalidate the
>>> +	 * ASID or mark it as used. So we can avoid TLB invalidation when
>>> +	 * pulling down a full mm.
>>> +	 */
>>
>> Given the number of bits are limited for the ASID, at some point we'll reuse
>> previously allocated ASID so the ASID allocator must make sure to invalidate
>> the entries when reusing an ASID: can you point where this is done?
> Per my understanding of the code, the path would be
> set_mm_asid()
>    __new_context()
>      __flush_context()  // set context_tlb_flush_pending
> if (need_flush_tlb)
>    local_flush_tlb_all()


Ok thanks, so feel free to add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks!

Alex


>
> Thanks
>   
>>> +	if (static_branch_likely(&use_asid_allocator) && tlb->fullmm)
>>> +		return;
>>> +
>>>    	if (tlb->fullmm || tlb->need_flush_all)
>>>    		flush_tlb_mm(tlb->mm);
>>>    	else
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
