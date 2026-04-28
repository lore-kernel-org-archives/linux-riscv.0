Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25274FF8865
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+KCBbO/rYgPUm81kQfzRr9PkbLZhHGWDTrPZyzrevY=; b=hq0/k7NLak/vfr
	zypXOqeK5t8qOV/pd2t5kAIsPgKIs2uixXHwLO4QOnhgdEkMUGsttqsY54C36dV9Ka1PBVETkyZNp
	jI0hbyavoWZEKiI9HJ5ShiqOXe1lkUDsy7LXHMf3w4sWDwHhAmYZFVTSVvGAA1eyPSxvtessPSroT
	VJ9TCem+bakbqSCD0ERy66dmCU423Z+lMunwr768DZXIhOKxJCYvRxlCOlnqzke5lYW3L/wWZZri0
	GFzO1aLjyicSstuU+5OA9vzgwrxC6u279Mef0xY0yjFKWR/efmmqJdZQT5f2EKZNHq8DyZ00oXC2h
	OBkzFDKs/IW3EtTgB0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMXJ-0000000H2uT-4Ams;
	Mon, 27 Apr 2026 14:02:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMXF-0000000H2rz-0toI
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:02:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b9705613ddso4049055ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777298524; x=1777903324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0oaBw5eNc2BclV3Ait+0PeOTuCPczoggHsdIRqUpS0=;
        b=n8YejbcLW7dHcKbiUKJkr0GQfejaEdDJumEDbdVo2r8LP9/VCFFc/eNJoZdmyZaDl5
         vtuC9ySCM/BYjSdIoSA9djIFF0vsPvj7TrhgYMZPs0QOwyd+o8dBXfN2VRfoJTpGHsjN
         BspkKWlcsSb6DzPZOoz96Noy1iwD9gv096ZQy7r0UmLBNdIVGCh7Wb3D8b2iA8JJDIGZ
         Ow1q/M06zxedsklyBVKjbW2b7cQ9G4APJ1gGGEFlWxHNi/1U26u64rC16aP/W9fl9DC3
         zVcdjDMUeNCinWjVakK+T1B2ljKACQHN+0sPk8TUyAJMwWm4971m2rWkaRNLYpY1NDCb
         xAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298524; x=1777903324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N0oaBw5eNc2BclV3Ait+0PeOTuCPczoggHsdIRqUpS0=;
        b=ah6W+wylVFA6/Op+jnNAwzX7MEBepShHnpwqv0mCUbKAfLTLRLvqmq7YmIBrqJTN2o
         Go6Rletkb0VmFSLsbn4idNWiH9dNN6cX6cC/8wiklzPfZzUEPm1MCbDc/PhzY1RdUSjs
         5uTcCjToZBNmI37y+YYvKig0/Fx4PRZhSHBfnyUL8a2tps8+DXxvIHosin/M8D579MeC
         Ed0Bwf4dEyyN/VX9w92zActe3HXtd+OgmXPKgQcy3tInvWgpTgR82LDI0IU/pUcBRVl8
         gjKoaydk6V0H45UTf1k/pXKmIxxeYwvnkn+9pBNMCDxKdjJpz7cMax64vOS1rQvMxYjy
         pK0A==
X-Forwarded-Encrypted: i=1; AFNElJ+27EM9XrNeZKp+YPeh4aLW93caAHLmusWMcZtHdY5M/NR4Z5QC+2CwhWcj1dy3i6tXKho0shmYQ+REQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YybNNcT1PGvyx47SaMJzpPNBlWJa5nZB4GM1xlG7BiRkhqTDyr8
	reQrw9mjvQNOcpETgoJQDVT6/b8JXEIXZPkEKbFYtAmC18TxKSx1kU2armSZO+amg2mrMqRHUv+
	ULQJS6bnZ5w==
X-Gm-Gg: AeBDiesiNd24+mVW3v/IrSCIhCOpwsOhW/kZMOtYvR7Jzu3JgJebvdPPfmHZLz7np+w
	qV3YHZH1x7ALg03wkbw2btZCb7fjBhYp38SdjT3qpTzA5Bxq45rWCCAVsmNZqAu2QAriH5CWaDM
	Nx5PVx+m2pxZO9q59e07FGlTfhvKAi/w20/mb9YYtF5lMvbpSsWLxvqOXeGAz9Vo7x1VyY4KR5Z
	/aV3RyAmL5S2RccT7GGf7SSpsLTtrOevaWFSsXFlcPmjnHnqSX55niApmDuor7VMvYeR4eLyLpC
	1toNs0vK19pCkgI0uTig7QROTGMVW6Yan907HPvy7i5cLt0SKAbW/zK+TOO+OqyxOkzNqYcK8h3
	wNE19uDkNgfFoKOFwdA0N1tIH+M0AkIbINcZuCTEBEHrF2FFPp4YNVKLK9gOs+ODi0nB3bXD0bF
	ArKMG4PMht3Ud1cX7N2hL3Sp34PGZorjA7YpE3z68rHLWZzA3sxE/Q0w==
X-Received: by 2002:a17:902:bd44:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b5f9fcd9eemr318233315ad.41.1777298523356;
        Mon, 27 Apr 2026 07:02:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm307143625ad.3.2026.04.27.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:02:02 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 27 Apr 2026 22:01:27 -0400
Subject: [PATCH v9 1/3] spi: dt-bindings: add SpacemiT K1 SPI support
MIME-Version: 1.0
Message-Id: <20260427-spi-spacemit-k1-v9-1-ff753b551302@riscstar.com>
References: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
In-Reply-To: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_070205_269652_BBA62F21 
X-CRM114-Status: GOOD (  11.96  )
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

From: Alex Elder <elder@riscstar.com>

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v9: Fix commit subject prefix to starting with spi
---
 .../devicetree/bindings/spi/spacemit,k1-spi.yaml   | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..e82c7f8d0b981
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Alex Elder <elder@kernel.org>
+
+description:
+  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
+  FIFOs, for transmit and receive.  Details are currently available in
+  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
+  K1 Documentation[1].  The controller transfers words using PIO.  DMA
+  transfers are supported as well, if both TX and RX DMA channels are
+  specified,
+
+  [1] https://developer.spacemit.com/documentation
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-spi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Bus clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    spi@d401c000 {
+        compatible = "spacemit,k1-spi";
+        reg = <0xd401c000 0x30>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&syscon_apbc CLK_SSP3>,
+                 <&syscon_apbc CLK_SSP3_BUS>;
+        clock-names = "core", "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts = <55>;
+        dmas = <&pdma 20>, <&pdma 19>;
+        dma-names = "rx", "tx";
+    };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
