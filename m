Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFBCC07533
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQcyhUpvZwPJm/+EadJYfbl4aixd8tEXum0xLgl4JFc=; b=eolz2eg4gdVJxp
	kiz5jx+7DT0YB7LNW5k2WWaFwnbVjv/3gYf6jXAA0j4P0ZKbrJZfZSobCLcHQE53RSRQV5IcApv71
	wextL8wb4quJOQwjp7KLo7cEBeTKYtBSnEUXLR0fkFovdMX0KQWJk6DPmXlaDOp3BzRximLOKM/Dd
	/5JJIKSW7hD+QAOHqySKXffVGZrZ2cemNibb2cwhwZ/sBorZn1NRBJDhGtDHQ7FajZ1ihoSosKKKi
	gealtDIMEEZFkMuPOHgkRaExmQ8xxLutVZ3yv3aRxJFlMc27Qw/rv8/voE5FIGj7KUWcDarkGMj8z
	1Dml2DReOXydwHZuD+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HWR-0018TR-2G;
	Wed, 15 Nov 2023 15:09:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HWO-0018S1-2T
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 15:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700060979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=RCBhfDDfYO/TKKaWW8Im6C39h4d4WZGaGXY/9CMEvFdaLn60W9dhTRUrUC/1lsvkCqW8Oq
	b6wgl/tZpSSrT3Z8/KwxdvVoiPpKElzPu/eQOy9SL+EW4DgGIB/Bjd/tYqDRuXGkOkxeBx
	Miuhkufw/+7QKliScp+LSHlhS79mxuc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-8HbpV1iNPP-86FEn0sTl1w-1; Wed, 15 Nov 2023 10:09:38 -0500
X-MC-Unique: 8HbpV1iNPP-86FEn0sTl1w-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41e1d05a5d7so68359071cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 07:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060978; x=1700665778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=MceK7jn6M66HaTmokYVs7cx0RSXVTjCNHBEmL3JeM0vBWXR0WsBUWGWb8lyNEvPmTx
         /1dYbD+qNCb9GJCa1uZIN+E7XmeaIjnDJzOqSY24bKdqcUN+jPKqpXX49ljk3h68VFfW
         Wp9wSjdAi+0UK1isCjCfYz2Oi5LEUha5amUz+k4SPFwuK9e0/JOj8zQprc6wwlyGb6Pr
         G2KY66cGA4hGD2t0qyGtY2P3ClVUCPxAttb62HNR2KDO8pOdEEJIOV9HivA3fFWYRD7z
         BRmKp1rAlaD3VAh3XJiRYQErwI5hz+gVjgFsLiUqxGVRmDIJhVRU1MtvrR1gw1jlT2/G
         K6+w==
X-Gm-Message-State: AOJu0Yye6exh57Fkl/6+cm6Cm6Pnjj884JHlw3RiHBiPUCxmjRlAlMgB
	Q40+QC+r9pqN4h7Ru7bM8nL/jKmV+Hi4VLRswLaYn8zY5RnqsW+s42hLNEXmeOMpiXbUJSQ8Qwh
	t7lQi08uJgTVhH7WUo/IQ/VYWaJl4
X-Received: by 2002:ac8:570f:0:b0:418:a58:1cd2 with SMTP id 15-20020ac8570f000000b004180a581cd2mr6938241qtw.51.1700060978270;
        Wed, 15 Nov 2023 07:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJQ4sai83VgKMNcVk7LBkPO+lmGyR543b/SO2885Ys+XYhGZt/IKDco0l9338e20RsJ7UBFA==
X-Received: by 2002:ac8:570f:0:b0:418:a58:1cd2 with SMTP id 15-20020ac8570f000000b004180a581cd2mr6938210qtw.51.1700060977944;
        Wed, 15 Nov 2023 07:09:37 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id b3-20020ac85403000000b0041ea59e639bsm3597148qtq.70.2023.11.15.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 07:09:37 -0800 (PST)
Date: Wed, 15 Nov 2023 08:09:36 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, patches@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Sven Peter <sven@svenpeter.dev>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux.dev, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Christoph Hellwig <hch@lst.de>, Moritz Fischer <mdf@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 12/17] iommu: Make iommu_ops_from_fwnode() static
Message-ID: <fc3a6krgqyi7awvm6dcjg5edbem5lead66b4tyi5ttetkcfdpp@iaya3ijkywwv>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
 <12-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <12-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_070940_875958_0CA64049 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
