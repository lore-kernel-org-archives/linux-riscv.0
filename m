Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F61D3C922
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YsjbAWupoVqIGxDhSDdCZmvcPQpt0jdL0tspIvTK8I=; b=l+NZNK3luFkCZQ
	0ug1r9cmCyKaBesd2ME8OPstT8NIjguyF2M2rBY3mat7K5204EHAsUn9CfO4WEwxGSqA39eQTRXCi
	7OZ4HAsOKWVOjTu+OJZ8Yq//sOZ3kTbJYBAY+68kC+5bY8t9yINAM1F++Fzaj45pIzD7P9x1xTPts
	waDz2XwGy6oo2Pyao+yNJSMIrP6Cw1Z223gfQMZNwQTXAjQ1SidnZlAOicppDjxdo6XIADF6CZ9yx
	/MRcUZqbjZkFOwbW3uyehLmgbObZRBS5hh1yw4qMACnHiZXaE6ivFhK/fG3yJqL3sn7NIZAGknro/
	7Bzkl0pDIoEItPimvvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMdX-0000000FbCz-2CiB;
	Wed, 10 Dec 2025 16:01:55 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMdU-0000000FbC3-132a
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:01:53 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dRL7J3HxzzJ46dr;
	Thu, 11 Dec 2025 00:01:32 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9EF994048B;
	Thu, 11 Dec 2025 00:01:50 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 10 Dec 2025 16:01:49 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linuxarm@huawei.com>, Arnd Bergmann
	<arnd@arndb.de>
Subject: [PATCH 2/2] soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
Date: Wed, 10 Dec 2025 16:00:47 +0000
Message-ID: <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_080152_431979_9F34981F 
X-CRM114-Status: UNSURE (   7.74  )
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
Closes: https://lore.kernel.org/oe-kbuild-all/202512100411.WxJU2No9-lkp@intel.com/
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 340a1ff7e92b..2a8ae79a11af 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -445,6 +445,7 @@ config ARCH_R9A07G043
 	depends on RISCV_SBI
 	select ARCH_RZG2L
 	select AX45MP_L2_CACHE
+	select CACHEMAINT_FOR_DMA
 	select DMA_GLOBAL_POOL
 	select ERRATA_ANDES
 	select ERRATA_ANDES_CMO
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
