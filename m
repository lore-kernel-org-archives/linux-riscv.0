Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5712CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESg5t0EoN19nXLGm6A0TCjTqSyxzXwSMILm6j+mm0kI=; b=HQC8P3yZFvmZeN
	yzmG9Ulqs8v/6gKeuor2oZjlMGQAe0CzcDtGRahyvA7xRwNYANh8LJHGtGC6v7PIs8Hs7T05mR1sN
	ZaElyUMO59ZTw/Z92v6XzocpIu1PaF2x4EwVPYEtFtlT1//4BOfCHE8zVEztuzxUZI0GXEYq1lra/
	TDhKU/K0A3WOoFTOmO+o9GZxseojG5lUb1JzQ/sulDzYlwWmB3rQA591fkjad0Rhy1zcT0f+OBcHn
	YFD//eXvv9oVYw957LZwwqkCy6lAACoVFb0lae8V6mAfmcZoRUmLiTaCHxj+nZ0V8FQFFeTPQ+cun
	tGs6bRjuwz2zBGXB3lQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urTT6-000000009c8-1E5M;
	Thu, 28 Aug 2025 03:38:32 +0000
Received: from bg1.exmail.qq.com ([114.132.67.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urTT2-000000009bC-3dHy
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 03:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756352275;
	bh=9c0tv56+rT8tv2KQ+mcHIp/y5vpqdKkP6eFUTFvbv/8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Vw7StKvPDBoWN1lAK1T5rJ/7XtchJAfmoe4eUIaaw492ZkHs5s/URD3gx3gKVzKt2
	 58VErsEif6ufw965a5SoSKGq9aTk/e5zaxvBo7UDN5FZ5ORLzvM6bGiuBauSb74ok4
	 rh9VaVZ9Isfw0nQ4INcRd2OeHA2bGVPRxq3PAfxI=
X-QQ-mid: zesmtpgz6t1756352267t6e5a7142
X-QQ-Originating-IP: m9DJSiBShAsNywwCR295jUkpl9aTxaAu+e6LGjr+BAk=
Received: from = ( [14.123.253.129])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 28 Aug 2025 11:37:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15134818412140859297
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 28 Aug 2025 11:37:32 +0800
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
MIME-Version: 1.0
Message-Id: <20250828-k1-i2s-v2-1-09e7b40f002c@linux.spacemit.com>
References: <20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com>
In-Reply-To: <20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756352261; l=2579;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=CkNn0yDL13rr5OJKQbYKy/stqZi1+aPvUUVgjgqZkSA=;
 b=aFZZbs56Cse6B+seILibSRbSjeKcbMDqar8IQlJTVAo1xo4I4mjC/Ro5SsIWrWM6YYoVF5rO3
 wk968wv7GNqAzOmT1h77KPbYihuCtEh8yEYkMi7cddjlmJSIrn9etbW
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MH+mSh2Uo1NkYMJZGtXB+yocc9AEIdi9UPqlHHgZefKYdLOQBcPwoLQF
	i5JGidbpvR0COtOYjMYfArUc/WOAHIIFkAZGt3NalbdkZnFyVZoH/GnJmzAXznziLssAcWV
	df9lCVtqNM/y309eGZV3G+EX1akVV8M0r336H7vWoofKHpvaVbsL81k3mIjAWwY5c7Qa8CL
	/HVL50AIhe/LN4bMrrVyBGD3ryorAfUNRK/ahqzkxxI3+W03xsYmhoc/GNzralAwIYMcxHW
	D7LzIpRpUExKrKHtOQLQoy6gIBlgm1x2DyrJQkneeC22AfcF8c6wvaY2KNsxnzFCfSRo4UF
	0pTa3QXIxWIaJpwGDfNb+W82XfUpiX//xnulXaZll13RUUwWGRtp93pOWxg2secMp6NiOFb
	AkvDCq4v5OqirM9rXgQOpxEGHNaKOI7CR4bQgbEFpoOMFjGN8JRm7VPR3SdRo2CvnPk6RIZ
	pg8b6d/yHW26KVL3SUQ8wYr4zvuQLC3vpFTuThsAIVjBv1LTEmZJFSnMZx97FQGwMwyjcdH
	c9PRzVIAq5NWycZKhGnWfclKKfzuED6y8U/SC+U/dgwd0w56+i38qGvtqVRCCEx80Wfr61b
	VG5xzJlVfdQBScWbhCM+l8UoiQ4/0DjpoTQbgbqkhh+KC7WUmizGXMKvvr1PR27g2haJxcM
	XbHOldnIWOlOSa2Wy7gD0/vUDjLbY7N682xKEK2zZM+5Js4tU4j6nuRdjy7uyEJ8XrhUUlX
	SC8O+zA4Bd0B0hkcIV6v1Q6y7GrTB0FlctZd0K73lmUx6UqW6j1BjSrraeobpZ2MN9tIauD
	avX3Chkt0zZoWyqOzM8trXQYBs8MGEETGNGELOxujgCd8a99ezwbW31z7/OJSY6twmN/QyR
	3N0ezi/Y/m3aWWjK77VKIvBzK740QNxgQVogr4OQxIABUEQBmoQJ+DFFB1nX+weGKSmnfwD
	IX0A/UZHWZk7dgk6m2MlsTrlRzwy0fbyokfp4XkRj+aQRtFUrRqd2MCy3URvU6lqyk/GVIh
	77wTwAgqi1IOKZSeJuqjkyWTCg5fzGAntlZX9ZAJX1gELgSn8E0ofoXdeJYbS6DMlSV9SoZ
	0manLEM5TS8lUhFkklI+ln+RfrmvZsDf2G7JhkhfldIg/NWLFH+RE8=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_203829_241233_14A89B02 
X-CRM114-Status: GOOD (  10.27  )
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

Add dt-binding for the i2s driver of SpacemiT's K1 SoC.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..042001c38ed8d434889183831e44289ea9c5aef2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/spacemit,k1-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: K1 I2S controller
+
+description:
+  The I2S bus (Inter-IC sound bus) is a serial link for digital
+  audio data transfer between devices in the system.
+
+maintainers:
+  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-i2s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for I2S sysclk
+      - description: clock for I2S bclk
+      - description: clock for I2S bus
+      - description: clock for I2S controller
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: bclk
+      - const: bus
+      - const: func
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    oneOf:
+      - const: rx
+      - items:
+          - const: tx
+          - const: rx
+
+  resets:
+    maxItems: 1
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - resets
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    i2s@d4026000 {
+      compatible = "spacemit,k1-i2s";
+      reg = <0xd4026000 0x30>;
+      clocks = <&syscon_mpmu CLK_I2S_SYSCLK>,
+               <&syscon_mpmu CLK_I2S_BCLK>,
+               <&syscon_apbc CLK_SSPA0_BUS>,
+               <&syscon_apbc CLK_SSPA0>;
+      clock-names = "sysclk", "bclk", "bus", "func";
+      dmas = <&pdma0 21>, <&pdma0 22>;
+      dma-names = "tx", "rx";
+      resets = <&syscon_apbc RESET_SSPA0>;
+      #sound-dai-cells = <0>;
+    };

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
