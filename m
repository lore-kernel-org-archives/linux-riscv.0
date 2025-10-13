Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F980CCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 12:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZf435NtCIKnJHpIOrl41o4HE8Afzta9sLbT42s3Xpc=; b=FDAZ/c4gebn3uw
	HjV9Zb4eFbgsjSexd/Z0oLpeKiQSziOYROWK1YouTfW2Kmm07gzBh/4pah+HTGdizIHgLN34CdpEq
	G8QXt4IPVP2VcKiAdH9NaZYaN7wRGoHgEBiMLQ5Iymo+D7lV0MGRP+BhxZCR9aHSU74LCq2zdQqCP
	Ntscu1fx+QpYw8FoyHxetQKt+LhJBKQL9DL+HZCAZYhiBBKW/RFXPXK09j6EfhAQ3RdkdVYu2g7e8
	JYyXEr2qxlPhNLfXYphiVaD2Lx2O+EV4INqgcqYHq7hfEUhqX77/tvqvcHowgpIkpPy7y5VoyRekj
	UR/Zx+qB97nT/DeS/IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hjq-0000000D82W-1f7r;
	Mon, 13 Oct 2025 12:33:18 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hjo-0000000D81l-1HHy
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 12:33:17 +0000
Received: by mail-il1-x144.google.com with SMTP id e9e14a558f8ab-42f9f5a9992so24597125ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 05:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760358795; x=1760963595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhpKl/nn+BHTlTr14XOcXWGwJsMuOmqiPlR2ItDHNmo=;
        b=Qz372YH0aNOsd1X4al4/Xi2SUfALtLvLC0Nwjs9wGl6SERB7UVZn0n47ARCzBEJVig
         u34ipFh+pXsLKnesQvPoNmC5E2PY76nDqqRH6g3XsiKCp45X9velUao1tz487qZpS4Ye
         45vu2mbnCa4RIpHMswRPQ2OK1iceYEiYkLG/Ms0NEVCVpykHg7rcDU7Du3f2wamI0yOs
         G6fDFLAr6BjiGUBHPO4m41dcrf3h28AkZSAwHJTnm3qiQrv5Co6ogm8xFUbJfQMMTtyP
         YRHyfTYkGIq33HXdo5YcE+BzLW875bpdNvNLNYAIYABIluzoaBElliKEJscf2dsCEi6i
         pFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358795; x=1760963595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhpKl/nn+BHTlTr14XOcXWGwJsMuOmqiPlR2ItDHNmo=;
        b=ZBwC00fDUKeEE0ZGBi1oJWYIbIq+3pngmGYsHT0uh/2+XDrvu5dP6C/SUYSerX3Iy0
         k5OZpWQh09+O3BSh+DuTdEh/c494YgF13zrDM8akjN4h2peLRSZWG7tIeejGugH+IxkL
         q4+4mP44lsvTpEMkgYWcrM80RlPKaGhxqYNjPemWzvgr4nmtVlyjW6a2mS+iA91IhFMX
         wS3Bx/rsAV8HAQISFpdaQE+5ZMVnFZeCXHjoK52v3Ds6oAFA50AE1BQFFe/OE6fzH64m
         8DUk+qh7UZyK9778j+qyKKMqaPGvokMTziomQqQCz2aQ9ILphK5taBpJG/JZEKYQPGJ/
         PUrw==
X-Forwarded-Encrypted: i=1; AJvYcCUGcQSVl8ZV9Lmq7R3GxhjF5F4bQxtxudPfCHjKSwcaCsHjLwT4Df2UfTOGAV3pbPqOKKc2IJkzqVfRVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkxcqAiMJVzwdQyRbB+y8AmIjQL8dRZIyU3MwJ8nOw7nMwBNVT
	LD50UoMAcJzR1/esNR0xLBfDy1dkljH+7MA+PZRbPIaD3ibAeNRbFKGHVW0bgJmCAiU=
X-Gm-Gg: ASbGnct3dpnyQ3bD9YFnyJWT4RNTxb3Gd63a+rTCkshVxCp0r0LS87YuvS6k/umND/y
	i6WKlYfOXZowVatAtrtU6qwCH3uL7oQ2vXFqf4xSUd4v4D9K22s0zUE9XZJW5RAn5G+/Xv71VX0
	9NVOb3hhQWjfV0INPFbrKUh1lkVJfe1X+/29h6/dXrj7JSZtSaWcSiqSlNE+TSomKN2ZDYvDLdA
	MDnbLC2sVoOLoBKAMhHUk8gArrHWkSwNq20NIOdfhiVzd/DvIAjpEfffzmjUGYU9CzoWQmai0TR
	u0qBZpzVT9EpPm/C6K/yaHv+/VTjFLxoM+PO6OCWXMrvDWm1Bc+dh9CVINjd9tB4Y9Y/XXJoxa6
	o47SUNxb+CbN8hP8/eCyeK7bsVyMRlmCzmgfisBnXSzLRlqFeeiJhy17qYpAzTrkq8oitfaU9x2
	+qAytbdGDzkJbrI3LvCfs=
X-Google-Smtp-Source: AGHT+IGJ80l8YVhjRo9dBel9J5Pq3aK8ulue475SHMoRD5VOgdZxLEedWtLm7lvh3HivwJo28VCMmg==
X-Received: by 2002:a05:6e02:248f:b0:42f:8ae3:20c with SMTP id e9e14a558f8ab-42f8ae30b89mr224767205ab.19.1760358795380;
        Mon, 13 Oct 2025 05:33:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9037e344sm51529815ab.34.2025.10.13.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:33:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Mon, 13 Oct 2025 07:33:06 -0500
Message-ID: <20251013123309.2252042-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013123309.2252042-1-elder@riscstar.com>
References: <20251013123309.2252042-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_053316_344107_9061123D 
X-CRM114-Status: GOOD (  12.22  )
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

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/spi/spacemit,k1-spi.yaml         | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
