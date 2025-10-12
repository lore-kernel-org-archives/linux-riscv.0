Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8DECCD18A
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 02:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3FjStlkjZCkrkJn7MbRMb7UgkruYkmc6Z5Y9msil3Y=; b=jQJzzNPwLnrb0D
	mvf3nH3/os0sZbPfNwjI0t1kR+t0xYDyrXuZ1agXp7a36Yy9kE/rJufyEuDJPjdIJqJYMGVYxhddd
	EZv/vP0dvuYlHEi1TWYJTXpOeaDIImdk5gvO0Ml2nn1ke4m1wctljznpxZiuUEth4I2tYEcK1TKDU
	3iU/582fAItq/+3aliUgqkyo2IfD/+DtoJ3lxW9oIhsZ5GPwnTfJqGZ2Nj83WzqV+gDA4LJtuL82f
	Kmgumwrpu8qFqOOGFFjP8uTIRJePuq92U4S+s6YXG1KZtkaSzhGXluZXJy/APBRgLKrDJFm+Ed++V
	h9zJ9Ye+Ru6YVM1mK0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7lmv-0000000B04P-3qbD;
	Sun, 12 Oct 2025 02:26:21 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7lmt-0000000B03P-0x1L
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 02:26:20 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-78115430134so2172899b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 19:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760235978; x=1760840778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYj9BHj7cwVf87n8ZMWQnat/cLLuDjVQjaIpUr5Z/nc=;
        b=X6j71GsmPXmKf2lx6ImgljVe+ohfbeCxYIAr7i6fr3QrUNHv3yZ4CBlonsUfdYTg5a
         dyPWOfd0YYXcFRLUqYTqEAsZuuWGhGuf1dE6p0We+OxjwXTmGAJ2+fr0T9I6Ro9FjfKZ
         A8BeEV+06IizMLf/nWmHsEevEsuA8aGaVa3vDcoQz4qFZGijkS3f4WrXxOOI/ZdwtvwC
         9ERcpIwc3zQUA/BHVyrMwpu5V9nWkRudRsG6VC9sc5d1K/rwJ9JgvD4zc3zxihYT6R2V
         DpHlezjiPEw6zKRZT0FHvr2tvZd4K8jjDlSWhI6LvndyZQ3ttwymJfUrHNDv+ZaPRxaG
         s3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760235978; x=1760840778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYj9BHj7cwVf87n8ZMWQnat/cLLuDjVQjaIpUr5Z/nc=;
        b=vOjsc7qUfFNVijjOKFp2vteI3DRRStwdmRzpg7Iu2VxzI/bF2DN1fBfuY7HuzKoMAf
         l/3egtCVE20DoHgxES+XCDudb/CvwijV8WESiG2wbS+2J47M5iXXfOl8S2MQN7zutN9Z
         r9HHpWkMVKWssj8ffJPV2FRCVfGUwsNdld2fzmRRPPLnicghfECytoEHdA9Czt5NIPhs
         8vClBQd1I/QH4nsPgLSPYwHdSFp9WVtXRkIai87tGTXyakchRd5b2PMFAhnE70nuxkBN
         k8IUf09EN7/5RLkzHm4c3XMGLYiiLjZehkCaEEo8DPl0KsYmu/2Nez6rX80Ewgdm2S2h
         M07Q==
X-Forwarded-Encrypted: i=1; AJvYcCUImhfWrBzzPHJBOEjLvyzU2fuCifGtRDCWxX3XCjWXbxMt2x2eBWPSGieQM26zP3YvwI9bpsm3K22q8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YypzKOlUawirxN/9ShDnFkO4uIaIq2RGheT71lCV1Ofh5cGvX62
	k9z4W4r7xLaLesS0U1IPipToQeKwD19egKoBJKDXEQnQM1+wJRDVxIjj
X-Gm-Gg: ASbGnctYuQ66v4x5nkOnNt6q53OBAc7+ScBxhzDtMKp4kM19FxXYTECOsHglIjGjzUg
	jXe6fRaVbM7DO9qt0ArCzdqu+OzUdDoZTe6bndq9Pa2p9pp0DFqdUqJgyNge2A7ZGPdR2laj0JW
	TCn8x1dkscsbJiBuP4HzdDQWveT/tNP88MiGLO37Hu3oyEqNFiYh4KGixXSAfrCz1yH/83yvwZg
	PpQGOd2ImpII/fJLWI02ovVQcrE2JWiyC0fVBL6NPBv5cToFFeU6vyMe4OcJgM/RhJDHtIrowZw
	4cskUli6VW/UVAsUbwf9WhjiS2WET8WN42eUYxaTIqHyvJf3nBw2rGGMlQ5FHNbjIuNpm1+FLKa
	iFg1pP6SkDgHDrYkrwcewMFRN5g9DWs22Agb40XpL8aUyts7HyzqNXLI1fX/ExsoG2v1e
X-Google-Smtp-Source: AGHT+IHkPmQUQfunFHahd09uFFipzQG8nUYJ4jLN6bvERJ5STyPU28/LTOdCiOsyRzsvL6DNxvTF7A==
X-Received: by 2002:a05:6a00:1394:b0:792:574d:b1d with SMTP id d2e1a72fcca58-79385703ba7mr22526012b3a.14.1760235978345;
        Sat, 11 Oct 2025 19:26:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm7180489b3a.80.2025.10.11.19.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 19:26:17 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Sun, 12 Oct 2025 10:25:52 +0800
Message-ID: <20251012022555.6240-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012022555.6240-1-looong.bin@gmail.com>
References: <20251012022555.6240-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_192619_267747_F85DC70B 
X-CRM114-Status: GOOD (  12.44  )
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

The Sophgo CV1800/SG2000 SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..d1993f2156b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X SoC top system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The Sophgo CV18XX/SG200X SoC top misc system controller provides
+  register access to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,cv1800b-top-syscon
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "dma-router@154":
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+    unevaluatedProperties: false
+
+  "phy@48":
+    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@3000000 {
+      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
+      reg = <0x03000000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+    };
+
+...
--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
