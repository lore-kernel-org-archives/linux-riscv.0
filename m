Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C765C52D70
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=neAMAgy0/h0veB4GFN0XXFVW4XoWIqp3i9vgr2Xz55E=; b=Gz6fD3Y77QpFCD
	323j9+AiQKCEftSQs8OEbRKrYmSoRbHGslXKdSnUMTreUPP+fmB0VeGOwloXkhG78xcXwP6ssvV4h
	YacyYW4M6omPkqs40EkXJQChQ2RlApp7/rR2puGUOiVCwyLm8exD9K027T4F/jYMw9/A4kq1vuJ2/
	JONjJflB4Gq3RCAvxWmBHFJ+cs912rMy2NSrpZSv3MtaAfn4Uj/rKggoIZThc8Az3gXDW8P4fvY2N
	+xQezkQNqJM6kGITx7X/0p3a0q1r0YAyCfU7PqMK9+JvFKillmIQm97wYD9n2pRohdqXABm2OhAfh
	l9J3+l+j1nT8R7+KJq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sats3-0000000FG3D-3Hti;
	Mon, 05 Aug 2024 09:19:15 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sats0-0000000FG20-3UsV
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 09:19:14 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5d5e1c86b83so5510380eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722849552; x=1723454352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKZKLwIrLvB9ZFsYAq1sUq9lxL9HVjwkxz7TvV3FNk8=;
        b=TiHTEII+j8aeGZaEnjMFAbFxFB4Nm3InLWO5qMVhbxwk15c1pixBLE2aqI6GZNGum2
         t6dxIgCM3Geqmf7rWjeVJL8RWHquzg1IfYTunwL3W3KHy7izNFnxPvCoXKD2CuMW7NUn
         aV7x2OYaPj7Hvv9zybWrB+McBTYPs2x9zT3eMwoutsnh1oVLaP2Fkp9ROuEQgGxq7mWP
         sODvqJch7jKLidrpURJ8xwCufei8mQi9Jbyz9B2nV9K3N08O/dXkGJACYRI0EvcHtc0m
         q3d+cCICtt6KQI/+iAIk3sWcgB+uGE0ewwzcRi33cqKL9wyOO3+ZTpxqwqhawOL1KCEP
         Exew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849552; x=1723454352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKZKLwIrLvB9ZFsYAq1sUq9lxL9HVjwkxz7TvV3FNk8=;
        b=lF8KAXxIKNFyW2mTM+g3FtAhMnOyT5774Nrb2CWRueTwPYhpPxq4Odar/CTXPfk4tQ
         IhHIEg7IXj72cEA7N5baMqk3S0vQoeHsMikn9wsdSxg7HItJ38x2SAPuYFu/GPYpTuD4
         9bKMPJiZPQcLFpx8cHc3EBSdePxdz9lHnj09FYCZ7CzTj/i/yAZfDhukek/59o3v7+K3
         whbHSfoztb3OHv30oR2SkjFbdNapBHY6H+o0fyHIYXhQLMDAHgO1IreNVEcZPL9AQQMb
         2zv1209X6q2S8qyEGbqraBnojDfjznUTOKdy0WQgWuQFQtTR61wYsUvZUL7icsdYzMTQ
         CARg==
X-Forwarded-Encrypted: i=1; AJvYcCX+TTeMIASHJWjUzKhb8cLLBTd3UkXlNlR5gxYoRwBQ991Roc+ah+5hByCzCkT9rCRpxtYuH5MeKC0H42IF7wZUCAXRaE1n+/QxaZ8fV/LR
X-Gm-Message-State: AOJu0YxpMKBDF7YWquFjll+Ebo0Yu5rlzLiwld/e43oAVZgtj2lQDEXa
	3eSvgy1zL4FgRcs7qcnmU5LOdxkPjrUNl8QmLWTiunq48U7agpwP
X-Google-Smtp-Source: AGHT+IFpabPlu04Zp+9kW5LL/5GpnkEoFtCPrhlmJpSoDUSCC7Ht9xubRYfCNquJfjUV8vCE0qZrIA==
X-Received: by 2002:a05:6820:2903:b0:5c9:d9db:6a51 with SMTP id 006d021491bc7-5d8107b74b9mr5369594eaf.0.1722849551987;
        Mon, 05 Aug 2024 02:19:11 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a3a768e12sm2884751a34.65.2024.08.05.02.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:19:11 -0700 (PDT)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 6/8] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042 support
Date: Mon,  5 Aug 2024 17:19:04 +0800
Message-Id: <9ca450097e5389a38bcd7d8ddf863766df4cea10.1722847198.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722847198.git.unicorn_wang@outlook.com>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_021912_904209_6EBB2D2C 
X-CRM114-Status: UNSURE (   9.42  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
