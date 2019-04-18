Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBB0C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:08:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B10D204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SA8lWyvy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B10D204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gH0+WtOJuCdVTy91xO4P6o858O1RE2Hpwxva9+8hKUk=; b=SA8lWyvyZO/1V9nxyWJpsj8rr
	D04SJo9BI7v9JBkiAHq61g6ydEemq6Pe9maozcO6u1TAebwdy0UtjCklRqyCPvS+Qz00JIXAiTMXY
	d0HX+TM0Zq2ga3QjXX8cRh1MocWC77Kh2o9tf1wbKt3+JxewNhu30KN/eM2/L6HL27jz9NSLhGk0M
	jDCHYmFckZlybTlJVeCO0rk7deZM1zWPJGRdqF3nOXM+FIcT+aP+iaxoScy9uBQRymG9615Qd1flb
	OqPMI3nuirsgLH025j+MuXC1B1WZ7RYi4uSPf5uXVHLLlaftWiSAv6Nk3BSv8iyLQb4FjtZqnDTuR
	waiyOYBdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH0E2-0008Os-PR; Thu, 18 Apr 2019 06:08:46 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH0Ds-0008GM-TD; Thu, 18 Apr 2019 06:08:38 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5721320005;
 Thu, 18 Apr 2019 06:08:31 +0000 (UTC)
Subject: Re: [PATCH v3 10/11] mips: Use generic mmap top-down layout
To: Kees Cook <keescook@chromium.org>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-11-alex@ghiti.fr>
 <CAGXu5jJSgHKjrQ2Z-aKofqroUDBjPnLOjiORw9pHT_cANhAqpg@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <82116ac6-1997-b52d-b1dd-98cc97e731bf@ghiti.fr>
Date: Thu, 18 Apr 2019 02:08:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAGXu5jJSgHKjrQ2Z-aKofqroUDBjPnLOjiORw9pHT_cANhAqpg@mail.gmail.com>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_230837_236211_03DA6333 
X-CRM114-Status: GOOD (  16.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/18/19 1:31 AM, Kees Cook wrote:
> On Wed, Apr 17, 2019 at 12:33 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>> mips uses a top-down layout by default that fits the generic functions.
>> At the same time, this commit allows to fix problem uncovered
>> and not fixed for mips here:
>> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1429066.html
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Acked-by: Kees Cook <keescook@chromium.org>

Thanks !


>
> -Kees
>
>> ---
>>   arch/mips/Kconfig                 |  1 +
>>   arch/mips/include/asm/processor.h |  5 ---
>>   arch/mips/mm/mmap.c               | 67 -------------------------------
>>   3 files changed, 1 insertion(+), 72 deletions(-)
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 4a5f5b0ee9a9..ec2f07561e4d 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -14,6 +14,7 @@ config MIPS
>>          select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
>>          select ARCH_USE_QUEUED_RWLOCKS
>>          select ARCH_USE_QUEUED_SPINLOCKS
>> +       select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>>          select ARCH_WANT_IPC_PARSE_VERSION
>>          select BUILDTIME_EXTABLE_SORT
>>          select CLONE_BACKWARDS
>> diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
>> index aca909bd7841..fba18d4a9190 100644
>> --- a/arch/mips/include/asm/processor.h
>> +++ b/arch/mips/include/asm/processor.h
>> @@ -29,11 +29,6 @@
>>
>>   extern unsigned int vced_count, vcei_count;
>>
>> -/*
>> - * MIPS does have an arch_pick_mmap_layout()
>> - */
>> -#define HAVE_ARCH_PICK_MMAP_LAYOUT 1
>> -
>>   #ifdef CONFIG_32BIT
>>   #ifdef CONFIG_KVM_GUEST
>>   /* User space process size is limited to 1GB in KVM Guest Mode */
>> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
>> index ffbe69f3a7d9..61e65a69bb09 100644
>> --- a/arch/mips/mm/mmap.c
>> +++ b/arch/mips/mm/mmap.c
>> @@ -20,43 +20,6 @@
>>   unsigned long shm_align_mask = PAGE_SIZE - 1;  /* Sane caches */
>>   EXPORT_SYMBOL(shm_align_mask);
>>
>> -/* gap between mmap and stack */
>> -#define MIN_GAP                (128*1024*1024UL)
>> -#define MAX_GAP                ((STACK_TOP)/6*5)
>> -#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
>> -
>> -static int mmap_is_legacy(struct rlimit *rlim_stack)
>> -{
>> -       if (current->personality & ADDR_COMPAT_LAYOUT)
>> -               return 1;
>> -
>> -       if (rlim_stack->rlim_cur == RLIM_INFINITY)
>> -               return 1;
>> -
>> -       return sysctl_legacy_va_layout;
>> -}
>> -
>> -static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>> -{
>> -       unsigned long gap = rlim_stack->rlim_cur;
>> -       unsigned long pad = stack_guard_gap;
>> -
>> -       /* Account for stack randomization if necessary */
>> -       if (current->flags & PF_RANDOMIZE)
>> -               pad += (STACK_RND_MASK << PAGE_SHIFT);
>> -
>> -       /* Values close to RLIM_INFINITY can overflow. */
>> -       if (gap + pad > gap)
>> -               gap += pad;
>> -
>> -       if (gap < MIN_GAP)
>> -               gap = MIN_GAP;
>> -       else if (gap > MAX_GAP)
>> -               gap = MAX_GAP;
>> -
>> -       return PAGE_ALIGN(STACK_TOP - gap - rnd);
>> -}
>> -
>>   #define COLOUR_ALIGN(addr, pgoff)                              \
>>          ((((addr) + shm_align_mask) & ~shm_align_mask) +        \
>>           (((pgoff) << PAGE_SHIFT) & shm_align_mask))
>> @@ -154,36 +117,6 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>>                          addr0, len, pgoff, flags, DOWN);
>>   }
>>
>> -unsigned long arch_mmap_rnd(void)
>> -{
>> -       unsigned long rnd;
>> -
>> -#ifdef CONFIG_COMPAT
>> -       if (TASK_IS_32BIT_ADDR)
>> -               rnd = get_random_long() & ((1UL << mmap_rnd_compat_bits) - 1);
>> -       else
>> -#endif /* CONFIG_COMPAT */
>> -               rnd = get_random_long() & ((1UL << mmap_rnd_bits) - 1);
>> -
>> -       return rnd << PAGE_SHIFT;
>> -}
>> -
>> -void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
>> -{
>> -       unsigned long random_factor = 0UL;
>> -
>> -       if (current->flags & PF_RANDOMIZE)
>> -               random_factor = arch_mmap_rnd();
>> -
>> -       if (mmap_is_legacy(rlim_stack)) {
>> -               mm->mmap_base = TASK_UNMAPPED_BASE + random_factor;
>> -               mm->get_unmapped_area = arch_get_unmapped_area;
>> -       } else {
>> -               mm->mmap_base = mmap_base(random_factor, rlim_stack);
>> -               mm->get_unmapped_area = arch_get_unmapped_area_topdown;
>> -       }
>> -}
>> -
>>   static inline unsigned long brk_rnd(void)
>>   {
>>          unsigned long rnd = get_random_long();
>> --
>> 2.20.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
