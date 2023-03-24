Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C53C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CDtSOmRvQnu68M60+sUh8kk3evBRBti09ElTZypLEdE=; b=3LUVWdYxZvmHSg
	d5amvn3+L5q5trmXUv3jxr9NwXnSBducFKnv/KbG0mw7cE2Mbl4vt4SRJXvS9O6LG5GUUPUOgrP0V
	qP0VZnNtpX3GL/vIp8B/GNypRCuq32gnSLA0x9eEt0WpveB7n3QU43P3VRp6pjg8gX0Rj4udhVY0T
	cC5Qwi3wXmbeatrLR0i4hsHoY8c2yqGzNkcGNV0wm7dhmJmCQhbna7CreL886robNKSBbkqvvKRHu
	NxmgCKVX2lE1sZieiBkd30uGbAobVffk4vNVnxgTxM0Z+VaNXZeIkCqY8naRp4h15I4qF57VvsyKE
	HNNDolveLuH3+pEpUncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgIH-004JzZ-19;
	Fri, 24 Mar 2023 12:13:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgIE-004Jym-1W
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 12:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679659994; x=1711195994;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vqediUMzXqF6NjXsWDqodVWUF23Z9yjoQDiTJA0nKpw=;
  b=n7c6rSL7qBdWsATOaxCc3SVMDN1QZ3sja5fRK/jXJZ8SsSiAyeCvcIgv
   YOYPXotk3afrdLD1i6rq6edffm1ZZzfdrwrt4rvgo0OPtShIDetil9nPO
   GNg/xK97su9Rslqo2qaDCU1rh07D1xhQtoS22Q5LFJU3OJbr0zCoIPsPM
   EYX0Gs1Pn+dYokZbfg0T6jbVzed5MI2F4WzJICKa3HE6t9W6ULVo8al46
   0uYTBdhGcOu03pq9WKbSMNAKJtOLKOW8ceTCMyAqJTu9wf2xw+OAOZFDE
   TfTW5IXbuYSn1xKMW3qDIxnb2Ax+3B6eHfZFNNTfKHTj22+PugrVMdZdr
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,287,1673938800"; 
   d="scan'208";a="203263383"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Mar 2023 05:13:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 05:13:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 24 Mar 2023 05:13:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>,
	<ajones@ventanamicro.com>, <Jason@zx2c4.com>, <apatel@ventanamicro.com>,
	<heiko.stuebner@vrull.eu>, <jszhang@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>
Subject: [PATCH v1] RISC-V: convert new selectors of RISCV_ALTERNATIVE to dependencies
Date: Fri, 24 Mar 2023 12:12:41 +0000
Message-ID: <20230324121240.3594777-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=conor.dooley@microchip.com; h=from:subject; bh=vqediUMzXqF6NjXsWDqodVWUF23Z9yjoQDiTJA0nKpw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmyk7epz3t10Pa3/WadLys8Fp7RXJJ+ccKxWNW4vJkLNpUE Hlym1FHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJBMgwMlwNXGc+/8DxnRUHVu9QaO h52W9itXrZjq3bSn6XL3VKbPvCyLDA0kQtJT/o0q7lpSvtvmzz/aJV+6hPOcnPP8iCm9VMngkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_051314_573244_0489B7A5 
X-CRM114-Status: GOOD (  10.56  )
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

for-next contains two additional extensions that select
RISCV_ALTERNATIVE. RISCV_ALTERNATIVE no longer needs to be selected by
individual config options as it is now selected for !XIP_KERNEL builds
by the top level RISCV option.
These extensions rely on the alternative framework, so convert the
"select"s to "depends on"s instead.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Applies on top of my series doing the aforementioned conversion:
https://lore.kernel.org/all/20230324100538.3514663-3-conor.dooley@microchip.com/

This patch is sent on its own, because I expect the others to be applied
to fixes, as it fixes a v6.3 regression.
For this patch, I applied my other series to v6.3-rc1 and merged that
into for-next, and created this patch on top of the result.
---
 arch/riscv/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d2acd69d6e3e..a48d1ee677ec 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -402,8 +402,8 @@ config RISCV_ISA_C
 config RISCV_ISA_SVNAPOT
 	bool "SVNAPOT extension support"
 	depends on 64BIT && MMU
+	depends on RISCV_ALTERNATIVE
 	default y
-	select RISCV_ALTERNATIVE
 	help
 	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
 	  time and enable its usage.
@@ -478,8 +478,8 @@ config RISCV_ISA_ZICBOM
 
 config RISCV_ISA_ZICBOZ
 	bool "Zicboz extension support for faster zeroing of memory"
-	depends on !XIP_KERNEL && MMU
-	select RISCV_ALTERNATIVE
+	depends on MMU
+	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
