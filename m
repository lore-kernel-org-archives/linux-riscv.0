Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C693DC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dY8GEqs7RFoTEtxdGVqUQ3vpjA3UO3qnBw+Mso6liW0=; b=fsjyAbdEIYw+ff
	RwlCQa6ZhLOtYvGn4TXXVJhBu8gNkEb+t9uOSUVeXYyoz9Ovyt48PlX80VB+TPs1bOMoUl47k1EJx
	raQ0YbikmT+4okeke37zA/dXFXCnmPx3U4EeQPy4sqStcNtgxrVR+MpnPCqZIKI2hxQ/ZqaLy67Y0
	jgkqIA4F2Hyk+0UH5drdXMLfdfrvg5gPcyWrB6lpWD4SfpL4HalCnlfMMu0wSlvSh5wbROZKWsl23
	NDi1at9sCofRKwWxx0iUaQiAvvv1hUl3GAbBDfg3lZdqR1rADfS6Rlj/DFoDxDb1e5RZSRwZNIaw6
	tOcGOpB1aUBtwo5vGHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odubg-003ZzS-Am; Thu, 29 Sep 2022 14:33:44 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odubb-003Zqg-9g
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:33:42 +0000
X-QQ-mid: bizesmtp84t1664461956td7juhb5
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Sep 2022 22:32:34 +0800 (CST)
X-QQ-SSF: 01000000002000201000B00A0000000
X-QQ-FEAT: Mxc3K7F63kyyWiQ/c8gCwhtJ1DS2YJuLU+aiWy+m3Y1tJkbqYk2wOc4QwNoyC
	9bXGKXrGKQuvi+/y8R1BOk2166YEp7ysra5hy/3sB4CcxVCn3CfBGgw4iNBgTdygOwQ61il
	o24Cmsov4rvvRLt2pZay/2ZkWs3o3lwKRKoS+5BLzkVntSz1urBWUlMbSnF4TOvlwJbQnXO
	1VClThiMUZrGb0ZNGT1c7k03ZKNfyXFJOMTq/A4mEaQiTfKSNg0GhHlo7uhJxBvsgb0azSU
	m36FNSaIAHxOeNNbdRsPzzMK1YWzSBhoW8EJuqqqYz4Ux3A6cFzVDnQ55/dzNeT6TzC14YQ
	fhS6wgeQcLW430Zq6AHYjnaHBtYhRicV/gA8rEwWbmAAf1XXLmWQCD8UtIa+BGKhUhEjqQG
	Yx5d+4dCT4y0gScP5kK7wQ==
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
Subject: [PATCH v1 01/30] dt-bindings: riscv: Add StarFive JH7110 bindings
Date: Thu, 29 Sep 2022 22:31:56 +0800
Message-Id: <20220929143225.17907-2-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073339_816386_41EF5BDE 
X-CRM114-Status: UNSURE (   7.59  )
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

Add device tree bindings for the StarFive JH7110 RISC-V SoC and the
VisionFive2 board for it.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 5b36243fd674..543be573921d 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -21,6 +21,9 @@ properties:
       - items:
           - const: beagle,beaglev-starlight-jh7100-r0
           - const: starfive,jh7100
+      - items:
+          - const: starfive,visionfive-v2
+          - const: starfive,jh7110
 
 additionalProperties: true
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
