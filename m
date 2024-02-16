Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8819EC48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 00:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJ4zujgx4a1Jm99lPxZ9W+NKuHLMjtUZcAI/HrwGl9I=; b=MhltE22v/khT2O
	V74otP8mvDJM8BDDGygAS79J4UL9eH5dCO6QaK+wjPFkxBTSzY/Q1XgswQmXpRyarhxVC23VD5sK9
	SUGmS0R6soauntzrIo4pirsk87mn6YCaQyVsOwSEvHwrkSs4fvtcbc4YZVAFQLTh2wFBfTg8Dpy/0
	xJcMH+2zbTz9KZ5L/W/EekDiKvun6yLT4M1MddBAsszLmIcEoE4FU2UOVE3BKhDEoaNrwnCw4HKnI
	Ic6aB4zucucpJUjX6cztpCmxgPi9jn0IOwsyPdhxwu+eqDusUMaywdX16g6dGbycGR9fYqETJeZjb
	epz8CfwJNYbUV2eKLy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralmn-00000000Yke-1nPH;
	Fri, 16 Feb 2024 00:09:01 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralma-00000000YaQ-1Lra
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 00:08:50 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so919466a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 16:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708042127; x=1708646927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVhGY5w5frFGTLRRHW7GA0aZ7SPA+FA1JdXFhjNvDZY=;
        b=SuxfDFVr9DzWh7QiR2QSy3FLOaDborM6UG1AVmP5XF6AATkce6cZxIr5ixBvllN5r9
         lCAGOq3cdpkx0jjkonBbSlR6IJqeMo6RwZreaIwjnY8W1BX4uRW0Sv3TVCni4/+I2njb
         lQF8p1CZytf7h1moqcJqYHWWQydPbWM+1c2tUbGCTrBZZsoYObEge8/3U9wRq+YOl+KN
         6nY2bwumYpLtK84Qx2vzhSqgT0qOevU0MnM8ufd76Ww7+DeoO9VNKGgF3wIikwd7qZFb
         vMmnu+k7FtU6Skjm2frHE0jsUfSgzi+5Li33YOMbl6YvithRKsJOtN0Qbga4Jy36udFh
         9THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708042127; x=1708646927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVhGY5w5frFGTLRRHW7GA0aZ7SPA+FA1JdXFhjNvDZY=;
        b=DWcjHcPbE7YQbS+f9N05aFriIJLXBtxowiZZiUds4gdRFbIqJloIqNGgoHc5RulSsv
         eb/Hi12v+2qwNFLzABTaktfsO2vjZ28IO3i6EeGdpdBznoMPextVOKBWhL2AoX4xaKTu
         CdACFDRFHK+Zi6BPXcBkGJ+FnKbSsOB4XzHFx7EDu2FBy0rKzLpynvJjewlgHbBBplYT
         VlUFtLCV1XsKqxL1YpfNTyLhZ0R70GFot0AIciW90u7AWKDI+jNnBV5Lyb1XwvrU+EvV
         O2p8q+279iApciIl4etUjxRFxWGXMzS6ZNO/dNboYAyUphkR8QcUg6STcy8UsruNNEQM
         u67Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCSQG+lf9/WgCPw5+KDmW8nKqMFZjgCRTd8dz1SaBZSroX8MDnhmNgVeyPXULJOuHYkPaw7RjF5AgiOOdL19Gjr+I3vBgEn5jlhew/XRN2
X-Gm-Message-State: AOJu0Ywa4cZUgrAnJDBRZQfhdqBOvWQwzfiXuVM22to4macoF1HH2Xcb
	ZFOB+FPYdfd/yIXUbnIu0Ie9sWAQYqL+APIoyBSiaM1PhjPjIDVk3cfL+JMToC4=
X-Google-Smtp-Source: AGHT+IETLEvEo995N/RIp3zMdESx5S+hcPKSxSPuG/aIgheazSPtzHakRWnlA/tfpia2Ssum3vBxWA==
X-Received: by 2002:a17:902:d48b:b0:1db:8181:9d04 with SMTP id c11-20020a170902d48b00b001db81819d04mr3724031plg.38.1708042127232;
        Thu, 15 Feb 2024 16:08:47 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bb6-20020a170902bc8600b001db3d365082sm1789486plb.265.2024.02.15.16.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:08:45 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Lin <eric.lin@sifive.com>,
	Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v1 3/6] dt-bindings: cache: Add SiFive Extensible Cache controller
Date: Thu, 15 Feb 2024 16:08:15 -0800
Message-ID: <20240216000837.1868917-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216000837.1868917-1-samuel.holland@sifive.com>
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_160848_406473_349A7CC0 
X-CRM114-Status: GOOD (  13.13  )
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

From: Eric Lin <eric.lin@sifive.com>

Add YAML DT binding documentation for the SiFive Extensible Cache
controller. The Extensible Cache controller interleaves cache blocks
across a number of heterogeneous independently-programmed slices. Each
slice contains an MMIO interface for configuration, cache maintenance,
error reporting, and performance monitoring.

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 .../cache/sifive,extensiblecache0.yaml        | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/sifive,extensiblecache0.yaml

diff --git a/Documentation/devicetree/bindings/cache/sifive,extensiblecache0.yaml b/Documentation/devicetree/bindings/cache/sifive,extensiblecache0.yaml
new file mode 100644
index 000000000000..d027114dbdba
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/sifive,extensiblecache0.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2023-2024 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/sifive,extensiblecache0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Extensible Cache Controller
+
+maintainers:
+  - Eric Lin <eric.lin@sifive.com>
+
+description:
+  The SiFive Extensible Cache Controller provides a high-performance extensible
+  system (L2 or L3) cache. It is divided into several independent heterogeneous
+  slices, enabling a flexible topology and physical design.
+
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sifive,extensiblecache0
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sifive,extensiblecache0
+      - const: cache
+
+  "#address-cells": true
+  "#size-cells": true
+  ranges: true
+
+  interrupts:
+    maxItems: 1
+
+  cache-block-size:
+    const: 64
+
+  cache-level: true
+  cache-sets: true
+  cache-size: true
+  cache-unified: true
+
+patternProperties:
+  "^cache-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+    properties:
+      reg:
+        maxItems: 1
+
+      cache-block-size:
+        const: 64
+
+      cache-sets: true
+      cache-size: true
+      cache-unified: true
+
+      sifive,bm-event-counters:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 0
+        description: Number of bucket monitor registers in this slice
+
+      sifive,cache-ways:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Number of ways in this slice (independent of cache size)
+
+      sifive,perfmon-counters:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 0
+        description: Number of PMU counter registers in this slice
+
+    required:
+      - reg
+      - cache-block-size
+      - cache-sets
+      - cache-size
+      - cache-unified
+      - sifive,cache-ways
+
+required:
+  - compatible
+  - ranges
+  - interrupts
+  - cache-block-size
+  - cache-level
+  - cache-sets
+  - cache-size
+  - cache-unified
+
+additionalProperties: false
+
+examples:
+  - |
+    cache-controller@30040000 {
+        compatible = "sifive,extensiblecache0", "cache";
+        ranges = <0x30040000 0x30040000 0x10000>;
+        interrupts = <0x4>;
+        cache-block-size = <0x40>;
+        cache-level = <3>;
+        cache-sets = <0x800>;
+        cache-size = <0x100000>;
+        cache-unified;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        cache-controller@30040000 {
+            reg = <0x30040000 0x4000>;
+            cache-block-size = <0x40>;
+            cache-sets = <0x400>;
+            cache-size = <0x80000>;
+            cache-unified;
+            sifive,bm-event-counters = <8>;
+            sifive,cache-ways = <9>;
+            sifive,perfmon-counters = <8>;
+        };
+
+        cache-controller@30044000 {
+            reg = <0x30044000 0x4000>;
+            cache-block-size = <0x40>;
+            cache-sets = <0x400>;
+            cache-size = <0x80000>;
+            cache-unified;
+            sifive,bm-event-counters = <8>;
+            sifive,cache-ways = <9>;
+            sifive,perfmon-counters = <8>;
+        };
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
