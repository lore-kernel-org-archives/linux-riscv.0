Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BD2C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI9P5la9ZOhqx5suDqcj5VT6tlZry/6wuT14VvAdMKM=; b=zZEKUUMRCmE0+B
	IPVbmsCCBe0Dsv2mu4UAmszNX9cgCvtIZDVmADXX8VHwhEjYjdN7hoWWxEtyp4GDo4j+moTPHg7yp
	fmz1kb+P7nRLWok9ZEzlyVGVvCwgplHUSt0NJN70bAcwGptVd1n/aI4Ff5ZJFGY3RoaB0tr1fdjdd
	OpQT9qoFqDWFCAOxYHbw9TPlGMLcVQJSQ1MXxSoR6SJlc8vW9ExrYwNdZ2BB2N2Ta6OzCco6rGB6y
	K2cZSVE4A0Ny4mMLWQVwoQ3GIAu3jd/RwcLN/RokNx0V7qlLeUbhcMm67shjCWJCDff4kNrYyJZ1o
	hOa8dqBVz/mZOCVABjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qz0RJ-00C6CI-1B;
	Fri, 03 Nov 2023 20:06:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qz0RF-00C6BA-2n
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 20:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699041999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1OzQ+mysgekhlmn5TVv8N1n5lIKYQ3IFVh9mWG/eO8g=;
	b=SzQg8x4YDMJIpkOUE+nREIXtb6UXoYttsIk+6AMjhgPldLFP2FBUX0uhps5GyKYtcuOT3p
	YX2vfOZ2NleRpSvjzoGBANgbbUveMS+9kP4hIpvfOPXVkg6KvTc3EtVUIz/ryfzpjdKjJo
	GuAoBRnHrezUuNRJzQlLFNTnNTyaT88=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-7nfEVAVlPYyi0w-qj6gzQw-1; Fri, 03 Nov 2023 16:04:53 -0400
X-MC-Unique: 7nfEVAVlPYyi0w-qj6gzQw-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6d31334793bso3008954a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Nov 2023 13:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699041890; x=1699646690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OzQ+mysgekhlmn5TVv8N1n5lIKYQ3IFVh9mWG/eO8g=;
        b=dqM8DtbbDoUl752MlpnV+Vu7wOKkWVOHzhrI1VaVnax4Pk5xyzzGFpq/PWcGKCgjcE
         IWnv0DGbvBnP29zcNlxM0vfnVT6fxu8yMRS3WYUWGaTAmJes0ptHyg9wB9yhtTyNg8Vp
         UcxJogSRLOxYvqwsE4qPU+qeL8KZUpi6S4uVQqbV+2QLIJ5sa7kH2CPpw8oOYXbWtXuR
         Ek1PsllB31alXxCSjqcgJjmjKPcvCTf2Pjn5xklpUAeL/IkZKvmlDspyj6wjZQCtj4a4
         xmmDmCEjqFsk4nAl2qb8smCsqHvvfTK+GtD02fHbXwqTBWK+2zO+pv5mNvl1TEaazAnX
         vAFg==
X-Gm-Message-State: AOJu0YzeKV96pUYPEaYb3UAaBHm92oPph41OGXNsx8/1M6dbNQuutXxP
	ngxcv++oJ/1aKmhzkHevrYmMS1jxIj6z3oRrTZqly8EghAGmx6A2S6PCJFkX07FzXN+ODP7z3cy
	wjQ2G4PKWBVv0Q/bnMgrH9kKRPhpa
X-Received: by 2002:a05:6870:1183:b0:1e9:f220:ac3b with SMTP id 3-20020a056870118300b001e9f220ac3bmr22237309oau.32.1699041889959;
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLi5AqLxsbuEYljInRn+NA31jis0Cd1kvF705FHYMuK6MitH6grMLWp9GtAPMIyyR4rFG8jA==
X-Received: by 2002:a05:6870:1183:b0:1e9:f220:ac3b with SMTP id 3-20020a056870118300b001e9f220ac3bmr22237291oau.32.1699041889682;
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id q14-20020a632a0e000000b005bd3f34b10dsm1704766pgq.24.2023.11.03.13.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
Date: Fri, 3 Nov 2023 13:04:47 -0700
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
Subject: Re: [PATCH RFC 01/17] iommu: Remove struct iommu_ops *iommu from
 arch_setup_dma_ops()
Message-ID: <zrelyki44xy2jfqse2op5jjddnejbg4zpysvdkfx6ty2ylcjzw@ynuastkbx4kp>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_130641_973874_5E28BE42 
X-CRM114-Status: UNSURE (   6.20  )
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
