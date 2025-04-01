Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A962C36014
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 10:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b09DbA5vsCVXetZiQRFlKXZtDk4Eo2bEPRLUTgW+L8o=; b=SmFLRoBvQ3FFNO
	L/A7Xf2YeAYbt5u0DByfG/1i8/80b1w0I7ja1H2IrXFAMdl0AyOv6/tVibkiYLXvIu/8MYnF9TiCQ
	9Br0ezKcj+zsPaOANtiWRGp85lTf2W1l9o7R7iNckmfpZ2FBx1A1uLpkp3bKohCg/MGhd+A34buoT
	iSo1b5JZh7nM1mpiJRUeX2bt94s6AKW0qpf0cz/i/jAWDGGaMDpZAox9iOmwlMnR5o9JKVozhvYTp
	+qcSW+1hlsMgFYFFmX37sUuwY9NFFFIrbD+D5IQdLiUnwhXSJj4bZpH/iP8fs9gYPDEZ6KhNdCo9H
	kTWc+4ihEHBb2l0SSCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZDn-00000002gJx-1KIL;
	Tue, 01 Apr 2025 10:51:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYxn-00000002dvs-3jdv
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 10:35:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d0618746bso37169225e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743503722; x=1744108522; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=094SZ9fz+o6eVY5ZaePMpljZ6ZXESAEN9w/PXff7gsU=;
        b=t9vTbTmPHG1yPaCbTrsuzSuVYTBLIyMFcJlKvkPlwsMkWItohkpEfNgX+vU7KsPGka
         7WXOJvgq3chfLWZwQGmnvaq5CDguuGSDWVpDk6Am7fjSSZ4GU5LRMvVJGErLAnAG1twU
         Po3tXeFrfIEgMMRcG5HjArY66zkqqk7Q1MDz5KhJAmw52/LMTnLemiiNQDu/YI1of8kC
         8zdLgZ23WMnFuK4OKRm+zdeLN2fKmU1T9211wROqi27aJxvZsc8sMHHySFbT9hCinogT
         gbqewVaiOeegIIxfm2q0R4q25YxCTRjMAqvzANRdN9iWXrJLRilQkeEM/c+1UcflSPN3
         rj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503722; x=1744108522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=094SZ9fz+o6eVY5ZaePMpljZ6ZXESAEN9w/PXff7gsU=;
        b=XyNVUc9yeg4BafEzUpeAydY15dXojFihgEQZvQKeLle7Osin17dekMQG1vzhzZy18c
         bVUSFNJyF29R+MEeO/DcrJnNzljKVe+MBzrMjSGwBJ1CI0CVRe1Ios+rAC5J83caiU4Q
         gEzVSV6RenH6uWcmQltR4CL+9l2frhd3ldeNAAhok38E+iF5VtIc4cnwL+p4OhgpMk5b
         VZal7kHykw6dygOjXRTGwpq/rvrlUP30qe11IX9c3huNcNFY+UdmZb6LL5aIWWtB3EA+
         JrBdEoVBZrJdvf5/3D41z4LNY0x2lpfN8vSI19dqZZYPvyVmJ9dq3HqPN9p1aonZURyM
         xBFA==
X-Forwarded-Encrypted: i=1; AJvYcCV44DXmghH0qou5mFwO2P8VHj2fLxPeB5bCdbmScgee6806pVjosfnAMq2bJ3PdChmoiI+mbE0p+GY8PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDfa+ZlFhfvXPgpAS1mS0iNbcalyPWGtvWUKWp95MqOsXY2NXU
	y0ppsH7QCbLGkfacYE2GRi6FvRm4m2pBj69OHozCPdQXuD62a5LUHtSQO4mE93s=
X-Gm-Gg: ASbGncv20ELDGXJQ5EfZ6rtRrWfKv+hdiQOADjcAXY030a86BBN5kY6dV0ei1Niqx2s
	ykMqqjNRAdcynQWZT9oax8IW95V8+U5aD2DIIn98/NsC+XHDXi6AfUPbvd9ENoDdJ5YMoERGusN
	53zhWfS+0Qz3hPN1RZvHi7h4K3A/sM2hxeyXaNGp8nPQjWau6n9h7aN5xnlhXgQahrcS59zV0JK
	Pvt/ByGz34kI0twX893gwU9bjkgL3fE/RiellBmskWLnHBwVYuO9yCnude9ATfD7hbYihSJyC2u
	YwzoDEI9Vg3m3Dd+3JbD06ArJeHsa3OLIiS0wsvaElU=
X-Google-Smtp-Source: AGHT+IH0MYFlI+kNZ16n6YuowDwZDpAgl0lcpbfUtl1S5hYwQqcUs9sspCA+WvoevEZPVnDHgpx5gw==
X-Received: by 2002:a05:600c:4e87:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43db61d5fd2mr102696825e9.5.1743503721639;
        Tue, 01 Apr 2025 03:35:21 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658c87sm13912049f8f.9.2025.04.01.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:35:21 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:35:19 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: iommu@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org, pierrick.bouvier@linaro.org
Subject: Re: RFC iommutests_: Testing software for everything IOMMU
Message-ID: <20250401103519.GC2424925@myrica>
References: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_033523_938428_D7378C3D 
X-CRM114-Status: GOOD (  12.40  )
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

On Fri, Mar 28, 2025 at 10:11:13AM +0100, Joel Granados wrote:
> Custom qemu device: pci-ats-testdev
> -------------------------------------
> To support IOMMU testing under qemu, the pci-ats-testdev [10]
> (different from pci-testdev [11]) was used to emulate DMA transactions.
> It is a full fledged pci device capable of executing emulated DMA
> accesses. It was originally intended to test Linux kernel interactions
> with devices that had a working Address Translation Cache (ATC) but can
> become a platform capable of testing anything PCI/IOMMU related if
> needed.

Yes please!  Maybe "pcie-testdev" rather than "pci-ats-testdev"?  There
are other PCIe features that are poorly tested at the moment, for example
PASID and PRI. The programming model of devices that actually implement
those can get too complex so we need something simpler to precisely stress
the IOMMU driver infrastructure. Driver unit-tests alone aren't good
enough for exercising TLB invalidation (DMA after removing a mapping must
crash), tricky cleanup paths (eg. killing a process bound to a device
that's issuing page requests), runtime PM, MSIs etc. I'm guessing testing
newer/future features like TDISP would also benefit from a simple device.

Some time back I needed a device like that to reproduce some tricky races
but never got round to implementing extra PCIe features. Although this one
[1] is based on virtio any programming interface should work as long as it
can instruct the device to send precise DMA transactions, ideally many in
parallel.

Thanks,
Jean

[1] https://jpbrucker.net/git/linux/log/?h=virtio-dmatest/latest
    https://jpbrucker.net/git/qemu/log/?h=virtio-dmatest/latest

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
