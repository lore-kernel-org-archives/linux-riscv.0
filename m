Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2F8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7AJOu/LO/sUxtpMXiqcyj2cpM0Kp8ZnrWDhjJizHEo=; b=zNc6a0tiDow8K9
	0dPwU52DRo14aejqt3ARLHymTO9xDYMo00fkxrLjt/5fNghtbT79Qej+rnLFgp1Wnx4pMJlWmgDlt
	zLkB7g93Icwd/njClPDn9hfDS42QHM9Su4UWRldijCpfVbPtMnNB53ugoR08Fhs9YZJatey1GtwzU
	zprp7p1z1T6ApMPC1GFIMSVX/zCzk7ixeXepjnjDFwNHaRVAI4E5tAB8V0hm/qhu0r0FzFYXA/gB9
	6DsDGBNXcVghOaqEGHe7+z0K33eLamg4fCHYLSwNmaJMwVKOt1H1uht+A+9YjFQSBG6vRwJnWpZ7c
	m7iAwJmGCcD1fZtJlXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfLSv-00A9Zz-4S; Fri, 15 Apr 2022 12:54:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfLSa-00A9OM-Im
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 12:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650027240; x=1681563240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TEwhUw8m7yZXsEi10aMbJ5KQItvCyoj7fGnbnyDG3vM=;
 b=eo7rFPWNWQWhdupIOS/nnGMla9gGwpHHdh3bwG/Ag5ysQlXbbufhGKPL
 5EeUGZ0gQY5m5mB9BqxbOxBUmLaI9m2AvpcW9F3sZuxGwsJmjrU1OP311
 duB5DRmLuEcNXkPBLOp3XbVCRGyawBOFCtIdXl3aE81mIOVK305fM8C4t
 CecAgz0fn9X5BqVFxZgRg7pCs+/ewVzw2MbjqYeJqSXo9NKp+S6z1UwkJ
 7w4fLrXKScTgEKitk3PboK1z7P8TWsdBtFxgpbeUh+3DQbNO8JPSeMnT5
 PD53XZdAsVVmBH8in8upFOb5EoFYpTYxFKBHm55hFrOFdXioRX9+If0i+ g==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; d="scan'208";a="169769323"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2022 05:54:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 05:53:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 15 Apr 2022 05:53:58 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 4/4] MAINTAINERS: add polarfire rng, pci and clock drivers
Date: Fri, 15 Apr 2022 13:52:22 +0100
Message-ID: <20220415125221.2871991-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415125221.2871991-1-conor.dooley@microchip.com>
References: <20220415125221.2871991-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_055400_651334_E61FA6FB 
X-CRM114-Status: UNSURE (   8.03  )
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

Hardware random, PCI and clock drivers for the PolarFire SoC have been
upstreamed but are not covered by the MAINTAINERS entry, so add them.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd768d43e048..a1df9c89bd11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16944,7 +16944,10 @@ M:	Conor Dooley <conor.dooley@microchip.com>
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
