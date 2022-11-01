Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60709C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 12:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z55jysCLx5do6G3zrzM037KHHXbSk6OnPcas08GCTxs=; b=VaIcePKGaydVr3
	vxYwKmZi38w5+ZbDTpPiA2KDPgU9La6nvnNf5AtMSl9NAMOiysK2y/EhJ6mXtqvAqYrIna18qdF65
	gKwO1Jxtc7gwziHMTfEK/DiS3iBaoYzv71KI370H1C5aBuDYVFhxDRtCyIbbr4g4MUXmEl5R8D9vt
	d6KSrTbGY6F9cWVV4eEjyAbRJPr8ANIUp57fBEhojx11Vo7lyTABfC8Vfmm+b7s36+67q+bWCg8qc
	aROpqk7YkU406R9cb/IoW863p8q8ax60Q68dUWsO60Mn7uFkj6ymI0VZA5/ioTmecvUOa8LnmMIQL
	ZiD9B9AupWGfuauQ/dIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqbc-0055s6-63; Tue, 01 Nov 2022 12:43:00 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqbY-0055li-Pl
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 12:42:58 +0000
Received: by mail-qv1-f52.google.com with SMTP id t16so10148674qvm.9
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 05:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fFJpKnrZNPTgCViuBGtje3WfufZWacdfGu7IT0h8cY=;
        b=CfsMg9NpYfGmcFLaWVbJ+IrV3+ekQd6PaKs9XAMaGoMRjIb7R6cjKjeyGz1X76LOgg
         rJJ8AOuOwHM2ZNFhyGuYDwqjNdJkO7wHLgaLlYlPeqerTMolg+tkPQrU/19hbT51AHRf
         bZovXN0ZHuKpkK6bbMERDOOgpW7hcX1J/BjSiMlhD+Dvb/4C5BNwNBxSqkwFBzBYsvM8
         3NXhSaljsOE2oVYbAbBJBJPBsRk1cbWBJRvrMPd+ctTyXqc/2dHJ9q+rMHO4N2ZLOVXb
         1WQUV7TiekF04fvllVlR71YvtXQGaeHXJ956zg7Bi57Sq4O0MgYVC8x05P9ypaU+dMXt
         3bMw==
X-Gm-Message-State: ACrzQf2oo72qekoUMQv4NzG3EYBMzGKBc3pM9FWqXCpExLk7Mc1wg9vt
	FfMI5cB3A04kNaiJbsemYFmggnR5Qz0SqA==
X-Google-Smtp-Source: AMsMyM6JNc+agFBCGCDfRWAwXT2CsUsp6Xhri3ZZ2dXBOwjsKkZhcL9wzMCZGe+kL8HXwJywdEvzoA==
X-Received: by 2002:ad4:5766:0:b0:4bb:f0a3:aec7 with SMTP id r6-20020ad45766000000b004bbf0a3aec7mr9566249qvx.86.1667306574659;
        Tue, 01 Nov 2022 05:42:54 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id ay30-20020a05620a179e00b006ef1a8f1b81sm6547896qkb.5.2022.11.01.05.42.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 05:42:53 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id o70so17149636yba.7
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 05:42:53 -0700 (PDT)
X-Received: by 2002:a25:6b07:0:b0:6cd:3a43:bfe5 with SMTP id
 g7-20020a256b07000000b006cd3a43bfe5mr4839144ybc.89.1667306573183; Tue, 01 Nov
 2022 05:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Nov 2022 13:42:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqh=wQaTYTuQ8vq__=2jvqRx1i9fpQsVPKpBJrBOy1Hw@mail.gmail.com>
Message-ID: <CAMuHMdXqh=wQaTYTuQ8vq__=2jvqRx1i9fpQsVPKpBJrBOy1Hw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
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
X-CRM114-CacheID: sfid-20221101_054256_857623_AA7615F7 
X-CRM114-Status: GOOD (  29.91  )
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

Hi Prabhakar,

On Thu, Oct 20, 2022 at 12:02 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the AX45MP core, cache coherency is a specification option so it may
> not be supported. In this case DMA will fail. As a workaround, firstly we
> allocate a global dma coherent pool from which DMA allocations are taken
> and marked as non-cacheable + bufferable using the PMA region as specified
> in the device tree. Synchronization callbacks are implemented to
> synchronize when doing DMA transactions.
>
> The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
>
> Below are the memory attributes supported:
> * Device, Non-bufferable
> * Device, bufferable
> * Memory, Non-cacheable, Non-bufferable
> * Memory, Non-cacheable, Bufferable
> * Memory, Write-back, No-allocate
> * Memory, Write-back, Read-allocate
> * Memory, Write-back, Write-allocate
> * Memory, Write-back, Read and Write-allocate
>
> This patch adds support to configure the memory attributes of the memory
> regions as passed from the l2 cache node and exposes the cache management
> ops.
>
> More info about PMA (section 10.3):
> http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>
> This feature is based on the work posted [0] by Vincent Chen
> <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
>
> [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -24,13 +24,25 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>
>         switch (dir) {
>         case DMA_TO_DEVICE:
> +#ifdef CONFIG_ERRATA_THEAD_CMO
>                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +#elif CONFIG_AX45MP_L2_CACHE

"#elif defined(CONFIG_AX45MP_L2_CACHE)" (everywhere)

Else it may fail with:

    error: "CONFIG_AX45MP_L2_CACHE" is not defined, evaluates to 0
[-Werror=undef]


> +               ALT_CMO_OP(ax45mp_cpu_dma_wb_range, vaddr, size, 0x0);
> +#endif

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
