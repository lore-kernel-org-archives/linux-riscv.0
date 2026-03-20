Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206E01093168
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 03:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBIfW7JvIY5QGye04VCBNrLOTwcqH6mKqXBrVZ+02tQ=; b=dkgrL835Rue3p1
	w+trgmYWl+vuAI9GlhSR2GGl7qlkjWN3EHHAyoAIoFZ0jNOI+e8LgDurA9L96O6Q2vasc4OQUB8Tg
	xjddhS2zirabLtYKU3m9PgWrW0Y6vpVPotrcY6z5yjFyLhRjY4/37vYjxjuhKwwkjif6C5qZ1ezNi
	DrE8Cb7r5xlePGHg0JG82yWX8D8ON6X6DNc5R6qbmOsDEBkFLc8uPIbvkz0mF8bkfD+skTNrphdFH
	FDp4NSX1ONrPbPgpCi7phP9e7OackURfvHiRx0ekwDUl6yLQ/8ss8u6WLU23LuspneCPO4ExH36yV
	4TK09sO/+UX3IohWdwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QEy-0000000BxyG-13wu;
	Fri, 20 Mar 2026 03:09:36 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QEu-0000000BxxV-48CG;
	Fri, 20 Mar 2026 03:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773976170; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=VWrUuwn6/3D2jBpHTBrix7nCaDc+sDPWfC/Ra1XXa8Q=;
	b=j7VGs8KjVuuuzQ1cQvvGaD/P/rZRDoIb2hSGGkSaYazWS9aMVrPy3EM/GFinsa3FmB7EW832UoPIAb/fL86fZER3F0IzAPD1PgXdbnNkseuF4Rbd+3Rol4vmur4hB+4+FPxap/HdH3kkREaQoCnvwpj4j0jLo6ern/fcRlfe6os=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R681e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.K9Y71_1773976168;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.K9Y71_1773976168 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Mar 2026 11:09:29 +0800
Message-ID: <a745d7ad-5d6b-4bef-b102-09139f56556c@linux.alibaba.com>
Date: Fri, 20 Mar 2026 11:09:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mm: change to return bool for
 pmdp_clear_flush_young()
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <eb513ed809685f78e0abdeb7f7b6ebdec0fcca18.1773890510.git.baolin.wang@linux.alibaba.com>
 <60e7cc1b-1459-44d8-8088-30b7ba3e9b44@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <60e7cc1b-1459-44d8-8088-30b7ba3e9b44@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_200933_197327_91742D88 
X-CRM114-Status: GOOD (  13.32  )
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



On 3/19/26 7:33 PM, Lorenzo Stoakes (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:24:03AM +0800, Baolin Wang wrote:
>> The pmdp_clear_flush_young() is used to clear the young flag and flush the
>> TLB, returning whether the young flag was set for this PMD entry. Change
>> the return type to bool to make the intention clearer.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> Some nits, but otherwise LGTM, so:
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> 
>> ---
>>   arch/s390/include/asm/pgtable.h |  4 ++--
>>   arch/x86/include/asm/pgtable.h  |  4 ++--
>>   arch/x86/mm/pgtable.c           |  6 +++---
>>   include/linux/pgtable.h         | 10 +++++-----
>>   mm/pgtable-generic.c            |  7 ++++---
>>   5 files changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
>> index 1f5efb7be71d..90bba85ca4b8 100644
>> --- a/arch/s390/include/asm/pgtable.h
>> +++ b/arch/s390/include/asm/pgtable.h
>> @@ -1693,8 +1693,8 @@ static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
>>   }
>>
>>   #define __HAVE_ARCH_PMDP_CLEAR_YOUNG_FLUSH
>> -static inline int pmdp_clear_flush_young(struct vm_area_struct *vma,
>> -					 unsigned long addr, pmd_t *pmdp)
>> +static inline bool pmdp_clear_flush_young(struct vm_area_struct *vma,
>> +					  unsigned long addr, pmd_t *pmdp)
> 
> Same indentation comment as with other patches, 2 tabs you know the drill :)
> applies to all such in this patch.
> 
>>   {
>>   	VM_BUG_ON(addr & ~HPAGE_MASK);
>>   	return pmdp_test_and_clear_young(vma, addr, pmdp);
>> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
>> index bd02ee730a23..f9439449c9bd 100644
>> --- a/arch/x86/include/asm/pgtable.h
>> +++ b/arch/x86/include/asm/pgtable.h
>> @@ -1301,8 +1301,8 @@ extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
>>   				     unsigned long addr, pud_t *pudp);
>>
>>   #define __HAVE_ARCH_PMDP_CLEAR_YOUNG_FLUSH
>> -extern int pmdp_clear_flush_young(struct vm_area_struct *vma,
>> -				  unsigned long address, pmd_t *pmdp);
>> +extern bool pmdp_clear_flush_young(struct vm_area_struct *vma,
>> +				   unsigned long address, pmd_t *pmdp);
> 
> Drop the extern please!

Ack.

>>   #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
>> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
>> index 10a5e0b2be36..8c336edf0e65 100644
>> --- a/arch/x86/mm/pgtable.c
>> +++ b/arch/x86/mm/pgtable.c
>> @@ -503,10 +503,10 @@ bool ptep_clear_flush_young(struct vm_area_struct *vma,
>>   }
>>
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -int pmdp_clear_flush_young(struct vm_area_struct *vma,
>> -			   unsigned long address, pmd_t *pmdp)
>> +bool pmdp_clear_flush_young(struct vm_area_struct *vma,
>> +			    unsigned long address, pmd_t *pmdp)
>>   {
>> -	int young;
>> +	bool young;
>>
>>   	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index e53220b0a9a3..8b8838f19af3 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -536,18 +536,18 @@ bool ptep_clear_flush_young(struct vm_area_struct *vma,
>>
>>   #ifndef __HAVE_ARCH_PMDP_CLEAR_YOUNG_FLUSH
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -extern int pmdp_clear_flush_young(struct vm_area_struct *vma,
>> -				  unsigned long address, pmd_t *pmdp);
>> +bool pmdp_clear_flush_young(struct vm_area_struct *vma,
>> +		unsigned long address, pmd_t *pmdp);
> 
> Ahh! Here you drop the extern :) AND use 2 tabs :)) thanks!

Right. Because this is the mm subsystem, and I know the maintainers' 
preferences:)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
