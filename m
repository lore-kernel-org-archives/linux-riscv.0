Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3E8C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 22:23:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6AC5611C0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 22:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6AC5611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Vr9+tIgPG398gllc2e943DvTbSFHtlpBMQdSCBUoks=; b=Cwi0Q6RUgxjJRZ
	KhR300m9IFub95K5Bl66dJY7RAom43iS2vYXe3raOt1tKYjM7c8RQUpyV6TI9vaJ+T2nNymCn9NcH
	0fbmbxgo9Ko1T99KfHrAIHBP2IaDhPmzatgJAnG22305laM9/Isl3MBxKeFxo3P2apNFEcVmCrlnq
	oRBr0kIsot+Od4c543LLKTVZ23K6YWWU1brpgdMzeDUfRDWcT/koEixTA4y1fq4P4I8m0ndRzzzaV
	HubSO+/5NsLs0H5FNCoplvZp7TitZuRSo5iGNh7okKuFN4sgn0AI9oaC0EKjTVWTjh+xIRERr1mnK
	v17Abk3/gxcgxzh2t8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHSy-003Wtw-1Z; Tue, 15 Jun 2021 22:23:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltF9T-002bqk-BV; Tue, 15 Jun 2021 19:55:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF9EF613BF;
 Tue, 15 Jun 2021 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623786911;
 bh=bituzxZsqdopUSe7H+7dgGu7+/LuAeIRC6g+riCNdW4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PvYzeA/KFfiiCh8GjIjZaNVS6I94vmU6FxbFeDCg1VFeCZKt+f2aXp4PxlmY5Ni87
 oiLqhnC5ZTCdGHXHezVyNdKpVvQ4gfeEQXxtEWDvUG+cybiFThNHjSFyE8nIeQdPWE
 7vzxcLtyPnrkuX1iXziPT1N/lrTm9xufUrl9ykJw3v2Lx4wR/fqGmTen3o6kZMvWgH
 LZ9mwx2uVTBPHcuTLJevnP1DmZbt+OV7ULtzVC0zjhK8T5KChp4Q+QTvFJgzilh+xh
 Hm8nvbGcB5mH+Uw29JGaeMryPgxGorbdwb734wftLHlknQSuy9xX866LMVFdEL5qn/
 lNd+7sHbllCAg==
Received: by mail-ej1-f41.google.com with SMTP id hq2so2359943ejc.2;
 Tue, 15 Jun 2021 12:55:10 -0700 (PDT)
X-Gm-Message-State: AOAM533NLzJpmOthf4aUyuE48Y+ffTuLALKdFYndJC7SjiSyAsAeCmMr
 +cW7haAbxoLHQdSZW4fkDZKnXeyLLCGjQOCNKQ==
X-Google-Smtp-Source: ABdhPJwgw4hx5crsunBDkcPAMm2Nmrwncl6HIzcmyuFxYmWV/H4yT2u/a4jul9wKeNr6Pje8ZrIZBI9vMUxDEZ7ekHE=
X-Received: by 2002:a17:907:2059:: with SMTP id
 pg25mr1310053ejb.130.1623786909575; 
 Tue, 15 Jun 2021 12:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623780059.git.geert+renesas@glider.be>
 <8661d652968d050489852ccb50df5ad4cc048900.1623780059.git.geert+renesas@glider.be>
In-Reply-To: <8661d652968d050489852ccb50df5ad4cc048900.1623780059.git.geert+renesas@glider.be>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Jun 2021 13:54:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Ozd_+__+v7LEsDjvydymuRF=+T9NnmOd-htqCQ22nCA@mail.gmail.com>
Message-ID: <CAL_Jsq+Ozd_+__+v7LEsDjvydymuRF=+T9NnmOd-htqCQ22nCA@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: fdt: Add generic support for parsing elf core
 header properties
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_125511_484628_DEC731FE 
X-CRM114-Status: GOOD (  29.68  )
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

On Tue, Jun 15, 2021 at 12:17 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> There are two methods to specify the location of the elf core header:
> using the "elfcorehdr=" kernel parameter, as handled by generic code in
> kernel/crash_dump.c, or using the "linux,elfcorehdr" property under the
> "/chosen" node in the Device Tree, as handled by architecture-specific
> code in arch/arm64/mm/init.c.
>
> Extend support for "linux,elfcorehdr" to all platforms supporting DT by
> adding platform-agnostic handling for parsing this property to the FDT
> core code.  This can co-exist safely with the architecture-specific
> handling, until the latter has been removed.
>
> This requires moving the call to of_scan_flat_dt() up, as the code
> scanning the "/chosen" node now needs to be aware of the values of
> "#address-cells" and "#size-cells".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/chosen.txt |  6 ++--
>  drivers/of/fdt.c                             | 37 ++++++++++++++++++--
>  2 files changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> index 45e79172a646c537..5b0b94eb2d04e79d 100644
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -106,9 +106,9 @@ respectively, of the root node.
>  linux,elfcorehdr
>  ----------------
>
> -This property (currently used only on arm64) holds the memory range,
> -the address and the size, of the elf core header which mainly describes
> -the panicked kernel's memory layout as PT_LOAD segments of elf format.
> +This property holds the memory range, the address and the size, of the elf
> +core header which mainly describes the panicked kernel's memory layout as
> +PT_LOAD segments of elf format.
>  e.g.
>
>  / {
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index a03d43f95495d8e1..f13db831c8028cce 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -8,6 +8,7 @@
>
>  #define pr_fmt(fmt)    "OF: fdt: " fmt
>
> +#include <linux/crash_dump.h>
>  #include <linux/crc32.h>
>  #include <linux/kernel.h>
>  #include <linux/initrd.h>
> @@ -909,6 +910,35 @@ static inline void early_init_dt_check_for_initrd(unsigned long node)
>  }
>  #endif /* CONFIG_BLK_DEV_INITRD */
>
> +#ifdef CONFIG_CRASH_DUMP
> +/**
> + * early_init_dt_check_for_elfcorehdr - Decode elfcorehdr location from flat
> + * tree
> + * @node: reference to node containing elfcorehdr location ('chosen')
> + */
> +static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
> +{
> +       const __be32 *prop;
> +       int len;
> +
> +       pr_debug("Looking for elfcorehdr property... ");
> +
> +       prop = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
> +       if (!prop || (len < (dt_root_addr_cells + dt_root_size_cells)))
> +               return;
> +
> +       elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
> +       elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &prop);

If these declarations were moved outside the '#ifdef
CONFIG_CRASH_DUMP' in crash_dump.h, then IS_ENABLED() could be used in
this function.


> +
> +       pr_debug("elfcorehdr_start=0x%llx elfcorehdr_size=0x%llx\n",
> +                elfcorehdr_addr, elfcorehdr_size);
> +}
> +#else
> +static inline void early_init_dt_check_for_elfcorehdr(unsigned long node)
> +{
> +}
> +#endif
> +
>  #ifdef CONFIG_SERIAL_EARLYCON
>
>  int __init early_init_dt_scan_chosen_stdout(void)
> @@ -1057,6 +1087,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>                 return 0;
>
>         early_init_dt_check_for_initrd(node);
> +       early_init_dt_check_for_elfcorehdr(node);
>
>         /* Retrieve command line */
>         p = of_get_flat_dt_prop(node, "bootargs", &l);
> @@ -1201,14 +1232,14 @@ void __init early_init_dt_scan_nodes(void)
>  {
>         int rc = 0;
>
> +       /* Initialize {size,address}-cells info */
> +       of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +
>         /* Retrieve various information from the /chosen node */
>         rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
>         if (!rc)
>                 pr_warn("No chosen node found, continuing without\n");
>
> -       /* Initialize {size,address}-cells info */
> -       of_scan_flat_dt(early_init_dt_scan_root, NULL);
> -
>         /* Setup memory, calling early_init_dt_add_memory_arch */
>         of_scan_flat_dt(early_init_dt_scan_memory, NULL);
>  }
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
