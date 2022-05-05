Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFD7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vtoPr4APFmdtotrsQ5JtZtpuckRwqaBHfK8IQeD8XI=; b=TwjzwICTIQaOCf
	CtgpqrVZk5SFD4ChVe2HxciaQdG4wNSDRVtrnEL/q/K234KjsCfAD5Yjmzlmwl0uCRLXzOsU4WbhD
	iOWcmdMcJXtvhTQwv+c/ejTShveO4mWDp1rJ1+m3Ffou7xT8l64S7bXfA0FEPnisH0G1j/HvpvXCq
	+E0YqqvKkRXKnIUcVGhaaxcKcRkoCTPdOP6zCwo2a79owUMgwd3hpBJgm5PYT+grOR/8gUrPh139Z
	SfJJWlV2OZU8rKCWbydzZcColegOHvGF3FWpc2Owrb+5MWtT+3s1p4HkSCDWMnpanrV9pYWpJpn6w
	FJWmNHOEmRAW6wbt5HQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmZ9w-00FLnX-4G; Thu, 05 May 2022 10:56:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmZ9s-00FLlp-9f
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 10:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651748192; x=1683284192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xA3N4B1Oq7NN/T+qdPN5HDE/pIMyStNJQREGSATatw4=;
 b=Vb0XrWZcGeRsASdkrqGFqW/xZx8y87RHK8J57Q3TNRIgRxZzkFNe+RKe
 5rRqBT3wF+vbUclMLPAod3Tq6FumG7S7gbtGT3enAmmAlZbQRsuYrGeW8
 rjmHqmi/uwzWktvEuDpQKeRjv69/aB68mSR1cmP3zd1Q24U4eyUEkHJM0
 p9w1K/Ka6fklEDYU3Sn3oJ81mhHeb9DhrHe1CEK/6bgWobJhVdIEWiRqt
 PfOfpF7jqdDph9wGhq5xQXJxhHDA/jrCDwwc7kt89wUxJcGnrcyjZC02X
 LK4sRcHw94ORL+8wrXjhRWCfeQ1tEAGIXAmrSShtOwNDJojPkoJj+1RlC Q==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="162828731"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 May 2022 03:56:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 5 May 2022 03:56:29 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 5 May 2022 03:56:27 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock drivers
Date: Thu, 5 May 2022 11:55:26 +0100
Message-ID: <20220505105525.3881259-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220505105525.3881259-1-conor.dooley@microchip.com>
References: <20220505105525.3881259-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_035632_389761_ECB3EC58 
X-CRM114-Status: GOOD (  10.39  )
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

Hardware random, PCI and clock drivers for the PolarFire SoC have been
upstreamed but are not covered by the MAINTAINERS entry, so add them.
Daire is the author of the clock & PCI drivers, so add him as a
maintainer in place of Lewis.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd768d43e048..d7602658b0a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16939,12 +16939,15 @@ N:	riscv
 K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
-M:	Lewis Hanly <lewis.hanly@microchip.com>
 M:	Conor Dooley <conor.dooley@microchip.com>
+M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
+F:	drivers/char/hw_random/mpfs-rng.c
+F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
