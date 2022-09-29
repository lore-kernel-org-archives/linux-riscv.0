Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D88C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lC8Mo2HeEDfQjC1TsE/V/8sxXMEQPgbgDGdjEoZAz6g=; b=FfQum+xf/PCzBR
	6oFUwTh1WA7DIm5mgS389LxYfoBLPmyr0Hr+jnkZvdEZYBFG/4/KVJfAsPyI5VwtUC3ruxYBrPFAa
	i5VeEabnCS2ivxk2HhgegQpSyhfpMBE2fxjawpU3qtFk9wnlyZjtHnoYPZ54jAFrr6/S1rCcF2Ene
	qHvY4jrsE2Bb7BPJhPens75DMs2X9Y8QFgHSAbzom5K5a7f6iI/pesE1G6qDVaRkAIH6XEZV1W9Do
	AG8JrtinSbGAvBmm05SNk9NLsQYcoax6WKkC9rp3PxDjlw9kU/iN5LASManUIgYevrIFeD6sYLFYl
	1YGhUHi9fzu0wcqVaaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odube-003ZyZ-Or; Thu, 29 Sep 2022 14:33:42 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oduba-003Zq1-Fj
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:33:41 +0000
X-QQ-mid: bizesmtp84t1664461963tizqyjas
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Sep 2022 22:32:42 +0800 (CST)
X-QQ-SSF: 01000000002000201000B00A0000000
X-QQ-FEAT: +e7paLVVZUnbG35v+gPFnODE0sLRRis8MBeSEghj/OHzSpUygmlF89K3tDL82
	9OW+vkt0iRIRPYWFbHdTx+nD8RFoO4CbzIjWaLRaCuNlPJakkUKzMoeOQW4hBfGIuXScvGw
	w0Iz7di3FY67/4F/zaqgILgZMYdLQ9q00xXvkrqWgbUGrgyiQ4biufWDHRxuSrHVMVB9h5B
	QnhrGhnVgEU9BmZ+m9pSdzcYzxHHAKN+ZzGJ4FKCOOd+UfT4LewSstFeO0mNai8ZZ9sikLd
	wXK9ddtR8fyQZoUAUPJhT5jQqlKq9nFAa20FEtKc2ESdAzlBtSEGRTPHNpT90ymOAX5winP
	NYEyoIoJhGk/vnJiMcSSIGgfY3DcGegMLst8k3dW9i11a5CSUqFzBAilWiFjZav0ETpqyv8
	GmX6km3DSp+um7XgiZTAQw==
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
Subject: [PATCH v1 03/30] dt-bindings: interrupt-controller: Add StarFive JH7110 plic
Date: Thu, 29 Sep 2022 22:31:58 +0800
Message-Id: <20220929143225.17907-4-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073339_049974_DA5FF849 
X-CRM114-Status: UNSURE (   6.94  )
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

Add compatible string for StarFive JH7110 plic.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 92e0f8c3eff2..cef0451c3a47 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -60,6 +60,7 @@ properties:
           - enum:
               - sifive,fu540-c000-plic
               - starfive,jh7100-plic
+              - starfive,jh7110-plic
               - canaan,k210-plic
           - const: sifive,plic-1.0.0
       - items:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
