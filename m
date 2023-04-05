Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB543C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Loph3fPKKvA55VGt+xd+g89q0zBAtLec6abQrmRLcQ=; b=Fua8eHp7CciRT5
	wRjEea+Mf3YevdV/YlAvysK/8M3jlyVKlqLQx1rMtr7uLGefkuNxSeSV5nEmKmMOTGO3RSHhSVB8U
	5IgJwpDYhA2EVkpSajPoWuWJq9D2WSg5FTavtIKYeWLidxtAvlElR87wgnyl6X+cKuY+N1bZzHkf/
	Oz4EdCOc8pzvYkk8+DV1JuEQ4uJTfVJfDpR36MG83mjNK1/7HxmyQiGL55vXFE+BD9/CBqi8G3Mse
	a2FFLlboxfQxXVuMLPbsJxh71DgDdM7+7YISbM2wgIBHIhUX6ReC+bfNX5deAHyJ0b9+K/2KpIt2E
	OOHcPpx7KcBXHqyhxxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0Gu-004543-1t;
	Wed, 05 Apr 2023 10:21:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0Gr-00453Y-2p
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 10:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680690102; x=1712226102;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=byvjw5DT3z13axDGyDhMYvIPDHulKaB13GUHx0xoYp0=;
  b=F6ddXSWNEztTHkkD+85rvB7MdsslLoq/DXxXnSydwAelXa1lK8SmnPBV
   u3iE3CnMPJPKLWCzgiKXGMztHjQ9PjkD+w55ogqXPbWFTT+eEonr4lYJh
   5nzA0bM5SMi4eNN5Zwbdii/v/g4HFEK5j7v/ts9QnKV5AVoebqh9x8A//
   7mzm4qd+1RsPmkvADJbBl+P2e9J+JxKQQYZJmzxmzl7ASdGsJXZ9JNftR
   tkEUQY1e7ncBxnf15QCgT0K3s7EHFvkQrkudlAsOrqC5zzzDWlejRQrew
   enpXSJcBmvpqzV50Fq5MLBcG9msvxFGV0fQaST+SFqdWv5L4z6wYJ5RRA
   g==;
X-IronPort-AV: E=Sophos;i="5.98,319,1673938800"; 
   d="scan'208";a="208249257"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2023 03:21:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 03:21:39 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 5 Apr 2023 03:21:39 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2] RISC-V: align ISA extension Kconfig help text with each other
Date: Wed, 5 Apr 2023 11:21:10 +0100
Message-ID: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3205; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=byvjw5DT3z13axDGyDhMYvIPDHulKaB13GUHx0xoYp0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCm63pNjUo7Un/bN3BhZ4tpbHSgcf609f2GSQEusjpVs9tv9 d3g6SlkYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJGdMxj+Solr6T9vmOIg65z1h3P9g8 qIzteMsYtvz/SavDHdcP4eFYb/Acm8qZ4VJfcOTrp4WGjn401nDjqnvavvO2q4Xbt+TsVnFgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_032141_918915_B0BC50F5 
X-CRM114-Status: GOOD (  13.53  )
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

Other extensions only capitalise the first letter in the text visible
in Kconfig menus, and provide a short comment about the extension's
meaning. Do the same for Svnapot & Svpbmt.

The precedent for capitalisation in the Kconfig text was set by Zicbom
& sorta followed for Zicboz. The RVI styling used for multi-letter
extensions only capitalises the first letter, so do the same here.
If nothing else, my OCD likes it when the extensions follow a consistent
pattern.

While editing one of the lines, reformat the "spelling" of 64-bit.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- do the same for Svnapot too
- s/ZICBOZ/Zicboz
---
 arch/riscv/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cc02eb9eee1f..92e8b4d908b6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -400,31 +400,31 @@ config RISCV_ISA_C
 	  If you don't know what to do here, say Y.
 
 config RISCV_ISA_SVNAPOT
-	bool "SVNAPOT extension support"
+	bool "Svnapot extension support for supervisor mode NAPOT pages"
 	depends on 64BIT && MMU
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
+	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
 	  time and enable its usage.
 
-	  The SVNAPOT extension is used to mark contiguous PTEs as a range
+	  The Svnapot extension is used to mark contiguous PTEs as a range
 	  of contiguous virtual-to-physical translations for a naturally
 	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
 	  size. When HUGETLBFS is also selected this option unconditionally
 	  allocates some memory for each NAPOT page size supported by the kernel.
 	  When optimizing for low memory consumption and for platforms without
-	  the SVNAPOT extension, it may be better to say N here.
+	  the Svnapot extension, it may be better to say N here.
 
 	  If you don't know what to do here, say Y.
 
 config RISCV_ISA_SVPBMT
-	bool "SVPBMT extension support"
+	bool "Svpbmt extension support for supervisor mode page-based memory types"
 	depends on 64BIT && MMU
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	   Adds support to dynamically detect the presence of the SVPBMT
+	   Adds support to dynamically detect the presence of the Svpbmt
 	   ISA-extension (Supervisor-mode: page-based memory types) and
 	   enable its usage.
 
@@ -432,7 +432,7 @@ config RISCV_ISA_SVPBMT
 	   that indicate the cacheability, idempotency, and ordering
 	   properties for access to that page.
 
-	   The SVPBMT extension is only available on 64Bit cpus.
+	   The Svpbmt extension is only available on 64-bit cpus.
 
 	   If you don't know what to do here, say Y.
 
@@ -482,7 +482,7 @@ config RISCV_ISA_ZICBOZ
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
+	   Enable the use of the Zicboz extension (cbo.zero instruction)
 	   when available.
 
 	   The Zicboz extension is used for faster zeroing of memory.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
