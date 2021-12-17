Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01526C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quWM0mKe0SSvhgTa33HALEtv/LL6rm5TgQ5AWqQQipU=; b=SeIrLnFJIHwozm
	tTLRVN7iRChcNkiRsP+1tCaHoH3FR1W0Iadr48rQUhSOt9U6LSzrZNJPNU8Jsj7f0eGRKITnzOSVE
	PkrxyS2vVzDeN3nat8QDG8vKpB35qtKVL5hycwZdNrz4RttLOZ/84GC9QrlCj6tXc6WQsNC27mixf
	qvjwH3CgzJ9uVsKrbnAIDt8fPMTVn5Xor/5lQ4ca4875wd7+txdL5qqYIuY93C9wiZYe6jxH1UsJ9
	947Edk4yFa0x0qPOHZJ2jb7bsa6YscCFqDeON9MX4e8T02UoA5MK1sAMMBkPau0br41GEKjNADk9d
	3sSn4OfRGIJ/oR6FGXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9al-009Abt-Fw; Fri, 17 Dec 2021 09:31:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9ai-009AZB-IB
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733512; x=1671269512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7TY70StaNQYPEo0JEGXnyDaaE5FyFeTJVVklhVpDOHY=;
 b=qo8+mxwjo3pm1NfyrT4wA9kUn550Bx3D0jfcJfxbMVa3dMyEb+KPQ3qn
 t20fnCTslPfaTOHKKKnhbuzaj6pWMXRNmhDWJwt/9Vt521oMMHY4VDmNH
 U5mt7BYL+d5QTr/B/UBz3JJu8mBvyTIP7+I7NT2kQA/JfGMv1z/biCe8X
 BHg8DIUBAcOrD+2K89cTUGktuv/9UYLE5YviONymFspqQ96re7jxuuVpZ
 2TB/RNtO3qhqDkkk7aPik8vdzGIcKRCSMcBA7wm947WtlWThUQPP6h+ci
 c0GPmrQrhwNmnqUDh3U1Gwnb3ixhjydYCNDHbTLxHDXiZ937cOPq21lrQ w==;
IronPort-SDR: yEuSiCpSGDtgAUAzw1+P+lfNAEOxQDfWqlxulRJlJt4TIRaEkDe+cqPe/u+Al57/rpe48664cD
 LM8PgTZ8LKYLT+jjodofacUJF+0MAtWD6MUjcHMJQy4o1WwBEB7ILWh/R3xYqs2DomzSuXhZ9H
 JdZHiQhYGtWEz7Jxc7OTQZauODMfrnE/blILCu2JKd5gRx6uv4VU5ijUF6vJ6PoZjMZTjJ1u5o
 zbysJSuPrUcgw1xlXfYdlmtI3wVZYH/rDEtamLwbi/NQ18VqX1zj5UgWqHs3DBjpGty1JFk8KN
 52KQlW5+GxaLXG2xIdqtR3V3
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="79895927"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:31:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:31:51 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:31:45 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atish.patra@wdc.com>
Subject: [PATCH v2 01/17] dt-bindings: interrupt-controller: create a header
 for RISC-V interrupts
Date: Fri, 17 Dec 2021 09:33:09 +0000
Message-ID: <20211217093325.30612-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013152_719207_0387D5BD 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Ivan Griffin <ivan.griffin@microchip.com>

Provide named identifiers for device tree for RISC-V interrupts.

Licensed under GPL and MIT, as this file may be useful to any OS that
uses device tree.

Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../interrupt-controller/riscv-hart.h         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h

diff --git a/include/dt-bindings/interrupt-controller/riscv-hart.h b/include/dt-bindings/interrupt-controller/riscv-hart.h
new file mode 100644
index 000000000000..e1c32f6090ac
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/riscv-hart.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2021 Microchip Technology Inc.  All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H
+
+#define HART_INT_U_SOFT   0
+#define HART_INT_S_SOFT   1
+#define HART_INT_M_SOFT   3
+#define HART_INT_U_TIMER  4
+#define HART_INT_S_TIMER  5
+#define HART_INT_M_TIMER  7
+#define HART_INT_U_EXT    8
+#define HART_INT_S_EXT    9
+#define HART_INT_M_EXT    11
+
+#endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H */
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
