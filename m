Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9617EC28B2F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSGs6hwfCAYt+cKlV7/ga8L174RZgIAXHUlPi4fNb7Y=; b=Sn6FOYVTJqlY57
	uI5k9hj0Vhs2DMymr0rt8QldhDx0kGEU4059NYWx0IOtjRDeHWjK42dGaKgbf1/uzSWnrS5EcKOKl
	zuQce+oekvGM0MaazUJkxl/HXsms2VGzGhPoHA7VxRg5JTj0aigjtG7QJ31JIhRMHtkhBJzId1ty6
	FV6ln2TMTTyowkX9NnchvvbXQ7mN1i0JeybHL4vTwnBbKqh6Vh/hV6KE1Qc0c5CzBE0G+QmujCRVS
	KwXumHdJPwm3eTuGJSxLxZl1L4JsZSwet5VLDt8sdnZp8UmOjz2ub3ancoRZnvuz4h9ODD6PcBr8Y
	hhP/vfXsAJma4ly4P5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLnf-00000008Vof-1WbJ;
	Wed, 12 Mar 2025 13:07:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLT0-00000008RnL-2jLj
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 12:45:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso42645e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741783545; x=1742388345; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7nXrf8enrrb8z3uABVuZMTlrSLNofRDk6iKufuqXac=;
        b=AW8d+0ghk6sUxA9J8RO+Sz8kf47QUC1ICA90qXp1iaIPTR6aCSCRab+M0YbezVRkZq
         /0RnHT2oUYpm6LL1isGKByWMHZnErQSn5KMcDGnccKpQEh1Wi1ORfL5rZgg4th1LihU5
         SMYGN7TbJ7zYdTPrWUDvvM3UDpE/f2hxFnW2le64Mtr7x5ihWSfKYRRyJyaBmxYlwyob
         +rYdK+Cgz8qB8yXBE4GQ65dB0xErA7kcv1uJilUskxKB3iAv6wCwniDzx749gC7p53Fv
         EKxi65PyG8qfvYy/Utq8QbF8HpALKX2/hOFtRHsBvcPL3ValVOUpprI3Zi9xAncixlg3
         ny/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741783545; x=1742388345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7nXrf8enrrb8z3uABVuZMTlrSLNofRDk6iKufuqXac=;
        b=JHAWSvVPYcqT+Xeus0dd0ueb/6uWxVnETGxUK46pZAMmnCtiF93Orh47lgPIs+bI24
         0RWcaqE9LrYec1SSY/3I4ySARylovEXKyz7xJY+brhIjvBoyL/spLj5nY5bcmgyuK0M6
         Q1VuHdHBWopvXJYFIB/NqIniITP4fzcvILmbzzTyh+TWWsrcHPqq7qlqAqfzXwITTR4U
         k/AQoZXVNA8os8APk0Ei5MGF4IuL8cSlxiSWrEgHfvUEmafY/7YJw9TPWAiOHT5agVoi
         /vM2ycJJzjwyNtOx/ivciMVowo52GEAc7SnUKgl+lm9nwdiAvqvWscwvE/4Fq+PB3KpU
         2gzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlZfNTuuGiyCdlpNrlgU0R/HX5MLX2wj8CHaRNLFoJy7FzN33WNbI+++GTxurN+3P3foHOT/UHuDrr8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbvHpaaKNQwUde3U2erGDuWHC0srj1PY8oCQWicjlUmstGtu+d
	+sOyEuyRr3eo1umnW2j6wU5th37p0V9r7aQp7rqqZNmg0IKovVYVE1lGnAInfw==
X-Gm-Gg: ASbGncuqlXYXXsTs5M4v+Od4fV/Pldlm5rBgPRcanMzXfDvmRph4cJWAkmdpII2ANqj
	CDubSgvf31UcBuGOx77yh5VOH1AyOKDI5GW2mCaFuunCFn8GWenJq1g+Q/TvnY26Ey+oL6rzd2v
	f4G0ohVaZ6rOeQAY2M6sEXaTzDTdtTlEFmPgxTwLW052wutUA6wnfeyPka7u6CSM4oTsoN8X6du
	QW4p1XrsAPgM0u6KK4L6Vo8swnCxeDlHY4A/rWfeRrfaCNCWph8Y3D94iWkwq6cnLszQJ8rJOF9
	RQgzQ3SJjwm0hNNT3Vp2nrZuQeEeQSbizxf0bVbLKIZJA2snioeBfZQZTH5zSw2YqY6/5bPk5eJ
	7PIdOhWqfG3MGaCM=
X-Google-Smtp-Source: AGHT+IGl6ij5XGs/qN6P6iUkVVrm0h4AAzKswiqP0QsBVlB9onr8dRHcRoIgJqJfm8N1ML/DsO9qAQ==
X-Received: by 2002:a05:600c:5801:b0:43b:bfe9:8b43 with SMTP id 5b1f17b1804b1-43d09ea3748mr1245205e9.4.1741783544916;
        Wed, 12 Mar 2025 05:45:44 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8c5d0fsm20697625e9.32.2025.03.12.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:45:44 -0700 (PDT)
Date: Wed, 12 Mar 2025 12:45:39 +0000
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
Subject: Re: [PATCH v3 15/23] iommu/pages: Move the __GFP_HIGHMEM checks into
 the common code
Message-ID: <Z9GB8_j_8a4xCTsT@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <15-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_054546_700517_170188BD 
X-CRM114-Status: GOOD (  21.33  )
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

On Tue, Feb 25, 2025 at 03:39:32PM -0400, Jason Gunthorpe wrote:
> The entire allocator API is built around using the kernel virtual address,
> it is illegal to pass GFP_HIGHMEM in as a GFP flag. Block it in the common
> code. Remove the duplicated checks from drivers.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c  | 2 --
>  drivers/iommu/io-pgtable-dart.c | 1 -
>  drivers/iommu/iommu-pages.c     | 4 ++++
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 62df2528d020b2..08d0f62abe8a09 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -267,8 +267,6 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>  	dma_addr_t dma;
>  	void *pages;
>  
> -	VM_BUG_ON((gfp & __GFP_HIGHMEM));
> -
>  	if (cfg->alloc)
>  		pages = cfg->alloc(cookie, size, gfp);
>  	else
> diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
> index 7efcaea0bd5c86..ebf330e67bfa30 100644
> --- a/drivers/iommu/io-pgtable-dart.c
> +++ b/drivers/iommu/io-pgtable-dart.c
> @@ -111,7 +111,6 @@ static void *__dart_alloc_pages(size_t size, gfp_t gfp)
>  {
>  	int order = get_order(size);
>  
> -	VM_BUG_ON((gfp & __GFP_HIGHMEM));
>  	return iommu_alloc_pages(gfp, order);
>  }
>  
> diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
> index 3077df642adb1f..a7eed09420a231 100644
> --- a/drivers/iommu/iommu-pages.c
> +++ b/drivers/iommu/iommu-pages.c
> @@ -37,6 +37,10 @@ void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
>  	const unsigned long pgcnt = 1UL << order;
>  	struct folio *folio;
>  
> +	/* This uses page_address() on the memory. */
> +	if (WARN_ON(gfp & __GFP_HIGHMEM))
> +		return NULL;
> +
>  	/*
>  	 * __folio_alloc_node() does not handle NUMA_NO_NODE like
>  	 * alloc_pages_node() did.
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
