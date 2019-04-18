Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6398FC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34EE121479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZVqJeEz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JlYc5LnY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34EE121479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1M6B0s55mw74Ct1SG7jAMu1tlgSM9PB0PfKIqXDHNU=; b=FZVqJeEzcuBb6I
	YkeNREnq70e08l8H/eiGhVAJwHe0FtJR5CRJRT2RdJQDkQOJkaZw6NdIobyBAt4QI31Sv/PKeodlf
	vo57iQWMf9o78VGYGJAN0LceoAa8ilm3kaTXI3OCk3UtTnDKqxgXPjD4IvIbaslTJW+r5TsP2FZzZ
	d6UamvRCd3Ro/Dakq397Vf/RCP6AAjJ23KytzH/IAD4mqyhXBWVtlXHvrMjSGDFzXNuFonMnBj71T
	RpfAVMVJhIckxB9Xp27Ez3frEaeKo7RmBHsUlgxpn66LDCx9vTsdIGszYfvzJhhjUmJQiOjxw6qbc
	zMwylUcEUB/ZxYj26Atw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzZD-000899-5K; Thu, 18 Apr 2019 05:26:35 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzZ5-00081L-9X
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 05:26:28 +0000
Received: by mail-vs1-xe41.google.com with SMTP id n4so511053vsm.3
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QVoqbwyN443Uxffv4ADeYKBc3zmgcqP5SCaKkpPU0Ag=;
 b=JlYc5LnYPCwWgX5oqj7ynsTkg9HwSCKe5lZ5zN605L7Uvo1glCbNDCtQfk8GyTRI13
 ROZ9wJjLihPw49RRrvvr1sPQAGB3Bk/uVz5KXlTfPr4zLd1Qk3TnxysN1P6IizUWSim9
 CZommiTKB0IOC+Nf2V/4WJTnJI7JYYMqf0DOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QVoqbwyN443Uxffv4ADeYKBc3zmgcqP5SCaKkpPU0Ag=;
 b=U7u4ZVuOdMjk9YgxuUUb90AZ8hk0hAkpbGYqa/AGG/LcvdstgUuxNw6ptu5mUiBIHU
 GpkSRGsY4iEgHYu0o3fOOLZwI+/OIQxPSkGqzOxNQikoni2nSKT7qLADJVd6g9NrIecR
 qfgwKuH01qUzlvabrSIU5oD3eS0J+XLyNyzdhvoW5XToZ8M3vj/dvhopW/3A3cysgAM+
 1Puzpk+ssGIWgPpFaHwVuLarqY8RMSINiqSmLLZFZlqcZqAlRKJjH8PTfuPzsLNzuZYO
 ETZPx0AQbYmINLu6avjMuQYxjHo1lgVVkcxNkYvCN+hn3KL/MJ5OKxmm8natYcHZ3emq
 IYSQ==
X-Gm-Message-State: APjAAAWp4yyVKJRhVv9Lct7CAUmKC5m4TTV0v8zFLVG+5Ip9jzff/g5Z
 eoUhBe3P0bwG+XjkXD26qZyVzm6WgS8=
X-Google-Smtp-Source: APXvYqyYP6ZZ97EdUXAwP8Vy5wwtJiPd9gpIgjS8AaBcg0vYB6h/NEMztOhQ9Xois1MnOfRqPElnpw==
X-Received: by 2002:a67:8494:: with SMTP id g142mr49622654vsd.28.1555565186130; 
 Wed, 17 Apr 2019 22:26:26 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id b197sm1238325vkd.9.2019.04.17.22.26.23
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 22:26:23 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id t78so521091vsc.1
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:26:23 -0700 (PDT)
X-Received: by 2002:a67:eecb:: with SMTP id o11mr50384241vsp.66.1555565182826; 
 Wed, 17 Apr 2019 22:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-6-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-6-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 00:26:11 -0500
X-Gmail-Original-Message-ID: <CAGXu5j+V_kJk-Lu=u82CrA291EPpgJtX951EKigprozXt7=ORA@mail.gmail.com>
Message-ID: <CAGXu5j+V_kJk-Lu=u82CrA291EPpgJtX951EKigprozXt7=ORA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] arm: Properly account for stack randomization
 and stack guard gap
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_222627_330219_49A94EC4 
X-CRM114-Status: GOOD (  18.00  )
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

On Wed, Apr 17, 2019 at 12:28 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> This commit takes care of stack randomization and stack guard gap when
> computing mmap base address and checks if the task asked for randomization.
> This fixes the problem uncovered and not fixed for arm here:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1429066.html

Please use the official archive instead. This includes headers, linked
patches, etc:
https://lkml.kernel.org/r/20170622200033.25714-1-riel@redhat.com

> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/arm/mm/mmap.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
> index f866870db749..bff3d00bda5b 100644
> --- a/arch/arm/mm/mmap.c
> +++ b/arch/arm/mm/mmap.c
> @@ -18,8 +18,9 @@
>          (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
>
>  /* gap between mmap and stack */
> -#define MIN_GAP (128*1024*1024UL)
> -#define MAX_GAP ((TASK_SIZE)/6*5)
> +#define MIN_GAP                (128*1024*1024UL)

Might as well fix this up as SIZE_128M

> +#define MAX_GAP                ((TASK_SIZE)/6*5)
> +#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))

STACK_RND_MASK is already defined so you don't need to add it here, yes?

>  static int mmap_is_legacy(struct rlimit *rlim_stack)
>  {
> @@ -35,6 +36,15 @@ static int mmap_is_legacy(struct rlimit *rlim_stack)
>  static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>  {
>         unsigned long gap = rlim_stack->rlim_cur;
> +       unsigned long pad = stack_guard_gap;
> +
> +       /* Account for stack randomization if necessary */
> +       if (current->flags & PF_RANDOMIZE)
> +               pad += (STACK_RND_MASK << PAGE_SHIFT);
> +
> +       /* Values close to RLIM_INFINITY can overflow. */
> +       if (gap + pad > gap)
> +               gap += pad;
>
>         if (gap < MIN_GAP)
>                 gap = MIN_GAP;
> --
> 2.20.1
>

But otherwise, yes:

Acked-by: Kees Cook <keescook@chromium.org>

--
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
