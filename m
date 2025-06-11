Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E847C71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3cpchD/SKFJr2IbIVBFrLVwJfFmxrHDaLUlHwqf5t0=; b=Vskr5vQY+gnyIz
	ZToxTYKj6e53t2XSuTk8aAuhjl0z4F7mzp1853GZDou0gdH/3aRts7G/yvMO0Rc4XOsAnWGKyvpgM
	fRnnBCkJiMqweNABV07HWqVCYBKzwtd6Ja7q43LYPSV3WmA6DveeqO3Wo3uSLEitVGwFt8QNpYGCN
	4d9ZXABTHjg/azxWGX2w7EwzAFVXfQx4xiUNK2YIu3zCGJKtzFaZiSt7JCEy4zhps7Ax9SIo9Tt6d
	LLFcSO8OqIWsFtbo5HpfwsjXGiJ/lPXCIlgpodTw5WhamTeSMdJ4rWHx+L9V1BLo8+5UOnvmBGGaf
	T0Z505SjXilh3/W2J+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwR-00000009I3z-2Ult;
	Wed, 11 Jun 2025 08:36:15 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGmc-00000009GO6-38GN
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:26:10 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7d0a47f6692so638134485a.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630366; x=1750235166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgBBlgf2A0kFvnU+OMHuSn1vM73oxJmf1nlExlQ6RqI=;
        b=gJ6SOA03xXXNxN7/aFjHwEoFhFII6yA03KSLf6DOwA7bzZ7hosEUvfbsA3rZ7/XU/S
         EcG4DAC2n69Vg28XX4g2TmUww4BUu4rIAgMlDNm3ayrBZBgjSGCIy48dsl/4e0tfQX3i
         +0Oi8uIo9LwwOD5GVHRBBbGURGefEiKzkH2/bd0RYXCkRoq3HVpxb8uS8h8ScyMt0OWi
         JiibCWMUriw4JhFd23OOu4NJwrOJ7b/wrMU0d2w0E8WKly0twIUDGoXFjNt07mFnRI1H
         QeuxgUqRbpdX26rfbVKLrjMdMaZc7ARFwgJoowp5miOeXR0OifR2p4B/E8PzcPXAXBwn
         XTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630366; x=1750235166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgBBlgf2A0kFvnU+OMHuSn1vM73oxJmf1nlExlQ6RqI=;
        b=PCU6grmT5r/S57RULQNfeOCBY0h31cNTLVeeOE0mp/C7tgDh15n5lp6O5uJCA7btcO
         s/Zn9QcUAhn7OgIxBNMOfwyTMX164S301iYZoKPjSEy/PoZLlLFZCYomDCNuau3xlr6c
         xzY2PitNJGZPc3ke2buWgye+FBWHnj4vrQ7nsHOGrjJw06LwUzQtsAH+qaGf/I5l5WSe
         hUSFGscfUiGhwQDssJ5rtG2i6NrrUcOqI/WSAxMIqmQM+iQ6gHwOLIQlYk/sikQKtCfM
         zWRqpb1foU8o6avnvpjFUJ3DYWikxt7/wXgFaC/huQqPqMBpo3pf6bYvQnAF8S3+XYT8
         kcXg==
X-Forwarded-Encrypted: i=1; AJvYcCVRyZCOkOF+si82sT9Pr7Xq6Tyc3fCPyTPZpvr5skUI7tPHQlWD4O3zaREwtX5Q/Sv/bJ7bxl5ZJND/xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YywlTJRbv8QdAt+JXN0OciPQQWbHRXcoF6utjYxox2YmB3rKxtY
	B7PQOif9jQT7E132ym56P3+ofzvgYQ/qJd7ujv9cs6B0wYAwYiNHklJ6
X-Gm-Gg: ASbGncvQt3eHhQRTP5czKwrpYhwkfyFa1Tbb266Wcdoh9WTDz1pfk4Io2d8VxdUKirz
	IvfbFqBU8t5NE1mVEynexv+/CoieApYRV42gVx4TdoDhxKXj03Tt9Ai9PyMVwvaNRslpPMXe5Za
	KXP6dK05N3QbfJFEHk+97Oya9lSpk01fUhvqiDuDf/nyBCshoXXMSURWoxgr3YEZRFw+973reAw
	LMsiUkLE7fDmOLY4d+p3s40bdyJkZ5iSmcyZ7uQA5z3rOw24XEozAm8LVbuQ5WEsfQ3j/doQP8g
	0YLBzPqSZJ0G/q4VxcHH6XEMIE0jB4fZG0MwlQ==
X-Google-Smtp-Source: AGHT+IG7wxcIgsJM1bVKh08YV2G5x6CsGODd+WUWOe41/FWpBrES04p7hjkIFnpAjS6EYVZdpYt5CQ==
X-Received: by 2002:a05:620a:4014:b0:7d3:8a6b:d24d with SMTP id af79cd13be357-7d3a883473dmr332522985a.24.1749630365571;
        Wed, 11 Jun 2025 01:26:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a5948f8sm838959685a.49.2025.06.11.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Wed, 11 Jun 2025 16:24:49 +0800
Message-ID: <20250611082452.1218817-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_012606_782908_FB6A77C1 
X-CRM114-Status: GOOD (  11.69  )
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
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..e8093a558c4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,57 @@
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
+  "dma-router@[0-9a-f]+$":
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+
+  "phy@[0-9a-f]+$":
+    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
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
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
