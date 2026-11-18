Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B5606A881
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QuAisLhX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=W3KJI4dt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:References:Date:Mime-Version
	:Message-Id:To:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pEd0nh0ODdpBgXQvfC3M/J4ArNEz0wXRfv0XiwlnwQQ=; b=QuAisLhX+DNKFdyUfwyptS0GWE
	zCMvhdfCMr+Vy9YNXDgGt+7iRf5N/3qlSYDLrE55wARyRF0AFWdEWk19mBu5C2u78xFHBseOX7uvJ
	BJji8j4YERMAzuBI+inN6Dow+zGEnOYJUTgSOJzf4pQPZOa38YEtI00VaPPGWKxWR6B4UagtHaMlg
	7crkFOhYjb9hUllw3syR7DqaZqm/3FjMWi4r/IurN0Lbz+uJikNh++G5yTgDkAgikRmh74ZdulrMm
	Vd0IdtYkmuK9NZtnYauk4x17t58VbtHVnFmkPulfvpx1zWUtXIT2VNuqHoFB8PW+OICrMZsG8+Wh9
	820jj2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUY-00000008Fcm-27nJ;
	Wed, 18 Nov 2026 08:58:10 +0000
Received: from va-2-56.ptr.blmpb.com ([209.127.231.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUS-00000008FaT-0JBW
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992279;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mejuaNi7Gw6EMtifS+cvih2W/toAxrfb+yYMr1OlBcE=;
 b=W3KJI4dt12NsUYzCAdgeohCA9vyFB/YXik/TdOlMOKiDjf8JfaoMKoM3YmvgJQY2JAJUSg
 brJ3Es/WE+/2mUQn45fWVcWpGLaNIGzw9qZ7QAPTx9tws8qanIBS8YChikDOzMLQkNWpir
 5qri5Q6bZuRGhSP8fJhOr9dsAtuJDpJhoJCDR56+nHyEo/efXbpUA/MLnpq9ZhFGcNTERL
 hA7BpGwynA5ZIQa5TlZN39Q7rVgzTeTmMVdRZOpdUm/jCs09vSSrOMV/xrH0+zMhXNB1LP
 rMqFM+EqJlX6br28FCmHvYfOwDOq8CyQ+2/v4t+3crzN3VtsEOnzr4IV9FnyDg==
From: "Wang Yang" <yang.wang@deepcomputing.io>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Message-Id: <20261118085742.1817536-3-yang.wang@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 16:57:35 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/9] dt-bindings: embedded-controller: Add SpacemiT K3 EC window
X-Lms-Return-Path: <lba+26afd6895+e1274b+lists.infradead.org+yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:57:56 +0800
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005804_191615_6A5F2D6A 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the K3-specific non-linear peripheral window in a vendor
binding. Reuse the existing EC keyboard schema and keep the Google EC
binding unchanged. Point the vendor controller child schema at this
binding.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 .../bindings/bus/spacemit,k3-espi.yaml        |  2 +-
 .../spacemit,k3-cros-ec.yaml                  | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml

diff --git a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
index 30985ee0a..545cc2609 100644
--- a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
+++ b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
@@ -112,7 +112,7 @@ properties:
 
 patternProperties:
   '^ec@[0-9a-f]+$':
-    $ref: /schemas/embedded-controller/google,cros-ec.yaml#
+    $ref: /schemas/embedded-controller/spacemit,k3-cros-ec.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml
new file mode 100644
index 000000000..971e7b32d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/spacemit,k3-cros-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS EC on the SpacemiT K3 peripheral window
+
+maintainers:
+  - Wang Yang <yang.wang@deepcomputing.io>
+
+description: |
+  The embedded controller implements ChromeOS EC host commands through the
+  memory-mapped peripheral window of the SpacemiT K3 eSPI controller. The
+  window uses a non-linear LPC register layout. Offset 0x00 provides host
+  command writes and status reads; offset 0x01 provides host data/results.
+  Protocol v2 arguments and parameters are at 0x10 and 0x18, protocol v3
+  packets at 0x100, and the EC memory map at 0x200. This programming interface
+  is distinct from an EC connected to an ordinary SPI controller.
+
+properties:
+  compatible:
+    const: spacemit,k3-cros-ec
+
+  reg:
+    maxItems: 1
+    description: EC peripheral memory window, at least 0x300 bytes.
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  keyboard-controller:
+    $ref: /schemas/input/google,cros-ec-keyb.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ec@0 {
+            compatible = "spacemit,k3-cros-ec";
+            reg = <0x0 0x1000>;
+            interrupt-parent = <&gpio>;
+            interrupts = <1 11 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
