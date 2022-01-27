Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8174C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+NqRdIeC1F6p3ATBV77/Urv+c5priLKKbw4XftNopQ=; b=SAHiSbrHOgLNOV
	fBhk3eFR87TOkhxR0q6ZXNB0F1YYaq57WZpvGw4ZUDW0Z38JsyLj7kRpX82vVsCcyzqinUxpX7IfH
	LYla8otTYHiIsROkajLq9JkVzCM8zc40a30MZhmIP6EpDOIpWhkOTEoF2K2Z+0aQHnJTcqo+8LlAm
	afdaPiUlXIleoGJIFTiw2H2T69sghO/Szjn/7EMkB2tRUrd4qsA8b+2VjbjfONzv4mYFopd4GtUjZ
	DpyUTU4SGEL3hPAIkc/SCSisnsrjd/YLdMohoviaTtpKzlWNNYU6dc7DrnRAyUeqfpB9bHPVgoh54
	89d7PRz4XCDYAF4oq3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Wo-00GCQ7-Uo; Thu, 27 Jan 2022 15:17:38 +0000
Received: from out28-4.mail.aliyun.com ([115.124.28.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WQ-00GC3E-2D
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:16 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5576189|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0234192-0.00181788-0.974763;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85P.G_1643296629; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85P.G_1643296629)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:10 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 08/12] dt-bindings: riscv: add binding for Nuclei platform
 boards
Date: Thu, 27 Jan 2022 23:16:43 +0800
Message-Id: <20220127151647.2375449-9-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071714_791755_52B456CD 
X-CRM114-Status: UNSURE (   9.62  )
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

As we added support for RISC-V SoCs from Nuclei, add device tree binding
for the currently supported board-bitstream combo (DemoSoC with UX600 on
DDR200T board).

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 .../devicetree/bindings/riscv/nuclei.yaml     | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/nuclei.yaml

diff --git a/Documentation/devicetree/bindings/riscv/nuclei.yaml b/Documentation/devicetree/bindings/riscv/nuclei.yaml
new file mode 100644
index 000000000000..4760568c7bde
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/nuclei.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/nuclei.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuclei SoC-based boards
+
+maintainers:
+  - Icenowy Zheng <icenowy@nucleisys.com>
+
+description:
+  Nuclei SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: nuclei,demosoc-ux600-ddr200t
+          - const: nuclei,demosoc-ux600
+          - const: nuclei,demosoc
+
+additionalProperties: true
+
+...
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
