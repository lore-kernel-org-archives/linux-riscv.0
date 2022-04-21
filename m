Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320A0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vtoPr4APFmdtotrsQ5JtZtpuckRwqaBHfK8IQeD8XI=; b=ARa46yzhZwd5On
	/hmxqEJwwcMRHi5MYuQ3VtGActTs+kOUXZK2JN1Yz1CdACuYnRpFXX5B47RsCrMmhybIbZCsGr5q4
	ZmjT0euDZLta0uoPjlKjr/tNMtR7WbutsDnf+MhQRSMP+Lp7YyRBT0MHCsaRZZCc9EgoebsnrZfT2
	rRpB0BGtk1fRjOO+ATkXjoiAz0o9ReslZm7cm7RvVjsDnT4HVbrkuCY4oFn8+qvVdePxMKncyNQSN
	Qlv2exTDp9RzF+/c9IKZIUKaHICQXW1uI7cEJ5AGxhARhf26lkfZxLIdOU3f9stCqk4aqkYQKWaea
	hu4WY07jcIWhnXCBhvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSec-00CYdQ-96; Thu, 21 Apr 2022 08:59:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSeX-00CYaR-5f
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 08:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650531545; x=1682067545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xA3N4B1Oq7NN/T+qdPN5HDE/pIMyStNJQREGSATatw4=;
 b=bYPVKeodUaO4oXQrjIC7e1zxeX49ET8X2Ix0cfTtsGHOlwbqyY36WY9Z
 lBOaTwwz+AFk6h4m/7hPe0FrmyAc9lhhEIn4RFSlGwL86MWQOPRlNHFmU
 lVZq6UVrkDvzihwBIdyruY4Q0bsKfOEVyDQIZM/PIyiqLs18X/JLvYVTs
 XbAKIfz+8sqm2zEa2l4eSxIHre5svnpZAY2XkUNWTrcFe3wQkJJGbOGS8
 BKO6MTYxdTEs22ZB5ExUKUWfGflTDOcP+IcyxHd8v3ROWPI+nNF6klftw
 UXOTkzL0eq9jsPF3x1158SDivsmszvFw5+zP3mGcuzHeEbhiOna7OXRwu Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="160822028"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 01:59:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 01:59:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 21 Apr 2022 01:59:02 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add polarfire rng, pci and clock drivers
Date: Thu, 21 Apr 2022 09:58:06 +0100
Message-ID: <20220421085805.1220195-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220421085805.1220195-1-conor.dooley@microchip.com>
References: <20220421085805.1220195-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_015905_233641_B288B81F 
X-CRM114-Status: GOOD (  11.02  )
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
