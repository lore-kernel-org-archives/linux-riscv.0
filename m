Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034EBCA1016
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 05:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNv3N58pta4MSfwikot7QWnX05kqW1eA2o+z9k4wCQ8=; b=Q5PGlfU7t55paQ
	MVeWGlxyYVjb2TPi72lIcFvVQ3ualGW6NNEcGDLHMFBVcq+l/npnKqZohsMHQOWvLZ8WnaZ565MpL
	E5nFEGB0y6DPGzjOys5s0IzR5hkQmNkFVCRiKd16L6Ju8MUjxZDPxXApwY7YXOnRvcnxbGOszQN4h
	Tm5FAHosH1DcWHFRga62GMwZSslhB2NbXykRGR4ldhxnjjkFjydUIMUSvBdrFJg/n4m8EWHQvF+C7
	ug2lMPdQsCvomFO8wuS74EcQATXcj1zdhkm+Pue022ua0pfvAoFiXHJAeWV1cxr8yI3ud/98yRe47
	3eqCqzHNpMTF9DjIFIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwaAa-000000014uz-3guJ;
	Thu, 11 Sep 2025 05:48:32 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwaAX-000000014lQ-3j9N
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 05:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1757569653;
	bh=Pd8E5nwso3tDIIp7ab7uxQOFaM7OtDLMcKjQtOfLAWA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=qOe+YCjW6Gu/yYmh6Xtw0GSxis5uAGhyY8NL2ObRXHd0v9ez48DTYfxUor9AsppIC
	 U8xh50qb4YawIjen/VJHH05bxM3mtQkFYNdKoWHfCqjWD4FZDNv02sNzpQrFyBr9iB
	 Igl9uf+tuusGssiASAWAoeoBAfPSnK4snuqW4E8I=
X-QQ-mid: esmtpsz18t1757569645tbae29400
X-QQ-Originating-IP: sDZRU4N6vZL21xBIP2dp/dXDI3uIkBybEVLTmW+dvvg=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Sep 2025 13:47:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16154328192209350849
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 11 Sep 2025 13:47:10 +0800
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
MIME-Version: 1.0
Message-Id: <20250911-k1-i2s-v3-1-57f173732f9c@linux.spacemit.com>
References: <20250911-k1-i2s-v3-0-57f173732f9c@linux.spacemit.com>
In-Reply-To: <20250911-k1-i2s-v3-0-57f173732f9c@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757569637; l=2552;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=MZyNehkEDO+xrWPj2ZXjZEeu4YgI8vPyjedZrtrtDWs=;
 b=mGBVFiExQ0QO9T+P2Au+nmTf7TOKFhgkQB2q33d8wdm16gjBqxAViQU8m01yMF5WAg6AZEqQc
 303tdXTjQNQAxEPHGlPxDVxIdss5utvuKzTiMVT/N24cLnQ0LhOoc8z
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NejIAae1JCGv2Uw2qKkNK4F1vgULFf30skGjvAjnhy/frbtfYaA8usbr
	9gXWW4OTcclYeZ+p9ZqLt8NQaP8S6uQw+j4+p1ibT1ufExQ9Ll/vEly3e9THXaLZf6vBKu2
	qRYNCoQv5AP50aceOA3IR1xp2h09WYWJW+oSchVw8l/wic7ITengDtQQ3OanVAYGEvel97v
	GO+zx5rxiPcFJhN9YBYWXEdHRzlhAgQ/y6mBe2B2uQFioowYuFThn71PSvEEdrxkhF0zsfq
	lmuN5iZK8bIEX42y/6DTvDiv68lfdhWJiuunjDmry0JX6U1mnUviU2nqiRNByL8rPuBmzk9
	XDbrnRcfeqNDpPTaCLZVxK2TPsBfo3x42ghZkrKA76Vwetq/zT09s1BDyllMEUJ3mWctfCQ
	B9V4kTJFDRXt1rJfs5FK6yNTcFpGkxylgtNC5g8htGFiWus1QsbOlAnaa348lXccuLjRGNN
	OG1o40b1LCCd5ChYwNwIRxH6dEyAZOyfieAp0UOop+9rUETYh8AK96HiyfXhxku59HxNL2H
	LJMQ3HykuNJvnrUZTYiEYto3anOQve5uSc/L0H/ohk5fLfEl4DVZlRlXs7IGq1gDW2SrVv+
	zgmhMA4bazNjSQDK6EJcjFeNHJ80ps+Fv8HjHxV71HdxtSS6Bv7dkRKgcW77ZLstNz6IZy7
	rXPOqX/lFyL9C4kjRAyc56qyB6ZDOEBLGa0axqOFw4kuCU+Ajo1TkeBXJ15blqMVSclCj1r
	XBI8+ZrS/4G5+T/78vh1RU30zSBFozCBEvxux9AkrUaVoHdnIEAp1p7AciIVH3S9oRKEAi0
	BpfRuFXId2jD/2OspoJLW+MLwafNwXuALXd0P8qOpQJ8YmFtf4TLGTiGUPK6nPjLX7w4GV8
	wDdoKmCKXv4RrkmZfbU8I4qAbODAL4Z+6MKXmexCNtDHW1OTcHP9Wz//mHR8K+pUefyfyok
	yLM0t+zKRrK8yOxXutBM9w3WMWTpd2Y4jltGsIYW/GBkYuJOmQo3eSHAx3jte/XhzE8S14y
	VMSfkDp4TXX8msiXW5FLWDkXdqMl3Eu+zcjrAbuZNIH+rI1FcLvRBOwpXBtq083Vxy1cBAG
	ASQx5tAMI3iYhaPo1wD8pI=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_224830_480359_468A81C6 
X-CRM114-Status: GOOD (  10.24  )
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
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..55bd0b307d22b3611d0fefb1e925e56812848dd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -0,0 +1,87 @@
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
+    minItems: 1
+    items:
+      - const: tx
+      - const: rx
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
