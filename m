Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CCAC02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 05:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WGNePNPnuQU35dbsM8RPbn1HHsVU08Ckd86Ys93GCA=; b=12zm/9ORHZZ+nU
	inIvKs09BkJo+GVze3f/sf8UBQoJQ+eyjSQ8Egk//Oh2qpcjGSU1JzZ73yNBUDU8sVAVSdcXZxGBY
	1KzobOCMJDbA9CUvC8TTlP8UhXKjLSDevFIVcvjEGxjMU2/cjDhTRFaIXkLanbVukDsimXpqJjh1X
	0ZOc2lcWdsdF7cuTjjNA2rU2p5idqpuXB6A8shgCg8WeDx+KDdTuc24nZVfR4YMmOhG+Lhp+rXAVA
	EtLWs0o3meda7OU8vETOuqQZ8YodGmGVKtndRQZJSD+TO3VWOpg/zJeLIDUE4pclrHuLKgMPbPzuY
	g2Kh3BhmHYE+OTKG/fSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfuUG-00000005HAX-0pQ4;
	Thu, 06 Feb 2025 05:31:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfuSo-00000005H4V-2WGb
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 05:30:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f16af1f71so7762865ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 21:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738819809; x=1739424609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pRoJEJRUPVObRh6bcpNHZcCJSeUoo6qbmkVpHeNteUs=;
        b=f2iTzNMd0r6J4YutlIZtEDWZSGE2qg113t7f6X3UusRvz1uWmGC94/KraHhR8rIJ5m
         dEZQiGrDqSBWAJqdxIs3O3cpTm5bIC4XmM+858a5XlZsyN85qBDZYDH8B2PCQJBS4gZw
         O42PBxnzQaxh0/NXJYsGo8z/5oWaAsTepLi2v4Qq2GGhQTJkyaTRTHMhL3xW/Op7I8ss
         wYXcK6+D/gYJBSfxK/LIDPSpE83Q7t5D3IMnYXmKIVbrWyLPbNfkqLi9tyySvG9qd2yR
         NoOEBo9AuPttJI6oaBN+gTTfuLyHRDNlZ4PJ24for5dGplCu23AdOd3vtjfX0aHlG+R9
         3I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738819809; x=1739424609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRoJEJRUPVObRh6bcpNHZcCJSeUoo6qbmkVpHeNteUs=;
        b=Qnr0a8LW3YHWhSg8dPfpl/WQYluAvQw//VcC/3Ys76AGa5khuq2zmP3kM2LP4zZKM8
         oPWx0ZdBKvpkYw81b+m1BgnpVkPD6Tgbo6OoxphDIjK3hwjJFoIpIEjKkuLWBv4nK81z
         HhOY4XrGE2R9iOA+YHxpuDlPShwHTaWiCypdxkVXBeH7ofQvW0vzX+z5EDOrvxf5kVP9
         Gyb3hwqyLkgj44VmAT2NEEQORJRtGWdvVHZiiFgYUnOLZVb/+12I9xd6MamSXkjsCH0W
         LTbmcXzXW6ZubW82Jj3rBLYbGUh6JFj9cxxk0bBAtFea5DEscanCugQMWaXDrDhA8Jjc
         Q+OA==
X-Forwarded-Encrypted: i=1; AJvYcCWdrm8WucUFNE/Z4QjlUilK1Ypx0+f8Wq5gYLxr2Xo7WkSuv3myrI/CTcQkEQImL4l4TGIMekdT9Lup/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOhFNHBq9MYCZRfUujcd+A6OcdvaxJASh7pk9BvsYQDhRe3Qyu
	Ic5pq7UuTMZOA0mg4a5GqWYJOMaL6j554XdlFofHDeia7AmoaVCam6qoLzeej1U=
X-Gm-Gg: ASbGncumh/Pu4Z9WAEDtTjJPV+1f6I98DTzYa6p7Pt6Vt39kQcOQHait+dslDcryLLR
	G+ms3ITCOCezilluolqgxuN35GbkI7lx3qxIOrlhUmKz6J6z8eNILgQ+OI94rBeC/S02PlEYjj/
	Y9sJ7r5KlsF0rhABwkM5UhXbh5Jvf2mvCfwkhWV1uUNEIWn585lYV7WuUQT9oWWezfpEjaGnBPt
	TmUgMMJyjZNB+3vpNDnad25Hoq83JRA+JcQ20C83vFUbBmmxyGbt0KYh2P7lq6OzcWPcWCJVfhz
	CKySnb+8WPZjk5JaleIdC6+N6ajobLmINg==
X-Google-Smtp-Source: AGHT+IE1tNZkBLKVThcpOUcjJPjEE6LeUB5SuPAtY9c/ZHJbnXa2ZNVKpzCci8Lb0vwwFKWpOtSe+Q==
X-Received: by 2002:a17:902:d28b:b0:216:410d:4c53 with SMTP id d9443c01a7336-21f17ebba71mr74788475ad.41.1738819809035;
        Wed, 05 Feb 2025 21:30:09 -0800 (PST)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653c997sm3459215ad.78.2025.02.05.21.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:30:08 -0800 (PST)
Date: Wed, 5 Feb 2025 21:30:05 -0800
From: Tomasz Jeznach <tjeznach@rivosinc.com>
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
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 17/19] iommu/riscv: Update to use
 iommu_alloc_pages_node_lg2()
Message-ID: <Z6RI3ftJTrm3UxoO@tjeznach.ba.rivosinc.com>
References: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <17-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_213010_879424_286EC84C 
X-CRM114-Status: GOOD (  21.42  )
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

On Tue, Feb 04, 2025 at 02:34:58PM -0400, Jason Gunthorpe wrote:
> One part of RISCV already has a computed size, the other part seems to use
> PAGE_SIZE (which is probably SZ_4K?). Convert the call.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/riscv/iommu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 549bd8d0615d75..b7cee3d651b179 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -65,13 +65,15 @@ static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p
>  	return devres->addr == target->addr;
>  }
>  
> -static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu, int order)
> +static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu,
> +				   unsigned int size)
>  {
>  	struct riscv_iommu_devres *devres;
>  	void *addr;
>  
> -	addr = iommu_alloc_pages_node(dev_to_node(iommu->dev),
> -				      GFP_KERNEL_ACCOUNT, order);
> +	addr = iommu_alloc_pages_node_lg2(dev_to_node(iommu->dev),
> +					  GFP_KERNEL_ACCOUNT,
> +					  order_base_2(size));
>  	if (unlikely(!addr))
>  		return NULL;
>  
> @@ -161,9 +163,8 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
>  	} else {
>  		do {
>  			const size_t queue_size = entry_size << (logsz + 1);
> -			const int order = get_order(queue_size);
>  
> -			queue->base = riscv_iommu_get_pages(iommu, order);
> +			queue->base = riscv_iommu_get_pages(iommu, queue_size);
>  			queue->phys = __pa(queue->base);

All allocations must be 4k aligned, including sub-page allocs.

Note from IOMMU/RISC-V spec:

"If the command-queue has 256 or fewer entries then the base address of the
queue is always aligned to 4-KiB."

I can't find this to be guaranteed with new allocation API.

>  		} while (!queue->base && logsz-- > 0);
>  	}
> @@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
>  				break;
>  			}
>  
> -			ptr = riscv_iommu_get_pages(iommu, 0);
> +			ptr = riscv_iommu_get_pages(iommu, PAGE_SIZE);
>  			if (!ptr)
>  				return NULL;
>  
> @@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
>  	}
>  
>  	if (!iommu->ddt_root) {
> -		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
> +		iommu->ddt_root = riscv_iommu_get_pages(iommu, PAGE_SIZE);
>  		iommu->ddt_phys = __pa(iommu->ddt_root);
>  	}
>  
> -- 
> 2.43.0
> 

best,
- Tomasz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
