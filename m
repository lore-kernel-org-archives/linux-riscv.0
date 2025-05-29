Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE23C5AD49
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 20:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlzXtOGLFycb/nGMxU5rBHooFy2ZjCghW0olbOESlbI=; b=1a9AZ7RFdphufB
	9g5Zgkxzhb7uPjLTcNwh/Jw2mmgFpLiMWa1/HYAwAoFxmxvUNvEHGJAc0cGDCN0sxEPyemQ3l0tvW
	630gtZuoNyvkZOyjmp7r5rV3LO0E25eTaKm7WA4Q9kqcH2FD9PNvLQ8t7PCa1jtQ0pxJbz0CXBaQd
	9KvdRnMLXhcTiY+GbjnYHX8FefWX1dJhnexqVn42ah199BRNMSWxTqFBn9F6Ad1oOik0jiBSbd/QR
	791IL3kX2lz0wUhXQTgTa4ICa/nBjikIeaf02XrMmZNn7fM+h2XY38DjdlCZPpNt8LDcm5+NW2DSt
	DG21OFtdkE9RIuwaBdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKkB3-0000000GWKi-1VxJ;
	Thu, 29 May 2025 20:48:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKk8s-0000000GW2M-2wQH
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 20:46:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3123eda2a1dso247778a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748551581; x=1749156381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=dFjq2NiEPa1X5/bqSSOd6mWIbuLalfC2PpJYw2cED5pRguLkl7EjaX1LRnWE6aaNP/
         AYo4CiK28/U5j1cP4al3TDlx+dm1KJCJ0+UyW3BLO+py1ergg28tAKE984fKpbzmeJyd
         nTleKsnvpeHtHdWgPHUgE0sf6+hw9Y0f3TTWuK841ExFeX5FY5z46k3qSX197gSrGkJO
         +dHYtz/Gn/pU7Wyf56zsh9mp4FKEGrMR6N4KenHSQ3JyotkUrVmI5HhbFSBCWiroj8Lj
         4XRXiCjlZcflwv3Tk+OTZ8OTTZ27NKkAR1qJpRr4KL31uJ7QtUZbnkzXtcQKd6M+BNaL
         bHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551581; x=1749156381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=qn0WNWm7MqlgOvHe2wsfhUg1WoOBlVLHz7rFqK20bgLOkovdpOOLP21Vo8c2NIWCPC
         WkJckKIAmtK0hf1ta/SPE+QSQsCUZwoLmpLv1Aicayw6ciNJlNTGkSh/3SM5hwhddGKN
         AJNi8s0OIZMmTP6n7hrXdKzPC12lhntVLJYRd45EGCA8Wr2+cfuCIGLc46BNOz+J1uMQ
         9JdHvbuKnvfYDF1jXnuVzLpreExiZre69yBiPRhqp8DncpiCsr/+XRWPcc1bH6sHMD9Y
         kNXTmhU0TkWFr4K5ot7Y6XQkDLhOR2NETK8EPEYpCDXTFWIHZXODQfYlz+tHiqBmgWpu
         /h8g==
X-Forwarded-Encrypted: i=1; AJvYcCUeTV26WVtAdSvdHfFOOVfVPsJ1VubJK6Ku/p99RF6zs9vVaCexRD47saM6J0ZajF9xJ49q6vIcQQ0SPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiLNNMEvNjgrGa6V1cJeMtZZ9GoqDy4+SRXW2+npb4l9IYxd/M
	C56ICYDaQChjqzNatuVTpSmFm25wz75AJnfGC5KLp/coFY57jWLq5H/oW4+NipxZahM=
X-Gm-Gg: ASbGncsOhhJuhDFQCnvA70ZtYgzYPtakuRXTPTbr/j/p5mdH/bhf2TsKpJcCez+vY4g
	9qNrtF06CGJQumL+fghQY2MpPqQ9zwZITsW5+7/flxHGsMT/DBH8xI3qY9cvNDOG32Z/6+IrsZE
	a1A6RhXiFqHHCTsEX9yFfemwHMraq8STR2V5kRZ3Ot5WaCwleWzn4w+CSGosA6j2gXj1HdE4lso
	Ejgy1TaM2XUNhQmdwmNDEiezbfkhQAfQdTbtXGYtDbrJ71ndpKuSygoZmYqlf4+8d3uY/mFjjgV
	hqq2fzzwFef3MsqmZ7XSJImkJ+xVOLW9coXFSeRvyIoXQOqmqs4qSno2tHxOJOswtXm8Tg==
X-Google-Smtp-Source: AGHT+IEO8HwssTrnrLL8DGNfi7UDT2JfkJIUURFRStahz0gCmflYidew8g3m8w3QvBPF+GZDsBP2sw==
X-Received: by 2002:a17:90b:1d89:b0:311:f99e:7f51 with SMTP id 98e67ed59e1d1-312415329famr1432137a91.18.1748551581341;
        Thu, 29 May 2025 13:46:21 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9486sm16245345ad.67.2025.05.29.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:46:20 -0700 (PDT)
Date: Thu, 29 May 2025 13:46:17 -0700
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that
 don't use it
Message-ID: <aDjHmR7ZVTbsSITO@tjeznach.ba.rivosinc.com>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_134623_015312_BC65F9AA 
X-CRM114-Status: GOOD (  17.63  )
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

On Tue, Apr 29, 2025 at 11:34:13AM -0300, Jason Gunthorpe wrote:
> These drivers all set the domain->pgsize_bitmap in their
> domain_alloc_paging() functions, so the ops value is never used. Delete
> it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c       | 1 -
>  drivers/iommu/intel/iommu.c      | 1 -
>  drivers/iommu/iommufd/selftest.c | 1 -
>  drivers/iommu/riscv/iommu.c      | 1 -
>  drivers/iommu/virtio-iommu.c     | 6 ++----
>  5 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index bb57092ca90110..2d0d31ba28860a 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1533,7 +1533,6 @@ static void riscv_iommu_release_device(struct device *dev)
>  }
>  
>  static const struct iommu_ops riscv_iommu_ops = {
> -	.pgsize_bitmap = SZ_4K,
>  	.of_xlate = riscv_iommu_of_xlate,
>  	.identity_domain = &riscv_iommu_identity_domain,
>  	.blocked_domain = &riscv_iommu_blocking_domain,

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com> # for RISC-V

Sorry for the delayed response.
- Tomasz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
