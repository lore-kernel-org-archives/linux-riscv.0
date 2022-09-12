Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B398ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 08:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuplK6AIol+pqT/cyeh9tBCa1XCQT4MkTfGCyM03B8g=; b=jLMDb5eQilbrRv
	tcdYfRf8U6P4LIs/sPb0/WZbGEVRCl6gE0RDS21RnkglX83YZXxAJjIlVk4y3x740FQOqdaSm0I6L
	5/f4T5C2bkMQSIz8Ias9vvclfg6usl+ZwVf6WmUy+nWdXCQ5HE5FptV5aEgfvSamESzRnUcn4f/9z
	khORC8++eR5xYBAGOa8LLzj47oOpLi4E0STgEGc1EiehgfZ7/QBCBAsreibahVXQw2OCE1GJvk7+P
	eGefmIBt0mU6HbViwmqxj6YaW3OoUcs8nYPEinzn+K1ewHuKxAcX2oBj0mslgQE8T/2UXESloIyS8
	rmLebVzXFIZwTihJBRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXeMt-007erm-Kr; Mon, 12 Sep 2022 08:00:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdHE-007Jkj-6e
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 06:50:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso3448344pjq.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 23:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=BkU0QN86DJwgcVuXYkBLFx05g7OxXCcrOHXHdeHhmx0=;
        b=Ib+puZ5rARxiUnB1p2NCLcaRSUB+/TEIitSizCzyNhsinhuRt2dKCox9IMq3+gt10V
         F1wZbmd37IIJF8EojmeTg1sudw6KI2fspASITQFUNiy7kjmvRsWyIF3cjRaVG+bnGSoW
         jE+gZYtk8mceTCH7seHKd4mol3uKH8w42B2WBrcU+adHuB0XzPUXluhc6EuWS17wAbZA
         9ddbsfpaDhGKPTfMxDuO+HPr4v2+z9V11Rkc0MTMjM6GfezfXBuK4QjBrFfe04KHwyd8
         +2j5akszwmnWfr/sgaUEXc90EsiPnFAcgKPE7QiXZI4KbPnglm/Rsh9BW6ct2IGsNE4q
         ki6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BkU0QN86DJwgcVuXYkBLFx05g7OxXCcrOHXHdeHhmx0=;
        b=2rbdSKPqhPtJgsRGJ/1IqWL/5uywbi9DYL1J2nuXUVMpC8toQA8a8pxpawrQz/+/9q
         3pfrpjmagekyT8gbRyzPj8oZpzcjx5lV9SyzSBZK9NAKSBEW7xke2/sZLenc+EkwRdZf
         tpDPcHUoNEqyyqnoB/KgINBoq7NIRedu7NCAhU/UxlJ/xsSmrJhTk31wCN63WB+kyisg
         MGvbiYC+eWgul2DRf29ay7uFYivJNHA8bVPtZbUQWSyNCzBtNUeyLcS45QjkyV44jjIr
         ZwRxt51z/5UUde7n5dyF3pItVsK4f8lYBQo1KWlS/2YGpFdHsktCWsLnDa4OccpbEQ1w
         0iIA==
X-Gm-Message-State: ACgBeo27dL8d3FW1FrU/qBvM+0ETxXuoUSWEHBoxE5RjNwOUnUNakT8x
	u6F/8OemWQgMnbaTBZf7sXwMAg==
X-Google-Smtp-Source: AA6agR7riNz1Xs+gSc8ea9z9GYGR4sY7z+e89rsvqwplrVCGmLPIaUk4E75qwtv6QWMPVVhXntF+ow==
X-Received: by 2002:a17:90b:4ac4:b0:202:6d3d:3b60 with SMTP id mh4-20020a17090b4ac400b002026d3d3b60mr20783390pjb.197.1662965439181;
        Sun, 11 Sep 2022 23:50:39 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id v62-20020a632f41000000b00430c6fd7ffbsm4705716pgv.84.2022.09.11.23.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:50:38 -0700 (PDT)
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
Subject: [PATCH v4 1/6] dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
Date: Mon, 12 Sep 2022 06:50:24 +0000
Message-Id: <20220912065029.1793-2-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912065029.1793-1-zong.li@sifive.com>
References: <20220912065029.1793-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_235040_266669_DA717EF4 
X-CRM114-Status: UNSURE (   9.22  )
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
