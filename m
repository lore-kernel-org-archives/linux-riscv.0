Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7866C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 03:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVmE5vLzNA+qqYbHVwDvG1gkf0+9TYyQdTPokpKIklk=; b=iETj79HUcE2UeT
	9Xj5r0yvaFf/+Cv5+0QlzjEx571vACj+Oa1Zstfm4BtZoBapubzpC5UYk+yEUfkI0ac7Zd5mzQWOL
	YRvdYa/s8WvTw6jD5dYee9cjjB+3yVEAc6PhGO6dFOh7ki6FaajEjPmEcAdTaISmE0XTTkoJzhbyG
	dXrLzQvOhXYGdeTTj5a/P2oD3J3bZVDEqzDwT5/94M6CqKdFwBgSi727G8khp4tnIbIWxBKwy1dXM
	l51krKZqY0sJ1HhIw6ImUzzzUXV40CD9XxuwcGK+AzUGJBMbyjWFeXRj2Louqk+xE9yaV8zruH0dw
	mU9Jf6Me4vRE3uaAnMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUv0-009qXY-M9; Tue, 22 Mar 2022 03:10:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUuw-009qWI-7d
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 03:10:44 +0000
Received: by mail-pj1-x1033.google.com with SMTP id bx5so14577780pjb.3
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hh+l+cDJOH+rmHGFl5Z8Zd7K4dLUYHJocdz9v2HO6zA=;
 b=DjtmHKskX4TxeKbVb7A93JrGp2xt18gLwaV/CfU6iNuYFEdrAE1RP9ngjSmWlQq13X
 yHAxabQDUqqWL45RtLOICtJf40+Gw0+ps6Y9Uq1uM+L7l1QUKvFRirvhaJOrT/kAg/9X
 wNvXOLCWc4HE2YMGhHYgJ8xDGCbuo1qWdoXBThR4yz4nKi3EbI10zq7VCWwUZP44Znq5
 Ht1vQtGaa9S25e03tNwBJ5eR8sbMM2GdHdFFgFD8RHjkpInfUCZ1l+WWPm7viu8CUe5C
 aGh+Dea1u2wzHcWT4ZdW1u6zquKoTRTy4hix8MEkUKRaOqMESjh5vkUuC7SFEKzSVR4X
 hysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hh+l+cDJOH+rmHGFl5Z8Zd7K4dLUYHJocdz9v2HO6zA=;
 b=6L0Ciy6FoDqn9gRHL3z8NuohO21P5yaFqD8Dzv/8bIfIc9tyZQ3VuWD6KTbKjMqlz8
 X4WlqTQOMU8dBVPVilXgHA7XhSv8VkVanqzIw0Dfr7rSX3yUOSVGisq3lkKrzc5fK8a/
 fHvUHRoUXWVJvMb7AreyarYwfTL7KVNYDvz1HsOPmEss+cNFvJ5kZJjc50/9zJJxYQnw
 yjV0BaXCn4Ib37EjR9dpKTE7vVhniS8CMXxhuB54MWOIhnEhd5BiWBslV4ot/MV+9ZSs
 7H7ucf0x6xjGFKma4G3P+ErVWKy371dJwgqN+00wTQtHJ5fprw9ak8fu0bn9ghFJfI1X
 xQkg==
X-Gm-Message-State: AOAM532rRLHEd+gWmg+rZpt0/jg7I2Y4UgoCjcxrodXvhKqnaVBlBfuK
 Jc5SjPDPd9DSFL0CO0HFoLY=
X-Google-Smtp-Source: ABdhPJzg61lhXH43T0oAx2tFK5dMDO7rgoTBBFqYh0KY+3YN04A1J1laQWvkvScPHw0opdbB0iyBtg==
X-Received: by 2002:a17:902:e9d3:b0:154:6dd6:2521 with SMTP id
 19-20020a170902e9d300b001546dd62521mr5289232plk.59.1647918641193; 
 Mon, 21 Mar 2022 20:10:41 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 s141-20020a632c93000000b0038134d09219sm16260355pgs.55.2022.03.21.20.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 20:10:37 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:10:36 +0900
From: Stafford Horne <shorne@gmail.com>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, arnd@arndb.de, boqun.feng@gmail.com,
 longman@redhat.com, peterz@infradead.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [OpenRISC] [PATCH V2 1/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
Message-ID: <Yjk+LGwhc50zvsk2@antec>
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319035457.2214979-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_201042_304965_1A3CFB7C 
X-CRM114-Status: GOOD (  20.54  )
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

Hello,

There is a problem with this patch on Big Endian machines, see below.

On Sat, Mar 19, 2022 at 11:54:53AM +0800, guoren@kernel.org wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> This is a simple, fair spinlock.  Specifically it doesn't have all the
> subtle memory model dependencies that qspinlock has, which makes it more
> suitable for simple systems as it is more likely to be correct.
> 
> [Palmer: commit text]
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> --
> 
> I have specifically not included Peter's SOB on this, as he sent his
> original patch
> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
> without one.
> ---
>  include/asm-generic/spinlock.h          | 11 +++-
>  include/asm-generic/spinlock_types.h    | 15 +++++
>  include/asm-generic/ticket-lock-types.h | 11 ++++
>  include/asm-generic/ticket-lock.h       | 86 +++++++++++++++++++++++++
>  4 files changed, 120 insertions(+), 3 deletions(-)
>  create mode 100644 include/asm-generic/spinlock_types.h
>  create mode 100644 include/asm-generic/ticket-lock-types.h
>  create mode 100644 include/asm-generic/ticket-lock.h
> 
> diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
> new file mode 100644
> index 000000000000..59373de3e32a
> --- /dev/null
> +++ b/include/asm-generic/ticket-lock.h

...

> +static __always_inline void ticket_unlock(arch_spinlock_t *lock)
> +{
> +	u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);

As mentioned, this patch series breaks SMP on OpenRISC.  I traced it to this
line.  The above `__is_defined(__BIG_ENDIAN)`  does not return 1 as expected
even on BIG_ENDIAN machines.  This works:


diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
index 59373de3e32a..52b5dc9ffdba 100644
--- a/include/asm-generic/ticket-lock.h
+++ b/include/asm-generic/ticket-lock.h
@@ -26,6 +26,7 @@
 #define __ASM_GENERIC_TICKET_LOCK_H
 
 #include <linux/atomic.h>
+#include <linux/kconfig.h>
 #include <asm-generic/ticket-lock-types.h>
 
 static __always_inline void ticket_lock(arch_spinlock_t *lock)
@@ -51,7 +52,7 @@ static __always_inline bool ticket_trylock(arch_spinlock_t *lock)
 
 static __always_inline void ticket_unlock(arch_spinlock_t *lock)
 {
-       u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
+       u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
        u32 val = atomic_read(lock);
 
        smp_store_release(ptr, (u16)val + 1);


> +	u32 val = atomic_read(lock);
> +
> +	smp_store_release(ptr, (u16)val + 1);
> +}
> +



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
