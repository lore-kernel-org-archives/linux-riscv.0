Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6A6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imfnL4peiXp/byicJ11S1rJbY+Pq3W4NTt35gWFBAF0=; b=p25sjgwaTUZcm5
	rgIZ9Ve8xbebAtwxtTzVajOUkeeruxZwFuo/uxMD1jUeAGz36psCF7a1eDG1oMUoGhI55Gi9Jja37
	D2gMDOYm0rUxXit54+7yHX5gEhG6fimh4ro6F7+UimPFPYCREOvtxBhN29XbjYH7CaLEARvAmN6mG
	VCKbDl3kPB4TGj6IirJ6txTQKnUTSrSXVgEVlyPa6dpVdjegLrOFbXq1ycW9bFNOJlwgcJgvfEJTU
	GxgMYtUAoOVKRsVXIIJdZV6YmstCbp++9h8iyg8AmaNCumKmMsbf6mX//SJsnx7cwL4LmzHxLI2Gd
	guuVCT19o5mRn5E30uGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUqdZ-00GLl7-K3; Thu, 17 Mar 2022 13:57:57 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUqdS-00GLi2-R3
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 13:57:54 +0000
Received: by mail-qv1-xf31.google.com with SMTP id jx8so4261383qvb.2
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HCmuhQ6s6tt0FGCLG6Zs37dId8oeyaYezlZrL3+4Rac=;
 b=WHN8L6Dz6qHEVN7c1MME0o8oUYcD7MHTJjPSwGnh3QwgPqpe2lTI+TowwwIZ8evnDy
 +Y6jM4vtI0MAzBCalnoPGqXOa8LfKI+FZHXQ4CJWXK7XBhqUcRHR1DBGf334ZsLYi/0n
 /44XBBt6ylk44ExoVgxyrkSVU4NQ5XDOEWH024jEWOs+5Hd0uDelHCwHtW8YtJEFXKij
 5Nf7Lu3ZOj4ZIph/h8lvGz2f9BldPteH4dgJoRg1e+9LwNt4Y/4bfd1yoTB3c5CNWtVC
 caWo+Kv2MVSaEnQQYT3NE69fOUdYmsdXK2Y+m6tcJeeRhJYJ5Nmo5vvpkcwzG7MB+7e+
 qDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HCmuhQ6s6tt0FGCLG6Zs37dId8oeyaYezlZrL3+4Rac=;
 b=v/FWM00PfN/IFGg/gAfp5SfcrL3UJaIX5M5yx2RXYJ/G1DDSdjprJ2wFD3bjNkdsvN
 ZfvmVbuhQWudhQvLaU09bNr5k+mKzpfZWB5bi2MK1qr566ghC3/+EgcRJqd9RFnOeq9l
 Z3QFx1roR1LMpbsvd6YzKur8IgBPhIOQa8uGF/MWKuPncl9+I0ZfnLGKJq0rCyBNVngY
 Yz0pjpM0cLEq2Od2FQvgTgVJmhUNNrqPALvFPHr1rAYfyTDZvPfDlt1tPwkwDaSSNonA
 5zE17NXvsX0A8cwPeuPkoCrB3EfTjexI6UYMzbu8qGrAGRiIIJJP1+J8tJnMU5tZPNad
 LpDg==
X-Gm-Message-State: AOAM530OOuzEcCcL4oExfMAtzoJLkFTVbpBCg3WMff4cNklptAV3wQVI
 Hs5tPaK7QVfLgYLy2wcyYYE=
X-Google-Smtp-Source: ABdhPJx6la4fCOcaKSIYmxORgMpzedHfz9h56JkZ22r6EPWN6M478pz9nMtvpq8X70BVd29vmyPjfw==
X-Received: by 2002:a0c:fdeb:0:b0:432:9472:1887 with SMTP id
 m11-20020a0cfdeb000000b0043294721887mr3534650qvu.117.1647525468416; 
 Thu, 17 Mar 2022 06:57:48 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227]) by smtp.gmail.com with ESMTPSA id
 j18-20020ac85c52000000b002e1b9897ae7sm3574988qtj.10.2022.03.17.06.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 06:57:47 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 2592A27C0054;
 Thu, 17 Mar 2022 09:57:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Mar 2022 09:57:46 -0400
X-ME-Sender: <xms:WT4zYu9CYxCKDLwmFWjw-60Ldy2Mqrz0staHmy1D5JIErYPOC7tX_g>
 <xme:WT4zYutVsGaUeOaHLukXJZX7P5gLXyKgfqXVT_82kIWJrwwqzYKJCrRbEHu1v04PF
 HRICCyNFvyNeASfBA>
X-ME-Received: <xmr:WT4zYkAPShxrIy4UiJHcGyiSCosbetYOS3aPuGHjasz-gOFCPDdWQX9N1SLQmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepveeijedthfeijeefudehhedvveegudegteehgffgtddvuedtveegtedvvdef
 gedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
 vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
 hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:WT4zYmdqH2ng3ZSlhX3dzDmIRmbBuURYqxZNyLYNVOCCMLzZb5-ehg>
 <xmx:WT4zYjOcMKFy6-fvyVYiq41T5TcLgeOY51LuKpBrWD0rK9dZNE1ZWw>
 <xmx:WT4zYgnw8gclo8e4Q_Vu6XG3tJLKAKKgry4YGpR-ceFG9u2mnxHyfA>
 <xmx:WT4zYswBUkv_8kr9rNaVlG1j5MFHF136-lW8PxOdQHxNaAO0AeJzZjOhbRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Mar 2022 09:57:44 -0400 (EDT)
Date: Thu, 17 Mar 2022 21:57:19 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
 shorne@gmail.com, mingo@redhat.com, Will Deacon <will@kernel.org>,
 longman@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Message-ID: <YjM+P32I4fENIqGV@boqun-archlinux>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-3-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316232600.20419-3-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_065750_944231_31A84E3B 
X-CRM114-Status: GOOD (  25.93  )
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

On Wed, Mar 16, 2022 at 04:25:57PM -0700, Palmer Dabbelt wrote:
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
>  include/asm-generic/ticket-lock-types.h | 11 ++++
>  include/asm-generic/ticket-lock.h       | 86 +++++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 include/asm-generic/ticket-lock-types.h
>  create mode 100644 include/asm-generic/ticket-lock.h
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

Probably it's better to use "fully-ordered" instead of "SC", because our
atomic documents never use "SC" or "Sequential Consisteny" to describe
the semantics, further I'm not sure our "fully-ordered" is equivalent to
SC, better not cause misunderstanding in the future here.

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

If you want to make the lock RCsc, you will also need to make the above
atomic_cond_read_acquire() a RCsc acquire, now it's only RCpc.

Regards,
Boqun

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
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
