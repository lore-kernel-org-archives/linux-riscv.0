Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFF9CAC59F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 22:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7E9rGLQRe/HsWiKTiYlx6qqou9S0X19PoHOuYwJ04I=; b=Oz8CHZG7o5jYng
	f3UkpO1ZCeQhzms4OE67tvZPybpvIBnuQ5Hr9hX6lP5LMGOdZJGXsaHqiAu5Ggmeo1PakADq2+XrI
	JNkPSmKsowfzZcoU4KZxVM+hYMBLfjurf8GIm6+5CVnAyLudUS3HfrRafBmFs7MGfEfq5xXIbyNSU
	2VYLnJjDnzDOWjyJSPt+0fRLr6mhBJabdmNf1i1+nUNIijpkl9zqdiK0RNv5/oMdeiipfNuDQcjSM
	Pse/aa5MFDvfdnrGrE3do3frGh3Gzs9hxZK0eE3iSxoG2BCqvJUy9//zmsGGZTufz7/zTAf9QOxY7
	4GA/nUFwG0ZKqknSKzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0JK-0000000F9CY-2Iyy;
	Wed, 17 Sep 2025 22:07:34 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0JH-0000000F991-0NNP
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 22:07:32 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-424081ae9f2so1219305ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 15:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758146850; x=1758751650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O00X8I4EestpaFHM5Nwo1tPeldmi7z2kuF+pQ0jsL/o=;
        b=VHlYTtsnL4KnenxQlrPxcQc0k1GKGam2xhoc4GpeoljDIoqhNj9mzYBXCrbqFurMbn
         zMFKJxA+fgcsZuzPjcm9iMnWvu0RM9du5OUI2NYfxHCoF8PuI5q4wzYammJlf8LApRHJ
         AcP6pjpysmK2lZO7SyXesV3MTXd8xW+DZkaLBMb7qgsjVYrl88Tt2CWP+dZICweSyxgl
         l7L5IzD2pdEompp6BaIYA5wkL9C7NI8+Q1b1NewwFHkwC2SXbO3FIiv/PI7Kazw7wZbf
         by6+K8DSSsZChCMF08iREGKwy+eJTOci4ZIFVOwVZ5+HnPtoZ/nW0iiF6Z1PI2gw50G4
         bNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146850; x=1758751650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O00X8I4EestpaFHM5Nwo1tPeldmi7z2kuF+pQ0jsL/o=;
        b=qr2FU5ZwHSU3TCV2hECZXm8wS3UTAfgtKBcTt3tU7iunY+zKcODF00/+vKOCVI0jL+
         liHYfS5HXulrK9vxfm1+dR89Ij84sBkLpqHp0nRuKEH8aiiPbSpeeyNeng4uaDmdGA6K
         GM+xMZLv+9Nf5shy7zxLY3mUBhctYnNUeK1GapsWbNvK65zT5Xq/0hTHOip+3gzrxZD9
         uGtq/LoSSTeR6cemWZ1JXUpGxIUcvaOM8vX5n5GAnI1NuQsWj82jR1YzHOCy+H2xsa1n
         Jurz6S06nJ1G5m4D3luXPvneA/WZjElljxz8MIUwaYgyi9X9ioM1Dr+ytoKilE8eMHMf
         n9uw==
X-Forwarded-Encrypted: i=1; AJvYcCU97pA+NUsPOBhVjqvN2rDJHicdYXnAECOIstPy1IpujXwDbM18OHJNIR5ZN5J9NxMdnTRDe3bpnGNgIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7JmUo3ISxzP7x+twrWsxJ/UeUfl9nunNa6QWxifeD2YgOf7M4
	b/e0nXNUWvGi3p8So4XWnP+wP9zUQ6SA9Xfd3scXRaApNtyvsJHjrFclpSS8YKY4L7s=
X-Gm-Gg: ASbGncv7CB1jPHNvvCcySNMbgUBv6g0k0A8XqeTRzS9CYtpbbKFhNVHhna6D7JHPeex
	CtsIf5PwK8/r+2B2NOKqRT0UN21xCid1WC9FscMu45kS258DGxmSjqNYeBrg9cmjVHXNfxtGckZ
	Qnm7jk95k3PNcyyXeQ1UIttRS+iTmJTUoXO1H1b2BzOJ6dlarvLQ6WuKPVnb7RSOMV7gtSqWLiS
	tj4SW76fjw/dEk/zk0lpnsLvX0MjyYaJa1waGufDVtDviQvYyUn4IbZsgf7L+gdv4IRbgVGStWP
	tPJpEX5kolVQhoT6JzvYd/nWuZWvG5hel6V4115Ie5fdFKtjLt26sayGyZiIBDtvHaZJqTrwzE4
	VgsDwdoY8juOi1aAftCWQL+5lVbHjGRzt/XnQMro2S0ePHkYPgaCHfIE7kFavXzY4vL3IsyOAHd
	fnNnQ9AYfv
X-Google-Smtp-Source: AGHT+IHLVokmCo/lQggG9vmsqXV4YnaHaWdJqCCztWwsUDldvrgs2sfRdEFI4EmXfG+REFOg9/CmjA==
X-Received: by 2002:a05:6e02:218a:b0:3fd:96f6:375c with SMTP id e9e14a558f8ab-4241a54ae45mr48172145ab.28.1758146850031;
        Wed, 17 Sep 2025 15:07:30 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9f6fsm2346335ab.22.2025.09.17.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:07:29 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Wed, 17 Sep 2025 17:07:21 -0500
Message-ID: <20250917220724.288127-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250917220724.288127-1-elder@riscstar.com>
References: <20250917220724.288127-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_150731_133300_5C59F810 
X-CRM114-Status: GOOD (  13.05  )
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

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..5abd4fe268da9
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,94 @@
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
+    enum:
+      - spacemit,k1-spi
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
+  spacemit,k1-ssp-id:
+    description: SPI controller number
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+    spi3: spi@d401c000 {
+        compatible = "spacemit,k1-spi";
+        reg = <0xd401c000 0x30>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&syscon_apbc CLK_SSP3>,
+                 <&syscon_apbc CLK_SSP3_BUS>;
+        clock-names = "core",
+                      "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts-extended = <&plic 55>;
+        spacemit,k1-ssp-id = <3>;
+        dmas = <&pdma 20>,
+               <&pdma 19>;
+        dma-names = "rx",
+                    "tx";
+        status = "disabled";
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
