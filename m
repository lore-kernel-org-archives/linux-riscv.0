Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD26D3C927
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPH6wu6HEvSq+5lgK1cuoVOdrHnq7uPMKi00KgLcVMk=; b=MM4yTFPGfqv0t1
	cIIKvzekxcjHTpJrN8yRcEVWfwaO2ULTA9461OYvxvM/A91fHWPg85tBH7Z+Z9C5qUhD0kRx6A/UV
	DG13dkIvUUPH4OZEfVkA8iCcY0u6UyvQs7hKo9WKIt0lnHrmLWyi9FHx/PdqdgGxG1IFD9SQ+ewwq
	RMe77WN7wUvwWf+ik/55nKZrqM+BilWjREGanW4k45KBN2FoMU+/T5ROg/pv5SWPzFKoZRrk5D/y2
	gos2CFLTQRNR91E5lzUAXEXrOTQpK90Yr0cqDOPaL+WZacKMchwc+RKQXkyT99M8MTIUo52igM0IL
	gBQxhQaHiallXJRP2U4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMd2-0000000Fb8f-0rUH;
	Wed, 10 Dec 2025 16:01:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMcz-0000000Fb89-11qi
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:01:22 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dRL6j3NQyzJ46cJ;
	Thu, 11 Dec 2025 00:01:01 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id A19994056B;
	Thu, 11 Dec 2025 00:01:19 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 10 Dec 2025 16:01:18 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linuxarm@huawei.com>, Arnd Bergmann
	<arnd@arndb.de>
Subject: [PATCH 1/2] riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
Date: Wed, 10 Dec 2025 16:00:46 +0000
Message-ID: <20251210160047.201379-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_080121_426703_A013DD92 
X-CRM114-Status: UNSURE (   7.56  )
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

The Kconfig menu entry was converted to a menuconfig to allow it to be
hidden for !CONFIG_RISCV. The drivers under this new option were selected
by some other Kconfig symbols and so an extra select CACHEMAINT_FOR_DMA is
needed.

Fixes: 4d1608d0ab33 ("cache: Make top level Kconfig menu a boolean dependent on RISCV")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512100509.g6llkMMr-lkp@intel.com/
Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/riscv/Kconfig.errata | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index aca9b0cfcfec..3c945d086c7d 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -84,6 +84,7 @@ config ERRATA_STARFIVE_JH7100
 	select DMA_GLOBAL_POOL
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_NONSTANDARD_CACHE_OPS
+	select CACHEMAINT_FOR_DMA
 	select SIFIVE_CCACHE
 	default n
 	help
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
