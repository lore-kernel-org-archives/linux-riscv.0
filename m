Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84318C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNJiyUSPm1eMCGT4rEZM4ev+6iQGqJLtASiuG0uHg/k=; b=BsjL25+buEl/sX
	HITufIAipejjMtNtpUf59zwdUNTEkJFwnZYT/BT8PaKvU3AnNwbwvq411Q5uvSyP551/QR888B8wX
	zUUlLVuF7VMprJmYDU7M6soH0747puw03PpXsUBnjlSNkH02qSseU+4lfbS28xfkfMybLPcHaYdTs
	OERqYuSUG2qPXvoc+hmle8zene5+8NLX3WSa1Yc4C7VdlC7cgq1k8bPcIbv+SkWZqyxWbQC1/Jfe+
	Ufy7nr1K/tLaugjCo+xhdf0RUyTWnxCrEDxa2+P3lLahuhM1zJ1WWO0bzMalyJzxWuDTocKXWpAPQ
	WHXbdZT1174ETqPUo/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odubh-003a0B-Pv; Thu, 29 Sep 2022 14:33:45 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odubb-003Zrk-9Y
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:33:42 +0000
X-QQ-mid: bizesmtp84t1664461967tlxeozmi
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Sep 2022 22:32:46 +0800 (CST)
X-QQ-SSF: 01000000002000201000B00A0000000
X-QQ-FEAT: RFp2QSjOiS6rSVvirmoNsEVnXPjdjcrmOjO4alSyZJuuGn3m5l2mkkT2X4RnC
	CK462yAZBHaMBo1cztoX7M1ic/ZPFDAZtwN3zoQJikvOm1MvftwOBCjkzRJCYJojfjVtWDy
	3I6OkgH4ehb8nL2ssMUmX0FDiYXlq/m47tOaHaj48y8Sh4PPSXyplxH+eLdsUeSOT5Lr9eC
	3eeQnHobrfyTJ1LUb7lJa5F/1EbmCDssFwcK68137FL4tBq6MVRImxijrLdj6gv/FtWPcxU
	aKz74oQ/1ycNHXdrKCIlmUkLkGhZM6kI3H8S9QO4AcCzzwMW2XG5kyDtRZKhJqPSQ6gBAx0
	DbUpZM4zbxkLGHab9Bj41fN6fnj5GaZb2n2Hn7znxP/SFWsYu9UII52o3CCQJfzorZVcIeo
	YpcEB9CeQlEZByFFCMN8/g==
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
Subject: [PATCH v1 04/30] dt-bindings: sifive-l2-cache: Support StarFive JH71x0 SoCs
Date: Thu, 29 Sep 2022 22:31:59 +0800
Message-Id: <20220929143225.17907-5-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073339_810409_3BD03FB6 
X-CRM114-Status: UNSURE (   7.92  )
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

This cache controller is also used on the StarFive JH7100 and JH7110
SoCs.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index ca3b9be58058..ba29ecfd3a92 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -24,6 +24,8 @@ select:
         enum:
           - sifive,fu540-c000-ccache
           - sifive,fu740-c000-ccache
+          - starfive,jh7100-ccache
+          - starfive,jh7110-ccache
 
   required:
     - compatible
@@ -35,6 +37,8 @@ properties:
           - enum:
               - sifive,fu540-c000-ccache
               - sifive,fu740-c000-ccache
+              - starfive,jh7100-ccache
+              - starfive,jh7110-ccache
           - const: cache
       - items:
           - const: microchip,mpfs-ccache
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
