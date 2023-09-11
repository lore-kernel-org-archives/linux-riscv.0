Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E64EE49A4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 02:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0WfngFMaq2QHEjfLChMxW5URHvNw9Pds+cXD+MPp8U=; b=QK0e5TyuE+ZyeZ
	69fJqI3IFKcjm7jvrvHQHNpoXCewQDLDILQtPVpfSvRA79jI4dFd9FwqduI7ZVH5zOwrl+XtVf+1b
	FSbaxF6Ps16KjWQs3ekfHOXz5gsdquvHkhonXbg4DEUvzB3do5wWM50jNH5ZuRL7n8+E6rAf4U/Yx
	ED8XkFXj/owNo5GwJ3KpGqJdZd4VIuil33R361BeTaYqzmQatWQgdpfvr+oZRTbxayQjvH/tIfQly
	gYgfBs3Dsu8MB22MLo5c1N4wLVM8DUa0iS53vzqYqU4MnoIhFoplMQTYMKzzfMBMZozcYNQRpCxgD
	YNSD9H3DwdeaNMvbLhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWlx-00H6de-2D;
	Mon, 11 Sep 2023 02:35:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWlt-00H6cS-2L
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 02:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694399726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JiEAacOPpZr8Csa8+TL/orlrtaJ6UeA2+KsyYOTzfY=;
	b=eGzROJLhzzNLVlPKBd2o1R6Iv4KJ89lYR8fdNh2U5GDKuRT0wbOXMdapLHotf72USvk0Uj
	SFyPD1KvoP5JQh37ecxI0Sf4jdR1DzRP/rLrCBn4zRb+zqoVGW8kj/XgChfP8Mg+aipbLT
	+XjJFZjptmmNYTAmQmMaiF+hWV66A24=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-azuA0cncMTqSkMKdZMqhhg-1; Sun, 10 Sep 2023 22:35:22 -0400
X-MC-Unique: azuA0cncMTqSkMKdZMqhhg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90084101FAA8;
	Mon, 11 Sep 2023 02:35:21 +0000 (UTC)
Received: from [10.22.8.52] (unknown [10.22.8.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5531549310E;
	Mon, 11 Sep 2023 02:35:19 +0000 (UTC)
Message-ID: <f091ead0-99b9-b30a-a295-730ce321ac60@redhat.com>
Date: Sun, 10 Sep 2023 22:35:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V11 04/17] locking/qspinlock: Improve xchg_tail for number
 of cpus >= 16k
Content-Language: en-US
To: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 palmer@rivosinc.com, boqun.feng@gmail.com, tglx@linutronix.de,
 paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
 catalin.marinas@arm.com, conor.dooley@microchip.com,
 xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com,
 keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com,
 jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
 leobras@redhat.com
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-5-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230910082911.3378782-5-guoren@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_193529_864804_FA6969CF 
X-CRM114-Status: GOOD (  19.21  )
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


On 9/10/23 04:28, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The target of xchg_tail is to write the tail to the lock value, so
> adding prefetchw could help the next cmpxchg step, which may
> decrease the cmpxchg retry loops of xchg_tail. Some processors may
> utilize this feature to give a forward guarantee, e.g., RISC-V
> XuanTie processors would block the snoop channel & irq for several
> cycles when prefetch.w instruction (from Zicbop extension) retired,
> which guarantees the next cmpxchg succeeds.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   kernel/locking/qspinlock.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
> index d3f99060b60f..96b54e2ade86 100644
> --- a/kernel/locking/qspinlock.c
> +++ b/kernel/locking/qspinlock.c
> @@ -223,7 +223,10 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
>    */
>   static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
>   {
> -	u32 old, new, val = atomic_read(&lock->val);
> +	u32 old, new, val;
> +
> +	prefetchw(&lock->val);
> +	val = atomic_read(&lock->val);
>   
>   	for (;;) {
>   		new = (val & _Q_LOCKED_PENDING_MASK) | tail;

That looks a bit weird. You pre-fetch and then immediately read it. How 
much performance gain you get by this change alone?

Maybe you can define an arch specific primitive that default back to 
atomic_read() if not defined.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
