Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C96C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Mar 2022 21:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYD9HiQBhmjLDkU7MXQUwCIG2+52mc1TLb5kmOry3SA=; b=AfBC5r7okBXZQE
	jgpO2eF1QjwygMNbXaTkHZaVL+4hkXS8aL6r2Zql54g0g7UWemXdkDRY782ENZHdf8OL4hgJqMlPz
	/Vaz7e86JDbDbMXnpVsdLJLqQBD9WEf8Orffwj9c+unHS8uzvKrPAGn4xE5ZesJQh4BUuD4CWCZZA
	N5SfZvLWzPYkiavi2+GYrpHEPAsz39DnXjM4QGhu1SvCh60M8oA4xB/KSJs/7/E+2my3pHpRa0/rG
	88fHs9YT08tS61AfkFuMpYZQl+gGAqlelUkxsm6LiW4XPQ60lg4yjQjTp5mVUbFbs32lXOktjVfxq
	EvqpcuSui7126/d+9E6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWPat-009AbR-RR; Mon, 21 Mar 2022 21:29:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWPaq-009AaX-EW
 for linux-riscv@lists.infradead.org; Mon, 21 Mar 2022 21:29:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id q5so4615214plg.3
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yfL5LeF6JfPCL0schiZdmyWW7c787PjB4OtVneDCy3c=;
 b=QhAWgb+/5JdbSBoLdH7esy8uG93AEHe0BHi15RUZLTvr16o/lrpZsqzU/LUwnszd4m
 Gwii0x8PzhQYgztwYNKNwt9mShLBku+glqAY+stlLpvyb/2z2eHokbyVOqWV7fZgcU72
 jh62NsG9ViL9N/GGyLROzk82FLbf+/QmqhOIVYkn33bZY4ZS8z9OjiD0ovmxGTeR6x4a
 Wtq3tvZovdF4bRLgd8yedPRMPGVDD3SO/kJtIjT5Q6IDc3J9dunrMe08+QNM3pX5sTey
 2a994whC/jzsVWPJC6j7bSqBF/87YCr84BiQEDgYY7Dj4QtShmrWYxszHfY/MFB+V/1J
 nvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yfL5LeF6JfPCL0schiZdmyWW7c787PjB4OtVneDCy3c=;
 b=INtTubpqAtRPGnnVpy0hz3u2SxpshjbcUwuSjG3oUzIBre360rLvOOyWA3pRTCtlKv
 GrDxJlSd4DGlsMdeGDNCiMc430oxSfEyan+1Y+5VAyJeMRAX/GBy1zoAlh6TpqOx3H7I
 DIiZO+vCRp+xLMOMbA/KrJ5/dlthorxxUJ2Fe3MWfgSjzEzn99Ir++vWwyKiM/t/eLFe
 NiMzycNsnw3d8cF60aaypTYK1PXYw4xG6+xOsDVZQQGnQxAyx1qCZzi1Jei18cYMoH0S
 Th0t8J6zeAdmuSZ+Jlw2tbw2O3FpbjlYtRqPqGPkjjNSTDcZFa6avqA2v2/prHw4FTNn
 03dA==
X-Gm-Message-State: AOAM530poKDHnj0SXHnP/lyl/iwczmNly7icXiBdxNCF98auzyx5vt8E
 z8+dTNObytvlcl4Z4N01b3M=
X-Google-Smtp-Source: ABdhPJz6u4FytOk5yk0PMbnP4+YRKP6yRDpS687V5wmoHiqna7r44cXJVLkVo3FJIYxARw+3CpcLsw==
X-Received: by 2002:a17:90b:1d0e:b0:1bf:2a24:2716 with SMTP id
 on14-20020a17090b1d0e00b001bf2a242716mr1184969pjb.60.1647898173687; 
 Mon, 21 Mar 2022 14:29:33 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a8b0300b001c735089cc2sm341034pjn.54.2022.03.21.14.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 14:29:33 -0700 (PDT)
Date: Tue, 22 Mar 2022 06:29:29 +0900
From: Stafford Horne <shorne@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 3/5] openrisc: Move to ticket-spinlock
Message-ID: <YjjuOZMzQlnqfLDJ@antec>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-4-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316232600.20419-4-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_142936_518132_0396692B 
X-CRM114-Status: GOOD (  21.02  )
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

On Wed, Mar 16, 2022 at 04:25:58PM -0700, Palmer Dabbelt wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> We have no indications that openrisc meets the qspinlock requirements,
> so move to ticket-spinlock as that is more likey to be correct.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> ---
> 
> I have specifically not included Peter's SOB on this, as he sent his
> original patch
> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
> without one.
> ---
>  arch/openrisc/Kconfig                      | 1 -
>  arch/openrisc/include/asm/Kbuild           | 5 ++---
>  arch/openrisc/include/asm/spinlock.h       | 3 +--
>  arch/openrisc/include/asm/spinlock_types.h | 2 +-
>  4 files changed, 4 insertions(+), 7 deletions(-)

Hello,

This series breaks SMP support on OpenRISC.  I haven't traced it down yet, it
seems trivial but I have a few places to check.

I replied to this on a kbuild warning thread, but also going to reply here with
more information.

 https://lore.kernel.org/lkml/YjeY7CfaFKjr8IUc@antec/#R

So far this is what I see:

  * ticket_lock is stuck trying to lock console_sem
  * it is stuck on atomic_cond_read_acquire
    reading lock value: returns 0    (*lock is 0x10000)
    ticket value: is 1
  * possible issues:
    - OpenRISC is big endian, that seems to impact ticket_unlock, it looks
      like we are failing on the first call to ticket_lock though

Backtrace:
    (gdb) target remote :10001
    Remote debugging using :10001
    ticket_lock (lock=0xc049e078 <console_sem>) at include/asm-generic/ticket-lock.h:39
    39              atomic_cond_read_acquire(lock, ticket == (u16)VAL);
    (gdb) bt
    #0  ticket_lock (lock=0xc049e078 <console_sem>) at include/asm-generic/ticket-lock.h:39
    #1  do_raw_spin_lock (lock=0xc049e078 <console_sem>) at include/linux/spinlock.h:185
    #2  __raw_spin_lock_irqsave (lock=0xc049e078 <console_sem>) at include/linux/spinlock_api_smp.h:111
    #3  _raw_spin_lock_irqsave (lock=0xc049e078 <console_sem>) at kernel/locking/spinlock.c:162
    Backtrace stopped: Cannot access memory at address 0xc0491ee8

Code:

    31      static __always_inline void ticket_lock(arch_spinlock_t *lock)
    32      {
    33              u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
    34              u16 ticket = val >> 16;
    35
    36              if (ticket == (u16)val)
    37                      return;
    38
    39              atomic_cond_read_acquire(lock, ticket == (u16)VAL); <--- stuck here
    40      }

Assembly:

    c04232ac <_raw_spin_lock_irqsave>:
    c04232ac:       9c 21 ff f0     l.addi r1,r1,-16
    c04232b0:       d4 01 10 08     l.sw 8(r1),r2
    c04232b4:       9c 41 00 10     l.addi r2,r1,16
    c04232b8:       d4 01 80 00     l.sw 0(r1),r16
    c04232bc:       d4 01 90 04     l.sw 4(r1),r18
    c04232c0:       d4 01 48 0c     l.sw 12(r1),r9
    c04232c4:       07 ef 8b 35     l.jal c0005f98 <arch_local_save_flags>
    c04232c8:       e2 03 18 04     l.or r16,r3,r3
    c04232cc:       18 60 00 00     l.movhi r3,0x0
    c04232d0:       07 ef 8b 3c     l.jal c0005fc0 <arch_local_irq_restore>
    c04232d4:       e2 4b 58 04     l.or r18,r11,r11
    c04232d8:       1a 60 00 01     l.movhi r19,0x1
atomic_fetch_add:
    c04232dc:       6e 30 00 00     l.lwa r17,0(r16)
    c04232e0:       e2 31 98 00     l.add r17,r17,r19
    c04232e4:       cc 10 88 00     l.swa 0(r16),r17
    c04232e8:       0f ff ff fd     l.bnf c04232dc <_raw_spin_lock_irqsave+0x30>
    c04232ec:       15 00 00 00      l.nop 0x0
u16 ticket = val >> 16;
    c04232f0:       ba 71 00 50     l.srli r19,r17,0x10
    c04232f4:       a6 31 ff ff     l.andi r17,r17,0xffff
    c04232f8:       e4 13 88 00     l.sfeq r19,r17
    c04232fc:       10 00 00 0e     l.bf c0423334 <_raw_spin_lock_irqsave+0x88>
    c0423300:       e1 72 90 04      l.or r11,r18,r18
if (ticket == (u16)val):
    c0423304:       86 30 00 00     l.lwz r17,0(r16)
    c0423308:       a6 31 ff ff     l.andi r17,r17,0xffff
    c042330c:       e4 11 98 00     l.sfeq r17,r19
    c0423310:       10 00 00 07     l.bf c042332c <_raw_spin_lock_irqsave+0x80>
    c0423314:       15 00 00 00      l.nop 0x0
atomic_cond_read_acquire:
    c0423318:       86 30 00 00     l.lwz r17,0(r16)
    c042331c:       a6 31 ff ff     l.andi r17,r17,0xffff
    c0423320:       e4 33 88 00     l.sfne r19,r17
    c0423324:       13 ff ff fd     l.bf c0423318 <_raw_spin_lock_irqsave+0x6c>
    c0423328:       15 00 00 00      l.nop 0x0
    c042332c:       22 00 00 00     l.msync
    c0423330:       e1 72 90 04     l.or r11,r18,r18
    c0423334:       86 01 00 00     l.lwz r16,0(r1)
    c0423338:       86 41 00 04     l.lwz r18,4(r1)
    c042333c:       84 41 00 08     l.lwz r2,8(r1)
    c0423340:       85 21 00 0c     l.lwz r9,12(r1)
    c0423344:       44 00 48 00     l.jr r9
    c0423348:       9c 21 00 10     l.addi r1,r1,16


-Stafford

> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index f724b3f1aeed..f5fa226362f6 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -30,7 +30,6 @@ config OPENRISC
>  	select HAVE_DEBUG_STACKOVERFLOW
>  	select OR1K_PIC
>  	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
> -	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select OMPIC if SMP
>  	select ARCH_WANT_FRAME_POINTERS
> diff --git a/arch/openrisc/include/asm/Kbuild b/arch/openrisc/include/asm/Kbuild
> index ca5987e11053..cb260e7d73db 100644
> --- a/arch/openrisc/include/asm/Kbuild
> +++ b/arch/openrisc/include/asm/Kbuild
> @@ -1,9 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generic-y += extable.h
>  generic-y += kvm_para.h
> -generic-y += mcs_spinlock.h
> -generic-y += qspinlock_types.h
> -generic-y += qspinlock.h
> +generic-y += ticket-lock.h
> +generic-y += ticket-lock-types.h
>  generic-y += qrwlock_types.h
>  generic-y += qrwlock.h
>  generic-y += user.h
> diff --git a/arch/openrisc/include/asm/spinlock.h b/arch/openrisc/include/asm/spinlock.h
> index 264944a71535..40e4c9fdc349 100644
> --- a/arch/openrisc/include/asm/spinlock.h
> +++ b/arch/openrisc/include/asm/spinlock.h
> @@ -15,8 +15,7 @@
>  #ifndef __ASM_OPENRISC_SPINLOCK_H
>  #define __ASM_OPENRISC_SPINLOCK_H
>  
> -#include <asm/qspinlock.h>
> -
> +#include <asm/ticket-lock.h>
>  #include <asm/qrwlock.h>
>  
>  #define arch_spin_relax(lock)	cpu_relax()
> diff --git a/arch/openrisc/include/asm/spinlock_types.h b/arch/openrisc/include/asm/spinlock_types.h
> index 7c6fb1208c88..58ea31fa65ce 100644
> --- a/arch/openrisc/include/asm/spinlock_types.h
> +++ b/arch/openrisc/include/asm/spinlock_types.h
> @@ -1,7 +1,7 @@
>  #ifndef _ASM_OPENRISC_SPINLOCK_TYPES_H
>  #define _ASM_OPENRISC_SPINLOCK_TYPES_H
>  
> -#include <asm/qspinlock_types.h>
> +#include <asm/ticket-lock-types.h>
>  #include <asm/qrwlock_types.h>
>  
>  #endif /* _ASM_OPENRISC_SPINLOCK_TYPES_H */
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
