Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E9CAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03/zY4WInM+d3oP69BcNiCp8KvxdcMTiyPfvsvCNJuI=; b=fIlPfnFNb91bsR
	/b57fBRFP0dVNpJ7FNGVtq28GeaQwCn/vmstttrDY3r7Sa8tWJOmH0XLeY3uDBlgRxwYopJx8qnOz
	zGeYMGLQwZstZNavcHAn7uA3ZYHbeZCjTmRcKT58OBgj9gaCdBiWYnaT/xVRtH0wISV5JZMOEFmh6
	JXt+OV6n/0yaFkcD+CoTh9bq5v15t5ogYk52P3T8puAR8GsaYQEZTCPCAZlWjGsPAQKE2vmQb/l3l
	cXvgpZT1pU3/yGx77uapiqu8Or6WJU0NVfDO0CB5OKH0FXn5am+M5jHkAMCM7Onk7p+jhhTsoHGEv
	pEijZjMN139gBa5S4SgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kua-00000008sul-2eId;
	Thu, 25 Sep 2025 12:17:24 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kuY-00000008ss9-0dOp
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 12:17:23 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-9032edd72c1so74274339f.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 05:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802641; x=1759407441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR2b9ECnFflIMj/TuPVkfctyOHxTY8RYfTiR0F4tDBs=;
        b=lMCFl+lGAV18gHv2qZdynsq20ofXuPUY8ZP2RGfOBA0SLRFZqgtQmuQp3jVdnH7oHb
         hNppFqjSp321tSK7UvUw67JLTu56maTLPLiPxUoj+8wIHf6UyoAROm2Vff7BwNmlLgxC
         qroDOt0nF9gT0U9C7oJOpeQhjAQfqTGS47jsJCTd1wFcyX8FerutBtBJFhi8Ot0KNglJ
         5VFSOw9cThAUpJU+dKkNYZuUHMOSuimaoz+dWq6h+D26/7uZahGE0KCA9n9RGBqubE8E
         aLs46mHnBa14AiIzENcZKyAaHOgQnAoigyxi0QJNVHN1ilyuY04Qhgh3P9TWrzlryTzC
         M2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802641; x=1759407441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR2b9ECnFflIMj/TuPVkfctyOHxTY8RYfTiR0F4tDBs=;
        b=YKBzGSlaoJx0sRO6Hrm7CsFa/DxtdEnNRbAzRbNVWToI2o/pGcwvOJt6UDUf0ey0hx
         JN3xSjTiLn97nJ9nX6ZV6ZA+m+PYbQZqCAV+t7uG+crEvIe1wYbLrqPtuKDjyqJJNzV9
         s92Uyu9Gdc9oplZLcdfGwBeCE+fXudLRmUciecIgSfsUqkPBshgM2SsosV4N+EbpBfvs
         3JTcJn0mGzPHVaYJov0icBp6DeFWfUxuHsmBA1Xk54FNtJ78axkcWde0CI3CD6bZ4U0X
         BmldWHYyj6xcf/VjGeWHcILGqmr1z2Xxtn9na7+/r9J1gum44ZZcLMuWQxPc7EfQ0r0y
         JX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTH6YlCxqntV/xUAHlOgW+9EzBeUo6oIircongZSPwCM202uTIn8l1u7naJt8uX9cHiVuYLye2LrEBzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU1dG6HS9gCHzFpwwl2Q3vpdfQlOY8QTpoLvpZFFApnHSbLOK4
	YGj0ZxKhLBv0+sU6iJFKioz5f1t41W3pjf7mUOPpoww8jqUzrxYiX7QKZ61/1uaEFzg=
X-Gm-Gg: ASbGnctiPVoYxksRhUk2CwXj88wMnwGjhtYU1RpdFvifBoA/izMKvYZiBUGUrg8KZhX
	CbE/MiSZ6LWhvImugOs1W5f2vTacw6aLThta1nUfbh8ZuCXXUxqrVFJoCKngUKcufPo5MBlhMa1
	ysgWA/gx6sntMAg7TySCJIeSz2iTY018LkTPqkKGVJ/+mOdCJlo+JYKq8D30+CZO/DEZdRjO/HR
	DQoQVf/N8nnkJkfWveFWCyFzm/C0uACN/a6EjQXQM0wqdlv5WyPt1I4ckx61D5H8kjXEkmt7p4t
	/3cN/4GDTJpK4/5ememiYtuzOyAmc6U+LmRMSBh82Jelb6eG3pkJMXZlw0rmaCl7TzyJgDv/B9z
	MdtK0QxdDav4HchdhohChX8EP15yC594NvjeRjbuIbu2QBLP8vjpdt67DgiAHOE1//g==
X-Google-Smtp-Source: AGHT+IG4wPSqwPahvB80HGI0vgDXc7ga/ScqHe+FN+6P+4lK9aExGKMJr/7vetRH34Lx70dFVQXPBQ==
X-Received: by 2002:a05:6602:2dc5:b0:88e:3632:ca4a with SMTP id ca18e2360f4ac-90152604880mr472882939f.3.1758802641154;
        Thu, 25 Sep 2025 05:17:21 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9040c57fa59sm66918439f.16.2025.09.25.05.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:17:20 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	junhui.liu@pigmoral.tech,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Thu, 25 Sep 2025 07:17:11 -0500
Message-ID: <20250925121714.2514932-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925121714.2514932-1-elder@riscstar.com>
References: <20250925121714.2514932-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_051722_187594_7ABBB3F3 
X-CRM114-Status: GOOD (  13.18  )
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
v4: - Formatted dmas and dma-names properties on one line in example

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
