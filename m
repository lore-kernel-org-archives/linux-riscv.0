Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A7AC021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/QmniEl2AycHUVqRikjq65NVGk7OpIwL6cb9PmYS6Y=; b=SdEW73QDrsMpoE
	vu9zGISdZ9GW4RsiVPzkg/OWVP5mWhWDCch3bKwjo5lv+U9Zp3i/ioCyeRWTz6smHq5Bvg66qJUga
	i/WC62F4BRzVtaCz+HMk/BILCQBMdxGMoufBLgzLWLl2RY27zHZOTVtg5iFZPJKQJbRhz246oO+ey
	WuDWJdtAKdyraY4erUfkiezwwqkpkiBPZbV4hXvcvh9l+x/H3LiXWvCt5u/DXRDF8S7fPrFci9KRt
	7ZbLPbkkNs0l53VdePUTBhHceCHzcuJZ4El7YjWk7DxsYO7ObaQf9f8ib+91vNrTZA92KFRRY6IIh
	u4ydjuswKyJlDa2VQ2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNmg-00000003fjC-3yoz;
	Tue, 04 Mar 2025 08:37:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNlS-00000003fQv-1Ciw
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 08:36:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223cc017ef5so22040255ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741077393; x=1741682193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzuLSIrLaXf7CXwEltqloxoRU7OJxMBLJdraw/sviOc=;
        b=kk+3cClY99LQu3lPfLwVXM9W1vAVofno6OLH3VvJDw+zmgd1q1eYENG9wpJvPs+kak
         QEBoqxVwbTcKYS7dJtH7dehyB2szD7hXHIEmIY3UlwjHqDb7TYvTelNPenqKP/BesjrO
         0xwXYSK5hgAjdwu2em7hxp/KjZQ8WMrZNpCbzybT6i/o2jYN5WoA0/Ze2ZjmGeqxsj+q
         ireJWoHPrTTI4ZLttZbMg7pnfA+WD6+4vP1GFnkqE938hgobH5FTWf+RPfuLrPkmWHeA
         LqfZoTwIAgMgrIVCnW3ER8aXNuh4miW9joTcOdOFN25pMDmHBcTmzue3igEAGdtVXMLa
         c4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077393; x=1741682193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzuLSIrLaXf7CXwEltqloxoRU7OJxMBLJdraw/sviOc=;
        b=VD49IJSD/gruzSFDwYNokIyWIOPwvehmqrpBYYadeIm4MmwxF2TAvVv1uFqQVtiAMQ
         X8SsvDR/fc3Tdzs+ZctuYiNVJuHiZM656e/Hkzze6HNOKfT37V5YbpkI4skRQEELqPFC
         EhNlWQX00FXfnQd/9V91b7lsrwWBlGsRdUSOVqIJPMyRf9ABQ+TQGKm911lh3Sfr2XdR
         Bu9XvrNLVQEal+qI6qJxfbnOmPBPbrbwcmDomLdU9i/oKMXBbo0rwn3if4XP+PAPUCpm
         tAiVCVLM+s41BGHARxR4Uo7FMx13cckw2eVWTBmNI+Ndmxf9C+2mqQf27ZcFHoyuG1Si
         pyCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMLznULvtrYMCGFTX3DSCcVttbuKUWxS9rpfPQ7yzOP4K3ND+FqxXE41KmLx7Yqe4hchK7XqfzU8XARA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB13RlMB+THPySysjVqoHolBQOfh7wtUgGvQvb3PBPqNCxo2/J
	qrhpAY/dTo3zfpQM4PQROGegNhB1sWUUivqyjBZTmD0n1vyEWI5l
X-Gm-Gg: ASbGncs4wwvGlmJkTXfbHU52C1ebiDgO+dWaO4BVlcu9E2oe+rIiS2ru3nSavsGsoKT
	ecXLCV8N9yeUoL2/1TuT4bus/lgqq1CK96edHAqBiKIRtVzkZQExbKf6+n0Ee79IGbhEUp4lqfb
	EiGJMZ0loZids2nf8zMrpKsT+9Ds+8Jt0s6LNMeX8fSulJgQrB59x7NYpDUMLx280g14J8e2FbP
	ETqysEuypJNdgYc/VhH2zm7QaYfu6e8rxmNbZqm5CnB8Pv962SIN2qaFFZDuouxDKaNO0bSVNbs
	8t4XKJ4p3OzCR3BYsXXH+GUX8ARXtI3+SZqFBVk=
X-Google-Smtp-Source: AGHT+IGr55HKPhNfScKm1lRs9LWFrAQAez2uJvzKffhcY65WHUgtIevtYlWDNcERpJS4FEIFQDm5ZQ==
X-Received: by 2002:a17:902:e844:b0:220:c2a8:6fbc with SMTP id d9443c01a7336-2236924e46amr249478745ad.34.1741077393052;
        Tue, 04 Mar 2025 00:36:33 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc3b7sm90597735ad.173.2025.03.04.00.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:36:32 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v2 1/2] dt-bindings: spi: add SG2044 SPI NOR controller driver
Date: Tue,  4 Mar 2025 16:35:42 +0800
Message-ID: <20250304083548.10101-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304083548.10101-1-looong.bin@gmail.com>
References: <20250304083548.10101-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_003634_322552_CEDE91D9 
X-CRM114-Status: GOOD (  11.97  )
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

Add SPI NOR driver for SG2044, including read, write operations.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../bindings/spi/spi-sg2044-nor.yaml          | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
new file mode 100644
index 000000000000..948ff7a09643
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spi-sg2044-nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SG2044 SPI NOR controller
+
+maintainers:
+  - Longbin Li <looong.bin@gmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2044-spifmc-nor
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi@1000000 {
+      compatible = "sophgo,sg2044-spifmc-nor";
+      reg = <0x1000000 0x4000000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&clk 0>;
+      interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+      resets = <&rst 0>;
+    };
--
2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
