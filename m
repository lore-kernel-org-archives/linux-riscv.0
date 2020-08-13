Return-Path: <SRS0=qf9j=BX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A71DC433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 09:03:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C91D2074D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 09:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A8KN+zbA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="St0rjCN4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C91D2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MhCOSa6tu2ocTaq9iiuoQwZU2LSwmQdNxqIPaWJ0bBE=; b=A8KN+zbAmbJGywATE8STParjY
	7+5ijhTyQmkcyv6fPi3ZLTtDOcl+qNf2RhD9/yhgYzWLgxQiYLTUnl/ebyRee71uv5Y6TAA2+toLj
	RzxSsWIYoZVDaECdSG8FAuYzV/oXUV0juENVl6tVbT86uwuUZ0Rs12SQjRWlkmKr/U/HrWAUhpYpn
	0hjEmFfHmvjZ08nzA7wSQoYfVo91lheVbi3AHycnFYnzLZQgHz6+ERCEiDXCypjl45bmQ3N0FgmDr
	DLRtakTvrkKbJe9tKKk0uRTj06aMequ743hmJJvLQPH56+aguoKAWwHKXybjJXm5avtZXnEMhlKmq
	Qp2aUGs3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k698U-0006R0-Mf; Thu, 13 Aug 2020 09:02:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k698S-0006QW-9j
 for linux-riscv@lists.infradead.org; Thu, 13 Aug 2020 09:02:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id r4so4533237wrx.9
 for <linux-riscv@lists.infradead.org>; Thu, 13 Aug 2020 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkTNyYRkgbYaz12fQ06lSjHZCH+igEZHF1ZLr68a4Pc=;
 b=St0rjCN4LjocFxkWL2JKEHSwd9frPy+F8cEY6fwOY2zb573Puar+J4dmOX93BYgyr4
 QLGDtaiyyIz0FvAKSb8GN8ZbpWHiGNprjhz1Azjgak+uuZ43kGqUHpeCIc+ovidTTnlR
 iA15WOt0WKozh7jPYU6yMYAHNrrTm6e+C4Dgk6Q9N6W767i1ZsctFf1BPk5xx4ZWDBcu
 siZ9A5zErf8C/BWkoG5NvGhe8XbjPdjkKxPlyWeDxnReShIuryID17YQLM9h+nIDWU35
 9YBsm8mnKeiwZvDsr6kZKWSK1iiFbvZywmlGMjZ7Kql4rbCqTNW8q+V4ixmve26d8ola
 rpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkTNyYRkgbYaz12fQ06lSjHZCH+igEZHF1ZLr68a4Pc=;
 b=fGUEsq9r75adi8WKWnReGUD9RGhaEpxVAEwr7sCbef6ehJ3Z99+k0/rLqpmdVzk1OI
 DvsgIFcgJaT5kjkgghic9s7KkQPMn/KPOH/QDsIsF5T6vR34xzKmXcNkAbmxzd0ihhqP
 666YpIzgeFRiRoOIca1jWesZXeXmiH+vZ17LOAtY9PwMD+lxpBbp68x93y7OZNLSkFai
 vHA6APOMxwOsqYtWk1SgpvNiUpNHPuLb8GQoSQNF/ZSi0K4P9N5hv46y9uoBQweZiTBw
 HPlmNhFcmg7Eokye9dbYJdsT/YqTPqk/NLf4e690C2l7kouhTx1H3+vU4464f9Z34903
 SGMQ==
X-Gm-Message-State: AOAM533wT/JsfurPwxA/LF2SFUMebz4ZhA+NP87HSMxvXCSdPgyXqMRz
 tsz50flNzJvvtcUaVV1vKqkmskqc3qdPW6Xqy/VGhg==
X-Google-Smtp-Source: ABdhPJy8nUOMaGRe0BURglBOmXleJkANpz2NiBadP7lUJ5kkQU8jl5Xhlbgg7oHKuzRDxciF04E9cwa/9uPwF7neweg=
X-Received: by 2002:adf:f186:: with SMTP id h6mr3187988wro.144.1597309374980; 
 Thu, 13 Aug 2020 02:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200812234758.3563-1-atish.patra@wdc.com>
 <20200812234758.3563-10-atish.patra@wdc.com>
In-Reply-To: <20200812234758.3563-10-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Aug 2020 14:32:43 +0530
Message-ID: <CAAhSdy3WTxXkd87ZjBM=v4zy7VEy5zimpf9cnbssnspYhBgY4A@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] RISC-V: Add page table dump support for uefi
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_050256_357788_E7969946 
X-CRM114-Status: GOOD (  22.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi <linux-efi@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Waiman Long <longman@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, Daniel Schaefer <daniel.schaefer@hpe.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, fwts-devel@lists.ubuntu.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2020 at 5:18 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Extend the current page table dump support in RISC-V to include efi
> pages as well.
>
> Here is the output of efi runtime page table mappings.
>
> ---[ UEFI runtime start ]---
> 0x0000000020002000-0x0000000020003000 0x00000000be732000 4K PTE D A . . . W R V
> 0x0000000020018000-0x0000000020019000 0x00000000be738000 4K PTE D A . . . W R V
> 0x000000002002c000-0x000000002002d000 0x00000000be73c000 4K PTE D A . . . W R V
> 0x0000000020031000-0x0000000020032000 0x00000000bff61000 4K PTE D A . . X W R V
> ---[ UEFI runtime end ]---
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/ptdump.c | 48 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 0831c2e61a8f..ace74dec7492 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2019 SiFive
>   */
>
> +#include <linux/efi.h>
>  #include <linux/init.h>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> @@ -49,6 +50,14 @@ struct addr_marker {
>         const char *name;
>  };
>
> +/* Private information for debugfs */
> +struct ptd_mm_info {
> +       struct mm_struct                *mm;
> +       const struct addr_marker        *markers;
> +       unsigned long base_addr;
> +       unsigned long end;
> +};
> +
>  static struct addr_marker address_markers[] = {
>  #ifdef CONFIG_KASAN
>         {KASAN_SHADOW_START,    "Kasan shadow start"},
> @@ -68,6 +77,28 @@ static struct addr_marker address_markers[] = {
>         {-1, NULL},
>  };
>
> +static struct ptd_mm_info kernel_ptd_info = {
> +       .mm             = &init_mm,
> +       .markers        = address_markers,
> +       .base_addr      = KERN_VIRT_START,
> +       .end            = ULONG_MAX,
> +};
> +
> +#ifdef CONFIG_EFI
> +static struct addr_marker efi_addr_markers[] = {
> +               { 0,            "UEFI runtime start" },
> +               { SZ_1G,        "UEFI runtime end" },
> +               { -1,           NULL }
> +};
> +
> +static struct ptd_mm_info efi_ptd_info = {
> +       .mm             = &efi_mm,
> +       .markers        = efi_addr_markers,
> +       .base_addr      = 0,
> +       .end            = SZ_2G,
> +};
> +#endif
> +
>  /* Page Table Entry */
>  struct prot_bits {
>         u64 mask;
> @@ -245,22 +276,22 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr,
>         }
>  }
>
> -static void ptdump_walk(struct seq_file *s)
> +static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
>  {
>         struct pg_state st = {
>                 .seq = s,
> -               .marker = address_markers,
> +               .marker = pinfo->markers,
>                 .level = -1,
>                 .ptdump = {
>                         .note_page = note_page,
>                         .range = (struct ptdump_range[]) {
> -                               {KERN_VIRT_START, ULONG_MAX},
> +                               {pinfo->base_addr, pinfo->end},
>                                 {0, 0}
>                         }
>                 }
>         };
>
> -       ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
> +       ptdump_walk_pgd(&st.ptdump, pinfo->mm, NULL);
>  }
>
>  void ptdump_check_wx(void)
> @@ -293,7 +324,7 @@ void ptdump_check_wx(void)
>
>  static int ptdump_show(struct seq_file *m, void *v)
>  {
> -       ptdump_walk(m);
> +       ptdump_walk(m, m->private);
>
>         return 0;
>  }
> @@ -308,8 +339,13 @@ static int ptdump_init(void)
>                 for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
>                         pg_level[i].mask |= pte_bits[j].mask;
>
> -       debugfs_create_file("kernel_page_tables", 0400, NULL, NULL,
> +       debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd_info,
>                             &ptdump_fops);
> +#ifdef CONFIG_EFI
> +       if (efi_enabled(EFI_RUNTIME_SERVICES))
> +               debugfs_create_file("efi_page_tables", 0400, NULL, &efi_ptd_info,
> +                                   &ptdump_fops);
> +#endif
>
>         return 0;
>  }
> --
> 2.24.0
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
