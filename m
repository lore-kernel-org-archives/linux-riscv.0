Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB843CCD19F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 14:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEJyaJwQiUT6B4sk5sDdDyRXLhwCexVBWEWQGdiKbKw=; b=jYAN7DDzMRyGP6
	6vFYj+LxCCbxUjls+ehxfiN2ZvI23P+uYCefeIzomsoGj7+DHsATSqPmj8pd/W+iPvVyWUpNzCIKl
	F9cqUuESmFZvjpTH8Rwx0dVmzKgQInhAQpempbOhVGuB/QNoqXMAOZYkzEjDMq49pFY9fjZDsQIxY
	3rPlgCSdk34KaCNOPLIamv2N1JhwsnyoW19qAk96MvsaSre0ANO7dq4Y/gxxV84oYQ5Ir1MbOzmm+
	sKvAKLVh+IXn4F94YU/7bK9GwDhrazW50xwEuMozi8UkaxyXhS75SCm1of1VWjLvV13LXgfOAc3Hz
	sFJHvsnxgn0Pxl0U75HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lmn-0000000899N-0uuX;
	Fri, 17 Oct 2025 14:50:29 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lmj-0000000897e-3vS6
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 14:50:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760712623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O16vK/VHkqg7/QCOruoqlgzueSxhXKWOlNBJuxSfE5c=;
	b=d4Te4amsd1c9e88q5m/2fV+sud/YEiJlkx2xmoaAA3pytgNHvQpRLw+45Kouy2VEIU9mkr
	WkR0KdLQoenPJ2vHObpy+kLLjIEKGoVrpmyJu0vXCzNRFD1Cv1MaiVv4pru9v3s3jcUorb
	P9rs8slO78QPEDOJqcDlRgaBKSrk7qg=
From: Ze Huang <huang.ze@linux.dev>
Date: Fri, 17 Oct 2025 22:49:52 +0800
Subject: [PATCH v6 1/2] dt-bindings: phy: spacemit: add K1 USB2 PHY
MIME-Version: 1.0
Message-Id: <20251017-k1-usb2phy-v6-1-7cf9ea2477a1@linux.dev>
References: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
In-Reply-To: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760712608; l=1362;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=QaF1KmAvkgTx8GRFlS00uZ3xWQHECjSqx1iwWdJGuFY=;
 b=i0RY7Jh3VwMSAi2s0DN34uEHzrLrLfQG7SZHg27/0ezqCPa2EgzbenWEuSX6xOXX9Wn15+Gve
 NBibTeBTig6AGOWAy+YBJ5sppuEKU38s1SK4Ercs0MICN/QRvYEiVwQ
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_075026_415516_A4654373 
X-CRM114-Status: UNSURE (   8.88  )
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

Add support for USB2 PHY found on SpacemiT K1 SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
new file mode 100644
index 000000000000..43eaca90d88c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC USB 2.0 PHY
+
+maintainers:
+  - Ze Huang <huang.ze@linux.dev>
+
+properties:
+  compatible:
+    const: spacemit,k1-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@c09c0000 {
+        compatible = "spacemit,k1-usb2-phy";
+        reg = <0xc09c0000 0x200>;
+        clocks = <&syscon_apmu 15>;
+        #phy-cells = <0>;
+    };

-- 
2.51.1.dirty


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
