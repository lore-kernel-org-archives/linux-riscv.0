Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0B8C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 18:54:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7302C206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 18:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GsqgY2Ny";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cL2LMNbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7302C206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wDYDZkm9hNEB6aRh3IIzZ4noH5HJFS67O54UqeBz3aU=; b=GsqgY2NyYJ7IjW5STgsyTpNgS
	kZVwzDe/Rr3baVho6fa3uprPOlLvOCFdsyQ1UbC0KKirbOmYA6MlqX8Z2J6fuXGmBJIvNpZ+EtD8i
	+/pD2T9vs5m6lqW7NksZZyf8ZKMAiroexGGzSSe0BVHW69fpLA/enqEFIwygpBeR32XKu4tFc3Z+h
	Fa08dsp77Lu3vZv6/1jJL4/gJtP3SHgR+RWKSO6xK1fNJ0Pe8mENxLIq9aENfYLc8kfeFgXsciSU2
	jszUxwcpSA1qZEYTDHp2A1nEIQir5qqbVF8QtqW5qGWTvB2lqXamM/mrcmh0o0iNHxCXIl5AZNK4s
	VXYWiEPfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK5zf-0000Me-4W; Fri, 26 Apr 2019 18:54:43 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK5zb-0000MI-Uj
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 18:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556304880; x=1587840880;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QCkduY6i7W/0GLFHHqUFRDPtKBVpibe/l2EmUd8Fo8A=;
 b=cL2LMNbbtCPoTRXUkGwdpV+6T/7Rct7VXWM1o6gO1knAjxXXysfQwZiL
 wKE5PoAPy400DEiySDK3WpqRy5eMIyxB19R9rMGn/gRlhAq+9zTvqdrME
 GEV+wwZ5/hx/t0kjDSM09TwOrRYKrScmgNt3mwfqQYisl0he7TivA0klp
 5ZSGJ+dP2IplT0uhmhKLbW1Tymw9tPiWUuSX8dR+wPg6b/Co8VvgNijd0
 7szyao0FN2qoszd24RYMpIRLb/E60ropz3Pgu6rcYpxkJJ3/c0K3vtfxa
 b2A9iXgW/3tbUJoo96zWgwl0iR/TiyZ5MyE0VWmPgzSzvEUHji9EmWuTp Q==;
X-IronPort-AV: E=Sophos;i="5.60,398,1549900800"; d="scan'208";a="111889216"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Apr 2019 02:54:38 +0800
IronPort-SDR: tRC4pby1P3zHEPNsiiqtVk4aA1B10OI5BeO1yUVugqbNyvfAAO4oKq5rPz7WKgZhe6m/+PGJfb
 ucFBNQHeb9lmEqavU5Koayx8HOLzUZvQBKaygvzYgsqOOXcCKWZj2WxAFeVRosg8eI5VK/iVAQ
 JXG7nEMKXEzLDPnC1KLWHmUFO5WKHpDEgCKEZ/4+IW+8yY7Leqq0O5XJ5tAHaRzbGXJXU6LwGy
 Hpqlb2YZFTyX1EvstjaoIBBq15KzcDUep8nmG5Y3+aR/l5kPljlWujzBeU1MzZAWQmnRjBi8j2
 /0lxVXVljm90PruEqhDYUc3/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 26 Apr 2019 11:33:13 -0700
IronPort-SDR: mZkLVynK7jt6WXjY4sPbvQvHPQg51BEHjcxxXPl630IB/Z+DtHp6ObrhYoi5jTczGevJJWyjbX
 3ZZdbtGl/JDQED4u/z3Zxfj4+CzUj0NL0hoYSkepePfftWptMl3RanIKnSj/HoTdbyAlwFPSRb
 nIe5k4mdvDJk4ueHhRphFmtwcmVHbpTMWsmZZW1714qdzXOR6n1cSdr/NkOElMvXQkA6mqrue8
 x8gHXkR5q5pfUfeJWD3sLkmYLqajsOkg0Gk7ldD1mq3TDpwDGdC+MfOqgRacRUZuKzCaiRQQS/
 OeM=
Received: from unknown (HELO [10.86.51.128]) ([10.86.51.128])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Apr 2019 11:54:37 -0700
Subject: Re: [2/3] RISC-V: Update tlb flush counters
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-beb18d22-55b3-4a5f-9e29-a560ab168dff@palmer-si-x1e>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <9a05ed69-3916-fbd8-8728-1d247f6b61b2@wdc.com>
Date: Fri, 26 Apr 2019 11:54:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <mhng-beb18d22-55b3-4a5f-9e29-a560ab168dff@palmer-si-x1e>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_115440_107963_D2EF0C3F 
X-CRM114-Status: GOOD (  17.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "gary@garyguo.net" <gary@garyguo.net>, "hpa@zytor.com" <hpa@zytor.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "luc.vanoostenryck@gmail.com" <luc.vanoostenryck@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/25/19 10:31 PM, Palmer Dabbelt wrote:
> On Wed, 10 Apr 2019 15:44:48 PDT (-0700), atish.patra@wdc.com wrote:
>> The TLB flush counters under vmstat seems to be very helpful while
>> debugging TLB flush performance in RISC-V.
>>
>> Update the counters in every TLB flush methods respectively.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/riscv/include/asm/tlbflush.h |  5 +++++
>>   arch/riscv/mm/tlbflush.c          | 12 ++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
>> index 29a780ca232a..19779a083f52 100644
>> --- a/arch/riscv/include/asm/tlbflush.h
>> +++ b/arch/riscv/include/asm/tlbflush.h
>> @@ -9,6 +9,7 @@
>>   #define _ASM_RISCV_TLBFLUSH_H
>>
>>   #include <linux/mm_types.h>
>> +#include <linux/vmstat.h>
>>
>>   /*
>>    * Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
>> @@ -16,11 +17,13 @@
>>    */
>>   static inline void local_flush_tlb_all(void)
>>   {
>> +	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
>>   	__asm__ __volatile__ ("sfence.vma" : : : "memory");
>>   }
>>
>>   static inline void local_flush_tlb_mm(struct mm_struct *mm)
>>   {
>> +	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
>>   	/* Flush ASID 0 so that global mappings are not affected */
>>   	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (0) : "memory");
>>   }
>> @@ -28,6 +31,7 @@ static inline void local_flush_tlb_mm(struct mm_struct *mm)
>>   static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>>   	unsigned long addr)
>>   {
>> +	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ONE);
>>   	__asm__ __volatile__ ("sfence.vma %0, %1"
>>   			      : : "r" (addr), "r" (0)
>>   			      : "memory");
>> @@ -35,6 +39,7 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>>
>>   static inline void local_flush_tlb_kernel_page(unsigned long addr)
>>   {
>> +	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ONE);
>>   	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
>>   }
>>
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index ceee76f14a0a..8072d7da32bb 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -4,6 +4,8 @@
>>    */
>>
>>   #include <linux/mm.h>
>> +#include <linux/vmstat.h>
>> +#include <linux/cpumask.h>
>>   #include <asm/sbi.h>
>>
>>   #define SFENCE_VMA_FLUSH_ALL ((unsigned long) -1)
>> @@ -110,6 +112,7 @@ static void ipi_remote_sfence_vma(void *info)
>>   	unsigned long size = data->size;
>>   	unsigned long i;
>>
>> +	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
>>   	if (size == SFENCE_VMA_FLUSH_ALL) {
>>   		local_flush_tlb_all();
>>   	}
>> @@ -129,6 +132,8 @@ static void ipi_remote_sfence_vma_asid(void *info)
>>   	unsigned long size = data->size;
>>   	unsigned long i;
>>
>> +	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
>> +	/* Flush entire MM context */
>>   	if (size == SFENCE_VMA_FLUSH_ALL) {
>>   		__asm__ __volatile__ ("sfence.vma x0, %0"
>>   				      : : "r" (asid)
>> @@ -158,6 +163,13 @@ static void remote_sfence_vma(unsigned long start, unsigned long size)
>>   static void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
>>   				   unsigned long size, unsigned long asid)
>>   {
>> +	int cpuid = smp_processor_id();
>> +
>> +	if (cpumask_equal(mask, cpumask_of(cpuid)))
>> +		count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
>> +	else
>> +		count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
>> +
>>   	if (tlbi_ipi) {
>>   		struct tlbi info = {
>>   			.start = start,
> 
> Looks good, but it's not applying on for-next (based on rc6).  Do you mind
> re-spinning the patches?
> 
> 

This patch depends is based on Gary's TLB flush patch series

https://patchwork.kernel.org/project/linux-riscv/list/?series=97315

So it should only be merged on top of it.

Regards,
Atish
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
