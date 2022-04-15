Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1E4C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 05:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0VHyTfFIOZ1WQOkWse1yeECILnlUiWxelgkfwlA1gzo=; b=JfnOpncJ3VY08OKyqAlgPce7uj
	jy0dw7E8N5TttRjSXxmulf1u5fi/ZSex0uMer09nucqiL7w3oev36UaGZ6vOWTqllhJDW+dNa19tH
	0ttLbyR2i4cwJx1pkmwIolrm7M/kjPZWLKznoqiOx7/W7nXdjEgJKNhrB6eaTXjSm+BHdzZJLR5n3
	1XEn/M4cMB/KnLZ6rgTaW+Cmcbu/huRsJ5LMpT63rEnX+AZW8CQK+s49yPZ0xq0lqHZozMsg3C7L+
	ioDfo2KqMY5Q3E5DKZrNxDrNyQ5LRSqzEhm04l99COggI8TAp4KxEv5AxlKQqeULxEVFMZkx3JaE7
	hGmrySTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfENS-008eO7-OU; Fri, 15 Apr 2022 05:20:14 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfENO-008eN4-Pt
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 05:20:12 +0000
Received: by mail-pg1-x533.google.com with SMTP id h5so6526659pgc.7
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 22:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qRxjR8ix0vuqYl+JIAKzCjGTL7lI31+t1CslgYvhvOo=;
 b=LlgBV7yufxnp6RGBHA9JMOgJJArOuwSk8Gkc6OVzvARE+63wJR5VjT2odFawJ/sXgq
 owbqrgBO/HlAdelA+6G+u1q3pVP5xGD6Xp8T+Q2+DBePvAw5viHlW4KyfBqAE5Byfz7w
 /gaKiHLiKrFVmm7wFVyIjMpBgpxN8uCpY9qV/m3FBbDyL7KpFL/91u3X64dbn+8FAQzP
 Ovu9+3KQ8SiQWw3IrEMVExPjF5pDe+uJ4TNLzhxWcc+vEcp0W/9JTOF77yjNEaA8QNG0
 U/Lw1j6AYpVQAN+mh8Zfx6wyyiumiakYKrTQMwaYwH6ErnR6Z2GLpEQUmI4APvKlAVwG
 g9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qRxjR8ix0vuqYl+JIAKzCjGTL7lI31+t1CslgYvhvOo=;
 b=FhROR+K0TY2XHHF0WC1Pubc1xmmrjzfB6JQe3QMv4sv4skdJI2IMHrPVyI9EYx2KZ3
 vWn8vRW6MBslnN6wVF0SndzCLrDqlu50ALFOQDXh4Ux/uoYFB0sg0USDudNys51hNCnw
 C2/J4Z5CiVHQXT6z8t0KMhdEidSW3kKGHVIFXbNh7TPIz3eEU8QwC9AX4y1BWJ2+gKMn
 IH0eD4WuUeHFLO4B53lbll+UbXv9Lj+RFLSRhfRBybiJ1cD6UDMMCQUriyj+lB0bO1nC
 +399+1Sp7n4RGOYAIxd7GbC8MURKTCS+fwYkfX7/ipn192ClRzRjnH98SNx5Qim2edcb
 mfEg==
X-Gm-Message-State: AOAM531AFE/Dpj3XS6sTJIuOLXWnfY5JAqZnInGJn6OC88kcbFuicRF/
 LMuA/AcZG78c9YQI/jgSNL5UCQ==
X-Google-Smtp-Source: ABdhPJzw6B3I43JcoA4j2cCHTED3SaHmvYc3O0wt9aRvIAGa+jNkWcumUX6otCfAWo5ctSfAQM99DA==
X-Received: by 2002:a63:f405:0:b0:3a2:8b3d:a5a8 with SMTP id
 g5-20020a63f405000000b003a28b3da5a8mr1789010pgi.204.1650000004984; 
 Thu, 14 Apr 2022 22:20:04 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 p3-20020a056a000b4300b004faee36ea56sm1503939pfo.155.2022.04.14.22.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 22:20:04 -0700 (PDT)
Date: Thu, 14 Apr 2022 22:20:04 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Apr 2022 22:16:31 PDT (-0700)
Subject: Re: [PATCH v3 1/7] asm-generic: ticket-lock: New generic ticket-based
 spinlock
In-Reply-To: <YljFyY7acyRDBmK7@tardis>
CC: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, 
 longman@redhat.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 macro@orcam.me.uk, Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, wangkefeng.wang@huawei.com, jszhang@kernel.org,
 linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: boqun.feng@gmail.com
Message-ID: <mhng-78fec320-bd16-4774-9e24-2e5c0ce33121@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_222010_869715_E4C936C4 
X-CRM114-Status: GOOD (  37.50  )
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

On Thu, 14 Apr 2022 18:09:29 PDT (-0700), boqun.feng@gmail.com wrote:
> Hi,
>
> On Thu, Apr 14, 2022 at 03:02:08PM -0700, Palmer Dabbelt wrote:
>> From: Peter Zijlstra <peterz@infradead.org>
>> 
>> This is a simple, fair spinlock.  Specifically it doesn't have all the
>> subtle memory model dependencies that qspinlock has, which makes it more
>> suitable for simple systems as it is more likely to be correct.  It is
>> implemented entirely in terms of standard atomics and thus works fine
>> without any arch-specific code.
>> 
>> This replaces the existing asm-generic/spinlock.h, which just errored
>> out on SMP systems.
>> 
>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  include/asm-generic/spinlock.h       | 85 +++++++++++++++++++++++++---
>>  include/asm-generic/spinlock_types.h | 17 ++++++
>>  2 files changed, 94 insertions(+), 8 deletions(-)
>>  create mode 100644 include/asm-generic/spinlock_types.h
>> 
>> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
>> index adaf6acab172..ca829fcb9672 100644
>> --- a/include/asm-generic/spinlock.h
>> +++ b/include/asm-generic/spinlock.h
>> @@ -1,12 +1,81 @@
>>  /* SPDX-License-Identifier: GPL-2.0 */
>> -#ifndef __ASM_GENERIC_SPINLOCK_H
>> -#define __ASM_GENERIC_SPINLOCK_H
>> +
>>  /*
>> - * You need to implement asm/spinlock.h for SMP support. The generic
>> - * version does not handle SMP.
>> + * 'Generic' ticket-lock implementation.
>> + *
>> + * It relies on atomic_fetch_add() having well defined forward progress
>> + * guarantees under contention. If your architecture cannot provide this, stick
>> + * to a test-and-set lock.
>> + *
>> + * It also relies on atomic_fetch_add() being safe vs smp_store_release() on a
>> + * sub-word of the value. This is generally true for anything LL/SC although
>> + * you'd be hard pressed to find anything useful in architecture specifications
>> + * about this. If your architecture cannot do this you might be better off with
>> + * a test-and-set.
>> + *
>> + * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
>> + * uses atomic_fetch_add() which is SC to create an RCsc lock.
>> + *
>> + * The implementation uses smp_cond_load_acquire() to spin, so if the
>> + * architecture has WFE like instructions to sleep instead of poll for word
>> + * modifications be sure to implement that (see ARM64 for example).
>> + *
>>   */
>> -#ifdef CONFIG_SMP
>> -#error need an architecture specific asm/spinlock.h
>> -#endif
>>  
>> -#endif /* __ASM_GENERIC_SPINLOCK_H */
>> +#ifndef __ASM_GENERIC_TICKET_LOCK_H
>> +#define __ASM_GENERIC_TICKET_LOCK_H
>> +
>> +#include <linux/atomic.h>
>> +#include <asm-generic/spinlock_types.h>
>> +
>> +static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
>> +{
>> +	u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
>> +	u16 ticket = val >> 16;
>> +
>> +	if (ticket == (u16)val)
>> +		return;
>> +
>> +	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
>
> Looks like my follow comment is missing:
>
> 	https://lore.kernel.org/lkml/YjM+P32I4fENIqGV@boqun-archlinux/
>
> Basically, I suggested that 1) instead of "SC", use "fully-ordered" as
> that's a complete definition in our atomic API ("RCsc" is fine), 2)
> introduce a RCsc atomic_cond_read_acquire() or add a full barrier here
> to make arch_spin_lock() RCsc otherwise arch_spin_lock() is RCsc on
> fastpath but RCpc on slowpath.

Sorry about that, now that you mention it I remember seeing that comment 
but I guess I dropped it somehow -- I've been down a bunch of other 
RISC-V memory model rabbit holes lately, so I guess this just got lost 
in the shuffle.

I'm not really a memory model person, so I'm a bit confused here, but 
IIUC the issue is that there's only an RCpc ordering between the 
store_release that publishes the baker's ticket and the customer's spin 
to obtain a contested lock.  Thus we could see RCpc-legal accesses 
before the atomic_cond_read_acquire().

That's where I get a bit lost: the atomic_fetch_add() is RCsc, so the 
offending accesses are bounded to remain within arch_spin_lock().  I'm 
not sure how that lines up with the LKMM requirements, which I always 
see expressed in terms of the entire lock being RCsc (specifically with 
unlock->lock reordering weirdness, which the fully ordered AMO seems to 
prevent here).

That's kind of just a curiosity, though, so assuming we need some 
stronger ordering here I sort of considered this

    diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
    index ca829fcb9672..bf4e6050b9b2 100644
    --- a/include/asm-generic/spinlock.h
    +++ b/include/asm-generic/spinlock.h
    @@ -14,7 +14,7 @@
      * a test-and-set.
      *
      * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
    - * uses atomic_fetch_add() which is SC to create an RCsc lock.
    + * uses atomic_fetch_add_rcsc() which is RCsc to create an RCsc lock.
      *
      * The implementation uses smp_cond_load_acquire() to spin, so if the
      * architecture has WFE like instructions to sleep instead of poll for word
    @@ -30,13 +30,13 @@
    
     static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
     {
    	u32 val = atomic_fetch_add(1<<16, lock);
     	u16 ticket = val >> 16;
    
     	if (ticket == (u16)val)
     		return;
    
    -	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
    +	atomic_cond_read_rcsc(lock, ticket == (u16)VAL);
     }
    
     static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)

but that smells a bit awkward: it's not really that the access is RCsc, 
it's that the whole lock is, and the RCsc->branch->RCpc is just kind of 
screaming for arch-specific optimizations.  I think we either end up 
with some sort of "atomic_*_for_tspinlock" or a "mb_*_for_tspinlock", 
both of which seem very specific.

That, or we just run with the fence until someone has a concrete way to 
do it faster.  I don't know OpenRISC or C-SKY, but IIUC the full fence 
is free on RISC-V: our smp_cond_read_acquire() only emits read accesses, 
ends in a "fence r,r", and is proceeded by a full smp_mb() from 
atomic_fetch_add().  So I'd lean towards the much simpler

    diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
    index ca829fcb9672..08e3400a104f 100644
    --- a/include/asm-generic/spinlock.h
    +++ b/include/asm-generic/spinlock.h
    @@ -14,7 +14,9 @@
      * a test-and-set.
      *
      * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
    - * uses atomic_fetch_add() which is SC to create an RCsc lock.
    + * uses atomic_fetch_add() which is RCsc to create an RCsc hot path, along with
    + * a full fence after the spin to upgrade the otherwise-RCpc
    + * atomic_cond_read_acquire().
      *
      * The implementation uses smp_cond_load_acquire() to spin, so if the
      * architecture has WFE like instructions to sleep instead of poll for word
    @@ -30,13 +32,22 @@
    
     static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
     {
    -	u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
    +	u32 val = atomic_fetch_add(1<<16, lock);
     	u16 ticket = val >> 16;
    
     	if (ticket == (u16)val)
     		return;
    
    +	/*
    +	 * atomic_cond_read_acquire() is RCpc, but rather than defining a
    +	 * custom cond_read_rcsc() here we just emit a full fence.  We only
    +	 * need the prior reads before subsequent writes ordering from
    +	 * smb_mb(), but as atomic_cond_read_acquire() just emits reads and we
    +	 * have no outstanding writes due to the atomic_fetch_add() the extra
    +	 * orderings are free.
    +	 */
     	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
    +	smp_mb();
     }
    
     static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)

I'm also now worried about trylock, but am too far down this rabbit hole 
to try and figure out how try maps between locks and cmpxchg.  This is 
all way too complicated to squash in, though, so I'll definitely plan on 
a v4.

> Regards,
> Boqun
>
>> +}
>> +
>> +static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
>> +{
>> +	u32 old = atomic_read(lock);
>> +
>> +	if ((old >> 16) != (old & 0xffff))
>> +		return false;
>> +
>> +	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
>> +}
>> +
> [...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
