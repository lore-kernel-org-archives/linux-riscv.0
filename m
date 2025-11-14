Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACD4CE8D79
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 18:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qgsrTC0vCCKZ/Ezj82T7JmV4ui9FXAJovuklxWW19k=; b=bgZRkDxBO4uwOE
	ER1GqYGssnKXE6xdD1U204fUYzLlMAeLM7HV2FHlwyD436xLhLUnS7FRYRO2LfJyI3a+mmoOCf4gq
	1jT1Yj/7H9IccTQFDXdcyxrUA+VoaleJCOSmoW5ARQiU8hz5TyPCRvOxT1YhNP7ZJxHMwiehTvt5b
	abuniX8POIvjMya6awx6yIpcbu72eROf2Dp9aGiUHTek3qRNNGcJzzqugPIh+GoA23793rJkv1NsG
	mIwWVLCkyOmYJDSqekc7gz1iV3vK6at/8Ylkcsx9r3X3h/VD8JBKiHbLhEt4HymC3XP4MYm70Ykix
	j9nu9SFsH/TSfSRW900w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyza-0000000Cyso-1FA3;
	Fri, 14 Nov 2025 18:57:54 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyzX-0000000Cyrk-3XGA
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 18:57:53 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-9487e2b9622so181373339f.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 10:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763146671; x=1763751471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hu93jrgt16GNM8HBZugqTHoqi52uFXrn0f1Yp7esaAs=;
        b=dqugc7RIwkBXNQdu0FoRA57y80mJnnUezEiw/D5daXWowrIelYLrH+7imVTijDTDXr
         OG9fTcKnPbBO21l/rqM6ETW1gg/LF7wecNx5beLN/Mkef55SQOylfU5WpeD0VMGZBKkK
         cP4W5aU7s+XMRLU4QZJViEf0VK1VwodbdOj3h7vUEf74RDSI538MH5VG9+UkKgJTU2Da
         jcM7G5AufUGQ1ul460Ia5WzyymylaoYwfASVyasJL9vtKnKqKJ1O7lhqoAkMj1miwxZK
         dPvImb9//fUOZ5yHKWKi1su4liLMyNKZxV2dGR+xFrQYCvH8elqJBCpgluSnYYax+2J1
         P60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146671; x=1763751471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hu93jrgt16GNM8HBZugqTHoqi52uFXrn0f1Yp7esaAs=;
        b=c1HV0WZm7648E/kefrwr2Ocum5SJPmPMEGmBT84uqyDqVLqCv1QE4mviySts6XcqmW
         r+OTIy0K8rxnhiJBGkrPZmXC330jN65C333rLe+shkhQenKWeSo4l7YUBJFGAQKGQjvD
         VGajscvbID5WEXV3Q5ALjeX6l9ULb5s1PBjM8fSlnDydowjSzrOTOlJzoSc/kQSugw0U
         dzad2QIVA75K9DF4Yl6F7pIQULFt93Xmiuw5GTq2zY28qk5Q1E8lf41if0eKwAvzBqTT
         ffDvM6dY2SGWaXZrLa9XsTpw7wJBtFZbgrDluhaej4lS61Mr+ni/WktchXf0F3kpt8ze
         +Bfg==
X-Forwarded-Encrypted: i=1; AJvYcCX8DnAtZDdP7WsUEdNVBJyQuZs65lPxkzctY3HeOa0qIyapH3VZM9mS+rJEhaHYVvYkC9OpANBjGnuJVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3w/Wf9t0mgutDsPao5H3n1ZwliXmC8VK23LlhdYnFS+IotPOj
	etsz3mviBuaVsENMY2eAFG9l7C6ttp4b1E/GOqVAe/Cr/0DDfCdkXL5jhMEVBlDJeVc=
X-Gm-Gg: ASbGncuTz5FIyBKvErPF0Ewhv4/r6v232lQlTxejeTy7MSozXsPIMzW2hwBYU9xFpLK
	Na6qJDgiYCpt3QCTdCF6PgBKikbn/iiXu+fRgTPx3YcdQNRmTG6lukmV0ImPBG8r4/VjPSmTLsb
	BJHAma4JLC/r/mmKdGjYsV0CZDrdGoen2AwJkEz2Lvfr1dgH2/47qxry1F3LlypEPOB2ius2snl
	XnmVlAiXDnKkC8Adieebnk/AWkeC3wyw62OwHjRWI3J5TIbV0msyDRUpYblBox2zajl/9hrk9fi
	SMcA3y8057RlaP/hgBN3MbZTHqHhP2r7Vkc/lFoDo4aXe4HOM14y4vQWJNvJUqK3MlCumeYulou
	NMZpbgNwIIxW8w8P2KkhaXRJ/hyPy/TarBZVSmmU7jT9j2XapsZFYCmbQsm1S85AEXh8IniHb1j
	mKAaFG1K1p5C9yXw6Ev1FcacIfrLd/I7dB/YQC6kMs79URb+/x7K8uYg==
X-Google-Smtp-Source: AGHT+IFeZ+nEollEKgDhQ7ieSd8muaJyYhRQJB6yiY924Ch6n+G3VyFq8ZoZpYgmOsoQMLWRQOm8JA==
X-Received: by 2002:a05:6602:640d:b0:948:8be8:a8d7 with SMTP id ca18e2360f4ac-948e0da72e6mr647783139f.13.1763146670137;
        Fri, 14 Nov 2025 10:57:50 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-948d2ba690bsm278679339f.8.2025.11.14.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:57:49 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v7 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Fri, 14 Nov 2025 12:57:42 -0600
Message-ID: <20251114185745.2838358-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251114185745.2838358-1-elder@riscstar.com>
References: <20251114185745.2838358-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_105751_885726_F7220256 
X-CRM114-Status: GOOD (  12.12  )
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
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
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
