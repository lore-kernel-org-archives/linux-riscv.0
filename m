Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF8CCA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 05:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKCIX1oNhpo17sMMrFYR/ncMJ3Y5LtZj2KGcASSBVME=; b=otGrlSgBZ/FVAi
	ttARd02MoAJd5fQy5KjjovAeMwBQzUykp4XQrGn1UR50hZFUOnlCySAcErvnRyflCwAebNtVtXMzk
	KiFjsnUVO2AnCZ2NAxOH33QVEi+LdzQ7G9CCDrwmwQYBtIWrekw0RjbCgqiClL+z/ysqgRYnKqvEj
	5CLXhJAY+RNzHUHbGdFPlTf9bS5POtbyaYGvYyHU56pOfFePKgjl+96Bm2t/vRtN76HDQeBBdNy9g
	JFSXyB7CRwEAEFWIT7rqdSspkFannSabmA35tSAfAOusX87c9hfB//2eqEp0JEJZX5krc24URBdii
	PS4rAVvsn4ryaPA570+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummp0-00000001VDA-0BkY;
	Fri, 15 Aug 2025 05:17:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummox-00000001VCh-0rKv
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 05:17:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-323267adb81so2191247a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235062; x=1755839862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vkEUWx4ApcUAYfHaiLA5bQPo+3iU22SJCSyaMQIr1g=;
        b=wYJRA+OQbVoPUWz7TZlX6sp3xsoUYWCKSstHMazzN2IVQmt7pjssF3EPeVCASJYnWR
         guxP3lvEITMU/fwa39GIVGP7yTVsBGnS1f4dA7jXdh+JZavVADoEVWNJe0DI3ejCq0UG
         z9eWFSduwXR+4+oOjdg3V+euw/Ljt0Io0kGmJ+WfQ+v9AvUUzQDyeltC2WMZLvN/B0ka
         dtncO4BpjWZ6LvXNBPSNDuWgPJd+RxHJ+hsg7wJf+clTenThGPzdIV/808xljn8G352s
         qSQ+vyqVJrWnB5w4qbwh8GOeFd/pUvNp6KGKZT/9vDSMFor2jj/Vd4WXIyDmhHUygOeH
         sopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235062; x=1755839862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vkEUWx4ApcUAYfHaiLA5bQPo+3iU22SJCSyaMQIr1g=;
        b=S9w0xUdsiP0wWHMLQzJDc2xhA1bLaml87XLDT8gWr9JRgWd1ymuuvAaxNoLxK4Ephi
         Qt+lnLGfY+azvkJV2dE2PtWNbsS/AUw1nKAxVYmyrzp83cJlutnuJgw4uTXdXmu5sgB+
         49T0irHzgEPmwD3x5s+ZnbCKGa3ZSNQlQeJLHcrAC2gLwbGYcAi+6ZQT+TdUu+rHt5bs
         MBaPXZQXmC6MxDT4Kv7oSsV6mLwII1T883iB9T4mpcl2zuQCPz7lc0FrOG4Xiw4wZZgx
         Lsdpfsx3JqzSq16H2mQ6XOYVlV8rRVmlpcxk3UHXF138JoDIWWEKQ66wWpdkD+Riu/Qn
         gz/w==
X-Forwarded-Encrypted: i=1; AJvYcCX+qy+jp14BPkVYTJJHluorb2y2B3QrBVmbP5PjwCeCDDvAeZvpQzVilOi74N8fgehUStCxLH77/mZm0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVTtRXENi/jjd39S0P+aR7WoGVA61lHOenqvQfMf1++Unx+tCg
	HN5ABJn0aF1vH42ip3RAROE3XvShEV1H08Oy2Zvkk32eC2e4+CU8n5y7v1QTchGsFKk=
X-Gm-Gg: ASbGncuzEVUtfEHKopE+K32BhY+hdjn6iLSe1Iwp8aFcb1zqS8aqSdOnGU8xZGphD48
	Mloenzps4IuzQKegwrRjEeTEymnuhOjDleYY41BCGvc039V2GZfXK+wv2fbRUkoQd7SfOMbjL1h
	ub+wJW5MT6f99s+kFoQA4Lbhp3XT23rmvCGi3JePvvMXy9nQi20X6SlTsCdusDy+VKpBeiBDoNb
	zqYxGqZhPzLilXCCN3KE3GlazybmHxH3c8lDU070cEHJdiIhfxrjXdKCyeccWlSB4Qyxa6r6q31
	jq8Ixm7vOcTn7K0fLXlH09Zt8FbShO4gsYeHm+CIsutzAMDeoDaEMOQDMNDYq3Q1kf+ofhHli6c
	+YyNYjus8Y1tNkEZfYg7FXQ==
X-Google-Smtp-Source: AGHT+IFTKeXgEnlIDy0KqXwtx+2VP65MxZYH7QZqWJoZ/KdOMgZpYOBqgpq6r0AT7UDzWXnhv2iXng==
X-Received: by 2002:a17:90b:5282:b0:31f:1a3e:fe31 with SMTP id 98e67ed59e1d1-32341ebd876mr1637598a91.11.1755235061634;
        Thu, 14 Aug 2025 22:17:41 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:17:41 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:23 +0800
Subject: [PATCH v4 1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
MIME-Version: 1.0
Message-Id: <20250815-working_dma_0701_v2-v4-1-62145ab6ea30@riscstar.com>
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
In-Reply-To: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_221743_251633_6B04981A 
X-CRM114-Status: GOOD (  10.42  )
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

Add device tree binding documentation for the SpacemiT K1 PDMA
controller.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4: Add Rob's reviewed-by.
v3: New patch.
---
 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ec06235baf5ca3ecffe7dba9bb425b242985660e
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/spacemit,k1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PDMA Controller
+
+maintainers:
+  - Guodong Xu <guodong@riscstar.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-pdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Shared interrupt for all DMA channels
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dma-channels:
+    maximum: 16
+
+  '#dma-cells':
+    const: 1
+    description:
+      The DMA request number for the peripheral device.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - dma-channels
+  - '#dma-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@d4000000 {
+            compatible = "spacemit,k1-pdma";
+            reg = <0x0 0xd4000000 0x0 0x4000>;
+            interrupts = <72>;
+            clocks = <&syscon_apmu CLK_DMA>;
+            resets = <&syscon_apmu RESET_DMA>;
+            dma-channels = <16>;
+            #dma-cells = <1>;
+        };
+    };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
