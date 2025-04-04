Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB554C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak4rF8VuHpI+qAAZfE0Xdo9rinRpV+8B00G/D8J/d+k=; b=q83QYeHKQfRQa/
	OyFCJN1ttZS9heQuU+rV6EDRpsyB7q4fcfn/iS+7HZSuisaaRfKFCOIqTve4UmVCQsDAo7PCGv2BZ
	Rw/lw67YSILGcn3qJsGPlaOMIjFDHTSyAcv2pv7WVclipvkZ1pK/c+TgxcRDe7MrBIhcaoSOoBcxc
	O+5Iq0PEMU+zkKEjLvA3TiondeB9puGV0JGmKknrh4qdyV/t+54U9qvgb00GVPrBtbWOUWmJjTcw7
	y9AAecsaQo2Vjux1pVW5XZCccp89XvnX5EDQs+5dP9bNxeLp9n/aqU7255btb+erIlQqC1SSFkzu6
	Py9VriZV9IndPrBUfl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gJ3-0000000BhF8-29pl;
	Fri, 04 Apr 2025 12:37:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gJ1-0000000BhEX-0zAw
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 12:37:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CAC75C581A;
	Fri,  4 Apr 2025 12:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923F1C4CEDD;
	Fri,  4 Apr 2025 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743770274;
	bh=VvmsBy/mapPiKfdXXiu1j2lKuHaHgjbFqLZsrREc/14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1NwqwB24nos3tDQ7j5m3JifuV9ILytu8D46XEYOG4J/KP/L+RAFCTSQm1KXrifu4
	 4LI68DGxAZM5poiLYqZ4XI4D+N02CFHr5Invx5bcubxogk0wyHIE1zzCBS6x0CrAoB
	 IOTz+7LUNZIwfw72m1nhuhPP1UQG3wwDGs8TFceph+mz6/z+gdXH2PGNQRxQVw36ar
	 ScmsFUrhWkoso/zeBROuS18/0UFOzR2WBQvdyYObdon3XukPf/BiZWotYRevkAuph7
	 A8Kz7F/4axvslbMjfBm9ZNOj4XQjFx7C5qLihsd/EQ3/qUpfKnL4B4oWRGtYKGq3VR
	 K04VMlZhpxbZg==
Date: Fri, 4 Apr 2025 14:37:48 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: iommu@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Rob Clark <robdclark@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, virtualization@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-tegra@vger.kernel.org, pierrick.bouvier@linaro.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: RFC iommutests_: Testing software for everything IOMMU
Message-ID: <qk32ie2b663it7tjpdqfjecgrlamtuycyxulb5m2elblymzyqy@jcvjiqwgsmww>
References: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>
 <20250401103519.GC2424925@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250401103519.GC2424925@myrica>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_053755_384180_10CB10FF 
X-CRM114-Status: GOOD (  20.97  )
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

On Tue, Apr 01, 2025 at 11:35:19AM +0100, Jean-Philippe Brucker wrote:
> On Fri, Mar 28, 2025 at 10:11:13AM +0100, Joel Granados wrote:
> > Custom qemu device: pci-ats-testdev
> > -------------------------------------
> > To support IOMMU testing under qemu, the pci-ats-testdev [10]
> > (different from pci-testdev [11]) was used to emulate DMA transactions.
> > It is a full fledged pci device capable of executing emulated DMA
> > accesses. It was originally intended to test Linux kernel interactions
> > with devices that had a working Address Translation Cache (ATC) but can
> > become a platform capable of testing anything PCI/IOMMU related if
> > needed.
> 
> Yes please!  Maybe "pcie-testdev" rather than "pci-ats-testdev"?  There
Definitely. If it is a more general pcie test framework, we need to
change the name to something like that; agreed.

> are other PCIe features that are poorly tested at the moment, for example
> PASID and PRI. The programming model of devices that actually implement
Actually, PRI was what we used it for. I have this as one of the
potential next steps for iommutests.

> those can get too complex so we need something simpler to precisely stress
> the IOMMU driver infrastructure. Driver unit-tests alone aren't good
> enough for exercising TLB invalidation (DMA after removing a mapping must
> crash), tricky cleanup paths (eg. killing a process bound to a device
> that's issuing page requests), runtime PM, MSIs etc. I'm guessing testing
Totally agree. PRI is tricky to test indeed.

> newer/future features like TDISP would also benefit from a simple device.
> 
> Some time back I needed a device like that to reproduce some tricky races
> but never got round to implementing extra PCIe features. Although this one
> [1] is based on virtio any programming interface should work as long as it
> can instruct the device to send precise DMA transactions, ideally many in
> parallel.
And it can be up-streamed to QEMU if it ends up being used for linux
kernel testing.

Best

-- 

Joel Granados

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
