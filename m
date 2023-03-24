Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85744C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jufqXSPROOOylWR3QtmRAYI1yjlHUOpmrkvDsyq9tw=; b=20hFY2YGPDhrdk
	t7HD4dGrc15dFc89SCg+xiu460sLCFJMjvP72Gh8TTBKA1/hs65BlP0WyMCwTJdkWS4gXela5a4G2
	2ymroX59Am8rxR6JTGoZ1aggRsbsHhYuzSjwcm/wwnYMEgI6d7VptADDmzdjIAl0zDleahnEN/xoh
	FbVP3Hh4GLz1uSC9++PBWotbBUEaurF59aVUIpFFeHQ5KDXIivW7pHuG7AX9+sOPS81c5U8TpEF5v
	cq4rw8jLNg6TvvOiAnXT9I/gC2Zp8NzOfoCSejbDMY2kzhIuAqyfWtNHwbYObzQy3xcl2E0Uok9Vx
	kGLgnUamlxixPNwY53Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdjx-0041VS-2x;
	Fri, 24 Mar 2023 09:29:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdjv-0041Uu-0c
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 09:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679650179; x=1711186179;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AVss23QZpMuEARiPskn7cqME9h3VNDW9IrkiYCSbcZ8=;
  b=jYmzJQrIzFb7iOtjioUxVOMLT8UIa0oX8+7V3XxRDN2M1mBeCvehc3H+
   SyUnbTX3roo1GzyYnbGJS8aSaBdtbFFLfIiSFTGBCPYDsiLQ9yfY0yZlE
   x30IywZS68HCZYKzULYovWq0Ck+0Eda+DoeV5LhxH8F7n84o2RFZIFW++
   qs9Dhr6xKzCtl9oQBffb4uC9xxFbE5ON5JwKRVjuEiKQ2p/zy1YtV3qsD
   nxOyzTu1TGj05xVh6hPgEZOTgLYZEe0rkxst7hTdTGoyP67vdx1tg6yiv
   KCU9KefjmU2kyd+VcPzOTbKi42Pk6v7JCiluXvbxB5Sq+ac/ioLfY1MYM
   g==;
X-IronPort-AV: E=Sophos;i="5.98,287,1673938800"; 
   d="scan'208";a="206548983"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Mar 2023 02:29:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 02:29:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 24 Mar 2023 02:29:33 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1] RISC-V: align Svpbmt Kconfig help text with other extensions
Date: Fri, 24 Mar 2023 09:28:41 +0000
Message-ID: <20230324092840.3504267-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=conor.dooley@microchip.com; h=from:subject; bh=AVss23QZpMuEARiPskn7cqME9h3VNDW9IrkiYCSbcZ8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmyuW5evr9bNuy+OdXmvZnR9e6TbyTWBp6yOF0eEKisfD+C Nau2o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOZvJeR4exhnuU7Jsxlbtjqa68qcf t1g3H53bI1PE6xl/ZNvWbD3MXI8ERsxWyvl2Gfbc107Z5L2S239RPWDMt6s2dtyR9lqcuFjAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_022939_277773_F4F33719 
X-CRM114-Status: GOOD (  10.12  )
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

Other extensions only capitalise the first letter in Kconfig text
menus, and provide a short comment about the extension's meaning.
Do the same for Svpbmt.
While editing one of the lines, reformat the "spelling" of 64-bit.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2f6976418d0a..b12ab7a9d481 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -400,7 +400,7 @@ config RISCV_ISA_C
 	  If you don't know what to do here, say Y.
 
 config RISCV_ISA_SVPBMT
-	bool "SVPBMT extension support"
+	bool "Svpbmt extension support for supervisor mode page-based memory types"
 	depends on 64BIT && MMU
 	depends on RISCV_ALTERNATIVE
 	default y
@@ -413,7 +413,7 @@ config RISCV_ISA_SVPBMT
 	   that indicate the cacheability, idempotency, and ordering
 	   properties for access to that page.
 
-	   The SVPBMT extension is only available on 64Bit cpus.
+	   The Svpbmt extension is only available on 64-bit cpus.
 
 	   If you don't know what to do here, say Y.
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
