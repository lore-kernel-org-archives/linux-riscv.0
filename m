Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52634C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:32:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235BA21479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AtlMOXet";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fB72dc+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 235BA21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lo2y4B9PAWdDIx0gHmmjD4Jg2MTIq/MbLkTOKh55MR0=; b=AtlMOXetN+qp/J
	5hCgyCp9XMUume5gNFFYO8WzO7ylbslNMvk4PryUbS9DRfuPQENKSjCCAHwiDLlGyz3ely4MNAh+z
	BmlSCmeSxokDtDgXfyh/Jmy1uV68abF2sHGKtOVC0Ixt/wtYNuk8D9YnOIzVuDl10bD/crd5hba2f
	jbQMefA9hu3GJviDOdVzXBw7PGmxq0sBsJAdmB17c8hea+dSlZUFD6xhaRXiQ4VpVTGeIB2YnCRn4
	MvRanPLT+f69k0aQw3e4a3IWRXkj2HNl/a6yki/XMb7fX3tzvzcB5OVM0KdDDmmpJWa3ItLW9EhuY
	YyjJHQScoG5wQDDMwNRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzeO-0002nn-9L; Thu, 18 Apr 2019 05:31:56 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzeE-0002fR-Ln
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 05:31:49 +0000
Received: by mail-ua1-x943.google.com with SMTP id h4so376116uaj.9
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wdpJY50vmVyqQ1PqbhbBydmQ/xHEoQMQSJOB3RmLp0Q=;
 b=fB72dc+b7uA3lZK0fM9coqknIBIeertJI7ikFyB/vi7+UhDzB4cM6BaPZBCgwdkMbP
 I6OuKXmEOkVuVbufdWR2exS5gdkih7q9m6sKqDvBv1Q9ecvRbsRvxC0p09WYg4f8ZR9Y
 lqwGyEe02y/u1sfKZHci1wzyCEwvxabZUD3T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wdpJY50vmVyqQ1PqbhbBydmQ/xHEoQMQSJOB3RmLp0Q=;
 b=jvmceqpWscNzbmvW4PG3tyIgM40gQwUxAwwiiBnoPE2XBgg7IwNdOoq3uesilKCyu7
 UeAEGhMPcpqxeDfGhP3EfMnnmL+2t1l3VQbdh02QljSXH3ajQOS5OCK0xSeeDIcp+ShS
 NhuKQfTTUTZaHtmn6e8lRHGwKQ+uBL0NGnU4fkUr1tlGvXJNdrM6uaHBwthJYdqh6DuF
 n7UG6qVT44UEblkHC5YTZ/wH9D0VGct7sS8PekA3cHjuaYuLvUh7yUHCRdb9JQqmjOFc
 Uofdya+20SxeLb/HAMAa+iPlFLnI0Iyxt0O+CCdwm74jN2O5L6stcsJVyF68iGHaJ6JO
 BoMQ==
X-Gm-Message-State: APjAAAVSLcaJjvPWJ+ZPQI4/irqEC1mITfB+b6vd6mfzFj6gfRdEFQ7z
 CQNrMrGfeJoswNpHUMdelSqxhqETaBs=
X-Google-Smtp-Source: APXvYqxjeqh15D2F46vqLQqnG60LWbPgjEIUlUp694k2xe71zEMdmLyOFxjUOAuO+Al9t/TwW097ZQ==
X-Received: by 2002:ab0:1646:: with SMTP id l6mr42510481uae.75.1555565504944; 
 Wed, 17 Apr 2019 22:31:44 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179])
 by smtp.gmail.com with ESMTPSA id t128sm493092vka.36.2019.04.17.22.31.43
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 22:31:44 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id x194so221206vke.0
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:31:43 -0700 (PDT)
X-Received: by 2002:a1f:3458:: with SMTP id b85mr50194265vka.4.1555565503193; 
 Wed, 17 Apr 2019 22:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-11-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-11-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 00:31:32 -0500
X-Gmail-Original-Message-ID: <CAGXu5jJSgHKjrQ2Z-aKofqroUDBjPnLOjiORw9pHT_cANhAqpg@mail.gmail.com>
Message-ID: <CAGXu5jJSgHKjrQ2Z-aKofqroUDBjPnLOjiORw9pHT_cANhAqpg@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] mips: Use generic mmap top-down layout
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_223146_708774_A4F0D3B9 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 12:33 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> mips uses a top-down layout by default that fits the generic functions.
> At the same time, this commit allows to fix problem uncovered
> and not fixed for mips here:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1429066.html
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/mips/Kconfig                 |  1 +
>  arch/mips/include/asm/processor.h |  5 ---
>  arch/mips/mm/mmap.c               | 67 -------------------------------
>  3 files changed, 1 insertion(+), 72 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 4a5f5b0ee9a9..ec2f07561e4d 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -14,6 +14,7 @@ config MIPS
>         select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
>         select ARCH_USE_QUEUED_RWLOCKS
>         select ARCH_USE_QUEUED_SPINLOCKS
> +       select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select ARCH_WANT_IPC_PARSE_VERSION
>         select BUILDTIME_EXTABLE_SORT
>         select CLONE_BACKWARDS
> diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
> index aca909bd7841..fba18d4a9190 100644
> --- a/arch/mips/include/asm/processor.h
> +++ b/arch/mips/include/asm/processor.h
> @@ -29,11 +29,6 @@
>
>  extern unsigned int vced_count, vcei_count;
>
> -/*
> - * MIPS does have an arch_pick_mmap_layout()
> - */
> -#define HAVE_ARCH_PICK_MMAP_LAYOUT 1
> -
>  #ifdef CONFIG_32BIT
>  #ifdef CONFIG_KVM_GUEST
>  /* User space process size is limited to 1GB in KVM Guest Mode */
> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
> index ffbe69f3a7d9..61e65a69bb09 100644
> --- a/arch/mips/mm/mmap.c
> +++ b/arch/mips/mm/mmap.c
> @@ -20,43 +20,6 @@
>  unsigned long shm_align_mask = PAGE_SIZE - 1;  /* Sane caches */
>  EXPORT_SYMBOL(shm_align_mask);
>
> -/* gap between mmap and stack */
> -#define MIN_GAP                (128*1024*1024UL)
> -#define MAX_GAP                ((STACK_TOP)/6*5)
> -#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
> -
> -static int mmap_is_legacy(struct rlimit *rlim_stack)
> -{
> -       if (current->personality & ADDR_COMPAT_LAYOUT)
> -               return 1;
> -
> -       if (rlim_stack->rlim_cur == RLIM_INFINITY)
> -               return 1;
> -
> -       return sysctl_legacy_va_layout;
> -}
> -
> -static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
> -{
> -       unsigned long gap = rlim_stack->rlim_cur;
> -       unsigned long pad = stack_guard_gap;
> -
> -       /* Account for stack randomization if necessary */
> -       if (current->flags & PF_RANDOMIZE)
> -               pad += (STACK_RND_MASK << PAGE_SHIFT);
> -
> -       /* Values close to RLIM_INFINITY can overflow. */
> -       if (gap + pad > gap)
> -               gap += pad;
> -
> -       if (gap < MIN_GAP)
> -               gap = MIN_GAP;
> -       else if (gap > MAX_GAP)
> -               gap = MAX_GAP;
> -
> -       return PAGE_ALIGN(STACK_TOP - gap - rnd);
> -}
> -
>  #define COLOUR_ALIGN(addr, pgoff)                              \
>         ((((addr) + shm_align_mask) & ~shm_align_mask) +        \
>          (((pgoff) << PAGE_SHIFT) & shm_align_mask))
> @@ -154,36 +117,6 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>                         addr0, len, pgoff, flags, DOWN);
>  }
>
> -unsigned long arch_mmap_rnd(void)
> -{
> -       unsigned long rnd;
> -
> -#ifdef CONFIG_COMPAT
> -       if (TASK_IS_32BIT_ADDR)
> -               rnd = get_random_long() & ((1UL << mmap_rnd_compat_bits) - 1);
> -       else
> -#endif /* CONFIG_COMPAT */
> -               rnd = get_random_long() & ((1UL << mmap_rnd_bits) - 1);
> -
> -       return rnd << PAGE_SHIFT;
> -}
> -
> -void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
> -{
> -       unsigned long random_factor = 0UL;
> -
> -       if (current->flags & PF_RANDOMIZE)
> -               random_factor = arch_mmap_rnd();
> -
> -       if (mmap_is_legacy(rlim_stack)) {
> -               mm->mmap_base = TASK_UNMAPPED_BASE + random_factor;
> -               mm->get_unmapped_area = arch_get_unmapped_area;
> -       } else {
> -               mm->mmap_base = mmap_base(random_factor, rlim_stack);
> -               mm->get_unmapped_area = arch_get_unmapped_area_topdown;
> -       }
> -}
> -
>  static inline unsigned long brk_rnd(void)
>  {
>         unsigned long rnd = get_random_long();
> --
> 2.20.1
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
