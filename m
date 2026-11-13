Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A2606A8BD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uj6ywVZD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bLxQlYQiV0CgO337JPVbYeTxSt2jxkbM3gkXYwaBngo=; b=uj6ywVZDJa97WHDG391NDSOJzL
	IELhV6FQXpkjipObsM1Q3GrPxUIAVUFFNB6NrvJD8fZjXxmYAY056KJqyxB6dEkGAluZD9mWu4iSp
	sTkoT2421KGb+uMhoPcZvxqdAXvEcuZZp3EX67f74Qg14jkTVWf4a56rgbotTuUs4ngSvn5ziwd5l
	RHjpTjAQ9V4/AAkQ8ay1iW1n0X61JSUM+wa/kEgAmTLYbq+qND19iYMAFrlYmR26xWp+ws9neUqAH
	5b+UY/uec1jbaBCIduWIGHJIsEOk78jJHpdQ9WLg4jG1R9nzrIrcUNZ9YDLYjPO6mHij5h85tEsw4
	itg98ZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTs-0000000Bqti-3uMM;
	Fri, 13 Nov 2026 07:13:53 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTm-0000000Bqoj-1q86
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:13:48 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5O059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:29 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema for generic LLC support
Date: Fri, 13 Nov 2026 15:11:36 +0800
Message-ID: <20261113071143.1446167-13-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CR5O059129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231346_924428_A4D01A24 
X-CRM114-Status: GOOD (  11.98  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The last level cache controller of Andes cores is not specific to
AX45MP. Other Andes cores, such as the A27L2, use the same controller
with the same register interface, but the binding only accepts
andestech,ax45mp-cache. Add andestech,llcache for them, and describe
the binding as an Andes last level cache rather than an AX45MP L2
cache.

The cache-level, cache-sets and cache-size constraints describe the
AX45MP L2 cache, so apply them to andestech,ax45mp-cache only. The LLC
of other Andes cores can be level 3 and have other geometries, so
allow cache-level 3 and require cache-sets only for AX45MP. Match
renesas,r9a07g043f-ax45mp-cache explicitly instead of through the else
branch, which would otherwise also apply to andestech,llcache.

Also add an example for andestech,llcache, and add myself as a
maintainer of the binding.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 .../cache/andestech,ax45mp-cache.yaml         | 71 ++++++++++++++-----
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index b135ffa4ab6b..da9688cc95f7 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -5,14 +5,15 @@
 $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Andestech AX45MP L2 Cache Controller
+title: Andestech Last Level Cache Controller
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Mina Hui-Min Chou <minachou@andestech.com>
 
 description:
-  A level-2 cache (L2C) is used to improve the system performance by providing
-  a large amount of cache line entries and reasonable access delays. The L2C
+  A last level cache (LLC) is used to improve the system performance by providing
+  a large amount of cache line entries and reasonable access delays. The LLC
   is shared between cores, and a non-inclusive non-exclusive policy is used.
 
 select:
@@ -21,18 +22,23 @@ select:
       contains:
         enum:
           - andestech,ax45mp-cache
+          - andestech,llcache
 
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - enum:
-          - andestech,qilai-ax45mp-cache
-          - renesas,r9a07g043f-ax45mp-cache
-      - const: andestech,ax45mp-cache
-      - const: cache
+    oneOf:
+      - items:
+          - enum:
+              - andestech,qilai-ax45mp-cache
+              - renesas,r9a07g043f-ax45mp-cache
+          - const: andestech,ax45mp-cache
+          - const: cache
+      - items:
+          - const: andestech,llcache
+          - const: cache
 
   reg:
     maxItems: 1
@@ -44,13 +50,11 @@ properties:
     const: 64
 
   cache-level:
-    const: 2
+    enum: [2, 3]
 
-  cache-sets:
-    enum: [1024, 2048]
+  cache-sets: true
 
-  cache-size:
-    enum: [131072, 262144, 524288, 1048576, 2097152]
+  cache-size: true
 
   cache-unified: true
 
@@ -64,7 +68,6 @@ required:
   - interrupts
   - cache-line-size
   - cache-level
-  - cache-sets
   - cache-size
   - cache-unified
 
@@ -73,15 +76,36 @@ allOf:
       properties:
         compatible:
           contains:
-            const: andestech,qilai-ax45mp-cache
+            const: andestech,ax45mp-cache
+    then:
+      properties:
+        cache-level:
+          const: 2
+        cache-sets:
+          enum: [1024, 2048]
+        cache-size:
+          enum: [131072, 262144, 524288, 1048576, 2097152]
+      required:
+        - cache-sets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: andestech,qilai-ax45mp-cache
     then:
       properties:
         cache-sets:
           const: 2048
         cache-size:
           const: 2097152
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g043f-ax45mp-cache
+    then:
       properties:
         cache-sets:
           const: 1024
@@ -101,3 +125,16 @@ examples:
         cache-size = <262144>;
         cache-unified;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    cache-controller@e0500000 {
+        compatible = "andestech,llcache", "cache";
+        reg = <0xe0500000 0x10000>;
+        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        cache-line-size = <64>;
+        cache-level = <2>;
+        cache-size = <262144>;
+        cache-unified;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
