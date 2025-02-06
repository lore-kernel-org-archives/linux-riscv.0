Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CB7C02199
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 17:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwjDtb7p0trwz/3aDYa0qVQZ7OvyoTcQd1rF/yBUHV8=; b=yjlGfRa+PeEO+9
	TQn0vosRA2oXLsazes44Tvhi8O+avN7SzjIUYGBLby6tmOmRKAhFfcQE89NvXekfceqqP1T+VEPG0
	9F7p9UuzTnyE/2Ad+wDt2/NTTVwAZ9zGGniAniYFufRAjADsaPGy2nHyw5bdTx22QMldT+FmlAdTd
	37kZyvY87A8GURDLmnBG3jh+duH2tVtTUnPPkmHhqhwBn0I7tTbpBZ7XAXSOuUuOwkCiMc4EyAm/s
	fBZujB4sEVUA2F7gulvhjhFltgJl/AUUT4zgE8J0ecopg07oLzPgdqqN7g4LobMSJn8DI8mlLuJ3E
	y6cGnxUdekbwRj9kuVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg66U-000000073h7-3s7Q;
	Thu, 06 Feb 2025 17:55:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg655-000000073O7-4ALB
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 17:54:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f200014f1so18119975ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 09:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738864467; x=1739469267; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Mn+sK8nChOIpeYLnv6IHwIsGNBT4gzyG/mIRD8yp0k=;
        b=fdIP9j/U6JiM1FaxmDWsn4cKPxef2k+nmAnWy/M4LPDZcqxw0QMQAgw2hrPAfVN4b8
         FCNKhg9JzASYazczM3NiqwM9MOPwXGnM7gWgAg42lFLuesaVO3julEznfR2wHpCynSD8
         gVyidPEiIAsQ75BY70e40L9kzmxduvWUXx5WTv1tAU/cpeSx8Nv/TfnWl1vNeHSansFs
         /Ag3dSC7wsvXA+6dkbOSIQ7S1+RAM8TD526ReWSJxLGuXcClHa6GGYuBbpeYF1SLJ5uV
         0YQX59RMSpDc4O7ftrUL+Nl+Uuwi+2koWOnX1zlJS/f6vV8UzJDYyp7DtjzIqEC/iqcE
         jYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864467; x=1739469267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Mn+sK8nChOIpeYLnv6IHwIsGNBT4gzyG/mIRD8yp0k=;
        b=nIcpr1VvSv+vNNhj8o0NP01fw3kA65G7Q1yWn2Ei+dpjZXq19jIGY3KJJK03fkhqnC
         KLGly5CRYaTwatXYMVU1JoVjenrikteeaCLMOfQXjElOR6UVlAvnpitCKjpt6WVWIae/
         zXKnAL+33K+bCIgI9U1epXG59CKcLnzffowWZzXQtn7Cqx8HzWNm1066LxkKLPdBOQFm
         Mjw/Ly27tF8zCWEebKmOXgkby3lU+xwuVi6vaJJF2SHn5UtLg9NSl4e5InI7xFxH610L
         u1NtOs3luRGPMr9XfFCKasor4Pm/EhprsvpHSNGPTdKZ8WOep8ogfF6qz0F6Kq1W1I91
         CSZw==
X-Forwarded-Encrypted: i=1; AJvYcCWRSXRRUv1haH3enwUIsxd2Nu/vsy5EjcMqr1EhAukBZstkpQPSOAgifAYQYv1Y9Uba6fcrR7v3j/j8ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuvedD1P9ZL7RHoYoKGWzIfO2xo6Z+9CRsJriRXIpGfFn9cfo+
	aIKRBlkJOlQSRH6pnfF+KmtBmkceQIlF80DjAVRElrR7+ETMaAbbYKJik9HMDgk=
X-Gm-Gg: ASbGncvQ8Y+qe2xNh1m0EggHsqOnUs2JPm6s+3mSHJbz3BQxFvgteYn8h+O5Zph5z/p
	Xo0njY8vXYXvnf3d7vQ08HU5p70zWLY9IggkdrBriibt5xrvhaEnj3raNcqfr32HjeSNl8B+R65
	moWVMejpg8Mp4HBFUlMAGkPtVkqUtyqbIWUohxoSySN/YxxfzPV5eTl4fb8CaEJFvgD8fH6QBZ4
	zd7XO1UllKSx5pSy14gadyqvHcPlLoFjcbfv020yUxsO8w7Pl2Uj+InGDHurcKZNkzFa2xevzdt
	E3J3ts9o5aY/02iAHMzrKhcdeojdcBuZrg==
X-Google-Smtp-Source: AGHT+IEz4awpqkJi/c9nNKxcLNj0HJ/bkNdjww1eQVi1trMS3Hp0zWEssHNhp45gp9A4Jt7vw68l1Q==
X-Received: by 2002:a05:6a00:882:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-7305d498d3amr215704b3a.14.1738864467255;
        Thu, 06 Feb 2025 09:54:27 -0800 (PST)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048adb10csm1636427b3a.66.2025.02.06.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:54:26 -0800 (PST)
Date: Thu, 6 Feb 2025 09:54:24 -0800
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
Message-ID: <Z6T3UCK1FI44pg7z@tjeznach.ba.rivosinc.com>
References: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <17-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <Z6RI3ftJTrm3UxoO@tjeznach.ba.rivosinc.com>
 <20250206131721.GF2960738@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250206131721.GF2960738@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_095428_301101_D872185E 
X-CRM114-Status: GOOD (  16.48  )
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

On Thu, Feb 06, 2025 at 09:17:21AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 05, 2025 at 09:30:05PM -0800, Tomasz Jeznach wrote:
> > > @@ -161,9 +163,8 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
> > >  	} else {
> > >  		do {
> > >  			const size_t queue_size = entry_size << (logsz + 1);
> > > -			const int order = get_order(queue_size);
> > >  
> > > -			queue->base = riscv_iommu_get_pages(iommu, order);
> > > +			queue->base = riscv_iommu_get_pages(iommu, queue_size);
> > >  			queue->phys = __pa(queue->base);
> > 
> > All allocations must be 4k aligned, including sub-page allocs.
> 
> Oh weird, so it requires 4k alignment but the HW can refuse to support
> a 4k queue length?
> 

Spec allows that. Also, hardware accepts only physical page number (so far PAGE_SIZE == 4K
for riscv) of the base address, ignoring page offset.

> I changed it to this:
> 
> +                       queue->base = riscv_iommu_get_pages(
> +                               iommu, max(queue_size, SZ_4K));
> 

LGTM

> > >  		} while (!queue->base && logsz-- > 0);
> > >  	}
> > > @@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
> > >  				break;
> > >  			}
> > >  
> > > -			ptr = riscv_iommu_get_pages(iommu, 0);
> > > +			ptr = riscv_iommu_get_pages(iommu, PAGE_SIZE);
> > >  			if (!ptr)
> > >  				return NULL;
> > >  
> > > @@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
> > >  	}
> > >  
> > >  	if (!iommu->ddt_root) {
> > > -		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
> > > +		iommu->ddt_root = riscv_iommu_get_pages(iommu, PAGE_SIZE);
> > >  		iommu->ddt_phys = __pa(iommu->ddt_root);
> > >  	}
> 
> Should these be SZ_4K as well or PAGE_SIZE?
> 

SZ_4K. For now iommu/risc-v hardware always assumes PAGE_SIZE == 4K.

> Thanks,
> Jason

Thanks,
- Tomasz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
