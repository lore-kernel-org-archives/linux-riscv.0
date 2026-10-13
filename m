Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A01ECA9ED2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 08:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ud/Luht0TYnoj1M7O4tSPiQp9icj/pRX7eMXHCuEXw=; b=WIasFdVf90I8gD
	LDH4fQijxG3rPIusnIFGoB4x2zA62RgGQqfGzqWg5BJA4bcdnbfxJTE8J5w3EA02+pj3sjjmMTwup
	g6bkIXVxP2YEVUy7/8Vm8vPLQxv00u4h3rxQnHwu1HwbsctUY9q8defWcYw597j+Lo5jHzacMm2+f
	uZlh1gdrbNB8zED3N4SsrKvPrMSVicQP9yafOLZEPX24a7prKguBhBt0M/vmuciqY1/B1P4QdsUBy
	8LZDI28yxKnXdR5K4QnFRcgRsDf8Jh+Uik6JsPKY/yo9mUkWC9f4b9Y0rarfknbMSBRhhmqXkjOji
	oGmfWUJfmLXAyMOJBSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY59-0000000CM80-2AUq;
	Tue, 13 Oct 2026 08:41:59 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY56-0000000CM77-2XqB
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 08:41:58 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1489898241.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 01:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880915; x=1792485715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7d2pO7Vy0vJkBeOnC8nnzEd3ICQOoYmzmIOgS10xlyA=;
        b=EDEuaAtXqwGlwBpvzH3SiMjy/tNqInyGjMAI3HVpXdOlk1wrJXYirDgZL4iXgBjQxa
         4HALn90S1rroZLpiJ2nAWVwC15Mf579KYpDU55QoiliCjcMPS4Qo/FbBF+l1v1Gu4Bcf
         qmyCvhZwLjv7TA33w6jBo5m1kbcUrTPkvPCTHX6OKYM5qVM0xKLf5i1Sat3A7gAwHTYQ
         t1n8/dISMUuaj4jJDEFLvXtPwtj80MN5xQayuWUNMYD3Mmfp2luXS6tNB6WmApa25o3O
         rl9FLlZuulVwzbui28DDGDnlNWUk+cEbekYj4R3/aIssxn1oFnpLyJGymZQj4jtL0ZJ4
         qkpg==
X-Forwarded-Encrypted: i=1; AKwUvBy0IdkUYjFeVO2eqW/ZBkr6w9wGN5pa63g5I0X/GJF6bwRhPTtGk4PjpmDqpovXyzpfxNWOWNMxH2ldYw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLwL4dMrRGUNkJ1P6nwZ3NNsBp8u+Mh+PnMWeccdg8NXnBVDlYE
	eKgp2L7a9wXb21svXZY98UxYryPau8DURMDWHmfw960klY0ScQoB19BtOiDQ39DN
X-Gm-Gg: AYBFou3WwZq+FL8QbdwP6cHbfR3hVU5xwuM8UaiQLWPbvUsZt9ZX7vN7FYImI98YZ30
	nKTXUn4xWLnlCGXZlEwe9W5lwXwARwUlLoZx++xJ41sAxuzth9L5Aeqr/I8CBMNcb3bkQJJzp6c
	U45te8w/B9OoSqmHV+BFsVWwcVuWGaXpWj9QL3D3cY2VV5WU08hTWH4HaGjLv5kQuqcdc/GL7xi
	inFjxx8kIha+/fgU7HW6VuBZau0kEbYVK457mZ8atqt6COcdPCE/ZiqE9W7Z10EOJIQV9nDVsvv
	ZfIXXrzhqRw9KGkGHu99Qi4zWwOCvFDuv8F06H1KonEZn0bS6S99jmzieQtVcnFtknDpDikikvc
	lnmhx6cksfDf5wUfEE4dMOY6CzqZ9/mE7dkjQLN9tKgBKKbVkHjlqCA+K5Bu50yS3Q9MIgD+kJr
	z22grd9ull4DR28gE5t/k9maKLEVdRc1s6eC2hQagWNc/91/FsQlmzIhI8enV8jqxZUV0CIi1eJ
	xjmT0ioAS2mSmlVj0yGjgf70dG/BymRlbdo
X-Received: by 2002:a05:6102:50a7:b0:7c3:a114:99a7 with SMTP id ada2fe7eead31-7cb3a065818mr3860161137.14.1791880915023;
        Tue, 13 Oct 2026 01:41:55 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d38097sm7523558241.1.2026.10.13.01.41.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:41:52 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7c19c6721a3so1767734137.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 01:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwROgVDcIu5UnS2oi/dMGi96Xy7QZ8H7qk1TPFNCZZvq+IL5TV6qg9Yor5RRPJcimEiF4ksBkkzGA2+Q==@lists.infradead.org
X-Received: by 2002:a05:6102:f8c:b0:7c3:68c9:d20a with SMTP id
 ada2fe7eead31-7cb3a005996mr3569324137.8.1791880911423; Tue, 13 Oct 2026
 01:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261008150045.28905-1-jszhang@kernel.org> <20261008150045.28905-2-jszhang@kernel.org>
In-Reply-To: <20261008150045.28905-2-jszhang@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 10:41:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTwPuTXTg_e7OCM289ALmHQsS1Uz+0z5y=CgsPGZt8Yg@mail.gmail.com>
X-Gm-Features: AclHuK9fEs20wSyQEl5Tf_pA55385vtFfDZFH1OesZnNWKkOdRpWR450rrFg9KU
Message-ID: <CAMuHMdVTwPuTXTg_e7OCM289ALmHQsS1Uz+0z5y=CgsPGZt8Yg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] riscv: remove RISCV_ALTERNATIVE Kconfig option
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_014156_656183_346CF4C2 
X-CRM114-Status: GOOD (  18.82  )
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

Hi Jisheng.

On Thu, 8 Oct 2026 at 17:22, Jisheng Zhang <jszhang@kernel.org> wrote:
> riscv always selects RISCV_ALTERNATIVE now, so we can remove this
> Kconfig option and enable RISCV_ALTERNATIVE code unconditionally.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch, which is now commit b924210f542e13c7 ("riscv:
remove RISCV_ALTERNATIVE Kconfig option") in riscv/for-next.

> ---
>  arch/riscv/Kconfig                          | 23 --------------------
>  arch/riscv/Kconfig.errata                   |  5 +----
>  arch/riscv/include/asm/alternative-macros.h | 24 ---------------------
>  arch/riscv/include/asm/alternative.h        | 10 ---------
>  arch/riscv/include/asm/cpufeature-macros.h  | 10 ++-------
>  arch/riscv/include/asm/cpufeature.h         |  6 ++----
>  arch/riscv/include/asm/vendor_extensions.h  | 18 ++++++----------
>  arch/riscv/kernel/Makefile                  |  2 +-
>  arch/riscv/kernel/cpufeature.c              |  2 --
>  9 files changed, 12 insertions(+), 88 deletions(-)

Unfortunately you forgot to remove all references outside arch/riscv/,
now making it impossible to enable support for RZ/Five.

I have submitted a fix "[PATCH] perf/renesas: Remove remaining
RISCV_ALTERNATIVE references"
https://lore.kernel.org/fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
