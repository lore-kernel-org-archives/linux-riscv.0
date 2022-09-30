Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069F7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 05:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIYh9dbmtSFSMbn7AtdIqTtqVqustMwiIHdkiTemao4=; b=V71BGYlYLXotA0
	uqG7M7THtPxnzMXyQQ8ERDtbMfw5hKTrGKZXzbTNrKhayR4X7c7nspSHT1Zj6ZXwd0IJc0NqOC+/R
	UgiulkfAG8Cz0JSA/Mk98FQYTcxIw7/ERb6CUhvb4dRYmY9eQt0e/NMpBWOJuoyA++vpDQQpf5oj/
	DoZSQPMs6xDM1dFIm0MrhUC3jt5PaQKAAEOn/xe5d3/ohbyxarr7/lJplRnE4Jgu/0wXp41pnISxd
	Hkw6cfbKIwmsWluvE9iAP4TrX7dm9+awiF2vWWU1xhxtqIAbz5EfQoJsIBBr0Ub+ffUPcM8JdBhhl
	7ITfalervQfFqsQ7WFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe8um-007O0J-N2; Fri, 30 Sep 2022 05:50:24 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe8uj-007NxT-1R
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 05:50:23 +0000
X-QQ-mid: bizesmtp77t1664516986tn7ksjcj
Received: from ubuntu.localdomain ( [113.72.146.201])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 13:49:44 +0800 (CST)
X-QQ-SSF: 01000000000000305000000A0000000
X-QQ-FEAT: dcYQFNbI8vE+qoAKv14uwKmwB+isk8Bi6JVRmSKueWlrbNKei9wcurdjin6Tn
	ISnvD+5g9odJ/SFlZ9pw09fv28J0oBeNBSVRCfuaKL1mV6mRbii1yGlUcb9B/7RfhsML+mj
	7GctJjx3b7sZO7Iy8vqrjtmqKubrulGoleILQdZR5rou94ZixVsRHw9LTe3YJe2LwYh2Mqt
	YAiLWksFg7y9X48cPV5uzTElKD5tFUAgUz/PmsfQOl/5yLCw7kYet8Lo5YHAcohxqFfwIOq
	W88ZezD9JDAiM65D7SCBuggVgAtOie96KFN8Vu9Z0Vom7GIwEIt9hh6bIEj4DZmYRWIPvrK
	r71o2PirKRT+HLVU+1YqZX0o5PGejkix77qyZeEQi2IZ/ZKlSoSWPhD/zh92J7HSgtABMHB
	22Xyd2iVRJs1zKEXfTSoRA==
X-QQ-GoodBg: 0
From: Hal Feng <hal.feng@linux.starfivetech.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 19/30] dt-bindings: clock: Add StarFive JH7110 always-on definitions
Date: Fri, 30 Sep 2022 13:49:43 +0800
Message-Id: <20220930054943.4744-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_225021_411190_18023B06 
X-CRM114-Status: UNSURE (   9.49  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Emil Renner Berthing <kernel@esmil.dk>

Add all clock outputs for the StarFive JH7110 always-on clock generator.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 .../dt-bindings/clock/starfive-jh7110-aon.h   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/clock/starfive-jh7110-aon.h

diff --git a/include/dt-bindings/clock/starfive-jh7110-aon.h b/include/dt-bindings/clock/starfive-jh7110-aon.h
new file mode 100644
index 000000000000..5f1f7f2f1533
--- /dev/null
+++ b/include/dt-bindings/clock/starfive-jh7110-aon.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright 2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_AON_H__
+#define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_AON_H__
+
+#define JH7110_AONCLK_OSC_DIV4			 0
+#define JH7110_AONCLK_APB_FUNC			 1
+#define JH7110_AONCLK_GMAC0_AHB			 2
+#define JH7110_AONCLK_GMAC0_AXI			 3
+#define JH7110_AONCLK_GMAC0_RMII_RTX		 4
+#define JH7110_AONCLK_GMAC0_TX			 5
+#define JH7110_AONCLK_GMAC0_TX_INV		 6
+#define JH7110_AONCLK_GMAC0_RX			 7
+#define JH7110_AONCLK_GMAC0_RX_INV		 8
+#define JH7110_AONCLK_OTPC_APB			 9
+#define JH7110_AONCLK_RTC_APB			10
+#define JH7110_AONCLK_RTC_INTERNAL		11
+#define JH7110_AONCLK_RTC_32K			12
+#define JH7110_AONCLK_RTC_CAL			13
+
+#define JH7110_AONCLK_END			14
+
+#endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_H__ */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
