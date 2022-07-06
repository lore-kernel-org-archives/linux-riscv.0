Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50206C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgGpHB0++dZLJC8my1X58sH0Kjw3/h3TqRJBNCb/InI=; b=E261E38V93G1vG
	R94XIIHY1DOU9RfQO+eYVFKVBwR59t0BnQzYcnZvl2klllxzd/FXrN1wLTTN8Xn8s+9jbGEvqBaoS
	fxMbw40pXFngrBWtlD60548pOSwk3iMePryiOfDCPovNjuraInPaRs5v+jzvDvv4fGhsl/cForwgU
	kFMsrPuYOIjBr2N31glbEKWSQX2+8uGq9M6g5SwGl0qQCmQ7x89yWMyHufjw1qLVSMXa9wEtW7v4g
	FDVIQA3oy+7b1zk9SSNzo1l/uggH6iDUuPatqFAlAhryVJux+kRq/4mfO5mxBtzZl0FBmWbal6B2K
	M8lGpxA/Wan+r+ESwjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95mr-00AYyO-RQ; Wed, 06 Jul 2022 14:13:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95mp-00AYxd-BY
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 14:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657116831; x=1688652831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GLIOOdGeVnPQ6/dJKcYgkaTGFXv/BDSQ4KyNFEOI2kc=;
  b=I2/F+o8omLnQ0XWB5SXkYXN7vZl+wW9gxYsmJlyzn1d8V9IwBJGHTWJ+
   EjFsV1zB4CZogkTrrJRTSZQBmdsVA02wHkI6e8wfhBDyC0H8B5CTbzLH6
   ONcoKycAB1Jir4+6klESQWBHRiertuFI3OFLXUIecdJSAh6VaJ5aQVLgE
   AxiNZNYAXWhBYFyjt6FdqPo+iVoEgeS2hByGRqGPumjo2SbetpbLRhv5A
   +h2GOHgcUYl/78vm7UqjXbaMEnrFQo/PcxGYJW8JasBK0SWqZU+CeDQlW
   /4MgV6TKnCHxsmwe83WDivK3A8e4CjG9DOF3QFFq8jL81QpIZZiOBHCwM
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="180992568"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 07:13:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 07:13:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 07:13:47 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
	<conor.dooley@microchip.com>
Subject: [PATCH v7 2/2] MAINTAINERS: add the polarfire soc's i2c driver
Date: Wed, 6 Jul 2022 15:13:15 +0100
Message-ID: <20220706141313.2504237-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706141313.2504237-1-conor.dooley@microchip.com>
References: <20220706141313.2504237-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_071351_441397_5133F574 
X-CRM114-Status: UNSURE (   9.45  )
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

Add the newly added i2c controller driver to the existing entry for
PolarFire SoC.

Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v6:
I rebased this on next-20220706 & it went through without a
conflict. I'll bump it after mw1.

New in v6.
FYI: I have several maintainers updates in flight - usb, pwm, spi
of which some will be in 5.20 & clk/hwrng/pci that are likely to
go into 5.19-rcN.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d64d79eb36a2..3286b727c90b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17428,6 +17428,7 @@ M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
+F:	drivers/i2c/busses/i2c-microchip-core.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
