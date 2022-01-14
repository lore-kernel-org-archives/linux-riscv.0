Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33440C2BA4C
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIIJIGtIVNbyifWqL4WRiDH7Js21j5EOADZ7uOpLj7s=; b=WxuBcMR/tCCZmU
	6eGLSI114zOGiPfHm70YuJ6OUBEQieH8/FhNcaWw04AVqTB36Itvs4SXVIU1LDKNVvUL50AFLsq6m
	gugM3N7QnWV2w3jsi1GSiHER/v/vSRkH0dMa5V0yVpU4M3Eos73pB6zrQoWlmooTpz1A85Vx3FwQt
	qhNlXcvfZ4R/1Wffrw3ZpRfIaXrcnk506qEJ/f0TFKJ2OAGvrTQBSL86kxlD4gR/miMow//NtwCFV
	ltI21wYlgIqz9t41+BFQGB2unFrg0awCoe8yFcLReCTNVqSbk26sw+C8gwKkIGHiu0/xH97cOWwjr
	1Hx0fbNyrqDjxAIOaA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8OLM-009Z0p-0s; Fri, 14 Jan 2022 15:18:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8OLJ-009Yya-Bf
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 15:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642173497; x=1673709497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=raOPInPiNpoFYNkwMgusjdwrbKTRJG+aT7u9K7/NxHA=;
 b=gPxIQ9NE9Q2L2/TckQMPVAJTxdlePIeLqS84z/5QPH6sHfgEqz1KzVXC
 4ZIrqSk7/apcKiFYrMVe6zhZa9WeW5mdOum6O7gv09b+bJOnSk4PRnDKh
 wK3ej4E/JHBJCBPW4ZUJQdf1D/t9af4PXgpICKSEInyENHjc1ydUi3eU0
 ZnA/taSOPnW19CJ1AxA+K2Lu1qV3vruDnxl4AjlnFHbebL5f1RHwfViXr
 NptbQXlRD+Fw5VjghfrTKQ9bInQcJwxOx2MxCYqFgaTIxIQqZmTHAJZ32
 rFxoL9aB4DTw6DR2LJLGNVCS95dIvgi4JiJ/CoeEAbybi36KhdIKEmtoH A==;
IronPort-SDR: PX/LMa5zroMvcheRMvJmmSuZSQ4sURh5136X1G6xQgzxW+k26UjOZuRymXExNiqT9MCt5VX4W+
 AITDwg3MLwbCnItLQFpO/R+A9JMURhbkHUw4cDD1w20+qK621kaXO0imVRuudpe0ht0LdeslGR
 H7JI6VySU4LTBFkJHiDczDH8KiRWEiUTurnx64EtRNyL9r54En3q5d1QEP//8ZqwWLLUL+sIR7
 NZ7YeM+nd/fNB4GkOb7mogKwvEwd1Jar8nxRkLZsMPBPHcRqvwC284lX5xB2ew4f4wryjeHDUC
 PQhuzBuwhVlxjnPA0qPqREqZ
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="142730993"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jan 2022 08:18:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:18:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 14 Jan 2022 08:18:07 -0700
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
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v3 15/15] MAINTAINERS: update riscv/microchip entry
Date: Fri, 14 Jan 2022 15:17:27 +0000
Message-ID: <20220114151727.2319915-16-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_071817_507126_3B9BB99F 
X-CRM114-Status: UNSURE (   6.56  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Update the RISC-V/Microchip entry by adding the microchip dts
directory and myself as maintainer

Reviewed-by: Lewis Hanly <lewis.hanly@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345ce8521..3b1d6be7bd56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16348,8 +16348,10 @@ K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
 M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
