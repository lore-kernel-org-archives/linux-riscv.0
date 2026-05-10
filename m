Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B142CD3427
	for <linux-riscv@archiver.kernel.org>; Sun, 10 May 2026 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mn85/KiNjBZTi2OiW+2RcjfVi/wH2ESJgBTyVOHdqs8=; b=tpaWfcpymvFE9x
	ZK88+IrWXf0VBmQBx1ESyy6R7CHjtIMTpW3l8ikLkmNQYo2+Cs2K2q9FRg+dZOX5iy1PQKXaXNpcf
	UWwfCYR/nZ9OVk36sb40RVwfLJhJ5L1Y8bHkGjqL+8uGVOJlNCx6tXY4qBGz5PZsDQoWutxA9w76z
	/oKTJnJQW11ddJ0n1f1LxOBAvCb4EJQY/Uaw4v56RvBOLFwjeNScJ9HOzWkxIVMJnLj5czjVIB9iz
	5qpUd+1k5iXGkyMTqxlN8IdFsKbBiafhBzEJvRDf8Q/BGvAeckfG573hxSsljbw1BIfKSFYtusBpG
	8swyeLp7Zb++XjpkemeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5L8-0000000AxZn-47gY;
	Sun, 10 May 2026 14:41:07 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5L5-0000000AxXl-22Us
	for linux-riscv@lists.infradead.org;
	Sun, 10 May 2026 14:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778424054; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=R6vTP+75SxlXoCmcc8VJ7xs6oTFPgGOP+Sy2kcFXi10=;
	b=X3kYBG4mnWse4wkoaLOk1UXA0fds3iUNkhMxyywyMzOn6lJILKm1zazrJ40GCE2eHAVSuklzjj9ThavK+3OY8Xohs+RrgPYeF558L52LDkZoMFzNZslD0rBIh+xXYK3QfUzC1p9q/Y9Y8H+R2HXjsk6uFHnuNIbar8jH19Iiklo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0X2cswKI_1778424045;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2cswKI_1778424045 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 10 May 2026 22:40:47 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: anup@brainfault.org,
	fangyu.yu@linux.alibaba.com,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	tjeznach@rivosinc.com,
	will@kernel.org
Subject: Re: Re: [PATCH 1/2] iommu/riscv: Map IMSIC addresses for paging domains 
Date: Sun, 10 May 2026 22:40:38 +0800
Message-Id: <20260510144038.54523-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <fhv3w4kmxd5kw26kdlj4uj7cgr5mhov7rytph6dedokdpe36d4@svjdhnilgnwe>
References: <fhv3w4kmxd5kw26kdlj4uj7cgr5mhov7rytph6dedokdpe36d4@svjdhnilgnwe>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_074104_222294_16F98350 
X-CRM114-Status: GOOD (  17.21  )
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

>> >When IOMMU_DMA is enabled, devices get paging domains and MSI writes
>> >to IMSIC interrupt files must be handled correctly in the s-stage.
>> >As the device always writes to the host physical IMSIC addresses,
>> >which the IMSIC irqchip programs directly, install s-stage identity
>> >mappings for the host IMSICs. But, use IOMMU_RESV_DIRECT_RELAXABLE
>> >since the 1:1 mappings aren't required for device assignment.
>> >
>> >Loop over the cpus rather than imsic groups to handle asymmetric
>> >configurations.
>> >
>> >Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
>> >---
>> > drivers/iommu/riscv/iommu.c         | 34 +++++++++++++++++++++++++++++
>> > include/linux/irqchip/riscv-imsic.h |  7 ++++++
>> > 2 files changed, 41 insertions(+)
>> >
>> >diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> >index a31f50bbad35..3c6aa9d69f95 100644
>> >--- a/drivers/iommu/riscv/iommu.c
>> >+++ b/drivers/iommu/riscv/iommu.c
>> >@@ -19,6 +19,7 @@
>> > #include <linux/init.h>
>> > #include <linux/iommu.h>
>> > #include <linux/iopoll.h>
>> >+#include <linux/irqchip/riscv-imsic.h>
>> > #include <linux/kernel.h>
>> > #include <linux/pci.h>
>> > #include <linux/generic_pt/iommu.h>
>> >@@ -1286,6 +1287,38 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
>> > 	return &domain->domain;
>> > }
>> >
>> >+static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
>> >+{
>> >+	const struct imsic_global_config *imsic_global;
>> >+	unsigned int cpu;
>> >+
>> >+	if (!imsic_enabled())
>> >+		return;
>> >+
>> >+	imsic_global = imsic_get_global_config();
>> >+
>> >+	for_each_possible_cpu(cpu) {
>> >+		const struct imsic_local_config *local;
>> >+		struct iommu_resv_region *reg;
>> >+
>> >+		local = per_cpu_ptr(imsic_global->local, cpu);
>> >+		if (!local->msi_va)
>> >+			continue;
>> >+
>> >+		/*
>> >+		 * The device always writes to the host physical IMSIC address, so install
>> >+		 * identity mappings directly. Use IOMMU_RESV_DIRECT_RELAXABLE instead of
>> >+		 * IOMMU_RESV_DIRECT since these 1:1 mappings are not required for assigned
>> >+		 * devices.
>> >+		 */
>> >+		reg = iommu_alloc_resv_region(local->msi_pa, IMSIC_MMIO_PAGE_SZ,
>> >+					      IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
>> >+					      IOMMU_RESV_DIRECT_RELAXABLE, GFP_KERNEL);
>> >+		if (reg)
>> >+			list_add_tail(&reg->list, head);
>> >+	}
>> >+}
>> >+
>> 
>> Hi Andrew,
>> 
>> Thanks for picking this up -- enabling IOMMU_DMA on RISC-V has been
>> along-standing gap, and handling the IMSIC MSI mapping is the missing
>> piece that finally unblocks it.
>> 
>> One concern is that the current implementation emits one 4 KiB
>> RESV_DIRECT_RELAXABLE region for each possible CPU. On platforms
>> with hundreds of harts, this noticeably increases the cost of both
>> .get_resv_regions() and the iommu_create_device_direct_mappings()
>> walk.
>> 
>> Since interrupt files within one IMSIC group occupy a physically
>> contiguous range, would it make sense to emit one region per IMSIC
>> group covering the full group stride, aligned down/up to 2 MiB so
>> the core can map it as a superpage? This would over-map some padding
>> within the IMSIC PA window, but RESV_DIRECT_RELAXABLE keeps the
>> padding out of assigned-device IOVA space, so it looks harmless.
>> 
>
>Hi Fangyu,
>
>Thanks for pointing out this issue. We'll need to decide how much we
>want to isolate the devices from VMs in order to address it, though,
>because, if we do group mappings, then we'll also be exposing the guest
>interrupt files to the devices.
>
>I'll certainly send a v2 to do larger mappings when s-mode imsics are
>contiguous (nr-guest-files = 0) and then we can consider creating a
>way to opt-in to group mappings even when nr-guest-files != 0. How's
>that sound?
>

Hi Andrew,

As you mentioned, my suggestion could also expose the guest interrupt
files to the device-visible/mappable range, but the current approach
already appears to provide only limited isolation. So I think this
change would not materially increase the risk.

In any case, I respect your decision, and we can certainly proceed
with your current suggestion for now.

Thanks,
Fangyu

>Thanks,
>drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
