Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F885C48BEB
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 00:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzUKJypUbWjDo3TcbJaamSbxdkonAv6Yhmz3MKOU9o8=; b=VQYZ/OiA6myNw/
	gqyfLiHWAMraiN5FqvvjDaebO/OLccjNtI+9XrpCCJMKfi9i8AdbKTfJVLM0m3rzhfv7lAea7VfRo
	p7wQlheokKjABbSKzLIOxa88F1ysh3OtwJF6+WnzIpf8Atv8vgojXsdNWgcBS4vMWk3rfvMqYXqcy
	lPupfoDBV8bA5CSXmEi1yJyip2IUJ9QpvVx+69N/go4hEtz9V+OA3puLOCd5erG1ebZxLrBvOyCtL
	UJIZdpueuJtW6ZiPGl8QHJCWipC/nSPGUdmEhbBOtzsODCIhyStqxxxrlzXUSBhEuZ80MGaytNio6
	Qwkkk7m54dJPWgy6hOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raln8-00000000Z4B-2YJE;
	Fri, 16 Feb 2024 00:09:22 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralmf-00000000YdA-24ke
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 00:08:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d8aadc624dso12597145ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 16:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708042133; x=1708646933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGHwuS0ENdmLMLz6bWQqaQXZhO2uE/iwucpykSfpWsk=;
        b=YdIxGRZ2bqb831ZhYX0Byh4fBuQQGIAou0161St4j+Muz9Kej22t0tja7bW+LBrCSj
         3vbneukX/aQIyI8hgRODewHrK0DGggp1MI0Om32ID3np7KRxf057spx1Vwz6YK6R3Enn
         C5DFSw+tvcNOaBJEt46eSztZJHoBQ34G4k1Kd5CmxqxHGOeAEN2Ms3zgBCWm1blKzOKH
         eCW71hBhI1e5Ym8e6njcFnEcYVRAqK0/cCf2JPlDAWzRDrG8wJJE30Zc98QV4oM+9klx
         ZWOObc/Im9XBc+JE3KGK1h4cFBE1BRDkTyAIPeqW31dqUI8aPT+ezrnS67hz8TjDLrMy
         TusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708042133; x=1708646933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGHwuS0ENdmLMLz6bWQqaQXZhO2uE/iwucpykSfpWsk=;
        b=XJxCs6C2kCW+pR+/uNYTMlhJmdvfdrzqBpKaTtzrEYKn7Y/QGBqUNsDlFRu4TbVWwE
         chhdvp+lbfwPw4TqPqnXlMRog737IXYMbm9W0V3AOrpvXgygqTyByM5dAkd1IhJVpfv1
         VrIxdy7kVCNnEwq+PIB5jFv5kT8CYLXVgcwdKXectppHnK7ZYVwYjOynU2PzD84MEYkY
         L9wWUmalL+6/LKzQQ10qp5LsczrHZJr5yTPkzmrIrh0CulA9fSmacys/LZ8fiuqMm8og
         vhPErSl+chef6TLrK52Dq68gnAbzbQIaNjnHKvDm+750hctCQtrCIh6wrc6wR60AKKtB
         rbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMfhZDY5CJ+dJhtyWLhgZQ+7y7oFD6ylnjZb1pfJOxSYyg1L9Xzw8N/mZWKzuAEgiR0luZ8kQ0/TQLQswbnC+EATAtyy3gr9l4lgWWj7Vj
X-Gm-Message-State: AOJu0YzZ/LEX9riXKB9J2wPSlXYXDAM2Ag6H0qzN2Kk7ji1l05HKi4fQ
	ZS1vFOWZokkvwrlv3vf/uftriaqWnAB1yOtCLUNi7rjhA0+hfVfitrWtUH0AXsM=
X-Google-Smtp-Source: AGHT+IGthcOdIu3Gkfl9BOtBJNngVNNV+UiNIDvn/Iv90Cvzn3/WrJ1BIiVXy+QBXOWjOFCbm+O8LA==
X-Received: by 2002:a17:902:784e:b0:1d9:ba26:effc with SMTP id e14-20020a170902784e00b001d9ba26effcmr3177476pln.51.1708042132885;
        Thu, 15 Feb 2024 16:08:52 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bb6-20020a170902bc8600b001db3d365082sm1789486plb.265.2024.02.15.16.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:08:51 -0800 (PST)
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
Subject: [PATCH v1 5/6] dt-bindings: cache: Add SiFive Private L2 Cache controller
Date: Thu, 15 Feb 2024 16:08:17 -0800
Message-ID: <20240216000837.1868917-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216000837.1868917-1-samuel.holland@sifive.com>
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_160853_785506_2B859A7B 
X-CRM114-Status: GOOD (  16.20  )
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

Add YAML DT binding documentation for the SiFive Private L2 Cache
controller. Some functionality and the corresponding register bits were
removed in the sifive,pl2cache1 version of the hardware, which creates
the unusual situation where the newer hardware's compatible string is
the fallback for the older one.

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v1:
 - Add back select: clause to binding
 - Make sifive,pl2cache1 the fallback for sifive,pl2cache0
 - Fix the order of the reg property declaration
 - Document the sifive,perfmon-counters property

 .../bindings/cache/sifive,pl2cache0.yaml      | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/sifive,pl2cache0.yaml

diff --git a/Documentation/devicetree/bindings/cache/sifive,pl2cache0.yaml b/Documentation/devicetree/bindings/cache/sifive,pl2cache0.yaml
new file mode 100644
index 000000000000..d89e2e5d0a97
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/sifive,pl2cache0.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2023-2024 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/sifive,pl2cache0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Private L2 Cache Controller
+
+maintainers:
+  - Eric Lin <eric.lin@sifive.com>
+
+description:
+  The SiFive Private L2 Cache Controller is a per-core cache which communicates
+  with both the upstream L1 caches and downstream L3 cache or memory, enabling a
+  high-performance cache subsystem.
+
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sifive,pl2cache1
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sifive,pl2cache0
+          - const: sifive,pl2cache1
+          - const: cache
+      - items:
+          - const: sifive,pl2cache1
+          - const: cache
+
+  reg:
+    maxItems: 1
+
+  cache-block-size: true
+  cache-level: true
+  cache-sets: true
+  cache-size: true
+  cache-unified: true
+
+  next-level-cache: true
+
+  sifive,perfmon-counters:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description: Number of PMU counter registers
+
+required:
+  - compatible
+  - reg
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
+    cache-controller@10104000 {
+        compatible = "sifive,pl2cache1", "cache";
+        reg = <0x10104000 0x4000>;
+        cache-block-size = <64>;
+        cache-level = <2>;
+        cache-sets = <512>;
+        cache-size = <262144>;
+        cache-unified;
+        next-level-cache = <&L4>;
+        sifive,perfmon-counters = <6>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
