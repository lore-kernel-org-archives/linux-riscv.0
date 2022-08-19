Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF24C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 08:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WVdj1+49aRefkVg+FOjcatQPM1Vbw6bQgavYFnr+YE=; b=0FtX+cVdVwuQV5
	jBCjiXwE1jLJbd+uPdIO2RS8LdO5pynwMfvRTDNcOYrSkZpC0gjfLibHHYz8EXobgLWAX2K0xOFqA
	biNrvPDGFiOGqbbpj5iekq6+wfE00/8EzGU7Sz8vt9CEUk5qInT73izEtp5eRaQpwHtTwjVlfcGT1
	ggECImS/WRbo+0CzJyjOBemUnqKjB/wr83wqaE+JJ1jo0LASf2fLiCjNnvjOkMa6ArVBEibpbW8QD
	xJgnyJPvvwtd0KGbZ16ShOmVX3yGYBJgDEffDoYEV2Zg4uasWri3FpcegJ2gQVqUaUt8ETQaLxwoV
	yO/denU5yfU2nvC8m/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxpe-004Rtv-TJ; Fri, 19 Aug 2022 08:58:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxpZ-004RpW-OU
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 08:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660899497; x=1692435497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EW5WWQcuhe1n/gF8QxR46HQULYTGKaa7UvnqyPxMU0w=;
  b=nT9HbcO8SMvdLBPO438rdZ9w/A2bRikQbMGrmL6KVU3Psc+BrIiFq0Xl
   Jbl1jborM/F7ELPvIsTGa3hZi0Boihcs/BB2sD0p0HEpeKInJ3xpYzBk3
   wXEE6l7BhjKPn5lJRLKT5lr3aVhwIc1kiROuU22XjsgAFy3P3s5DtHF08
   /5LFN7D6AtfUL5Uelm38Za6Vwp55qW7WshwPcDuAXPI6CMAga3KwvLSKY
   2GdQZGVd+mVc6Kbo3FlAcFCL9Q3sS9AzYxzsnO9s3Knq4sfHNTymve5fh
   aEmYX9onE9lNCiqtmR1U0AeciHTDoAvTruE1IW81J6+Gi2w6f285iHbPr
   A==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="177049803"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 01:58:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 01:58:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 01:58:13 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v9 4/4] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Fri, 19 Aug 2022 09:57:04 +0100
Message-ID: <20220819085703.4161266-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819085703.4161266-1-conor.dooley@microchip.com>
References: <20220819085703.4161266-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_015817_820268_4A355DD7 
X-CRM114-Status: UNSURE (   7.02  )
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
