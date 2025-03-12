Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067C3C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ytYT9jQmgYTcg0SgIXRSE3PJw5Z0a1c3rc/3+q4lbs=; b=E1B1BXlG4CQV9e
	3Y1K/BFJWNp1mg2IXp9Qy+6+S4ITDvlwBaACbMpvuOZpoxADmy2Sh0pKmbAnJuodRRrX30BmQnejY
	IbmWB+O6Gd1of/UbHRk2bdx5EnCkgXSXN7ed+xefCXdf77OF7HAaxh9hC0pkjG91puwMhFWJsbSBa
	de7nifVxRKj3KXgZZrOeldAcZKLLd4+qYuCKqhSDDYMFcQxLEURioCudisgVgydCVqdnK2PovdNu2
	J8D4pwCMmQE+SXYg2w5sEvFOzR0/IUG0Mf5X4Go/E8tvH27GW4BfAd57VD71Ic9uRbqg/c9hSF56L
	aoHqnbK1m6hairp6IxAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLne-00000008Vn1-1PXG;
	Wed, 12 Mar 2025 13:07:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLSR-00000008RZY-01V8
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 12:45:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4393ee912e1so43905e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741783509; x=1742388309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6XsRAVYS5vvkiYq6htp9xtxjYL0Ohzn7Mzm+Pk000s=;
        b=kMQnSd+skJ8IeaJ44qtFe6HwmPweyJzf/rv+WGQBLfvyFbI+D0S66WYrFWvGkpJ9j4
         bX5FYOZL2mY2Nq0pO3XmVL4gid9llrK5z/onzdc6XImXOTPRdtBmOZ4fBi+XsSLyyKUC
         dlTO3ne/CVTacTcInaFVczZIssoAqJzGGQHoZC7G9bXIJXWsC0vmO38A4kCWlL8QNMiK
         j60oCAhIYIf28iWv4PoYo8uMMiI2/AiZZBcvWR5O2p+lzigGBE6hwAwxZD2KUfzQ2lhX
         ylWClOJvlJOAjNt3Rzl5qRf/QLqpTVutVjhCY6C/F59fp+NDexTqHXYpZ3FnJPGwpByo
         nh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741783509; x=1742388309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6XsRAVYS5vvkiYq6htp9xtxjYL0Ohzn7Mzm+Pk000s=;
        b=SYi1sXzkhusouNd23eP8QZxdbxGr5eKswFGZmfM4nmehWLPpCWFygfkJy+iQOqBoKo
         GJT4qcFUc0/4MDApmIbOI3a3z4axTZVRLUqjsuu/mNs772V+umGzwKJ3pDLVsBYrajWJ
         WmXlqKxNEsewJpR+d/FUksDqI5gj+fmvHFAi5SdEvkg947zRTKOQW2L1hz0FMvrpluKH
         yXP/TV8J9c3EadrdDlzGJ1oshz/klFHznEAVb5ZKlqKgqHGymBKuj9kvCXXiDV7wtSOe
         FIbHhxODOoZups1RZ7eVzBjUKytEhn0jb3eP5RATATJgxDshzHtwT8iqZZJvvSKSWfUT
         xymw==
X-Forwarded-Encrypted: i=1; AJvYcCWBmxgHIg36F9BXSoy03c4WjNQDoIdzX/9tkKuNRgf5HngwEG1OaQgwBofrEAK4rmIb5710TcAK4sR4UA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3RksPChV2dSR45l44JkNZ3Rz6haKUl2FUizocZCJ+tninjqi1
	frFisnXfZecLRhFKuPd3f3KUET6rt7deIveNA+gvDQr6RIucbvYLuPMCl0Co2A==
X-Gm-Gg: ASbGnctSLMHhoedraIA7iVW/zbeidRU+YKt5xMlxPbqAGwSCwmMeUqIkg0kwODx9B0S
	YAbKlLxStfCZwrgQcMfqMJgloHIpmE2otDix8ccKRXqT5JAgAIXxhrRZhY6J/4mAnNmCUaKWqwA
	S6ZtPSrRT33AlBZZeuE2hfQxjzHXg9BlEIqQXVdQ/o0HriKsPCyDWoE41Slvk0NE/pa/88uT2HJ
	76LrBFNNWzVk9eeDe3nMrWyvEZUPCfkru24Hqv7Rh0UY0OVzM7pBGbjbEjm7Lkva7kN6skMlw3d
	xrO9owT6m50AuHQ5n7dY0MRCEqlfIG90YHvRNm88qxiivv4iwCrcuZc4zd0LzlZnAzXzUdfcthC
	3BchK
X-Google-Smtp-Source: AGHT+IG4l6i7zsE0j06PLqFsFcdloNEjDbS1APZki97f74wF9+Bk20Rls5AlNCF5S5eWzRhlYo0ndA==
X-Received: by 2002:a05:600c:2d56:b0:439:7fc2:c7ad with SMTP id 5b1f17b1804b1-43d0a5fd65emr1090335e9.7.1741783509129;
        Wed, 12 Mar 2025 05:45:09 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7ae4sm20402347f8f.5.2025.03.12.05.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:45:08 -0700 (PDT)
Date: Wed, 12 Mar 2025 12:45:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 07/23] iommu/pages: De-inline the substantial functions
Message-ID: <Z9GB0IcNc2432dki@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <7-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_054511_104975_4726F1CC 
X-CRM114-Status: GOOD (  35.97  )
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

On Tue, Feb 25, 2025 at 03:39:24PM -0400, Jason Gunthorpe wrote:
> These are called in a lot of places and are not trivial. Move them to the
> core module.
> 
> Tidy some of the comments and function arguments, fold
> __iommu_alloc_account() into its only caller, change
> __iommu_free_account() into __iommu_free_page() to remove some
> duplication.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

> ---
>  drivers/iommu/Makefile      |   1 +
>  drivers/iommu/iommu-pages.c |  84 +++++++++++++++++++++++++++++
>  drivers/iommu/iommu-pages.h | 103 ++----------------------------------
>  3 files changed, 90 insertions(+), 98 deletions(-)
>  create mode 100644 drivers/iommu/iommu-pages.c
> 
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 5e5a83c6c2aae2..fe91d770abe16c 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y += amd/ intel/ arm/ iommufd/ riscv/
>  obj-$(CONFIG_IOMMU_API) += iommu.o
> +obj-$(CONFIG_IOMMU_SUPPORT) += iommu-pages.o
>  obj-$(CONFIG_IOMMU_API) += iommu-traces.o
>  obj-$(CONFIG_IOMMU_API) += iommu-sysfs.o
>  obj-$(CONFIG_IOMMU_DEBUGFS) += iommu-debugfs.o
> diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
> new file mode 100644
> index 00000000000000..31ff83ffaf0106
> --- /dev/null
> +++ b/drivers/iommu/iommu-pages.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Google LLC.
> + * Pasha Tatashin <pasha.tatashin@soleen.com>
> + */
> +#include "iommu-pages.h"
> +#include <linux/gfp.h>
> +#include <linux/mm.h>
> +
> +/**
> + * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
> + *                          specific NUMA node
> + * @nid: memory NUMA node id
> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * Returns the virtual address of the allocated page. The page must be
> + * freed either by calling iommu_free_pages() or via iommu_put_pages_list().
> + */
> +void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
> +{
> +	const unsigned long pgcnt = 1UL << order;
> +	struct page *page;
> +
> +	page = alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
> +	if (unlikely(!page))
> +		return NULL;
> +
> +	/*
> +	 * All page allocations that should be reported to as "iommu-pagetables"
> +	 * to userspace must use one of the functions below. This includes
> +	 * allocations of page-tables and other per-iommu_domain configuration
> +	 * structures.
> +	 *
> +	 * This is necessary for the proper accounting as IOMMU state can be
> +	 * rather large, i.e. multiple gigabytes in size.
> +	 */
> +	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
> +	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
> +
> +	return page_address(page);
> +}
> +EXPORT_SYMBOL_GPL(iommu_alloc_pages_node);
> +
> +static void __iommu_free_page(struct page *page)
> +{
> +	unsigned int order = folio_order(page_folio(page));
> +	const unsigned long pgcnt = 1UL << order;
> +
> +	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
> +	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
> +	put_page(page);
> +}
> +
> +/**
> + * iommu_free_pages - free pages
> + * @virt: virtual address of the page to be freed.
> + *
> + * The page must have have been allocated by iommu_alloc_pages_node()
> + */
> +void iommu_free_pages(void *virt)
> +{
> +	if (!virt)
> +		return;
> +	__iommu_free_page(virt_to_page(virt));
> +}
> +EXPORT_SYMBOL_GPL(iommu_free_pages);
> +
> +/**
> + * iommu_put_pages_list - free a list of pages.
> + * @head: the head of the lru list to be freed.
> + *
> + * Frees a list of pages allocated by iommu_alloc_pages_node().
> + */
> +void iommu_put_pages_list(struct list_head *head)
> +{
> +	while (!list_empty(head)) {
> +		struct page *p = list_entry(head->prev, struct page, lru);
> +
> +		list_del(&p->lru);
> +		__iommu_free_page(p);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(iommu_put_pages_list);
> diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
> index fcd17b94f7b830..e3c35aa14ad716 100644
> --- a/drivers/iommu/iommu-pages.h
> +++ b/drivers/iommu/iommu-pages.h
> @@ -7,67 +7,12 @@
>  #ifndef __IOMMU_PAGES_H
>  #define __IOMMU_PAGES_H
>  
> -#include <linux/vmstat.h>
> -#include <linux/gfp.h>
> -#include <linux/mm.h>
> +#include <linux/types.h>
> +#include <linux/topology.h>
>  
> -/*
> - * All page allocations that should be reported to as "iommu-pagetables" to
> - * userspace must use one of the functions below.  This includes allocations of
> - * page-tables and other per-iommu_domain configuration structures.
> - *
> - * This is necessary for the proper accounting as IOMMU state can be rather
> - * large, i.e. multiple gigabytes in size.
> - */
> -
> -/**
> - * __iommu_alloc_account - account for newly allocated page.
> - * @page: head struct page of the page.
> - * @order: order of the page
> - */
> -static inline void __iommu_alloc_account(struct page *page, int order)
> -{
> -	const long pgcnt = 1l << order;
> -
> -	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
> -	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
> -}
> -
> -/**
> - * __iommu_free_account - account a page that is about to be freed.
> - * @page: head struct page of the page.
> - * @order: order of the page
> - */
> -static inline void __iommu_free_account(struct page *page)
> -{
> -	unsigned int order = folio_order(page_folio(page));
> -	const long pgcnt = 1l << order;
> -
> -	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
> -	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
> -}
> -
> -/**
> - * iommu_alloc_pages_node - allocate a zeroed page of a given order from
> - * specific NUMA node.
> - * @nid: memory NUMA node id
> - * @gfp: buddy allocator flags
> - * @order: page order
> - *
> - * returns the virtual address of the allocated page
> - */
> -static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
> -{
> -	struct page *page =
> -		alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
> -
> -	if (unlikely(!page))
> -		return NULL;
> -
> -	__iommu_alloc_account(page, order);
> -
> -	return page_address(page);
> -}
> +void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
> +void iommu_free_pages(void *virt);
> +void iommu_put_pages_list(struct list_head *head);
>  
>  /**
>   * iommu_alloc_pages - allocate a zeroed page of a given order
> @@ -104,42 +49,4 @@ static inline void *iommu_alloc_page(gfp_t gfp)
>  	return iommu_alloc_pages_node(numa_node_id(), gfp, 0);
>  }
>  
> -/**
> - * iommu_free_pages - free pages
> - * @virt: virtual address of the page to be freed.
> - *
> - * The page must have have been allocated by iommu_alloc_pages_node()
> - */
> -static inline void iommu_free_pages(void *virt)
> -{
> -	struct page *page;
> -
> -	if (!virt)
> -		return;
> -
> -	page = virt_to_page(virt);
> -	__iommu_free_account(page);
> -	put_page(page);
> -}
> -
> -/**
> - * iommu_put_pages_list - free a list of pages.
> - * @page: the head of the lru list to be freed.
> - *
> - * There are no locking requirement for these pages, as they are going to be
> - * put on a free list as soon as refcount reaches 0. Pages are put on this LRU
> - * list once they are removed from the IOMMU page tables. However, they can
> - * still be access through debugfs.
> - */
> -static inline void iommu_put_pages_list(struct list_head *page)
> -{
> -	while (!list_empty(page)) {
> -		struct page *p = list_entry(page->prev, struct page, lru);
> -
> -		list_del(&p->lru);
> -		__iommu_free_account(p);
> -		put_page(p);
> -	}
> -}
> -
>  #endif	/* __IOMMU_PAGES_H */
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
