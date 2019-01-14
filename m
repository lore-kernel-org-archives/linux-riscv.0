Return-Path: <SRS0=bHpB=PW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2166AC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 14 Jan 2019 15:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF38E206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 14 Jan 2019 15:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZFTKGQSX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF38E206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IA794X7ujRnP9w7kH5pfzv6YC1hMqmIX9QnFSaRmx+c=; b=ZFTKGQSXCa5Czk
	8Op7U+M1eW8/YdQt6jLx1gdxqwhVEzTFFXUwdf4/ip6wd6KSuAUqoE6lIDSDa7eiZtIQOcPT0X3dD
	/z8clnoIJ7TFvaOPj1H/ol9tUI3CfzN/ZwyWkyuYHZFjz/bv5Mm20Jcg92G1/H5pTT4Lr+0jRwMzs
	d6BsyHKN36eWnHKe+Sd0Bj+lbkU7KWNMoNyNKFx0PVHB/Je6fKJGQ2ZtzQB/WYQNk4H3zqYZv/SYA
	I/6k0s7HEDiuv3rkcbTFMprnkdO2zfMgYXWwbFsQcU4i+iSawNnb7PVU+RUPXSozwJl2fMxOkOLtF
	j6ZEO7C3T2+SLBMYZRwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj4Yo-0006iR-C7; Mon, 14 Jan 2019 15:53:58 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj4Yc-0006ZQ-FR
 for linux-riscv@lists.infradead.org; Mon, 14 Jan 2019 15:53:49 +0000
Received: by mail-lf1-f67.google.com with SMTP id a16so15963069lfg.3
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jan 2019 07:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZITMFUMV0zEIamJ3VVbE4heK6bK4WYzVzsFXzCFVH0=;
 b=EKtv1ZC5Wortu3w8fDi/Eaofghc1drTw0sQrMuhX6K3DNpceWVqNtdprNXWIQ05O5A
 BOKjfOi+6ig+0RUd6rmSQik/zalWI29vNMZ2OFFH41/fhuDpuq0fkfYuGqT4iSG7mGPO
 nDi1gOma+ARJ6ZIRuP+XxecI3MtseAknyHec5LQRBA9zTbvjjn4WhKC+qTbplWOoic/9
 m458DzSwSzUzLCwSfc/5HUxaGiCPqrQNa8jkxvX7Sk0tNszcd9cTllP//juPC0NVJ5Wi
 V+z4ZLdaLYUidVdD6cCnOfzLfb68LtHyWqA8rREyfc/M2ImVumVkTvxXXjpZmAs50Eqz
 mxKg==
X-Gm-Message-State: AJcUukdITRjQDDlX5dLa0mD8shbUJdLL1MSaULAjswmqDQwITTTK2gb6
 z6W8AoFm3EvTY0SvwvWXJ5oRxDqo55hOBBkpuUbG9A==
X-Google-Smtp-Source: ALg8bN74ZQTuDIjsqUhLgFMGYUxSw81lMr9Ia6Rp9LV1zOdpgU9nkrJsrZPjHC4E0QC4PQUfRTidFXCqru+uICR4BPA=
X-Received: by 2002:ac2:51af:: with SMTP id f15mr13329880lfk.44.1547481224807; 
 Mon, 14 Jan 2019 07:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20190114125903.24845-1-david@redhat.com>
 <20190114125903.24845-8-david@redhat.com>
In-Reply-To: <20190114125903.24845-8-david@redhat.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Mon, 14 Jan 2019 21:22:49 +0530
Message-ID: <CACi5LpPphoJzfKXPN5kSV42aF27=2ZjqXSVLQjEtMdSN8+6bsA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: kdump: No need to mark crashkernel pages
 manually PG_reserved
To: David Hildenbrand <david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_075346_524577_FC89369E 
X-CRM114-Status: GOOD (  20.81  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 CHANDAN VN <chandan.vn@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Stefan Agner <stefan@agner.ch>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Laura Abbott <labbott@redhat.com>,
 Kristina Martsenko <kristina.martsenko@arm.com>,
 linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Kleikamp <dave.kleikamp@oracle.com>, James Morse <james.morse@arm.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Greg Hackmann <ghackmann@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi David,

On Mon, Jan 14, 2019 at 6:30 PM David Hildenbrand <david@redhat.com> wrote:
>
> The crashkernel is reserved via memblock_reserve(). memblock_free_all()
> will call free_low_memory_core_early(), which will go over all reserved
> memblocks, marking the pages as PG_reserved.
>
> So manually marking pages as PG_reserved is not necessary, they are
> already in the desired state (otherwise they would have been handed over
> to the buddy as free pages and bad things would happen).
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Bhupesh Sharma <bhsharma@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Dave Kleikamp <dave.kleikamp@oracle.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Laura Abbott <labbott@redhat.com>
> Cc: Greg Hackmann <ghackmann@android.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Kristina Martsenko <kristina.martsenko@arm.com>
> Cc: CHANDAN VN <chandan.vn@samsung.com>
> Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/arm64/kernel/machine_kexec.c |  2 +-
>  arch/arm64/mm/init.c              | 27 ---------------------------
>  2 files changed, 1 insertion(+), 28 deletions(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 6f0587b5e941..66b5d697d943 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -321,7 +321,7 @@ void crash_post_resume(void)
>   * but does not hold any data of loaded kernel image.
>   *
>   * Note that all the pages in crash dump kernel memory have been initially
> - * marked as Reserved in kexec_reserve_crashkres_pages().
> + * marked as Reserved as memory was allocated via memblock_reserve().
>   *
>   * In hibernation, the pages which are Reserved and yet "nosave" are excluded
>   * from the hibernation iamge. crash_is_nosave() does thich check for crash
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 7205a9085b4d..c38976b70069 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -118,35 +118,10 @@ static void __init reserve_crashkernel(void)
>         crashk_res.start = crash_base;
>         crashk_res.end = crash_base + crash_size - 1;
>  }
> -
> -static void __init kexec_reserve_crashkres_pages(void)
> -{
> -#ifdef CONFIG_HIBERNATION
> -       phys_addr_t addr;
> -       struct page *page;
> -
> -       if (!crashk_res.end)
> -               return;
> -
> -       /*
> -        * To reduce the size of hibernation image, all the pages are
> -        * marked as Reserved initially.
> -        */
> -       for (addr = crashk_res.start; addr < (crashk_res.end + 1);
> -                       addr += PAGE_SIZE) {
> -               page = phys_to_page(addr);
> -               SetPageReserved(page);
> -       }
> -#endif
> -}
>  #else
>  static void __init reserve_crashkernel(void)
>  {
>  }
> -
> -static void __init kexec_reserve_crashkres_pages(void)
> -{
> -}
>  #endif /* CONFIG_KEXEC_CORE */
>
>  #ifdef CONFIG_CRASH_DUMP
> @@ -586,8 +561,6 @@ void __init mem_init(void)
>         /* this will put all unused low memory onto the freelists */
>         memblock_free_all();
>
> -       kexec_reserve_crashkres_pages();
> -
>         mem_init_print_info(NULL);
>
>         /*
> --
> 2.17.2

LGTM, so:
Reviewed-by: Bhupesh Sharma <bhsharma@redhat.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
