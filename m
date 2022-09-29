Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58E1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+FrmEh5XuD/qkMbCMpDOp1q2nYOQivmzIyXa6V6tlE=; b=3a8zEVkHPT+ure
	khMgGyHH3P+ky3ys7RQa1O8EKprKkbJbIYJe0bTn1gaZ6ejGJN1DsDN1cKlUh/ggo/fXFbp+U9RMC
	KLKpr/Oi7rpqE0iqRFCRw6wWTuORafZNBakvG4+gO/93DxriXZHz1RVeUA/1JvENNaRi9sNCR19Sx
	Uz2ureRt5iOzvfd+lYaOLGLt2OvzkbTaXeh6H91mdCUDFVNyqzXTi2UkOTFvxqIruFjEQYbsC+kZO
	TMESkPZS26TRm/NflCPq2ZZ8DZEcP8/MHKvhPCfyWD5NAtFqloI/wHgPHWQnH61g3oHDJaEfMfnZx
	gOlTlXUy87N0lLM9D57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odubk-003a15-9q; Thu, 29 Sep 2022 14:33:48 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oduba-003Zq0-KY
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:33:43 +0000
X-QQ-mid: bizesmtp84t1664461960tom9azgc
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Sep 2022 22:32:38 +0800 (CST)
X-QQ-SSF: 01000000002000201000B00A0000000
X-QQ-FEAT: D6RqbDSxuq4U0+4EPbhlMjbtgIHEmuIGrzAaZUV6P9r6ULT3ZXcYmfPkM7kLO
	tBLQOMC8PMUU56VMKQOiMxHeN9VBI/RvAQs9VVbFXGv3lrEVcKX3LTtljDm4ynytHSwHqs7
	IX+cDEieJ0sZzxp7ls2POaOH6vjec26x9BYYYtomP+zcVQQKje0Qmth/sFpONH6rLx4aRvC
	+y7PlGtVz5/ARbDdaCeQeXir0ovYVGRyyRet/C2HxvOlkjl/QheEHbRSEAcxAkCltpPK4Ur
	m0n5te34lTwwTWA+kHRCGIJP+SdRrmfGTnKe0DDh5lhVgdrLJBC7ThZNaNXNZLRtIwxGXVh
	uOxYC8lsqfPf7eDftNwYZ6+J9MzLsqp1QZYjOmU8pwPvMBNvHIlPHE3LIyh6gDnibW++45W
	Rv6JzftgGvNT3wHWmu/M5A==
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
Subject: [PATCH v1 02/30] dt-bindings: timer: Add StarFive JH7110 clint
Date: Thu, 29 Sep 2022 22:31:57 +0800
Message-Id: <20220929143225.17907-3-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073339_176138_DCD5DFC6 
X-CRM114-Status: UNSURE (   7.40  )
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

Add compatible string for the StarFive JH7110 clint.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index e64f46339079..f85e4982ad05 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - sifive,fu540-c000-clint
           - starfive,jh7100-clint
+          - starfive,jh7110-clint
           - canaan,k210-clint
       - const: sifive,clint0
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
