Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A6DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 18:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pr+lhoMXrxF8JL3jeRDdxqPrhp6GdkHaGjFQbCva48=; b=XQElUlajI50dt6
	sL72ZIF9lCuIdR/e5rGhsqONCv1u4HDcQLaG/lqLkV3ADepJguqo+BH1uLZ5Ni+0BxbdPAUeKAkSr
	KAxaREmcSiq7gdidzFNbbrEE7bSOkGiWxYWoz+Fu1U+K4Un9/wEcpotOdXcdnf0ctfuvjCzFMpez6
	/604qcX+2LLEkn3fz35klLDHd1TVU+p5+yyOtvKzPSA/qCIG6sqDxSgMEM3l6uyVxOYghEqhavBOv
	er07cbm53ZBRYcplRM9OFF44UEBJ6lbOQQw100JKr3dKWut7Y9uyD97cXXzg5l7m60xsB7THHzYkz
	cZQz3kV0lHyi7rJL8iRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Fie-007aCB-Ud; Tue, 28 Jun 2022 18:13:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Fib-007aBF-Nw
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 18:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656440024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BCsO+VHWvi/xygeTHehRQRa8L5qzqJMKZwPbHoiNY8A=;
	b=cBYdotTo1N8uURC2AHU6LRfuXC9tMmucNeqnTK9IDDolYm8AcWBW96XLTq6efFnaVLihKP
	1FwFzfg34GBBYAOmg/P3nWFeOcJ39dfq0JU+R5oncpkFccJQAEhpEJhsY62J+FaRh3Tkuz
	s8ey3WQJFUghBwKjHOx7Ywd0BcgmD5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-z1c1mbwEPzysVN0r0myy4Q-1; Tue, 28 Jun 2022 14:13:41 -0400
X-MC-Unique: z1c1mbwEPzysVN0r0myy4Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B543801233;
	Tue, 28 Jun 2022 18:13:40 +0000 (UTC)
Received: from [10.22.34.187] (unknown [10.22.34.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 170E4492CA3;
	Tue, 28 Jun 2022 18:13:40 +0000 (UTC)
Message-ID: <09abc75e-2ffb-1ab5-d0fc-1c15c943948d@redhat.com>
Date: Tue, 28 Jun 2022 14:13:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
Content-Language: en-US
To: guoren@kernel.org, palmer@rivosinc.com, arnd@arndb.de, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20220628081707.1997728-1-guoren@kernel.org>
 <20220628081707.1997728-5-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220628081707.1997728-5-guoren@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_111345_909634_835E95EF 
X-CRM114-Status: GOOD (  21.76  )
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

On 6/28/22 04:17, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Some architecture has a flexible requirement on the type of spinlock.
> Some LL/SC architectures of ISA don't force micro-arch to give a strong
> forward guarantee. Thus different kinds of memory model micro-arch would
> come out in one ISA. The ticket lock is suitable for exclusive monitor
> designed LL/SC micro-arch with limited cores and "!NUMA". The
> queue-spinlock could deal with NUMA/large-scale scenarios with a strong
> forward guarantee designed LL/SC micro-arch.
>
> So, make the spinlock a combo with feature.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   include/asm-generic/spinlock.h | 43 ++++++++++++++++++++++++++++++++--
>   kernel/locking/qspinlock.c     |  2 ++
>   2 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> index f41dc7c2b900..a9b43089bf99 100644
> --- a/include/asm-generic/spinlock.h
> +++ b/include/asm-generic/spinlock.h
> @@ -28,34 +28,73 @@
>   #define __ASM_GENERIC_SPINLOCK_H
>   
>   #include <asm-generic/ticket_spinlock.h>
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +#include <linux/jump_label.h>
> +#include <asm-generic/qspinlock.h>
> +
> +DECLARE_STATIC_KEY_TRUE(use_qspinlock_key);
> +#endif
> +
> +#undef arch_spin_is_locked
> +#undef arch_spin_is_contended
> +#undef arch_spin_value_unlocked
> +#undef arch_spin_lock
> +#undef arch_spin_trylock
> +#undef arch_spin_unlock
>   
>   static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
>   {
> -	ticket_spin_lock(lock);
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +	if (static_branch_likely(&use_qspinlock_key))
> +		queued_spin_lock(lock);
> +	else
> +#endif
> +		ticket_spin_lock(lock);
>   }

Why do you use a static key to control whether to use qspinlock or 
ticket lock? In the next patch, you have

+#if !defined(CONFIG_NUMA) && defined(CONFIG_QUEUED_SPINLOCKS)
+	static_branch_disable(&use_qspinlock_key);
+#endif

So the current config setting determines if qspinlock will be used, not 
some boot time parameter that user needs to specify. This patch will 
just add useless code to lock/unlock sites. I don't see any benefit of 
doing that.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
