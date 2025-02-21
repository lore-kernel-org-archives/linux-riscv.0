Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C417C021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4QHgCZC44kVaRSwf2L5QuskiiiMFWHblxy+o2knIU4=; b=jPvUUPs/exxnsB
	Tc1Ce9m1IqofkeP3af2136SXwNwSBvNf+0surGIxaEWqjoZKm+2eNGhtxWYZexFb4FTduahL81nXk
	j5EcOoiajsTN9mJ75paReyKFjjjDIgcHQQQCbdbidCTsuSvTjvXn6FnFap//ccrescdX5TsAmaUus
	rowvDinwhOTKo8fXmwh46UZDEiklhDl5xpJiAbgh7kd9e5N/kut9N2VsJqdEAQVE1pWiN269Cm8YU
	oh/LqKJjBR5lHAl8S5m2Hf76N414Bt1gGXQnvA41r6Br/M1Dlf09Ad+gP6nxPD89ltUNx8VmPf7Dv
	GIosrUElcWDnPPeAI6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLvP-00000004HE5-15QY;
	Fri, 21 Feb 2025 05:50:11 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLvN-00000004HDF-0avE
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 05:50:10 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5fc447b03f2so436041eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 21:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740117008; x=1740721808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIuCoBmmJbqWh/4IUDnMFO7CbsX53Ig+Rbn9kTn8z7k=;
        b=bLbon/HYM6ui42sOAcJbJFJeKFknSeCRwst+IquQpFlfgnmCnHKPC7ZYiUVUUnCnru
         mP2SJolJf3Xt+qBWl3JBtVCWkxKULvVBjukySSmkHT96grvV2448zorjbOjTsn5oQ6/1
         Il3ok0S5Sg6gVxYLAZbfo3WzOriNotaqjyYBZOWdHcjJAz5/CzSvEQceWjLoidoXGB33
         mNzwIKOiREiLliqE0EUWS5ReBG7ExWeMWD/GD6WWVpZElNlovDAwrIB58OPUsLjcYaKz
         jTc2IAPDbymS/LZzQLYH26g6D0H7MuMkOOOjqY10owobEC6kGgBsiMUcco4qjTTUEFjq
         kW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740117008; x=1740721808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIuCoBmmJbqWh/4IUDnMFO7CbsX53Ig+Rbn9kTn8z7k=;
        b=HmNsdf0chdylSF+ogWENovcexiC5s3F5qt6mcKvUXDu7ZPbBPlRd/pHba42MFexnHY
         EbVRVUGjj0ik53RGfyHD2J8FMLOX4sOP3aTIyhQwYlZ6AgoEqUVWfh1crw6iZfYlVIIO
         BSPQyXPCOKAf6Lo0yt7BPzFesyt40qUrazqjljH1XckKfwX3lucMZsAWqte/DKGaIpJX
         GPLx8nSAC5D5TqqPJOEC0tNZSwKmTKyaDQGwcN3QXRkf/1/uLk7fnnwnsDr9SWpibNnw
         Vm6qkafHM9B4MrA1WPYmpmmfRFRYPVbfb3q+RScO2HjHa+zIdlIuNcgP44woED4x9vbm
         hAQg==
X-Forwarded-Encrypted: i=1; AJvYcCUZcIXr2kDbKmD2BBYopkvelxAbiPoQkCNaARlVwgOIL8zT3PfLnRvfsYw+mOCjHutUSKIHCrwQtgESQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJHyAqSKN0lnYNw7qSX4BpY+NQdg8ftQ7pz1YgI/hxNtt24Duk
	QfKm9KNriJblhJO04Ng92il//GLpMXTuPMbPerwsVG7l+lzRVHou
X-Gm-Gg: ASbGncvM58Tw1nwmG7pHQ7+tolAkQnRQM3uUJ8gP9Pd0owGQkZ5zS/KVDqJhFXd0Ag5
	DLyfdW4bthLsRypgDr85Og3WZcBtCXSmKiaITvHtsDk/bjGxVtqkdIb/LKC2kqaSy96e3Md3H7J
	2/gEZSsrzU4BKVBhvl61I1LCIWlRwV8N6v58sZVBdmkXA96TlNvgVfkUBYoU4mAe6psphzOwBJg
	J+xVYLaBD5a7L4f6OBukMCfnoZjN76btBiSVz7soNKueX8yO++HQz9HH75RuYLBmeQ49H8PJkFw
	OKpCgNOdcBw3zDZH14N7/XJ8nJWi81E2Qwet
X-Google-Smtp-Source: AGHT+IE6qBeK9TsEn1fLuU8i6GxNLg8V4wjLi9MJTyltzbCchkV4pktYUBjug+y2v4gbUzIrXIxHKQ==
X-Received: by 2002:a05:6808:80b1:b0:3f4:c2b:def7 with SMTP id 5614622812f47-3f4247e3c50mr1406598b6e.33.1740117008010;
        Thu, 20 Feb 2025 21:50:08 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f41bc57784sm550230b6e.32.2025.02.20.21.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:50:06 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v4 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
Date: Fri, 21 Feb 2025 13:49:58 +0800
Message-Id: <4967e01306c07908caebd60736f898579412765d.1740116190.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1740116190.git.unicorn_wang@outlook.com>
References: <cover.1740116190.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_215009_180474_120ED90D 
X-CRM114-Status: GOOD (  11.94  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add binding for Sophgo SG2042 MSI controller.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../sophgo,sg2042-msi.yaml                    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
new file mode 100644
index 000000000000..e1ffd55fa7bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/sophgo,sg2042-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 MSI Controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  This interrupt controller is in Sophgo SG2042 for transforming interrupts from
+  PCIe MSI to PLIC interrupts.
+
+allOf:
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2042-msi
+
+  reg:
+    items:
+      - description: clear register
+      - description: msi doorbell address
+
+  reg-names:
+    items:
+      - const: clr
+      - const: doorbell
+
+  msi-controller: true
+
+  msi-ranges:
+    maxItems: 1
+
+  "#msi-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - msi-controller
+  - msi-ranges
+  - "#msi-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    msi-controller@30000000 {
+      compatible = "sophgo,sg2042-msi";
+      reg = <0x30000000 0x4>, <0x30000008 0x4>;
+      reg-names = "clr", "doorbell";
+      msi-controller;
+      #msi-cells = <0>;
+      msi-ranges = <&plic 64 IRQ_TYPE_LEVEL_HIGH 32>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
