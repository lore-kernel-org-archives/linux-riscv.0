Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B7BFCC9A2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 00:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dLe+uxySjwRb63lIlY+QgZlDjnEXa2xbkdd7pGSnSIQ=; b=mq9/Fyi2iS0AcW
	j7tIDwv1nd9QPaF0Toe+ftj0FRFgP6Ba+kffiEz/2NK3HS5xOxLaBmAHrHKrQ07qtq96UEFb6iur6
	3hBhNNpuQ9uSBejRN0fX4gUdFc/sqrKyUhsrTGe6ZxeqKav3Z8StVr8uZT+wFmo62XOvMN6Vuw9k2
	UGbd6HUVcvpQa+zQ5h2J+BBf8TfiWu38RJtG5YynkjYISswZOdnMYOtn00KnKJgoee4WWcgXWLJ1L
	xOpfQlEYBy2nO3Bmdq6dcC2AMlLboz6tG3WpGUJp8/Wa6SL9q5i4j+b5RF5LiPW9w2txQrtsERZt9
	kjcM8PeXswmUa5WQFTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzl83-00000008PqE-2PIx;
	Tue, 10 Mar 2026 00:39:19 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzl81-00000008Ppp-0Bn9
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 00:39:18 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-829759ca646so2972079b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 17:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773103155; x=1773707955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASXXX0p2ZfcvRm4ZB6M2J7c/IWgAE9q2+BNtra206fc=;
        b=lvR/6IwN4YICdLIglGK4Z4nsihp8ILGhJcF9m6FGVYzl2LrXxYp4dEjxBvcuzqJjQg
         Bs8qM96VAG/pD2PzaYs2NFcYVlADrAwIDjaF67M8ruCS780M/mueqDi4aBUap5N0zj2u
         Y0ZXKtC8Mx3kwBcpdbMf0QRF9/EkzfPWpxFDHqVPRKLmZ8VTc5q+YBLrsNCDpqG6jqEi
         RbXOoZ0CY5nxXJvXm2eAxNOi9SnrwHxVz9l6+820EawwLsG8cj/WX/bwaOP30ttWrhxL
         8LlSRVRoov+thvwWasrsmNoBrlW1yLDllfN2WIJPbmciC3PoP7T91KQ75ldwl4GA+emL
         mzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773103155; x=1773707955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASXXX0p2ZfcvRm4ZB6M2J7c/IWgAE9q2+BNtra206fc=;
        b=q47jmGHTOEBjgh1qPL0MlC24nDLWc6LG4X6jF0n8jjhrelRYBveOjWiu6cTRWS8QHX
         JIcYMg5LVwEkAOOUuZP6201ltv6l6VPIqjmPPk2ezHcYH1dmD1LIcFhi84+c0S+uZoE8
         XL4qSW/zA2ymPvVB/8qzn5q9AsQl3yIhqJmUjZCy/c+LPU2vFEHFPBREdySzDiIhz0Rg
         u5cWFeglcPibPk/Gc6TLF0sAn7tmhB5Ubk+okK2ZCiYCN1Wrrg5uC5ldSUTQE+n/x9q5
         JfSDDUGWC8aS4+T2zL0x9h4f987kIwZQssqyOHQQMYZh9sefG8QIJgxPteyb5uFTctQE
         vRxw==
X-Forwarded-Encrypted: i=1; AJvYcCW6sgCRQG61IVp/4lf79vvLWVbmUFmqtQn1DWHSMurwpIp/O5dszYb1EqFGAoWYHj2mw2Eiaxqnc3G3lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIo17ydnCa3YYmKJNKvgmPnzermw3NaEMeQRIJt+a2zAaGjTb6
	vhdC9tE4WuzcX0Ddd+Bts+YVTGNBXcLp5bvLUKQJe4J68TOv3OA809Py
X-Gm-Gg: ATEYQzwYN6RlwbJ1fjBPkXmoxpEnPb2abtSFn694HIpaFUl/q/KeXIDu1tEJGhMfPBM
	l3nFV1mpWDKn3WO+i+Ssv0fPX2FrDZbb0wpvD+CSRb6HxRSCId+4cxEtjjnlEuPHueF0pcK6RPt
	iy5zt004FcvJNhrsK1YF2imQEHSioLevsRuVV3SqFotIgzyJyOipmUOwoESuZSSauan+aVqLjow
	txKIrstLancKK8iBd6QkTmUQnXqvg3b4WSOVnG79hQA2ZkOhlXwmuYlufCn37qUF9E/gSsrqxeK
	PPZq9D0OpC3ju12dkrgqz3GDKucuVCJ0UfhHoek/tzxLEXaxfc+JRNoD3Nm56U0XVOYwZdmdFb6
	hkF11NY6AMwGuEgslDMDc2PHQ5oxFrFKmpCQJYkqMqtcel2+zOFnnynX9jDKriA1Zr2K7+TK9KF
	Qftx+cRtBDMdK3SYJ7nBxyXQV1PQzphFaWw1wExrOEsZu5yeRqrH2nyzRBZnCA7BxJF8dgyDELs
	8B/Mx4=
X-Received: by 2002:a05:6a00:179f:b0:829:7a62:5f with SMTP id d2e1a72fcca58-829a2db4d91mr10719774b3a.9.1773103155495;
        Mon, 09 Mar 2026 17:39:15 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46369d3sm11381583b3a.2.2026.03.09.17.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:39:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: devicetree@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU
Date: Tue, 10 Mar 2026 10:38:49 +1000
Message-ID: <20260310003850.3837030-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_173917_089646_9A6D3539 
X-CRM114-Status: GOOD (  16.07  )
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

Extend the binding to cover details specific to the Tenstorrent RISC-V
IOMMU. In particular, a second register range is added which contains
M-privileged registers, e.g., PMAs and PMPs.

The RISC-V spec S-privileged registers remain in the first register
range and are compatible with "riscv,iommu" so the Linux driver does not
notice any difference, but the binding will be used by OpenSBI and
potentially other M-mode software.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Hi,

This binding will be used in a Tenstorrent SoC platform device-tree that
we plan to get upstream some time, but I wanted to ask for any comments
here before the OpenSBI platform code that uses it is merged.

Thanks,
Nick
---
 .../bindings/iommu/riscv,iommu.yaml           | 67 +++++++++++++++++--
 1 file changed, 60 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
index d4838c3b3741..3c680e53af64 100644
--- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
@@ -32,22 +32,40 @@ properties:
   # should be specified along with 'reg' property providing MMIO location.
   compatible:
     oneOf:
-      - items:
+      - description: Platform (non-PCIe) IOMMU implementations
+        items:
           - enum:
               - qemu,riscv-iommu
           - const: riscv,iommu
-      - items:
+      - description: PCIe IOMMU implementations
+        items:
           - enum:
               - pci1efd,edf1
           - const: riscv,pci-iommu
+      - description: Tenstorrent IOMMUs implementing "riscv,iommu"
+        items:
+          - enum:
+              - tenstorrent,riscv-iommu
+          - const: riscv,iommu
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
     description:
-      For non-PCI devices this represents base address and size of for the
-      IOMMU memory mapped registers interface.
-      For PCI IOMMU hardware implementation this should represent an address
-      of the IOMMU, as defined in the PCI Bus Binding reference.
+      For non-PCI devices the first item represents base address and size of
+      for the IOMMU memory mapped registers interface.
+      For PCI IOMMU hardware implementation the first item should represent
+      an address of the IOMMU, as defined in the PCI Bus Binding reference.
+
+  reg-names:
+    items:
+      - const: base
+        description:
+          Minimum 4KiB region beginning with RISC-V IOMMU MMRs.
+      - const: machine
+        description:
+          Optional region containing platform specific MMRs for machine-mode
+          configuration, for example PMA and PMP registers.
 
   '#iommu-cells':
     const: 1
@@ -75,6 +93,31 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - tenstorrent,riscv-iommu
+    then:
+      properties:
+        reg:
+          items:
+            - description: IOMMU base registers
+            - description: Tenstorrent IOMMU machine mode registers.
+        reg-names:
+          items:
+            - const: base
+            - const: machine
+              description:
+                Region containing platform specific MMRs for machine-mode
+                configuration, such as PMA and PMP registers.
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 examples:
   - |+
     /* Example 1 (IOMMU device with wired interrupts) */
@@ -145,3 +188,13 @@ examples:
             };
         };
     };
+
+  - |+
+    /* Example 5 (Tenstorrent IOMMU device with MSIs) */
+    iommu5: iommu@d2020000 {
+        compatible = "tenstorrent,riscv-iommu", "riscv,iommu";
+        reg = <0x0 0xd2020000 0x0 0x10000 0x0 0xaa000000 0x0 0x10000>;
+        reg-names = "base", "machine";
+        msi-parent = <&imsics_smode>;
+        #iommu-cells = <1>;
+    };
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
