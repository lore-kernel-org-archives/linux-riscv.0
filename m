Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD533C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpKSzR8ZpicEio2RBT+sKLgYauWDj2QqpZ9WpJg3fZg=; b=GUEuYsmSl2QF/p
	IYsXSzwV86w5Xs5Brp1BVQvJSxAvCJyHP3zM20sDPPCYf/D1zBmCkwlIylY4P2/7GVDV2499NZq50
	+NQk19j2e5ySursBr8GcVHblj3aHevB1G9o313RQcdPKh/qCheDoBV+jEc7fzIfeqlxpeKpMp4PFf
	y5CESbn5cCF3R0zxq+fn/M9HCB3AzThofBV0JAyUitmeaaZD/Ycw+3An9DYO3tfxCQwlolpnT0Fvq
	8u6YXJjnh3jWj9AyLCplA3ONZLB4pG62wj2q4lmiOLdADnWXDDw+OvFmoLpEjuCyfOJmCjywhRHJF
	UJLIU4mtAtlhuYK2BQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCG3g-00526j-85; Fri, 15 Jul 2022 07:48:20 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCG3d-00525D-Ku
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 07:48:19 +0000
Received: by mail-qv1-f53.google.com with SMTP id kh20so3193773qvb.5
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 00:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbVpr0R59qtPw7baWfpBEgK5+t95ngcNjWBuGYLeZHA=;
        b=GqZXy7gdbQ0cFbFh72GwbLGuPqggVSRZes9EJAjnnLsqpTK+x8K6+hD4y1TvcdBupa
         P3+0wRvYKhJDMJuxqPDlUYPYPQPbiQyu9FR2Z8PORzcWneC+o0utxTLoITPEiZYNaDL/
         I3I/ZydWMhcgHI/tY1b5+3MDoCdK++nhgGyEadWCBfUf99ZlLjxHRhEbv7NAd5t/2IPq
         uc2P6UEsziQXahEg8I7iTV3FXYKtoK49pSKVZiJ+6IiM78wHDAozL/ozjKsOOCLzYEUP
         E3uyzGV2gr38fKMtG4BnB6XUnUZap0k3HqhHOhl94uTIL9px1JBCMXrbGx7BNmRaB6Zs
         bvOA==
X-Gm-Message-State: AJIora8PU7NHCPpFmDW5v7TItrG4Qu8MbmfYzXTQzVNapN99+FGXYJiz
	vwTa97D0EvCZIA4vIkjNWoLOx756loEXMg==
X-Google-Smtp-Source: AGRyM1vNTehDr7Vxb5aPoCJLpRkG0MtS/DTRosBjA6nItseP4wr8BEMi/OKodJa4MCq1K205y90kqg==
X-Received: by 2002:a0c:b414:0:b0:473:8ccb:3811 with SMTP id u20-20020a0cb414000000b004738ccb3811mr11006458qve.65.1657871294522;
        Fri, 15 Jul 2022 00:48:14 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id bl25-20020a05620a1a9900b006a787380a5csm3481460qkb.67.2022.07.15.00.48.11
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 00:48:12 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id l11so7147772ybu.13
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 00:48:11 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr12451089ybr.380.1657871291234; Fri, 15
 Jul 2022 00:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220521193356.26562-1-palmer@rivosinc.com>
In-Reply-To: <20220521193356.26562-1-palmer@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Jul 2022 09:47:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ7bhPka0acgw2wAZmsgDP2+tbqS7fO2A=_BOmv+8+HA@mail.gmail.com>
Message-ID: <CAMuHMdVJ7bhPka0acgw2wAZmsgDP2+tbqS7fO2A=_BOmv+8+HA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Add CONFIG_{NON,}PORTABLE
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Randy Dunlap <rdunlap@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, Atish Patra <atishp@rivosinc.com>, 
	Jens Axboe <axboe@kernel.dk>, Guo Ren <guoren@kernel.org>, mchitale@ventanamicro.com, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_004817_707933_52DA0C33 
X-CRM114-Status: GOOD (  27.55  )
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

Hi Palmer,

On Sat, May 21, 2022 at 10:49 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The RISC-V port has collected a handful of options that are
> fundamentally non-portable.  To prevent users from shooting themselves
> in the foot, hide them all behind a config entry that explicitly calls
> out that non-portable binaries may be produced.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks for your patch, which is now commit 44c1e84a38a03175 ("RISC-V:
Add CONFIG_{NON,}PORTABLE") in riscv/for-next

> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -222,6 +222,21 @@ source "arch/riscv/Kconfig.erratas"
>
>  menu "Platform type"
>
> +config NONPORTABLE
> +       bool "Allow configurations that result in non-portable kernels"
> +       help
> +         RISC-V kernel binaries are compatible between all known systems
> +         whenever possible, but there are some use cases that can only be
> +         satisfied by configurations that result in kernel binaries that are
> +         not portable between systems.
> +
> +         Selecting N does not guarantee kernels will be portable to all known
> +         systems.  Selecting any of the options guarded by NONPORTABLE will
> +         result in kernel binaries that are unlikely to be portable between
> +         systems.
> +
> +         If unsure, say N.

Doing it this way means allmodconfig will enable NONPORTABLE, which
may not be what we want?

> +
>  choice
>         prompt "Base ISA"
>         default ARCH_RV64I

> @@ -554,7 +571,7 @@ config PHYS_RAM_BASE
>
>  config XIP_KERNEL
>         bool "Kernel Execute-In-Place from ROM"
> -       depends on MMU && SPARSEMEM
> +       depends on MMU && SPARSEMEM && NONPORTABLE

Nice! Would we get something like this on arm32 past rmk?

>         # This prevents XIP from being enabled by all{yes,mod}config, which
>         # fail to build since XIP doesn't support large kernels.
>         depends on !COMPILE_TEST
> @@ -594,9 +611,16 @@ endmenu
>
>  config BUILTIN_DTB
>         bool
> -       depends on OF
> +       depends on OF && NONPORTABLE
>         default y if XIP_KERNEL
>
> +config PORTABLE
> +       bool
> +       default !NONPORTABLE
> +       select EFI
> +       select OF
> +       select MMU
> +
>  menu "Power management options"
>

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
