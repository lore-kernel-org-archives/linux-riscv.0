Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEA7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:06:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D296115A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7D296115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quWM0mKe0SSvhgTa33HALEtv/LL6rm5TgQ5AWqQQipU=; b=QIF0uQctHOw93A
	epR01UDaCN+HT2M3cpjS2qmwmRtUktWhmzufhN2/q6NjdWQA34qoRWgDARNod+AyrbhKtPdl/pzYB
	EBe9gMKR7GXKoLpA5tK7ncSIDfhAAhyjozo8NswsIvbsVnJ7CfnWtKfAJaGOpnS7BMD0Kl3U4JPtw
	+FL4EAl31P88JQ1qzL2+fm8RdtejMaHb9ssyNQ/ishBm5O53xL40/sarkGuZbI0nZCgZvWKLmObq6
	qKyhz42i665R8sCNOfIeZAY7XRQmpHYB2L2SVHiFvBm8lS7BSRozPkzpljexluBXC90X7VACLjk08
	5h+mJ9mArpYTG74ehWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6ED-00Gm7b-H7; Mon, 08 Nov 2021 15:06:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6EB-00Gm6L-NY
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636383991; x=1667919991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7TY70StaNQYPEo0JEGXnyDaaE5FyFeTJVVklhVpDOHY=;
 b=lgUQBoOQUks1+prlWNgwNnYy4deDNQinwI6ZnzLJzwhxTEBp9He8pir6
 K/FurHtRtVLmtPqAqAWjFpIAuRYoipBaE0kkxvTLq7Ev4S1Ue9kz+TmlD
 QD2+dnfQsdG7V2gX4rtpfg1JksKZhPWTeI5Fgf6SUshNnEi1uYl709ucG
 8l+2tU0mpu5cu2GffZ0opft4/m2zuyUPcDl2lfDeZvNxBXGel7dni+P/s
 SMQ06b8P0QrYuLAOTRdQdDV7OWK5RXsEsA/VhQ9gIbzung4Etpg2Sw8bs
 I+AofXhy0TdKY7cvcHHcvVYfteK8/WUaN5gTGvCnKF1HcuJO7S23qWzj0 g==;
IronPort-SDR: Ntpp7n7MAYiBTQIALHMCUvFJeiU9D0S3cSUihj8H2Sa1PKofHXa5Gm6uzyYdUBtTVmZMiTI+Sm
 vRDvfd1ceVeyhMLRROFAT+SbZ16pWvUkc/6oIoCs9eQjuUWH5X2drqxkHzS6kVLG6ohPaRsNSw
 NVJc/UVeOeX3slZ4M2Dn3UhYi4z7ff4vWlQeU+CvEYtEU63f5CDX3kUZi2ib0F77+olpUP7SzH
 Ympz8b39z6uxj37N56/MHAj3IfQLiUDBbdaUkAC8pnGE2EaUvJz88DKXK/+WPwpvYko+phXh7C
 xL3ENJMyKEdgW2jyYgfUm/mn
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="75727030"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:06:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:06:20 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 01/13] dt-bindings: interrupt-controller: create a header for
 RISC-V interrupts
Date: Mon, 8 Nov 2021 15:05:42 +0000
Message-ID: <20211108150554.4457-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070631_861369_3DDCF2E0 
X-CRM114-Status: GOOD (  10.22  )
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
