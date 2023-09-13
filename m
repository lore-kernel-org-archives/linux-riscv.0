Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D20EE0207
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 20:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qGCcBSV467ScLvDrdVvhYSXKZ/6zA5NpUWEfRNP+Yo=; b=icf0Kd1fKF7emo
	jTT508ype4dQuevKQUp4ZbNDIaLcKzXC+OWoBk+4Qd3AMe3cXCCPEAr8Tfh/xKra+KTG64h6fAXWN
	vVO97spTfBFrECQ2Xz0lhQIU5ibCJCl2fr/rFtutddhxKEzB+CVRbEo+F4tbl5Hpl4//IIumH1AHj
	R8nBHQ0+D9D5YO4lhNe0U0zgyoU5VkiAzdcgS+j3brTeR8HyzdQjfo904b+QIJnWX9t/xEEVzpAVP
	qdA5/VWRZX0mdKzbXdr79JxqPRW20H0z6BQO3Uh61/WHNTfNKYqdngm0c5zTodLcu6Yf4yfAfugBZ
	slu2D9hNORBYfPZ1iH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgWbu-006gVJ-0Z;
	Wed, 13 Sep 2023 20:37:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgWbq-006gUI-2p
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 20:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694637433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GzO7JoG9d7rzk1ZQbsRXJk0CmxtcDOHuRPLOsu4wKSo=;
	b=dTPGKFeg0lzz/c7PpK7mU/Q2ZjGZGJupvmD97aNlYRjXYeDm2U1xPXr2qJOyH1txcwlWAO
	kHpVKbh+AS6OjRCde7//0LoD6lg0Ubq48VmXvbozUaI84rxcM130DXonw7PChhK/9Ixh3H
	tabJ3fSWVbASdISVI9OVoLjY2ANUHdw=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-8WrKPA7_PJeFVbDVsoVCaQ-1; Wed, 13 Sep 2023 16:37:12 -0400
X-MC-Unique: 8WrKPA7_PJeFVbDVsoVCaQ-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3aa17bcf2bcso321569b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 13:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694637431; x=1695242231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzO7JoG9d7rzk1ZQbsRXJk0CmxtcDOHuRPLOsu4wKSo=;
        b=HXrnGVNX8wu67j2j3mesesFBFRb2PSkLgLy39XlS2W8v9hQ7ML3WNd6Cm1o6LlJt3h
         ojWSkp/GydmCqmDsj/gdqYFX5qbH/bL5T0MnnNRvkMHg1iTfY2VK3+ptoDYO2sdLiCVv
         zL/rur0FVinZKRwgPgqBzRGVih+bbJQ6/fPqse0m81ZNjk2z9wdqyJS9F7Sh0r21PPKO
         Aoe3Lml760oWw7q+LveyvCrbga+JyxLMfTMDYM0xU0kE+pn3nJNM7EMIxPHVZHuLkh/8
         zV+xsx5KYVVTNo0UdtFw6VDJUmN9vwZLvcM8iIWdJVgdC4l+OjCQlarDzbgsAoJ28dPr
         1Q/A==
X-Gm-Message-State: AOJu0Yz9TI9Q5g7tOKJcm/n5mFFK9qR2AJtowKr2ZJ5egtqZKZLEOSKC
	+D+UNEhC+ObUrCXiOqqyJNH6OAOWLPWHKqeVAMMl2ohWbMGJjFC11ZVpeEzfQkhNdLF2hi0Eynh
	So7j2mPQ5cHxXcDxVltJxjhlrLe7o
X-Received: by 2002:a05:6871:68e:b0:1d5:34ea:6b88 with SMTP id l14-20020a056871068e00b001d534ea6b88mr3855838oao.28.1694637431356;
        Wed, 13 Sep 2023 13:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+NxYOt4vtNopoboCZRBzDBEQOJwF/RPhm/x98vXERhSjXt5vzFsmCSLqntMNcl3QhDT5hPA==
X-Received: by 2002:a05:6871:68e:b0:1d5:34ea:6b88 with SMTP id l14-20020a056871068e00b001d534ea6b88mr3855824oao.28.1694637431065;
        Wed, 13 Sep 2023 13:37:11 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id eb49-20020a056870a8b100b001d5552ca014sm64894oab.2.2023.09.13.13.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 13:37:10 -0700 (PDT)
Date: Wed, 13 Sep 2023 17:37:01 -0300
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 06/17] riscv: qspinlock: Introduce combo spinlock
Message-ID: <ZQIdbbzW79s5tfiI@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-7-guoren@kernel.org>
 <ZP2jL06TYGYVBhTN@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ZP2jL06TYGYVBhTN@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_133714_984692_1B461FD2 
X-CRM114-Status: GOOD (  30.13  )
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

On Sun, Sep 10, 2023 at 07:06:23AM -0400, Guo Ren wrote:
> On Sun, Sep 10, 2023 at 04:29:00AM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > Combo spinlock could support queued and ticket in one Linux Image and
> > select them during boot time via errata mechanism. Here is the func
> > size (Bytes) comparison table below:
> > 
> > TYPE			: COMBO | TICKET | QUEUED
> > arch_spin_lock		: 106	| 60     | 50
> > arch_spin_unlock	: 54    | 36     | 26
> > arch_spin_trylock	: 110   | 72     | 54
> > arch_spin_is_locked	: 48    | 34     | 20
> > arch_spin_is_contended	: 56    | 40     | 24
> > rch_spin_value_unlocked	: 48    | 34     | 24
> > 
> > One example of disassemble combo arch_spin_unlock:
> >    0xffffffff8000409c <+14>:    nop                # detour slot
> >    0xffffffff800040a0 <+18>:    fence   rw,w       # queued spinlock start
> >    0xffffffff800040a4 <+22>:    sb      zero,0(a4) # queued spinlock end
> >    0xffffffff800040a8 <+26>:    ld      s0,8(sp)
> >    0xffffffff800040aa <+28>:    addi    sp,sp,16
> >    0xffffffff800040ac <+30>:    ret
> >    0xffffffff800040ae <+32>:    lw      a5,0(a4)   # ticket spinlock start
> >    0xffffffff800040b0 <+34>:    sext.w  a5,a5
> >    0xffffffff800040b2 <+36>:    fence   rw,w
> >    0xffffffff800040b6 <+40>:    addiw   a5,a5,1
> >    0xffffffff800040b8 <+42>:    slli    a5,a5,0x30
> >    0xffffffff800040ba <+44>:    srli    a5,a5,0x30
> >    0xffffffff800040bc <+46>:    sh      a5,0(a4)   # ticket spinlock end
> >    0xffffffff800040c0 <+50>:    ld      s0,8(sp)
> >    0xffffffff800040c2 <+52>:    addi    sp,sp,16
> >    0xffffffff800040c4 <+54>:    ret
> > 
> > The qspinlock is smaller and faster than ticket-lock when all are in
> > fast-path, and combo spinlock could provide a compatible Linux Image
> > for different micro-arch design (weak/strict fwd guarantee LR/SC)
> > processors.
> > 
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  arch/riscv/Kconfig                |  9 +++-
> >  arch/riscv/include/asm/spinlock.h | 78 ++++++++++++++++++++++++++++++-
> >  arch/riscv/kernel/setup.c         | 14 ++++++
> >  3 files changed, 98 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 7f39bfc75744..4bcff2860f48 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -473,7 +473,7 @@ config NODES_SHIFT
> >  
> >  choice
> >  	prompt "RISC-V spinlock type"
> > -	default RISCV_TICKET_SPINLOCKS
> > +	default RISCV_COMBO_SPINLOCKS
> >  
> >  config RISCV_TICKET_SPINLOCKS
> >  	bool "Using ticket spinlock"
> > @@ -485,6 +485,13 @@ config RISCV_QUEUED_SPINLOCKS
> >  	help
> >  	  Make sure your micro arch LL/SC has a strong forward progress guarantee.
> >  	  Otherwise, stay at ticket-lock.
> > +
> > +config RISCV_COMBO_SPINLOCKS
> > +	bool "Using combo spinlock"
> > +	depends on SMP && MMU
> > +	select ARCH_USE_QUEUED_SPINLOCKS
> > +	help
> > +	  Select queued spinlock or ticket-lock via errata.
> >  endchoice
> >  
> >  config RISCV_ALTERNATIVE
> > diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> > index c644a92d4548..8ea0fee80652 100644
> > --- a/arch/riscv/include/asm/spinlock.h
> > +++ b/arch/riscv/include/asm/spinlock.h
> > @@ -7,11 +7,85 @@
> >  #define _Q_PENDING_LOOPS	(1 << 9)
> >  #endif
> >  
> > +#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
> > +#include <asm-generic/ticket_spinlock.h>
> > +
> > +#undef arch_spin_is_locked
> > +#undef arch_spin_is_contended
> > +#undef arch_spin_value_unlocked
> > +#undef arch_spin_lock
> > +#undef arch_spin_trylock
> > +#undef arch_spin_unlock
> > +
> > +#include <asm-generic/qspinlock.h>
> > +#include <linux/jump_label.h>
> > +
> > +#undef arch_spin_is_locked
> > +#undef arch_spin_is_contended
> > +#undef arch_spin_value_unlocked
> > +#undef arch_spin_lock
> > +#undef arch_spin_trylock
> > +#undef arch_spin_unlock
> Sorry, I forgot __no_arch_spinlock_redefine advice here. I would add it in v12.
> https://lore.kernel.org/linux-riscv/4cc7113a-0e4e-763a-cba2-7963bcd26c7a@redhat.com/
> 

Please check a reply to a previous patch I sent earlier: I think these 
#undef can be avoided.
 
> > +
> > +DECLARE_STATIC_KEY_TRUE(combo_qspinlock_key);
> > +
> > +static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
> > +{
> > +	if (static_branch_likely(&combo_qspinlock_key))
> > +		queued_spin_lock(lock);
> > +	else
> > +		ticket_spin_lock(lock);
> > +}
> > +
> > +static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
> > +{
> > +	if (static_branch_likely(&combo_qspinlock_key))
> > +		return queued_spin_trylock(lock);
> > +	else
> > +		return ticket_spin_trylock(lock);
> > +}
> > +
> > +static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
> > +{
> > +	if (static_branch_likely(&combo_qspinlock_key))
> > +		queued_spin_unlock(lock);
> > +	else
> > +		ticket_spin_unlock(lock);
> > +}
> > +
> > +static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> > +{
> > +	if (static_branch_likely(&combo_qspinlock_key))
> > +		return queued_spin_value_unlocked(lock);
> > +	else
> > +		return ticket_spin_value_unlocked(lock);
> > +}
> > +
> > +static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
> > +{
> > +	if (static_branch_likely(&combo_qspinlock_key))
> > +		return queued_spin_is_locked(lock);
> > +	else
> > +		return ticket_spin_is_locked(lock);
> > +}
> > +
> > +static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> > +{
> > +	if (static_branch_likely(&combo_qspinlock_key))
> > +		return queued_spin_is_contended(lock);
> > +	else
> > +		return ticket_spin_is_contended(lock);
> > +}
> > +#else /* CONFIG_RISCV_COMBO_SPINLOCKS */
> > +
> >  #ifdef CONFIG_QUEUED_SPINLOCKS
> >  #include <asm/qspinlock.h>
> > -#include <asm/qrwlock.h>
> >  #else
> > -#include <asm-generic/spinlock.h>
> > +#include <asm-generic/ticket_spinlock.h>
> >  #endif
> >  
> > +#endif /* CONFIG_RISCV_COMBO_SPINLOCKS */
> > +
> > +#include <asm/qrwlock.h>
> > +
> >  #endif /* __ASM_RISCV_SPINLOCK_H */
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 32c2e1eb71bd..a447cf360a18 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -269,6 +269,18 @@ static void __init parse_dtb(void)
> >  #endif
> >  }
> >  
> > +#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
> > +DEFINE_STATIC_KEY_TRUE(combo_qspinlock_key);
> > +EXPORT_SYMBOL(combo_qspinlock_key);
> > +#endif
> > +
> > +static void __init riscv_spinlock_init(void)
> > +{
> > +#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
> > +	static_branch_disable(&combo_qspinlock_key);
> > +#endif
> > +}
> > +
> >  extern void __init init_rt_signal_env(void);
> >  
> >  void __init setup_arch(char **cmdline_p)
> > @@ -317,6 +329,8 @@ void __init setup_arch(char **cmdline_p)
> >  	    riscv_isa_extension_available(NULL, ZICBOM))
> >  		riscv_noncoherent_supported();
> >  	riscv_set_dma_cache_alignment();
> > +
> > +	riscv_spinlock_init();
> >  }
> >  
> >  static int __init topology_init(void)
> > -- 
> > 2.36.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
