Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB377C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2kVK28MWReKBoNea2aCgT7H0hBX2hg9wCk1KfZEy5w=; b=1FwwJCQLHyyqkx
	DJKBOUDXv0eHpxFsI23GHmeXyqtEHKKjm12aNEvKoSUBJzNh8EFEhzcduOnoo42TOuc4mcPI+MJYs
	Qf8Sj8NLSa1iKh/CZuYeBhr/daIIxxaqvHTqhhx9IfhE3Qq9IXH3u5JPJRS0zTpMZ+ElaCMIn8WOK
	Ci2NTamskB1Q8bxwLOzBWeI0M6yZtXBVhliZEhW5oFhNq9FW6yoWoHnf+V3qY8KMPZkcnKh2hh2Vf
	jWShSJCuTvh/rYJN2D5sxRqD2t33Vrxd4lsiHmemsd8ZYsmeSKA4RQ/mi/v9SZ1hprAk05FPlz84J
	o1rZ/bgswY31hjkxpBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkO4D-00ArFh-Ub; Fri, 29 Apr 2022 10:41:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkO4A-00ArAE-TX
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 10:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651228899; x=1682764899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pXFB7NHcDCItTBt2mpH7jbaa68A7uQ0UnpA7fbg8+bw=;
 b=0by1ELDgDQXxFVsxOYUbLaYUQ/bBXUAaUvyOaysysnen4u5yDHiUEpig
 D6NGUPFmurhgrBhY3qtzki7b3RhlIsAgVULmFRIB0bL+0/jB02DkfGbbr
 0xikhgGcH1ApU7XJ8KbouwdxZiqKSSeNRI+Q8q2n9gkmLrDpi5dxMOepb
 p0+ICvvtyfEXiKUyWMZ8YFocbB2lsZJUDAlxtdiJdx5S57ZmxnTuGj+Bw
 Jn2cpC+THYexoj6S8iukBah3X2yptSDFyecSLuXJMy3mv5RszQ94e4GGq
 7hLBecf6AniJOd8wiKTQT31sJwCMgqqmJYRrYpQrnWNhXWlOky5mVNIha A==;
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="154297294"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2022 03:41:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 29 Apr 2022 03:41:38 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 29 Apr 2022 03:41:35 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>
Subject: [PATCH v1 4/8] dt-bindings: riscv: microchip: document icicle
 reference design
Date: Fri, 29 Apr 2022 11:40:37 +0100
Message-ID: <20220429104040.197161-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220429104040.197161-1-conor.dooley@microchip.com>
References: <20220429104040.197161-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_034139_045934_350B0DE1 
X-CRM114-Status: UNSURE (   7.51  )
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

Add a compatible for the icicle kit's reference design. This represents
the FPGA fabric's contents & is versioned to denote which release of the
reference design it applies to.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/microchip.yaml          | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 3f981e897126..c9d8fcc7a69e 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -17,10 +17,13 @@ properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - microchip,mpfs-icicle-kit
-      - const: microchip,mpfs
+    oneOf:
+      - items:
+          - enum:
+              - microchip,mpfs-icicle-kit
+          - const: microchip,mpfs
+      - items:
+          - const: microchip,mpfs-icicle-reference-rtlv2203
 
 additionalProperties: true
 
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
