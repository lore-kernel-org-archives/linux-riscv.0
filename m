Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5C9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3L3RGi0vZD0o5DfpbZMwY1uCv/z+A9DGJdlt2ETToKo=; b=GPlGm6k1rUmdVl
	7R2so/tgvkQRu9tcLs0/9sRmstF9XUxUCRpxHobCiP9Paw3VoSlyyGfX/laTXw4iblQYP30JnENmb
	25nD4ipEOcsPP73ZdIMXIjdqu9RGJgODwpJomh9q5T9qVGw96f/oRA4HprfLsEQkmrXyimzR0yRUe
	2KIrAPiHvcIZ3ZLQ89OgXTSYCk/7j8UyMedXGnU/W183XFTzpttzn1mHKVYOfQSd6Dp9t9X5f5pbL
	yBmL9B8zLzCZSJm2s5kWYolapacX3vWyygSSMRf4u/khgFvu6rfBQkVjYQxdcp4ermQ8dPSSK4OwF
	p34/lojiPNssNja8C5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6FbX-007Xvz-0i; Tue, 28 Jun 2022 18:06:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Fb9-007XjF-Gg
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 18:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656439562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GEsiZ5pfkbMA5kewtyoQDVS/PBlIbuW5xmHg+1qqHA=;
	b=NxlhNEo+DvzBcRBIHIipeW3mKrZuTxRkZW/NHIYkE8woSXSJNEzytxPzjUqnbYOsJk1dSk
	V5Q41eRpPwsfWQ11CUrepT3FIfBGf2G3u27nPaKW/Y7im+wldOA6I3PKaenWuLgxqlFbwh
	2J/Joju2mYL/UQEvEC7CcSQngwYDTz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-oUIR4xKhNb2y20GilZVQww-1; Tue, 28 Jun 2022 14:05:56 -0400
X-MC-Unique: oUIR4xKhNb2y20GilZVQww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4018389B841;
	Tue, 28 Jun 2022 18:05:56 +0000 (UTC)
Received: from [10.22.34.187] (unknown [10.22.34.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC80140334D;
	Tue, 28 Jun 2022 18:05:55 +0000 (UTC)
Message-ID: <218522c9-97b9-7659-ce31-2dbc4b0c6a60@redhat.com>
Date: Tue, 28 Jun 2022 14:05:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V7 1/5] asm-generic: ticket-lock: Remove unnecessary
 atomic_read
Content-Language: en-US
To: guoren@kernel.org, palmer@rivosinc.com, arnd@arndb.de, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20220628081707.1997728-1-guoren@kernel.org>
 <20220628081707.1997728-2-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220628081707.1997728-2-guoren@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_110603_731023_B2989D4F 
X-CRM114-Status: GOOD (  20.08  )
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
> Remove unnecessary atomic_read in arch_spin_value_unlocked(lock),
> because the value has been in lock. This patch could prevent
> arch_spin_value_unlocked contend spin_lock data again.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   include/asm-generic/spinlock.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> index fdfebcb050f4..f1e4fa100f5a 100644
> --- a/include/asm-generic/spinlock.h
> +++ b/include/asm-generic/spinlock.h
> @@ -84,7 +84,9 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
>   
>   static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
>   {
> -	return !arch_spin_is_locked(&lock);
> +	u32 val = lock.counter;
> +
> +	return ((val >> 16) == (val & 0xffff));
>   }
>   
>   #include <asm/qrwlock.h>

lockref.c is the only current user of arch_spin_value_unlocked(). This 
change is probably OK with this particular use case. Do you have any 
performance data about the improvement due to this change?

You may have to document that we have to revisit that if another use 
case shows up.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
