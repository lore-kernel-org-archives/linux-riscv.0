Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85704EE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 19:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6I0Rx4n6TqidkMJ2Sc2eZMYvqQwgDQCuUkuba+DQTE=; b=Q+rGfqY3LjgE4e
	V75mcCJq34uSLpGuFOmwUoHjgD6/bIamSVmBXO6nEwEGN/xB7BKu2pUasJ4QLBxTQcffBpuLQKFjS
	k/ng1xL8in4nRUXEeZJXqTlCvy9qNbgd60k103IF/sSB3UwV32wC1bwNEi9YLJNIajgLa92BdE73f
	RstJ3Mdl+RcC0euQFUax5vF3ZVY8QnZa/+St/p8QZ0ygczR/GsVmgk5VonrSAW4GPTmihpstn1LcU
	kIAf8vL4zxnnlcSlh9TfNe1MEneDgOGB7SN75+HbkLP4bOy1dWRNTdi/i3s13jJzdMGoyOY1m2KID
	aGYNbOMxzrJtuqff0+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmE6-001AXd-0e;
	Mon, 11 Sep 2023 19:05:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmE2-001AWm-2X
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 19:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694459131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnGFv3wvXxgfRb1LSXoqYE8VtR97/r6b9uW3EMC26Ig=;
	b=D5Q6C19CPxonNf/eE+w4Y1B9ih0wDdu4LgkcP5TcbipaPaRRNTVPEpgWCtTJBF39GqXjfT
	XoxF9kyvdsGsBIMb7xL4HGqNgEmTKD5ATSian8JkO0mvNxHtrLcHX8sBEw9cTY2g285MY9
	qRjbCjRHlUDi6kkOFdtcGTRYPWzmc4w=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-7uPXeyqdP7an-Hf4_kkUGQ-1; Mon, 11 Sep 2023 15:05:30 -0400
X-MC-Unique: 7uPXeyqdP7an-Hf4_kkUGQ-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a78c2cdd77so5316726b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 12:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694459130; x=1695063930;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yukk2f6oqMsdHKjhoJE1WmcLNdeEJDKH4QDEs4EiGPg=;
        b=VWsT6z5JG8SCxAsy8oTBxGYCA32VXAUxNJH2pV1Uufs5eAJG2nmtKFr40SFsV5p2WC
         Ii3CgiEQ5t4y66bZT23XUmbZXjYxNRvNaqwpQXjjJ1layV5f6NVrAMeJfSqrfBwbeJzh
         zJDeDRnqeKDe0rHoMv8ksQw9T3UiDrVjM2qujSWWxuDtZr/70sUXCcz+HM/hC7DlEZ80
         BptTh3Pemzz9r8WhNLoOPHZJwA+HUyky/NzEV+8fQcKwXT+HWnc4QrKgjhYRptv960ho
         Ve4SAN3gaM6EVqhf0KbRN/FC4pp2oteKoUVZpfcWz0VgnXDxHsEtAXviqN8plwbXWxLJ
         nGrg==
X-Gm-Message-State: AOJu0YyDFgiDrkuefks42iPcG5jh9dRicen7oaGuX5lTMUz1pqv/+U9r
	4O1tV/Zqi2NIxRtJbrsdDL4NyxtzpDpr7Tn76dAgEpTGFywaeMfd+FqyC4CNiCzA1dDi8Ff+FyD
	f2sI7ZrmdcQif0hbZ+30KnTzdEJle
X-Received: by 2002:a9d:4e90:0:b0:6c0:abdd:a875 with SMTP id v16-20020a9d4e90000000b006c0abdda875mr11713417otk.18.1694459129918;
        Mon, 11 Sep 2023 12:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGStsqh389BzmE57cp5mD7HYmxQywTAlI0LrMmQ6OTXG7DZOO3hPQDzK0WcE6xAB/YEW7bphA==
X-Received: by 2002:a9d:4e90:0:b0:6c0:abdd:a875 with SMTP id v16-20020a9d4e90000000b006c0abdda875mr11713377otk.18.1694459129611;
        Mon, 11 Sep 2023 12:05:29 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a803:c91:da45:7fbc:86c3:920a? ([2804:1b3:a803:c91:da45:7fbc:86c3:920a])
        by smtp.gmail.com with ESMTPSA id l17-20020a05683016d100b006b95392cf09sm3318989otr.33.2023.09.11.12.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:05:28 -0700 (PDT)
Message-ID: <5c082cb1fd306cb75abbcaa80229d791260f8756.camel@redhat.com>
Subject: Re: [PATCH V11 01/17] asm-generic: ticket-lock: Reuse
 arch_spinlock_t of qspinlock
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org, 
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 palmer@rivosinc.com,  longman@redhat.com, boqun.feng@gmail.com,
 tglx@linutronix.de, paulmck@kernel.org,  rostedt@goodmis.org,
 rdunlap@infradead.org, catalin.marinas@arm.com, 
 conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
 alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
 ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
 wuwei2016@iscas.ac.cn
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org, Guo
 Ren <guoren@linux.alibaba.com>
Date: Mon, 11 Sep 2023 16:05:20 -0300
In-Reply-To: <20230910082911.3378782-2-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
	 <20230910082911.3378782-2-guoren@kernel.org>
User-Agent: Evolution 3.48.4
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_120534_918461_38EC8C84 
X-CRM114-Status: GOOD (  22.79  )
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

On Sun, 2023-09-10 at 04:28 -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The arch_spinlock_t of qspinlock has contained the atomic_t val, which
> satisfies the ticket-lock requirement. Thus, unify the arch_spinlock_t
> into qspinlock_types.h. This is the preparation for the next combo
> spinlock.
> 
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  include/asm-generic/spinlock.h       | 14 +++++++-------
>  include/asm-generic/spinlock_types.h | 12 ++----------
>  2 files changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> index 90803a826ba0..4773334ee638 100644
> --- a/include/asm-generic/spinlock.h
> +++ b/include/asm-generic/spinlock.h
> @@ -32,7 +32,7 @@
>  
>  static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
>  {
> -	u32 val = atomic_fetch_add(1<<16, lock);
> +	u32 val = atomic_fetch_add(1<<16, &lock->val);
>  	u16 ticket = val >> 16;
>  
>  	if (ticket == (u16)val)
> @@ -46,31 +46,31 @@ static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
>  	 * have no outstanding writes due to the atomic_fetch_add() the extra
>  	 * orderings are free.
>  	 */
> -	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
> +	atomic_cond_read_acquire(&lock->val, ticket == (u16)VAL);
>  	smp_mb();
>  }
>  
>  static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
>  {
> -	u32 old = atomic_read(lock);
> +	u32 old = atomic_read(&lock->val);
>  
>  	if ((old >> 16) != (old & 0xffff))
>  		return false;
>  
> -	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
> +	return atomic_try_cmpxchg(&lock->val, &old, old + (1<<16)); /* SC, for RCsc */
>  }
>  
>  static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
>  {
>  	u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
> -	u32 val = atomic_read(lock);
> +	u32 val = atomic_read(&lock->val);
>  
>  	smp_store_release(ptr, (u16)val + 1);
>  }
>  
>  static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
>  {
> -	u32 val = lock.counter;
> +	u32 val = lock.val.counter;
>  
>  	return ((val >> 16) == (val & 0xffff));
>  }

This one seems to be different in torvalds/master, but I suppose it's because of
the requirement patches I have not merged.

> @@ -84,7 +84,7 @@ static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
>  
>  static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
>  {
> -	u32 val = atomic_read(lock);
> +	u32 val = atomic_read(&lock->val);
>  
>  	return (s16)((val >> 16) - (val & 0xffff)) > 1;
>  }
> diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
> index 8962bb730945..f534aa5de394 100644
> --- a/include/asm-generic/spinlock_types.h
> +++ b/include/asm-generic/spinlock_types.h
> @@ -3,15 +3,7 @@
>  #ifndef __ASM_GENERIC_SPINLOCK_TYPES_H
>  #define __ASM_GENERIC_SPINLOCK_TYPES_H
>  
> -#include <linux/types.h>
> -typedef atomic_t arch_spinlock_t;
> -
> -/*
> - * qrwlock_types depends on arch_spinlock_t, so we must typedef that before the
> - * include.
> - */
> -#include <asm/qrwlock_types.h>
> -
> -#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
> +#include <asm-generic/qspinlock_types.h>
> +#include <asm-generic/qrwlock_types.h>
>  
>  #endif /* __ASM_GENERIC_SPINLOCK_TYPES_H */

FWIW, LGTM:

Reviewed-by: Leonardo Bras <leobras@redhat.com>


Just a suggestion: In this patch I could see a lot of usage changes to
arch_spinlock_t, and only at the end I could see the actual change in the .h
file.

In cases like this, it looks nicer to see the .h file first.

I recently found out about this git diff.orderFile option, which helps to
achieve exactly this.

I use the following git.orderfile, adapted from qemu:

############################################################################
#
# order file for git, to produce patches which are easier to review
# by diffing the important stuff like interface changes first.
#
# one-off usage:
#   git diff -O scripts/git.orderfile ...
#
# add to git config:
#   git config diff.orderFile scripts/git.orderfile
#

MAINTAINERS

# Documentation
Documentation/*
*.rst
*.rst.inc

# build system
Kbuild
Makefile*
*.mak

# semantic patches
*.cocci

# headers
*.h
*.h.inc

# code
*.c
*.c.inc



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
