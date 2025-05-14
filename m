Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FFCC3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfUxPObCgb5wz/WfpLmrv6OwQ8P3DH5F12u1s1edBk8=; b=3W9NF/DUtFRuXw
	RUBDrDJFQe3wZJo5jG+dQ5DuyjkMDa3k/yqgFF1iCvQpkvMfcGuDet965X8ZmJ1CAjFFUIJZlxAj5
	G6O1GqRrkXBiEXWmsJDvJQzbc7NJSfaauc98caLsH3PZQt3ULLCJmbBUStAU6r+FTJbgfu2V60xAg
	ZV3111QGv+RAJLTTN/RNxMm58Y2Mn8f/jslUzZgJJE6SxALFD4ftf3vMHFLHil+0hHVIAPBXysULQ
	RWXqRqWnHwp0iqRc8wSCQ5X5MUNSgSh8LgQIkcPzE7DFKcpxBdLPSLpEM+zTk0c1AYK77Ku60VeeF
	3NXqWspDyKT3Z15GY3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5O-0000000F2sr-0W6p;
	Wed, 14 May 2025 12:19:46 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8p8-0000000EjG5-0KSl
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:54:51 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54E9s0oU092463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 17:54:00 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Wed, 14 May 2025
 17:54:00 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v4 6/9] dt-bindings: cache: add QiLai compatible to ax45mp
Date: Wed, 14 May 2025 17:53:47 +0800
Message-ID: <20250514095350.3765716-7-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514095350.3765716-1-ben717@andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54E9s0oU092463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025450_462457_764B90DE 
X-CRM114-Status: UNSURE (   8.21  )
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
values for qilai-ax45mp-cache.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../bindings/cache/andestech,ax45mp-cache.yaml | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index df8bba14f758..cd08ea57b2d9 100644
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
 
@@ -66,6 +68,20 @@ required:
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
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
