Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A60BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LacG4PBvE2/vAebjI6fLR/oHRB+6pzyylGBJMFWnsZY=; b=jpZHRoF3bL9SXu
	0sza/naFgM6lGnjYLwcEqLdeKuJv35FwHWHiulo+e7jBiA4RrBODAGM4oUcR4mu6h8nv1h4e8Grog
	3ryYiQrWuyMjPJAhvezcfZnA1AikVJu3wr9t4XM7vP6W9EnE1ukTX3AARtJ5PNYzccCKFcZUCh31P
	2k5oCoeNjfpZualOaDSZQTdNQ8JQqBWw3AylYL+qnpLfwxfAM0cV/VGHLegT4KzdH13Az1OYOpyeU
	SZAk6YiN9hUeEN4ThgmRgpqI4lBuU8nvr2NYzi3yKj9yKGUYuWGtV2nrmlxBhfIyJqMMYUE8olOtN
	57xn/Za+412omqJMrkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUrfK-00GZbe-2m; Thu, 17 Mar 2022 15:03:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUrfH-00GZag-CF
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 15:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647529426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aa1jAvfCIcTnLm2lUoV2mmz4eiiaEOLiyUm5zpRdIXk=;
 b=OA6aotsSJ+ExrNOr9YF3BpuAP7Jz89tcEiuAT130v0jSEhAzptpNnw0Efqer5NAuybOswu
 UzH45R9UhPOwQu2SCY8Cqf8t1K6oFZt3pr7CzNO3kXXlVMctEpLbkuO1MHJXsQWKGcLLQc
 N6zc7eSZc0vsy0eNV9oOKRzLxk5bkL0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-1uKE53VaO8eu6i448SukJw-1; Thu, 17 Mar 2022 11:03:43 -0400
X-MC-Unique: 1uKE53VaO8eu6i448SukJw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AF02805A30;
 Thu, 17 Mar 2022 15:03:42 +0000 (UTC)
Received: from [10.22.33.180] (unknown [10.22.33.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98BEC401E6F;
 Thu, 17 Mar 2022 15:03:40 +0000 (UTC)
Message-ID: <364c72a9-64ca-592a-510b-d48a963121aa@redhat.com>
Date: Thu, 17 Mar 2022 11:03:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Content-Language: en-US
To: Boqun Feng <boqun.feng@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 jszhang@kernel.org, wangkefeng.wang@huawei.com,
 openrisc@lists.librecores.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-3-palmer@rivosinc.com>
 <YjM+P32I4fENIqGV@boqun-archlinux>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <YjM+P32I4fENIqGV@boqun-archlinux>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_080347_545050_B07CF14C 
X-CRM114-Status: GOOD (  20.21  )
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

On 3/17/22 09:57, Boqun Feng wrote:
> On Wed, Mar 16, 2022 at 04:25:57PM -0700, Palmer Dabbelt wrote:
>> From: Peter Zijlstra <peterz@infradead.org>
>>
>> This is a simple, fair spinlock.  Specifically it doesn't have all the
>> subtle memory model dependencies that qspinlock has, which makes it more
>> suitable for simple systems as it is more likely to be correct.
>>
>> [Palmer: commit text]
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> --
>>
>> I have specifically not included Peter's SOB on this, as he sent his
>> original patch
>> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
>> without one.
>> ---
>>   include/asm-generic/ticket-lock-types.h | 11 ++++
>>   include/asm-generic/ticket-lock.h       | 86 +++++++++++++++++++++++++
>>   2 files changed, 97 insertions(+)
>>   create mode 100644 include/asm-generic/ticket-lock-types.h
>>   create mode 100644 include/asm-generic/ticket-lock.h
>>
>> diff --git a/include/asm-generic/ticket-lock-types.h b/include/asm-generic/ticket-lock-types.h
>> new file mode 100644
>> index 000000000000..829759aedda8
>> --- /dev/null
>> +++ b/include/asm-generic/ticket-lock-types.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __ASM_GENERIC_TICKET_LOCK_TYPES_H
>> +#define __ASM_GENERIC_TICKET_LOCK_TYPES_H
>> +
>> +#include <linux/types.h>
>> +typedef atomic_t arch_spinlock_t;
>> +
>> +#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
>> +
>> +#endif /* __ASM_GENERIC_TICKET_LOCK_TYPES_H */
>> diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
>> new file mode 100644
>> index 000000000000..3f0d53e21a37
>> --- /dev/null
>> +++ b/include/asm-generic/ticket-lock.h
>> @@ -0,0 +1,86 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +/*
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
> Probably it's better to use "fully-ordered" instead of "SC", because our
> atomic documents never use "SC" or "Sequential Consisteny" to describe
> the semantics, further I'm not sure our "fully-ordered" is equivalent to
> SC, better not cause misunderstanding in the future here.

The terms RCpc, RCsc comes from academia. I believe we can keep this but 
add more comment to elaborate what they are and what do they mean for 
the average kernel engineer.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
