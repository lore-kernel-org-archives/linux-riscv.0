Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA8EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 21:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8n9rYHAioZ2M72yZwAxcDK6Bdi1b8xh7YcjDLrDwLoU=; b=2GLtkBPBClkw9v
	ogZGefC2CkJ23B6mpJEcQJYmE30Qcqjl6L+7m2RbTqURPEYqfFkD3bWWMr+VBYxemz4dl2FiPlnEK
	H/MidemDSAqrKOI1+6nTfG1V/kqzm+WWQDTD4ueXEBexxw1EtBS2xY/uov3KTPII9yARdmURxEDPv
	43ctphb4D4cS7gHfiXzpEm38K+K653E3NXFQgoLCQvVvaLilNwPsdJndDtwrSc7NJCemmgMkr/SWI
	m8ZdswkxRtZrUElx7a/xWucJE9LYsWkleqQGEE1e2tupQoQcexf8eKqmUhGIsOOAzGAwAvBRA7oFE
	Kw5cROD3t2sUdTK5SAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qz212-00CCpN-0i;
	Fri, 03 Nov 2023 21:47:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qz20y-00CCnt-12
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 21:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699048059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F+aB8ULpCtjf+Gcfe540UtUd+NJKrSGjq+RpmL2JNA8=;
	b=RgRwyvVZweBgVGAk6L6MhvfxHJGscaB6d5jr81JqVo4s0w9hsRIIEJlnDURFJdyV/1J0iz
	/c/m5cNh+TfxAKUfmrEmNmD4fs0wdbDaZnpOKBltp0OAevh4Ooh51xDB1BjBakijtxwsnp
	7VVb4wGJKRJUy+7aoZL0i1bFIvOldb8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-soiKG5B6P3uxTQG7v8QKkg-1; Fri, 03 Nov 2023 17:47:38 -0400
X-MC-Unique: soiKG5B6P3uxTQG7v8QKkg-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1cc3ad55c75so20177715ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Nov 2023 14:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699048056; x=1699652856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+aB8ULpCtjf+Gcfe540UtUd+NJKrSGjq+RpmL2JNA8=;
        b=lDq5vhIYOaSAKSW/cFO8WLUDnfOvK4flEfoCVeEtbJP/UMrIl18eDl9OoUgeA13/cD
         /Boh7Hcl+4fFM9yFgoKjdOgn0+wN3v85ZCyn/sYK5qpgwR4xmnu84TuoWQat1GAbVkWC
         hAI2jLWSoq7l9XIxqcdpuIRopGhRWJmT/h2fIQU+4+PgH7lA4y1reEsK+Tq9RTu/eHEs
         qOzleJ5XXivlKbbM1/yeyGHsCSdfH1say+8u1d9Pwus+C8S1I7crxEiGwVQHmkyHuU9K
         VMlBCOj+wt26JDqPY5cuB7jQUEQvLTiOvkCYCjy0q7awOE3IqegRXOw1qVe0JYjvdwAl
         cVCA==
X-Gm-Message-State: AOJu0Yw5YHRqkh6HqdVKJFzTR/fZnEnqgX2ULlBfpVxqfqnGSNu+1N+F
	T4jBtcPrSjCKF85//aNyBaZMQGwK6XAn32TNSbWSyzi0AkjdfKF5ucvh02KrokURQzTb1HME5m9
	kEfu6Mzrg3nLWjwpZRhqgOEW49KbXLPZMtQw1cHI=
X-Received: by 2002:a17:902:d28b:b0:1c7:755d:ccc8 with SMTP id t11-20020a170902d28b00b001c7755dccc8mr17083768plc.29.1699048056770;
        Fri, 03 Nov 2023 14:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdAXninLAKiU84+Ewx4UvETdEvykTsgu1OMaAqceXcjYCMbCq9Ef0fn5aeDPHxQVvb9/cevQ==
X-Received: by 2002:a17:902:d28b:b0:1c7:755d:ccc8 with SMTP id t11-20020a170902d28b00b001c7755dccc8mr17083727plc.29.1699048056432;
        Fri, 03 Nov 2023 14:47:36 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b001cc2c7a30f2sm1807591plg.155.2023.11.03.14.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 14:47:35 -0700 (PDT)
Date: Fri, 3 Nov 2023 14:47:35 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux-foundation.org, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 02/17] of: Do not return struct iommu_ops from
 of_iommu_configure()
Message-ID: <2qhocnpfy4lbmfm4erccztrwoec5sjphvktcyvxdb75qbjyozu@aht6gj2zzuhj>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <2-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <ld3rrnpix5x5kirfjlk6oafhoikkge4fgvcljhmiljuqge5266@asdcw5cfp53e>
MIME-Version: 1.0
In-Reply-To: <ld3rrnpix5x5kirfjlk6oafhoikkge4fgvcljhmiljuqge5266@asdcw5cfp53e>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_144740_451736_AA097FF4 
X-CRM114-Status: GOOD (  21.46  )
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

On Fri, Nov 03, 2023 at 02:42:01PM -0700, Jerry Snitselaar wrote:
> On Fri, Nov 03, 2023 at 01:44:47PM -0300, Jason Gunthorpe wrote:
> > Nothing needs this pointer. Return a normal error code with the usual
> > IOMMU semantic that ENODEV means 'there is no IOMMU driver'.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/iommu/of_iommu.c | 29 ++++++++++++++++++-----------
> >  drivers/of/device.c      | 22 +++++++++++++++-------
> >  include/linux/of_iommu.h | 13 ++++++-------
> >  3 files changed, 39 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index 157b286e36bf3a..e2fa29c16dd758 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -107,20 +107,26 @@ static int of_iommu_configure_device(struct device_node *master_np,
> >  		      of_iommu_configure_dev(master_np, dev);
> >  }
> >  
> > -const struct iommu_ops *of_iommu_configure(struct device *dev,
> > -					   struct device_node *master_np,
> > -					   const u32 *id)
> > +/*
> > + * Returns:
> > + *  0 on success, an iommu was configured
> > + *  -ENODEV if the device does not have any IOMMU
> > + *  -EPROBEDEFER if probing should be tried again
> > + *  -errno fatal errors
> 
> It looks to me like it will only return 0, -ENODEV, or -EPROBEDEFER
> with other -errno getting boiled down to -ENODEV.
> 

Ah, I should've looked at the next patch first. So, never mind on this
and the question about the dev_dbg.


Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
