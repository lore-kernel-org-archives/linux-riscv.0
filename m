Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA26C77B78
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMs54uzWmxfu+9ohxGOYaBNREN/lbqG0LevVG/iJFts=; b=29QVSFlqGlyTsQ
	TwzxULUVA7U9Fbaoied4UEnx7cTzA+T1GiFlIG31F22jCd0pOu4CVPIxHLTRpKvNg4JbwX0r3U8Up
	OkT4XQGXxREWV6REWRAiBrWV/En2omSrkpVfVYNlLtDavCWxYd6TMOCCyi/oNCrfSsUxPLyt69XE4
	49ULrexXz22IEYnS218tUmKaTa8bHIaKWzj7rucmOBiH0+bXBpYjV/AxnI9VxaQnQB27mtGi97NF0
	IaD7ZfZaDWhW8tZkRQ477ew9vQOMA/8UpemyfyfJnKHShy2KUWYKKV/zPQ3w7KSK9HqfRInz/lmAH
	KFIoj9MhXFl8eDAbSaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppn3m-00AFXr-08;
	Fri, 21 Apr 2023 09:28:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppn3j-00AFSK-0H
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 09:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682069283; x=1713605283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gVYx9+DVF2GF+A4bANXLI3OWUXhLfRnRmzz023oqQG4=;
  b=qUu72ReGPf4GNZuaCVD9D9t4ktS2IZC7bjf6s8JO+s9WjtP7HC/R4kkh
   F8U82jFHFU8+NE8kEGFxXaZ+CuZQU0gxTa5YSs3WGkD5a+UrJvwxwXCkP
   FwitjnQBkaG0l4EscACiPMmGo2y5SJvit3a2EllYYK/n6BGFRAKFXSF+7
   pXwhjo9ADdYOcHZyosNwR/LFxq176W7oQ95yRsjaypmM7rJODkBveuAkG
   /ZXvYrteyLP8GZYo3J0eDrlLUOioS1Yx++0VkgHU+eVGd5IPN5RRPoLFS
   LyufR6HI1PQtH9Zm6yt94U15EInpk3Y/zNWj1Whbma4ud9ZCmf5ruI4WV
   g==;
X-IronPort-AV: E=Sophos;i="5.99,214,1677567600"; 
   d="scan'208";a="221946996"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Apr 2023 02:27:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 21 Apr 2023 02:27:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 21 Apr 2023 02:27:54 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v17 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Fri, 21 Apr 2023 10:27:10 +0100
Message-ID: <20230421-affix-atlas-156f7a5ab395@wendy>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230421-neurology-trapezoid-b4fa29923a23@wendy>
References: <20230421-neurology-trapezoid-b4fa29923a23@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=668; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gVYx9+DVF2GF+A4bANXLI3OWUXhLfRnRmzz023oqQG4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClOYW9+xi7/GLr6i4O79S45L9FEq8u7Jn0NK0iQ+MaU9O+I 77z/HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI0HRGhm8Zs6eUTn87/XXNZ5ENFk 4Rq3K3L1Td32Fs2DDZ10nm3GFGhhspbbq11Sb+K+f8KvzDplm5wjxD3mpxjn/xlLjy15dW8wEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_022803_145793_7B82ABFD 
X-CRM114-Status: UNSURE (   6.92  )
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
index 8d5bc223f305..128cc89a47d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17993,6 +17993,7 @@ F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/mpfs-sys-controller.c
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
