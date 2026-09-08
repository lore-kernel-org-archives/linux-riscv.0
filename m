Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E278C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 13:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bb1QFMPZiL6wynJJ5bIPs1B6fOBFTP/kFcK0fci8BEQ=; b=HMu88HfIeTvemZ
	QsZm+1+eUpSaFQk/JBBH1VPW7xWFJkHm+OQBGFo2hbVyZJE184Vxa3b/4WvWWy3bjSd7G65w6v5pU
	Rg8Z7EpcPLueWm8ueJ1EnZfv/82ZR3fRIT0W0eW8fX5tFqMRzTwyghaZfxzhm//3B+idmPhyVZCsz
	uLGpjBFKjTm85Jpe9S4vyqysb5atEP+w9WSKHClDYn2t27wWWsLiHDn5RLC71W1qPR3JeLCpnzeWw
	b2ogxgRdH17XHrP4KubW4rwOhqGwkmBhp/lQln4fFb+7EFdyXxkriG1kn69ysg9690cRGIuXVVq2C
	RLrdhblYTjXtVDTeLm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vZ3-000000096xV-2kAK;
	Tue, 08 Sep 2026 13:08:41 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vZ0-000000096wn-3mCr
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 13:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788872913; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=lZOJZ1eXA52ShReNf9dL+c4a3gllm4PudhUTHQNpfUI=;
	b=r9ZOx5PGf0NRmLJOUPdvc7WFOcP18Qr8g4ttnw0niASlGqGtRI63Jfhkm1iJfukT3mEOCGkwH2ak6dzhMenPJ5iYdLGkBRvKaliuSWGsSzR+vl6eYZB6ULIb20kTOtfyXgfEP7hq+b+k7sGFryFbjJgwUDszvNKWYygvqZZFa5U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAbablx_1788872910;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XAbablx_1788872910 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Sep 2026 21:08:32 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: anup@brainfault.org,
	fangyu.yu@linux.alibaba.com,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tglx@kernel.org,
	tjeznach@rivosinc.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org
Subject: Re: [PATCH v5 00/17] iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO
Date: Tue,  8 Sep 2026 21:08:28 +0800
Message-Id: <20260908130828.14195-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_060839_104209_CEDAC5BA 
X-CRM114-Status: UNSURE (   8.83  )
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

>This series adds MSI remapping for IMSIC so a device's MSI target gets
>translated the same way its DMA does, allowing RISC-V to enable IOMMU_DMA
>and paging domains by default.
>
>v1[1] used get_resv_regions() with IOMMU_RESV_DIRECT_RELAXABLE to identity
>map IMSIC pages, but that was rejected as only a workaround. v2 through
>v4[2] instead introduced a RISC-V IOMMU IRQ domain which pre-mapped every
>possible IMSIC target and maintained a domain-local PA-to-IOVA table. The
>v4 discussion with Jason identified a simpler way to handle the RISC-V
>requirement that the MSI target address changes with interrupt affinity:
>extend the existing iommu_dma_prepare_msi() model to prepare an ordered
>list of MSI targets as one contiguous IOVA range. v5 is a complete redesign
>around that approach.
>
>The IMSIC driver now builds an array containing the supervisor IMSIC page
>for every possible CPU, indexed by logical CPU number. When allocating an
>IRQ, it passes the complete array to iommu_dma_prepare_msi_list(). The new
>API maps the ordered physical address list into one contiguous IOVA range
>through either DMA-IOMMU or iommufd, then caches the base IOVA and mapping
>granule in the MSI descriptor. MSI composition can therefore select the
>target for the current CPU with simple arithmetic, including during an
>affinity change, without allocating memory or consulting IOMMU-owned state
>in atomic context.
>
>DMA-IOMMU extends its existing per-page MSI cache to recognize and reuse
>complete ranges. iommufd grows its software-MSI bitmap on demand, bounds
>allocations to the reserved MSI window, and prepares, installs, rolls back,
>and replays a range as one unit. This keeps the descriptor's contiguous
>IOVA valid across iommufd paging-domain replacement without exposing a
>partially installed range.
>
>Unlike v4, v5 has no RISC-V IOMMU IRQ domain, no domain-local IMSIC mapping
>table, and no IOMMU lookup during MSI composition. The IMSIC IRQ domain
>owns the target list and message composition, while the IOMMU layers only
>provide the mappings. Devices which do not need IOMMU MSI translation keep
>using physical MSI addresses through the same IMSIC path.
>
>The series also carries the remaining plumbing needed for RISC-V PCIe
>device assignment through VFIO/KVM: the RISC-V IOMMU reports DMA
>cache-coherency capability for coherent devices, VFIO type1 and KVM_VFIO
>are enabled for RISC-V, defconfig enables IOMMUFD/VFIO as modules with cdev
>support, and the generic VFIO/iommufd selftests can be built for RISC-V.
>The RISC-V IOMMU specification does not provide MSI data validation, so
>VFIO device assignment requires the applicable allow_unsafe_interrupts=1
>module parameter. Direct MSI routing to guest interrupt files (irqbypass)
>is not yet supported by this series and will be posted separately on top.
>

Hi Andrew:

I tested this on riscv64 QEMU with an emulated NVMe device and e1000e
network adapter. The fio and iperf3 tests both completed successfully,
and the interrupt status was as expected.

For this series
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

>LLM-based coding assistants were used during development for code
>exploration, patch review, test execution, and drafting and editing
>commit messages and this cover letter. I reviewed and finalized all
>resulting code and text. Per-patch Assisted-by tags are omitted in
>light of ongoing discussions about simplifying coding-assistant
>attribution.
>
>Thanks,
>drew
>
>[1] https://lore.kernel.org/all/20260508212339.381933-1-andrew.jones@oss.qualcomm.com/
>[2] https://lore.kernel.org/all/20260820214150.545737-1-andrew.jones@oss.qualcomm.com/
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
