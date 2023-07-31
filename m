Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42598C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/yr17Q9t9sBHBRsXhnWfpReNlazBM/ATxhJAm3jgmI=; b=aoW6DzdTDgwK3t
	o5EVBbccb/ET9aw4gpU4ahAGVtpaHzjNuzHJLjzmsIIP5B6DYJzrpYHgMYlxLa5BmKAiITXfx//Rt
	WrBe/doMt6MKtgDorXx7qz9R4RdAtT9sEJDONqyfsfCh8LgYJyjpZmM13EAbB9COkkiPdy83Kj0U8
	CvnTx1Eniuse6U1dMXwW2buetbsL8N/UBhluKhCEFOdIJe4jMSUGbZMUENvp87m2X1kAE6vxMMcdT
	WzYpIYWxECFtIVx5n2huyObX7JQFuH4fHLHmH1GmWImb23vnpORBWE7cFcFYEuP7K3lWCH0g0+vGg
	ky0RMvQ+cREbb1VmzAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUdb-00GKjW-29;
	Mon, 31 Jul 2023 15:16:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUdY-00GKik-27
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 15:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690816602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YrcN1VyVujE5NV1Jsx3JBmyoizH+WJVWnxVoH1kYdAE=;
	b=hOBzU8op/QojWH8wanvziLM0xsx0XZKgWfYbY/HJNTMRM+LNXXFpB2TjZV4HNz+H7JX0h1
	CLGHS7AwKuaImrH6zr7Qp8o6SyNqGyVfLTb3wUw1UHrKBXU6381ils6wZDwpqIEXHhUMD8
	XJBl4hj/T8Cy6nKhG8xJ2NkmGECYtuM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-B6tkADYpOJuBdZ0urqYKvg-1; Mon, 31 Jul 2023 11:16:35 -0400
X-MC-Unique: B6tkADYpOJuBdZ0urqYKvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDE17185A794;
	Mon, 31 Jul 2023 15:16:34 +0000 (UTC)
Received: from [10.22.10.62] (unknown [10.22.10.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DDCBC57965;
	Mon, 31 Jul 2023 15:16:34 +0000 (UTC)
Message-ID: <c603e7f1-a562-6826-1c86-995c8127abee@redhat.com>
Date: Mon, 31 Jul 2023 11:16:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2] asm-generic: ticket-lock: Optimize
 arch_spin_value_unlocked
Content-Language: en-US
To: guoren@kernel.org, David.Laight@ACULAB.COM, will@kernel.org,
 peterz@infradead.org, mingo@redhat.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230731023308.3748432-1-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230731023308.3748432-1-guoren@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_081644_793738_9A604EDA 
X-CRM114-Status: GOOD (  23.68  )
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

On 7/30/23 22:33, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The arch_spin_value_unlocked would cause an unnecessary memory
> access to the contended value. Although it won't cause a significant
> performance gap in most architectures, the arch_spin_value_unlocked
> argument contains enough information. Thus, remove unnecessary
> atomic_read in arch_spin_value_unlocked().
>
> The caller of arch_spin_value_unlocked() could benefit from this
> change. Currently, the only caller is lockref.
>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: David Laight <David.Laight@ACULAB.COM>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
> Changelog
> V2:
>   - Fixup commit log with Waiman advice.
>   - Add Waiman comment in the commit msg.
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

I am fine with the current change. However, modern optimizing compiler 
should be able to avoid the redundant memory read anyway. So this patch 
may not have an impact from the performance point of view.

Acked-by: Waiman Long <longman@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
