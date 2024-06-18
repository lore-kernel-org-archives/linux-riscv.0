Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56504C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jte8moIYMPFoUxSaE9fEh4q9zWVszD6bj1MisjGpzHE=; b=X6gkOblJck9Rs/
	g/ScnikT5ckvjMlXJLrldr8uzJqXZdwqdRD/fRKSAP/Mu4kDmZg1avm4WKB92AUzcMRJUBqcvAKP+
	fh6rRbrnxkh/Vb76wnz2726Gxc/fdwLk3Dfi6H6aD/2doVWLwvvge1FyksFbW78MErm7gRhgw8O+U
	QNJ7t2MFUQ2k6b81jsaPkrpTTQrehLxtS1jVf8rSlvRGvTWTX0xbs8UGj4NsG1BWzbvDrPtOLLCkp
	OfS2dTXiuN/Ge9GF6c1ruSfPybW8QycgeiKAPFZFMr48CnDfA2g8kfUAHAdVKy2jYk/usz5+FlVc+
	CDm2nBbKobQhVtVYtP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUMV-0000000E63e-0N1B;
	Tue, 18 Jun 2024 08:38:43 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUMS-0000000E62V-1nd6
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 08:38:42 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6f96445cfaeso2883882a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718699919; x=1719304719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1GjDUQ3o3b4+jeUyqmth+0z9OUp8eftPqc5a3xc1TU=;
        b=G9Do665JZBzU9mpreFZnwnhvwXfP8xvEZsOQCNSuBL580vrb84qMNJQw7Vtg+mIexB
         AyARksOiie27iQ2FFa74sLjAiRdqZdTvzy6GrWekw30LOWi4AfTD6cdXm+IP2D2vV9jD
         ku7jmUXfHpLYy//LBPt7Prz/BMuuUdFGyHPTKEf675Urnl0iAbJ9D48ugfvWBRlMcfgq
         JeSUMAqJvNOxRAJFYWPOOCCQfqeYz39u9NM+Ma40B2JJfla2DNmYEZxAgJ7a0tpp5KjL
         Nj+KZo8W3n/eyZ7aRfzRG+rQr6ROfpnhcsINEcvffn0X34Bh39cUzoGImlSbKJzlu7N4
         vyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699919; x=1719304719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1GjDUQ3o3b4+jeUyqmth+0z9OUp8eftPqc5a3xc1TU=;
        b=el7tSwl9rY8H54ARgvDuNVRMKy7aVGeGAquHd+B/8WSijAT0D74fL4dOo1EBUYgd9A
         +J4v0dv40WfXhuzz+bWbSuCMunXcos/bcTiUC9ADeup2/F8r7PdR/zK7hCTEsNrVDjYR
         5yrCUynNtf6/SjEkkGyGM8cPuSaXGzbWc1W901lFPAB5QT9jhV+DK+ynvIOS087lPx+R
         LeTjTR+MTBYxgQK4H20ye8059RtjQypE2w6PLFYnwKGTujo7b/w4Uu/kfTMbvZMVEFp3
         IBztoBsCvCpQS59w1/0NrFrhNfdN8z+fGd/fbAiE2WEkYS3rkXfWn3EkYIFM5hCS/Rm2
         0Wqw==
X-Forwarded-Encrypted: i=1; AJvYcCXZzLJ3KrBnhvsZBKHhffJoylp9THXKoBnuKb68/w/uy0P/WPsKKbWj5H0D2qGKPB8xXuC5dc89RTLZqnI0GkSlyC8N9b+4jU7Go4/iA0Kn
X-Gm-Message-State: AOJu0YyFFVw0QJC5w3ZFKNYq+KyhRyRDJYXWOpk+i5FIhPSj1R1kfgS6
	vow67Ifdgp8qrjOVk0/vkpxEP8pfF+TeU7mima6TtLeHudXSPdyU
X-Google-Smtp-Source: AGHT+IFALoxJytTixSUwVOhyfDsBA+wYcZg2xiod4lujmIbAlaE/efLxS/7TXcwcLL+d05UFBkl5gw==
X-Received: by 2002:a05:6830:1e70:b0:6f9:f231:3909 with SMTP id 46e09a7af769-6fb939f0984mr12894884a34.29.1718699919166;
        Tue, 18 Jun 2024 01:38:39 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1b0bd9sm1779441a34.27.2024.06.18.01.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:38:37 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v4 2/4] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042 support
Date: Tue, 18 Jun 2024 16:38:30 +0800
Message-Id: <dcc060c3ada7a56eda02b586c16c47f0a0905c61.1718697954.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718697954.git.unicorn_wang@outlook.com>
References: <cover.1718697954.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_013840_513310_6C349B06 
X-CRM114-Status: GOOD (  10.60  )
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

SG2042 use Synopsys dwcnshc IP for SD/eMMC controllers.

SG2042 defines 3 clocks for SD/eMMC controllers.
- AXI_EMMC/AXI_SD for aclk/hclk(Bus interface clocks in DWC_mshc)
  and blck(Core Base Clock in DWC_mshc), these 3 clocks share one
  source, so reuse existing "core".
- 100K_EMMC/100K_SD for cqetmclk(Timer clocks in DWC_mshc), so reuse
  existing "timer" which was added for rockchip specified.
- EMMC_100M/SD_100M for cclk(Card clocks in DWC_mshc), add new "card".

Adding example for sg2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 69 +++++++++++++------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index 4d3031d9965f..b53f20733f79 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -21,6 +21,7 @@ properties:
       - snps,dwcmshc-sdhci
       - sophgo,cv1800b-dwcmshc
       - sophgo,sg2002-dwcmshc
+      - sophgo,sg2042-dwcmshc
       - thead,th1520-dwcmshc
 
   reg:
@@ -29,25 +30,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    minItems: 1
-    items:
-      - description: core clock
-      - description: bus clock for optional
-      - description: axi clock for rockchip specified
-      - description: block clock for rockchip specified
-      - description: timer clock for rockchip specified
-
-
-  clock-names:
-    minItems: 1
-    items:
-      - const: core
-      - const: bus
-      - const: axi
-      - const: block
-      - const: timer
-
   resets:
     maxItems: 5
 
@@ -63,6 +45,43 @@ properties:
     description: Specify the number of delay for tx sampling.
     $ref: /schemas/types.yaml#/definitions/uint8
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: sophgo,sg2042-dwcmshc
+then:
+  properties:
+    clocks:
+      items:
+        - description: core clock
+        - description: timer clock
+        - description: card clock
+
+    clock-names:
+      items:
+        - const: core
+        - const: timer
+        - const: card
+else:
+  properties:
+    clocks:
+      minItems: 1
+      items:
+        - description: core clock
+        - description: bus clock for optional
+        - description: axi clock for rockchip specified
+        - description: block clock for rockchip specified
+        - description: timer clock for rockchip specified
+
+    clock-names:
+      minItems: 1
+      items:
+        - const: core
+        - const: bus
+        - const: axi
+        - const: block
+        - const: timer
 
 required:
   - compatible
@@ -96,5 +115,15 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
     };
-
+  - |
+    mmc@bb0000 {
+      compatible = "sophgo,sg2042-dwcmshc";
+      reg = <0xcc000 0x1000>;
+      interrupts = <0 25 0x4>;
+      clocks = <&cru 17>, <&cru 18>, <&cru 19>;
+      clock-names = "core", "timer", "card";
+      bus-width = <8>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
 ...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
