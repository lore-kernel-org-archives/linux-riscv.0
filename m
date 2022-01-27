Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98B3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AcQWEOk/GUCvhkSqWTyStWkXyZZSe5p8NgChowevV4=; b=sLIL/OVlM+hE61
	rRvl6NSMdyXej5LTdF3VjCKDlnIWgMTI7SCnGYHUPuXjkAZH6PS21bbciCRmxVpTGIjVLpH2i2hBo
	fSJdb7TjfsajIO4HRO3weum9qK0vM8BDjUHns97KdxK8g+VATqDjJxSkyI7jedMXbV6Rdq9afVXAL
	RxhRFbYNNDa6v3e755/+Y8mKIaKLdbr+/vqKJLJ/CI3LeN6k5/X439MYbZelsJ/XcgDDcGxqLQmvV
	EQLvpkHEFPeB2GZnxD2IvkdDSsRrMKsJmnNPfWWoo59KzzLAUpPtN4Z6EGh0K2W2TW+4lI83RWjm+
	9WZ1prIl5xqqBZ8+hMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6X2-00GCcB-4t; Thu, 27 Jan 2022 15:17:52 +0000
Received: from out28-5.mail.aliyun.com ([115.124.28.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WV-00GC70-40
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:20 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.6810555|0.5696508; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_regular_dialog|0.0726309-0.00131609-0.926053;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85P0-_1643296634; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85P0-_1643296634)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:15 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 11/12] MAINTAINERS: add myself as Nuclei SoCs/CPUs supporter
Date: Thu, 27 Jan 2022 23:16:46 +0800
Message-Id: <20220127151647.2375449-12-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071719_411115_26F6335C 
X-CRM114-Status: UNSURE (   5.99  )
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

Currently I am working on mainlining Nuclei SoCs/CPUs Linux support.

Add myself as a supporter of this.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..499450d14625 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13733,6 +13733,13 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUCLEI RISCV CORES AND SOCS
+M:	Icenowy Zheng <icenowy@nucleisys.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+N:	nuclei
+K:	[^@]nuclei
+
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
 M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
