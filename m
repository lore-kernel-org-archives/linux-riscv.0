Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB69C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 21:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anlwiXvD3mkq4wjQ+fYwBrvobStqxo/6wIRuh3Wpdv0=; b=kWLXOyw33Zw/4x
	5BFvA3FGttckKxYKIGsWhVBq8Q2XcKb29g/3G+QsFFKjWZ8ER9xcTSpLs+Thc4F0b/DZai5XUCHoR
	vz7cTYQvBAoLQdI5tKd3a/HBU5SpAswefG7N5FyP6wV9ZsGxphJ2yLXdogmw1nwU/6wb1fksd/bqT
	QCaOZ76h4Ac1hJoJG8WAPxu0NeOYbBtKofGKZ4aGduM38XGDgD29laBk/7vcftfW3BJKxLKF1uHQt
	7TzN8FohFkpDKoGww48WynKgotm/Xpn0gILxElssTP0sPYdYqp4jHhfV/Cb7E8WSYHEEYt8dnZBaT
	9OWi+oQk12vsIH7XPtPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWlzH-00CC60-Rl; Tue, 22 Mar 2022 21:24:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWlzE-00CC58-2i
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 21:24:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id k6so9406765plg.12
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=smcMNtPmLrvW3obf9/lvoxOGntQ5a1cRgfHcEKCDMYQ=;
 b=K7xzYF8GGADM1dGe1u3dawumyKFuxXhm8gsMXUYihcj/CC3Mr+5DPgd7ThgSARJ7eT
 7gUsURgLZ8zJ4feNVeNlcVggtUkmFld9dB8BrIYyAEsNB2Nmzx20bfsSlTrHZtS9TdEb
 eYrAA5Yzulcaxz8dJqBZUuXqbHVitnvpWyTKzyHyXv9Wrnh1WXEwXykPTDd+uzJTWPUI
 XbU8fSC1PR5YKB3Vkfz+zlZ6zrPmLC0BSH+LLBXbcwELTVnS4n06gS/m/yzrWRQvTWK8
 2Qz8RAiFUlYkv2o6r4QyDU1VLGkuMFiKK6mLUAzTw6ZGZRiTO1ew8nZBpMzkvx+Gi270
 C8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=smcMNtPmLrvW3obf9/lvoxOGntQ5a1cRgfHcEKCDMYQ=;
 b=kpmAROtOiuql9/HGdXyHxt1wTQ9RK/OheTKVyXvFH32hanSttFXLCSmujrz4syHjYR
 suuyJlcwW0DgLgMdWcFJ0d0O1U4t7+U0EsThyRKze57dhdjl0lvpPQkPxk7ROCLlyd6O
 4V5j6JbTEkadMLNcuJ8W5AZzwDEMenKbAGszekf1ADG8hp7tMlNLLSn4Gn6cXJMJw3aJ
 4xN+0mnkueNNfLGiNSvKJpLJAG2Rc43pu2U31jtliIe1w71jzwwGi9tpnEWZB3aesEv2
 oydHeqdV/oW0JsyCqz92oEodKrJd23NUbulNfkfY7iNBAH9/24w6Yk3JzO74sgMFJbfd
 GSFw==
X-Gm-Message-State: AOAM532dUXTGZJJtt+c3oBWVRKPWIrRLxivLXkF2dP7D/3fktwa242sz
 qbZRSVZfzU9mmKgu4QUHzL4=
X-Google-Smtp-Source: ABdhPJw3rpUnT9Uhs4arrNEsThw7W+kKy3Bat5Cm7YrweHtDO5SeSR+xbwrRfrJXVXYfH74lueseXg==
X-Received: by 2002:a17:902:7204:b0:153:bffb:f348 with SMTP id
 ba4-20020a170902720400b00153bffbf348mr20013263plb.147.1647984249558; 
 Tue, 22 Mar 2022 14:24:09 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a056a00138a00b004fa9c9fda44sm9534780pfg.89.2022.03.22.14.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 14:24:08 -0700 (PDT)
Date: Wed, 23 Mar 2022 06:24:06 +0900
From: Stafford Horne <shorne@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 boqun.feng@gmail.com, peterz@infradead.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [OpenRISC] [PATCH V2 1/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
Message-ID: <Yjo+dj7qLQZtkdxs@antec>
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org>
 <Yjk+LGwhc50zvsk2@antec>
 <54d6221d-0c4f-9329-042d-4f74c4ea288f@redhat.com>
 <Yjo6bI+DWolVT/bQ@antec>
 <cbf542d9-d3d4-9de8-5a96-4d5fcea69f6a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbf542d9-d3d4-9de8-5a96-4d5fcea69f6a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_142416_134187_E90CC878 
X-CRM114-Status: GOOD (  37.33  )
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

On Tue, Mar 22, 2022 at 05:14:05PM -0400, Waiman Long wrote:
> On 3/22/22 17:06, Stafford Horne wrote:
> > On Tue, Mar 22, 2022 at 11:54:37AM -0400, Waiman Long wrote:
> > > On 3/21/22 23:10, Stafford Horne wrote:
> > > > Hello,
> > > > 
> > > > There is a problem with this patch on Big Endian machines, see below.
> > > > 
> > > > On Sat, Mar 19, 2022 at 11:54:53AM +0800, guoren@kernel.org wrote:
> > > > > From: Peter Zijlstra <peterz@infradead.org>
> > > > > 
> > > > > This is a simple, fair spinlock.  Specifically it doesn't have all the
> > > > > subtle memory model dependencies that qspinlock has, which makes it more
> > > > > suitable for simple systems as it is more likely to be correct.
> > > > > 
> > > > > [Palmer: commit text]
> > > > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > > 
> > > > > --
> > > > > 
> > > > > I have specifically not included Peter's SOB on this, as he sent his
> > > > > original patch
> > > > > <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
> > > > > without one.
> > > > > ---
> > > > >    include/asm-generic/spinlock.h          | 11 +++-
> > > > >    include/asm-generic/spinlock_types.h    | 15 +++++
> > > > >    include/asm-generic/ticket-lock-types.h | 11 ++++
> > > > >    include/asm-generic/ticket-lock.h       | 86 +++++++++++++++++++++++++
> > > > >    4 files changed, 120 insertions(+), 3 deletions(-)
> > > > >    create mode 100644 include/asm-generic/spinlock_types.h
> > > > >    create mode 100644 include/asm-generic/ticket-lock-types.h
> > > > >    create mode 100644 include/asm-generic/ticket-lock.h
> > > > > 
> > > > > diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
> > > > > new file mode 100644
> > > > > index 000000000000..59373de3e32a
> > > > > --- /dev/null
> > > > > +++ b/include/asm-generic/ticket-lock.h
> > > > ...
> > > > 
> > > > > +static __always_inline void ticket_unlock(arch_spinlock_t *lock)
> > > > > +{
> > > > > +	u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
> > > > As mentioned, this patch series breaks SMP on OpenRISC.  I traced it to this
> > > > line.  The above `__is_defined(__BIG_ENDIAN)`  does not return 1 as expected
> > > > even on BIG_ENDIAN machines.  This works:
> > > > 
> > > > 
> > > > diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
> > > > index 59373de3e32a..52b5dc9ffdba 100644
> > > > --- a/include/asm-generic/ticket-lock.h
> > > > +++ b/include/asm-generic/ticket-lock.h
> > > > @@ -26,6 +26,7 @@
> > > >    #define __ASM_GENERIC_TICKET_LOCK_H
> > > >    #include <linux/atomic.h>
> > > > +#include <linux/kconfig.h>
> > > >    #include <asm-generic/ticket-lock-types.h>
> > > >    static __always_inline void ticket_lock(arch_spinlock_t *lock)
> > > > @@ -51,7 +52,7 @@ static __always_inline bool ticket_trylock(arch_spinlock_t *lock)
> > > >    static __always_inline void ticket_unlock(arch_spinlock_t *lock)
> > > >    {
> > > > -       u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
> > > > +       u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
> > > >           u32 val = atomic_read(lock);
> > > >           smp_store_release(ptr, (u16)val + 1);
> > > > 
> > > > 
> > > > > +	u32 val = atomic_read(lock);
> > > > > +
> > > > > +	smp_store_release(ptr, (u16)val + 1);
> > > > > +}
> > > > > +
> > > __BIG_ENDIAN is defined in <linux/kconfig.h>. I believe that if you include
> > > <linux/kconfig.h>, the second hunk is not really needed and vice versa.
> > I thought so too, but it doesn't seem to work.  I think __is_defined is not
> > doing what we think in this context.  It looks like __is_defined works when a
> > macro is defined as 1, in this case we have __BIG_ENDIAN 4321.
> 
> You are right. __is_defined() only for 1 or not 1. So it can't be used for
> __BIG_ENDIAN.
> 
> I was not aware of that. Anyway, the <linux/kconfig.h> include is not really
> needed then.

Since we use IS_ENABLED which is defined in <linux/kconfig.h> I thought its best
to include it.  However, it seems the requirement for explicit includes differs
from subsystem to subsystem.

Whoever picks up this patch for the series can drop the include.  I confirm it
works even if we drop the include.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
