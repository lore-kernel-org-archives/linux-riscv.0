Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7B8C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 20:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeyzHD1BxI5jbyTSluZn90WU13sF5LuJKB1wyRsXTXs=; b=XD63r+nMQ/XxMa
	p/O8eUTj7HI9nVXmmduDGc7TD6R5FYL04LB5hVWhFF1H5chdTtnnh16MSuO2pHg90Hw0v37T/Mzhs
	swYaT+UybZhA7mqvOrWpTdupjoo4lCwQPx4ftp5bz4JysYfCKjNw6nHljpYrHZ5S4+DE21e9RoCxc
	+zRl0nAlMoWFWo3zt8z+1hUPAsDwE3q89foqNGQ9Ex1creN4P2pcGKcJS0N5OGetXXWbXAxEOuM8B
	tPJK2PwHjxttdGW1KWUhLNQ24NKq2U5QVqf34ovAlM8tAe0kXbQ2plEK/57Z8TjkQuLBlCR8RFTgZ
	WdLtMEaV34l+QsuDpjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRevO-00Ap8i-2c;
	Thu, 03 Aug 2023 20:27:58 +0000
Received: from smtpout.efficios.com ([167.114.26.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRevL-00Ap8E-0i
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 20:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1691094474;
	bh=u1lt9tMIgYVhdDY1Tv7aqcW7LU2YS85yFCEbSSPFIik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xR44LSieM2jVKrgBndvTW1FeNVa6kBgxkyS8VIPns4u+ojdcQRUJPCeRVnPVthaQU
	 boV914OUnkbHUiNwBh8k95jQHGs6JY5k+A+bvW9WsSvAtfEe8qRVfQMhJA3w6isbVT
	 /nWQLfYYpBGo7VoSOOfWmHeW+WaUJeZmHIdqJ+FsEx0UdZ0yJDLnhRqx2u+p4jmaAz
	 zpc7IeDfuOgoFhXA8WToHcAOdkR9o2blahIIGSakcr7JYBRiuuKH2/D19Yc43Oaobk
	 brCGKKrbdOV3t+i3sYwm2YXAmD/lIWqI/xi3oC+Id+EKlW0euhaLV5kRpIq9BY+cEx
	 OeodwnAXBqUzA==
Received: from [IPV6:2605:59c8:2711:c800::c66] (unknown [IPv6:2605:59c8:2711:c800::c66])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4RH0lY3csfz1Kgj;
	Thu,  3 Aug 2023 16:27:53 -0400 (EDT)
Message-ID: <4bf79f06-4593-134a-04dd-b8f89e96a1b8@efficios.com>
Date: Thu, 3 Aug 2023 16:28:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>, paulmck@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 mmaas@google.com, hboehm@google.com, striker@us.ibm.com
References: <20230803040111.5101-1-parri.andrea@gmail.com>
 <ZMvLoI6PxLR8RJvR@andrea>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <ZMvLoI6PxLR8RJvR@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_132755_350033_BE30FBFD 
X-CRM114-Status: GOOD (  19.15  )
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

On 8/3/23 11:45, Andrea Parri wrote:
> Adding Martin, Hans and Derek to the Cc: list,
> 
>    Andrea
> 
> 
> On Thu, Aug 03, 2023 at 06:01:11AM +0200, Andrea Parri wrote:
>> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
>> Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
>> ---
>> For the MEMBARRIER maintainers:  RISC-V does not have "core serializing
>> instructions", meaning that there is no occurence of such a term in the
>> RISC-V ISA.  The discussion and git history about the SYNC_CORE command
>> suggested the implementation below: a FENCE.I instruction "synchronizes
>> the instruction and data streams" [1] on a CPU; in litmus parlance,
>>

Can you double-check that riscv switch_mm() implies a fence.i or 
equivalent on the CPU doing the switch_mm ?

AFAIR membarrier use of sync_core_before_usermode relies on switch_mm 
issuing a core serializing instruction.

Thanks,

Mathieu


>>    (single-hart test)
>>
>>    CPU0
>>
>>    UPDATE text   ;
>>    FENCE.I       ;
>>    EXECUTE text  ;  /* <-- will execute the updated/new text */
>>
>>
>>    (message-passing test)
>>
>>    CPU0             CPU1
>>
>>    UPDATE text   |  IF (flag) {     ;
>>    WMB           |    FENCE.I       ;
>>    SET flag      |    EXECUTE text  ;  /* execute the new text */
>>                  |  }               ;
>>
>>
>>    (and many others, including "maybe"s!  ;-) )
>>
>> How do these remarks resonate with the semantics of "a core serializing
>> instruction" (to be issued before returning to user-space)?
>>
>> RISCV maintainers, I'm missing some paths to user-space? (besides xRET)
>>
>>    Andrea
>>
>> [1] https://github.com/riscv/riscv-isa-manual/blob/main/src/zifencei.adoc
>>
>>
>>   .../sched/membarrier-sync-core/arch-support.txt   |  2 +-
>>   arch/riscv/Kconfig                                |  2 ++
>>   arch/riscv/include/asm/sync_core.h                | 15 +++++++++++++++
>>   3 files changed, 18 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/riscv/include/asm/sync_core.h
>>
>> diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
>> index 23260ca449468..a17117d76e6d8 100644
>> --- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
>> +++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
>> @@ -44,7 +44,7 @@
>>       |    openrisc: | TODO |
>>       |      parisc: | TODO |
>>       |     powerpc: |  ok  |
>> -    |       riscv: | TODO |
>> +    |       riscv: |  ok  |
>>       |        s390: |  ok  |
>>       |          sh: | TODO |
>>       |       sparc: | TODO |
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 4c07b9189c867..ed7ddaedc692e 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -27,6 +27,7 @@ config RISCV
>>   	select ARCH_HAS_GCOV_PROFILE_ALL
>>   	select ARCH_HAS_GIGANTIC_PAGE
>>   	select ARCH_HAS_KCOV
>> +	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>>   	select ARCH_HAS_MMIOWB
>>   	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>>   	select ARCH_HAS_PMEM_API
>> @@ -35,6 +36,7 @@ config RISCV
>>   	select ARCH_HAS_SET_MEMORY if MMU
>>   	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
>>   	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
>> +	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>>   	select ARCH_HAS_VDSO_DATA
>> diff --git a/arch/riscv/include/asm/sync_core.h b/arch/riscv/include/asm/sync_core.h
>> new file mode 100644
>> index 0000000000000..d3ec6ac47ac9b
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/sync_core.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_RISCV_SYNC_CORE_H
>> +#define _ASM_RISCV_SYNC_CORE_H
>> +
>> +/*
>> + * Ensure that a core serializing instruction is issued before returning
>> + * to user-mode.  RISC-V implements return to user-space through an xRET
>> + * instruction, which is not core serializing.
>> + */
>> +static inline void sync_core_before_usermode(void)
>> +{
>> +	asm volatile ("fence.i" ::: "memory");
>> +}
>> +
>> +#endif /* _ASM_RISCV_SYNC_CORE_H */
>> -- 
>> 2.34.1
>>

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
