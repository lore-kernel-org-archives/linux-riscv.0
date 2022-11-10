Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13903C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuBMiCHBugvowcFa+18SzvqhMKb2iTEN4Q6sdQOZzeY=; b=E/W1Jf7HTgmOdw
	zP/EE7c46HQRcJNwH9QmXE6olc+WxKXN3DDoOg6ebgiVDI7WroMtULrZ/Xx5hPi6r4Nq8IesY8ReZ
	XKTyH4mqAQcGFy9FL0fBaDeuAqeZ5bUPc+t4uSCDOdJrCnhNTLiAO1Xs8L5RPcZm/7Bs4tYhUhCFZ
	oFsPdbzP83r1kr+6U6P28lkAUGdxvuw67EPSqnSgrbSYsYE0ycihtozseB1pLMG61+Y46lOtzAkXE
	/4y/SCgL9xDNBr6rT/DQor1tiWbfEkAXSTYHFyBhpQ4158RlgPWs3QESPc3Tg74VK/kuT3/9eAGN1
	nKRx4mEXwoNFPRDFfvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3yf-004gCu-I1; Thu, 10 Nov 2022 09:36:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3yc-004gBY-8P
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 09:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668072961; x=1699608961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vYQoUtzSDPk2WcXLT3JCi/n78RrjB4M9CkRLyymOzi4=;
  b=ULDZ5OwwG+uD9Av4Mxve2bVq5AOOVOCO5kYF6+DEZr4Yuxr76PKXrkpx
   rm5V5qogYCGSE/GcG6j2ZHjMiS95jsYwDExpfgZrfBUzLfpuld+HQCFJc
   rVdBuqfSujGXfdzIAaBCdYbvMcGKICzJcHBRSQoQi5cCZXsyj174AVKKT
   hvrRDterozChB303Bb74ATNjSnyIlQJKf7yXhGugCFfY3OKLFu6G58q4O
   /hUQYWmt9jH+MLPYQu3SNmYdolI91n7vpfxlJ5nCZwRvYGfAG1T6qPqOT
   sAaHYJOBlghXv5jJmusQE2wO/ghOqwRZX5rEVdFv5q8xQAnWFBjs18U5J
   w==;
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="188462040"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2022 02:35:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 10 Nov 2022 02:35:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 10 Nov 2022 02:35:54 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v12 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Thu, 10 Nov 2022 09:35:13 +0000
Message-ID: <20221110093512.333881-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221110093512.333881-1-conor.dooley@microchip.com>
References: <20221110093512.333881-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_013602_322805_D95B1893 
X-CRM114-Status: UNSURE (   6.31  )
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
index cea9e81ea5a4..982d3e0deac4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17786,6 +17786,7 @@ F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/i2c/busses/i2c-microchip-core.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
