Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E76CC7EE26
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFbsdiW/1cyOMia5xw5lAc0FbRgrscuUyDquLRpkRiE=; b=iRlr2yMn8lIqHd
	wh3ClQnoOQ7NBAFUl7VBdm1uMVo3LS5jfEIthqFcAcX+2bxzJbICrbrXj15FxdrnZjpvsqxV4VK7e
	OAQ3u8TDiWSFIsDKCqkLqqsXDPrAG6FK9SX9jlPUy9qRzfRbdlE9XMxjLa4WINbY0vlEqoQJE+igi
	L1DylSvUf3b7NM9UPpKNf16nSqsLtXTCGi/1zlkn/BBkc39FzMyqU8BTpBt61eD/w5cc9YYe0qTEb
	TjjiAstp25nacU4DvGOZgrac+QY5Mp9xQ2dAyP7T8tmak8MBP6icZ5Ok0p18YjKE/ubH/x96uehDD
	y1v2PmQ6ewIcKxY7ja2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCu-00HYnj-29;
	Sun, 14 May 2023 17:08:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCr-00HYmi-2T
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 17:08:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 598B060EFB;
	Sun, 14 May 2023 17:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8238DC433A1;
	Sun, 14 May 2023 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684084104;
	bh=nU59cXNxIxg1xRf83ZxNAjnBWCbOsi5G1w81Y+YE8yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Meb4Y+On006rm678MW9DN64znWuDr1LMYi1YqQAn6ojS/MTd919WahW9qrt7E1ia3
	 0VajTyDOXUhATVqtiDNJ3nRIpTtYVEggVRnriuS0gmtRAsYjk65eYKufGKamsCUgFN
	 uiASwoMfd27S6cQNeGVh1OW2zrtW7oPc2A8cqwjROzuAVJJ3Yn4xhZ9XPiBBQ2zN+z
	 Wx264H/zdGkZrBAlip9e6SEAnZuppZ3B21NwH5YZb9oNzVTbccdl6qpP6VoD5KB6oC
	 QCCqg6v78Xba1zrFulToJyY4u/2lEttKCWhs4rFB4o2F8tNqQ5cbf5MkclxDrP9rXQ
	 mXR8XtWVmqdWA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 06/10] dt-bindings: riscv: Add bouffalolab bl808 board compatibles
Date: Mon, 15 May 2023 00:56:47 +0800
Message-Id: <20230514165651.2199-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230514165651.2199-1-jszhang@kernel.org>
References: <20230514165651.2199-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_100825_840992_D8BD8C2B 
X-CRM114-Status: GOOD (  11.64  )
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

Several SoMs and boards are available that feature the Bouffalolab
bl808 SoC. Document the compatible strings.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../bindings/riscv/bouffalolab.yaml           | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml

diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
new file mode 100644
index 000000000000..3b25d1a5d04a
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab Technology SoC-based boards
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description:
+  Bouffalo Lab Technology SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Carrier boards for the Sipeed M1s SoM
+        items:
+          - enum:
+              - sipeed,m1s-dock
+          - const: sipeed,m1s
+          - const: bouffalolab,bl808
+
+additionalProperties: true
+
+...
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
