Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB12C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 01:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUgQPZTD7UtNZ1qxg18qGf7lzn/r09yRxXfbaflbRTM=; b=f+uHFKxnUBvqXt
	8XAnV0cq4cV8tUfh5U3eoYzBjrpQXsFW1YOtBXyXrVpAnzgHLxEAo1OGC52ctGIKUUCzV27MYTghv
	ArnDnpAVH+uhd7iu6Hv61D1D4uNMMeKOLahkFP/YUduF3Gz13rWKTJjlxJfIFn37+/tMCBRT5+2JG
	FOV0+5YjcLO1mBL5GdnpE8uIENxVlB9GTtMmGEyzP2avvF7yzU600tewfcuTanYR+vpl1g1xYUnzS
	zaP+wqNWQw29inYOGYKlrUWKq5Ho5Ekxm0OOm2zTpOr4urUHJCz9VFx4swf6WM9BfqqQY++iEgYmk
	tUNAvqTVE2cE88jRSRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq29N-007qF4-Eh; Wed, 02 Nov 2022 01:02:37 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq29K-007qDu-4d
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 01:02:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id q9so41521539ejd.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 18:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1NL65ctDu7Unb6G0NzPXkABlskH655QCWon4X0fuchI=;
        b=hGawBFzd27Ll/+ulBi0YThZo+OCE5WQppu6U/JIsgVX9F19ZlS0csCHGEXm0OgpvMb
         wpYrl+6aUFV00YDV+ZM14r6Vi1whkq7+IAblyUccWIXB7RouuehTaVLg/caaSzrgsxs5
         zUetBOVuUl1O3Uh6fz0NprxI1JBc6ArkdhCC8skOvJMQqBStALqoeKSSUCLr1VnqSvpL
         OzE5sWKTb8zxNC0/bUuy30pbNRr7J1Ry4ykBUCezoybx7125w1dwjSN/49CUF38idloA
         SPuuSJOUUC2k8xQHm0A5eJ/C80NcViOSrRgHjQ+NbOBjTQDO0NlB46bvWWSXrjm2YRsx
         w/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NL65ctDu7Unb6G0NzPXkABlskH655QCWon4X0fuchI=;
        b=T27HD/3Ua4baoZGqaJebuhHmypiv5835hiMLsTECDHNIPZyx2Rd98HkCz9S/MxsqE+
         FivL7cKo9wtygKso37+8iEwrS1J1XVenZI5DALSJXobDRfLsxm7511gNwhabeFhJsCKN
         f6vjwSIdkeADNgOxQtzu5b/jDAf3MRB+MSUz5BNNruEk0FG9BkdirXyBBqQGUitq48AS
         DctQyZ5cev/m3AdU2WoHwMIZWFmFQzn8pM18sKt7caS6cYsFBGf2cQhPBUDyYBtrTtte
         lRjfYQmUpbjG9Ryqwm/Ep577P29O86uoq7xJM3LsZIDt9M3a34uL9Wedu6/dHzuMKZJG
         towg==
X-Gm-Message-State: ACrzQf2M55uR3veakRqwxPKYZzeXHy7eSDCOziwfLqxstLU4QXaeT07i
	RXud5koXZ9rOwC+R5xI0exApTf1E9yJpPRme8Ag=
X-Google-Smtp-Source: AMsMyM6sS5NbLcirE7cuNJF2ENVum0rp7FXZA+0mfV0A+E4UsSVJu+1ylaOAVgpzZgqxdwewr0jHMytjSwRGzUq5nGM=
X-Received: by 2002:a17:906:371a:b0:7ad:c01c:6fa0 with SMTP id
 d26-20020a170906371a00b007adc01c6fa0mr16456257ejc.267.1667350950657; Tue, 01
 Nov 2022 18:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXqh=wQaTYTuQ8vq__=2jvqRx1i9fpQsVPKpBJrBOy1Hw@mail.gmail.com>
In-Reply-To: <CAMuHMdXqh=wQaTYTuQ8vq__=2jvqRx1i9fpQsVPKpBJrBOy1Hw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Nov 2022 01:02:04 +0000
Message-ID: <CA+V-a8uDo83ZvCwQdDtxEzLUDvs42AP3Kqd36tuB3+vYuG8WUw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.co>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_180234_219923_83DE6F6F 
X-CRM114-Status: GOOD (  28.48  )
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

Hi Geert,

On Tue, Nov 1, 2022 at 12:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Oct 20, 2022 at 12:02 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the AX45MP core, cache coherency is a specification option so it may
> > not be supported. In this case DMA will fail. As a workaround, firstly we
> > allocate a global dma coherent pool from which DMA allocations are taken
> > and marked as non-cacheable + bufferable using the PMA region as specified
> > in the device tree. Synchronization callbacks are implemented to
> > synchronize when doing DMA transactions.
> >
> > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > block that allows dynamic adjustment of memory attributes in the runtime.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest.
> >
> > Below are the memory attributes supported:
> > * Device, Non-bufferable
> > * Device, bufferable
> > * Memory, Non-cacheable, Non-bufferable
> > * Memory, Non-cacheable, Bufferable
> > * Memory, Write-back, No-allocate
> > * Memory, Write-back, Read-allocate
> > * Memory, Write-back, Write-allocate
> > * Memory, Write-back, Read and Write-allocate
> >
> > This patch adds support to configure the memory attributes of the memory
> > regions as passed from the l2 cache node and exposes the cache management
> > ops.
> >
> > More info about PMA (section 10.3):
> > http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >
> > This feature is based on the work posted [0] by Vincent Chen
> > <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
> >
> > [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -24,13 +24,25 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> >
> >         switch (dir) {
> >         case DMA_TO_DEVICE:
> > +#ifdef CONFIG_ERRATA_THEAD_CMO
> >                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> > +#elif CONFIG_AX45MP_L2_CACHE
>
> "#elif defined(CONFIG_AX45MP_L2_CACHE)" (everywhere)
>
> Else it may fail with:
>
>     error: "CONFIG_AX45MP_L2_CACHE" is not defined, evaluates to 0
> [-Werror=undef]
>
Agreed, thanks for pointing this out. Said that I plan to get rid of
these checks in the next version (only after getting around the
ALTERNATIVE() macro).

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
