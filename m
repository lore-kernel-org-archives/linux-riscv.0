Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDE6C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 15:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5532760EB9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 15:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5532760EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIokh3KXt0A4G/pXq/a2NHe4vJS1unpqBUigkr4YL+0=; b=3nBiScHoVsuC/T
	QUSr7DoIAJL7h5b1T3lkFwNaAz/86cfuPryezY0fMbbDWtcFQb6pohfnYafE4BxwAbLxfIahb8Ko9
	1BWLGRGCrZfeLezRLC+QoMBAkMwQyjo+YnbA7/LSDUvziPW281qyxwvrCFasFuk69Bj5Y8X9UBZop
	hI5F926lA0AzBUuhrg1NUEsCmGZg8Td5du3aXfxeEF33KEgLJql1xzmgJeIJPkyrF0bqFBuWgQeWo
	6tDxaSPq4FuQxIMbwzj4xXRDOpaDn8g/6whaGdkb7FX5BzU7yq/NBvbBh7hkk0uLdvl3jgeozGiO5
	+6xiHIJ8lICKTLwik+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDqGl-007YuR-Tj; Wed, 11 Aug 2021 15:35:51 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDqGY-007YsU-GE; Wed, 11 Aug 2021 15:35:39 +0000
Received: by mail-vs1-f52.google.com with SMTP id a8so1786308vsl.4;
 Wed, 11 Aug 2021 08:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qe0iSj8XpU18YU856j4Cl+K1mgU1eag6gHjOJIBodYU=;
 b=P8ioM/6aS+6ZSBGhiyt7akiAuJiSscZnECxNbEKOaRe0gagNrlxWqqo4QDdc7RsdJP
 BLpXrhWoq+EaAShoOU5kDyM55CgSdfeWI5/TRHb3SsG8dj34IA6Ggrs49BhspKqylETg
 SF59HHaSoW+k00/svX2D9tOR+3+A2WWLF97t6v+sysP/p5q+tEoH78lMzxhp5BldD1Ml
 QjFMKBVVhVDbwEKBSNkHHdahBmE1cgFKVbgaOYchpdjc3F6hClR61Tg5CE0Kv/sC+ZH6
 2umTtefZlItt3OO8lpf6lM9BA5tOwIfM2+EOmT3iTucaMxR3tlS7Kw/qILwek9zncgWy
 eOHw==
X-Gm-Message-State: AOAM530Yff/apTAUomU5Qb8KubcDs7waA6OBbYzPujC47p2Pkl3fVDVh
 kcsLM87n6Ui99fRji43IXuR90SLYchGjcAJgR3M=
X-Google-Smtp-Source: ABdhPJyCg7XeMMJOVeEoBRA0hgH3tr2A9kDf4d5be/Soj53sLrczZ+iXFRzYK6VNuP5kM7qaaKYjO/TzUNz0MI9TmgQ=
X-Received: by 2002:a67:8009:: with SMTP id b9mr27769636vsd.18.1628696137555; 
 Wed, 11 Aug 2021 08:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be>
 <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
In-Reply-To: <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Aug 2021 17:35:26 +0200
Message-ID: <CAMuHMdVFJ_qGs0V7f+XhfD6v3WnkMJ98fO31sCRSNaeS89XXUQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] MIPS: Avoid future duplicate elf core header
 reservation
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, 
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Frank Rowand <frowand.list@gmail.com>, 
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 kexec@lists.infradead.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_083538_580745_A4D686EA 
X-CRM114-Status: GOOD (  29.64  )
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

On Wed, Aug 11, 2021 at 10:51 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Prepare for early_init_fdt_scan_reserved_mem() reserving the memory
> occupied by an elf core header described in the device tree.
> As arch_mem_init() calls early_init_fdt_scan_reserved_mem() before
> mips_reserve_vmcore(), the latter needs to check if the memory has
> already been reserved before.
>
> Note that mips_reserve_vmcore() cannot just be removed, as not all MIPS
> systems use DT.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - New.
> ---
>  arch/mips/kernel/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 23a140327a0bac1b..4693add05743d78b 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -429,7 +429,8 @@ static void __init mips_reserve_vmcore(void)
>         pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
>                 (unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
>
> -       memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> +       if (!memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)

As pointed out by lkp, there's a closing parenthesis missing.

/me hides back under his rock.

> +               memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
>  #endif

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
