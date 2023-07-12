Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE1FEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Fzq4oCi8NHOq4r43oChAsgzH2LnFfuq0U2oK7cXKmg=; b=TYvjSjqB7/BQEH
	KxBVS1goPk/nvQl7+Uk3t4LzmTdwtK9ky8e76zgfmwELpnyh+JF++naz00JXwAFB9inEmZtvuFhiG
	1Rgt6bxKo80FlGpgWiI9WYczDYBo1XwS9AFZU29UmLbPRXtT6Itxi+ycFRFWK9DxNItBx3erP5Dql
	yY0JHlzKh9sYI7FKJFY547pTGhPtt8YW/3tGaUG8RPVVIoe45qqTLx7vcQmm7bcQrDLcVAH8IUBDD
	fc+nXF1+dFqmecCZKwYT5lm1N474fq0pmlGKtq28qLNzysaJkQNm2Ui6CxkYp3i05gFYpbUIBzpeN
	VPF3+Lhd8XOyWAJgUHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbbf-000KQb-0W;
	Wed, 12 Jul 2023 15:18:19 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbbW-000KF6-0a
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 15:18:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABE1CC000B;
	Wed, 12 Jul 2023 15:18:00 +0000 (UTC)
Message-ID: <bbda29db-644d-ed9b-2894-43f4c2addb52@ghiti.fr>
Date: Wed, 12 Jul 2023 17:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/4] riscv: tlb flush improvements
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230711075434.10936-1-alexghiti@rivosinc.com>
 <20230712-void-sniff-ca1abcbc7783@wendy>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230712-void-sniff-ca1abcbc7783@wendy>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_081810_394440_3BCC83D9 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Conor,


On 12/07/2023 09:08, Conor Dooley wrote:
> Hey Alex,
>
> On Tue, Jul 11, 2023 at 09:54:30AM +0200, Alexandre Ghiti wrote:
>> This series optimizes the tlb flushes on riscv which used to simply
>> flush the whole tlb whatever the size of the range to flush or the size
>> of the stride.
>>
>> Patch 3 introduces a threshold that is microarchitecture specific and
>> will very likely be modified by vendors, not sure though which mechanism
>> we'll use to do that (dt? alternatives? vendor initialization code?).


@Conor any idea how to achieve this?


>>
>> Next steps would be to implement:
>> - svinval extension as Mayuresh did here [1]
>> - BATCHED_UNMAP_TLB_FLUSH (I'll wait for arm64 patchset to land)
>> - MMU_GATHER_RCU_TABLE_FREE
>> - MMU_GATHER_MERGE_VMAS
>>
>> Any other idea welcome.
>>
>> [1] https://lore.kernel.org/linux-riscv/20230623123849.1425805-1-mchitale@ventanamicro.com/
>>
>> Alexandre Ghiti (4):
>>    riscv: Improve flush_tlb()
>>    riscv: Improve flush_tlb_range() for hugetlb pages
>>    riscv: Make __flush_tlb_range() loop over pte instead of flushing the
>>      whole tlb
> The whole series does not build on nommu & this one adds a build warning
> for regular builds:
> +      1 ../arch/riscv/mm/tlbflush.c:32:15: warning: symbol 'tlb_flush_all_threshold' was not declared. Should it be static?
>
> Cheers,
> Conor.


I'll fix the nommu build, sorry about that. Weird I missed this warning, 
that's an LLVM build right? That variable will need to overwritten by 
the vendors, so that should not be static (but it will depend on what 
solution we implement).


Thanks,


Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
