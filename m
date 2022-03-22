Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B61C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 15:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ql6JzlBWdqT1WTzRNKD1Yrvcw81MuAPXU8PBf8NGawc=; b=LiNiLdihFdU1ib
	T4MiZMo75dG77zo5hvCDhFrC9JGX38AhE85UK8/ZbC10O3saEoKMux1/LIG5S8363EHjSI4rP8tNB
	D9/pVvGtdhNzoe+I1PPYuYQFa6YYPI45pOh8GDWlvwkA2xxnOGRGRfuISgvUcYl8jkH+T70fRL2PO
	z1jl3g8H+IkTl6NStAWR78GgsZoWgpfoD0ovDldQ0m0ZkYTQvgrjr8qqmq6zmEPZH6BitbjeBGNku
	aAW0PBMj8bihMTxRGBh44x3R4tNCewqS+7D/nyxntV8vmthwMpF/tUW15qmxxy/Qd9nWNNttE07wM
	0ViB0JS2Wld6nArOkSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWgqP-00BaRs-GE; Tue, 22 Mar 2022 15:54:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWgqL-00BaQH-KC
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 15:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647964484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhnT3KW2N7nGUFmNkySnEopkUtzZ8brHDUQP8GeFjGo=;
 b=US2MxyWsyB3+4ufCqnt2P8fqB8gOLPFsfnexkcJ1mfI9c3exHdrqAAg1FhvDtfcB8KC13I
 o2nAmzyBVvgD0ImCd4koStkKFqxMkZ4MbWCX6CdV1Iaxs9zP1TnL2RPWZTTK5Y+X2OoB35
 AF2fHf3XkqIl6jgJAXISJx9WEFLG3vY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-j0LrWmyDNnym6QHTL5OVNg-1; Tue, 22 Mar 2022 11:54:39 -0400
X-MC-Unique: j0LrWmyDNnym6QHTL5OVNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F6EE29ABA2E;
 Tue, 22 Mar 2022 15:54:38 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99C5A4229D0;
 Tue, 22 Mar 2022 15:54:37 +0000 (UTC)
Message-ID: <54d6221d-0c4f-9329-042d-4f74c4ea288f@redhat.com>
Date: Tue, 22 Mar 2022 11:54:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OpenRISC] [PATCH V2 1/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, guoren@kernel.org
Cc: palmer@dabbelt.com, arnd@arndb.de, boqun.feng@gmail.com,
 peterz@infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv@lists.infradead.org
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org> <Yjk+LGwhc50zvsk2@antec>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <Yjk+LGwhc50zvsk2@antec>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_085445_755114_6B737F67 
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

On 3/21/22 23:10, Stafford Horne wrote:
> Hello,
>
> There is a problem with this patch on Big Endian machines, see below.
>
> On Sat, Mar 19, 2022 at 11:54:53AM +0800, guoren@kernel.org wrote:
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
>>   include/asm-generic/spinlock.h          | 11 +++-
>>   include/asm-generic/spinlock_types.h    | 15 +++++
>>   include/asm-generic/ticket-lock-types.h | 11 ++++
>>   include/asm-generic/ticket-lock.h       | 86 +++++++++++++++++++++++++
>>   4 files changed, 120 insertions(+), 3 deletions(-)
>>   create mode 100644 include/asm-generic/spinlock_types.h
>>   create mode 100644 include/asm-generic/ticket-lock-types.h
>>   create mode 100644 include/asm-generic/ticket-lock.h
>>
>> diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
>> new file mode 100644
>> index 000000000000..59373de3e32a
>> --- /dev/null
>> +++ b/include/asm-generic/ticket-lock.h
> ...
>
>> +static __always_inline void ticket_unlock(arch_spinlock_t *lock)
>> +{
>> +	u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
> As mentioned, this patch series breaks SMP on OpenRISC.  I traced it to this
> line.  The above `__is_defined(__BIG_ENDIAN)`  does not return 1 as expected
> even on BIG_ENDIAN machines.  This works:
>
>
> diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
> index 59373de3e32a..52b5dc9ffdba 100644
> --- a/include/asm-generic/ticket-lock.h
> +++ b/include/asm-generic/ticket-lock.h
> @@ -26,6 +26,7 @@
>   #define __ASM_GENERIC_TICKET_LOCK_H
>   
>   #include <linux/atomic.h>
> +#include <linux/kconfig.h>
>   #include <asm-generic/ticket-lock-types.h>
>   
>   static __always_inline void ticket_lock(arch_spinlock_t *lock)
> @@ -51,7 +52,7 @@ static __always_inline bool ticket_trylock(arch_spinlock_t *lock)
>   
>   static __always_inline void ticket_unlock(arch_spinlock_t *lock)
>   {
> -       u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
> +       u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
>          u32 val = atomic_read(lock);
>   
>          smp_store_release(ptr, (u16)val + 1);
>
>
>> +	u32 val = atomic_read(lock);
>> +
>> +	smp_store_release(ptr, (u16)val + 1);
>> +}
>> +

__BIG_ENDIAN is defined in <linux/kconfig.h>. I believe that if you 
include <linux/kconfig.h>, the second hunk is not really needed and vice 
versa.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
