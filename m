Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8BAC3DA60
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 13:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGMis88/ZUdUvg5bZijbD1/6zcRrTPtTeGNyuHUjuEw=; b=Zu/UKCAk7kAfb2
	kWT8GwXoZl5JzhfXB8z2R0J2dZTAQ+QbTAl1kXYk6bMdBSZQBZ/wahJTqRijDI8VNl8KHqpwZgPBo
	nr58fxJ3039dCvh3eAIc4Ud/lBlx6XGfMgstnPW2fXSJozeMENMg8ZVN2ntqLd9etrDhbEupnfyQ6
	kS78gyQUXuCUKjBSscO0BGvusoQML/TFdeaKVUBxOASg6jP6mHMJIfgbSoLyn227aAAlklHPZM1g/
	rwcS+SzCd+F2yE0xQVDT0gHmTD6n5n+GRhrZMT+hYQPU2HhXfPD2xNSl2GqdyopROon6kvfrDcg6r
	WM3llYdkbMd5aotw0lOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQsL-0000000H3di-3rBp;
	Thu, 18 Jul 2024 13:08:49 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQsH-0000000H3ck-42NW
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 13:08:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A304B1C0009;
	Thu, 18 Jul 2024 13:08:39 +0000 (UTC)
Message-ID: <2c227c58-d414-4994-9382-11feb80bb818@ghiti.fr>
Date: Thu, 18 Jul 2024 15:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] riscv: Add qspinlock support
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-12-alexghiti@rivosinc.com> <ZpfxUvIx+0ClOqCc@andrea>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZpfxUvIx+0ClOqCc@andrea>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_060846_328614_EC2ADA6C 
X-CRM114-Status: GOOD (  20.98  )
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

Hi Andrea,

On 17/07/2024 18:29, Andrea Parri wrote:
>> +config RISCV_QUEUED_SPINLOCKS
> I'm seeing the following warnings with CONFIG_RISCV_QUEUED_SPINLOCKS=y:
>
> In file included from ./arch/riscv/include/generated/asm/qspinlock.h:1,
>                   from kernel/locking/qspinlock.c:24:
> ./include/asm-generic/qspinlock.h:144:9: warning: "arch_spin_is_locked" redefined
>    144 | #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
>        |         ^~~~~~~~~~~~~~~~~~~
> In file included from ./arch/riscv/include/generated/asm/ticket_spinlock.h:1,
>                   from ./arch/riscv/include/asm/spinlock.h:33,
>                   from ./include/linux/spinlock.h:95,
>                   from ./include/linux/sched.h:2142,
>                   from ./include/linux/percpu.h:13,
>                   from kernel/locking/qspinlock.c:19:
> ./include/asm-generic/ticket_spinlock.h:97:9: note: this is the location of the previous definition
>     97 | #define arch_spin_is_locked(l)          ticket_spin_is_locked(l)
>        |         ^~~~~~~~~~~~~~~~~~~
> ./include/asm-generic/qspinlock.h:145:9: warning: "arch_spin_is_contended" redefined
>    145 | #define arch_spin_is_contended(l)       queued_spin_is_contended(l)
>        |         ^~~~~~~~~~~~~~~~~~~~~~
> ./include/asm-generic/ticket_spinlock.h:98:9: note: this is the location of the previous definition
>     98 | #define arch_spin_is_contended(l)       ticket_spin_is_contended(l)
>        |         ^~~~~~~~~~~~~~~~~~~~~~
> ./include/asm-generic/qspinlock.h:146:9: warning: "arch_spin_value_unlocked" redefined
>    146 | #define arch_spin_value_unlocked(l)     queued_spin_value_unlocked(l)
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ./include/asm-generic/ticket_spinlock.h:99:9: note: this is the location of the previous definition
>     99 | #define arch_spin_value_unlocked(l)     ticket_spin_value_unlocked(l)
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ./include/asm-generic/qspinlock.h:147:9: warning: "arch_spin_lock" redefined
>    147 | #define arch_spin_lock(l)               queued_spin_lock(l)
>        |         ^~~~~~~~~~~~~~
> ./include/asm-generic/ticket_spinlock.h:100:9: note: this is the location of the previous definition
>    100 | #define arch_spin_lock(l)               ticket_spin_lock(l)
>        |         ^~~~~~~~~~~~~~
> ./include/asm-generic/qspinlock.h:148:9: warning: "arch_spin_trylock" redefined
>    148 | #define arch_spin_trylock(l)            queued_spin_trylock(l)
>        |         ^~~~~~~~~~~~~~~~~
> ./include/asm-generic/ticket_spinlock.h:101:9: note: this is the location of the previous definition
>    101 | #define arch_spin_trylock(l)            ticket_spin_trylock(l)
>        |         ^~~~~~~~~~~~~~~~~
> ./include/asm-generic/qspinlock.h:149:9: warning: "arch_spin_unlock" redefined
>    149 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
>        |         ^~~~~~~~~~~~~~~~
> ./include/asm-generic/ticket_spinlock.h:102:9: note: this is the location of the previous definition
>    102 | #define arch_spin_unlock(l)             ticket_spin_unlock(l)
>
>
> The following diff resolves them for me (please double check):
>
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> index 4856d50006f28..2d59f56a9e2d1 100644
> --- a/arch/riscv/include/asm/spinlock.h
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -30,7 +30,11 @@ SPINLOCK_BASE_DECLARE(value_unlocked, int, arch_spinlock_t)
>   
>   #else
>   
> +#if defined(CONFIG_RISCV_TICKET_SPINLOCKS)
>   #include <asm/ticket_spinlock.h>
> +#elif defined(CONFIG_RISCV_QUEUED_SPINLOCKS)
> +#include <asm/qspinlock.h>
> +#endif
>   
>   #endif


Thanks for testing this config (when I did not...)!

I came up with something slightly different, but same fix in the end, 
thanks!


>
>> +DEFINE_STATIC_KEY_TRUE(qspinlock_key);
>> +EXPORT_SYMBOL(qspinlock_key);
>> +
>> +static void __init riscv_spinlock_init(void)
>> +{
>> +	char *using_ext;
>> +
>> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&
>> +	    IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {
>> +		using_ext = "using Zabha";
>> +
>> +		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0, RISCV_ISA_EXT_ZACAS, 1)
>> +			 : : : : no_zacas);
>> +		asm goto(ALTERNATIVE("nop", "j %[qspinlock]", 0, RISCV_ISA_EXT_ZABHA, 1)
>> +			 : : : : qspinlock);
>> +	}
>> +
>> +no_zacas:
>> +	using_ext = "using Ziccrse";
>> +	asm goto(ALTERNATIVE("nop", "j %[qspinlock]", 0,
>> +			     RISCV_ISA_EXT_ZICCRSE, 1)
>> +		 : : : : qspinlock);
>> +
>> +	static_branch_disable(&qspinlock_key);
>> +	pr_info("Ticket spinlock: enabled\n");
>> +
>> +	return;
>> +
>> +qspinlock:
>> +	pr_info("Queued spinlock %s: enabled\n", using_ext);
>> +}
>> +
> Your commit message suggests that riscv_spinlock_init() doesn't need to
> do anything if CONFIG_RISCV_COMBO_SPINLOCKS=n:
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index d7c31c9b8ead2..b2be1b0b700d2 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -244,6 +244,7 @@ static void __init parse_dtb(void)
>   #endif
>   }
>   
> +#if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
>   DEFINE_STATIC_KEY_TRUE(qspinlock_key);
>   EXPORT_SYMBOL(qspinlock_key);
>   
> @@ -275,6 +276,11 @@ static void __init riscv_spinlock_init(void)
>   qspinlock:
>   	pr_info("Queued spinlock %s: enabled\n", using_ext);
>   }
> +#else
> +static void __init riscv_spinlock_init(void)
> +{
> +}
> +#endif
>   
>   extern void __init init_rt_signal_env(void);
>
>
> Makes sense?  What am I missing?


Totally makes sense, I completely overlooked this when I added the 
ticket/queued configs, thanks for taking the time to look into it.

That will be fixed in the next version.

Thanks again,

Alex


>
>    Andrea
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
