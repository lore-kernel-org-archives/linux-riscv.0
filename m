Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B18606A335
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4dKBAGK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=lNTTVwdl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Mime-Version:Date:
	Message-Id:Cc:In-Reply-To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=t4yCtIMQFnzYnM0Av1+npB+kyIQd8omOEl4GJfr4foM=; b=Z4dKBAGKKtUTqo6J5McOqu8YBs
	6dDMfJtZkGpFOqb8RqGWY4L1fRXnOU7eSvCTSSEOVWGUbqqPvMrL+IPo9La/ItMmlkifcvM37PizU
	gEWFHvc7tK+0f1FToKXajU8opCAZilbULMbwewWyAzzzv5kXzknc3g26ISIxtXHn7/flmVqJkNgI7
	gGr+uEDbFKZqkX0lgG8wxp6+VGxKdoqx+fKQ9t/2o+TWoSdYs/7WnRyjamQHefTF7H6HUAC8MzwV4
	7NpkI0D+lrGSjfP8YgPCBbe5Yn3o4DjJ17an6OZjWCos2X1jWewkifDhC3C4Z3pwIF7ylNZyJDO6E
	el7bZqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUY-00000008Fch-1BmQ;
	Wed, 18 Nov 2026 08:58:10 +0000
Received: from va-2-56.ptr.blmpb.com ([209.127.231.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUR-00000008Fa3-3c2G
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992276;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=S4+nY5S4u49URlEXcMNdkTuO3X5mh5b+AFVZYGcYQ60=;
 b=lNTTVwdlBx8X0fhtS9f9tRj/W006HpT2WDGvrAE4IaSa9g1pEJWMTD50M+2rnaUFJcRY/+
 UkPZdZe0dCp7u6yFTqMN0FZ9nlCIseutsqC8lOQ8IovkssEZZU1fdUp/P3kBCLtmwaTB1G
 nhkZAqC9B9fD7mFt5Aw1gsaCyr6sst379q9frXHP/fUId9RyepZ0IlH8osRt1H9HOOwKPL
 a3AZ32LHNTxfid0tiQmrMS2uIwAcMze/0otcMUJ9kXThUn/dT+kTRdp+paqXgvqm7SdBuv
 3K4qkwReRhfbQ4ja5R2fuEA9gQjH2ZYDkAgq9bKjH+UU1fyxa15QcSqdR92wQg==
From: "Wang Yang" <yang.wang@deepcomputing.io>
Subject: [PATCH 1/9] dt-bindings: bus: Add SpacemiT K3 eSPI controller
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
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
Message-Id: <20261118085742.1817536-2-yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Date: Wed, 18 Nov 2026 16:57:34 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
X-Lms-Return-Path: <lba+26afd6892+b44bdd+lists.infradead.org+yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:57:53 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005803_980512_8A4C54F3 
X-CRM114-Status: GOOD (  10.48  )
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

Describe the K3 eSPI controller and its peripheral memory translation
window, clocks, resets and link configuration. The EC uses this memory
window rather than the ordinary SPI transfer interface.

The controller implementation is carried as a separate prerequisite so
that the hardware vendor can review it independently.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 .../bindings/bus/spacemit,k3-espi.yaml        | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml

diff --git a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
new file mode 100644
index 000000000..30985ee0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/spacemit,k3-espi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 eSPI controller
+
+maintainers:
+  - Yixun Lan <dlan@kernel.org>
+
+description: |
+  The K3 eSPI controller connects the application processor to an embedded
+  controller. Child registers are accessed through a peripheral shared-memory
+  window, translated by ranges. The controller manages clocks, resets and
+  channel negotiation, including link recovery after an EC reboot.
+
+properties:
+  compatible:
+    const: spacemit,k3-espi
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Serial clock source
+      - description: Serial clock
+      - description: Bus clock
+
+  clock-names:
+    items:
+      - const: sclk_src
+      - const: sclk
+      - const: mclk
+
+  resets:
+    items:
+      - description: Bus reset
+      - description: Serial clock reset
+
+  pr-mem-base0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: First peripheral memory translation base.
+
+  pr-mem-base1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Second peripheral memory translation base.
+
+  operating-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Requested link clock frequency in MHz.
+    enum: [20, 25, 33, 50, 66]
+    default: 20
+
+  io-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Requested number of eSPI data lines.
+    enum: [single, dual, quad]
+    default: single
+
+  alert-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Use the shared IO1 line or the dedicated alert pin.
+    enum: [io1, pin]
+    default: io1
+
+  alert-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Electrical mode of the dedicated alert pin.
+    enum: [open-drain, push-pull]
+    default: open-drain
+
+  watchdog-timeout:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Controller watchdog counter value.
+    maximum: 65535
+    default: 65535
+
+  crc-enable:
+    type: boolean
+    description: Enable link CRC checking.
+
+  auto-gating-enable:
+    type: boolean
+    description: Enable automatic controller clock gating.
+
+  peripheral-channel-enable:
+    type: boolean
+    description: Enable the peripheral channel.
+
+  vwire-channel-enable:
+    type: boolean
+    description: Enable the virtual-wire channel.
+
+  oob-channel-enable:
+    type: boolean
+    description: Enable the out-of-band channel.
+
+  flash-channel-enable:
+    type: boolean
+    description: Enable the flash access channel.
+
+patternProperties:
+  '^ec@[0-9a-f]+$':
+    $ref: /schemas/embedded-controller/google,cros-ec.yaml#
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+
+    espi@cac8c000 {
+        compatible = "spacemit,k3-espi";
+        reg = <0xcac8c000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x84000000 0x1000>;
+        clocks = <&syscon_apmu CLK_APMU_ESPI_SCLK_SRC>,
+                 <&syscon_apmu CLK_APMU_ESPI_SCLK>,
+                 <&syscon_apmu CLK_APMU_ESPI_MCLK>;
+        clock-names = "sclk_src", "sclk", "mclk";
+        resets = <&syscon_apmu RESET_APMU_ESPI_MCLK>,
+                 <&syscon_apmu RESET_APMU_ESPI_SCLK>;
+    };

base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
