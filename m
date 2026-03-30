Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD417FB3D05
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfQNaNsaKv2pCkyTqZQmmp3jYxCZJbjwvy6Fm6Aw9CU=; b=4EqizpkErprdqV
	y0l1xymwTLo51T5vp0c0+mnwnCvt8iwXXPJ8vuOtStQJrAOLH3awxSQ2JjiM07SKFoLgbVgCxlX2X
	lQpWsXslPzLOROVDgajOM4u7zYL68cqK9998hCO+3onccRoeHqcfTUaJg8JsmNMiU/VTrCS4vYTGl
	/lWaIJLqg4p4w7jhqaJcVT9Tgf0Z7QiLDa/kBAnP5NHaAybtNXW4yqB80ov7ePBTurmYPNb6BQmpW
	L42FoTNFamS/mFjbikDHNYgCrMqUnbbFvvSWjEbPa9IVDj0MNanrXfVmL3NJnYVRhml189tolSrWV
	Za8OJwg+OXaGK2AkyxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79s9-0000000B3kO-09MY;
	Mon, 30 Mar 2026 10:29:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79s7-0000000B3jT-3jyp
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=93aouN0px5W4t0uUrMnqYAHkImdTfvitlnN0fAyJoqA=; b=QfG2/dQucKOYRvEksqXV6SyJMk
	bCSIngc7nDS/Zyc9XrNrL/0ialH0ljjpmTEvBFDWGzlZCMMdgqGReZk1wM5Mv3giipqokIehcpj0r
	aHZzAY5g5vh//LbKpSuGf1CoE7VYNViHyC3xcJ1Qhz2IgcXqfhdY1/T9RQFHQsx+WVBMFJXuAsi8i
	ya4FEUSuGhBgQL1zsx4RXUd7cmEFt0kY2w5E2uy9oElYuAKxX36WErg9zVvDzNXkt5LXuhHV19+Cf
	HdHtTDHbZpysa6tua4SQz8st9iAT7eNh8hWUiMjcd3Sm7gfdlFTXxH5IC2gmezt3NuGAjr8XD+kQQ
	En5vWXBQ==;
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79s1-0000000DZyF-30nQ
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:29:25 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UASGfH038279;
	Mon, 30 Mar 2026 18:28:16 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:16 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 5/7] dt-bindings: cache: ax45mp-cache: rename ax45mp-cache to llcache
Date: Mon, 30 Mar 2026 18:27:22 +0800
Message-ID: <20260330102724.1012470-6-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 62UASGfH038279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_112922_400204_2646BE31 
X-CRM114-Status: UNSURE (   7.08  )
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

The AX45MP-specific cache binding is renamed to a generic Last Level
Cache (LLC) schema, as the driver now supports more Andes CPU cores
beyond just AX45MP.

Updated compatible strings:
  andestech,qilai-ax45mp-cache    -> andestech,qilai-llcache
  renesas,r9a07g043f-ax45mp-cache -> renesas,r9a07g043f-llcache
  andestech,ax45mp-cache          -> andestech,llcache

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 ...ache.yaml => andestech,andes-llcache.yaml} | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)
 rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,andes-llcache.yaml} (76%)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
similarity index 76%
rename from Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
rename to Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
index b135ffa4ab6b..5b97625edd37 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
@@ -2,17 +2,17 @@
 # Copyright (C) 2023 Renesas Electronics Corp.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
+$id: http://devicetree.org/schemas/cache/andestech,llcache.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Andestech AX45MP L2 Cache Controller
+title: Andestech Last Level Cache Controller
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 description:
-  A level-2 cache (L2C) is used to improve the system performance by providing
-  a large amount of cache line entries and reasonable access delays. The L2C
+  A last level cache (LLC) is used to improve the system performance by providing
+  a large amount of cache line entries and reasonable access delays. The LLC
   is shared between cores, and a non-inclusive non-exclusive policy is used.
 
 select:
@@ -20,7 +20,7 @@ select:
     compatible:
       contains:
         enum:
-          - andestech,ax45mp-cache
+          - andestech,llcache
 
   required:
     - compatible
@@ -29,9 +29,9 @@ properties:
   compatible:
     items:
       - enum:
-          - andestech,qilai-ax45mp-cache
-          - renesas,r9a07g043f-ax45mp-cache
-      - const: andestech,ax45mp-cache
+          - andestech,qilai-llcache
+          - renesas,r9a07g043f-llcache
+      - const: andestech,llcache
       - const: cache
 
   reg:
@@ -73,7 +73,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: andestech,qilai-ax45mp-cache
+            const: andestech,qilai-llcache
 
     then:
       properties:
@@ -91,7 +91,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     cache-controller@13400000 {
-        compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
+        compatible = "renesas,r9a07g043f-llcache", "andestech,llcache",
                      "cache";
         reg = <0x13400000 0x100000>;
         interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
