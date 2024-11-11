Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B2ED12D6D
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 04:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UvVq5L0yF7PaMlHYtoQf3zFC1UTIlysYp3po9ic5k4=; b=TJtfKR7RYCj7fs
	J4Vi/G5JV41y6KZGhaRl1jVqx40XM70YANGwlru4sJr2Pr5A2dIlL3A0AsZ2wHNZhebxvOjIcpM14
	MNoHfYtKx0fixuPU0l7aJF++8xNZcFZToLtRSnAc2+l2p7mYxP7eBxiZaDgYrV1o/juUEkYKfBbXF
	xbSUc164XLI4ftIwAGA6d8U9BDYIHC3l3WJ61OhUzbwueSm0n6nuWsYp+VLgMOFRU0ToS6VJCNm7m
	wns+qV9ThRiq495Ag+/3jOLr7AdhucJEzXhHNgn9kl4oS7DoN6F98tuhuxc+m94IKi1VBb3Ke20wB
	N4HzQdteq3XdXMS5vo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALcd-0000000GGhr-0Vg1;
	Mon, 11 Nov 2024 04:01:51 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALcZ-0000000GGhA-2v7V
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 04:01:49 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-288916b7fceso2057114fac.3
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 20:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731297705; x=1731902505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyhBOJdbdb7U/MAw6LoCSVUFgTElIIRFybioC9VTZuM=;
        b=OPWAG8rJrqM6xSGoGyOBTivmgNa7o00TuEQIe2VcMfVpXV34IticqZPdiGr+Hw1err
         h1npVwnCSRIk2jISt0d+1EOqkgdbbJ5+l7TRrtr4cEUH9qTBixVNvye6WnuhhNnXdDeV
         F1I5NcqJJzHhmyrfDNEW5f7J3rCis2CrcTxDbRqHCPHs02sVV/Wx4utvGZDDqlls9F/h
         WopRDiK0u99+2CRk0wZTGVhG+L7tq6Dg55EL5rsYChI3Ikdi5qMzx52sOpf4Kuth71C5
         vtyJw/gjs1APPrZzJykjduv3hguw5j6LM3S26RFmmGkFVjSiCkJciSstsl8dLIB6pr/K
         ADyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731297705; x=1731902505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyhBOJdbdb7U/MAw6LoCSVUFgTElIIRFybioC9VTZuM=;
        b=l8H/l9xEsRrMW2WPKh624Ulv5jOBWzkjvyuXRxXnGIBhm9mcnB8ehJKXolqEeNvUp6
         f89XaLLN2+ckHQP4Ujao+SJnXHyp5R/HX6wWegYmFTR/bWOqQYORzX+0X9OoVrL5Nf4G
         6z1fW4IRYNks8UzYQeLYHjC4g3qUjBHIcSH86hs7jMW4t3HBhhbFYTu8QoEfTzhcxZ7+
         Kwi4ovlOu94Ge5BamsdRGOqkKmeJVucxXrqYfHf8/I8h4Di3Hr1g6h/5UVVPPqOrBjJK
         60cu2Y+F+4UAkhUGYmaEoYmrT25dqwEVbTLCSQmObleRRY0yyhKOt+jAMMC3xrqpltOl
         d7fg==
X-Forwarded-Encrypted: i=1; AJvYcCUFjCUkUSMD3kHVV3CkEJu9wRIWBjkkfdG4hQzc/0Nth1KLEBiewzUaAnnEcSqKeBKzj0DLCZ6C3B/3YA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOerCGFtcv8Vr9mtUNe45mX/47tBVgEom7TcxyjWISk0v0XQ+l
	Y/kwMSZEYU/zj0dltxvt+4cKRdQlRJrCtNxIWk647YogSA0eIPhL
X-Google-Smtp-Source: AGHT+IExdqCVvtfANRWv9lUO362sv1gaRUggc3/UVeXpal0yMHNBYIFFnDgdeYQf/09eHGl1kDf7cg==
X-Received: by 2002:a05:6871:7a9:b0:287:e3e1:15f2 with SMTP id 586e51a60fabf-295601585f1mr8943535fac.25.1731297705248;
        Sun, 10 Nov 2024 20:01:45 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29546d0085csm2622580fac.22.2024.11.10.20.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:01:44 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
Date: Mon, 11 Nov 2024 12:01:36 +0800
Message-Id: <5186bb9c7feebb87136eb5e5e117fb1142dba4c2.1731296803.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731296803.git.unicorn_wang@outlook.com>
References: <cover.1731296803.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_200147_761537_8E0D2E35 
X-CRM114-Status: GOOD (  12.14  )
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
 .../sophgo,sg2042-msi.yaml                    | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
new file mode 100644
index 000000000000..9fe99b74c211
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -0,0 +1,78 @@
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
+  - $ref: /schemas/interrupts.yaml#
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2042-msi
+
+  reg:
+    items:
+      - description: clear register
+
+  reg-names:
+    items:
+      - const: clr
+
+  sophgo,msi-doorbell-addr:
+    description:
+      u64 value of the MSI doorbell address
+    $ref: /schemas/types.yaml#/definitions/uint64
+
+  sophgo,msi-base-vec:
+    description:
+      u32 value of the base of parent PLIC vector allocated
+      to MSI.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    maximum: 95
+
+  sophgo,msi-num-vecs:
+    description:
+      u32 value of the number of parent PLIC vectors allocated
+      to MSI.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 32
+
+  msi-controller: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - msi-controller
+  - sophgo,msi-doorbell-addr
+  - sophgo,msi-base-vec
+  - sophgo,msi-num-vecs
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    msi: msi-controller@30000000 {
+      compatible = "sophgo,sg2042-msi";
+      reg = <0x30000000 0x4>;
+      reg-names = "clr";
+      msi-controller;
+      sophgo,msi-doorbell-addr = <0x00000070 0x30010300>;
+      sophgo,msi-base-vec = <64>;
+      sophgo,msi-num-vecs = <32>;
+      interrupt-parent = <&plic>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
