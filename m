Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A1AC5ACB2
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 14:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQcyhUpvZwPJm/+EadJYfbl4aixd8tEXum0xLgl4JFc=; b=VO9D2lb05vOcZV
	5gboypluTCEDzhYshIIxmOqkrmtt4pzCUGKefH3AclsuaAYNEm6GUOZK9QNkT12uHQliyftQR6uvX
	4dDuEwWz21aZcOhq5rh/4+dGpA6Tj7B3fUYqoLugUnuOjlNukzyLBPAjIK2jXaMkw83bhcPUPR45w
	VwtCh//cxsysnUQSSFyKZ8RMFwzclKtghZc6JKV8ceoKBanpTGiUrvWsj54eahkfR7tUGXiLiRx30
	7ocF2nyTICdKsvQjlS9wb1mkiBzpyVdsg31soFE4ny0Eld63+h1EsVC9c6jYyq7e6PyPbc63xqMDL
	pJ2dwk4hBTgBh9+3jLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3H6i-0013h4-0p;
	Wed, 15 Nov 2023 14:43:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3H6f-0013ef-12
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 14:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700059382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=SxmaRbj2UI7wyR4yRDkXPPbSFume3DPXj7iBSaRrChzCcyMUxrRk56D6qBBcBjNti+o+sk
	z2EVJ0JhvAceSnAswTu72CVeIrcvh1n+Mzy/OTx27APEsFNjbMjeEedABWSTXKs3CAn9VC
	3pSVHSmoo2m9KIJ5q611LilLLaf1XKQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-WlqAM-5-Pt68N4cjgqy2vA-1; Wed, 15 Nov 2023 09:43:01 -0500
X-MC-Unique: WlqAM-5-Pt68N4cjgqy2vA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67012b06439so81296026d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 06:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700059381; x=1700664181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=p2vCxcovTZQHjjcTiYF1J3kMLZJdEHyNO9tDm7Q755NwlVjp2PstU/AvdDQQitgO08
         H+P17B7zP13h6+vzmT/Ar6N922geIh6aNmNJhSDEBzsaf8u4fBHyKkKoYgxmDr+v6bBu
         jIbCJWRBMyg7WYS2e3HsgzBnQBLhRbRg8mNuJdfjCyiU1isI1ef+mQUyTolvxi2n6LEj
         c67yfFzoJGJk5dVPznCfGJzvfjpRzl5LSUkiraDjCtTZBuu+dKp9/4d8hEYGOtxO3fmA
         3mYiuNR0ShMZ34b8/hvF5p60hTCtBZPR8qILqCF+2K9VcuvK0yhX4mVPkmbJT99Xes7n
         d5iQ==
X-Gm-Message-State: AOJu0YwBLdCF455jEsEBgA2rpZRSpmtAUJn8FktS1iazMH/4H9x8TwBt
	nHO38AKvQJQ5agVMwy9+EWcLBF+UxlAnqNJ3l2fh+QeKTolmlr/llrt75CX/RKaalA62u5QbBi8
	gNk7lGQFZCRraB0lfrXYQyZV7XTiw
X-Received: by 2002:a0c:c3cf:0:b0:66d:1100:7b81 with SMTP id p15-20020a0cc3cf000000b0066d11007b81mr5491054qvi.18.1700059380995;
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0jpQrK9oJO86ojMSo1dc0KOCSp7+RBS164Fh6GwHlgBAjmWNWgSHBdIgtMHXFSNVSzkNNdA==
X-Received: by 2002:a0c:c3cf:0:b0:66d:1100:7b81 with SMTP id p15-20020a0cc3cf000000b0066d11007b81mr5491005qvi.18.1700059380669;
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm578681qvv.88.2023.11.15.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
Date: Wed, 15 Nov 2023 07:42:58 -0700
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
Subject: Re: [PATCH v2 03/17] iommu/of: Use -ENODEV consistently in
 of_iommu_configure()
Message-ID: <jtgj4qfpqzj5zowqwmcniaxd77kqvirspm2a7jkgg6vgmo2scy@5jpoatxkrkid>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
 <3-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <3-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_064305_449440_08883D6B 
X-CRM114-Status: UNSURE (   7.57  )
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
