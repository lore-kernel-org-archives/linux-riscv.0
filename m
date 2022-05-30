Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD9EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 02:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToeQb5hqOJxQtjJWlA6/NqWqHzBtYHv4VurlLJFb1+E=; b=L03s4U1Uu6PhXe
	5dKDfWg/krCwKvAZjGDJRzBK3Br22T/KgB0+dxXm+lHEm3xoE22NNSRXZNP+0bZntqVixepYsfdjO
	Inph/0fljmjsXCFpi0t36f8fUABqcWJofJ7dtPeOXXuFhlDkRonz6wSXsM4duSnXIXjRJKuS8z80F
	N2RMbcY9qXq2Q0VH8nf86VuqLJ8RA573jTivoFFRgY0HK8VjEeI5rban1GiUHM1SWAUibJufGjJCa
	roW48JU0FQl/IXsc3uE90Sxosl7HrPvDO6fASHGJ4uWt5XdXRQMSUwLuIqcmMoSgvZKNHRogBP1If
	aSAXlCHRmYxI8zjNmTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvVRx-005CI1-6t; Mon, 30 May 2022 02:48:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvVRu-005CHP-Ko
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 02:48:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 69E67B80B32
	for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 02:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28085C385A9
	for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653878883;
	bh=YoRGxfq1Yea8HRZlBDQS2oqp73Xku6gJh6IZaXEOUT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IBYxtq5gyzzz6NoUQdgfTtSYIgZ3KWqAdLPQMAaWnPLuJ/YDqgxsQLwBbN6PzFQ4/
	 ynoZELeNvrjeF0rsNXYNDgK/Kw39SRFuXzc+saHjBG0+T7m+50D+YCtWB9onXw/yxW
	 eM24Jm2i0VjJc2nV5fEWZRAtu1IzaFyKQPmUfaOtCzt9TQC7Q8p7HY4ZoUrrlUtJsv
	 smdsNxszWiJHC3wgku0JpcwM4w8Y8I3Z9AuAZMd9dLLevOrdKaKnrHQlQvEMqBhEKo
	 bCHa4Dn2mSL61TjjKpIOSiw6fws/SGfe2AcstVkd0NnYqleGUnH6XKCmLZIFuyBK5K
	 Q4qqk8qcSKuxA==
Received: by mail-vs1-f41.google.com with SMTP id u21so9254881vsk.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 May 2022 19:48:03 -0700 (PDT)
X-Gm-Message-State: AOAM533Xai1A8DhAf7DRDkVxPy3MraqGkoylZv0c9ICe6LvRS9L6ZgDt
	RMWB5J9knaEJM+SsaYmddub2JFxhv5kx1nk7II0=
X-Google-Smtp-Source: ABdhPJzvEfegwzjtbzbneiuCB+i9dHMhbVAfv1BIeisWjXZ/dtthImdOsnOoQKcAkgNwBZcem3RsjgMXsyI5j2ahuf0=
X-Received: by 2002:a05:6102:151c:b0:337:d985:1764 with SMTP id
 f28-20020a056102151c00b00337d9851764mr10556500vsv.51.1653878882062; Sun, 29
 May 2022 19:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220518013428.1338983-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220518013428.1338983-1-xianting.tian@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 30 May 2022 10:47:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRZCchLk9apNQagNmsNb3Pv+WfPTisrsWDDrQyVncUYeA@mail.gmail.com>
Message-ID: <CAJF2gTRZCchLk9apNQagNmsNb3Pv+WfPTisrsWDDrQyVncUYeA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem
 instead of IORESOURCE_BUSY
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, wangborong@cdjrlc.com, 
	twd2 <twd2.me@gmail.com>, seanjc@google.com, Alex Ghiti <alex@ghiti.fr>, 
	petr.pavlu@suse.com, Atish Patra <atishp@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jianghuaming.jhm@alibaba-inc.com, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_194807_015734_AA0E2500 
X-CRM114-Status: GOOD (  25.43  )
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

Please have a look at this patch which is a critical fixup. Our
current riscv implementation has broken the reserved memory.

On Wed, May 18, 2022 at 9:34 AM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
>
> Commit 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
> marked IORESOURCE_BUSY for reserved memory, which caused resource map
> failed in subsequent operations of related driver, so remove the
> IORESOURCE_BUSY flag. In order to prohibit userland mapping reserved
> memory, mark IORESOURCE_EXCLUSIVE for it.
>
> The code to reproduce the issue,
> dts:
>         mem0: memory@a0000000 {
>                 reg = <0x0 0xa0000000 0 0x1000000>;
>                 no-map;
>         };
>
>         &test {
>                 status = "okay";
>                 memory-region = <&mem0>;
>         };
>
> code:
>         np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>         ret = of_address_to_resource(np, 0, &r);
>         base = devm_ioremap_resource(&pdev->dev, &r);
>         // base = -EBUSY
>
> Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
> Reported-by: Huaming Jiang <jianghuaming.jhm@alibaba-inc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Co-developed-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
> Changes from v2:
> - Fix typo in commit message: casued -> caused
> - Remove Reviewed-by of Nick Kossifidis, who didn't give Reviewed-by actually
> - Add Co-developed-by of Nick
>
> Changes from v1:
> - Mark reserved memory as IORESOURCE_EXCLUSIVE, suggested by Nick
> ---
>  arch/riscv/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 834eb652a7b9..e0a00739bd13 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -189,7 +189,7 @@ static void __init init_resources(void)
>                 res = &mem_res[res_idx--];
>
>                 res->name = "Reserved";
> -               res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +               res->flags = IORESOURCE_MEM | IORESOURCE_EXCLUSIVE;
>                 res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
>                 res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
>
> @@ -214,7 +214,7 @@ static void __init init_resources(void)
>
>                 if (unlikely(memblock_is_nomap(region))) {
>                         res->name = "Reserved";
> -                       res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +                       res->flags = IORESOURCE_MEM | IORESOURCE_EXCLUSIVE;
>                 } else {
>                         res->name = "System RAM";
>                         res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
