Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B187E91299
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MH4gZbjuytrpGQ4ZF0T94Xr9HFpv0MFw2XdQa0Kdzt0=; b=SMduAmaEe1W1F2
	N3VXbHawtVYYgpXt9W5Ut2Fwye7eXu4RHiPFjl/begoUgOlF7TRN1hXD6AWJrxpEpHRAy7FkdgHbL
	FkT6J6oAyCeLpc+EmEvLJAqKgJbo+yPvEVR6wM8Ql6IlLwAZ9VZZiYeZh0uGJYSkgzQWGaiq15g72
	1rcjVX/6Cgpy8OjYWzYnwHWXWskWYnKYlN/JRqc7BGnV/J35NDuroOx8MDeVpuAuO1DeL1DTS3Ozt
	J9wwoap6yWKA5spSgTaEjtCF6bHfEME04HjrWikcOGAiW3JEiqGv92sCmnbnAxwujMk5NJBF4SM/M
	0M8ActOZuv9NCumA9wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvOR-00000009fVr-1AAP;
	Thu, 05 Feb 2026 09:11:19 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvOL-00000009fQv-1j9k
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 09:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770282650;
	bh=uWWFXFPfXVhg+djrpkATQabG3QKSlZh56Yy0bCQP7pM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NfI1nNUf5Qp9AeMytaVtQl2hiWVYD/G3mUWwU8u4UuxCIhOFEKW5H4rv8cYdkikRD
	 oybzPwmYvMeL9MD7HFM3M/4eL645w54yYcWY0ugyRRbLfXev8jFfac4+tWSEdUWhNW
	 noLu1Lc6siJP5SZ5pURc5Jab1LvBVLDBCkQ3RLX4=
X-QQ-mid: zesmtpgz8t1770282648tc7637bb9
X-QQ-Originating-IP: Su6s1AZY2gOug1181EX0JSotZR7d0+gQDZL6tipWaqQ=
Received: from SurfaceBook2-B.localdomain ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Feb 2026 17:10:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5068789326272388227
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
Subject: [PATCH v4 3/7] dt-bindings: iommu: Add spacemit/t100 features
Date: Thu,  5 Feb 2026 17:10:43 +0800
Message-ID: <B1AEE717CF03B1BB+22fe4be0d3c8d2c6b4c5d3c19736c937cbed3c0d.1770281596.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770281596.git.lv.zheng@linux.spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770281596.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OZ7HbAk7YCRiUaaHyVl/3Chlz5kvdSCETGD5uH4M74ZCiq7rVY3niF6Q
	GJz/jHlX9NKv9UHaHTyhBjANIw/ny9edP04sO3mrCV2PtVk2D1Xv3fRefVVO5cWzl6Kgw2u
	zOnLMYZ1XbqYwltxuovrWeWe4CaM1vUZrZHR16z03AWFe2xVSWXHvvy0gw6SQtfOAYa7TIt
	Z2KxmWVgkwmuQy5xyHhhbYf3a1wref6AIxDEXlUo2k3kRgtYHB86nP3oVX6lHv34iPtLZJi
	Fz6DTfELzowR9cE3Yz6vdRAW8MPV7gJoiKbGzxQbB8mD6Wa9q88RS9DwSdn5LmHaImne4k6
	/a8XFHGZKl7Vlb9eTrsA350dDl/fupPmDQbk2sjq8nqD7WaJSkex1ZuxXhG2NdG9PwTyfc+
	URWELonR9iEqAMhOaCUWg5I5U79zCAHPq5e6VRufXPpDvvVGrYvNR0UM81bT5OCboBIsnL5
	9yUfbCzQp6UlEXEpByT/Ok8IzC3f08XEvdDUqQKJ5tL2SMr6LFSpzmPs1jpCENMCkUGzNFD
	ny3GTWGZyPqaRspgCyomYfTAo7wYswpwm0fsjJE6vQZLzUJDkJxPzJL4ohReHUQKkjbiaJF
	d57ALDG7Y5E48Fezj1RL4wTuT/Ep15taP3ss+NYZsMwQwuuShQvouzd9PsYRPtT2AxrEJg6
	GM0oZpJyqID0ifkLyR8G03cNisospD/5mJMIKSdK1eJOATTxnf9fHXKZsmeKv8RI7706GSn
	yq0R0ncxeOZBWVK4qZ232cu4BFe8Yuf7OZtuNY8h2O8CGoyLLEEUK+oMaTm5xSB5JbKFO8N
	GMx6FojjiPeIYb5BzVyNoP532W8yFc1HriRf5KbX/fGpTRGiK3RX7E/OoUnmbF4egj59FS3
	1iQNm/KnyvxsTvPPRpXOQoVl/KzZf3Nx3eENBeSwlN4F6BCtQ5IqPOpILI46Mt8ibCC/S/2
	EEyy9Z1FK7euaxWmuaJ71xUX/5gYDElYkAeKdcIfYyerItLrBDcLgCtqLbmQVcQUXvaGoJX
	9LTm/suK1N1qgCM7wVq2PiSE25avvBDmHLgFEJPjnYYp1Le42i
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_011115_565125_9C068227 
X-CRM114-Status: GOOD (  10.93  )
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
 .../bindings/iommu/riscv,iommu.yaml           | 53 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
index d4838c3b3741..67d226a1a90d 100644
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
@@ -57,11 +63,21 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 4
+    maxItems: 68
     description:
       Wired interrupt vectors available for RISC-V IOMMU to notify the
       RISC-V HARTS. The cause to interrupt vector is software defined
-      using IVEC IOMMU register.
+      using ICVEC IOMMU register. For WSI only mode, the number of the
+      interrupt vectors should be 1 while for MSI possible mode, the
+      maximum of the interrupt vectors should be 4 with the cause indexed
+      as "CIV=0, FIV=1, PIV=2, PMIV=3".
+      SpacemiT distributed IOMMU includes additional interrupts for
+      IOATCs. Each IOATC exposes PMIV wired vector as standalone
+      interrupt and the maximum number of IOATCs can be up to 64. Thus for
+      WSI only mode, the maximum number of the interrupt vectors should be
+      65 while for MSI possible mode, the maximum number of the interrupt
+      vectors should be 68 with the cause indexed as "IOATS CIV=0,
+      IOATS FIV=1, IOATS PIV=2, IOATS PMIV=3, IOATC0..n PMIV=4..4+n".
 
   msi-parent: true
 
@@ -75,6 +91,18 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: spacemit,riscv-iommu
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+
 examples:
   - |+
     /* Example 1 (IOMMU device with wired interrupts) */
@@ -145,3 +173,24 @@ examples:
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
+        interrupts = <58 IRQ_TYPE_LEVEL_HIGH>,
+                     <62 IRQ_TYPE_LEVEL_HIGH>, <63 IRQ_TYPE_LEVEL_HIGH>,
+                     <62 IRQ_TYPE_LEVEL_HIGH>, <63 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&saplic>;
+        #iommu-cells = <0x01>;
+    };
+
+    /* Device with four IOMMU device IDs */
+    master2 {
+        #iommu-cells = <1>;
+        iommus = <&iommu4 0xc0010>, <&iommu4 0xc0011>,
+                 <&iommu4 0xc0012>, <&iommu4 0xc0013>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
