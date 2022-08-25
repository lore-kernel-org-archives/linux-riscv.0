Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD3FECAA24
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGQDr+LOztxpERKODidUWOoBQSZ4z/pLj1TqEXLxUq0=; b=yNPYVJ0rwjjGJf
	OMFkAieA1TmBx+HQVeM2sjn1O6A8k3Qi/KxVfMyauvghZ52/e5UUDF75b0S3/VEzcO2iVbDjE0KL3
	aA/LLcS5rPQveotCOs2mqpEPn0TcXZDbuy1JF40JKAUdoB0BU/+DSWrUfwxSB3vvFJfSXCj4YKDBA
	dsu1e894BkphMuOKcwAYlg7sggFWX3FmpK59HB0BKk/FgE5tynn/sz4OGZanMUbi36GgdjzXpA0sn
	/L/F6Ew4b5p1tFbRRojTFDwA9BcOTSyt0vkuTu4x518va7fIV/z7z9rlWL5a8l12m3NN4Gm4nwn/g
	DXENq7wx9K4eJMvx+FEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHEZ-0007kw-OG; Thu, 25 Aug 2022 18:05:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHEP-0007UZ-8A
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 18:05:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id l33-20020a05600c1d2100b003a645240a95so2922306wms.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 11:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5kPI6Qs1t3E/Vre1WWWz4/JhFarqPVXyanwUw3KaQHk=;
        b=NZc4I9raPbnA1Ar1KT9PpzcSORFhiRGZW00QQnnsNCfX+UA9fN8e25WfeTa2gIAszy
         yYh6YEmHrE28o56XN6T99ABnc3BSAk5dlqkn1tzopVXhxfMTXfKofWOXMAQCiTb7O7SB
         35NF/0DLWKOipmiXt0UsyVRYkwVNQlnuhpy7pRyPXLPav0JxXZWXFz7RmFsyUb6OG3TK
         Smx+eSOJbGKcGQzEF4fROCh0FJY5p6s8lkAmTP4fNau84OQYtDXNbJkgZj93UpEho0b2
         Pagl00f0USQNmgRJZ3+CmaSU9OuSNPuvnzgkr4Gb6gjo9089EdKp2dB1zBLn5rUwHnyi
         vCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5kPI6Qs1t3E/Vre1WWWz4/JhFarqPVXyanwUw3KaQHk=;
        b=ayuvOPdR4bq25i8GuOtS+hhJpYKBEwcKDDJd/dXSDQSIiv9n99XdU7ZNib7nOvnsqM
         /nYKJBkVW2CyWQnDipq8m67VE/ealEAg87lPn1PDpfpBoRnnftgzOKUjX0GToNV1W9RU
         SBustNOa7GMePCTF8nBgRm2jUMEEgHsZtDsbnvF6H3G1futv596PzrxMUZXw/FC0LZiz
         wgfaxRjfb0WxBfAXt6IhUQYQs+plfmr1VIcJeIZGzq5gfVZncSL96S5ZxHF9rRQKfxsP
         UL0TJRyZRbSEtrsdqANp96mkuzNBT/UTpJ/hYVqWzusDtw4rT3jCB9KNCVPQm/dNQJfY
         RPpA==
X-Gm-Message-State: ACgBeo1pz7p+TBuvVE2psXhDlB9TOMZsTlSuapA5Pfw4PGV9GJILXPXw
	+qNWZZ68vh2E2u+roo3jPxXvuQ==
X-Google-Smtp-Source: AA6agR4YnT0SvuQmkQdKdz4yxQ9gsM05hvgrTnIF0ZSrNkirKKaE92hf/lz+3Y5yEEfdR7RcHv+3mQ==
X-Received: by 2002:a05:600c:34d3:b0:3a5:fea5:1be8 with SMTP id d19-20020a05600c34d300b003a5fea51be8mr8888820wmq.106.1661450726491;
        Thu, 25 Aug 2022 11:05:26 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d6044000000b002254a7f4b9csm14967970wrt.48.2022.08.25.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 11:05:26 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: Sagar Kadam <sagar.kadam@sifive.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@atishpatra.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: riscv: sifive-l2: add a PolarFire SoC compatible
Date: Thu, 25 Aug 2022 19:04:17 +0100
Message-Id: <20220825180417.1259360-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825180417.1259360-1-mail@conchuod.ie>
References: <20220825180417.1259360-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_110529_315127_FF35DB01 
X-CRM114-Status: GOOD (  10.39  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The l2 cache on PolarFire SoC is cross between that of the fu540 and
the fu740. It has the extra interrupt from the fu740 but the lower
number of cache-sets. Add a specific compatible to avoid the likes
of:

mpfs-polarberry.dtb: cache-controller@2010000: interrupts: [[1], [3], [4], [2]] is too long

Fixes: 34fc9cc3aebe ("riscv: dts: microchip: correct L2 cache interrupts")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/riscv/sifive-l2-cache.yaml       | 79 ++++++++++++-------
 1 file changed, 49 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index 69cdab18d629..ca3b9be58058 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -17,9 +17,6 @@ description:
   acts as directory-based coherency manager.
   All the properties in ePAPR/DeviceTree specification applies for this platform.
 
-allOf:
-  - $ref: /schemas/cache-controller.yaml#
-
 select:
   properties:
     compatible:
@@ -33,11 +30,16 @@ select:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sifive,fu540-c000-ccache
-          - sifive,fu740-c000-ccache
-      - const: cache
+    oneOf:
+      - items:
+          - enum:
+              - sifive,fu540-c000-ccache
+              - sifive,fu740-c000-ccache
+          - const: cache
+      - items:
+          - const: microchip,mpfs-ccache
+          - const: sifive,fu540-c000-ccache
+          - const: cache
 
   cache-block-size:
     const: 64
@@ -72,29 +74,46 @@ properties:
       The reference to the reserved-memory for the L2 Loosely Integrated Memory region.
       The reserved memory node should be defined as per the bindings in reserved-memory.txt.
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: sifive,fu540-c000-ccache
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
 
-then:
-  properties:
-    interrupts:
-      description: |
-        Must contain entries for DirError, DataError and DataFail signals.
-      maxItems: 3
-    cache-sets:
-      const: 1024
-
-else:
-  properties:
-    interrupts:
-      description: |
-        Must contain entries for DirError, DataError, DataFail, DirFail signals.
-      minItems: 4
-    cache-sets:
-      const: 2048
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - sifive,fu740-c000-ccache
+              - microchip,mpfs-ccache
+
+    then:
+      properties:
+        interrupts:
+          description: |
+            Must contain entries for DirError, DataError, DataFail, DirFail signals.
+          minItems: 4
+
+    else:
+      properties:
+        interrupts:
+          description: |
+            Must contain entries for DirError, DataError and DataFail signals.
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sifive,fu740-c000-ccache
+
+    then:
+      properties:
+        cache-sets:
+          const: 2048
+
+    else:
+      properties:
+        cache-sets:
+          const: 1024
 
 additionalProperties: false
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
