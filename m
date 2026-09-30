Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7BECA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZ42petiYgYjK8u6QAw4/J+r80FOgMteknwvOADTZvk=; b=sl//D1+VU1o24+
	JNe4BDVs4Jfa9AernB9ePxFXzvEFWMtG2geww+7jIjbrGRZLCEcZi4eKaSoVDcF9p1v1lpdxCy04I
	SkPog+PgrcQnNTzg+Z/8CMa+235DO/jI3zdcMtmp3uSSv8bucRY9mArliBC/1swZ5Sa0PsB2r5y08
	yr8BcBWmG4DMHM9Cf/SS7RoSM/48AT1BRQlpLvlUjqOb2Wa6j5TugArOQQlfW9xWZe3ZmPG9s/i3B
	7kHlMdV5b2saISi5L9CZSrl/rdYC/W7tS4Fh3jgl5qzc8Nd3x9VqOzbYdyKspEkCuVJGjgXIczrgw
	olvxInvq07WRXPQXsPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwY9-00000006ZWA-2Oyv;
	Wed, 30 Sep 2026 15:48:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwY8-00000006ZV8-2YFP
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=; b=WKZAs7mVNjTbCETnrhj+vMv42Z
	NsKq1nroOZT3NxpK6T27eX2gXs1Pxa8nlpgVHWDZ0EvEG6EDQjyLt8ceLNhhIidp4AbJeJ8+2pidU
	gidVqQuvh66xNea8NmMvzEZmzGX9yMBHhLpNCA/RBLHRs5TSUE8bTH0RukRlhMZwYSpjNXPejjmM5
	humZDJaPTayhqdbb2Pjx9A1V0rP6+1OIVSdANm17AKahjt525UK0gJt0ek/r1XYpaf7ze5HF4CCgo
	p4Lu1lnhO9NZmzFkVfdkLRa1ewGDN6lKfDqgPHtZWUfJtW+mjjsXrB5sacDYmoIHQ4BRXeWL6KDH1
	rUJCx94A==;
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwY5-000000041Wf-1sLF
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 15:48:51 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1745108a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783327; x=1791388127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=;
        b=Sn4zoGI2i+f4/lZgCxDRAb6j3Ko73y9oGdofeZ4M7TS0IyvSybYEkCRmw0XyQqWYlQ
         kkMJCu4n9/pQ/QgZG84tDuSy5XUuOLZnb6Xe8CD6Bt9um8B9zQePSlwvSYPOoiQsSng6
         bNbAbSX3If61R4bkkBj74Pthcouhtt8SqqOwXZweOsymnPCBwouhyyzByhlz79jA+lJd
         kyEKqNy26iCV3GZPpGSFNb8Zd1Z1NXqIVD3tzkK61hUzKpaHXBmA+vn71DjugTPeOLcr
         zkSBTjKp8XynMqUY0aQm2ftuXXZhoubD4AIGsdZXC0CtE8ycDEJNnY4lX1+wsrUU6+JV
         yCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783327; x=1791388127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=;
        b=0wnLvRnZXAExZ7d218UnIqbxON1x4iwKRyWBOzVXUYv9VpYtVOLY8C4KFYZge3YrLK
         e4HNW+BMhF4TOzytSJg/mi/SRDXRwZP8DHjjTWobyCtjPpKDAt3iS3NURjCko/R+zoIj
         gECUKiDWhYjeR+etgdTaoYL6nnqrxEVs3Xm2XHjbLYSopuq6QvYvv6aXlu/Zp467eUHA
         fSOzTYJ5F5TId0UXXCNeshZVIjgkNds98hqhyrQuxfSbiBwf2RAiDduAQYFSH7XZpO9s
         OoqnZMKt1kOMeF9wGK1phmtPlfBGn/cAaIRsemHMWgR6htzNSFsIy9LmTABl2Zlk7jz6
         +/YA==
X-Forwarded-Encrypted: i=1; AKwUvBxUnH60IktqacVIMWpE0xwHM5/AvBha31c3oz8lTgFTBiuCIsCICCpBWZwVgvC9BSqZxBZTMFo4Ot7nmA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKQSwXUJRdfO5S3ijSYididUd0KekK4AkIzdiUYWC7L3Qt7lczy
	lWFVetvJlLLc/zG00xvFEUgnV8LUBIHuyqyVylZbnk9FBD3s1eYHuxQufEBgc7OjEctn
X-Gm-Gg: AYBFou0mn4J5S0VvBiwMmPRqi0DxgEelGtZFAXvaQnRGx09jGw0vhI7W3+dMEmYW5T6
	mascvTVDBN04eBC0fRL5zzZEdkSfcocuYPs+4ejA88VZlyEzZBcz8eGEjcRrF6IUju+Qi4ZMdw9
	ocfduCTeBmcK86rtVRVg2v8x6J05Utvro3+icUEJsQefssuteX9JskE2GDWSjESveIqU/jhM6u8
	mR0CImodLS4CPa4ivKBkqGyw25RzpruH2sD8bts18lRRPotrTH8EpcmVOfIWiivHreqzU4gaGfW
	7S3m/iSikpyT+o+H9ItYx4cumS7Qu9m627yGEI0cfh4hRftLTDEPeJu/PC1Pv0GfIH5auiguf4o
	lkOeIOFpLg8c1VUBrLD5WAIVCc78JTNoTm3I56nV01lTXRZkEUbU8ukjWoyjHCWitkJ500emRU3
	HdBUTo0JaqefUQz8SoWtFXtop4CZ88UIiW92f7u/J4R4L+MJL1e9AuKwte4+Mov+ZbmAykPzzIl
	99OnsI/
X-Received: by 2002:a17:90b:2888:b0:3a2:b465:fb8a with SMTP id 98e67ed59e1d1-3a4d1ddc911mr1860992a91.67.1790783327152;
        Wed, 30 Sep 2026 08:48:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: Add Allwinner D1 CSIC
Date: Wed, 30 Sep 2026 22:48:33 +0700
Message-Id: <20260930154835.402684-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_164849_643484_6EFE11EA 
X-CRM114-Status: GOOD (  18.33  )
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

Add a binding for the camera interface (CSIC) of the Allwinner D1, D1s
and T113. It is not the A31 CSI: its parser and DMA engines are separate
blocks. Only the 8-bit parallel input is pinned out on these SoCs.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../media/allwinner,sun20i-d1-csi.yaml        | 111 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
new file mode 100644
index 0000000000..2bfe2cc9af
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun20i-d1-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 CMOS Sensor Interface Controller (CSIC)
+
+maintainers:
+  - Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+
+description:
+  The CSIC found in the Allwinner D1, D1s and T113 receives video from a
+  parallel camera interface and writes it to memory. It contains a parser for
+  the camera bus and two DMA engines.
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: DMA engine 0
+      - description: DMA engine 1
+      - description: Parser 0
+      - description: Top-level block (CSI_TOP_PKT)
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Module clock
+      - description: DRAM clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: Parallel input port, connect to a parallel sensor
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            const: 8
+
+          pclk-sample: true
+          hsync-active: true
+          vsync-active: true
+
+        required:
+          - bus-width
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    csi@5800000 {
+        compatible = "allwinner,sun20i-d1-csi";
+        reg = <0x05800000 0x400000>;
+        interrupts = <111 IRQ_TYPE_LEVEL_HIGH>,
+                     <112 IRQ_TYPE_LEVEL_HIGH>,
+                     <116 IRQ_TYPE_LEVEL_HIGH>,
+                     <122 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_CSI>,
+                 <&ccu CLK_CSI_TOP>,
+                 <&ccu CLK_MBUS_CSI>;
+        clock-names = "bus", "mod", "ram";
+        resets = <&ccu RST_BUS_CSI>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&ov5640_ep>;
+                bus-width = <8>;
+                hsync-active = <1>; /* Active high */
+                vsync-active = <0>; /* Active low */
+                pclk-sample = <1>;  /* Rising */
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f5eff489a8..f4c45c4678 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -905,6 +905,13 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	drivers/crypto/allwinner/
 
+ALLWINNER D1 CSIC DRIVER
+M:	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
+
 ALLWINNER DMIC DRIVERS
 M:	Ban Tao <fengzheng923@gmail.com>
 L:	linux-sound@vger.kernel.org
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
