Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03093C369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeScKZlsnTAsFSpxbMuddpuImFUnEVWbjsrWljdQy7E=; b=IwJ2dqZHEpGy8H
	pRqJRJOOTnqDCBV3qxKyVDGvxw3JDagRa6xB9AuO5+7ywwGKIhC7s3wVaxhcJds78lHbuJK5Wi9Te
	7fw2tx3liIug4UtMpmmiHZgAcAV8G5EqdEz1haB9y6qOHdKSfGPp+eNQHMmfUWrRgYCWbTkdpIQsR
	mQ3mzzLyCR/pARfZ5dB8S3JPjvOnND6B/ADZVN5clVNIAdjjB5A57KtTRj8gm56ocUMEpxoQxWmag
	4Smd5+Wjw39mZTbCmld/Q5TDYljY3X9ppy5mh875ABZw7ZlwDf1dv+qadsA7aYOnhqymCS71YlENf
	Gi0TsSu0/21hHC/6HGiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugn-0000000BAAI-3fQY;
	Thu, 10 Apr 2025 16:23:41 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmT-0000000B0SE-1uOk
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2708; q=dns/txt;
  s=NAESA-Selector1; t=1744298730; x=1775834730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H3wnlGqXSSS/oiZRRPE2KJNofPHwThcoVMkEwdUNQ7I=;
  b=dohWXpxfrySmixxz0NEOZ5870w/Bo6C1YybU1/40Zdvr0jg5HWrax91n
   TWJ4D8oyKJA4wZqf9tyPcCMjFVAR6z2HGkeZH5NZbLRaqSs3Su458UWCJ
   tXVCw93XrpmuJt1+VGbCLpvE1uZ8OcLBaYp/e7liTn3gLBLgdegeW80xa
   ZTg5iztmBwCXUFMjA5vKV4eF4IcDcetmAtrx/ahH7OsGO/gV1EqXe2IyC
   bQG2LKNFzKoyzJCvLcbD65ixPwgOoL2/ipgMrlPTdXALCgXk90ADZgai5
   m6SICv5SHht4l4NK8NP/hSMdv9Z0IzqDbO2wSXQEjZnAkcb9Kb+SfDP4W
   w==;
X-CSE-ConnectionGUID: E2WSrnviTSqxR9ysAuSrNg==
X-CSE-MsgGUID: uVLbEIl6SeqoCtyIuNa2WA==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515086"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:26 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC compatibility
Date: Thu, 10 Apr 2025 20:55:14 +0530
Message-Id: <20250410152519.1358964-6-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0854 (UTC) FILETIME=[C508E8E0:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082529_567963_491A9B5F 
X-CRM114-Status: UNSURE (   8.62  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

This cache controller is also used on the ESWIN EIC7700 SoC.
However, it have 256KB private L2 Cache and shared L3 Cache of 4MB.
So add dedicated compatible string for it.

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 .../bindings/cache/sifive,ccache0.yaml        | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 7e8cebe21584..579bacb66f34 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -39,6 +39,7 @@ properties:
           - const: cache
       - items:
           - enum:
+              - eswin,eic7700-l3-cache
               - starfive,jh7100-ccache
               - starfive,jh7110-ccache
           - const: sifive,ccache0
@@ -55,10 +56,10 @@ properties:
     enum: [2, 3]
 
   cache-sets:
-    enum: [1024, 2048]
+    enum: [1024, 2048, 4096]
 
   cache-size:
-    const: 2097152
+    enum: [2097152, 4194304]
 
   cache-unified: true
 
@@ -89,6 +90,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - eswin,eic7700-l3-cache
               - sifive,fu740-c000-ccache
               - starfive,jh7100-ccache
               - starfive,jh7110-ccache
@@ -108,6 +110,22 @@ allOf:
             Must contain entries for DirError, DataError and DataFail signals.
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: eswin,eic7700-l3-cache
+
+    then:
+      properties:
+        cache-size:
+          const: 4194304
+
+    else:
+      properties:
+        cache-size:
+          const: 2097152
+
   - if:
       properties:
         compatible:
@@ -122,11 +140,31 @@ allOf:
         cache-sets:
           const: 2048
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mpfs-ccache
+              - sifive,fu540-c000-ccache
+
+    then:
       properties:
         cache-sets:
           const: 1024
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - eswin,eic7700-l3-cache
+
+    then:
+      properties:
+        cache-sets:
+          const: 4096
+
   - if:
       properties:
         compatible:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
