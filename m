Return-Path: <SRS0=TqGV=WQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8A8C3A589
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2019 15:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E290122DA9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2019 15:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gfmuowTt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E290122DA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LK9JlRz7gYA294pHfrBKHEAm/WbdzKIXzV373sNQIZA=; b=gfmuowTtiJjz/a
	8y+fLg5jVA6eb9Ej6eO6Y78hkjTiAYdDxSeeNMHEOu2HBm2kjCf+Bz8i4F5rGSEdc9F3g2jhhU75n
	7BWohAIn3RpG16YPSFjBSmMr7W/jI6fP29PDeOOElMFAHXAQhKnZ6vzwfYHHmcoUXxHKhTdX9sFlx
	G47ZPxCyFFUQczEyTnb1Gm6VYjhELodLTdYUyKUsmQMZdmAo+aHl25GEv8DL9Pw92b2uY/ymI7NTJ
	maF+HZOgJFZ2RNOdMWBgZY6yqBtLu7ioZi/8mh69IClKJYhtLjZb4yGqFyTDGtpsdHjvJJWdGl/mo
	y4pr8Km9/hZSC+jDGSEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i05cW-0007py-NM; Tue, 20 Aug 2019 15:00:24 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05al-0004zR-Fe; Tue, 20 Aug 2019 14:58:36 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 292BEAFCB;
 Tue, 20 Aug 2019 14:58:34 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
 marc.zyngier@arm.com, robh+dt@kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 04/11] of/fdt: add early_init_dt_get_dma_zone_size()
Date: Tue, 20 Aug 2019 16:58:12 +0200
Message-Id: <20190820145821.27214-5-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820145821.27214-1-nsaenzjulienne@suse.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_075835_663684_1719E8FE 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: phill@raspberryi.org, f.fainelli@gmail.com, linux-kernel@vger.kernel.org,
 eric@anholt.net, mbrugger@suse.com, linux-rpi-kernel@lists.infradead.org,
 akpm@linux-foundation.org, will@kernel.org, nsaenzjulienne@suse.de,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Some devices might have weird DMA addressing limitations that only apply
to a subset of the available peripherals. For example the Raspberry Pi 4
has two interconnects, one able to address the whole lower 4G memory
area and another one limited to the lower 1G.

Being an uncommon situation we simply hardcode the device wide DMA
addressable memory size conditionally to the machine compatible name and
set 'dma_zone_size' accordingly.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

---

Changes in v2:
- New approach to getting dma_zone_size, instead of parsing the dts we
  hardcode it conditionally to the machine compatible name.

 drivers/of/fdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 06ffbd39d9af..f756e8c05a77 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -27,6 +27,7 @@
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
+#include <asm/dma.h>	/* for dma_zone_size */
 
 #include "of_private.h"
 
@@ -1195,6 +1196,12 @@ void __init early_init_dt_scan_nodes(void)
 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
 }
 
+void __init early_init_dt_get_dma_zone_size(void)
+{
+	if (of_fdt_machine_is_compatible("brcm,bcm2711"))
+		dma_zone_size = 0x3c000000;
+}
+
 bool __init early_init_dt_scan(void *params)
 {
 	bool status;
@@ -1204,6 +1211,7 @@ bool __init early_init_dt_scan(void *params)
 		return false;
 
 	early_init_dt_scan_nodes();
+	early_init_dt_get_dma_zone_size();
 	return true;
 }
 
-- 
2.22.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
