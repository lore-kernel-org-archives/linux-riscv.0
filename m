Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A77C433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 16:01:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D9FC6105A
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 16:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D9FC6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c/xmUtO0zdEQNOQc2UnSAGhdGAOWMLCejGbSYpJzBeA=; b=jYTio4fElL6P8ds4O7j7kK8WG
	ZtJ5ZmN07PMQJI7dwm3Cx3mtsHJbQKJrAOifx9oI8HbIqyDA1RguaHLCqqtakvdzidLV+v9GiqGr8
	CUnWRaBhdIAYD8DZRDSLcd1uvfNYMTIia/LeULzjiLPUe8Z0LSqqVRF/U/NbeKosR80zyJflEywrS
	nQVZsf4Z7dlmVQO7yOtga2eFdKfy0GE19JnK2ljtJTwiPeLOS/avgBkWBN2m0D9zapxt1rHL0DrKJ
	0eju+dyiWsjJPdtdMtSI9hKsQ3NP2fLhT5LNankUeCSMul6147jx9nThgEQju0reVoLkD211musgV
	fpIPPCuYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVcWi-004g19-61; Sun, 11 Apr 2021 16:01:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVcWe-004g0n-Aw
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 16:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=I2EBx3sJ/vLLI2PJk75jYL2zbh38gHd3p0wjYi7vBvE=; b=Ne1KT5QpT574nXDKXqwf6nxYWI
 cI3Ir70pK6WXL3Qa/2w/5qeL1UcPK/XICOg8OCDJmBdOyYMvwJzm6bM8zv5mCRcySrY/HPC7U8LNU
 EZ5Q8YKxkT2YSDUzIS7QYDAgTf1zfM35usjFmqNfbEevNMAc4vCr9kX4vBzdrKrioPJnRrR1z+yRc
 Ox9/Ut2vgQEclIY1EcdxfnUTlGY4GdDLOpFM7roGo4Q90llT63U6jA/P3DLMDW/pryYjYR+6dg1td
 ClnDFku8yHwCNhg2TRb0tLkNz8ooEtqVdjCAJb5XJH8CJAlAmJIB1lJ4OyfF1olcWGm+CggOFx68G
 P6m63wrw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVcWb-005aRO-If
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 16:01:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2895C611C9
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618156884;
 bh=bxyiUc7lO8RjWeGmFNt0Glxp3nNNC162o0D7XY+vRXg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ocbV3yCEonWttAc1zcbh4sFMlpL/8mLiYxvnPxd4vaNWUoxIUghQq/418Vd/8+OsQ
 uJqpH09JX3FyCKp5XaQYZxmUsBFGWg8DBDqrZUYcGC9eTTDGDZ7Pv1fsnvFz66yY3l
 CqFgPgBK9ODxn1O/DoS0JWKwm1nNfEok9TRCbissXEHtyCsrFX5+LauK+0HULFJudx
 MheQDdG6dqOZZtISRGENS7K5+2Yo60vM8RzSwh/VaorG8/XaeVnWmZ6gy7/XASCyPB
 iuDB+RBHMB+CmVctzSKyVDMGk7JOvcTcXfexy6bCgR4aqAXQUWdHhM9dc/xolI6hq+
 ieCqE55bqcOfw==
Received: by mail-lj1-f170.google.com with SMTP id r20so12300695ljk.4
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 09:01:24 -0700 (PDT)
X-Gm-Message-State: AOAM531wfJwhP5evzzVZhoLnl92hvZgaa5jgc/DZ+bK7FdSRZpXGN4M1
 IHMIt3is331vR/dV7aagyf83lvGaQ+iX5+JGaEE=
X-Google-Smtp-Source: ABdhPJy10CnI96Z9R6HlWIrVpcoYY10s7Y9maxlV3dOVr4CugIJl0sk8MNc8rkDLu53Ak6ongjwa0tUvq8SrIM/7luU=
X-Received: by 2002:a05:651c:3c3:: with SMTP id
 f3mr15178457ljp.105.1618156882398; 
 Sun, 11 Apr 2021 09:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-5-git-send-email-guoren@kernel.org>
In-Reply-To: <1617201040-83905-5-git-send-email-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 12 Apr 2021 00:01:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT2Pe8o0wm1ohJE-A0HNjteiB6T3HMcH3Fdj7Tm7SSR8Q@mail.gmail.com>
Message-ID: <CAJF2gTT2Pe8o0wm1ohJE-A0HNjteiB6T3HMcH3Fdj7Tm7SSR8Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] csky: locks: Optimize coding convention
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 linux-xtensa@linux-xtensa.org, openrisc@lists.librecores.org, 
 sparclinux <sparclinux@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_090125_697184_0ACA5CAF 
X-CRM114-Status: GOOD (  19.30  )
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

On Wed, Mar 31, 2021 at 10:32 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
>  - Using smp_cond_load_acquire in arch_spin_lock by Peter's
>    advice.
>  - Using __smp_acquire_fence in arch_spin_trylock
>  - Using smp_store_release in arch_spin_unlock
>
> All above are just coding conventions and won't affect the
> function.
>
> TODO in smp_cond_load_acquire for architecture:
>  - current csky only has:
>    lr.w val, <p0>
>    sc.w <p0>. val2
>    (Any other stores to p0 will let sc.w failed)
>
>  - But smp_cond_load_acquire need:
>    lr.w val, <p0>
>    wfe
>    (Any stores to p0 will send the event to let wfe retired)
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Link: https://lore.kernel.org/linux-riscv/CAAhSdy1JHLUFwu7RuCaQ+RUWRBks2KsDva7EpRt8--4ZfofSUQ@mail.gmail.com/T/#m13adac285b7f51f4f879a5d6b65753ecb1a7524e
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/include/asm/spinlock.h | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
> index 69f5aa249c5f..69677167977a 100644
> --- a/arch/csky/include/asm/spinlock.h
> +++ b/arch/csky/include/asm/spinlock.h
> @@ -26,10 +26,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>                 : "r"(p), "r"(ticket_next)
>                 : "cc");
>
> -       while (lockval.tickets.next != lockval.tickets.owner)
> -               lockval.tickets.owner = READ_ONCE(lock->tickets.owner);
> -
> -       smp_mb();
> +       smp_cond_load_acquire(&lock->tickets.owner,
> +                                       VAL == lockval.tickets.next);
It's wrong, we should determine lockval before next read.

Fixup:

diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
index fe98ad8ece51..2be627ceb9df 100644
--- a/arch/csky/include/asm/spinlock.h
+++ b/arch/csky/include/asm/spinlock.h
@@ -27,7 +27,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
                : "r"(p), "r"(ticket_next)
                : "cc");

-       smp_cond_load_acquire(&lock->tickets.owner,
+       if (lockval.owner != lockval.tickets.next)
+               smp_cond_load_acquire(&lock->tickets.owner,
                                        VAL == lockval.tickets.next);

>  }
>
>  static inline int arch_spin_trylock(arch_spinlock_t *lock)
> @@ -55,15 +53,14 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
>         } while (!res);
>
>         if (!contended)
> -               smp_mb();
> +               __smp_acquire_fence();
>
>         return !contended;
>  }
>
>  static inline void arch_spin_unlock(arch_spinlock_t *lock)
>  {
> -       smp_mb();
> -       WRITE_ONCE(lock->tickets.owner, lock->tickets.owner + 1);
> +       smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
>  }
>
>  static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
