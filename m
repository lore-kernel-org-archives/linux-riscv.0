Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ADCC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 06:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuplK6AIol+pqT/cyeh9tBCa1XCQT4MkTfGCyM03B8g=; b=W89tghhbXgyddg
	qXz4BouSjn0u349i+J4c4QcOdhrndRmOfNuQZKTZPbWyRXIxlNlEKC5Q0Xzn2irq0BbcNiK3V7YUp
	+V2OSI7u4ouZmMP7GTz+lk79jGJjwTh3g+7TbNi2kuANyylcPfjIlKl+VNIEdgZ0B7niMRViFEWE5
	KboACZfKXk6IuPMTHj+2FsE3KbQ/enDknB1ZKMDy0q9GP7BO0I0ixrbp7LhzpI675Liy7pc3YrErQ
	hadPVqVfbLSsUkcqHXE5MMkyP4RlpaSK+6piU7Q6DvnfZkNjfo7IC8ktCFNnoMWRSQ3baZLdeS4Yg
	rmUcOt/D7pzvz1hOdemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFh-002sT4-1B; Tue, 13 Sep 2022 06:18:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFe-002sPF-24
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 06:18:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id c2so10797529plo.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=BkU0QN86DJwgcVuXYkBLFx05g7OxXCcrOHXHdeHhmx0=;
        b=byruooSXjxanC2WKqwYGjjup7+zSxnsY6qM7gRY7oF8vX+RlTHULq4L4HqHoFA/YU1
         BFhkc0GKe7oG1ktodZpQo9u1Kma0LUeLmCW2mCrABOPYNpNMS77fOY33Sw6b4ikYLNKV
         qB+H5bxtAep3WFbBbTKuCrmRCDLQlNf6Xk1fhvg7YWV3V7syjwhVXG5UWuz8j6A+j3VS
         m9CtJfKL4ihqkkLEQJcUSKZZvxjIx1GW6PWNedr5CUl7qoGqYFUaPFiYm0/0nJO/SErc
         QSzAXwSBAfz5loaizCaq4+vSJDekrVd8K18Ry8aoxDrnaD88hG+jUPFwQQUTnLzhTYaw
         JsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BkU0QN86DJwgcVuXYkBLFx05g7OxXCcrOHXHdeHhmx0=;
        b=5Xv0MBhES2en2KnHSn6EYAet+JXjVKXqLj+RniPqiotSNjwAKcvqVZTh/Zv8X9lmv3
         Agp0lBMeKCZ2DsMvHmdNHCUeWgcRnElIdrIuPOSWuLu/WvR/ifwnqA7YmDA9AHJYi/om
         N/pFy+DRA0QNU7+27gBuRcdmLND3XufXLfyuwh0YuRiUh/oNruTksls7k4S6roB44Il2
         njpLV6uIjzOC462iIRKRr7YFCrk5Wkf36nKR63pnlhAc9HslM7L8djj9FHu8ZqthRyWk
         1A5I+JP1mJJYo11B5F91eNBg3ikABKeJE4aJ576EzGQnYy/GqcC6tL3AH56Rdk/YQn/o
         V8KA==
X-Gm-Message-State: ACgBeo3jZ69kGhwpPHBX4CdmaebOcOsnJSqj9lVTvweXhj5hRjPnoJnu
	Gk1FgHnSZkEbFnT/Rio5h7wCDQ==
X-Google-Smtp-Source: AA6agR71/x637VLoOitLNPRbvBMn4pFyl+GH1k75dmYQ8qdnNj8sE9cFc/sHeApHkFyW7heqG5PqlQ==
X-Received: by 2002:a17:902:6b4c:b0:171:38ab:e762 with SMTP id g12-20020a1709026b4c00b0017138abe762mr30297830plt.42.1663049907158;
        Mon, 12 Sep 2022 23:18:27 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id z11-20020a170902cccb00b00173cfaed233sm7296332ple.62.2022.09.12.23.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 23:18:26 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v5 1/7] dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
Date: Tue, 13 Sep 2022 06:18:11 +0000
Message-Id: <20220913061817.22564-2-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913061817.22564-1-zong.li@sifive.com>
References: <20220913061817.22564-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_231830_119762_3A5258D0 
X-CRM114-Status: UNSURE (   9.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since composable cache may be L3 cache if private L2 cache exists, we
should use its original name Composable cache to prevent confusion.

Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Suggested-by: Ben Dooks <ben.dooks@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 ...five-l2-cache.yaml => sifive,ccache0.yaml} | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
rename to Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
index ca3b9be58058..bf3f07421f7e 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
@@ -2,18 +2,18 @@
 # Copyright (C) 2020 SiFive, Inc.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#
+$id: http://devicetree.org/schemas/riscv/sifive,ccache0.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SiFive L2 Cache Controller
+title: SiFive Composable Cache Controller
 
 maintainers:
   - Sagar Kadam <sagar.kadam@sifive.com>
   - Paul Walmsley  <paul.walmsley@sifive.com>
 
 description:
-  The SiFive Level 2 Cache Controller is used to provide access to fast copies
-  of memory for masters in a Core Complex. The Level 2 Cache Controller also
+  The SiFive Composable Cache Controller is used to provide access to fast copies
+  of memory for masters in a Core Complex. The Composable Cache Controller also
   acts as directory-based coherency manager.
   All the properties in ePAPR/DeviceTree specification applies for this platform.
 
@@ -22,6 +22,7 @@ select:
     compatible:
       contains:
         enum:
+          - sifive,ccache0
           - sifive,fu540-c000-ccache
           - sifive,fu740-c000-ccache
 
@@ -33,6 +34,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - sifive,ccache0
               - sifive,fu540-c000-ccache
               - sifive,fu740-c000-ccache
           - const: cache
@@ -45,7 +47,7 @@ properties:
     const: 64
 
   cache-level:
-    const: 2
+    enum: [2, 3]
 
   cache-sets:
     enum: [1024, 2048]
@@ -115,6 +117,22 @@ allOf:
         cache-sets:
           const: 1024
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sifive,ccache0
+
+    then:
+      properties:
+        cache-level:
+          enum: [2, 3]
+
+    else:
+      properties:
+        cache-level:
+          const: 2
+
 additionalProperties: false
 
 required:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
