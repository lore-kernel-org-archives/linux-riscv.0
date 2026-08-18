Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A369C5DF7E
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN3Lqj2QEzGTOfpAAVwKUPjLZ8IABy/3gJnVvDialCk=; b=Y2aZq4C/jZgvj2
	oDNhmMMDZTthSEbGUYOAXzHUkzr5+/v6c10HhAw47aY9hnh6QaRiQvqSdH/VEddjpPLgoGNkoDALG
	S3bDz6wvCipC7MAooOQ93wVWSoxhLpAjAnS4EvMy3YaOgVVc7kcVXcV8qcW0W9am1e7xQNf7GBQ9m
	YwBgjgGaW1nKQrbQKt9bkbK6aiMBdb8Ppmbj/92So/kxg97+vX/uohud4Z0N0UCLjm04gnDp1e3tx
	Z67ZWn9eCR90DiPNnCIKgAzDUm0MJ1/tk3aUy7nmEKy4HfAhqpvAE8bJ52qooTtueIIvOS+BcGjSS
	94+9NSJsmPydShg1CdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIwN-00000007vTw-31ty;
	Tue, 18 Aug 2026 12:29:15 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIwJ-00000007vTY-3762
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 12:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787056147; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=TtuowDfAfeRuajULyeg+364OFWlFBrxWxyX/8s0sLco=;
	b=wEUA/7zNGllLSdTWqE0707V4LcCzK5drF1ipL41oTNqWtNyga3oLAKyVmigYouDCXH7+XcFYz03MYwzR6Yo+WRm/zzkgeFk4bhqWN074hs17UvNo4uoaHGkuV135DG30+XALTSofYItLbHXmMFFzE3ZNxWjUCdCqp5CUyB9az6I=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0X9DUX66_1787056144;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9DUX66_1787056144 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Aug 2026 20:29:06 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: fangyu.yu@linux.alibaba.com,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	oro@8bytes.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org
Subject: Re: [PATCH] iommu/generic_pt: Fix the RISC-V supported feature mask
Date: Tue, 18 Aug 2026 20:29:02 +0800
Message-Id: <20260818122902.35665-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260818092444.42755-1-andrew.jones@oss.qualcomm.com>
References: <20260818092444.42755-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_052912_501908_F8C4D6A3 
X-CRM114-Status: UNSURE (   7.19  )
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

>The RISC-V format advertises Svpbmt to its users, but omits the feature
>from PT_SUPPORTED_FEATURES. Add it there so configurations which enable
>Svpbmt pass generic page-table feature validation.
>
>Fixes: f196a8668797 ("iommu/riscv: Advertise Svpbmt support to generic page table")
>Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
>---
> drivers/iommu/generic_pt/fmt/iommu_riscv64.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
>index b18fc4d109f5..1bb74114fb02 100644
>--- a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
>+++ b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
>@@ -7,7 +7,8 @@
> #define PT_SUPPORTED_FEATURES                                  \
> 	(BIT(PT_FEAT_SIGN_EXTEND) | BIT(PT_FEAT_FLUSH_RANGE) | \
> 	 BIT(PT_FEAT_RISCV_SVNAPOT_64K) |                      \
>-	 BIT(PT_FEAT_DETAILED_GATHER))
>+	 BIT(PT_FEAT_DETAILED_GATHER) |                        \
>+	 BIT(PT_FEAT_RISCV_SVPBMT))
> #define PT_FORCE_ENABLED_FEATURES BIT(PT_FEAT_DETAILED_GATHER)
> 
> #include "iommu_template.h"
>-- 
>2.43.0
>

Thanks for fixing this.

When I originally tested the Svpbmt support, I had CONFIG_DEBUG_GENERIC_PT
enabled by default, so this issue was hidden by the debug supported-feature
mask and did not show up in my testing.

Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
