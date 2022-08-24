Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E642C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 09:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WVdj1+49aRefkVg+FOjcatQPM1Vbw6bQgavYFnr+YE=; b=qtLc80a7GftGxn
	n8HxtLgdVZZ/HfFt9RLb/9sE+c4AVKCNlFfQJS48k6gaQVlM0P6GsN43m0HS2+Y54rY3kZsi+aqrJ
	93v7UuQWPeR/ZgQ6G/yiY8mlPmeQg0IJ03+uhox2XO/lOD+Vw2Q6Lzcsfvbcu3M2CtKv/1Iaztt6y
	pAlqDt4nTb/9AumTYDclk4wG6IWDVVogPMxc6iGn2FCPL3HQes6qvdfyPQoEOnosNhcTzbJvT8cIp
	+zPWYjMUC5pxlXYbZkzg9TZ2ZG316TZmIVEFpA1ahcmVx+QMht4Q1EFLwIaT1uS8QP2sF9rCBR6Lt
	ACKjs2Jj7eRkVVPMk8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmRO-00BgJt-26; Wed, 24 Aug 2022 09:12:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmRK-00BgHV-BV
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 09:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661332366; x=1692868366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EW5WWQcuhe1n/gF8QxR46HQULYTGKaa7UvnqyPxMU0w=;
  b=TtV4kefpUpA/qRxoEBNUSNSaTGqUH0hE2CpPOHkyl4Uqoskhoftn/78D
   AuunvfUxyyF4lygU2JSuLJ4dY/RYTKuxgBeafqLHjjLq5ehDHDJR9nR52
   y+XPu7eP8AhtSZUSBLg/THW1XUR+acdGMtW/qFEjvthk2csOxweJZUKz2
   iMT3AtrQ133dkH3Qbv2Wx1EKYNwJGObJOQD+m9lT7aWoFXkhj/1hai65G
   oCt9e6sO0L9mMupHg08Uer/eftxEjVpVyRAw/ITUtuKthuWWbHNXfWRCJ
   x+bLi1OKF8RHbBW577WhQEpRN1rXQONH6DGIXiwuQAPQcyAkd9s70a1x3
   A==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="177669398"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 02:12:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 02:12:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 02:12:43 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v10 4/4] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Wed, 24 Aug 2022 10:12:15 +0100
Message-ID: <20220824091215.141577-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220824091215.141577-1-conor.dooley@microchip.com>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_021246_423042_EF7159ED 
X-CRM114-Status: UNSURE (   7.75  )
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
index 8a5012ba6ff9..5db66c743595 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17532,6 +17532,7 @@ F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
 F:	drivers/spi/spi-microchip-core.c
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
