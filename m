Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E556AC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 14:10:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 837C7619BA
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 14:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 837C7619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xEBP3Fng/nnTaDDKv5a8QGIjrRBDGHHcxk9I/GdwTgs=; b=YoYvY4Hvdaw11ASRNAqInV/MA
	hvHuFx58XAN0E/nP/6ni6Ru09BTz4qsV6645VVVFgcSNc20KwEPtPv4NlOUh4Jbr7E/Y9Ykjar7N3
	kD1A2u32d3W9/ZwfZ1RASKIjpJDTso0z40Y7eg4utQ72q0EwvaLX2v/natDeoojSDe9XddkD9I65o
	y4iVdQOuZedV/K1qJFYW/UK+PQb+suzm1M/pgfkxA+wnbQLyLjsF6c5HovoQj27Z+ohIdCP2CkCMJ
	EJkNm4kZMkKvY4Wh4lNJLWJIehmHGIFTl3KY66zV4VY3rYzdwigrnAc4JcONiMGS1B8SEtr8KGC+d
	yuL7gkTAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRF4B-003wQk-C5; Tue, 30 Mar 2021 14:09:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRF42-003wNF-5D
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 14:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617113375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjceWuLqxTVqN7nJGF6xvHg+l6EBFWCS4ZdW7zopx+w=;
 b=dLzJampl+ANg7MqeRIQ1PLJDAtYMm2YUxHFytHgCwP3pEkC2rzp4TXMn3fSejqpXD2cNYn
 FYTIgo/Kn847ZItLkaWfa3KzRHLf2Sf8qZJWedFnq0onFoL2X7x1b+LcChj5Yk/FBu/yfZ
 oGFOURpg2Uy3YmEvXSjGhXw6RRoEoC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-KiW6mmzYOV6OSjZf91Aqfg-1; Tue, 30 Mar 2021 10:09:32 -0400
X-MC-Unique: KiW6mmzYOV6OSjZf91Aqfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 903ECDF8A0;
 Tue, 30 Mar 2021 14:09:30 +0000 (UTC)
Received: from llong.remote.csb (ovpn-118-202.rdu2.redhat.com [10.10.118.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE2A35D9CC;
 Tue, 30 Mar 2021 14:09:27 +0000 (UTC)
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Guo Ren <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <4d0dbaa0-1f96-470c-0ed0-04f6827ea384@redhat.com>
Date: Tue, 30 Mar 2021 10:09:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_150950_448075_D4041362 
X-CRM114-Status: GOOD (  25.02  )
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

On 3/29/21 11:13 PM, Guo Ren wrote:
> On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
>> On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
>>> u32 a = 0x55aa66bb;
>>> u16 *ptr = &a;
>>>
>>> CPU0                       CPU1
>>> =========             =========
>>> xchg16(ptr, new)     while(1)
>>>                                      WRITE_ONCE(*(ptr + 1), x);
>>>
>>> When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
>> Then I think your LL/SC is broken.
>>
>> That also means you really don't want to build super complex locking
>> primitives on top, because that live-lock will percolate through.
> Do you mean the below implementation has live-lock risk?
> +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> +{
> +       u32 old, new, val = atomic_read(&lock->val);
> +
> +       for (;;) {
> +               new = (val & _Q_LOCKED_PENDING_MASK) | tail;
> +               old = atomic_cmpxchg(&lock->val, val, new);
> +               if (old == val)
> +                       break;
> +
> +               val = old;
> +       }
> +       return old;
> +}
If there is a continuous stream of incoming spinlock takers, it is 
possible that some cpus may have to wait a long time to set the tail 
right. However, this should only happen on artificial workload. I doubt 
it will happen with real workload or with limit number of cpus.
>
>> Step 1 would be to get your architecute fixed such that it can provide
>> fwd progress guarantees for LL/SC. Otherwise there's absolutely no point
>> in building complex systems with it.
> Quote Waiman's comment [1] on xchg16 optimization:
>
> "This optimization is needed to make the qspinlock achieve performance
> parity with ticket spinlock at light load."
>
> [1] https://lore.kernel.org/kvm/1429901803-29771-6-git-send-email-Waiman.Long@hp.com/
>
> So for a non-xhg16 machine:
>   - ticket-lock for small numbers of CPUs
>   - qspinlock for large numbers of CPUs
>
> Okay, I'll put all of them into the next patch :P
>
It is true that qspinlock may not offer much advantage when the number 
of cpus is small. It shines for systems with many cpus. You may use 
NR_CPUS to determine if the default should be ticket or qspinlock with 
user override. To determine the right NR_CPUS threshold, you may need to 
run on real SMP RISCV systems to find out.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
