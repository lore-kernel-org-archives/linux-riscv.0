Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047AFECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdXS3NYrmyBvkokv18GLmdWmHbz+OX1bPRXGAADxjK8=; b=V2hvkKJP2J118w
	DbGzzfEVbURAk1W6MH3LIpoanwPlDAbh9t/Z2q3nALXSJ67zpTsKDjVb2h9WhUxEwCz4Buo6hjO74
	Di9Sq1qMOU+GYLJ5GrI2lTWI6ft7IhHOmImB/52BJZeqHIP0lhl6V2ZshnvBjIsF6+CVjiAgi7A4d
	7M6Oii6M6BBusWFR8F1c09tuP0fn5b53xiKkLIfsHVE8C1d9rsPwG9K1RGVb+vGapOA3SUAtaS5t/
	DUShuo2PyKE+P3MdRoVasZpY51lf4+r75ETPCKVjgT45bD9G+EDhk07EpTmpDpqlv3Lre6FR8geIs
	xtGAmkUQBIcqVSF3ktag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV927-00HOXy-3w; Mon, 05 Sep 2022 10:08:47 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7W3-00EhAR-P9
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 08:31:42 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 78so7493793pgb.13
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=8+7UbJNXJr3orLEQ98ALRb5xPSJtynPRzIcD+aR5ifU=;
        b=mHvU7S5vDDtNt6es0lrJGYL4WrYDvhag9uoc5mOXnDO/l79rg6dEdCGvvOd2jBWCI4
         UKB6cRj2x2rjWxFjE9f/MbS92UEHg0DUrkeqleARbpidc7J7tPvPvwZ9ahge8GwRRvoD
         hxb0TNpuElQC54MIYGW9ou5z273KuhtfxYOBvTEN+/CPKrOMI48gIu2GvviYqyv0I9LL
         L9OTa+EWoC+MH5AyNzeZ/adJEWD+eT2Bh4jqcvokIxm5arNH/COWQFpLDtHlx5n6dLoU
         hx5JCD0kifLVts+jeUlY54kmOb+lGK8JKNaV6nhtYc0Eno9vMuGGjcqAW0ekbsBnsYul
         9ucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8+7UbJNXJr3orLEQ98ALRb5xPSJtynPRzIcD+aR5ifU=;
        b=dleYGKDqv1HidflCJePjxBnidnOQZGognqUVa8c8FbF2gP7zh+dEYcf99jvT2Kbx70
         OJvDEdsksmcDU4Oj8SnFLalHXK1P6fKBwserYoMLHsx9pImBR/7v0JfYvu1UpoR5KBP6
         YjIYKe/JIXk7Av/YVj7xakEsr+cQAYOOMsEi/bl05FimYq8e/wjukVJF5jKpvZMuolc6
         BMzlTByAPuKGY2S2PEeju59T87/zvtLgCaesbcQb8r+O4JDnLA+vuMt8vMunPnD2T+Hh
         /+v5qRK3sIuXt+KflpFmwLm34+EyhCYbYOXJOPQ7n9bhE9OTff4MB9Opv40YYoHW45OM
         sifg==
X-Gm-Message-State: ACgBeo3iIzk0IoO9xgu+e7k16gG5i7Sbep+YsvEW7lENFk5Q0X4TZ+v0
	Cyz4vidMhkA/z+XjJw0azlBaHQ==
X-Google-Smtp-Source: AA6agR7Jtc2YSMuD9owC3LWOBl2oIqLaus6IUSuHxBGJWtpC8+n2PXQ/W1Vg2dwveu+mikWtBuD3Kg==
X-Received: by 2002:a63:8241:0:b0:42b:c6e8:d3e4 with SMTP id w62-20020a638241000000b0042bc6e8d3e4mr35721545pgd.113.1662366694748;
        Mon, 05 Sep 2022 01:31:34 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b00537dfd6e67esm7089721pfo.48.2022.09.05.01.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 01:31:34 -0700 (PDT)
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
Subject: [PATCH v2 1/6] dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
Date: Mon,  5 Sep 2022 08:31:20 +0000
Message-Id: <20220905083125.29426-2-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220905083125.29426-1-zong.li@sifive.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
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
