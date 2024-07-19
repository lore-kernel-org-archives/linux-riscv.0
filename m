Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAA0C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w35TxhyHcdtvD6mltJpIUBTHAnE0bSFMb6TZkc5Eetw=; b=inKJkooeLpazcZ
	u+U+aa+8EKIjqJXlfxs4z+sjbd7838/H3Z8GTswNGeTrYtOG1QTovOEfi6JapzUdWd1MQPMpj3zeL
	Uv4jWYCzTxD95nN+0UetjwUvY1BX86EkDpDT4LObnzOw0WwBbAAWv95ZPaIX3tf78sLZx6J6rfxbc
	HKo2L7xzLY01xHfG4MhR/x4BbjR96sgsK+BiXwWq9agCQesH/P01/zmzgofkL0c4ZiP5Qy/1HvEJB
	J+gqwHMYPBb8fs/zCPO8pZyCZCifQnp9MSni+OIGufZGAzYIbQSnjpcv0ZRdBU8/u64PfWJWoj0fr
	cS0FRYJfvyRazQyjESkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjGX-000000028lK-2xiB;
	Fri, 19 Jul 2024 08:47:01 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjGU-000000028jX-42si
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:47:00 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-260e5b2dfb5so948807fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378818; x=1721983618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKKw/4Id92VNitQ7o/JQZihQX7XuedjZLl/fZYSG9co=;
        b=iKyj7sv29SaEXmuEV1jPBR0oFNcM19hLDBH/TYXHhI7p/oQPlEJMD/Bi6mfjipOzvb
         hjnTQXSx8A05HsbgIkioFLOyvrrOsd3N75zWm52zsdpoO+nwcLCkBV80J+cwGrHRaobF
         SaB6wtnC0eWETKV8GC9Q+6Sp4y1h4tiD/uO4y6BH+VBtfNL8Ei6Xqt/B/jaBmMdNq96Z
         3736qHpyfnuPEGxrUmv4Cori3HtLs4dmcFwNo4CjvFjUj8mT1ZR22XwjBS91SlhiS97S
         ODcRIoOtFb6PlnIN0zgKoe7Gs3LfChuAcIIvBdY3Ek41QE1M01OOLGQv8RTOL6l+LD5e
         Sldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378818; x=1721983618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKKw/4Id92VNitQ7o/JQZihQX7XuedjZLl/fZYSG9co=;
        b=qTCLEYCla3uOxsNszHQcnMoMdSFNtX3ZsNyL142CSfA826XyZLrlUQiBRNxl8zkoiu
         C0OruvFsHjQOtZxjdpSoI5+i4sLav/me7kpAv1YdCr5fWVfxw6kCE5eZIoPFVNI2BrDg
         JsTuDuSz2ns9qgC3gZRP4/pQPxdMMYzqWQQ8QOqe19qi/vB0cCg3nQXcZY5lTHB6eOVK
         1UkkBqQB9PuQO43MZhZayqJxgcGt1J8lhw+B+48fmKbTMNpMF6ekvqckVLS3PFaNsrQ0
         HxsjIbxZxgZLOGE4HN4cIJiFjrauApezbhXU90vReBcfjXFD6RqnogrWa4TawuucSIkT
         qJmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1floeNAE+jiJhz8LToy1GWJMFhT6EKDiVNOhA2pi21DOH/2dnBgOCS+gTE6y8MYefSwpXqb1IH2uHbuFJgFEMAJRbgZiy2wDbwVhSzv18
X-Gm-Message-State: AOJu0YwPkAVen900jYB7SFV26wMXLjqnNKC52qyhvcXymHMr0WayfmCM
	7A82Y4YFH4ALzUTlUuxePfNPIwKUJZzD22J+ubIB7Vy08owc+TSx
X-Google-Smtp-Source: AGHT+IGAbSX7r8e0DjtizVbyHAI2tIPQog4VJJFwrAa+LxMXgf/cjjUFmzfDEpCmO19giRs2ru3bxg==
X-Received: by 2002:a05:6870:6126:b0:261:906:a03c with SMTP id 586e51a60fabf-2610906d02amr1641798fac.53.1721378817708;
        Fri, 19 Jul 2024 01:46:57 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610ca48c79sm230586fac.45.2024.07.19.01.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:46:57 -0700 (PDT)
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
Subject: [PATCH v5 6/8] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042 support
Date: Fri, 19 Jul 2024 16:46:50 +0800
Message-Id: <55bc60606bc9b2558eeddb00fd8b659d3fcd69ff.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014659_031361_C7AF36C6 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
- EMMC_100M/SD_100M for cclk(Card clocks in DWC_mshc), so reuse
  existing "core".
- AXI_EMMC/AXI_SD for aclk/hclk(Bus interface clocks in DWC_mshc)
  and blck(Core Base Clock in DWC_mshc), these 3 clocks share one
  source, so reuse existing "bus".
- 100K_EMMC/100K_SD for cqetmclk(Timer clocks in DWC_mshc), so reuse
  existing "timer" which was added for rockchip specified.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 60 +++++++++++++------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index 4d3031d9965f..80d50178d2e3 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -10,9 +10,6 @@ maintainers:
   - Ulf Hansson <ulf.hansson@linaro.org>
   - Jisheng Zhang <Jisheng.Zhang@synaptics.com>
 
-allOf:
-  - $ref: mmc-controller.yaml#
-
 properties:
   compatible:
     enum:
@@ -21,6 +18,7 @@ properties:
       - snps,dwcmshc-sdhci
       - sophgo,cv1800b-dwcmshc
       - sophgo,sg2002-dwcmshc
+      - sophgo,sg2042-dwcmshc
       - thead,th1520-dwcmshc
 
   reg:
@@ -31,22 +29,11 @@ properties:
 
   clocks:
     minItems: 1
-    items:
-      - description: core clock
-      - description: bus clock for optional
-      - description: axi clock for rockchip specified
-      - description: block clock for rockchip specified
-      - description: timer clock for rockchip specified
-
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    items:
-      - const: core
-      - const: bus
-      - const: axi
-      - const: block
-      - const: timer
+    maxItems: 5
 
   resets:
     maxItems: 5
@@ -63,7 +50,6 @@ properties:
     description: Specify the number of delay for tx sampling.
     $ref: /schemas/types.yaml#/definitions/uint8
 
-
 required:
   - compatible
   - reg
@@ -71,6 +57,46 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: mmc-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwcmshc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: core clock
+            - description: bus clock
+            - description: timer clock
+        clock-names:
+          items:
+            - const: core
+            - const: bus
+            - const: timer
+    else:
+      properties:
+        clocks:
+          minItems: 1
+          items:
+            - description: core clock
+            - description: bus clock for optional
+            - description: axi clock for rockchip specified
+            - description: block clock for rockchip specified
+            - description: timer clock for rockchip specified
+        clock-names:
+          minItems: 1
+          items:
+            - const: core
+            - const: bus
+            - const: axi
+            - const: block
+            - const: timer
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
