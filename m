Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03B8E83EF9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYLmC0aK0hIXngIV+x4RRq9113SDSiNMy5R+gAbOZTo=; b=kbixTMvve+mfLj
	eyxSXAxnic51LK8ooYfUUCuTWToAdxW4oeFENwMNzsa0bz9EpxkQepZLPKlh0KUakP4dP3wmjQnl8
	93XTeCZlzh+ArbS+s9Sj536+wl7n7pTST/b5gVfQJUceqY/iTrIU8LZsBRLcnF3+shROifzXFD02+
	3Kl533Mix4IRzVYr7YCwpGVs0+YwqLCZ7ECIJITnyWj7K4TRfEKRSmEnZA6fdvLq2158qElZvbryL
	WYky6VSOMFH3WsQLFeALmtNxU/N9Uy4X4YV4gDgFRJys8W4R1SmW90RNTk47o+R8Ot0fJZwg96lV+
	ElvEOCzHsbW9mnTtgO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYtH-00000008AF2-1otN;
	Wed, 04 Feb 2026 09:09:39 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYtB-00000008A8W-3Lb5
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 09:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770196159;
	bh=erpHfG1a0U1wKXe31VsJ1fGHCHur44BOyeFbxKPgRbM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=N6fTIRfcpscByIKh8KmH2eFgrppZ0cwQtT/iIHy/aIcSPvdva2ORoCjdXaZbiQ11E
	 f5UwyNDiqdqYePYs9o88f3w9uwy2kqUMEsUiBvLxzSu9sysowGUjRkzqfvSYP3VIIk
	 mm7FOfmDAsvOpZblunACYoGoQ/Kez3NAt5Wkbz4U=
X-QQ-mid: zesmtpsz6t1770196157tc4c53f38
X-QQ-Originating-IP: mHZUIACGk9YMLEZgm8p0NppNTHzVJmeF8HKgM+3ft8o=
Received: from SurfaceBook2-B.localdomain ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Feb 2026 17:09:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12607342643688675040
EX-QQ-RecipientCnt: 19
From: Lv Zheng <lv.zheng@linux.spacemit.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Jingyu Li <joey.li@spacemit.com>,
	Lv Zheng <lv.zheng@linux.spacemit.com>,
	Zhijian Chen <zhijian@spacemit.com>,
	iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/8] dt-bindings: iommu: Add spacemit/t100 features
Date: Wed,  4 Feb 2026 17:09:12 +0800
Message-ID: <A0E91F323138E92F+a27d73b00f3324f0d3885128f5596230b3f1370b.1770195980.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770195980.git.lv.zheng@linux.spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MyirvGjpKb1jkV4OeiUOuImdzoTdgM0AKY79FgAlHHVObFEWdEY+vd/F
	waVqBGQeCqMbLkRwOOlD8MOe6Uz4pO+xzDbPa/VLZoLmhpkqY2W1V0hsxBGtlJHGu8CIFLV
	fvXRFrSFSIX7AZVxoFeNSvOopjWGooIK/+wWNIDMR9utebG62Mp6kCHFk9vw+i89SZO/ghX
	d5hycLoPmwBT8LQRTdkyQDKJ/E4q/2tZjC78am/By2fD3CNwm5dkZWvntLuhfmXoSccG1m/
	Juz4AfVhyYTcjpUPUNw4YGZK+FXJu4j5V8eaLpOqnOMVQwj9mZTPk3IYUpBWy8bTB9+kIQ2
	+HF7h9xJ8LXe2Cgw2hXy6gnQ/BB4ZEmrt5QfqE0N+TU21hlPRgToYgYh27YKu3m2ldV09O+
	eYxd7pHjCRaEJdPlxvGVIHak+tfgNh6SACtILvABkqjVMnny05jH7IZj7MQ9wNhNy/aIQGJ
	H03d8lxnS6BWdFkPa9BmceFBWH4jV+pz/yr7h3FBoYwVCw7FsxSeQyxD8KI2eIOj6C3W6ET
	Ny5qNw1JTFK5mq6qmRqKtj/2+RcHXcbzTb7onCiGB3dcSWAhLDTRgsH9K7kySlozixRwGL4
	3LUiB8pCEEOZrc1vAh1M5kI1n2Rgx2QJ+YakbMgfi6gph/sALqBzxlV8ULBB0VxPu7TCDmS
	ajWDHme63Ro6CY+w2DsKELxIYSzpb7btq2sFSOq8oRz3ZPZ6ZNKOqmGtpNSQ2nfplg4QO59
	BEL31BLnI3/NbWyO1keTQl1vXDyXCUYLq3A6feltphY4TbYl28JnhTY2S2Rd50HX3yTeJfU
	VZq+wOk1DCywnt578+oWLiZqBqoNMEsrE1MtcizQj3GRIGDkw4k1H0mHrkgsUe2lnRd602Q
	kO7QDz9hl4CE3TMr58HNLKrY4X+EqgPaDMOES5eMg70iFtivmer6yI8+P+M6Qkxqacr2BfK
	/zrEWdP764UuKUZpPfRWUxj7BE2RnweyG01U96S+K+nmseQKuoMJ4EG/J0YCCl/3Ds/APiy
	fR4J7iCTebvVkVdRJ9XZU/jhXA+Mz1yrUKANuhJQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_010937_228863_8507CCD4 
X-CRM114-Status: UNSURE (   8.28  )
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

Adds device tree bindings for SpacemiT T100 specific features by
introducing spacemit,100 compatible. T100 contains distributed IOATCs,
each of which exposes pmiv interrupt.

Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
Signed-off-by: Jingyu Li <joey.li@spacemit.com>
---
 .../bindings/iommu/riscv,iommu.yaml           | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
index d4838c3b3741..2da3456e7402 100644
--- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
@@ -32,6 +32,12 @@ properties:
   # should be specified along with 'reg' property providing MMIO location.
   compatible:
     oneOf:
+      - description: SpacemiT distributed IOMMUs
+        items:
+          - enum:
+              - spacemit,t100
+          - const: spacemit,riscv-iommu
+          - const: riscv,iommu
       - items:
           - enum:
               - qemu,riscv-iommu
@@ -75,6 +81,23 @@ required:
 
 additionalProperties: false
 
+select: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,riscv-iommu
+    then:
+      properties:
+        interrupts:
+          maxItems: 68
+          description:
+            SpacemiT distributed IOMMU includes additional interrupts for
+            IOATCs. Each IOATC exposes pmiv wired vector as standalone
+            interrupt and the maximum number of IOATCs can be up to 64.
+
 examples:
   - |+
     /* Example 1 (IOMMU device with wired interrupts) */
@@ -145,3 +168,17 @@ examples:
             };
         };
     };
+
+  - |+
+    /* Example 5 (SpacemiT distributed IOMMU) */
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    iommu4: iommu@1bccd000 {
+        compatible = "spacemit,t100", "spacemit,riscv-iommu", "riscv,iommu";
+        reg = <0x1bccd000 0x1000>;
+        interrupts = <58 IRQ_TYPE_LEVEL_HIGH>, <58 IRQ_TYPE_LEVEL_HIGH>,
+                     <58 IRQ_TYPE_LEVEL_HIGH>, <58 IRQ_TYPE_LEVEL_HIGH>,
+                     <62 IRQ_TYPE_LEVEL_HIGH>, <63 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&saplic>;
+        #iommu-cells = <0x01>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
