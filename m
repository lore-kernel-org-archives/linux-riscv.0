Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79967C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOIeA9pknMJZQF9WyxnrJCT1KuDdq87BfRDxXaNx6O0=; b=jgqCgMGaKqjEUZ
	hQ7BNIr2zgG3rlues5BRjmjEDt9eakXL5pN47FPH5IJrz6Ol0RZhvogboyY4MBh1y0FIhcpRXUKSo
	uTjaGJWbV6pVKR98ZBDqrZpbmDbW1lj6gKvMIFwW7ym4cHeWUIloPZ5RT80C3+KYNhfSX3v6I91WG
	qfvF+nJNEv7doI8BByQD2GWSzxwmcYz5f/GFGdBGuwbHl2y67j87v9sYvE/GIochT0GuZd5HPDxSH
	YkvvmVyfKORG8GCWEHtUpr0Ia1WJlFonxsecIjcbE9OUyPReMYFiZNxGRAcONbDXYsT8oUDwolmG/
	ZUtHXkzD4ddkqVuNHtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUuU0-00GxzR-79; Thu, 17 Mar 2022 18:04:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUuTw-00GxyK-TE
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 18:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647540255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOSDI0h0ANr9PEykDMY3nNB9yGsUhPfVjoXSQ0kUYPs=;
 b=UebgmokPtmEiQmvESVMGEijXAjossRMfFJhr5MorrzffvEK7dmAmdbmJGwrlHj4wl0xZ8p
 OjqUhLi4odY+QdPKXdpPWw5rCvz7eCzmKt9MVGPjBfTLwXSdVUi0y2aG2DZQK6vIat3hW/
 X0aXlwoy/VZyca8pXqPCRW0u+nK2ANo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-xxlvuOx6OoCAqTVlvk_owg-1; Thu, 17 Mar 2022 14:04:11 -0400
X-MC-Unique: xxlvuOx6OoCAqTVlvk_owg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0064E85A5BE;
 Thu, 17 Mar 2022 18:04:11 +0000 (UTC)
Received: from [10.22.8.95] (unknown [10.22.8.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DC9FC08092;
 Thu, 17 Mar 2022 18:04:10 +0000 (UTC)
Message-ID: <7d076c5b-a17c-72c0-766f-3ae834264683@redhat.com>
Date: Thu, 17 Mar 2022 14:04:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 peterz@infradead.org
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, boqun.feng@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 jszhang@kernel.org, wangkefeng.wang@huawei.com,
 openrisc@lists.librecores.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-3-palmer@rivosinc.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220316232600.20419-3-palmer@rivosinc.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_110417_066985_A24A6D2E 
X-CRM114-Status: GOOD (  26.33  )
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

On 3/16/22 19:25, Palmer Dabbelt wrote:
> From: Peter Zijlstra <peterz@infradead.org>
>
> This is a simple, fair spinlock.  Specifically it doesn't have all the
> subtle memory model dependencies that qspinlock has, which makes it more
> suitable for simple systems as it is more likely to be correct.
>
> [Palmer: commit text]
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> --
>
> I have specifically not included Peter's SOB on this, as he sent his
> original patch
> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
> without one.
> ---
>   include/asm-generic/ticket-lock-types.h | 11 ++++
>   include/asm-generic/ticket-lock.h       | 86 +++++++++++++++++++++++++
>   2 files changed, 97 insertions(+)
>   create mode 100644 include/asm-generic/ticket-lock-types.h
>   create mode 100644 include/asm-generic/ticket-lock.h
>
> diff --git a/include/asm-generic/ticket-lock-types.h b/include/asm-generic/ticket-lock-types.h
> new file mode 100644
> index 000000000000..829759aedda8
> --- /dev/null
> +++ b/include/asm-generic/ticket-lock-types.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ASM_GENERIC_TICKET_LOCK_TYPES_H
> +#define __ASM_GENERIC_TICKET_LOCK_TYPES_H
> +
> +#include <linux/types.h>
> +typedef atomic_t arch_spinlock_t;
> +
> +#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
> +
> +#endif /* __ASM_GENERIC_TICKET_LOCK_TYPES_H */
> diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
> new file mode 100644
> index 000000000000..3f0d53e21a37
> --- /dev/null
> +++ b/include/asm-generic/ticket-lock.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * 'Generic' ticket-lock implementation.
> + *
> + * It relies on atomic_fetch_add() having well defined forward progress
> + * guarantees under contention. If your architecture cannot provide this, stick
> + * to a test-and-set lock.
> + *
> + * It also relies on atomic_fetch_add() being safe vs smp_store_release() on a
> + * sub-word of the value. This is generally true for anything LL/SC although
> + * you'd be hard pressed to find anything useful in architecture specifications
> + * about this. If your architecture cannot do this you might be better off with
> + * a test-and-set.
> + *
> + * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
> + * uses atomic_fetch_add() which is SC to create an RCsc lock.
> + *
> + * The implementation uses smp_cond_load_acquire() to spin, so if the
> + * architecture has WFE like instructions to sleep instead of poll for word
> + * modifications be sure to implement that (see ARM64 for example).
> + *
> + */
> +
> +#ifndef __ASM_GENERIC_TICKET_LOCK_H
> +#define __ASM_GENERIC_TICKET_LOCK_H
> +
> +#include <linux/atomic.h>
> +#include <asm/ticket-lock-types.h>
> +
> +static __always_inline void ticket_lock(arch_spinlock_t *lock)
> +{
> +	u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
> +	u16 ticket = val >> 16;
> +
> +	if (ticket == (u16)val)
> +		return;
> +
> +	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
> +}
> +
> +static __always_inline bool ticket_trylock(arch_spinlock_t *lock)
> +{
> +	u32 old = atomic_read(lock);
> +
> +	if ((old >> 16) != (old & 0xffff))
> +		return false;
> +
> +	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
> +}
> +
> +static __always_inline void ticket_unlock(arch_spinlock_t *lock)
> +{
> +	u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
> +	u32 val = atomic_read(lock);
> +
> +	smp_store_release(ptr, (u16)val + 1);
> +}
> +
> +static __always_inline int ticket_is_locked(arch_spinlock_t *lock)
> +{
> +	u32 val = atomic_read(lock);
> +
> +	return ((val >> 16) != (val & 0xffff));
> +}
> +
> +static __always_inline int ticket_is_contended(arch_spinlock_t *lock)
> +{
> +	u32 val = atomic_read(lock);
> +
> +	return (s16)((val >> 16) - (val & 0xffff)) > 1;
> +}
> +
> +static __always_inline int ticket_value_unlocked(arch_spinlock_t lock)
> +{
> +	return !ticket_is_locked(&lock);
> +}
> +
> +#define arch_spin_lock(l)		ticket_lock(l)
> +#define arch_spin_trylock(l)		ticket_trylock(l)
> +#define arch_spin_unlock(l)		ticket_unlock(l)
> +#define arch_spin_is_locked(l)		ticket_is_locked(l)
> +#define arch_spin_is_contended(l)	ticket_is_contended(l)
> +#define arch_spin_value_unlocked(l)	ticket_value_unlocked(l)
> +
> +#endif /* __ASM_GENERIC_TICKET_LOCK_H */
Acked-by: Waiman Long <longman@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
