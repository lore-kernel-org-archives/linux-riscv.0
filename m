Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B76C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C895060EB6
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C895060EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyO92EM6bQiZbKuQnQCNI0qARW+Ij99Ub9SziEi5Piw=; b=TnHVGo0pDfYC4Y
	F+wHVAh7sv+5A72Wd1P5K2ytjqJxZK4hxj3ChcC5xhTQnEki95XS77dYnUHlb7r2hmOy8sELq3Cqi
	KXiBT/68QQ22M+DD/G3TrtPkovrJ2F4X1jRJ/uoTi4xxGHxOgjyV9StQGk8pL8n0R83B2VE9WLDtm
	G2PJYAfvkvs/7GAnA5GTIKeQ2VM6VW06NwtJ4uDRs9ETo80b9RAyQZz6VqAng88xBeIE7KyQTJPir
	x8AuV5FjEC5ZEDcAUzfJsL8Go5yIb3SvG+wvU8st1nQkuZ9B5fj8XSX1rWVLaPraQKPlUIvmFrgfM
	aV6wfV3kHcGc8gpY1ouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m72ue-005zUX-Mv; Fri, 23 Jul 2021 21:40:56 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m72uP-005zIy-Iz
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 21:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627076441; x=1658612441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FZmD5JDut8+hqQnxscDF4nA471lKHOPpWVdLU/AZ18o=;
 b=jHKQSHXQ7bXePqrfcL2QcYSJErJWyEFNZ1TvaHUG3v38v5xiARkuaCVw
 s6ayOrsaI7KUPDiZZ2DT8RWaUunHjie25VAiPOu4ZivPrXU++9nqD3baH
 NV4sk5k/uuy6dX9bprzQZ9WaF+SiqoXinf3hK5eS6YAWMfuvNDwvM3w0N
 vBk7hm5v9MZ95gEjHBsjJBkKFTGtnFwShSAeG7YhgdWlxkoKLM4J9VDoU
 p5IVfhRMmy5iXeQPPL23ha1yCo/SdelLNBG+ZZICPengV3VbcKAg0CSiD
 ha+sgC2mloSX2FgjufvTzuTpcW1kszbvg/1Ity4EzAG+Ch84wweac7f70 g==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="279198466"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 05:40:37 +0800
IronPort-SDR: EUwsfiLd7jnWD0SNC1xAZmhSl3xM5gr3JY1ngRl/GnPSSQNOxI12kakPJ5IgMAapGtk/YTK0Ok
 c7hl1bXlUIRppTH/o4tkVPe1yORHvJ8opUkIDHb94lItVrionx82OJfpucLcIKwxvB8YRRgJsg
 oYR2Y0lF1ZR30vDuK2GQ23y/yXauVCCFN9u5iPxdZ7IRW7GqWgRvCoZTonBe2VpjCuo0GRKsGU
 KIdRwpsjugdEJ3Dn8ur+cJW+BFnG1xadmLd2Dny8px4uNxjWNEPublKR6x2+Jm+turONQVr7Cu
 EUMvXYEM6A56eiXyJ+q+2uxg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 14:18:26 -0700
IronPort-SDR: LjlOnqwO6a/04wGjvbug293m/8qn7cznMgBruMkmo6Tel5ZJMkE6+M7OvZdwEvPubcxMheZERt
 lQ+sNikSqbrehg8ASur9Vjq9mL3Z4lqGj5A946yoMS6Ts92f/InosBlv1k2y7BMcnZXeI9zPvx
 mJQEjGWo0n4PPJ7AA4mRZXBBF3gLp53/vEUqb9aWh7AAOyzSZkDvpyEMe1gzV0DokMofyshPSa
 GwceP5V147VgMQfr8U+sGdKkY+aTpBTNx89lHFjrE172mP1ushHKqjMVO+Y4cL8vURhvNaPxhK
 Jzc=
WDCIronportException: Internal
Received: from ucfbox21.ad.shared (HELO hulk.wdc.com) ([10.225.167.4])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Jul 2021 14:40:38 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>, iommu@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Tobias Klauser <tklauser@distanz.ch>
Subject: [RFC 4/5] dma-direct: Allocate dma pages directly if global pool
 allocation fails
Date: Fri, 23 Jul 2021 14:40:30 -0700
Message-Id: <20210723214031.3251801-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723214031.3251801-1-atish.patra@wdc.com>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_144041_745954_99868E5F 
X-CRM114-Status: GOOD (  13.08  )
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

DMA_GLOBAL_POOL config may be enabled for platforms where global pool is
not supported because a generic defconfig is expected to boot on different
platforms. Specifically, some RISC-V platforms may use global pool for
non-coherent devices while some other platforms are completely coherent.
However, it is expected that single kernel image must boot on all the
platforms.

Continue the dma direct allocation if a allocation from global pool failed.
This indicates that the platform is relying on some other method (direct
remap) or just have coherent devices.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 kernel/dma/direct.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index d1d0258ed6d0..984ea776f099 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -161,8 +161,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
 
 	if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
-	    !dev_is_dma_coherent(dev))
-		return dma_alloc_from_global_coherent(dev, size, dma_handle);
+	    !dev_is_dma_coherent(dev)) {
+		ret = dma_alloc_from_global_coherent(dev, size, dma_handle);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Remapping or decrypting memory may block. If either is required and
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
