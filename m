Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70975C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 01:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zvrue3hcNG2OEIj8ZbRy/OnCerxamMKb4LySHU7Pz9M=; b=sSa3ZOYRhaGRyC
	QYHO8DdKuZLJgx6fu3vKPrx3gLLPZyLs+u2nNUGkjDtCGhmPqdD+Y3WpEdpHIcR62gsbuSsd/elJl
	mwDWJdrTN3kDqqNBr6cpavAWREyx465vXHXGwCtH41xR0uWPm1wsO8UKm0sDJ+/sdL/cHAWB8x5wJ
	8b8hM3kyI5EKmQcjCG4b+Gvx8K/duUdtJlZaw4U9Pgfu3aeKIgt4knKCyydbKNjB/dsSo6fePTA0t
	TcorqQBdvxTfEBq0w+DrjH2k+tXpRyqUeqaJAucuN7XuiPgB37ghuL7Fksv0mEyCrDEmAyhGjv4hu
	XHGl3AbLYf3n4Hrgt6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Max-008vg0-Kc; Wed, 29 Jun 2022 01:34:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Mau-008vf7-Qd
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 01:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656466455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U29THEbFBBSE3dHo0tAlIpiJYjQVJvLrJOdKIjN45pA=;
	b=JcP+n9yx2YGm0LHCv1jzBoDnIkkpMkvTDRbJqYuUX+0o6pYQYbVVEEDhFzwQu/yCi/B6h8
	8sAIsYy7TSFhFCN2oMnfOORlZ08Q/28Zopgf1l3P1Efbr9UTWA4dLPNdZGjZImX3ALdBP2
	RPT0Xtao/DJVCODwjVP4C2/3loQkH3g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-Fyc77svCMj-0NAgLP-_QpQ-1; Tue, 28 Jun 2022 21:34:12 -0400
X-MC-Unique: Fyc77svCMj-0NAgLP-_QpQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6CBA1C0513A;
	Wed, 29 Jun 2022 01:34:11 +0000 (UTC)
Received: from [10.22.34.187] (unknown [10.22.34.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E343240CF8E4;
	Wed, 29 Jun 2022 01:34:10 +0000 (UTC)
Message-ID: <5166750c-3dc6-9b09-4a1e-cd53141cdde8@redhat.com>
Date: Tue, 28 Jun 2022 21:34:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>
References: <20220628081707.1997728-1-guoren@kernel.org>
 <20220628081707.1997728-5-guoren@kernel.org>
 <09abc75e-2ffb-1ab5-d0fc-1c15c943948d@redhat.com>
 <CAJF2gTQZzOtOsq0DV48Gi76UtBSa+vdY7dLZmoPD_OFUZ0Wbrg@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAJF2gTQZzOtOsq0DV48Gi76UtBSa+vdY7dLZmoPD_OFUZ0Wbrg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_183416_989521_6A59815A 
X-CRM114-Status: GOOD (  23.35  )
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

On 6/28/22 21:17, Guo Ren wrote:
> On Wed, Jun 29, 2022 at 2:13 AM Waiman Long <longman@redhat.com> wrote:
>> On 6/28/22 04:17, guoren@kernel.org wrote:
>>> From: Guo Ren <guoren@linux.alibaba.com>
>>>
>>> Some architecture has a flexible requirement on the type of spinlock.
>>> Some LL/SC architectures of ISA don't force micro-arch to give a strong
>>> forward guarantee. Thus different kinds of memory model micro-arch would
>>> come out in one ISA. The ticket lock is suitable for exclusive monitor
>>> designed LL/SC micro-arch with limited cores and "!NUMA". The
>>> queue-spinlock could deal with NUMA/large-scale scenarios with a strong
>>> forward guarantee designed LL/SC micro-arch.
>>>
>>> So, make the spinlock a combo with feature.
>>>
>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>>> Signed-off-by: Guo Ren <guoren@kernel.org>
>>> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Palmer Dabbelt <palmer@rivosinc.com>
>>> ---
>>>    include/asm-generic/spinlock.h | 43 ++++++++++++++++++++++++++++++++--
>>>    kernel/locking/qspinlock.c     |  2 ++
>>>    2 files changed, 43 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
>>> index f41dc7c2b900..a9b43089bf99 100644
>>> --- a/include/asm-generic/spinlock.h
>>> +++ b/include/asm-generic/spinlock.h
>>> @@ -28,34 +28,73 @@
>>>    #define __ASM_GENERIC_SPINLOCK_H
>>>
>>>    #include <asm-generic/ticket_spinlock.h>
>>> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
>>> +#include <linux/jump_label.h>
>>> +#include <asm-generic/qspinlock.h>
>>> +
>>> +DECLARE_STATIC_KEY_TRUE(use_qspinlock_key);
>>> +#endif
>>> +
>>> +#undef arch_spin_is_locked
>>> +#undef arch_spin_is_contended
>>> +#undef arch_spin_value_unlocked
>>> +#undef arch_spin_lock
>>> +#undef arch_spin_trylock
>>> +#undef arch_spin_unlock
>>>
>>>    static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
>>>    {
>>> -     ticket_spin_lock(lock);
>>> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
>>> +     if (static_branch_likely(&use_qspinlock_key))
>>> +             queued_spin_lock(lock);
>>> +     else
>>> +#endif
>>> +             ticket_spin_lock(lock);
>>>    }
>> Why do you use a static key to control whether to use qspinlock or
>> ticket lock? In the next patch, you have
>>
>> +#if !defined(CONFIG_NUMA) && defined(CONFIG_QUEUED_SPINLOCKS)
>> +       static_branch_disable(&use_qspinlock_key);
>> +#endif
>>
>> So the current config setting determines if qspinlock will be used, not
>> some boot time parameter that user needs to specify. This patch will
>> just add useless code to lock/unlock sites. I don't see any benefit of
>> doing that.
> This is a startup patch for riscv. next, we could let vendors make choices.
> I'm not sure they like cmdline or vendor-specific errata style.
>
> Eventually, we would let one riscv Image support all machines, some
> use ticket-lock, and some use qspinlock.

OK. Maybe you can postpone this combo spinlock until there is a good use 
case for it. Upstream usually don't accept patches that have no good use 
case yet.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
