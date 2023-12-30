Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C18CC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9XG1l9AE1i2NlJrQWPNoUdD6PrqnwcKLNCl2cWtttY=; b=PoMMWEhUKf6w11
	11DSrVGsZgFKDYRVa6pCKKdu0mRZqWaxoxkvVbOg1xOF0iVd8rKssIF2H/mGPBpaK5B7/fKeyZ4h7
	L+mXfz5KksK60jl2tGPCrpoQD2MX/KpP7HmxGgtbKgAJuRPHPPmkcxT3v4fAtPwaJ0di274V0q++2
	PQqUZjzu56GH/wcDPA8VBdbzP0XufVJIpifGg7aJcmB/U5ZPirv84QGXXUuvjEzlaGhjar8g3+2Tv
	1h5Royh5RE3FVzyD6G4bwYcdKuysR/IDyD89c6ZN+ri7Fzx4BXR6KP2x8HzbJsRlNEnUANXoJN7VI
	6GejqopFgOgNX1t9HrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJe2X-003H3R-1C;
	Sat, 30 Dec 2023 18:26:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJe2T-003H10-2M;
	Sat, 30 Dec 2023 18:26:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56F6B240003;
	Sat, 30 Dec 2023 18:26:12 +0000 (UTC)
Message-ID: <e227f095-0c3d-43c4-8ba3-8ec1b925b929@ghiti.fr>
Date: Sat, 30 Dec 2023 19:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: tlb: avoid tlb flushing if fullmm == 1
To: Jisheng Zhang <jszhang@kernel.org>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-3-jszhang@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231228084642.1765-3-jszhang@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_102625_919776_465D3A7B 
X-CRM114-Status: GOOD (  17.90  )
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

Hi Jisheng,

On 28/12/2023 09:46, Jisheng Zhang wrote:
> The mmu_gather code sets fullmm=1 when tearing down the entire address
> space for an mm_struct on exit or execve. So if the underlying platform
> supports ASID, the tlb flushing can be avoided because the ASID
> allocator will never re-allocate a dirty ASID.
>
> Use the performance of Process creation in unixbench on T-HEAD TH1520
> platform is improved by about 4%.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/include/asm/tlb.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
> index 1eb5682b2af6..35f3c214332e 100644
> --- a/arch/riscv/include/asm/tlb.h
> +++ b/arch/riscv/include/asm/tlb.h
> @@ -12,10 +12,19 @@ static void tlb_flush(struct mmu_gather *tlb);
>   
>   #define tlb_flush tlb_flush
>   #include <asm-generic/tlb.h>
> +#include <asm/mmu_context.h>
>   
>   static inline void tlb_flush(struct mmu_gather *tlb)
>   {
>   #ifdef CONFIG_MMU
> +	/*
> +	 * If ASID is supported, the ASID allocator will either invalidate the
> +	 * ASID or mark it as used. So we can avoid TLB invalidation when
> +	 * pulling down a full mm.
> +	 */


Given the number of bits are limited for the ASID, at some point we'll 
reuse previously allocated ASID so the ASID allocator must make sure to 
invalidate the entries when reusing an ASID: can you point where this is 
done?

Thanks,

Alex


> +	if (static_branch_likely(&use_asid_allocator) && tlb->fullmm)
> +		return;
> +
>   	if (tlb->fullmm || tlb->need_flush_all)
>   		flush_tlb_mm(tlb->mm);
>   	else

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
