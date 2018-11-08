Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5ECECDE47
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 19:14:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201212081C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 19:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eZ7MN8Ny";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYKBzT0d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 201212081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUaw/xio6hrM/vpu9ZAfgAf/zr1Czi6aRLrhdsXsG3g=; b=eZ7MN8NydTTV3K
	lNI6BY8Yu/4ZSezSzywsHm5eOCJnaShi5azb6SeWgkLyRAKgLehXKyeDYNJL5BWZDcj+Hamk98Jc6
	0wKCWzcG8iifswEVFxYslmWraXkxLOc4jGN9ScRTa/VJwcjhqlsWFyVCK6X4RTqY+qPfz4aGT5zpd
	BIQUlKMr+3VY+G2ZtiZOTrIC1jt4CExEjSzuR9/f7hPX7IU1cDN3rzBgk9N3tQigv3uS2tjbTW9Kt
	DsQAtpie4cVf0wykE8VqUP5xILB/Xa1u8XkCaPfF+DclvRxaNka5txn3ctaPqnh9Z0jkQdwqzJQUJ
	N3MN6lkgyOfnGo/mmR/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKpkk-00061x-4Z; Thu, 08 Nov 2018 19:14:06 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKpka-0005gH-6y
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 19:13:58 +0000
Received: by mail-it1-x142.google.com with SMTP id b7-v6so3224942itd.5
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 11:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9pqgH5iPyY9JT34F1WXkxY6gvLmgbkxVD023KV58pqA=;
 b=hYKBzT0deMlLz1oSe/c+8VVcDAGWbH40xIsshe0Azuk1a3dWEL9hqyHgk6vjfqNbw9
 wtVl4VxjSvJfAaLR7HkdiH6R+kAeRirTZqsHL0VlhPedgAEYtA84wGz14uNM+itrLbvf
 AGAZ6pOQyIQoQSzJ1Vchlr7mSs0m2zcPI5HrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9pqgH5iPyY9JT34F1WXkxY6gvLmgbkxVD023KV58pqA=;
 b=mr9SMJHw9OzHZtLEXMXJxM7l7LEQVzQcOzTQivD7P6Fezk1vlgEJDRcTLJ+WsGhrJX
 StoWXhF43QQBDrA3BxCQzEGaUPtdP0JHqP4MPstZ6AfwRC6Bi1fPLLpuZhXBedgiW5X9
 Xha21tzAKIKRVOQ1cE6XOK5F/F2k6OGc5z77VV90fQEQGX5WloMP7wFmcNhzZ7YhnZAP
 JGNkc9hgbGohHGxb1zFw5aI0wyWVmmr/DGF83PBGGrD7oxEJCXTPRlDtdDrbLqc5ew+x
 J8xBKpBEwnnbosUMSc4jHNXFRLtp6c6e7LNrFfNqgFmdA1OcqEADUe/3j6NZ803rSo/+
 nzww==
X-Gm-Message-State: AGRZ1gI2vImMJX3V20RjOY7+ZdRIPMECKt6ZlfHfFaGFfNrvkyQy5ck1
 CLcJWCSNZluqvfWT3xxCPxE5qAnoikrsc7qkso3cnw==
X-Google-Smtp-Source: AJdET5dE0chaBu0v2SQgptNYxClMkGO6bEUA6+cpjcL20By1TijHErXIAIdTSRfiiNDIDXMed6ta2owj1PbcI+ZfJUQ=
X-Received: by 2002:a24:7d8d:: with SMTP id
 b135-v6mr2079018itc.121.1541704425013; 
 Thu, 08 Nov 2018 11:13:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a6b:4f16:0:0:0:0:0 with HTTP;
 Thu, 8 Nov 2018 11:13:44 -0800 (PST)
In-Reply-To: <20181107205433.3875-2-logang@deltatee.com>
References: <20181107205433.3875-1-logang@deltatee.com>
 <20181107205433.3875-2-logang@deltatee.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 8 Nov 2018 20:13:44 +0100
Message-ID:
 <CAKv+Gu9c+img+yqpmG9HD_bOihXLzQ70W+5Wki0FTmx7wYj37w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: Introduce common STRUCT_PAGE_MAX_SHIFT define
To: Logan Gunthorpe <logang@deltatee.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_111356_281304_76A85A8E 
X-CRM114-Status: GOOD (  20.48  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Bates <sbates@raithlin.com>, Linux-MM <linux-mm@kvack.org>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108191344.DJOyRiudHUJQ8os_aDFVwyACdSiJMUPMoaeQuDabmcE@z>

On 7 November 2018 at 21:54, Logan Gunthorpe <logang@deltatee.com> wrote:
> This define is used by arm64 to calculate the size of the vmemmap
> region. It is defined as the log2 of the upper bound on the size
> of a struct page.
>
> We move it into mm_types.h so it can be defined properly instead of
> set and checked with a build bug. This also allows us to use the same
> define for riscv.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Acked-by: Will Deacon <will.deacon@arm.com>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christoph Hellwig <hch@lst.de>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  arch/arm64/include/asm/memory.h | 9 ---------
>  arch/arm64/mm/init.c            | 8 --------
>  include/asm-generic/fixmap.h    | 1 +
>  include/linux/mm_types.h        | 5 +++++
>  4 files changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index b96442960aea..f0a5c9531e8b 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -34,15 +34,6 @@
>   */
>  #define PCI_IO_SIZE            SZ_16M
>
> -/*
> - * Log2 of the upper bound of the size of a struct page. Used for sizing
> - * the vmemmap region only, does not affect actual memory footprint.
> - * We don't use sizeof(struct page) directly since taking its size here
> - * requires its definition to be available at this point in the inclusion
> - * chain, and it may not be a power of 2 in the first place.
> - */
> -#define STRUCT_PAGE_MAX_SHIFT  6
> -
>  /*
>   * VMEMMAP_SIZE - allows the whole linear region to be covered by
>   *                a struct page array
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9d9582cac6c4..1a3e411a1d08 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -612,14 +612,6 @@ void __init mem_init(void)
>         BUILD_BUG_ON(TASK_SIZE_32                       > TASK_SIZE_64);
>  #endif
>
> -#ifdef CONFIG_SPARSEMEM_VMEMMAP
> -       /*
> -        * Make sure we chose the upper bound of sizeof(struct page)
> -        * correctly when sizing the VMEMMAP array.
> -        */
> -       BUILD_BUG_ON(sizeof(struct page) > (1 << STRUCT_PAGE_MAX_SHIFT));
> -#endif
> -
>         if (PAGE_SIZE >= 16384 && get_num_physpages() <= 128) {
>                 extern int sysctl_overcommit_memory;
>                 /*
> diff --git a/include/asm-generic/fixmap.h b/include/asm-generic/fixmap.h
> index 827e4d3bbc7a..8cc7b09c1bc7 100644
> --- a/include/asm-generic/fixmap.h
> +++ b/include/asm-generic/fixmap.h
> @@ -16,6 +16,7 @@
>  #define __ASM_GENERIC_FIXMAP_H
>
>  #include <linux/bug.h>
> +#include <linux/mm_types.h>
>
>  #define __fix_to_virt(x)       (FIXADDR_TOP - ((x) << PAGE_SHIFT))
>  #define __virt_to_fix(x)       ((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_SHIFT)
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5ed8f6292a53..2c471a2c43fa 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -206,6 +206,11 @@ struct page {
>  #endif
>  } _struct_page_alignment;
>
> +/*
> + * Used for sizing the vmemmap region on some architectures
> + */
> +#define STRUCT_PAGE_MAX_SHIFT  (order_base_2(sizeof(struct page)))
> +
>  #define PAGE_FRAG_CACHE_MAX_SIZE       __ALIGN_MASK(32768, ~PAGE_MASK)
>  #define PAGE_FRAG_CACHE_MAX_ORDER      get_order(PAGE_FRAG_CACHE_MAX_SIZE)
>
> --
> 2.19.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
