Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE46C0015E
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 02:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xO88KAtIzhHgXmAeHbmK+Gce7BdWDgEJIyyuOnBkji8=; b=wvDg8XULOlcy8y
	kbyfYM5Y9c0xiGOaBwGZK7uRdJ/bpiW82ImY+EhRt7l5DKCbHUyLA3RdJVr9Jf4Zh00qkeE5Llffw
	B9SQpyQjKNGWmu4SKSqq80lU0RneK4FFghYHrPeL2IwCTgcI18CpaZwFF0EalcGCQ455U5Yab8stF
	4G0Txe8VZI/IL4UDL4R1bsg+xgjkaTsOAoC4ohvMUzbvLh1z/uAfaQFthDCWAMN31JjxVIeBFWAcy
	45gTThJEEzWrRu2vzaPbAUeSROI6JAs45zt8F6ehRRWM4uVOEK0GS943/7guzNCG2xJmXTx21AJsG
	aXxSln6O5fcAesMGlz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNOVT-0003xJ-1E;
	Sun, 23 Jul 2023 02:07:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNOVO-0003wC-2t
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 02:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690078047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aolYBVkE3WPKfHj0+foqpR/ODsP1aqUpuEFPF1b8XQI=;
	b=OQFNZHi610QJzqLOMjHmaFyxsTmhsudgF8WDp/r3Y3Mj5BuEvNkb1K37pkFefw3ZFMtJPn
	rGKPdtDWIuDCkJ7ZuoKMqo4FArbR7kedUejoNlz3a/6mSYAnSUmLwe3W/uTatNc+E6ETBR
	c9IyNNCjLub7JDmQ3hvrQHM0IebdEnU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-IHVL0zy_OzWro8RtDRzEQw-1; Sat, 22 Jul 2023 22:07:21 -0400
X-MC-Unique: IHVL0zy_OzWro8RtDRzEQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACC59293248C;
	Sun, 23 Jul 2023 02:07:20 +0000 (UTC)
Received: from [10.22.32.12] (unknown [10.22.32.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E77711121314;
	Sun, 23 Jul 2023 02:07:19 +0000 (UTC)
Message-ID: <0e39d62d-44bc-731e-471e-4df621b4cdd5@redhat.com>
Date: Sat, 22 Jul 2023 22:07:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] asm-generic: ticket-lock: Optimize
 arch_spin_value_unlocked
Content-Language: en-US
To: guoren@kernel.org, David.Laight@ACULAB.COM, will@kernel.org,
 peterz@infradead.org, mingo@redhat.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230719070001.795010-1-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230719070001.795010-1-guoren@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_190731_031482_3AF923F1 
X-CRM114-Status: GOOD (  22.48  )
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

On 7/19/23 03:00, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Using arch_spinlock_is_locked would cause another unnecessary memory
> access to the contended value. Although it won't cause a significant
> performance gap in most architectures, the arch_spin_value_unlocked
> argument contains enough information. Thus, remove unnecessary
> atomic_read in arch_spin_value_unlocked().

AFAICS, only one memory access is needed for the current 
arch_spinlock_is_locked(). So your description isn't quite right. OTOH, 
caller of arch_spin_value_unlocked() could benefit from this change. 
Currently, the only caller is lockref.

Other than that, the patch looks good to me.

Cheers,
Longman

>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: David Laight <David.Laight@ACULAB.COM>
> Cc: Peter Zijlstra <peterz@infradead.org>
> ---
> Changelog:
> This patch is separate from:
> https://lore.kernel.org/linux-riscv/20220808071318.3335746-1-guoren@kernel.org/
>
> Peter & David have commented on it:
> https://lore.kernel.org/linux-riscv/YsK4Z9w0tFtgkni8@hirez.programming.kicks-ass.net/
> ---
>   include/asm-generic/spinlock.h | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> index fdfebcb050f4..90803a826ba0 100644
> --- a/include/asm-generic/spinlock.h
> +++ b/include/asm-generic/spinlock.h
> @@ -68,11 +68,18 @@ static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
>   	smp_store_release(ptr, (u16)val + 1);
>   }
>   
> +static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> +{
> +	u32 val = lock.counter;
> +
> +	return ((val >> 16) == (val & 0xffff));
> +}
> +
>   static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
>   {
> -	u32 val = atomic_read(lock);
> +	arch_spinlock_t val = READ_ONCE(*lock);
>   
> -	return ((val >> 16) != (val & 0xffff));
> +	return !arch_spin_value_unlocked(val);
>   }
>   
>   static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> @@ -82,11 +89,6 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
>   	return (s16)((val >> 16) - (val & 0xffff)) > 1;
>   }
>   
> -static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> -{
> -	return !arch_spin_is_locked(&lock);
> -}
> -
>   #include <asm/qrwlock.h>
>   
>   #endif /* __ASM_GENERIC_SPINLOCK_H */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
