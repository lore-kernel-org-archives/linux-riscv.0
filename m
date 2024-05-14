Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB5EC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLAzR7y2bm98siiur5Jnm6v+8SCQscWOdL6DVtyp9fM=; b=4WG/5c3RotHm0m
	egS/bVODwlB4biDoR86KU5jsUUPb1OyEZQgJrVYVbTx61qvbnNDbceW4cxkvQE6V7n5JJrqg/ENYn
	iTj9hcJ6pZv9pnNFUEVAq8J+4jC5DJ+WG27McGlJVVWPNEiXzRTowVDqDvTIT3j8jkj0sJOldB+pQ
	+1euYBh8qav2q53FHnMJEmMH2Pyw7+6fuYpAcG4anjbhlu9PQwxHdS3t+hMiEaWLqdFL2uBc7d0YR
	aKCVcO6TdCJeb8YeEORWP3dn4OJrwdmFtlBasy7kcRs1bbsIjefiK3prhMF2K9BJQce56IcRyBEk1
	l2I2OMyIQHKcnzbi57Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pfS-0000000FcWP-28jW;
	Tue, 14 May 2024 10:45:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pfP-0000000FcUe-0O9O
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 10:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715683555; x=1747219555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yHGgknwXW0O8OB9OmVvJHciQo5Z0+ha+LxvoCItjQ/g=;
  b=Immv4oQEjLcM01cOMrnNMPgFbJ1fE5wrzioBHWX1XCxAnPP6aGxHwC+p
   p7kVn4ESEqoXYBtXEg/vhDNcoS5MvUBhu3gMaRsCaog8vL2VR1ssRGnd4
   jDmgzRqP6jcAhGQnNQrXU1KkkmiFGDk8yvNmoACCUQ0HwI+Drpn+Dxe/z
   ro7RCL14nkXexBUjj73XUG9zHQIgwMyUIpk76C4KColIOywN4HHraiJ2B
   m0cnEIOsYlRza+AP3hy96XPfbmqUfHJBFbW6abIklEBEkZNr0wXkG84Io
   ITR0/x8CyFkxNtvmwcYDfiyB2EoRDGkIjaDIV7hmWLZmRtEjBmnygHxrw
   g==;
X-CSE-ConnectionGUID: N9mxCvhER5eXal035+dGRg==
X-CSE-MsgGUID: xjBThKMUSH2OGeJyx9odVg==
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="24661010"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 May 2024 03:45:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:44:56 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 03:44:54 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>,
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v2 1/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Date: Tue, 14 May 2024 11:45:06 +0100
Message-ID: <20240514104508.938448-2-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
References: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_034555_185125_5AAA405C 
X-CRM114-Status: UNSURE (   9.44  )
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

The PolarFire SoC SPI "hard" controller supports eight CS lines, out of
which only one CS line is physically wired. The default value of
'num-cs' was never set and it did not didn't impose a maximum value.

To reflect this hardware limitation in the device tree, the binding
enforces that the 'num-cs' property cannot exceed 1 unless additional
CS lines are explicitly defined using GPIO descriptors.

Fixes: 2da187304e55 ("spi: add bindings for microchip mpfs spi")
Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 .../bindings/spi/microchip,mpfs-spi.yaml      | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
index 74a817cc7d94..ffa8d1b48f8b 100644
--- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -13,9 +13,6 @@ description:
 maintainers:
   - Conor Dooley <conor.dooley@microchip.com>
 
-allOf:
-  - $ref: spi-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -43,6 +40,32 @@ required:
   - interrupts
   - clocks
 
+allOf:
+  - $ref: spi-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,mpfs-spi
+    then:
+      properties:
+        num-cs:
+          default: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,mpfs-spi
+      not:
+        required:
+          - cs-gpios
+    then:
+      properties:
+        num-cs:
+          maximum: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
