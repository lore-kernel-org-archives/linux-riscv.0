Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D376C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyogOSAFaNH8aHQk7N2+mpyizEu0N3FJY2w5gEYG13g=; b=S5BgC+Ad4Y+c+G
	AmNc7hcwwT12oUkejziOS+pt3AFcd2qe7xy4L/daOCmPID6C5IeKPBTTEzeRN83rFh0Rm1iUTrzWu
	KPFn0mDtnZaN7N8lD8idzVcaH1YkHdHw5fyQpxq8jCKtn+xmObLr6PRKlFk2lq1CRJQ4QHiWEbYRa
	YhGsCjC+n0nv/g6pNpZQ4SjemWgvt1qyhjcwu3Am+3GAeKRGZB9XvJ0UXBG16Oboe5Mo7xnEFmo1T
	r5QJe4Ecb/Wrvvva3V72XtvoM5Dr9hscnQqp/TTUatDF1VRdO+Ls+4uaZivsVPOq6PWRMiTjC0MpW
	O7Dxv8ouR9K16uz8rGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pfu-0000000FcfO-0OE2;
	Tue, 14 May 2024 10:46:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pfr-0000000FcdN-0c7U
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 10:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715683583; x=1747219583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4slCxc3P8EDvVix44D3POLsDodsmYi4dyKslEAmSSbc=;
  b=Ts2LRsbEw1ejGLdPpaLjCCehXJ48iOmpG2n7hs7vR3nU+n5NGCC0Lm6P
   FTey8VRWTDI4Q5t6YY3zmTkrdmMkr8qLRLY695df00S6addtmj1vZDSx7
   r6DQYIsvikETbRV0XUh1xRhwze4nog9nPpVLqI1kvBANDh2ByT9L3fvPf
   UdQZsX7D+nhGLjqi8gieIGU92MyW91L9tBupJ3qzIez5DU1uH/8kivbXf
   uS3UXRuIuMI0s4i6xgQ+j4joHoCEZNU2lVrNQx+3viIYkjQtxP1ZwpJlN
   RPFxRcQ/CDZ3qvc3eqF7OsCdDFy3MqPD5fCoJfJN/ovu2xJHLNhdeQW1M
   w==;
X-CSE-ConnectionGUID: pbXPAEwqSv+MVNI86TSxeg==
X-CSE-MsgGUID: eHmYSOjGTcGSvJS2RCp+kg==
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="25223737"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 May 2024 03:46:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:44:59 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 03:44:57 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>,
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v2 2/3] spi: spi-microchip-core: Fix the number of chip selects supported
Date: Tue, 14 May 2024 11:45:07 +0100
Message-ID: <20240514104508.938448-3-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
References: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_034623_275294_45518671 
X-CRM114-Status: GOOD (  12.88  )
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

The SPI "hard" controller in PolarFire SoC has eight CS lines, but only
one CS line is wired. When the 'num-cs' property is not specified in
the device tree, the driver defaults to the MAX_CS value, which has
been fixed to 1 to match the hardware configuration; however, when the
'num-cs' property is explicitly defined in the device tree, it
overrides the default value.

Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 drivers/spi/spi-microchip-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 634364c7cfe6..c10de45aa472 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -21,7 +21,7 @@
 #include <linux/spi/spi.h>
 
 #define MAX_LEN				(0xffff)
-#define MAX_CS				(8)
+#define MAX_CS				(1)
 #define DEFAULT_FRAMESIZE		(8)
 #define FIFO_DEPTH			(32)
 #define CLK_GEN_MODE1_MAX		(255)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
