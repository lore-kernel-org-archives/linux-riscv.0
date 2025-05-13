Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DFDC3ABC9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrIgxN9z2eXodFSmzjLDQiL2w+fHQJZ74qiy3pMLRUk=; b=YeJLdxnpioWK2F
	bVM73zoIND8PIjisjeaxCTx2QPKAecOPNJpKmoX2EWp0mCGjmSE4peBAi6Xs20Sx19n8taizSTYF2
	Oi7gPh7lOhiixbTNy5KcQ4R3mAonavzjGGPsLl/ZO1SyJSCDoxjvFnHJg9O3gKgQw0qBJtS9ekRtf
	wSibI0jO+DAkEvhuttpTJAgOXWbxSjA99iEWWJWTzWimsqzIXpE7ferdTT+vYoCQYEAT4S6abPA7V
	QeStS9F606++AHezfVzcgtQb6QpoStFJluukfSMPwiwvsts0SE33tqFJyDq0vRgoL6YHRbmoMWxpg
	lluiwO9boL6oeiHfhgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmJ3-0000000ByFR-3YlT;
	Tue, 13 May 2025 09:52:13 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmHS-0000000BxuL-3cMU
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 09:50:37 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54D9nqRh044911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 17:49:52 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Tue, 13 May 2025
 17:49:51 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v3 6/9] dt-bindings: cache: add QiLai compatible to ax45mp
Date: Tue, 13 May 2025 17:49:30 +0800
Message-ID: <20250513094933.1631493-7-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513094933.1631493-1-ben717@andestech.com>
References: <20250513094933.1631493-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54D9nqRh044911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_025035_251336_F7CCB440 
X-CRM114-Status: UNSURE (   8.80  )
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

Add a new compatible string for ax45mp-cache on QiLai SoC.

Also, add allOf constraints to enforce specific cache-sets and cache-size
values for each compatible string.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../cache/andestech,ax45mp-cache.yaml         | 52 +++++++++++++++++--
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index df8bba14f758..dc03ffae6c9f 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -28,7 +28,9 @@ select:
 properties:
   compatible:
     items:
-      - const: renesas,r9a07g043f-ax45mp-cache
+      - enum:
+          - andestech,qilai-ax45mp-cache
+          - renesas,r9a07g043f-ax45mp-cache
       - const: andestech,ax45mp-cache
       - const: cache
 
@@ -44,11 +46,9 @@ properties:
   cache-level:
     const: 2
 
-  cache-sets:
-    enum: [1024, 2048]
+  cache-sets: true
 
-  cache-size:
-    enum: [131072, 262144, 524288, 1048576, 2097152]
+  cache-size: true
 
   cache-unified: true
 
@@ -66,7 +66,49 @@ required:
   - cache-size
   - cache-unified
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: andestech,qilai-ax45mp-cache
+
+    then:
+      properties:
+        cache-sets:
+          const: 2048
+        cache-size:
+          const: 2097152
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g043f-ax45mp-cache
+
+    then:
+      properties:
+        cache-sets:
+          const: 1024
+        cache-size:
+          const: 262144
+
 examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    l2_cache: cache-controller@200000 {
+        compatible = "andestech,qilai-ax45mp-cache", "andestech,ax45mp-cache",
+                     "cache";
+        reg = <0x00200000 0x100000>;
+        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        cache-line-size = <64>;
+        cache-level = <2>;
+        cache-sets = <2048>;
+        cache-size = <2097152>;
+        cache-unified;
+    };
+
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
