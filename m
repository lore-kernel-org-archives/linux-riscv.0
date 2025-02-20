Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416ABC021B2
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 19:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aQs1RV4NHZXeYBplUE1kkbtIV55KnFtFiCkL+9np50=; b=IEnljTD+3MS7It
	N7rXEySkyregF59xBMrWomaz5TdE2GGdmnfcte/n7dvyuD3IIpulblna6o/Uk91s8G6N3+7S9yBAC
	b9a9V1n5pCc7oD6BwOyh5x7Y8RnKi04ixTF+TI4JcVB0plTUp9lFuhHVQ0GRqcHt0UCImYtdJvJ4Q
	3Ow6dFtzl8EA0ZAGJ9KPOwpbuCuGaRdhNqAHN86C0MCiV3VJza+gzFudu51y2bAhRQc0JMJ6gGTNX
	WXrcczxjiImZzFXgB3HXrNH7NVHf/b4R7TtX91vSmQNOOMtAEMV9PTD8Uv6BBi9Pk4OiWKJIRCVbN
	qxv0D+XCeeIbi4xUB2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlCKz-00000002d23-19c4;
	Thu, 20 Feb 2025 19:35:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlCKv-00000002czD-3Qi8
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 19:35:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220bfdfb3f4so29135225ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740080152; x=1740684952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bN/NPVn1vKfJddb+/MWowQ/DYT7KXXiFwwxB/L9OIQ=;
        b=phkHUGHpmNi6EAti1FZolmPgoOj6+IYkHoWDq6bgm+TVXxhbRmKghUSU0ZN9MgDszc
         gjaW0PttvvLwb5SU9sZGPoVSydezmxodMoLUnPE+ZF/c08LaueDG/GSwoNm0Ay5GouQQ
         O+TAu++Gw8+5Ys4t3ILn3X/GwR/CLoqOYgRHQjn5h3r9EsmpkVx5jV1Zm206yxphAOZL
         jE7KHbrlUHdiOGE+WnbExigwXB/z+Q4/nLkCFCvxnPZ0D8R7+l/5CupWP1NmLaM7UrR+
         igLHE77ibqCIEvVoAsnZwt127nofKnFA7IZ9NSeIMdL20z84vo9L4fv9TSICzdOWL8YQ
         0kJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740080152; x=1740684952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bN/NPVn1vKfJddb+/MWowQ/DYT7KXXiFwwxB/L9OIQ=;
        b=YFBGqxe/uOaQSElOHIz7RCVXkZw675NtJn1SAdPRPQ2e4G103B8ekFUcB8FISQE9Sx
         pLXOtYTq9tZfuXeGFqj5trvfN7oB4YVJJ31OLLeW3/tmUIQUVZ93GJvQVhE69LA0vK3l
         Zu++EmNXGh2quzLNrPEU3eqWyyjKCUBNXdmWqNbibvKJ7Moe2mivlBfiSa/bA68itXMm
         4mP5lhpV9fxAqS5q6TSi/t1zkvQ1f9tBO5PTmkVfxZv6/i4dBBOLwm+Rf4p5aTSpuFjy
         yuynIuKsNDvkQ3DLfnAi5iy61xCfF6bmV02hVcQ3PHdHN7PW0J/UVVJ3XZpJF12ZLNUM
         EESg==
X-Forwarded-Encrypted: i=1; AJvYcCXYfVPt4spqKVGc91QVudvWmZ64B+3yqRXhfAL1KH/pVwvIhRlNUzoQ0lNamu30cTcSjAPDjr8Amb+guw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGzA/4y8lKsJ4ENaZ/CV0zQ/j8sa2syi6X5wi9xo7wuUStpaji
	yOE7t+0deiu2rzXBZUjG5DGijV4pISFfajvw40Wdf35iqO505eLZ5CWmB3zsqeg=
X-Gm-Gg: ASbGncsQzGrphQRsVLVAYo3gvEmDc0/v/Uxsgab5mNrDOJNSxOjq1oPj5viMqw7Snqc
	2Ubkmh+qjoJkjoh3tNDV7JA625t8ZapEi4R+joxBotTdUmJFKBc+/j7HVh2BzGzIjWd+TL5qsG7
	YaQxgEDdIoHIxxTrBlzxOWbFd/rolnRMqpbqihvFPBnb//8LMdfEWjhbEXcBhiZ6WORKg3GH0el
	4HAUj09KTv79uf1z46QSdt1w1pNX6ZWLkRRbR2RDweugnlKacMtt3D8SlNCtld1R83FemZ/KhE6
	hkDq9UKTB+AsHMy056/lhIeCvqlZyAQeHQ==
X-Google-Smtp-Source: AGHT+IFLUZkJqTzzZT+I/M3yqbHhvCV9FHZfFsSF+/uPg4tVfA/GlpswgR4SI57hCH58PcrddckVtQ==
X-Received: by 2002:a17:902:db07:b0:216:73f0:ef63 with SMTP id d9443c01a7336-2219fff4377mr5157465ad.49.1740080152564;
        Thu, 20 Feb 2025 11:35:52 -0800 (PST)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c9bbsm123012805ad.127.2025.02.20.11.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 11:35:52 -0800 (PST)
Date: Thu, 20 Feb 2025 11:35:49 -0800
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
Subject: Re: [PATCH v2 19/23] iommu/riscv: Update to use
 iommu_alloc_pages_node_lg2()
Message-ID: <Z7eEFagK3xugrkKH@tjeznach.ba.rivosinc.com>
References: <0-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
 <19-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_113553_888309_FE803996 
X-CRM114-Status: GOOD (  20.26  )
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

On Fri, Feb 14, 2025 at 01:07:52PM -0400, Jason Gunthorpe wrote:
> One part of RISCV already has a computed size, however the queue
> allocation must be aligned to 4k. The other objects are 4k by spec.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/riscv/iommu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 2750f2e6e01a2b..8835c82f118db4 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -65,13 +65,14 @@ static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p
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
> +	addr = iommu_alloc_pages_node_sz(dev_to_node(iommu->dev),
> +					 GFP_KERNEL_ACCOUNT, size);
>  	if (unlikely(!addr))
>  		return NULL;
>  
> @@ -161,9 +162,9 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
>  	} else {
>  		do {
>  			const size_t queue_size = entry_size << (logsz + 1);
> -			const int order = get_order(queue_size);
>  
> -			queue->base = riscv_iommu_get_pages(iommu, order);
> +			queue->base = riscv_iommu_get_pages(
> +				iommu, max(queue_size, SZ_4K));
>  			queue->phys = __pa(queue->base);
>  		} while (!queue->base && logsz-- > 0);
>  	}
> @@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
>  				break;
>  			}
>  
> -			ptr = riscv_iommu_get_pages(iommu, 0);
> +			ptr = riscv_iommu_get_pages(iommu, SZ_4K);
>  			if (!ptr)
>  				return NULL;
>  
> @@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
>  	}
>  
>  	if (!iommu->ddt_root) {
> -		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
> +		iommu->ddt_root = riscv_iommu_get_pages(iommu, SZ_4K);
>  		iommu->ddt_phys = __pa(iommu->ddt_root);
>  	}
>  
> -- 
> 2.43.0
> 

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>


Thanks,
- Tomasz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
