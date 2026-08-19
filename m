Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C035C5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jf022mWniVyWCt9KFXibztQJxtJaRsa3qJ9s2I2UIh4=; b=Y0OmbEB6+TO7BW
	BDQODsajGRtvPbhysyz53EFOCCi1EQp266Hat0Bww7upNXqiEj/RJLl6wee6WGXUTgBtL6oUBRhB7
	A9o33wiqyi00AIPJ9+xcLgHK6cYITpXYtgFN7qD8VIGl4xATv9pLxHPey3DUwx5tYXtbdy0YQep9e
	ZzGjMNcXJopEqVlwDLshm7Nd+gEX+f3b7175t9NtbEIoS+tgS0uvb9H6LJNKcKKwOx9OhqHRFbSJJ
	kVPDg9yy0Q4NFlP0puDpl0pwWBzNHR951uF8PDG2Wg4/6EWIvlCTpauDgE/gFdu+HjUNsxzIBH2Ul
	DZ/SIQuhjAjXwrraOKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcDp-00000009Msh-37RY;
	Wed, 19 Aug 2026 09:04:33 +0000
Received: from out28-124.mail.aliyun.com ([115.124.28.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcDj-00000009Mr0-3aEB
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 09:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bosc.ac.cn; s=default;
	t=1787130262; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=RTLG4bEHspGF2s893DBaZo0Vm/5PGntK4xYmGupeOBU=;
	b=GyNDmrZSWaspP5aeYYqMSPdaha+ihTV6oh04ozvWNB29q/YKYpzPETbKRvhtc/Mot8ClaYIcSXmXwBL95NQ23rkZy/0HwsXKEIdi3et3ZnCOlL7LXQj2zrTKy3wTuVgm/dySt8VMposxbfc7lHYF9/Cdw9qnWwmL5HoNbzenjlbnIoOLw15KXFhXclh3MHQt9FmoP543/6C1XhRCEjSrCPETRhcORErMTZgaQQdwYphUSoL7EEROcJzdp+w5R/vymXCjW7TfLHxurt8tiVUUfhLYnrqNUn7M54ZKA6ineDdYzb7cC7E6hTjQjQWqsnOC/weSTRynOSLU3xDwjGPhCQ==
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07881055|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0516398-0.00709156-0.941269;FP=8747108671987209650|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033022149254;MF=guoyaxing@bosc.ac.cn;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.ir5uWtc_1787130254;
Received: from guoyaxing..(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.ir5uWtc_1787130254 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 17:04:21 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	inux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	yangyinglu@bosc.ac.cn,
	yangyinglu <yangyinglu@bosc.cn>
Subject: [PATCH] dt-bindings: riscv: firmware: Add OpenSBI configuration binding
Date: Wed, 19 Aug 2026 17:04:11 +0800
Message-ID: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_020428_365740_68C87BBE 
X-CRM114-Status: GOOD (  13.31  )
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

From: yangyinglu <yangyinglu@bosc.cn>

Add a Devicetree binding for OpenSBI configuration data in the
chosen node, including the cold-boot-harts property.

OpenSBI supports describing certain Generic Platform configurations in
the device tree passed by the previous boot stage. The OpenSBI source
tree documents the `opensbi,config` node and provides the corresponding
device tree parsing flow.

The `/chosen/opensbi-config` node can be used to configure OpenSBI,
including the set of harts permitted to perform a cold boot through the
`cold-boot-harts` property. OpenSBI parses this node during the boot
phase and removes it from the device tree after cold boot.

Add the Devicetree binding for this OpenSBI configuration node to
document the supported `compatible` and `cold-boot-harts` properties.

Signed-off-by: yangyinglu <yangyinglu@bosc.cn>
---
 .../bindings/firmware/opensbi,config.yaml     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/opensbi,config.yaml

diff --git a/Documentation/devicetree/bindings/firmware/opensbi,config.yaml b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
new file mode 100644
index 000000000000..86b1e1e673a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/opensbi,config.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OpenSBI Firmware Configuration
+
+maintainers:
+
+description: |
+  OpenSBI configuration data passed in the chosen node.
+
+properties:
+  compatible:
+    const: opensbi,config
+
+  cold-boot-harts:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of hart CPU nodes selected as cold boot harts by OpenSBI.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        chosen {
+            opensbi-config {
+                compatible = "opensbi,config";
+                cold-boot-harts = <&cpu0>;
+            };
+        };
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
