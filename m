Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0237CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 20:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQcyhUpvZwPJm/+EadJYfbl4aixd8tEXum0xLgl4JFc=; b=bdxir01tyim3gy
	L0R+LucC17zLzhWqJNY+d9Otv/N0UkStHrL0RAjxtIlBggZDczHs5+HCn96KkR2Kqbg20PTPKv02b
	sb8QC6JFg9g5nMmLgqitZJlQsVJ9u6nfbUBOTR4bk0rl5DxRy7MSV46EcnJ7NZnynsYbNTL8lt/0E
	CnsIshFvNEmW50fPZRPibe4itJOtXqaS8uAHHU7dLtqGRopMioOXz9tDDee3cdmKBW/517Jmy/yEp
	S7lLhC2mwi+x20C8rpoWEAVlRFmuIXPfJxOFsBVIcq1fH5giAgKuo+ZkFU4xBpwFuyg3qEQ92UvYr
	+wqDMKb1qblDxRJLxhvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dGl-00Ed5O-28;
	Mon, 13 Nov 2023 20:10:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dGi-00Ed4J-1n
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 20:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=QkFuWos4vfqSVbsvh7QXl3XJOrAGYJSPnYDADtfbc8++qTReh8+Cy97GqqC0DtipgMXCg0
	JjJGp3JKhqZTYh7Murx8cPeU8g15IeViWjFOufEFMGlR/uge1TBg8Ho3JfVgfPbEwDwceL
	eS+pdVvMhOmQefXQa3jc4AMiw4HnVGY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-hmofBB_BOAysj_m_UWYmvQ-1; Mon, 13 Nov 2023 15:10:46 -0500
X-MC-Unique: hmofBB_BOAysj_m_UWYmvQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7789a691086so580920885a.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 12:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906246; x=1700511046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=nD+b1DV3WHcZSVpS83A9TnPKUtpQjDAhVflj9l44Uw+woPQtz/g5KbzowLezelKRaI
         2wst8hwt79PmBFOSsmFc3MUrAD1Z3V+hBHzqnDKjz5MBU6fF3OZGtjIvqCZTmU7DNqUi
         HsHKWgH3mDWxFHUdPageOSJnWS6CMxyubeEwGmXEndhEvfoRJeC+uxwOa4WN2l5RVnkm
         e+q+nRasjDrecVxhPOa4RABY2pXpaD51DZjgpF+bWXlLANQ3+EFT+v38Ri/rjS5f2k/C
         wmzNH+AUtdmALNDpuJKnLOwqIl/B3/uVenFmhzOc3p2kHpcndBnX25jsHL+gh6zWblaA
         LMhw==
X-Gm-Message-State: AOJu0YxLd9qs/UUbhTEliNQpRGZQZED1/qrHra375GfczSOptVsgiA4t
	S6vxJIS2GM1Q/3xVek6SQo+REPffS+A8vWARkcIgf0Fhena83h7UaRJYqxJih1btsryGPOJ/NKr
	WbML7Vzq04SFBBRbKp5IZlNivx0xa
X-Received: by 2002:a05:620a:3710:b0:776:fb0c:6b5c with SMTP id de16-20020a05620a371000b00776fb0c6b5cmr322023qkb.13.1699906245971;
        Mon, 13 Nov 2023 12:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTedyYglCJvmi92iRdR2D4BIAbVzeajOKcDR1OXvlL6dJaLGV+tVe1Q6WIBYPyxZBc3gPFSw==
X-Received: by 2002:a05:620a:3710:b0:776:fb0c:6b5c with SMTP id de16-20020a05620a371000b00776fb0c6b5cmr321979qkb.13.1699906245767;
        Mon, 13 Nov 2023 12:10:45 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id o6-20020a05620a130600b007742bc74184sm2112406qkj.110.2023.11.13.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:10:45 -0800 (PST)
Date: Mon, 13 Nov 2023 13:10:44 -0700
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
Subject: Re: [PATCH RFC 05/17] iommu: Make iommu_fwspec->ids a distinct
 allocation
Message-ID: <bhbvxv5bt7b5tad27cuvy6efpkg2fwxx2delgcmnsd7sttqngl@irtpllmr7wq4>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <5-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <5-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_121048_697492_27FA7166 
X-CRM114-Status: UNSURE (   6.68  )
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
