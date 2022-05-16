Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC78C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 08:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brBtSKTtjMn7z1ArhF33ewArpQGhXSLdo55Yb5c3e20=; b=ZREodctVKcr83S
	eBY5DiuNcbCgltgK5vhgOPDO6FHWQM6rUl7a/Co17nh+x1uMjUn5/eVxGgCFbR7kZ9mMWIGvvGqPi
	mg4FnwZXBuOgDjvgsh+yrM/CggNOnmU3yUU6AZv42cqe9yquKDHXITyExfefZzsxffwWSSJRGwGDv
	jcRjg9MW0+dAjP0TXrEdH+1Rv3HBe+0pddaW40JcsbTA2stpPN6Gu4PBN+6O2u0NcwpqlDrSaCBEn
	ZIk8XEZJNGcVcVVDKnGfKn1su9Xtu289Fk3Fsy5e7+cyZuJr/ndowE3bCyOUjNOTkbmYYS7SwNlsA
	inTqcXs428dFpU1J/hAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqW7n-006etn-Ga; Mon, 16 May 2022 08:30:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqW7e-006epi-8A
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 08:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652689833; x=1684225833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8pp90tvf8kTP0zWhyfPDbb/zxfLJMKZ53ILcrsvHuto=;
 b=I5NUd0TQkijsu0RTkSOJDx6OSz2vFXxH2RYWUTYsDAmRTFSRlArP7GiT
 TDhBprN08n81pbuUEYp/Zc2OtrnyPRYWk+wVdppBifGEubb/KSTYZgoGs
 U3PlORWTi7ddyVpeEEn3yQC6uvFGgNu1Jg/O3Knipen13eO8p548UqkZ0
 4BJFYZdF6/Ur/p/x2lwnzG7WN1V2kTBNva8WwATvUnq+PbRll2ixDB4rk
 4VNh+Q8SJMNR2l0zg/3XaWu0axcHwPbet8R3P6900kySIYXQXzNcasnfu
 ObDFOAEVrPSPRLk3WT/Vy40fewGkZBDyenYOGPSdPWelKxdBOnBJykXvz w==;
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="173511782"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 May 2022 01:30:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 16 May 2022 01:30:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 16 May 2022 01:30:31 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 2/2] MAINTAINERS: add PolarFire SoC's RTC
Date: Mon, 16 May 2022 09:28:39 +0100
Message-ID: <20220516082838.3717982-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516082838.3717982-1-conor.dooley@microchip.com>
References: <20220516082838.3717982-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_013034_336168_8CFEAE8E 
X-CRM114-Status: UNSURE (   7.16  )
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

Add an entry for PolarFire SoC's RTC drver to the existing support
for PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8c52d0192a6..625d735f6a24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16952,6 +16952,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
