Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79888ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbnhbuHI9ZYI/x62bYuUMTeQdRgczkGLBTBi7a5X1rs=; b=0OZkSrakqVWRRY
	DA/3RVmuq3qMevvutY2vsPii3l/ynhSUJEC3upxHCsXkgvomBxCPH9BQpFIv/xu+PbwSlheNZAC1Y
	8gXxU+ffEBA/qR8b+PemcBZ8Gxmk/dGt5sEMFxW1ieLIKDRjkPWDhEAqpm2RA9Sez+6I2XYzKIIVY
	utFYn6ZiCQbk4Z8R2QzXq693NJwcLP9mWfdvnAUcl1S7gTt6a8Yz4NVVjuZRuPRO7IGnoiEAid/dO
	qWi6Dzhj5VTaAmWNYTl5sZdwOaHJXgkZ/lHV8M+eQcyNcXHzvV/ecNHIRPfPLTQK8FLae/Fcm458b
	39A5i+2GNw05l2R1hIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZ5s-00EREy-9m; Fri, 09 Sep 2022 08:10:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZ5p-00ER6e-LF
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 08:10:31 +0000
Received: by mail-lf1-x134.google.com with SMTP id i26so1371617lfp.11
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vZD+gMtJr5SdrYBTfgqz2rRaCIKo/6GRB7Drz3aUesE=;
        b=Pj3YOuMGkiXSpfOjSnO+KXpjdE28hS1iM3EoxzMDozvIthzzWYTZNsCgNNMOBVOxZI
         x0nzdtbtnTWcQWEAjQ6t/Bdgd/ceOQOrw3+6yt0Ir5Sn8uKIE25N2GT1H59e96TAYYTM
         weBjUmYAlW5dtgwgzIg9g+EvWfh1fQ76pKNfQ0u+0dnxjd1muWB6bc2rCKYqyUI2umWY
         fME4X+2sFAT5ChqMMX0p5icC69W1gPBxfglb2VVFpnEq7jWAOZYe47WgB/eeOtY+uhSe
         rDKYoiOHNJ1UoMwZY3Vnv5nOsjjBcPmWIXNom3hVdWPGB42CgstSytU9lygnUgC7tQAk
         dqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vZD+gMtJr5SdrYBTfgqz2rRaCIKo/6GRB7Drz3aUesE=;
        b=LhwUINpT4M03YY6VpszTQtPi6fFv7zoNoGLzbRuCH4BUE4QqnNOS4nZ8hYquCEk2tw
         MKgKdfNiQPuNREClCIjHfy5+bRo7HL8t3Ry3m5vtkk3f4oyP70y2s+jwOS/w7VV7cInr
         2yY8JXnTgQlEhkWyc/sqZzgLeAmkPaoqRMP2G1nYQEbuIsh5p46/S56GL+cOSXAlB4sm
         uBUfVYzWyTrhdMnWguhwPvwky75cVHsV++R92ntdPLi9afvXTPDZfwK6Fycw9xtERec7
         sA4lPO858bnogcqlNFqLvVDaDvByv/neiNibR3KNapzKW0z8FBgn09t+wJ/eOfjqJaNX
         KrHA==
X-Gm-Message-State: ACgBeo2rnnOVK0VwyuO6yQpVed3C9901a/6qFitvuzHVHFhZ7NgUFhfz
	yL1uLZ9imEpW59Jb1hHrA7ut3S7/R5Sktu2ign2W/Q==
X-Google-Smtp-Source: AA6agR69LoysOIZEWgWOLuREJRHdaOc5MXE/9NDBKz8yuTyIoKzrUuaTovANov7dc3gNTGz2aXhLOy0Aav34Ihx9UlE=
X-Received: by 2002:a19:6505:0:b0:497:9225:4e90 with SMTP id
 z5-20020a196505000000b0049792254e90mr3893587lfb.497.1662711022062; Fri, 09
 Sep 2022 01:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220830044642.566769-1-apatel@ventanamicro.com> <20220830044642.566769-2-apatel@ventanamicro.com>
In-Reply-To: <20220830044642.566769-2-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 9 Sep 2022 13:40:10 +0530
Message-ID: <CAK9=C2VXsc4oBK5MxjAQnH5eX-wGbt0cb59Uc=z5xeLRY+j7sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for
 systems with Svpbmt
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_011029_720190_8064422E 
X-CRM114-Status: GOOD (  17.65  )
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

On Tue, Aug 30, 2022 at 10:17 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, all flavors of ioremap_xyz() function maps to the generic
> ioremap() which means any ioremap_xyz() call will always map the
> target memory as IO using _PAGE_IOREMAP page attributes. This breaks
> ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
> remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
> page attributes.
>
> To address above (just like other architectures), we implement RISC-V
> specific ioremap_cache() and ioremap_wc() which maps memory using page
> attributes as defined by the Svpbmt specification.
>
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Can you please consider this patch for Linux-6.0-rc5 ?

Regards,
Anup

> ---
>  arch/riscv/include/asm/io.h      | 10 ++++++++++
>  arch/riscv/include/asm/pgtable.h |  2 ++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 69605a474270..07ac63999575 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
>  #define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
>  #endif
>
> +#ifdef CONFIG_MMU
> +#define ioremap_wc(addr, size)         \
> +       ioremap_prot((addr), (size), _PAGE_IOREMAP_WC)
> +#endif
> +
>  #include <asm-generic/io.h>
>
> +#ifdef CONFIG_MMU
> +#define ioremap_cache(addr, size)      \
> +       ioremap_prot((addr), (size), _PAGE_KERNEL)
> +#endif
> +
>  #endif /* _ASM_RISCV_IO_H */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..346b7c1a3eeb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -182,6 +182,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
>  #define PAGE_TABLE             __pgprot(_PAGE_TABLE)
>
>  #define _PAGE_IOREMAP  ((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
> +#define _PAGE_IOREMAP_WC       ((_PAGE_KERNEL & ~_PAGE_MTMASK) | \
> +                                _PAGE_NOCACHE)
>  #define PAGE_KERNEL_IO         __pgprot(_PAGE_IOREMAP)
>
>  extern pgd_t swapper_pg_dir[];
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
