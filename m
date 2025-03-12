Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECF8C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYfXNr7EmzHuja6YN6lT/ajJUd0SJtN00Pwcq7YKy1Y=; b=29f6Fok+rrpRm6
	Mi9qbpBGZEQTIqQjrrcTthDptkgNmyY0tIf/7zQupMOSAax2ss1cDlj4omOodtoR2m0vgCs7x4dWI
	940pen32QhYB+VigYsKHYRzhHXjlki++bkgRx9Y1eb/wXIJez2x24kS+dE9GY4a7Sak4/M0OXgIym
	VFIcdqzxvj9kpDblDkGaaShrGqj2gI1zsp81GpaI/BqGZWDDQAMRgJUPkkzw+JaxwE4GVw8qU1xHK
	cHvvBrny3saIA5is32W1v17eKwI+fkWDKiIKjMB10etF+3J5raDOuLSkyAK7DkaWkFG4aXIJhOQK7
	Miz/vjZeDvrZzgNoRD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLSP-00000008RZD-2VXX;
	Wed, 12 Mar 2025 12:45:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKUY-00000008Ijg-2UNA
	for linux-riscv@bombadil.infradead.org;
	Wed, 12 Mar 2025 11:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/DRboL7iXAangnAe10zAw/fnPXaxzgNmenGuCjK+wlo=; b=oGhoweT0F60ChhiXzCE2sHn237
	ISmbDJLimVlBjbU0bMitIIlteEA4YBR3nwsok5ENAY00zuKB3mH5SmWSC2s3d8n+QWSljONXu7cOm
	wakBxInxQuactUvAv8p8i60w1/mtejS+MtmtSL9oBJ9k/KuOfWb+DzJGG65JHvHY8ACBY7BRVJU6Z
	RSqgQd5fs8NXglLL4eWwKRVYH2ggOqLWRGfqItCbath+y9vzWCo76RIzs7wwJF6sRAtlhiSYstSxO
	lJL7LSZjmH6PB+kANWMA3TZDB79Dly/rXJpNaeAQEojUx0m80ebblzZW1+Su8jfrCN+kY3l+xBD10
	henJz9wA==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKUV-00000002Mav-1ks8
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 11:43:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso40715e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741779792; x=1742384592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/DRboL7iXAangnAe10zAw/fnPXaxzgNmenGuCjK+wlo=;
        b=PgBZ5seaugSIcUEK1q/Ie4Fx5PDrP9IW/4dzxSnOTcs6nmlvXaXVPG605DjeXW2Sff
         8+LlMwj2DU2+oYdlFltwy3mAmRtw1x05belBl6RRahVB6jSCzgNwdHI9WBIEEEZD0LAz
         GrHEeoExMuT6hu8wpeOMb7D2+/kukGqATtWsFWTWYRgonMtIDBYBbGoSJo8x45Fy/pd6
         W7ZTKGYRy2hltkhiYeTNs1IGOvNPz3dEEGcVUdAdAGHSr3KkKGX6ScADWXv8aY8uO2e3
         jFNgszgLnz2OYEetmS9uWZl7Kw5FXV5YevQdQEH5E4bSHvTKvWTTjCDD0bDlmrKhiZKR
         B59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779792; x=1742384592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DRboL7iXAangnAe10zAw/fnPXaxzgNmenGuCjK+wlo=;
        b=sFQXr3Afc+R6owcjedR//4yybuR/PQ1bQP6qVTmDSylD4ukxtfaGq1Cxx9OKTHJJOq
         1Za8wTRB2PCVKWHWMUDE9d05zK1VPkeY1phOzjU/ybUXXPXkRq2XMrLCv/sec4CQvalo
         DO4deidGQhAYXMgsOMCzMw2J0uTXi42sUccMC4YaRdiHC9CNcpTFFVvxbICvhnSeSspD
         jOSHFBniJg73G6Q3C4EXYdN2HYtbncSI6BYWQrTZzHvjiyE1WHo0fkMk3mLLxrddZvdJ
         kRwJDNs6JBMP1KV/BwVk54wNjsSxgmTqfwd+owAD17yuEvqRDpdI2N/cSHz+vC7TPdFC
         c27Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrfGHyj7rVfqi8W3mf+qAJmswBww18WsTAk6iwKbgc1/df5+MePrveqPGBpc8JqAX2cBb58oBwu7cjgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAxJi8aLPPBW7wyKgHmx/Pw8LfVytXykW9lw419ZhG5eMqLp99
	8Yc17bvU7apSOERWqLG9ZYfSNUUAElT3ViNLGNR/bEMof46C6xxTUbuHzZ8kRw==
X-Gm-Gg: ASbGncsNQO2SGnt+OPZEQKQ2wMn9hhO7etn2Z0n9cLEgYbWz6bwX/UjfFw+gS5C4EAE
	eFXgs01htUCYQOz8WPBCzaS8+ptXdGBYfcyCjRSv23BF/uAy0nC45/vTRkheBPaJM347M1/hJ1N
	cJLk7/BGcgf/rz0ayU7cAWiPf/39KE72Bv1BJeWrQeeU+9Te4nWXLxvxStYq8acPYopiDR3Nuox
	WgBU+OEjVMI0qg3as9pS0pk+2A7fhritCWHI3/RGbogLxZlIkQdNZfk0RXnSIIul5eNLww6ExM9
	UaAPRYRTxbLW5CEyYh3jEY+mSoxITnQ46ukSEwYfvG4+RXd35TdvwPoNxm+dLTJURrsdlg8hoxO
	wgIXc
X-Google-Smtp-Source: AGHT+IGAlRZ9FGEpVbzn9/E/l/2Ksb4Pgfv6rI6D7I3wU6Ogl1uoOZwLKHkEYMZpOjmtLPXmOnf3OA==
X-Received: by 2002:a7b:c8d1:0:b0:439:8d84:32ff with SMTP id 5b1f17b1804b1-43d0a5e40ccmr994365e9.3.1741779792013;
        Wed, 12 Mar 2025 04:43:12 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a72ea88sm18970735e9.7.2025.03.12.04.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:43:11 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:43:07 +0000
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
Subject: Re: [PATCH v3 03/23] iommu/pages: Remove
 __iommu_alloc_pages()/__iommu_free_pages()
Message-ID: <Z9FzS-AzZNzYhrou@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <3-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_114315_544738_75706EFB 
X-CRM114-Status: GOOD (  22.33  )
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

On Tue, Feb 25, 2025 at 03:39:20PM -0400, Jason Gunthorpe wrote:
> These were only used by tegra-smmu and leaked the struct page out of the
> API. Delete them since tega-smmu has been converted to the other APIs.
> 
> In the process flatten the call tree so we have fewer one line functions
> calling other one line functions.. iommu_alloc_pages_node() is the real
> allocator and everything else can just call it directly.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

> ---
>  drivers/iommu/iommu-pages.h | 49 ++++++-------------------------------
>  1 file changed, 7 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
> index 82ebf00330811c..0ca2437989a0e1 100644
> --- a/drivers/iommu/iommu-pages.h
> +++ b/drivers/iommu/iommu-pages.h
> @@ -46,40 +46,6 @@ static inline void __iommu_free_account(struct page *page, int order)
>  	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
>  }
>  
> -/**
> - * __iommu_alloc_pages - allocate a zeroed page of a given order.
> - * @gfp: buddy allocator flags
> - * @order: page order
> - *
> - * returns the head struct page of the allocated page.
> - */
> -static inline struct page *__iommu_alloc_pages(gfp_t gfp, int order)
> -{
> -	struct page *page;
> -
> -	page = alloc_pages(gfp | __GFP_ZERO, order);
> -	if (unlikely(!page))
> -		return NULL;
> -
> -	__iommu_alloc_account(page, order);
> -
> -	return page;
> -}
> -
> -/**
> - * __iommu_free_pages - free page of a given order
> - * @page: head struct page of the page
> - * @order: page order
> - */
> -static inline void __iommu_free_pages(struct page *page, int order)
> -{
> -	if (!page)
> -		return;
> -
> -	__iommu_free_account(page, order);
> -	__free_pages(page, order);
> -}
> -
>  /**
>   * iommu_alloc_pages_node - allocate a zeroed page of a given order from
>   * specific NUMA node.
> @@ -110,12 +76,7 @@ static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
>   */
>  static inline void *iommu_alloc_pages(gfp_t gfp, int order)
>  {
> -	struct page *page = __iommu_alloc_pages(gfp, order);
> -
> -	if (unlikely(!page))
> -		return NULL;
> -
> -	return page_address(page);
> +	return iommu_alloc_pages_node(numa_node_id(), gfp, order);
>  }
>  
>  /**
> @@ -138,7 +99,7 @@ static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
>   */
>  static inline void *iommu_alloc_page(gfp_t gfp)
>  {
> -	return iommu_alloc_pages(gfp, 0);
> +	return iommu_alloc_pages_node(numa_node_id(), gfp, 0);
>  }
>  
>  /**
> @@ -148,10 +109,14 @@ static inline void *iommu_alloc_page(gfp_t gfp)
>   */
>  static inline void iommu_free_pages(void *virt, int order)
>  {
> +	struct page *page;
> +
>  	if (!virt)
>  		return;
>  
> -	__iommu_free_pages(virt_to_page(virt), order);
> +	page = virt_to_page(virt);
> +	__iommu_free_account(page, order);
> +	__free_pages(page, order);
>  }
>  
>  /**
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
