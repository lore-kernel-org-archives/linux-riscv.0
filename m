Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779D9C43470
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF962613B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF962613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w5rEaKAmr9xBLqVeAkbUcDX4E9jZcP5hEiohVADjEaw=; b=LebTAGJdfppmogRJCf2N+3LEO
	yJQBIvLz2cEPEJW8JPMf55hSNx9bWIV5f6PQ/v55jBVO91YeUg0uGr8b3/iFkETV69IsaL1jMq4d+
	KbADGApF7uMOUH58niC5RolMHWv9pCWX7ol3nKRjIMPK0VsXNbbVs8D4UI8jg6rdmaDAujtQmo4Gn
	KRXxAUUVRDfzjWLrLmpfX1qKVzRU+JbX2f901lsf0pnKkCiFE5zJ7fxBP++i6IJJGtEFewAGBK/kb
	PH3+b/dTRPkOqNRawb/W75kejcM7C8qDHURhIT+uF8aMrUKA9VZxBzzNPR7LK98xrX/OKMMUCcpXQ
	X0mcTplag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldsnC-00G23m-3W; Tue, 04 May 2021 11:00:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsn3-00G20O-JX
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 11:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aI2FFkU7bKDlqiGKTRTWAsuX6TrWHQzdkpcCP9dXjH0=; b=BiYvMN9EMKhYxU3LezwlRqG6YL
 xHJ/k0VU2pAknW+Ox/bkH70BCzWnnjgx54+PYeNV/Sl32p8GM9y/1NUtkU5EUmyB7OKR61ZtatgD2
 7gtVQx8DShM2XkAX6htaV8tnFQQ8/fd3MNdOsi+hIL+rWGvyG127ayjjgp4QaVe+p+IbocaTOdsHi
 zwNNsiQG9DZ7sHj6nAAJRdp0Gd62HQ+D8kog2NbbH36ouEen6UUuubUA59zPUQLMG4NHHR8vDgi/D
 pziFiBqGdTkgareOiW1XEllYJrjxipaFJ+24MsbO47ZH4Kh+9PFuzGtFthYLid8Efd+3UcGtcR2m/
 bmJMsGEg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsn0-003utd-Pp
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 11:00:32 +0000
Received: by mail-pf1-x429.google.com with SMTP id x188so4992918pfd.7
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aI2FFkU7bKDlqiGKTRTWAsuX6TrWHQzdkpcCP9dXjH0=;
 b=Sg8M03GFxXoFa6ZRrsk+AZdY2lSccYkyd4+CvMjoBiTmGv75ZxVUH8OgK2cRnlkl0l
 HevF/AEHrpkpI1UQauNdBisrHjzvc2PKtqZMFVqrcnv5M91sgPyqi9rfTmLJGFUNnWbL
 P+rgyBwUTersXaXTD6Q3ivqtXmx6gY/C8ZXHTpFI+1AphUoWrlGvaYu1/Mb71PGBjoqR
 pR0H024TRql1Hsys/H5jmlp0SxZst/eRMUq5O1DjzvN6eXg8CMucN0/yBIkG7vQlDt06
 3L/zbSxTR4O0qPeO+qf64biD34PmpYoKfbbVQkFI6iXcA0dwFV1KErHkxrq6QULY9BNn
 bIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aI2FFkU7bKDlqiGKTRTWAsuX6TrWHQzdkpcCP9dXjH0=;
 b=oyjgRIpsxNQuHUIhv7gqevwqGvvmcoWU369NW+iDQS/TrXFktF8wOkGERKzFjQzxx4
 19sBIBTRLS3uVmJN3F9pxeFeQg+q2sBnI2hYxzlawfRYuvNtUcdd36bXDDQrO+raqBM9
 VNoVX8jEcPLxhHoYq5sxBEAMRh5eP9H3UDMnCTA0eKS8vLz89z6Q191Dw/2unE9gZbAY
 m4SZDMuK/3mBcrwKxb+bfM7PLBFvnhR0SRRm8l8whdjqSZz5lUq58kRMI38UwP3D1bLP
 xgMj5H0Xf6gufmKrkJTE/bl3XELewo4tgczLd8zFQd8knGbwicJqsg03q4Fg87umCfme
 BMpQ==
X-Gm-Message-State: AOAM533F7zcD/RHJLzBYjByjSEZ68Bm15uU3jhWFXH8kwJQ9xiDcEEp5
 0IDxao3Zt25Qfspct7kf3OPgEw==
X-Google-Smtp-Source: ABdhPJwcF40iyxqw/l7otHDmJuinh4gdTSc3PnmBCLnz7T0BE/TlGgIzO1udGUgiFc7SwpudWeAk1Q==
X-Received: by 2002:a63:da55:: with SMTP id l21mr22515119pgj.188.1620126029661; 
 Tue, 04 May 2021 04:00:29 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 04:00:29 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH v6 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
Date: Tue,  4 May 2021 18:59:38 +0800
Message-Id: <20210504105940.100004-5-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_040030_859617_9EB9E06B 
X-CRM114-Status: GOOD (  11.95  )
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

Add PCIe host controller DT bindings of SiFive FU740.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pci/sifive,fu740-pcie.yaml       | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
new file mode 100644
index 000000000000..b03cbb9b6602
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sifive,fu740-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive FU740 PCIe host controller
+
+description: |+
+  SiFive FU740 PCIe host controller is based on the Synopsys DesignWare
+  PCI core. It shares common features with the PCIe DesignWare core and
+  inherits common properties defined in
+  Documentation/devicetree/bindings/pci/designware-pcie.txt.
+
+maintainers:
+  - Paul Walmsley <paul.walmsley@sifive.com>
+  - Greentime Hu <greentime.hu@sifive.com>
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+
+properties:
+  compatible:
+    const: sifive,fu740-pcie
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: config
+      - const: mgmt
+
+  num-lanes:
+    const: 8
+
+  msi-parent: true
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: inta
+      - const: intb
+      - const: intc
+      - const: intd
+
+  resets:
+    description: A phandle to the PCIe power up reset line.
+    maxItems: 1
+
+  pwren-gpios:
+    description: Should specify the GPIO for controlling the PCI bus device power on.
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - dma-coherent
+  - num-lanes
+  - interrupts
+  - interrupt-names
+  - interrupt-parent
+  - interrupt-map-mask
+  - interrupt-map
+  - clock-names
+  - clocks
+  - resets
+  - pwren-gpios
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        #include <dt-bindings/clock/sifive-fu740-prci.h>
+
+        pcie@e00000000 {
+            compatible = "sifive,fu740-pcie";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            #interrupt-cells = <1>;
+            reg = <0xe 0x00000000 0x0 0x80000000>,
+                  <0xd 0xf0000000 0x0 0x10000000>,
+                  <0x0 0x100d0000 0x0 0x1000>;
+            reg-names = "dbi", "config", "mgmt";
+            device_type = "pci";
+            dma-coherent;
+            bus-range = <0x0 0xff>;
+            ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000>,      /* I/O */
+                     <0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000>,    /* mem */
+                     <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000>,    /* mem */
+                     <0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
+            num-lanes = <0x8>;
+            interrupts = <56>, <57>, <58>, <59>, <60>, <61>, <62>, <63>, <64>;
+            interrupt-names = "msi", "inta", "intb", "intc", "intd";
+            interrupt-parent = <&plic0>;
+            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+            interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
+                            <0x0 0x0 0x0 0x2 &plic0 58>,
+                            <0x0 0x0 0x0 0x3 &plic0 59>,
+                            <0x0 0x0 0x0 0x4 &plic0 60>;
+            clock-names = "pcie_aux";
+            clocks = <&prci PRCI_CLK_PCIE_AUX>;
+            resets = <&prci 4>;
+            pwren-gpios = <&gpio 5 0>;
+            reset-gpios = <&gpio 8 0>;
+        };
+    };
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
