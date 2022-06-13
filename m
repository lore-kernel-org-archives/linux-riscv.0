Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15300C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpV5eye+fJZwrmLbEUsRp5PdH+lMmo9ffmdAEpjzTuw=; b=2jHARtoWUcgIGr
	xdNuQ2vUEjVz2Jf/WRmzU434OWZU6g9jE+pO4HlL3Gj8Ase5h4h5i3OQUOdQTMgd49OKIDZbnK6br
	l8aH9ZlQp3sSWzqKGpNoExREColgT5BVwyo6Bq2gUE2Qgn1kZUE9Nlq/WIhzWc/SrQLg6JG55f5QE
	Zjgdi1nVS9aAtQj8HJ8FIwUBgAqQCGPETnrCm3LmrlG/k5dL0R6AnUpWqVN6nD2R7BMnknuS2PIeE
	OxhQVrCf4YXrjRbI5O6XvL4sgDBZoDV0u8mY406ibB72kUBOMWJZtJC8gGoxN67znUb/yp4BNtfqz
	oAOGPIhRu4eTVEXCjJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iDs-003DUh-Ht; Mon, 13 Jun 2022 11:27:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i77-0039y6-Eh
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 11:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655119209; x=1686655209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Py8zRXdzOiFvbMocJpc5Z5DwAynLOWkd9TOuzKCbQu8=;
  b=UZJ0i+gkkz+TnX+UAPlBkQ/8xiB7ovrYkvTn9wR5jYfW5RYFFvwRu6D4
   GUa/xRVHnWzeTIOVRgOeTPqoYygVTXQ1D8ip8OBZhmtyTqW4tZmKoXEDc
   oJ+dlAOzmwxvUaQiL+h1r4D552ITLRSv+FnlDxM3iX6Nevb05fB4b336D
   lwVVfa6AZ7JRboZGhyM9kBuqwCAV8HhOrSpyiN3RqJrL544UkG1+z2A4K
   6NrafmpgYHHWt1VZDjCck/agVJsLH9i9Daj/sXYoCXizOcTWpnT3xYr/m
   g9FDbKc7kK8GUO5LPaexfL1ds9d7pCcVf0tQkpEoMllVaTeldbLGeS4wN
   A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="163066307"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2022 04:20:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Jun 2022 04:20:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 13 Jun 2022 04:20:04 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Mon, 13 Jun 2022 12:18:00 +0100
Message-ID: <20220613111759.1550578-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613111759.1550578-1-conor.dooley@microchip.com>
References: <20220613111759.1550578-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_042009_597939_8D43FA84 
X-CRM114-Status: UNSURE (   7.28  )
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

Add the newly introduced pwm driver to the existing PolarFire SoC entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1b4b77daa5f..d0b39fa4f309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17091,6 +17091,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
